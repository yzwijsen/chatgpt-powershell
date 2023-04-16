# 🤖 ChatGPT Powershell 🚀

[![GitHub license](https://img.shields.io/github/license/yzwijsen/chatgpt-powershell)](https://github.com/yzwijsen/chatgpt-powershell/blob/main/LICENSE)

This is a simple PowerShell script that allows you to interact with OpenAI's ChatGPT 🧠 in a conversational manner. The script provides a command-line interface for users to ask questions or provide prompts, and it will return ChatGPT's response.
It serves as a simple example on how to use chatGPT's api with powershell.

## ⚙️ Requirements

- PowerShell
- An API key for OpenAI's API

## 🛠️ Setup

1. Replace `<your API key>` in the script with your OpenAI API key 🔑.
2. Save the script as `ChatGPT.ps1` or a name of your choice.

## 🚀 Usage

1. Open PowerShell and navigate to the folder containing the script 📁.
2. Execute the script: `.\ChatGPT.ps1` 🖥️.
3. You'll see a welcome message and a prompt to enter your question or command 🎤.
4. Type your question or command and press Enter ⌨️.
5. The AI will respond with its output 💬.
6. To exit the script, type `exit` and press Enter 🚪.
7. To reset the conversation and start a new one, type `reset` and press Enter 🔄.

## 📖 Example

```plaintext
######################
# ChatGPT Powershell #
######################
Enter your prompt to continue. (type 'exit' to quit or 'reset' to start a new chat)

You: What is the capital of France?
AI: The capital of France is Paris.
```

## 📝 Notes

- The script initializes the AI with a default system message: "You are a helpful assistant".
- You can change this message to set a different context for the AI by modifying the `$AiSystemMessage` variable.
- The script will keep track of the conversation history, so the AI can provide context-aware answers.