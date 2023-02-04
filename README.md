# Module-Three

## Setup

```
brew install overmind tmux
bundle install
yarn install
```

## Running

```
overmind s -f Procfile.dev
```

## Debugging

```
Add `debugger` somewhere in your code (byebug new replacement)
In a terminal, type `overmind connect web` and now you can start debugging.
To end a debugging session: CTRL+B then D
```

## Test by Spec

```
bundle exec rspec
```