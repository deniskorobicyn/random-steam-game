export default class Games extends React.Component {
  constructor( props ){
    super( props );
  }

  render(){
    if(!this.props.games.length){
      return (<div> No games found. Please load you games from steam or create some.</div>)
    }
    let games = this.props.games.map(game => <Game name={ game.name } full_image_url={ game.full_image_url } />)
    return (
      <div className="game-list">{ games }</div>
    );
  }
}
