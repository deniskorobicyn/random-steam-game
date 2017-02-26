class @Game extends React.Component
  @propTypes =
    name: React.PropTypes.string
    image: React.PropTypes.string

  render: ->
    `<div>
      <div>Name: {this.props.name}</div>
      <div>Image: {this.props.image}</div>
    </div>`
