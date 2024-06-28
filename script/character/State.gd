extends Node

class_name State

@export var can_move: bool = true

signal interrupt_state(new_state : State)

var character : CharacterBody2D
var next_state : State
var playback: AnimationNodeStateMachinePlayback

func on_enter():
	pass

func on_exit():
	pass

func state_input(event: InputEvent):
	pass

func state_process(delta):
	pass
