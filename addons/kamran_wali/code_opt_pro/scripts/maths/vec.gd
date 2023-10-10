class_name Vec
## Vector3 and Vector2 simple performant calculations.
##
## Helps with some simple Vector3 and Vector2 calculations and some performance
## friendly calculations.

## This method calculates the squared distance between two Vector3s.
static func distance_vec3(value1: Vector3, value2: Vector3) -> float:
	value2.x = value1.x - value2.x
	value2.y = value1.y - value2.y
	value2.z = value1.z - value2.z
	return value2.length_squared()

## This method calculates the squared distance between two COP_FixedVector3Vars.
static func distance_fixed_vec3_var(value1: COP_FixedVector3Var, value2: COP_FixedVector3Var) -> float:
	return distance_vec3(value1.get_value(), value2.get_value())

## This method calculates the squared distance between two COP_Vector3Vars.
static func distance_vec3_var(value1: COP_Vector3Var, value2: COP_Vector3Var) -> float:
	return distance_vec3(value1.get_value(), value2.get_value())

## This method calculates the squared distance between two Vector2s.
static func distance_vec2(value1: Vector2, value2: Vector2) -> float:
	value2.x = value1.x - value2.x
	value2.y = value1.y - value2.y
	return value2.length_squared()

## This method calculates the squared distance between two COP_FixedVector2Vars.
static func distance_fixed_vec2_var(value1: COP_FixedVector2Var, value2: COP_FixedVector2Var) -> float:
	return distance_vec2(value1.get_value(), value2.get_value())

## This method calculates the squared distance between two COP_Vector2Vars.
static func distance_vec2_var(value1: COP_Vector2Var, value2: COP_Vector2Var) -> float:
	return distance_vec2(value1.get_value(), value2.get_value())

## This method subtracts two Vector3s.
static func subtract_vec3(value1: Vector3, value2: Vector3) -> Vector3:
	value1.x = value1.x - value2.x
	value1.y = value1.y - value2.y
	value1.z = value1.z - value2.z
	return value1

## This method subtracts two COP_FixedVector3Vars and returns Vector3.
static func subtract_fixed_vec3_var(value1: COP_FixedVector3Var, value2: COP_FixedVector3Var) -> Vector3:
	return subtract_vec3(value1.get_value(), value2.get_value())

## This method subtracts two COP_Vector3Vars and returns Vector3.
static func subtract_vec3_var(value1: COP_Vector3Var, value2: COP_Vector3Var) -> Vector3:
	return subtract_vec3(value1.get_value(), value2.get_value())

## This method subtracts two Vector2s.
static func subtract_vec2(value1: Vector2, value2: Vector2) -> Vector2:
	value1.x = value1.x - value2.x
	value1.y = value1.y - value2.y
	return value1

## This method subtracts two COP_FixedVector2Vars and returns Vector2.
static func subtract_fixed_vec2_var(value1: COP_FixedVector2Var, value2: COP_FixedVector2Var) -> Vector2:
	return subtract_vec2(value1.get_value(), value2.get_value())

## This method subtracts two COP_Vector2Vars and returns Vector2.
static func subtract_vec2_var(value1: COP_Vector2Var, value2: COP_Vector2Var) -> Vector2:
	return subtract_vec2(value1.get_value(), value2.get_value())

## This method adds two Vector3s.
static func add_vec3(value1: Vector3, value2: Vector3) -> Vector3:
	value1.x = value1.x + value2.x
	value1.y = value1.y + value2.y
	value1.z = value1.z + value2.z
	return value1

## This method adds two COP_FixedVector3Vars and returns a Vector3.
static func add_fixed_vec3_var(value1: COP_FixedVector3Var, value2: COP_FixedVector3Var) -> Vector3:
	return add_vec3(value1.get_value(), value2.get_value())

## This method adds two COP_Vector3Vars and returns a Vector3.
static func add_vec3_var(value1: COP_Vector3Var, value2: COP_Vector3Var) -> Vector3:
	return add_vec3(value1.get_value(), value2.get_value())

## This method adds two Vector2s.
static func add_vec2(value1: Vector2, value2: Vector2) -> Vector2:
	value1.x = value1.x + value2.x
	value1.y = value1.y + value2.y
	return value1

## This method adds two COP_FixedVector2Vars and returns a Vector2.
static func add_fixed_vec2_var(value1: COP_FixedVector2Var, value2: COP_FixedVector2Var) -> Vector2:
	return add_vec2(value1.get_value(), value2.get_value())

## This method adds two COP_Vector2Vars and returns a Vector2.
static func add_vec2_var(value1: COP_Vector2Var, value2: COP_Vector2Var) -> Vector2:
	return add_vec2(value1.get_value(), value2.get_value())

## This method divides the Vector3 with the given float value.
static func divide_vec3(vector: Vector3, value: float) -> Vector3:
	vector.x = vector.x / value
	vector.y = vector.y / value
	vector.z = vector.z / value
	return vector

## This method divides the COP_FixedVector3Var with the given float value and returns Vector3.
static func divide_fixed_vec3_var(vector: COP_FixedVector3Var, value: float) -> Vector3:
	return divide_vec3(vector.get_value(), value)

## This method divides the COP_Vector3Var with the given float value and returns Vector3.
static func divide_vec3_var(vector: COP_Vector3Var, value: float) -> Vector3:
	return divide_vec3(vector.get_value(), value)

## This method divides the Vector2 with the given float value.
static func divide_vec2(vector: Vector2, value: float) -> Vector2:
	vector.x = vector.x / value
	vector.y = vector.y / value
	return vector

## This method divides the COP_FixedVector2Var with the given float value and returns Vector2.
static func divide_fixed_vec2_var(vector: COP_FixedVector2Var, value: float) -> Vector2:
	return divide_vec2(vector.get_value(), value)

## This method divides the COP_Vector2Var with the given float value and returns Vector2.
static func divide_vec2_var(vector: COP_Vector2Var, value: float) -> Vector2:
	return divide_vec2(vector.get_value(), value)

## This method multiplies the Vector3 with the given float value.
static func multiply_vec3(vector: Vector3, value: float) -> Vector3:
	vector.x = vector.x * value
	vector.y = vector.y * value
	vector.z = vector.z * value
	return vector

## This method multiplies the COP_FixedVector3Var with the given float value and returns Vector3.
static func multiply_fixed_vec3_var(vector: COP_FixedVector3Var, value: float) -> Vector3:
	return multiply_vec3(vector.get_value(), value)

## This method multiplies the COP_Vector3Var with the given float value and returns Vector3.
static func multiply_vec3_var(vector: COP_Vector3Var, value: float) -> Vector3:
	return multiply_vec3(vector.get_value(), value)

## This method multiplies the Vector2 with the given float value.
static func multiply_vec2(vector: Vector2, value: float) -> Vector2:
	vector.x = vector.x * value
	vector.y = vector.y * value
	return vector

## This method multiplies the COP_FixedVector2Var with the given float value and returns Vector2.
static func multiply_fixed_vec2_var(vector: COP_FixedVector2Var, value: float) -> Vector2:
	return multiply_vec2(vector.get_value(), value)

## This method multiplies the COP_Vector2Var with the given float value and returns Vector2.
static func multiply_vec2_var(vector: COP_Vector2Var, value: float) -> Vector2:
	return multiply_vec2(vector.get_value(), value)

## This method sets the Vector3 values with the given value Vector3 and then returns it.
static func set_vec3(target: Vector3, value: Vector3) -> Vector3:
	target.x = value.x
	target.y = value.y
	target.z = value.z
	return target

## This method sets the Vector3 values with the given floats and then returns it.
static func set_vec3_f(vector: Vector3, x: float, y: float, z: float) -> Vector3:
	vector.x = x
	vector.y = y
	vector.z = z
	return vector

## This method sets the Vector2 values with the given value Vector2 and then returns it.
static func set_vec2(target: Vector2, value: Vector2) -> Vector2:
	target.x = value.x
	target.y = value.y
	return target

## This method sets the Vector2 values with the given floats and then returns it.
static func set_vec2_f(vector: Vector2, x: float, y: float, z: float) -> Vector2:
	vector.x = x
	vector.y = y
	return vector
