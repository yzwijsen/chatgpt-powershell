# 🤖 ChatGPT PowerShell Scripts 🚀

[![GitHub license](https://img.shields.io/github/license/yzwijsen/chatgpt-powershell)](https://github.com/yzwijsen/chatgpt-powershell/blob/main/LICENSE)

This repository contains two PowerShell scripts that allow you to interact with OpenAI's ChatGPT 🧠:

1. **ChatGPT-Conversation.ps1**: Engage in a conversational manner with ChatGPT using a command-line interface.
2. **ChatGPT-One-Shot.ps1**: Provide a rough email draft or message and receive a professionally written response in three different levels of formality.

Both scripts serve as simple examples on how to use ChatGPT's API with PowerShell.

## ⚙️ Requirements

- PowerShell
- An API key for OpenAI's API

## 🛠️ Setup

1. Clone or download this repository to your local machine.
2. Replace `<your API key>` in both scripts with your OpenAI API key 🔑.

## 🚀 Usage

### ChatGPT-Conversation.ps1

1. Open PowerShell and navigate to the folder containing the script 📁.
2. Execute the script: `.\ChatGPT-Conversation.ps1` 🖥️.
3. You'll see a welcome message and a prompt to enter your question or command 🎤.
4. Type your question or command and press Enter ⌨️.
5. The AI will respond with its output 💬.
6. To exit the script, type `exit` and press Enter 🚪.
7. To reset the conversation and start a new one, type `reset` and press Enter 🔄.

### ChatGPT-One-Shot.ps1

1. Open PowerShell and navigate to the folder containing the script 📁.
2. Execute the script: `.\ChatGPT-One-Shot.ps1` 🖥️.
3. Provide a rough email draft or message when prompted 📝.
4. The AI will respond with three separate professionally written answers ranging from informal, formal, to business formal 💬.
5. Press Enter to exit the script 🚪.

## 📖 Examples

**ChatGPT-Conversation.ps1**
```plaintext
######################
# ChatGPT Powershell #
######################
Enter your prompt to continue. (type 'exit' to quit or 'reset' to start a new chat)

You: What is the capital of France?
AI: The capital of France is Paris.
```

**ChatGPT-One-Shot.ps1**
```plaintext
Rough email draft or message: Can we meet tomorrow at 3pm to discuss the project?

Informal: Sure, let's meet tomorrow at 3pm to talk about the project! 😊
Formal: Yes, I'd be happy to meet with you tomorrow at 3pm to discuss the project in detail.
Business Formal: Dear [Recipient], I am writing to confirm our meeting tomorrow at 3:00 PM to discuss the ongoing project. I look forward to our productive conversation. Best regards, [Your Name]
```

## 📝 Notes
The scripts initialize the AI with a default system message. You can change this message to set a different context for the AI by modifying the $AiSystemMessage variable.
ChatGPT-Conversation.ps1 will keep track of the conversation history, allowing the AI to provide context-aware answers.