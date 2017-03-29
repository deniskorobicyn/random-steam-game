var propTypes = {
   name: React.PropTypes.string
};

export default class Game extends React.Component {
  constructor( props ){
    super( props );
    this.state = {
      name: React.PropTypes.string
    };
  }

  render(){
    return (
      <div>
        <div>{this.props.name}</div>
      </div>
    );
  }
}

Game.propTypes = propTypes;