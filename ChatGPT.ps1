# Define API key and endpoint
$ApiKey = "<your API key>"
$ApiEndpoint = "https://api.openai.com/v1/chat/completions"

# Define the system message. This sets the context for the AI.
$AiSystemMessage = "You are a helpful assistant" # Default: "You are a helpful assistant"

[System.Collections.Generic.List[Hashtable]]$MessageHistory = @()  # Message history

# Sets the initial system message
Function Initialize-MessageHistory ($message){
    $script:messages.Clear()
    $script:messages.Add(@{"role" = "system"; "content" = $message}) | Out-Null
}

# Function to send a message to ChatGPT
function Invoke-ChatGPT ($MessageHistory) {
    # Set the request headers
    $headers = @{
    "Content-Type" = "application/json"
    "Authorization" = "Bearer $ApiKey"
    }   

    # Set the request body
    $requestBody = @{
        "model" = "gpt-3.5-turbo"
        "messages" = $MessageHistory
        "max_tokens" = 1000
        "temperature" = 0.7
    }

    # Send the request
    $response = Invoke-RestMethod -Method POST -Uri $ApiEndpoint -Headers $headers -Body (ConvertTo-Json $requestBody)

    # Return the message content
    return $response.choices[0].message.content
}

# Main loop

Clear-Host
Write-Host "######################`n# ChatGPT Powershell #`n######################`n`nEnter your prompt to continue. (type 'exit' to quit or 'reset' to start a new chat)" -ForegroundColor Yellow

Initialize-MessageHistory $AiSystemMessage

while ($true) {
    # Capture user input
    $userMessage = Read-Host "`nYou"

    # Check if user wants to exit or reset
    if ($userMessage -eq "exit") {
        break
    }
    if ($userMessage -eq "reset") {
        # Reset the message history so we can start with a clean slate
        Initialize-MessageHistory $AiSystemMessage

        Write-Host "Messages reset." -ForegroundColor Yellow
        continue
    }

    # Add new user prompt to list of messages
    $MessageHistory.Add(@{"role"="user"; "content"=$userMessage})

    # Query ChatGPT
    $aiResponse = Invoke-ChatGPT $MessageHistory

    # Show response
    Write-Host "AI: $aiResponse" -ForegroundColor Yellow

    # Add ChatGPT response to list of messages
    $MessageHistory.Add(@{"role"="assistant"; "content"=$aiResponse})
}
