

pragma solidity ^0.8.0;// SPDX-License-Identifier: MIT

contract StudentPortfolio {

    // Struct to represent a student's portfolio
    struct Portfolio {
        string name;
        string description;
        string[] achievements;
        string[] skills;
        address owner;
    }

    // Mapping of student addresses to their portfolios
    mapping (address => Portfolio) public portfolios;

    // Function to create a new portfolio
    function createPortfolio(string memory _name, string memory _description) public {
        require(bytes(_name).length > 0, "Name cannot be empty");
        require(bytes(_description).length > 0, "Description cannot be empty");

        // Create a new portfolio
        portfolios[msg.sender] = Portfolio(_name, _description, new string[](0), new string[](0), msg.sender);
    }

    // Function to add an achievement to a portfolio
    function addAchievement(string memory _achievement) public {
        require(bytes(_achievement).length > 0, "Achievement cannot be empty");

        // Add the achievement to the portfolio
        portfolios[msg.sender].achievements.push(_achievement);
    }

    // Function to add a skill to a portfolio
    function addSkill(string memory _skill) public {
        require(bytes(_skill).length > 0, "Skill cannot be empty");

        // Add the skill to the portfolio
        portfolios[msg.sender].skills.push(_skill);
    }

    // Function to get a student's portfolio
    function getPortfolio(address _student) public view returns (Portfolio memory) {
        return portfolios[_student];
    }
}
