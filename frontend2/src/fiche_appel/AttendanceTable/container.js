import React, { Component } from "react";
import Presentation from "./presentation";
import { IV_ECEA } from "../../studentsList";
class Container extends Component {
  constructor() {
    super();
    this.state = {
      secA: IV_ECEA
    };
  }

  handleispresentsecA = (regno, boolen) => {
    console.log(regno, boolen);
    let secA = this.state.secA;
    if (boolen) {
      secA.forEach((student, index) => {
        if (student.RegNo === regno) {
          secA[index].isPresent = boolen;
        }
      });
    } else {
      secA.forEach((student, index) => {
        if (student.RegNo === regno) {
          secA[index].isPresent = false;
        }
      });
    }
    this.setState({
      secA: secA
    });
  };

  handleispresentsecB = (regno, boolen) => {
    console.log(regno, boolen);
    let secB = this.state.secB;
    if (boolen) {
      secB.forEach((student, index) => {
        if (student.RegNo === regno) {
          secB[index].isPresent = boolen;
        }
      });
    } else {
      secB.forEach((student, index) => {
        if (student.RegNo === regno) {
          secB[index].isPresent = false;
        }
      });
    }
    this.setState({
      secB: secB
    });
  };

  handleispresentsecC = (regno, boolen) => {
    console.log(regno, boolen);
    let secC = this.state.secC;
    if (boolen) {
      secC.forEach((student, index) => {
        if (student.RegNo === regno) {
          secC[index].isPresent = boolen;
        }
      });
    } else {
      secC.forEach((student, index) => {
        if (student.RegNo === regno) {
          secC[index].isPresent = false;
        }
      });
    }
    this.setState({
      secC: secC
    });
  };

  render() {
    return (
      <div>
        <Presentation
          handleispresentsecC={this.handleispresentsecC}
          handleispresentsecB={this.handleispresentsecB}
          handleispresentsecA={this.handleispresentsecA}
        />
      </div>
    );
  }
}

export default Container;
