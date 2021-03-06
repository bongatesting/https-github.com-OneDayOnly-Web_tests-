Feature: Bot Feature
  @TEST:Bots
  @SCENARIO:Bot_test
  @URGENCY:High

  @Scenario:Adding_bots_and_claiming_bot_chats
  Scenario: I want to add a Bot, initiate a chat and claim the bot chat
	Given I have no Bots added
	Then I Add the Bot
	Then I Activate the Bot
	Then I initiate a chat and claim the bot chat

  @Scenario:Removing_a_bot
  Scenario: I want to try to remove a Bot set as a Welcome Assistant
	Given The bot is still active
	Then I try removing the bot

  @Scenario:Deactivating_and_deleting_a_bot
  Scenario: I want to deactivate and delete a Bot
	Given The bot is active
	Then I deactivate the Bot
	Then I delete the Bot