class_name Vec

## This method calculates the squared distance between two Vector3s.
static func distance(value1: Vector3, value2: Vector3) -> float:
	value2.x = value1.x - value2.x
	value2.y = value1.y - value2.y
	value2.z = value1.z - value2.z
	return value2.length_squared()

## This method calculates the squared distance between two Vector2s.
static func distance_vec2(value1: Vector2, value2: Vector2) -> float:
	value2.x = value1.x - value2.x
	value2.y = value1.y - value2.y
	return value2.length_squared()

## This method subtracts two Vector3s.
static func subtract(value1: Vector3, value2: Vector3) -> Vector3:
	value1.x = value1.x - value2.x
	value1.y = value1.y - value2.y
	value1.z = value1.z - value2.z
	return value1

## This method subtracts two Vector2s.
static func subtract_vec2(value1: Vector2, value2: Vector2) -> Vector2:
	value1.x = value1.x - value2.x
	value1.y = value1.y - value2.y
	return value1

## This method adds two Vector3s.
static func add(value1: Vector3, value2: Vector3) -> Vector3:
	value1.x = value1.x + value2.x
	value1.y = value1.y + value2.y
	value1.z = value1.z + value2.z
	return value1

## This method adds two Vector2s.
static func add_vec2(value1: Vector2, value2: Vector2) -> Vector2:
	value1.x = value1.x + value2.x
	value1.y = value1.y + value2.y
	return value1

## This method divides the Vector3 with the given float value.
static func divide(vector: Vector3, value: float) -> Vector3:
	vector.x = vector.x / value
	vector.y = vector.y / value
	vector.z = vector.z / value
	return vector

## This method divides the Vector2 with the given float value.
static func divide_vec(vector: Vector2, value: float) -> Vector2:
	vector.x = vector.x / value
	vector.y = vector.y / value
	return vector

## This method multiplies the Vector3 with the given float value.
static func multiply(vector: Vector3, value: float) -> Vector3:
	vector.x = vector.x * value
	vector.y = vector.y * value
	vector.z = vector.z * value
	return vector

## This method multiplies the Vector2 with the given float value.
static func multiply_vec2(vector: Vector2, value: float) -> Vector2:
	vector.x = vector.x * value
	vector.y = vector.y * value
	return vector

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
