Ж
ћп
:
Add
x"T
y"T
z"T"
Ttype:
2	

ArgMax

input"T
	dimension"Tidx
output"output_type"!
Ttype:
2	
"
Tidxtype0:
2	"
output_typetype0	:
2	
B
AssignVariableOp
resource
value"dtype"
dtypetype
N
Cast	
x"SrcT	
y"DstT"
SrcTtype"
DstTtype"
Truncatebool( 
h
ConcatV2
values"T*N
axis"Tidx
output"T"
Nint(0"	
Ttype"
Tidxtype0:
2	
8
Const
output"dtype"
valuetensor"
dtypetype
W

ExpandDims

input"T
dim"Tdim
output"T"	
Ttype"
Tdimtype0:
2	
p
GatherNd
params"Tparams
indices"Tindices
output"Tparams"
Tparamstype"
Tindicestype:
2	
.
Identity

input"T
output"T"	
Ttype
q
MatMul
a"T
b"T
product"T"
transpose_abool( "
transpose_bbool( "
Ttype:

2	
e
MergeV2Checkpoints
checkpoint_prefixes
destination_prefix"
delete_old_dirsbool(

NoOp
M
Pack
values"T*N
output"T"
Nint(0"	
Ttype"
axisint 
C
Placeholder
output"dtype"
dtypetype"
shapeshape:
X
PlaceholderWithDefault
input"dtype
output"dtype"
dtypetype"
shapeshape
b
Range
start"Tidx
limit"Tidx
delta"Tidx
output"Tidx"
Tidxtype0:

2	
@
ReadVariableOp
resource
value"dtype"
dtypetype
[
Reshape
tensor"T
shape"Tshape
output"T"	
Ttype"
Tshapetype0:
2	
o
	RestoreV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0
l
SaveV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0
?
Select
	condition

t"T
e"T
output"T"	
Ttype
P
Shape

input"T
output"out_type"	
Ttype"
out_typetype0:
2	
H
ShardedFilename
basename	
shard

num_shards
filename
9
Softmax
logits"T
softmax"T"
Ttype:
2
Р
StatelessIf
cond"Tcond
input2Tin
output2Tout"
Tcondtype"
Tin
list(type)("
Tout
list(type)("
then_branchfunc"
else_branchfunc" 
output_shapeslist(shape)
 
@
StaticRegexFullMatch	
input

output
"
patternstring
і
StridedSlice

input"T
begin"Index
end"Index
strides"Index
output"T"	
Ttype"
Indextype:
2	"

begin_maskint "
end_maskint "
ellipsis_maskint "
new_axis_maskint "
shrink_axis_maskint 
N

StringJoin
inputs*N

output"
Nint(0"
	separatorstring 
c
Tile

input"T
	multiples"
Tmultiples
output"T"	
Ttype"

Tmultiplestype0:
2	

VarHandleOp
resource"
	containerstring "
shared_namestring "
dtypetype"
shapeshape"#
allowed_deviceslist(string)
 
9
VarIsInitializedOp
resource
is_initialized
"serve*2.4.02unknown8
g
petal_lengthPlaceholder*#
_output_shapes
:џџџџџџџџџ*
dtype0*
shape:џџџџџџџџџ
f
petal_widthPlaceholder*#
_output_shapes
:џџџџџџџџџ*
dtype0*
shape:џџџџџџџџџ
g
sepal_lengthPlaceholder*#
_output_shapes
:џџџџџџџџџ*
dtype0*
shape:џџџџџџџџџ
f
sepal_widthPlaceholder*#
_output_shapes
:џџџџџџџџџ*
dtype0*
shape:џџџџџџџџџ
^
ConstConst*
_output_shapes

:*
dtype0*!
valueB2      №?
r
'input_layer/petal_length/ExpandDims/dimConst*
_output_shapes
: *
dtype0*
valueB :
џџџџџџџџџ

#input_layer/petal_length/ExpandDims
ExpandDimspetal_length'input_layer/petal_length/ExpandDims/dim*
T0*'
_output_shapes
:џџџџџџџџџ
q
input_layer/petal_length/ShapeShape#input_layer/petal_length/ExpandDims*
T0*
_output_shapes
:
v
,input_layer/petal_length/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 
x
.input_layer/petal_length/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:
x
.input_layer/petal_length/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
Њ
&input_layer/petal_length/strided_sliceStridedSliceinput_layer/petal_length/Shape,input_layer/petal_length/strided_slice/stack.input_layer/petal_length/strided_slice/stack_1.input_layer/petal_length/strided_slice/stack_2*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask
j
(input_layer/petal_length/Reshape/shape/1Const*
_output_shapes
: *
dtype0*
value	B :
Ў
&input_layer/petal_length/Reshape/shapePack&input_layer/petal_length/strided_slice(input_layer/petal_length/Reshape/shape/1*
N*
T0*
_output_shapes
:
Њ
 input_layer/petal_length/ReshapeReshape#input_layer/petal_length/ExpandDims&input_layer/petal_length/Reshape/shape*
T0*'
_output_shapes
:џџџџџџџџџ
q
&input_layer/petal_width/ExpandDims/dimConst*
_output_shapes
: *
dtype0*
valueB :
џџџџџџџџџ

"input_layer/petal_width/ExpandDims
ExpandDimspetal_width&input_layer/petal_width/ExpandDims/dim*
T0*'
_output_shapes
:џџџџџџџџџ
o
input_layer/petal_width/ShapeShape"input_layer/petal_width/ExpandDims*
T0*
_output_shapes
:
u
+input_layer/petal_width/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 
w
-input_layer/petal_width/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:
w
-input_layer/petal_width/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
Ѕ
%input_layer/petal_width/strided_sliceStridedSliceinput_layer/petal_width/Shape+input_layer/petal_width/strided_slice/stack-input_layer/petal_width/strided_slice/stack_1-input_layer/petal_width/strided_slice/stack_2*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask
i
'input_layer/petal_width/Reshape/shape/1Const*
_output_shapes
: *
dtype0*
value	B :
Ћ
%input_layer/petal_width/Reshape/shapePack%input_layer/petal_width/strided_slice'input_layer/petal_width/Reshape/shape/1*
N*
T0*
_output_shapes
:
Ї
input_layer/petal_width/ReshapeReshape"input_layer/petal_width/ExpandDims%input_layer/petal_width/Reshape/shape*
T0*'
_output_shapes
:џџџџџџџџџ
r
'input_layer/sepal_length/ExpandDims/dimConst*
_output_shapes
: *
dtype0*
valueB :
џџџџџџџџџ

#input_layer/sepal_length/ExpandDims
ExpandDimssepal_length'input_layer/sepal_length/ExpandDims/dim*
T0*'
_output_shapes
:џџџџџџџџџ
q
input_layer/sepal_length/ShapeShape#input_layer/sepal_length/ExpandDims*
T0*
_output_shapes
:
v
,input_layer/sepal_length/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 
x
.input_layer/sepal_length/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:
x
.input_layer/sepal_length/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
Њ
&input_layer/sepal_length/strided_sliceStridedSliceinput_layer/sepal_length/Shape,input_layer/sepal_length/strided_slice/stack.input_layer/sepal_length/strided_slice/stack_1.input_layer/sepal_length/strided_slice/stack_2*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask
j
(input_layer/sepal_length/Reshape/shape/1Const*
_output_shapes
: *
dtype0*
value	B :
Ў
&input_layer/sepal_length/Reshape/shapePack&input_layer/sepal_length/strided_slice(input_layer/sepal_length/Reshape/shape/1*
N*
T0*
_output_shapes
:
Њ
 input_layer/sepal_length/ReshapeReshape#input_layer/sepal_length/ExpandDims&input_layer/sepal_length/Reshape/shape*
T0*'
_output_shapes
:џџџџџџџџџ
q
&input_layer/sepal_width/ExpandDims/dimConst*
_output_shapes
: *
dtype0*
valueB :
џџџџџџџџџ

"input_layer/sepal_width/ExpandDims
ExpandDimssepal_width&input_layer/sepal_width/ExpandDims/dim*
T0*'
_output_shapes
:џџџџџџџџџ
o
input_layer/sepal_width/ShapeShape"input_layer/sepal_width/ExpandDims*
T0*
_output_shapes
:
u
+input_layer/sepal_width/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 
w
-input_layer/sepal_width/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:
w
-input_layer/sepal_width/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
Ѕ
%input_layer/sepal_width/strided_sliceStridedSliceinput_layer/sepal_width/Shape+input_layer/sepal_width/strided_slice/stack-input_layer/sepal_width/strided_slice/stack_1-input_layer/sepal_width/strided_slice/stack_2*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask
i
'input_layer/sepal_width/Reshape/shape/1Const*
_output_shapes
: *
dtype0*
value	B :
Ћ
%input_layer/sepal_width/Reshape/shapePack%input_layer/sepal_width/strided_slice'input_layer/sepal_width/Reshape/shape/1*
N*
T0*
_output_shapes
:
Ї
input_layer/sepal_width/ReshapeReshape"input_layer/sepal_width/ExpandDims%input_layer/sepal_width/Reshape/shape*
T0*'
_output_shapes
:џџџџџџџџџ
Y
input_layer/concat/axisConst*
_output_shapes
: *
dtype0*
value	B :
ј
input_layer/concatConcatV2 input_layer/petal_length/Reshapeinput_layer/petal_width/Reshape input_layer/sepal_length/Reshapeinput_layer/sepal_width/Reshapeinput_layer/concat/axis*
N*
T0*'
_output_shapes
:џџџџџџџџџ
x
Const_1Const*
_output_shapes

:*
dtype0*9
value0B." !6/:џъ?Ђ~-@
eАtф?ЦТНшА№П

0_weightVarHandleOp*
_class
loc:@0_weight*
_output_shapes
: *
dtype0*
shape
:*
shared_name
0_weight
a
)0_weight/IsInitialized/VarIsInitializedOpVarIsInitializedOp0_weight*
_output_shapes
: 
C
0_weight/AssignAssignVariableOp0_weightConst_1*
dtype0
e
0_weight/Read/ReadVariableOpReadVariableOp0_weight*
_output_shapes

:*
dtype0
P
Const_2Const*
_output_shapes
: *
dtype0*
valueB 2юсДЅдР

1_weightVarHandleOp*
_class
loc:@1_weight*
_output_shapes
: *
dtype0*
shape: *
shared_name
1_weight
a
)1_weight/IsInitialized/VarIsInitializedOpVarIsInitializedOp1_weight*
_output_shapes
: 
C
1_weight/AssignAssignVariableOp1_weightConst_2*
dtype0
]
1_weight/Read/ReadVariableOpReadVariableOp1_weight*
_output_shapes
: *
dtype0
a
CastCastinput_layer/concat*

DstT0*

SrcT0*'
_output_shapes
:џџџџџџџџџ
^
MatMul/ReadVariableOpReadVariableOp0_weight*
_output_shapes

:*
dtype0
_
MatMulMatMulCastMatMul/ReadVariableOp*
T0*'
_output_shapes
:џџџџџџџџџ
S
Add/ReadVariableOpReadVariableOp1_weight*
_output_shapes
: *
dtype0
X
AddAddMatMulAdd/ReadVariableOp*
T0*'
_output_shapes
:џџџџџџџџџ
J
Cast_1/xConst*
_output_shapes
: *
dtype0
*
value	B
 Z 
Н
condStatelessIfCast_1/xConstAdd*
Tcond0
*
Tin
2*
Tout
2*
_lower_using_switch_merge(*0
_output_shapes
:џџџџџџџџџџџџџџџџџџ* 
_read_only_resource_inputs
 * 
else_branchR
cond_false_64*/
output_shapes
:џџџџџџџџџџџџџџџџџџ*
then_branchR
cond_true_63
Z
cond/IdentityIdentitycond*
T0*0
_output_shapes
:џџџџџџџџџџџџџџџџџџ
t
)input_layer_1/petal_length/ExpandDims/dimConst*
_output_shapes
: *
dtype0*
valueB :
џџџџџџџџџ

%input_layer_1/petal_length/ExpandDims
ExpandDimspetal_length)input_layer_1/petal_length/ExpandDims/dim*
T0*'
_output_shapes
:џџџџџџџџџ
u
 input_layer_1/petal_length/ShapeShape%input_layer_1/petal_length/ExpandDims*
T0*
_output_shapes
:
x
.input_layer_1/petal_length/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 
z
0input_layer_1/petal_length/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:
z
0input_layer_1/petal_length/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
Д
(input_layer_1/petal_length/strided_sliceStridedSlice input_layer_1/petal_length/Shape.input_layer_1/petal_length/strided_slice/stack0input_layer_1/petal_length/strided_slice/stack_10input_layer_1/petal_length/strided_slice/stack_2*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask
l
*input_layer_1/petal_length/Reshape/shape/1Const*
_output_shapes
: *
dtype0*
value	B :
Д
(input_layer_1/petal_length/Reshape/shapePack(input_layer_1/petal_length/strided_slice*input_layer_1/petal_length/Reshape/shape/1*
N*
T0*
_output_shapes
:
А
"input_layer_1/petal_length/ReshapeReshape%input_layer_1/petal_length/ExpandDims(input_layer_1/petal_length/Reshape/shape*
T0*'
_output_shapes
:џџџџџџџџџ
s
(input_layer_1/petal_width/ExpandDims/dimConst*
_output_shapes
: *
dtype0*
valueB :
џџџџџџџџџ

$input_layer_1/petal_width/ExpandDims
ExpandDimspetal_width(input_layer_1/petal_width/ExpandDims/dim*
T0*'
_output_shapes
:џџџџџџџџџ
s
input_layer_1/petal_width/ShapeShape$input_layer_1/petal_width/ExpandDims*
T0*
_output_shapes
:
w
-input_layer_1/petal_width/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 
y
/input_layer_1/petal_width/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:
y
/input_layer_1/petal_width/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
Џ
'input_layer_1/petal_width/strided_sliceStridedSliceinput_layer_1/petal_width/Shape-input_layer_1/petal_width/strided_slice/stack/input_layer_1/petal_width/strided_slice/stack_1/input_layer_1/petal_width/strided_slice/stack_2*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask
k
)input_layer_1/petal_width/Reshape/shape/1Const*
_output_shapes
: *
dtype0*
value	B :
Б
'input_layer_1/petal_width/Reshape/shapePack'input_layer_1/petal_width/strided_slice)input_layer_1/petal_width/Reshape/shape/1*
N*
T0*
_output_shapes
:
­
!input_layer_1/petal_width/ReshapeReshape$input_layer_1/petal_width/ExpandDims'input_layer_1/petal_width/Reshape/shape*
T0*'
_output_shapes
:џџџџџџџџџ
t
)input_layer_1/sepal_length/ExpandDims/dimConst*
_output_shapes
: *
dtype0*
valueB :
џџџџџџџџџ

%input_layer_1/sepal_length/ExpandDims
ExpandDimssepal_length)input_layer_1/sepal_length/ExpandDims/dim*
T0*'
_output_shapes
:џџџџџџџџџ
u
 input_layer_1/sepal_length/ShapeShape%input_layer_1/sepal_length/ExpandDims*
T0*
_output_shapes
:
x
.input_layer_1/sepal_length/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 
z
0input_layer_1/sepal_length/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:
z
0input_layer_1/sepal_length/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
Д
(input_layer_1/sepal_length/strided_sliceStridedSlice input_layer_1/sepal_length/Shape.input_layer_1/sepal_length/strided_slice/stack0input_layer_1/sepal_length/strided_slice/stack_10input_layer_1/sepal_length/strided_slice/stack_2*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask
l
*input_layer_1/sepal_length/Reshape/shape/1Const*
_output_shapes
: *
dtype0*
value	B :
Д
(input_layer_1/sepal_length/Reshape/shapePack(input_layer_1/sepal_length/strided_slice*input_layer_1/sepal_length/Reshape/shape/1*
N*
T0*
_output_shapes
:
А
"input_layer_1/sepal_length/ReshapeReshape%input_layer_1/sepal_length/ExpandDims(input_layer_1/sepal_length/Reshape/shape*
T0*'
_output_shapes
:џџџџџџџџџ
s
(input_layer_1/sepal_width/ExpandDims/dimConst*
_output_shapes
: *
dtype0*
valueB :
џџџџџџџџџ

$input_layer_1/sepal_width/ExpandDims
ExpandDimssepal_width(input_layer_1/sepal_width/ExpandDims/dim*
T0*'
_output_shapes
:џџџџџџџџџ
s
input_layer_1/sepal_width/ShapeShape$input_layer_1/sepal_width/ExpandDims*
T0*
_output_shapes
:
w
-input_layer_1/sepal_width/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 
y
/input_layer_1/sepal_width/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:
y
/input_layer_1/sepal_width/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
Џ
'input_layer_1/sepal_width/strided_sliceStridedSliceinput_layer_1/sepal_width/Shape-input_layer_1/sepal_width/strided_slice/stack/input_layer_1/sepal_width/strided_slice/stack_1/input_layer_1/sepal_width/strided_slice/stack_2*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask
k
)input_layer_1/sepal_width/Reshape/shape/1Const*
_output_shapes
: *
dtype0*
value	B :
Б
'input_layer_1/sepal_width/Reshape/shapePack'input_layer_1/sepal_width/strided_slice)input_layer_1/sepal_width/Reshape/shape/1*
N*
T0*
_output_shapes
:
­
!input_layer_1/sepal_width/ReshapeReshape$input_layer_1/sepal_width/ExpandDims'input_layer_1/sepal_width/Reshape/shape*
T0*'
_output_shapes
:џџџџџџџџџ
[
input_layer_1/concat/axisConst*
_output_shapes
: *
dtype0*
value	B :

input_layer_1/concatConcatV2"input_layer_1/petal_length/Reshape!input_layer_1/petal_width/Reshape"input_layer_1/sepal_length/Reshape!input_layer_1/sepal_width/Reshapeinput_layer_1/concat/axis*
N*
T0*'
_output_shapes
:џџџџџџџџџ
x
Const_3Const*
_output_shapes

:*
dtype0*9
value0B." *ыfJ?c6XNшПK­;ё#с?WЯ­hУтѕП

2_weightVarHandleOp*
_class
loc:@2_weight*
_output_shapes
: *
dtype0*
shape
:*
shared_name
2_weight
a
)2_weight/IsInitialized/VarIsInitializedOpVarIsInitializedOp2_weight*
_output_shapes
: 
C
2_weight/AssignAssignVariableOp2_weightConst_3*
dtype0
e
2_weight/Read/ReadVariableOpReadVariableOp2_weight*
_output_shapes

:*
dtype0
P
Const_4Const*
_output_shapes
: *
dtype0*
valueB 2*^кы Е	@

3_weightVarHandleOp*
_class
loc:@3_weight*
_output_shapes
: *
dtype0*
shape: *
shared_name
3_weight
a
)3_weight/IsInitialized/VarIsInitializedOpVarIsInitializedOp3_weight*
_output_shapes
: 
C
3_weight/AssignAssignVariableOp3_weightConst_4*
dtype0
]
3_weight/Read/ReadVariableOpReadVariableOp3_weight*
_output_shapes
: *
dtype0
e
Cast_2Castinput_layer_1/concat*

DstT0*

SrcT0*'
_output_shapes
:џџџџџџџџџ
`
MatMul_1/ReadVariableOpReadVariableOp2_weight*
_output_shapes

:*
dtype0
e
MatMul_1MatMulCast_2MatMul_1/ReadVariableOp*
T0*'
_output_shapes
:џџџџџџџџџ
U
Add_1/ReadVariableOpReadVariableOp3_weight*
_output_shapes
: *
dtype0
^
Add_1AddMatMul_1Add_1/ReadVariableOp*
T0*'
_output_shapes
:џџџџџџџџџ
J
Cast_3/xConst*
_output_shapes
: *
dtype0
*
value	B
 Z
Я
cond_1StatelessIfCast_3/xcond/IdentityAdd_1*
Tcond0
*
Tin
2*
Tout
2*
_lower_using_switch_merge(*0
_output_shapes
:џџџџџџџџџџџџџџџџџџ* 
_read_only_resource_inputs
 *#
else_branchR
cond_1_false_132*/
output_shapes
:џџџџџџџџџџџџџџџџџџ*"
then_branchR
cond_1_true_131
^
cond_1/IdentityIdentitycond_1*
T0*0
_output_shapes
:џџџџџџџџџџџџџџџџџџ
t
)input_layer_2/petal_length/ExpandDims/dimConst*
_output_shapes
: *
dtype0*
valueB :
џџџџџџџџџ

%input_layer_2/petal_length/ExpandDims
ExpandDimspetal_length)input_layer_2/petal_length/ExpandDims/dim*
T0*'
_output_shapes
:џџџџџџџџџ
u
 input_layer_2/petal_length/ShapeShape%input_layer_2/petal_length/ExpandDims*
T0*
_output_shapes
:
x
.input_layer_2/petal_length/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 
z
0input_layer_2/petal_length/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:
z
0input_layer_2/petal_length/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
Д
(input_layer_2/petal_length/strided_sliceStridedSlice input_layer_2/petal_length/Shape.input_layer_2/petal_length/strided_slice/stack0input_layer_2/petal_length/strided_slice/stack_10input_layer_2/petal_length/strided_slice/stack_2*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask
l
*input_layer_2/petal_length/Reshape/shape/1Const*
_output_shapes
: *
dtype0*
value	B :
Д
(input_layer_2/petal_length/Reshape/shapePack(input_layer_2/petal_length/strided_slice*input_layer_2/petal_length/Reshape/shape/1*
N*
T0*
_output_shapes
:
А
"input_layer_2/petal_length/ReshapeReshape%input_layer_2/petal_length/ExpandDims(input_layer_2/petal_length/Reshape/shape*
T0*'
_output_shapes
:џџџџџџџџџ
s
(input_layer_2/petal_width/ExpandDims/dimConst*
_output_shapes
: *
dtype0*
valueB :
џџџџџџџџџ

$input_layer_2/petal_width/ExpandDims
ExpandDimspetal_width(input_layer_2/petal_width/ExpandDims/dim*
T0*'
_output_shapes
:џџџџџџџџџ
s
input_layer_2/petal_width/ShapeShape$input_layer_2/petal_width/ExpandDims*
T0*
_output_shapes
:
w
-input_layer_2/petal_width/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 
y
/input_layer_2/petal_width/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:
y
/input_layer_2/petal_width/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
Џ
'input_layer_2/petal_width/strided_sliceStridedSliceinput_layer_2/petal_width/Shape-input_layer_2/petal_width/strided_slice/stack/input_layer_2/petal_width/strided_slice/stack_1/input_layer_2/petal_width/strided_slice/stack_2*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask
k
)input_layer_2/petal_width/Reshape/shape/1Const*
_output_shapes
: *
dtype0*
value	B :
Б
'input_layer_2/petal_width/Reshape/shapePack'input_layer_2/petal_width/strided_slice)input_layer_2/petal_width/Reshape/shape/1*
N*
T0*
_output_shapes
:
­
!input_layer_2/petal_width/ReshapeReshape$input_layer_2/petal_width/ExpandDims'input_layer_2/petal_width/Reshape/shape*
T0*'
_output_shapes
:џџџџџџџџџ
t
)input_layer_2/sepal_length/ExpandDims/dimConst*
_output_shapes
: *
dtype0*
valueB :
џџџџџџџџџ

%input_layer_2/sepal_length/ExpandDims
ExpandDimssepal_length)input_layer_2/sepal_length/ExpandDims/dim*
T0*'
_output_shapes
:џџџџџџџџџ
u
 input_layer_2/sepal_length/ShapeShape%input_layer_2/sepal_length/ExpandDims*
T0*
_output_shapes
:
x
.input_layer_2/sepal_length/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 
z
0input_layer_2/sepal_length/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:
z
0input_layer_2/sepal_length/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
Д
(input_layer_2/sepal_length/strided_sliceStridedSlice input_layer_2/sepal_length/Shape.input_layer_2/sepal_length/strided_slice/stack0input_layer_2/sepal_length/strided_slice/stack_10input_layer_2/sepal_length/strided_slice/stack_2*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask
l
*input_layer_2/sepal_length/Reshape/shape/1Const*
_output_shapes
: *
dtype0*
value	B :
Д
(input_layer_2/sepal_length/Reshape/shapePack(input_layer_2/sepal_length/strided_slice*input_layer_2/sepal_length/Reshape/shape/1*
N*
T0*
_output_shapes
:
А
"input_layer_2/sepal_length/ReshapeReshape%input_layer_2/sepal_length/ExpandDims(input_layer_2/sepal_length/Reshape/shape*
T0*'
_output_shapes
:џџџџџџџџџ
s
(input_layer_2/sepal_width/ExpandDims/dimConst*
_output_shapes
: *
dtype0*
valueB :
џџџџџџџџџ

$input_layer_2/sepal_width/ExpandDims
ExpandDimssepal_width(input_layer_2/sepal_width/ExpandDims/dim*
T0*'
_output_shapes
:џџџџџџџџџ
s
input_layer_2/sepal_width/ShapeShape$input_layer_2/sepal_width/ExpandDims*
T0*
_output_shapes
:
w
-input_layer_2/sepal_width/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 
y
/input_layer_2/sepal_width/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:
y
/input_layer_2/sepal_width/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
Џ
'input_layer_2/sepal_width/strided_sliceStridedSliceinput_layer_2/sepal_width/Shape-input_layer_2/sepal_width/strided_slice/stack/input_layer_2/sepal_width/strided_slice/stack_1/input_layer_2/sepal_width/strided_slice/stack_2*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask
k
)input_layer_2/sepal_width/Reshape/shape/1Const*
_output_shapes
: *
dtype0*
value	B :
Б
'input_layer_2/sepal_width/Reshape/shapePack'input_layer_2/sepal_width/strided_slice)input_layer_2/sepal_width/Reshape/shape/1*
N*
T0*
_output_shapes
:
­
!input_layer_2/sepal_width/ReshapeReshape$input_layer_2/sepal_width/ExpandDims'input_layer_2/sepal_width/Reshape/shape*
T0*'
_output_shapes
:џџџџџџџџџ
[
input_layer_2/concat/axisConst*
_output_shapes
: *
dtype0*
value	B :

input_layer_2/concatConcatV2"input_layer_2/petal_length/Reshape!input_layer_2/petal_width/Reshape"input_layer_2/sepal_length/Reshape!input_layer_2/sepal_width/Reshapeinput_layer_2/concat/axis*
N*
T0*'
_output_shapes
:џџџџџџџџџ
x
Const_5Const*
_output_shapes

:*
dtype0*9
value0B." hqлБыПтжВ­к§Пщи"+ ЬђПщ7жI@

4_weightVarHandleOp*
_class
loc:@4_weight*
_output_shapes
: *
dtype0*
shape
:*
shared_name
4_weight
a
)4_weight/IsInitialized/VarIsInitializedOpVarIsInitializedOp4_weight*
_output_shapes
: 
C
4_weight/AssignAssignVariableOp4_weightConst_5*
dtype0
e
4_weight/Read/ReadVariableOpReadVariableOp4_weight*
_output_shapes

:*
dtype0
P
Const_6Const*
_output_shapes
: *
dtype0*
valueB 2 Пє>ељ@

5_weightVarHandleOp*
_class
loc:@5_weight*
_output_shapes
: *
dtype0*
shape: *
shared_name
5_weight
a
)5_weight/IsInitialized/VarIsInitializedOpVarIsInitializedOp5_weight*
_output_shapes
: 
C
5_weight/AssignAssignVariableOp5_weightConst_6*
dtype0
]
5_weight/Read/ReadVariableOpReadVariableOp5_weight*
_output_shapes
: *
dtype0
e
Cast_4Castinput_layer_2/concat*

DstT0*

SrcT0*'
_output_shapes
:џџџџџџџџџ
`
MatMul_2/ReadVariableOpReadVariableOp4_weight*
_output_shapes

:*
dtype0
e
MatMul_2MatMulCast_4MatMul_2/ReadVariableOp*
T0*'
_output_shapes
:џџџџџџџџџ
U
Add_2/ReadVariableOpReadVariableOp5_weight*
_output_shapes
: *
dtype0
^
Add_2AddMatMul_2Add_2/ReadVariableOp*
T0*'
_output_shapes
:џџџџџџџџџ
J
Cast_5/xConst*
_output_shapes
: *
dtype0
*
value	B
 Z
б
cond_2StatelessIfCast_5/xcond_1/IdentityAdd_2*
Tcond0
*
Tin
2*
Tout
2*
_lower_using_switch_merge(*0
_output_shapes
:џџџџџџџџџџџџџџџџџџ* 
_read_only_resource_inputs
 *#
else_branchR
cond_2_false_200*/
output_shapes
:џџџџџџџџџџџџџџџџџџ*"
then_branchR
cond_2_true_199
^
cond_2/IdentityIdentitycond_2*
T0*0
_output_shapes
:џџџџџџџџџџџџџџџџџџ
m
Const_7Const*
_output_shapes
:*
dtype0*2
value)B'B	virginicaB
versicolorBsetosa
P
ExpandDims/dimConst*
_output_shapes
: *
dtype0*
value	B : 
Z

ExpandDims
ExpandDimsConst_7ExpandDims/dim*
T0*
_output_shapes

:
D
ShapeShapecond_2/Identity*
T0*
_output_shapes
:
]
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 
_
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:
_
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
­
strided_sliceStridedSliceShapestrided_slice/stackstrided_slice/stack_1strided_slice/stack_2*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask
[
output_labels/multiples/1Const*
_output_shapes
: *
dtype0*
value	B :
w
output_labels/multiplesPackstrided_sliceoutput_labels/multiples/1*
N*
T0*
_output_shapes
:
l
output_labelsTile
ExpandDimsoutput_labels/multiples*
T0*'
_output_shapes
:џџџџџџџџџ
R
ArgMax/dimensionConst*
_output_shapes
: *
dtype0*
value	B :
a
ArgMaxArgMaxcond_2/IdentityArgMax/dimension*
T0*#
_output_shapes
:џџџџџџџџџ
=
Shape_1ShapeArgMax*
T0	*
_output_shapes
:
_
strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: 
a
strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:
a
strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
З
strided_slice_1StridedSliceShape_1strided_slice_1/stackstrided_slice_1/stack_1strided_slice_1/stack_2*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask
M
range/startConst*
_output_shapes
: *
dtype0*
value	B : 
M
range/deltaConst*
_output_shapes
: *
dtype0*
value	B :
^
rangeRangerange/startstrided_slice_1range/delta*#
_output_shapes
:џџџџџџџџџ
R
Cast_6Castrange*

DstT0	*

SrcT0*#
_output_shapes
:џџџџџџџџџ
d
stackPackCast_6ArgMax*
N*
T0	*'
_output_shapes
:џџџџџџџџџ*

axis
n
GatherNdGatherNdoutput_labelsstack*
Tindices0	*
Tparams0*#
_output_shapes
:џџџџџџџџџ
c
output_class/shapeConst*
_output_shapes
:*
dtype0*
valueB"џџџџ   
g
output_classReshapeGatherNdoutput_class/shape*
T0*'
_output_shapes
:џџџџџџџџџ
^
SoftmaxSoftmaxcond_2/Identity*
T0*0
_output_shapes
:џџџџџџџџџџџџџџџџџџ
D
Shape_2Shapeoutput_labels*
T0*
_output_shapes
:
[
output_probsReshapeSoftmaxShape_2*
T0*'
_output_shapes
:џџџџџџџџџ
x
initNoOp^0_weight/Assign^1_weight/Assign^2_weight/Assign^3_weight/Assign^4_weight/Assign^5_weight/Assign

init_all_tablesNoOp
+

group_depsNoOp^init^init_all_tables

init_all_tables_1NoOp
Y
save/filename/inputConst*
_output_shapes
: *
dtype0*
valueB Bmodel
n
save/filenamePlaceholderWithDefaultsave/filename/input*
_output_shapes
: *
dtype0*
shape: 
e

save/ConstPlaceholderWithDefaultsave/filename*
_output_shapes
: *
dtype0*
shape: 
{
save/StaticRegexFullMatchStaticRegexFullMatch
save/Const"/device:CPU:**
_output_shapes
: *
pattern
^s3://.*
a
save/Const_1Const"/device:CPU:**
_output_shapes
: *
dtype0*
valueB B.part
f
save/Const_2Const"/device:CPU:**
_output_shapes
: *
dtype0*
valueB B
_temp/part
|
save/SelectSelectsave/StaticRegexFullMatchsave/Const_1save/Const_2"/device:CPU:**
T0*
_output_shapes
: 
f
save/StringJoin
StringJoin
save/Constsave/Select"/device:CPU:**
N*
_output_shapes
: 
Q
save/num_shardsConst*
_output_shapes
: *
dtype0*
value	B :
k
save/ShardedFilename/shardConst"/device:CPU:0*
_output_shapes
: *
dtype0*
value	B : 

save/ShardedFilenameShardedFilenamesave/StringJoinsave/ShardedFilename/shardsave/num_shards"/device:CPU:0*
_output_shapes
: 
Њ
save/SaveV2/tensor_namesConst"/device:CPU:0*
_output_shapes
:*
dtype0*O
valueFBDB0_weightB1_weightB2_weightB3_weightB4_weightB5_weight
~
save/SaveV2/shape_and_slicesConst"/device:CPU:0*
_output_shapes
:*
dtype0*
valueBB B B B B B 
М
save/SaveV2SaveV2save/ShardedFilenamesave/SaveV2/tensor_namessave/SaveV2/shape_and_slices0_weight/Read/ReadVariableOp1_weight/Read/ReadVariableOp2_weight/Read/ReadVariableOp3_weight/Read/ReadVariableOp4_weight/Read/ReadVariableOp5_weight/Read/ReadVariableOp"/device:CPU:0*
dtypes

2
 
save/control_dependencyIdentitysave/ShardedFilename^save/SaveV2"/device:CPU:0*
T0*'
_class
loc:@save/ShardedFilename*
_output_shapes
: 
 
+save/MergeV2Checkpoints/checkpoint_prefixesPacksave/ShardedFilename^save/control_dependency"/device:CPU:0*
N*
T0*
_output_shapes
:
u
save/MergeV2CheckpointsMergeV2Checkpoints+save/MergeV2Checkpoints/checkpoint_prefixes
save/Const"/device:CPU:0

save/IdentityIdentity
save/Const^save/MergeV2Checkpoints^save/control_dependency"/device:CPU:0*
T0*
_output_shapes
: 
­
save/RestoreV2/tensor_namesConst"/device:CPU:0*
_output_shapes
:*
dtype0*O
valueFBDB0_weightB1_weightB2_weightB3_weightB4_weightB5_weight

save/RestoreV2/shape_and_slicesConst"/device:CPU:0*
_output_shapes
:*
dtype0*
valueBB B B B B B 
И
save/RestoreV2	RestoreV2
save/Constsave/RestoreV2/tensor_namessave/RestoreV2/shape_and_slices"/device:CPU:0*,
_output_shapes
::::::*
dtypes

2
N
save/Identity_1Identitysave/RestoreV2*
T0*
_output_shapes
:
Q
save/AssignVariableOpAssignVariableOp0_weightsave/Identity_1*
dtype0
P
save/Identity_2Identitysave/RestoreV2:1*
T0*
_output_shapes
:
S
save/AssignVariableOp_1AssignVariableOp1_weightsave/Identity_2*
dtype0
P
save/Identity_3Identitysave/RestoreV2:2*
T0*
_output_shapes
:
S
save/AssignVariableOp_2AssignVariableOp2_weightsave/Identity_3*
dtype0
P
save/Identity_4Identitysave/RestoreV2:3*
T0*
_output_shapes
:
S
save/AssignVariableOp_3AssignVariableOp3_weightsave/Identity_4*
dtype0
P
save/Identity_5Identitysave/RestoreV2:4*
T0*
_output_shapes
:
S
save/AssignVariableOp_4AssignVariableOp4_weightsave/Identity_5*
dtype0
P
save/Identity_6Identitysave/RestoreV2:5*
T0*
_output_shapes
:
S
save/AssignVariableOp_5AssignVariableOp5_weightsave/Identity_6*
dtype0
Д
save/restore_shardNoOp^save/AssignVariableOp^save/AssignVariableOp_1^save/AssignVariableOp_2^save/AssignVariableOp_3^save/AssignVariableOp_4^save/AssignVariableOp_5
-
save/restore_allNoOp^save/restore_shardБ
н
I
cond_1_true_131
concat_cond_identity
concat_add_1

concat\
concat/axisConst*
_output_shapes
: *
dtype0*
value	B :2
concat/axisj
concat_0ConcatV2concat_cond_identityconcat_add_1concat/axis:output:0*
N*
T02
concat"
concatconcat_0:output:0*B
_input_shapes1
/:џџџџџџџџџџџџџџџџџџ:џџџџџџџџџ:6 2
0
_output_shapes
:џџџџџџџџџџџџџџџџџџ:-)
'
_output_shapes
:џџџџџџџџџ
Ы
4
cond_false_64
placeholder	
add_0
add"
addadd_0*0
_input_shapes
::џџџџџџџџџ:$  

_output_shapes

::-)
'
_output_shapes
:џџџџџџџџџ
њ
;
cond_2_false_200
placeholder
add_2_0	
add_2"
add_2add_2_0*B
_input_shapes1
/:џџџџџџџџџџџџџџџџџџ:џџџџџџџџџ:6 2
0
_output_shapes
:џџџџџџџџџџџџџџџџџџ:-)
'
_output_shapes
:џџџџџџџџџ
њ
;
cond_1_false_132
placeholder
add_1_0	
add_1"
add_1add_1_0*B
_input_shapes1
/:џџџџџџџџџџџџџџџџџџ:џџџџџџџџџ:6 2
0
_output_shapes
:џџџџџџџџџџџџџџџџџџ:-)
'
_output_shapes
:џџџџџџџџџ
с
K
cond_2_true_199
concat_cond_1_identity
concat_add_2

concat\
concat/axisConst*
_output_shapes
: *
dtype0*
value	B :2
concat/axisl
concat_0ConcatV2concat_cond_1_identityconcat_add_2concat/axis:output:0*
N*
T02
concat"
concatconcat_0:output:0*B
_input_shapes1
/:џџџџџџџџџџџџџџџџџџ:џџџџџџџџџ:6 2
0
_output_shapes
:џџџџџџџџџџџџџџџџџџ:-)
'
_output_shapes
:џџџџџџџџџ
Ђ
<
cond_true_63
concat_const

concat_add

concat\
concat/axisConst*
_output_shapes
: *
dtype0*
value	B :2
concat/axis`
concat_0ConcatV2concat_const
concat_addconcat/axis:output:0*
N*
T02
concat"
concatconcat_0:output:0*0
_input_shapes
::џџџџџџџџџ:$  

_output_shapes

::-)
'
_output_shapes
:џџџџџџџџџ"Ј<
save/Const:0save/Identity:0save/restore_all (5 @F8",
saved_model_main_op

init_all_tables_1"я
trainable_variablesзд
L

0_weight:00_weight/Assign0_weight/Read/ReadVariableOp:0(2	Const_1:08
L

1_weight:01_weight/Assign1_weight/Read/ReadVariableOp:0(2	Const_2:08
L

2_weight:02_weight/Assign2_weight/Read/ReadVariableOp:0(2	Const_3:08
L

3_weight:03_weight/Assign3_weight/Read/ReadVariableOp:0(2	Const_4:08
L

4_weight:04_weight/Assign4_weight/Read/ReadVariableOp:0(2	Const_5:08
L

5_weight:05_weight/Assign5_weight/Read/ReadVariableOp:0(2	Const_6:08"х
	variablesзд
L

0_weight:00_weight/Assign0_weight/Read/ReadVariableOp:0(2	Const_1:08
L

1_weight:01_weight/Assign1_weight/Read/ReadVariableOp:0(2	Const_2:08
L

2_weight:02_weight/Assign2_weight/Read/ReadVariableOp:0(2	Const_3:08
L

3_weight:03_weight/Assign3_weight/Read/ReadVariableOp:0(2	Const_4:08
L

4_weight:04_weight/Assign4_weight/Read/ReadVariableOp:0(2	Const_5:08
L

5_weight:05_weight/Assign5_weight/Read/ReadVariableOp:0(2	Const_6:08*І
serving_default
1
petal_length!
petal_length:0џџџџџџџџџ
/
petal_width 
petal_width:0џџџџџџџџџ
1
sepal_length!
sepal_length:0џџџџџџџџџ
/
sepal_width 
sepal_width:0џџџџџџџџџ:
predicted_species%
output_class:0џџџџџџџџџ6
species_probs%
output_probs:0џџџџџџџџџ8
species_values&
output_labels:0џџџџџџџџџtensorflow/serving/predict