<#
This script will ask the user for a rough draft or message and will respond with 3 well written, professional versions,  powered by ChatGPT.
The 3 emails will be phrased differently with one being informal, one formal and the last one business formal.
#>

# Define API key and endpoint
$ApiKey = "<your API key>"
$ApiEndpoint = "https://api.openai.com/v1/chat/completions"

<#
System message.
You can use this to give the AI instructions on what to do, how to act or how to respond to future prompts.
Default value for ChatGPT = "You are a helpful assistant."
#>
$AiSystemMessage = "You are an email writing assistant. I will provide you with a rough draft of an email or some general message that I want to convey and you will respond with a clean, professionally writen email. Please provide 3 seperate answers ranging from informal, formal to business formal. All answers must be in the same language as the provided input."

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
        "max_tokens" = 2000 # Max amount of tokens the AI will respond with
        "temperature" = 0.5 # lower is more coherent and conservative, higher is more creative and diverse.
    }

    # Send the request
    $response = Invoke-RestMethod -Method POST -Uri $ApiEndpoint -Headers $headers -Body (ConvertTo-Json $requestBody)

    # Return the message content
    return $response.choices[0].message.content
}

# Get user input
$userInput = Read-Host "Rough email draft or message"

# Query ChatGPT
$AiResponse = Invoke-ChatGPT $UserInput

# Show response
write-output $AiResponse

Read-Host "Press enter to Exit..."