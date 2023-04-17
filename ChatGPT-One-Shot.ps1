param (
    # User input / prompt to be sent to ChatGPT. Mandatory.
    [Parameter(Mandatory = $true, ValueFromPipeline = $true)]
    [string]$UserInput = "Bram, send me those sales reports asap",
    # The AI system message. This sets the context for the AI. Optional. ChatGPT default value: "You are a helpful assistant"
    [Parameter(Mandatory = $false, ValueFromPipeline = $true)]
    [string]$AiSystemMessage = "You are an email writing assistant. I will provide you with a rough draft of an email or some general message that I want to convey and you will respond with a clean, professionally writen email. Please provide 3 seperate answers ranging from informal, formal to business formal. All answers must be in the same language as the provided input."
)

# Define API key and endpoint
$ApiKey = "<your API key>"
$ApiEndpoint = "https://api.openai.com/v1/chat/completions"

# Function to send a message to ChatGPT
function Invoke-ChatGPT ($message) {
    # List of Hashtables that will hold the system message and user message.
    [System.Collections.Generic.List[Hashtable]]$messages = @()

    # Sets the initial system message
    $messages.Add(@{"role" = "system"; "content" = $AiSystemMessage}) | Out-Null

    # Add the user input
    $messages.Add(@{"role"="user"; "content"=$message})

    # Set the request headers
    $headers = @{
    "Content-Type" = "application/json"
    "Authorization" = "Bearer $ApiKey"
    }   

    # Set the request body
    $requestBody = @{
        "model" = "gpt-3.5-turbo"
        "messages" = $messages
        "max_tokens" = 1000
        "temperature" = 0.7
    }

    # Send the request
    $response = Invoke-RestMethod -Method POST -Uri $ApiEndpoint -Headers $headers -Body (ConvertTo-Json $requestBody)

    # Return the message content
    return $response.choices[0].message.content
}

# Query ChatGPT
$AiResponse = Invoke-ChatGPT $UserInput

# Show response
return $AiResponse