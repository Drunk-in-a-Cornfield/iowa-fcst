Î
Ä
D
AddV2
x"T
y"T
z"T"
Ttype:
2	
^
AssignVariableOp
resource
value"dtype"
dtypetype"
validate_shapebool( 
~
BiasAdd

value"T	
bias"T
output"T" 
Ttype:
2	"-
data_formatstringNHWC:
NHWCNCHW
8
Const
output"dtype"
valuetensor"
dtypetype
^
Fill
dims"
index_type

value"T
output"T"	
Ttype"

index_typetype0:
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
@
ReadVariableOp
resource
value"dtype"
dtypetype
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
Á
StatefulPartitionedCall
args2Tin
output2Tout"
Tin
list(type)("
Tout
list(type)("	
ffunc"
configstring "
config_protostring "
executor_typestring ¨
@
StaticRegexFullMatch	
input

output
"
patternstring
ö
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
°
TensorListFromTensor
tensor"element_dtype
element_shape"
shape_type/
output_handleéèelement_dtype"
element_dtypetype"

shape_typetype:
2	

TensorListReserve
element_shape"
shape_type
num_elements(
handleéèelement_dtype"
element_dtypetype"

shape_typetype:
2	

TensorListStack
input_handle
element_shape
tensor"element_dtype"
element_dtypetype" 
num_elementsintÿÿÿÿÿÿÿÿÿ
P
	Transpose
x"T
perm"Tperm
y"T"	
Ttype"
Tpermtype0:
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

While

input2T
output2T"
T
list(type)("
condfunc"
bodyfunc" 
output_shapeslist(shape)
 "
parallel_iterationsint
"serve*2.8.02v2.8.0-rc1-32-g3f878cff5b68Á°
f
	Adam/iterVarHandleOp*
_output_shapes
: *
dtype0	*
shape: *
shared_name	Adam/iter
_
Adam/iter/Read/ReadVariableOpReadVariableOp	Adam/iter*
_output_shapes
: *
dtype0	
j
Adam/beta_1VarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_nameAdam/beta_1
c
Adam/beta_1/Read/ReadVariableOpReadVariableOpAdam/beta_1*
_output_shapes
: *
dtype0
j
Adam/beta_2VarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_nameAdam/beta_2
c
Adam/beta_2/Read/ReadVariableOpReadVariableOpAdam/beta_2*
_output_shapes
: *
dtype0
h

Adam/decayVarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_name
Adam/decay
a
Adam/decay/Read/ReadVariableOpReadVariableOp
Adam/decay*
_output_shapes
: *
dtype0
x
Adam/learning_rateVarHandleOp*
_output_shapes
: *
dtype0*
shape: *#
shared_nameAdam/learning_rate
q
&Adam/learning_rate/Read/ReadVariableOpReadVariableOpAdam/learning_rate*
_output_shapes
: *
dtype0
ª
'simple_rnn_21/simple_rnn_cell_21/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape
:i*8
shared_name)'simple_rnn_21/simple_rnn_cell_21/kernel
£
;simple_rnn_21/simple_rnn_cell_21/kernel/Read/ReadVariableOpReadVariableOp'simple_rnn_21/simple_rnn_cell_21/kernel*
_output_shapes

:i*
dtype0
¾
1simple_rnn_21/simple_rnn_cell_21/recurrent_kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape
:*B
shared_name31simple_rnn_21/simple_rnn_cell_21/recurrent_kernel
·
Esimple_rnn_21/simple_rnn_cell_21/recurrent_kernel/Read/ReadVariableOpReadVariableOp1simple_rnn_21/simple_rnn_cell_21/recurrent_kernel*
_output_shapes

:*
dtype0
¢
%simple_rnn_21/simple_rnn_cell_21/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:*6
shared_name'%simple_rnn_21/simple_rnn_cell_21/bias

9simple_rnn_21/simple_rnn_cell_21/bias/Read/ReadVariableOpReadVariableOp%simple_rnn_21/simple_rnn_cell_21/bias*
_output_shapes
:*
dtype0
^
totalVarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_nametotal
W
total/Read/ReadVariableOpReadVariableOptotal*
_output_shapes
: *
dtype0
^
countVarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_namecount
W
count/Read/ReadVariableOpReadVariableOpcount*
_output_shapes
: *
dtype0
¸
.Adam/simple_rnn_21/simple_rnn_cell_21/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape
:i*?
shared_name0.Adam/simple_rnn_21/simple_rnn_cell_21/kernel/m
±
BAdam/simple_rnn_21/simple_rnn_cell_21/kernel/m/Read/ReadVariableOpReadVariableOp.Adam/simple_rnn_21/simple_rnn_cell_21/kernel/m*
_output_shapes

:i*
dtype0
Ì
8Adam/simple_rnn_21/simple_rnn_cell_21/recurrent_kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape
:*I
shared_name:8Adam/simple_rnn_21/simple_rnn_cell_21/recurrent_kernel/m
Å
LAdam/simple_rnn_21/simple_rnn_cell_21/recurrent_kernel/m/Read/ReadVariableOpReadVariableOp8Adam/simple_rnn_21/simple_rnn_cell_21/recurrent_kernel/m*
_output_shapes

:*
dtype0
°
,Adam/simple_rnn_21/simple_rnn_cell_21/bias/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:*=
shared_name.,Adam/simple_rnn_21/simple_rnn_cell_21/bias/m
©
@Adam/simple_rnn_21/simple_rnn_cell_21/bias/m/Read/ReadVariableOpReadVariableOp,Adam/simple_rnn_21/simple_rnn_cell_21/bias/m*
_output_shapes
:*
dtype0
¸
.Adam/simple_rnn_21/simple_rnn_cell_21/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape
:i*?
shared_name0.Adam/simple_rnn_21/simple_rnn_cell_21/kernel/v
±
BAdam/simple_rnn_21/simple_rnn_cell_21/kernel/v/Read/ReadVariableOpReadVariableOp.Adam/simple_rnn_21/simple_rnn_cell_21/kernel/v*
_output_shapes

:i*
dtype0
Ì
8Adam/simple_rnn_21/simple_rnn_cell_21/recurrent_kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape
:*I
shared_name:8Adam/simple_rnn_21/simple_rnn_cell_21/recurrent_kernel/v
Å
LAdam/simple_rnn_21/simple_rnn_cell_21/recurrent_kernel/v/Read/ReadVariableOpReadVariableOp8Adam/simple_rnn_21/simple_rnn_cell_21/recurrent_kernel/v*
_output_shapes

:*
dtype0
°
,Adam/simple_rnn_21/simple_rnn_cell_21/bias/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:*=
shared_name.,Adam/simple_rnn_21/simple_rnn_cell_21/bias/v
©
@Adam/simple_rnn_21/simple_rnn_cell_21/bias/v/Read/ReadVariableOpReadVariableOp,Adam/simple_rnn_21/simple_rnn_cell_21/bias/v*
_output_shapes
:*
dtype0

NoOpNoOp
Ù
ConstConst"/device:CPU:0*
_output_shapes
: *
dtype0*
valueB B
ó
layer_with_weights-0
layer-0
	optimizer
	variables
trainable_variables
regularization_losses
	keras_api
__call__
*&call_and_return_all_conditional_losses
	_default_save_signature


signatures*
ª
cell

state_spec
	variables
trainable_variables
regularization_losses
	keras_api
__call__
*&call_and_return_all_conditional_losses*
z
iter

beta_1

beta_2
	decay
learning_ratem8m9m:v;v<v=*

0
1
2*

0
1
2*
* 
°
non_trainable_variables

layers
metrics
layer_regularization_losses
layer_metrics
	variables
trainable_variables
regularization_losses
__call__
	_default_save_signature
*&call_and_return_all_conditional_losses
&"call_and_return_conditional_losses*
* 
* 
* 

 serving_default* 
Ó

kernel
recurrent_kernel
bias
!	variables
"trainable_variables
#regularization_losses
$	keras_api
%_random_generator
&__call__
*'&call_and_return_all_conditional_losses*
* 

0
1
2*

0
1
2*
* 


(states
)non_trainable_variables

*layers
+metrics
,layer_regularization_losses
-layer_metrics
	variables
trainable_variables
regularization_losses
__call__
*&call_and_return_all_conditional_losses
&"call_and_return_conditional_losses*
* 
* 
LF
VARIABLE_VALUE	Adam/iter)optimizer/iter/.ATTRIBUTES/VARIABLE_VALUE*
PJ
VARIABLE_VALUEAdam/beta_1+optimizer/beta_1/.ATTRIBUTES/VARIABLE_VALUE*
PJ
VARIABLE_VALUEAdam/beta_2+optimizer/beta_2/.ATTRIBUTES/VARIABLE_VALUE*
NH
VARIABLE_VALUE
Adam/decay*optimizer/decay/.ATTRIBUTES/VARIABLE_VALUE*
^X
VARIABLE_VALUEAdam/learning_rate2optimizer/learning_rate/.ATTRIBUTES/VARIABLE_VALUE*
ga
VARIABLE_VALUE'simple_rnn_21/simple_rnn_cell_21/kernel&variables/0/.ATTRIBUTES/VARIABLE_VALUE*
qk
VARIABLE_VALUE1simple_rnn_21/simple_rnn_cell_21/recurrent_kernel&variables/1/.ATTRIBUTES/VARIABLE_VALUE*
e_
VARIABLE_VALUE%simple_rnn_21/simple_rnn_cell_21/bias&variables/2/.ATTRIBUTES/VARIABLE_VALUE*
* 

0*

.0*
* 
* 
* 

0
1
2*

0
1
2*
* 

/non_trainable_variables

0layers
1metrics
2layer_regularization_losses
3layer_metrics
!	variables
"trainable_variables
#regularization_losses
&__call__
*'&call_and_return_all_conditional_losses
&'"call_and_return_conditional_losses*
* 
* 
* 
* 
* 

0*
* 
* 
* 
8
	4total
	5count
6	variables
7	keras_api*
* 
* 
* 
* 
* 
SM
VARIABLE_VALUEtotal4keras_api/metrics/0/total/.ATTRIBUTES/VARIABLE_VALUE*
SM
VARIABLE_VALUEcount4keras_api/metrics/0/count/.ATTRIBUTES/VARIABLE_VALUE*

40
51*

6	variables*

VARIABLE_VALUE.Adam/simple_rnn_21/simple_rnn_cell_21/kernel/mBvariables/0/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*

VARIABLE_VALUE8Adam/simple_rnn_21/simple_rnn_cell_21/recurrent_kernel/mBvariables/1/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*

VARIABLE_VALUE,Adam/simple_rnn_21/simple_rnn_cell_21/bias/mBvariables/2/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*

VARIABLE_VALUE.Adam/simple_rnn_21/simple_rnn_cell_21/kernel/vBvariables/0/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*

VARIABLE_VALUE8Adam/simple_rnn_21/simple_rnn_cell_21/recurrent_kernel/vBvariables/1/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*

VARIABLE_VALUE,Adam/simple_rnn_21/simple_rnn_cell_21/bias/vBvariables/2/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*

#serving_default_simple_rnn_21_inputPlaceholder*+
_output_shapes
:ÿÿÿÿÿÿÿÿÿi*
dtype0* 
shape:ÿÿÿÿÿÿÿÿÿi
È
StatefulPartitionedCallStatefulPartitionedCall#serving_default_simple_rnn_21_input'simple_rnn_21/simple_rnn_cell_21/kernel%simple_rnn_21/simple_rnn_cell_21/bias1simple_rnn_21/simple_rnn_cell_21/recurrent_kernel*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*%
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *.
f)R'
%__inference_signature_wrapper_4293308
O
saver_filenamePlaceholder*
_output_shapes
: *
dtype0*
shape: 
ò
StatefulPartitionedCall_1StatefulPartitionedCallsaver_filenameAdam/iter/Read/ReadVariableOpAdam/beta_1/Read/ReadVariableOpAdam/beta_2/Read/ReadVariableOpAdam/decay/Read/ReadVariableOp&Adam/learning_rate/Read/ReadVariableOp;simple_rnn_21/simple_rnn_cell_21/kernel/Read/ReadVariableOpEsimple_rnn_21/simple_rnn_cell_21/recurrent_kernel/Read/ReadVariableOp9simple_rnn_21/simple_rnn_cell_21/bias/Read/ReadVariableOptotal/Read/ReadVariableOpcount/Read/ReadVariableOpBAdam/simple_rnn_21/simple_rnn_cell_21/kernel/m/Read/ReadVariableOpLAdam/simple_rnn_21/simple_rnn_cell_21/recurrent_kernel/m/Read/ReadVariableOp@Adam/simple_rnn_21/simple_rnn_cell_21/bias/m/Read/ReadVariableOpBAdam/simple_rnn_21/simple_rnn_cell_21/kernel/v/Read/ReadVariableOpLAdam/simple_rnn_21/simple_rnn_cell_21/recurrent_kernel/v/Read/ReadVariableOp@Adam/simple_rnn_21/simple_rnn_cell_21/bias/v/Read/ReadVariableOpConst*
Tin
2	*
Tout
2*
_collective_manager_ids
 *
_output_shapes
: * 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *)
f$R"
 __inference__traced_save_4293907
­
StatefulPartitionedCall_2StatefulPartitionedCallsaver_filename	Adam/iterAdam/beta_1Adam/beta_2
Adam/decayAdam/learning_rate'simple_rnn_21/simple_rnn_cell_21/kernel1simple_rnn_21/simple_rnn_cell_21/recurrent_kernel%simple_rnn_21/simple_rnn_cell_21/biastotalcount.Adam/simple_rnn_21/simple_rnn_cell_21/kernel/m8Adam/simple_rnn_21/simple_rnn_cell_21/recurrent_kernel/m,Adam/simple_rnn_21/simple_rnn_cell_21/bias/m.Adam/simple_rnn_21/simple_rnn_cell_21/kernel/v8Adam/simple_rnn_21/simple_rnn_cell_21/recurrent_kernel/v,Adam/simple_rnn_21/simple_rnn_cell_21/bias/v*
Tin
2*
Tout
2*
_collective_manager_ids
 *
_output_shapes
: * 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *,
f'R%
#__inference__traced_restore_4293965Ø
í+
Ò
while_body_4292915
while_while_loop_counter"
while_while_maximum_iterations
while_placeholder
while_placeholder_1
while_placeholder_2
while_strided_slice_1_0W
Swhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor_0K
9while_simple_rnn_cell_21_matmul_readvariableop_resource_0:iH
:while_simple_rnn_cell_21_biasadd_readvariableop_resource_0:M
;while_simple_rnn_cell_21_matmul_1_readvariableop_resource_0:
while_identity
while_identity_1
while_identity_2
while_identity_3
while_identity_4
while_strided_slice_1U
Qwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensorI
7while_simple_rnn_cell_21_matmul_readvariableop_resource:iF
8while_simple_rnn_cell_21_biasadd_readvariableop_resource:K
9while_simple_rnn_cell_21_matmul_1_readvariableop_resource:¢/while/simple_rnn_cell_21/BiasAdd/ReadVariableOp¢.while/simple_rnn_cell_21/MatMul/ReadVariableOp¢0while/simple_rnn_cell_21/MatMul_1/ReadVariableOp
7while/TensorArrayV2Read/TensorListGetItem/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"ÿÿÿÿi   ¦
)while/TensorArrayV2Read/TensorListGetItemTensorListGetItemSwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor_0while_placeholder@while/TensorArrayV2Read/TensorListGetItem/element_shape:output:0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿi*
element_dtype0¨
.while/simple_rnn_cell_21/MatMul/ReadVariableOpReadVariableOp9while_simple_rnn_cell_21_matmul_readvariableop_resource_0*
_output_shapes

:i*
dtype0Å
while/simple_rnn_cell_21/MatMulMatMul0while/TensorArrayV2Read/TensorListGetItem:item:06while/simple_rnn_cell_21/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ¦
/while/simple_rnn_cell_21/BiasAdd/ReadVariableOpReadVariableOp:while_simple_rnn_cell_21_biasadd_readvariableop_resource_0*
_output_shapes
:*
dtype0Á
 while/simple_rnn_cell_21/BiasAddBiasAdd)while/simple_rnn_cell_21/MatMul:product:07while/simple_rnn_cell_21/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ¬
0while/simple_rnn_cell_21/MatMul_1/ReadVariableOpReadVariableOp;while_simple_rnn_cell_21_matmul_1_readvariableop_resource_0*
_output_shapes

:*
dtype0¬
!while/simple_rnn_cell_21/MatMul_1MatMulwhile_placeholder_28while/simple_rnn_cell_21/MatMul_1/ReadVariableOp:value:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ¯
while/simple_rnn_cell_21/addAddV2)while/simple_rnn_cell_21/BiasAdd:output:0+while/simple_rnn_cell_21/MatMul_1:product:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿÉ
*while/TensorArrayV2Write/TensorListSetItemTensorListSetItemwhile_placeholder_1while_placeholder while/simple_rnn_cell_21/add:z:0*
_output_shapes
: *
element_dtype0:éèÒM
while/add/yConst*
_output_shapes
: *
dtype0*
value	B :\
	while/addAddV2while_placeholderwhile/add/y:output:0*
T0*
_output_shapes
: O
while/add_1/yConst*
_output_shapes
: *
dtype0*
value	B :g
while/add_1AddV2while_while_loop_counterwhile/add_1/y:output:0*
T0*
_output_shapes
: Y
while/IdentityIdentitywhile/add_1:z:0^while/NoOp*
T0*
_output_shapes
: j
while/Identity_1Identitywhile_while_maximum_iterations^while/NoOp*
T0*
_output_shapes
: Y
while/Identity_2Identitywhile/add:z:0^while/NoOp*
T0*
_output_shapes
: 
while/Identity_3Identity:while/TensorArrayV2Write/TensorListSetItem:output_handle:0^while/NoOp*
T0*
_output_shapes
: :éèÒ}
while/Identity_4Identity while/simple_rnn_cell_21/add:z:0^while/NoOp*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿâ

while/NoOpNoOp0^while/simple_rnn_cell_21/BiasAdd/ReadVariableOp/^while/simple_rnn_cell_21/MatMul/ReadVariableOp1^while/simple_rnn_cell_21/MatMul_1/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 ")
while_identitywhile/Identity:output:0"-
while_identity_1while/Identity_1:output:0"-
while_identity_2while/Identity_2:output:0"-
while_identity_3while/Identity_3:output:0"-
while_identity_4while/Identity_4:output:0"v
8while_simple_rnn_cell_21_biasadd_readvariableop_resource:while_simple_rnn_cell_21_biasadd_readvariableop_resource_0"x
9while_simple_rnn_cell_21_matmul_1_readvariableop_resource;while_simple_rnn_cell_21_matmul_1_readvariableop_resource_0"t
7while_simple_rnn_cell_21_matmul_readvariableop_resource9while_simple_rnn_cell_21_matmul_readvariableop_resource_0"0
while_strided_slice_1while_strided_slice_1_0"¨
Qwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensorSwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor_0*(
_construction_contextkEagerRuntime*8
_input_shapes'
%: : : : :ÿÿÿÿÿÿÿÿÿ: : : : : 2b
/while/simple_rnn_cell_21/BiasAdd/ReadVariableOp/while/simple_rnn_cell_21/BiasAdd/ReadVariableOp2`
.while/simple_rnn_cell_21/MatMul/ReadVariableOp.while/simple_rnn_cell_21/MatMul/ReadVariableOp2d
0while/simple_rnn_cell_21/MatMul_1/ReadVariableOp0while/simple_rnn_cell_21/MatMul_1/ReadVariableOp: 

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :-)
'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ:

_output_shapes
: :

_output_shapes
: 
óI
¥
J__inference_sequential_20_layer_call_and_return_conditional_losses_4293295

inputsQ
?simple_rnn_21_simple_rnn_cell_21_matmul_readvariableop_resource:iN
@simple_rnn_21_simple_rnn_cell_21_biasadd_readvariableop_resource:S
Asimple_rnn_21_simple_rnn_cell_21_matmul_1_readvariableop_resource:
identity¢7simple_rnn_21/simple_rnn_cell_21/BiasAdd/ReadVariableOp¢6simple_rnn_21/simple_rnn_cell_21/MatMul/ReadVariableOp¢8simple_rnn_21/simple_rnn_cell_21/MatMul_1/ReadVariableOp¢simple_rnn_21/whileI
simple_rnn_21/ShapeShapeinputs*
T0*
_output_shapes
:k
!simple_rnn_21/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: m
#simple_rnn_21/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:m
#simple_rnn_21/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
simple_rnn_21/strided_sliceStridedSlicesimple_rnn_21/Shape:output:0*simple_rnn_21/strided_slice/stack:output:0,simple_rnn_21/strided_slice/stack_1:output:0,simple_rnn_21/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask^
simple_rnn_21/zeros/packed/1Const*
_output_shapes
: *
dtype0*
value	B :
simple_rnn_21/zeros/packedPack$simple_rnn_21/strided_slice:output:0%simple_rnn_21/zeros/packed/1:output:0*
N*
T0*
_output_shapes
:^
simple_rnn_21/zeros/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    
simple_rnn_21/zerosFill#simple_rnn_21/zeros/packed:output:0"simple_rnn_21/zeros/Const:output:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿq
simple_rnn_21/transpose/permConst*
_output_shapes
:*
dtype0*!
valueB"          
simple_rnn_21/transpose	Transposeinputs%simple_rnn_21/transpose/perm:output:0*
T0*+
_output_shapes
:ÿÿÿÿÿÿÿÿÿi`
simple_rnn_21/Shape_1Shapesimple_rnn_21/transpose:y:0*
T0*
_output_shapes
:m
#simple_rnn_21/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: o
%simple_rnn_21/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:o
%simple_rnn_21/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:¡
simple_rnn_21/strided_slice_1StridedSlicesimple_rnn_21/Shape_1:output:0,simple_rnn_21/strided_slice_1/stack:output:0.simple_rnn_21/strided_slice_1/stack_1:output:0.simple_rnn_21/strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskt
)simple_rnn_21/TensorArrayV2/element_shapeConst*
_output_shapes
: *
dtype0*
valueB :
ÿÿÿÿÿÿÿÿÿÞ
simple_rnn_21/TensorArrayV2TensorListReserve2simple_rnn_21/TensorArrayV2/element_shape:output:0&simple_rnn_21/strided_slice_1:output:0*
_output_shapes
: *
element_dtype0*

shape_type0:éèÒ
Csimple_rnn_21/TensorArrayUnstack/TensorListFromTensor/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"ÿÿÿÿi   
5simple_rnn_21/TensorArrayUnstack/TensorListFromTensorTensorListFromTensorsimple_rnn_21/transpose:y:0Lsimple_rnn_21/TensorArrayUnstack/TensorListFromTensor/element_shape:output:0*
_output_shapes
: *
element_dtype0*

shape_type0:éèÒm
#simple_rnn_21/strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB: o
%simple_rnn_21/strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:o
%simple_rnn_21/strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:¯
simple_rnn_21/strided_slice_2StridedSlicesimple_rnn_21/transpose:y:0,simple_rnn_21/strided_slice_2/stack:output:0.simple_rnn_21/strided_slice_2/stack_1:output:0.simple_rnn_21/strided_slice_2/stack_2:output:0*
Index0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿi*
shrink_axis_mask¶
6simple_rnn_21/simple_rnn_cell_21/MatMul/ReadVariableOpReadVariableOp?simple_rnn_21_simple_rnn_cell_21_matmul_readvariableop_resource*
_output_shapes

:i*
dtype0Ë
'simple_rnn_21/simple_rnn_cell_21/MatMulMatMul&simple_rnn_21/strided_slice_2:output:0>simple_rnn_21/simple_rnn_cell_21/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ´
7simple_rnn_21/simple_rnn_cell_21/BiasAdd/ReadVariableOpReadVariableOp@simple_rnn_21_simple_rnn_cell_21_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0Ù
(simple_rnn_21/simple_rnn_cell_21/BiasAddBiasAdd1simple_rnn_21/simple_rnn_cell_21/MatMul:product:0?simple_rnn_21/simple_rnn_cell_21/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿº
8simple_rnn_21/simple_rnn_cell_21/MatMul_1/ReadVariableOpReadVariableOpAsimple_rnn_21_simple_rnn_cell_21_matmul_1_readvariableop_resource*
_output_shapes

:*
dtype0Å
)simple_rnn_21/simple_rnn_cell_21/MatMul_1MatMulsimple_rnn_21/zeros:output:0@simple_rnn_21/simple_rnn_cell_21/MatMul_1/ReadVariableOp:value:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿÇ
$simple_rnn_21/simple_rnn_cell_21/addAddV21simple_rnn_21/simple_rnn_cell_21/BiasAdd:output:03simple_rnn_21/simple_rnn_cell_21/MatMul_1:product:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ|
+simple_rnn_21/TensorArrayV2_1/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"ÿÿÿÿ   â
simple_rnn_21/TensorArrayV2_1TensorListReserve4simple_rnn_21/TensorArrayV2_1/element_shape:output:0&simple_rnn_21/strided_slice_1:output:0*
_output_shapes
: *
element_dtype0*

shape_type0:éèÒT
simple_rnn_21/timeConst*
_output_shapes
: *
dtype0*
value	B : q
&simple_rnn_21/while/maximum_iterationsConst*
_output_shapes
: *
dtype0*
valueB :
ÿÿÿÿÿÿÿÿÿb
 simple_rnn_21/while/loop_counterConst*
_output_shapes
: *
dtype0*
value	B : 
simple_rnn_21/whileWhile)simple_rnn_21/while/loop_counter:output:0/simple_rnn_21/while/maximum_iterations:output:0simple_rnn_21/time:output:0&simple_rnn_21/TensorArrayV2_1:handle:0simple_rnn_21/zeros:output:0&simple_rnn_21/strided_slice_1:output:0Esimple_rnn_21/TensorArrayUnstack/TensorListFromTensor:output_handle:0?simple_rnn_21_simple_rnn_cell_21_matmul_readvariableop_resource@simple_rnn_21_simple_rnn_cell_21_biasadd_readvariableop_resourceAsimple_rnn_21_simple_rnn_cell_21_matmul_1_readvariableop_resource*
T
2
*
_lower_using_switch_merge(*
_num_original_outputs
*9
_output_shapes'
%: : : : :ÿÿÿÿÿÿÿÿÿ: : : : : *%
_read_only_resource_inputs
	*
_stateful_parallelism( *,
body$R"
 simple_rnn_21_while_body_4293230*,
cond$R"
 simple_rnn_21_while_cond_4293229*8
output_shapes'
%: : : : :ÿÿÿÿÿÿÿÿÿ: : : : : *
parallel_iterations 
>simple_rnn_21/TensorArrayV2Stack/TensorListStack/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"ÿÿÿÿ   ì
0simple_rnn_21/TensorArrayV2Stack/TensorListStackTensorListStacksimple_rnn_21/while:output:3Gsimple_rnn_21/TensorArrayV2Stack/TensorListStack/element_shape:output:0*+
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
element_dtype0v
#simple_rnn_21/strided_slice_3/stackConst*
_output_shapes
:*
dtype0*
valueB:
ÿÿÿÿÿÿÿÿÿo
%simple_rnn_21/strided_slice_3/stack_1Const*
_output_shapes
:*
dtype0*
valueB: o
%simple_rnn_21/strided_slice_3/stack_2Const*
_output_shapes
:*
dtype0*
valueB:Í
simple_rnn_21/strided_slice_3StridedSlice9simple_rnn_21/TensorArrayV2Stack/TensorListStack:tensor:0,simple_rnn_21/strided_slice_3/stack:output:0.simple_rnn_21/strided_slice_3/stack_1:output:0.simple_rnn_21/strided_slice_3/stack_2:output:0*
Index0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
shrink_axis_masks
simple_rnn_21/transpose_1/permConst*
_output_shapes
:*
dtype0*!
valueB"          À
simple_rnn_21/transpose_1	Transpose9simple_rnn_21/TensorArrayV2Stack/TensorListStack:tensor:0'simple_rnn_21/transpose_1/perm:output:0*
T0*+
_output_shapes
:ÿÿÿÿÿÿÿÿÿu
IdentityIdentity&simple_rnn_21/strided_slice_3:output:0^NoOp*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
NoOpNoOp8^simple_rnn_21/simple_rnn_cell_21/BiasAdd/ReadVariableOp7^simple_rnn_21/simple_rnn_cell_21/MatMul/ReadVariableOp9^simple_rnn_21/simple_rnn_cell_21/MatMul_1/ReadVariableOp^simple_rnn_21/while*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*0
_input_shapes
:ÿÿÿÿÿÿÿÿÿi: : : 2r
7simple_rnn_21/simple_rnn_cell_21/BiasAdd/ReadVariableOp7simple_rnn_21/simple_rnn_cell_21/BiasAdd/ReadVariableOp2p
6simple_rnn_21/simple_rnn_cell_21/MatMul/ReadVariableOp6simple_rnn_21/simple_rnn_cell_21/MatMul/ReadVariableOp2t
8simple_rnn_21/simple_rnn_cell_21/MatMul_1/ReadVariableOp8simple_rnn_21/simple_rnn_cell_21/MatMul_1/ReadVariableOp2*
simple_rnn_21/whilesimple_rnn_21/while:S O
+
_output_shapes
:ÿÿÿÿÿÿÿÿÿi
 
_user_specified_nameinputs
í+
Ò
while_body_4293711
while_while_loop_counter"
while_while_maximum_iterations
while_placeholder
while_placeholder_1
while_placeholder_2
while_strided_slice_1_0W
Swhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor_0K
9while_simple_rnn_cell_21_matmul_readvariableop_resource_0:iH
:while_simple_rnn_cell_21_biasadd_readvariableop_resource_0:M
;while_simple_rnn_cell_21_matmul_1_readvariableop_resource_0:
while_identity
while_identity_1
while_identity_2
while_identity_3
while_identity_4
while_strided_slice_1U
Qwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensorI
7while_simple_rnn_cell_21_matmul_readvariableop_resource:iF
8while_simple_rnn_cell_21_biasadd_readvariableop_resource:K
9while_simple_rnn_cell_21_matmul_1_readvariableop_resource:¢/while/simple_rnn_cell_21/BiasAdd/ReadVariableOp¢.while/simple_rnn_cell_21/MatMul/ReadVariableOp¢0while/simple_rnn_cell_21/MatMul_1/ReadVariableOp
7while/TensorArrayV2Read/TensorListGetItem/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"ÿÿÿÿi   ¦
)while/TensorArrayV2Read/TensorListGetItemTensorListGetItemSwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor_0while_placeholder@while/TensorArrayV2Read/TensorListGetItem/element_shape:output:0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿi*
element_dtype0¨
.while/simple_rnn_cell_21/MatMul/ReadVariableOpReadVariableOp9while_simple_rnn_cell_21_matmul_readvariableop_resource_0*
_output_shapes

:i*
dtype0Å
while/simple_rnn_cell_21/MatMulMatMul0while/TensorArrayV2Read/TensorListGetItem:item:06while/simple_rnn_cell_21/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ¦
/while/simple_rnn_cell_21/BiasAdd/ReadVariableOpReadVariableOp:while_simple_rnn_cell_21_biasadd_readvariableop_resource_0*
_output_shapes
:*
dtype0Á
 while/simple_rnn_cell_21/BiasAddBiasAdd)while/simple_rnn_cell_21/MatMul:product:07while/simple_rnn_cell_21/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ¬
0while/simple_rnn_cell_21/MatMul_1/ReadVariableOpReadVariableOp;while_simple_rnn_cell_21_matmul_1_readvariableop_resource_0*
_output_shapes

:*
dtype0¬
!while/simple_rnn_cell_21/MatMul_1MatMulwhile_placeholder_28while/simple_rnn_cell_21/MatMul_1/ReadVariableOp:value:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ¯
while/simple_rnn_cell_21/addAddV2)while/simple_rnn_cell_21/BiasAdd:output:0+while/simple_rnn_cell_21/MatMul_1:product:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿÉ
*while/TensorArrayV2Write/TensorListSetItemTensorListSetItemwhile_placeholder_1while_placeholder while/simple_rnn_cell_21/add:z:0*
_output_shapes
: *
element_dtype0:éèÒM
while/add/yConst*
_output_shapes
: *
dtype0*
value	B :\
	while/addAddV2while_placeholderwhile/add/y:output:0*
T0*
_output_shapes
: O
while/add_1/yConst*
_output_shapes
: *
dtype0*
value	B :g
while/add_1AddV2while_while_loop_counterwhile/add_1/y:output:0*
T0*
_output_shapes
: Y
while/IdentityIdentitywhile/add_1:z:0^while/NoOp*
T0*
_output_shapes
: j
while/Identity_1Identitywhile_while_maximum_iterations^while/NoOp*
T0*
_output_shapes
: Y
while/Identity_2Identitywhile/add:z:0^while/NoOp*
T0*
_output_shapes
: 
while/Identity_3Identity:while/TensorArrayV2Write/TensorListSetItem:output_handle:0^while/NoOp*
T0*
_output_shapes
: :éèÒ}
while/Identity_4Identity while/simple_rnn_cell_21/add:z:0^while/NoOp*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿâ

while/NoOpNoOp0^while/simple_rnn_cell_21/BiasAdd/ReadVariableOp/^while/simple_rnn_cell_21/MatMul/ReadVariableOp1^while/simple_rnn_cell_21/MatMul_1/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 ")
while_identitywhile/Identity:output:0"-
while_identity_1while/Identity_1:output:0"-
while_identity_2while/Identity_2:output:0"-
while_identity_3while/Identity_3:output:0"-
while_identity_4while/Identity_4:output:0"v
8while_simple_rnn_cell_21_biasadd_readvariableop_resource:while_simple_rnn_cell_21_biasadd_readvariableop_resource_0"x
9while_simple_rnn_cell_21_matmul_1_readvariableop_resource;while_simple_rnn_cell_21_matmul_1_readvariableop_resource_0"t
7while_simple_rnn_cell_21_matmul_readvariableop_resource9while_simple_rnn_cell_21_matmul_readvariableop_resource_0"0
while_strided_slice_1while_strided_slice_1_0"¨
Qwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensorSwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor_0*(
_construction_contextkEagerRuntime*8
_input_shapes'
%: : : : :ÿÿÿÿÿÿÿÿÿ: : : : : 2b
/while/simple_rnn_cell_21/BiasAdd/ReadVariableOp/while/simple_rnn_cell_21/BiasAdd/ReadVariableOp2`
.while/simple_rnn_cell_21/MatMul/ReadVariableOp.while/simple_rnn_cell_21/MatMul/ReadVariableOp2d
0while/simple_rnn_cell_21/MatMul_1/ReadVariableOp0while/simple_rnn_cell_21/MatMul_1/ReadVariableOp: 

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :-)
'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ:

_output_shapes
: :

_output_shapes
: 
º
ì
O__inference_simple_rnn_cell_21_layer_call_and_return_conditional_losses_4293836

inputs
states_00
matmul_readvariableop_resource:i-
biasadd_readvariableop_resource:2
 matmul_1_readvariableop_resource:
identity

identity_1¢BiasAdd/ReadVariableOp¢MatMul/ReadVariableOp¢MatMul_1/ReadVariableOpt
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes

:i*
dtype0i
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿr
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0v
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿx
MatMul_1/ReadVariableOpReadVariableOp matmul_1_readvariableop_resource*
_output_shapes

:*
dtype0o
MatMul_1MatMulstates_0MatMul_1/ReadVariableOp:value:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿd
addAddV2BiasAdd:output:0MatMul_1:product:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿV
IdentityIdentityadd:z:0^NoOp*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿX

Identity_1Identityadd:z:0^NoOp*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp^MatMul_1/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0"!

identity_1Identity_1:output:0*(
_construction_contextkEagerRuntime*?
_input_shapes.
,:ÿÿÿÿÿÿÿÿÿi:ÿÿÿÿÿÿÿÿÿ: : : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp22
MatMul_1/ReadVariableOpMatMul_1/ReadVariableOp:O K
'
_output_shapes
:ÿÿÿÿÿÿÿÿÿi
 
_user_specified_nameinputs:QM
'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
"
_user_specified_name
states/0
Ý8
ö
 simple_rnn_21_while_body_42931248
4simple_rnn_21_while_simple_rnn_21_while_loop_counter>
:simple_rnn_21_while_simple_rnn_21_while_maximum_iterations#
simple_rnn_21_while_placeholder%
!simple_rnn_21_while_placeholder_1%
!simple_rnn_21_while_placeholder_27
3simple_rnn_21_while_simple_rnn_21_strided_slice_1_0s
osimple_rnn_21_while_tensorarrayv2read_tensorlistgetitem_simple_rnn_21_tensorarrayunstack_tensorlistfromtensor_0Y
Gsimple_rnn_21_while_simple_rnn_cell_21_matmul_readvariableop_resource_0:iV
Hsimple_rnn_21_while_simple_rnn_cell_21_biasadd_readvariableop_resource_0:[
Isimple_rnn_21_while_simple_rnn_cell_21_matmul_1_readvariableop_resource_0: 
simple_rnn_21_while_identity"
simple_rnn_21_while_identity_1"
simple_rnn_21_while_identity_2"
simple_rnn_21_while_identity_3"
simple_rnn_21_while_identity_45
1simple_rnn_21_while_simple_rnn_21_strided_slice_1q
msimple_rnn_21_while_tensorarrayv2read_tensorlistgetitem_simple_rnn_21_tensorarrayunstack_tensorlistfromtensorW
Esimple_rnn_21_while_simple_rnn_cell_21_matmul_readvariableop_resource:iT
Fsimple_rnn_21_while_simple_rnn_cell_21_biasadd_readvariableop_resource:Y
Gsimple_rnn_21_while_simple_rnn_cell_21_matmul_1_readvariableop_resource:¢=simple_rnn_21/while/simple_rnn_cell_21/BiasAdd/ReadVariableOp¢<simple_rnn_21/while/simple_rnn_cell_21/MatMul/ReadVariableOp¢>simple_rnn_21/while/simple_rnn_cell_21/MatMul_1/ReadVariableOp
Esimple_rnn_21/while/TensorArrayV2Read/TensorListGetItem/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"ÿÿÿÿi   ì
7simple_rnn_21/while/TensorArrayV2Read/TensorListGetItemTensorListGetItemosimple_rnn_21_while_tensorarrayv2read_tensorlistgetitem_simple_rnn_21_tensorarrayunstack_tensorlistfromtensor_0simple_rnn_21_while_placeholderNsimple_rnn_21/while/TensorArrayV2Read/TensorListGetItem/element_shape:output:0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿi*
element_dtype0Ä
<simple_rnn_21/while/simple_rnn_cell_21/MatMul/ReadVariableOpReadVariableOpGsimple_rnn_21_while_simple_rnn_cell_21_matmul_readvariableop_resource_0*
_output_shapes

:i*
dtype0ï
-simple_rnn_21/while/simple_rnn_cell_21/MatMulMatMul>simple_rnn_21/while/TensorArrayV2Read/TensorListGetItem:item:0Dsimple_rnn_21/while/simple_rnn_cell_21/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿÂ
=simple_rnn_21/while/simple_rnn_cell_21/BiasAdd/ReadVariableOpReadVariableOpHsimple_rnn_21_while_simple_rnn_cell_21_biasadd_readvariableop_resource_0*
_output_shapes
:*
dtype0ë
.simple_rnn_21/while/simple_rnn_cell_21/BiasAddBiasAdd7simple_rnn_21/while/simple_rnn_cell_21/MatMul:product:0Esimple_rnn_21/while/simple_rnn_cell_21/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿÈ
>simple_rnn_21/while/simple_rnn_cell_21/MatMul_1/ReadVariableOpReadVariableOpIsimple_rnn_21_while_simple_rnn_cell_21_matmul_1_readvariableop_resource_0*
_output_shapes

:*
dtype0Ö
/simple_rnn_21/while/simple_rnn_cell_21/MatMul_1MatMul!simple_rnn_21_while_placeholder_2Fsimple_rnn_21/while/simple_rnn_cell_21/MatMul_1/ReadVariableOp:value:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿÙ
*simple_rnn_21/while/simple_rnn_cell_21/addAddV27simple_rnn_21/while/simple_rnn_cell_21/BiasAdd:output:09simple_rnn_21/while/simple_rnn_cell_21/MatMul_1:product:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
8simple_rnn_21/while/TensorArrayV2Write/TensorListSetItemTensorListSetItem!simple_rnn_21_while_placeholder_1simple_rnn_21_while_placeholder.simple_rnn_21/while/simple_rnn_cell_21/add:z:0*
_output_shapes
: *
element_dtype0:éèÒ[
simple_rnn_21/while/add/yConst*
_output_shapes
: *
dtype0*
value	B :
simple_rnn_21/while/addAddV2simple_rnn_21_while_placeholder"simple_rnn_21/while/add/y:output:0*
T0*
_output_shapes
: ]
simple_rnn_21/while/add_1/yConst*
_output_shapes
: *
dtype0*
value	B :
simple_rnn_21/while/add_1AddV24simple_rnn_21_while_simple_rnn_21_while_loop_counter$simple_rnn_21/while/add_1/y:output:0*
T0*
_output_shapes
: 
simple_rnn_21/while/IdentityIdentitysimple_rnn_21/while/add_1:z:0^simple_rnn_21/while/NoOp*
T0*
_output_shapes
: ¢
simple_rnn_21/while/Identity_1Identity:simple_rnn_21_while_simple_rnn_21_while_maximum_iterations^simple_rnn_21/while/NoOp*
T0*
_output_shapes
: 
simple_rnn_21/while/Identity_2Identitysimple_rnn_21/while/add:z:0^simple_rnn_21/while/NoOp*
T0*
_output_shapes
: Ã
simple_rnn_21/while/Identity_3IdentityHsimple_rnn_21/while/TensorArrayV2Write/TensorListSetItem:output_handle:0^simple_rnn_21/while/NoOp*
T0*
_output_shapes
: :éèÒ§
simple_rnn_21/while/Identity_4Identity.simple_rnn_21/while/simple_rnn_cell_21/add:z:0^simple_rnn_21/while/NoOp*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
simple_rnn_21/while/NoOpNoOp>^simple_rnn_21/while/simple_rnn_cell_21/BiasAdd/ReadVariableOp=^simple_rnn_21/while/simple_rnn_cell_21/MatMul/ReadVariableOp?^simple_rnn_21/while/simple_rnn_cell_21/MatMul_1/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "E
simple_rnn_21_while_identity%simple_rnn_21/while/Identity:output:0"I
simple_rnn_21_while_identity_1'simple_rnn_21/while/Identity_1:output:0"I
simple_rnn_21_while_identity_2'simple_rnn_21/while/Identity_2:output:0"I
simple_rnn_21_while_identity_3'simple_rnn_21/while/Identity_3:output:0"I
simple_rnn_21_while_identity_4'simple_rnn_21/while/Identity_4:output:0"h
1simple_rnn_21_while_simple_rnn_21_strided_slice_13simple_rnn_21_while_simple_rnn_21_strided_slice_1_0"
Fsimple_rnn_21_while_simple_rnn_cell_21_biasadd_readvariableop_resourceHsimple_rnn_21_while_simple_rnn_cell_21_biasadd_readvariableop_resource_0"
Gsimple_rnn_21_while_simple_rnn_cell_21_matmul_1_readvariableop_resourceIsimple_rnn_21_while_simple_rnn_cell_21_matmul_1_readvariableop_resource_0"
Esimple_rnn_21_while_simple_rnn_cell_21_matmul_readvariableop_resourceGsimple_rnn_21_while_simple_rnn_cell_21_matmul_readvariableop_resource_0"à
msimple_rnn_21_while_tensorarrayv2read_tensorlistgetitem_simple_rnn_21_tensorarrayunstack_tensorlistfromtensorosimple_rnn_21_while_tensorarrayv2read_tensorlistgetitem_simple_rnn_21_tensorarrayunstack_tensorlistfromtensor_0*(
_construction_contextkEagerRuntime*8
_input_shapes'
%: : : : :ÿÿÿÿÿÿÿÿÿ: : : : : 2~
=simple_rnn_21/while/simple_rnn_cell_21/BiasAdd/ReadVariableOp=simple_rnn_21/while/simple_rnn_cell_21/BiasAdd/ReadVariableOp2|
<simple_rnn_21/while/simple_rnn_cell_21/MatMul/ReadVariableOp<simple_rnn_21/while/simple_rnn_cell_21/MatMul/ReadVariableOp2
>simple_rnn_21/while/simple_rnn_cell_21/MatMul_1/ReadVariableOp>simple_rnn_21/while/simple_rnn_cell_21/MatMul_1/ReadVariableOp: 

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :-)
'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ:

_output_shapes
: :

_output_shapes
: 
Ú

¹
 simple_rnn_21_while_cond_42932298
4simple_rnn_21_while_simple_rnn_21_while_loop_counter>
:simple_rnn_21_while_simple_rnn_21_while_maximum_iterations#
simple_rnn_21_while_placeholder%
!simple_rnn_21_while_placeholder_1%
!simple_rnn_21_while_placeholder_2:
6simple_rnn_21_while_less_simple_rnn_21_strided_slice_1Q
Msimple_rnn_21_while_simple_rnn_21_while_cond_4293229___redundant_placeholder0Q
Msimple_rnn_21_while_simple_rnn_21_while_cond_4293229___redundant_placeholder1Q
Msimple_rnn_21_while_simple_rnn_21_while_cond_4293229___redundant_placeholder2Q
Msimple_rnn_21_while_simple_rnn_21_while_cond_4293229___redundant_placeholder3 
simple_rnn_21_while_identity

simple_rnn_21/while/LessLesssimple_rnn_21_while_placeholder6simple_rnn_21_while_less_simple_rnn_21_strided_slice_1*
T0*
_output_shapes
: g
simple_rnn_21/while/IdentityIdentitysimple_rnn_21/while/Less:z:0*
T0
*
_output_shapes
: "E
simple_rnn_21_while_identity%simple_rnn_21/while/Identity:output:0*(
_construction_contextkEagerRuntime*@
_input_shapes/
-: : : : :ÿÿÿÿÿÿÿÿÿ: ::::: 

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :-)
'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ:

_output_shapes
: :

_output_shapes
:
à<
Ã
J__inference_simple_rnn_21_layer_call_and_return_conditional_losses_4292843

inputsC
1simple_rnn_cell_21_matmul_readvariableop_resource:i@
2simple_rnn_cell_21_biasadd_readvariableop_resource:E
3simple_rnn_cell_21_matmul_1_readvariableop_resource:
identity¢)simple_rnn_cell_21/BiasAdd/ReadVariableOp¢(simple_rnn_cell_21/MatMul/ReadVariableOp¢*simple_rnn_cell_21/MatMul_1/ReadVariableOp¢while;
ShapeShapeinputs*
T0*
_output_shapes
:]
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: _
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:_
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:Ñ
strided_sliceStridedSliceShape:output:0strided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskP
zeros/packed/1Const*
_output_shapes
: *
dtype0*
value	B :s
zeros/packedPackstrided_slice:output:0zeros/packed/1:output:0*
N*
T0*
_output_shapes
:P
zeros/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    l
zerosFillzeros/packed:output:0zeros/Const:output:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿc
transpose/permConst*
_output_shapes
:*
dtype0*!
valueB"          m
	transpose	Transposeinputstranspose/perm:output:0*
T0*+
_output_shapes
:ÿÿÿÿÿÿÿÿÿiD
Shape_1Shapetranspose:y:0*
T0*
_output_shapes
:_
strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: a
strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:Û
strided_slice_1StridedSliceShape_1:output:0strided_slice_1/stack:output:0 strided_slice_1/stack_1:output:0 strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskf
TensorArrayV2/element_shapeConst*
_output_shapes
: *
dtype0*
valueB :
ÿÿÿÿÿÿÿÿÿ´
TensorArrayV2TensorListReserve$TensorArrayV2/element_shape:output:0strided_slice_1:output:0*
_output_shapes
: *
element_dtype0*

shape_type0:éèÒ
5TensorArrayUnstack/TensorListFromTensor/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"ÿÿÿÿi   à
'TensorArrayUnstack/TensorListFromTensorTensorListFromTensortranspose:y:0>TensorArrayUnstack/TensorListFromTensor/element_shape:output:0*
_output_shapes
: *
element_dtype0*

shape_type0:éèÒ_
strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB: a
strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:é
strided_slice_2StridedSlicetranspose:y:0strided_slice_2/stack:output:0 strided_slice_2/stack_1:output:0 strided_slice_2/stack_2:output:0*
Index0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿi*
shrink_axis_mask
(simple_rnn_cell_21/MatMul/ReadVariableOpReadVariableOp1simple_rnn_cell_21_matmul_readvariableop_resource*
_output_shapes

:i*
dtype0¡
simple_rnn_cell_21/MatMulMatMulstrided_slice_2:output:00simple_rnn_cell_21/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
)simple_rnn_cell_21/BiasAdd/ReadVariableOpReadVariableOp2simple_rnn_cell_21_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0¯
simple_rnn_cell_21/BiasAddBiasAdd#simple_rnn_cell_21/MatMul:product:01simple_rnn_cell_21/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
*simple_rnn_cell_21/MatMul_1/ReadVariableOpReadVariableOp3simple_rnn_cell_21_matmul_1_readvariableop_resource*
_output_shapes

:*
dtype0
simple_rnn_cell_21/MatMul_1MatMulzeros:output:02simple_rnn_cell_21/MatMul_1/ReadVariableOp:value:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
simple_rnn_cell_21/addAddV2#simple_rnn_cell_21/BiasAdd:output:0%simple_rnn_cell_21/MatMul_1:product:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿn
TensorArrayV2_1/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"ÿÿÿÿ   ¸
TensorArrayV2_1TensorListReserve&TensorArrayV2_1/element_shape:output:0strided_slice_1:output:0*
_output_shapes
: *
element_dtype0*

shape_type0:éèÒF
timeConst*
_output_shapes
: *
dtype0*
value	B : c
while/maximum_iterationsConst*
_output_shapes
: *
dtype0*
valueB :
ÿÿÿÿÿÿÿÿÿT
while/loop_counterConst*
_output_shapes
: *
dtype0*
value	B : Ý
whileWhilewhile/loop_counter:output:0!while/maximum_iterations:output:0time:output:0TensorArrayV2_1:handle:0zeros:output:0strided_slice_1:output:07TensorArrayUnstack/TensorListFromTensor:output_handle:01simple_rnn_cell_21_matmul_readvariableop_resource2simple_rnn_cell_21_biasadd_readvariableop_resource3simple_rnn_cell_21_matmul_1_readvariableop_resource*
T
2
*
_lower_using_switch_merge(*
_num_original_outputs
*9
_output_shapes'
%: : : : :ÿÿÿÿÿÿÿÿÿ: : : : : *%
_read_only_resource_inputs
	*
_stateful_parallelism( *
bodyR
while_body_4292778*
condR
while_cond_4292777*8
output_shapes'
%: : : : :ÿÿÿÿÿÿÿÿÿ: : : : : *
parallel_iterations 
0TensorArrayV2Stack/TensorListStack/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"ÿÿÿÿ   Â
"TensorArrayV2Stack/TensorListStackTensorListStackwhile:output:39TensorArrayV2Stack/TensorListStack/element_shape:output:0*+
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
element_dtype0h
strided_slice_3/stackConst*
_output_shapes
:*
dtype0*
valueB:
ÿÿÿÿÿÿÿÿÿa
strided_slice_3/stack_1Const*
_output_shapes
:*
dtype0*
valueB: a
strided_slice_3/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
strided_slice_3StridedSlice+TensorArrayV2Stack/TensorListStack:tensor:0strided_slice_3/stack:output:0 strided_slice_3/stack_1:output:0 strided_slice_3/stack_2:output:0*
Index0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
shrink_axis_maske
transpose_1/permConst*
_output_shapes
:*
dtype0*!
valueB"          
transpose_1	Transpose+TensorArrayV2Stack/TensorListStack:tensor:0transpose_1/perm:output:0*
T0*+
_output_shapes
:ÿÿÿÿÿÿÿÿÿg
IdentityIdentitystrided_slice_3:output:0^NoOp*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿÒ
NoOpNoOp*^simple_rnn_cell_21/BiasAdd/ReadVariableOp)^simple_rnn_cell_21/MatMul/ReadVariableOp+^simple_rnn_cell_21/MatMul_1/ReadVariableOp^while*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*0
_input_shapes
:ÿÿÿÿÿÿÿÿÿi: : : 2V
)simple_rnn_cell_21/BiasAdd/ReadVariableOp)simple_rnn_cell_21/BiasAdd/ReadVariableOp2T
(simple_rnn_cell_21/MatMul/ReadVariableOp(simple_rnn_cell_21/MatMul/ReadVariableOp2X
*simple_rnn_cell_21/MatMul_1/ReadVariableOp*simple_rnn_cell_21/MatMul_1/ReadVariableOp2
whilewhile:S O
+
_output_shapes
:ÿÿÿÿÿÿÿÿÿi
 
_user_specified_nameinputs

¹
/__inference_simple_rnn_21_layer_call_fn_4293352

inputs
unknown:i
	unknown_0:
	unknown_1:
identity¢StatefulPartitionedCallì
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*%
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *S
fNRL
J__inference_simple_rnn_21_layer_call_and_return_conditional_losses_4292980o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*0
_input_shapes
:ÿÿÿÿÿÿÿÿÿi: : : 22
StatefulPartitionedCallStatefulPartitionedCall:S O
+
_output_shapes
:ÿÿÿÿÿÿÿÿÿi
 
_user_specified_nameinputs

¹
/__inference_sequential_20_layer_call_fn_4293072

inputs
unknown:i
	unknown_0:
	unknown_1:
identity¢StatefulPartitionedCallì
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*%
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *S
fNRL
J__inference_sequential_20_layer_call_and_return_conditional_losses_4292852o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*0
_input_shapes
:ÿÿÿÿÿÿÿÿÿi: : : 22
StatefulPartitionedCallStatefulPartitionedCall:S O
+
_output_shapes
:ÿÿÿÿÿÿÿÿÿi
 
_user_specified_nameinputs
©
Æ
/__inference_sequential_20_layer_call_fn_4293033
simple_rnn_21_input
unknown:i
	unknown_0:
	unknown_1:
identity¢StatefulPartitionedCallù
StatefulPartitionedCallStatefulPartitionedCallsimple_rnn_21_inputunknown	unknown_0	unknown_1*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*%
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *S
fNRL
J__inference_sequential_20_layer_call_and_return_conditional_losses_4293013o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*0
_input_shapes
:ÿÿÿÿÿÿÿÿÿi: : : 22
StatefulPartitionedCallStatefulPartitionedCall:` \
+
_output_shapes
:ÿÿÿÿÿÿÿÿÿi
-
_user_specified_namesimple_rnn_21_input
½	

J__inference_sequential_20_layer_call_and_return_conditional_losses_4293013

inputs'
simple_rnn_21_4293005:i#
simple_rnn_21_4293007:'
simple_rnn_21_4293009:
identity¢%simple_rnn_21/StatefulPartitionedCall 
%simple_rnn_21/StatefulPartitionedCallStatefulPartitionedCallinputssimple_rnn_21_4293005simple_rnn_21_4293007simple_rnn_21_4293009*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*%
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *S
fNRL
J__inference_simple_rnn_21_layer_call_and_return_conditional_losses_4292980}
IdentityIdentity.simple_rnn_21/StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿn
NoOpNoOp&^simple_rnn_21/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*0
_input_shapes
:ÿÿÿÿÿÿÿÿÿi: : : 2N
%simple_rnn_21/StatefulPartitionedCall%simple_rnn_21/StatefulPartitionedCall:S O
+
_output_shapes
:ÿÿÿÿÿÿÿÿÿi
 
_user_specified_nameinputs
í+
Ò
while_body_4293605
while_while_loop_counter"
while_while_maximum_iterations
while_placeholder
while_placeholder_1
while_placeholder_2
while_strided_slice_1_0W
Swhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor_0K
9while_simple_rnn_cell_21_matmul_readvariableop_resource_0:iH
:while_simple_rnn_cell_21_biasadd_readvariableop_resource_0:M
;while_simple_rnn_cell_21_matmul_1_readvariableop_resource_0:
while_identity
while_identity_1
while_identity_2
while_identity_3
while_identity_4
while_strided_slice_1U
Qwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensorI
7while_simple_rnn_cell_21_matmul_readvariableop_resource:iF
8while_simple_rnn_cell_21_biasadd_readvariableop_resource:K
9while_simple_rnn_cell_21_matmul_1_readvariableop_resource:¢/while/simple_rnn_cell_21/BiasAdd/ReadVariableOp¢.while/simple_rnn_cell_21/MatMul/ReadVariableOp¢0while/simple_rnn_cell_21/MatMul_1/ReadVariableOp
7while/TensorArrayV2Read/TensorListGetItem/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"ÿÿÿÿi   ¦
)while/TensorArrayV2Read/TensorListGetItemTensorListGetItemSwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor_0while_placeholder@while/TensorArrayV2Read/TensorListGetItem/element_shape:output:0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿi*
element_dtype0¨
.while/simple_rnn_cell_21/MatMul/ReadVariableOpReadVariableOp9while_simple_rnn_cell_21_matmul_readvariableop_resource_0*
_output_shapes

:i*
dtype0Å
while/simple_rnn_cell_21/MatMulMatMul0while/TensorArrayV2Read/TensorListGetItem:item:06while/simple_rnn_cell_21/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ¦
/while/simple_rnn_cell_21/BiasAdd/ReadVariableOpReadVariableOp:while_simple_rnn_cell_21_biasadd_readvariableop_resource_0*
_output_shapes
:*
dtype0Á
 while/simple_rnn_cell_21/BiasAddBiasAdd)while/simple_rnn_cell_21/MatMul:product:07while/simple_rnn_cell_21/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ¬
0while/simple_rnn_cell_21/MatMul_1/ReadVariableOpReadVariableOp;while_simple_rnn_cell_21_matmul_1_readvariableop_resource_0*
_output_shapes

:*
dtype0¬
!while/simple_rnn_cell_21/MatMul_1MatMulwhile_placeholder_28while/simple_rnn_cell_21/MatMul_1/ReadVariableOp:value:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ¯
while/simple_rnn_cell_21/addAddV2)while/simple_rnn_cell_21/BiasAdd:output:0+while/simple_rnn_cell_21/MatMul_1:product:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿÉ
*while/TensorArrayV2Write/TensorListSetItemTensorListSetItemwhile_placeholder_1while_placeholder while/simple_rnn_cell_21/add:z:0*
_output_shapes
: *
element_dtype0:éèÒM
while/add/yConst*
_output_shapes
: *
dtype0*
value	B :\
	while/addAddV2while_placeholderwhile/add/y:output:0*
T0*
_output_shapes
: O
while/add_1/yConst*
_output_shapes
: *
dtype0*
value	B :g
while/add_1AddV2while_while_loop_counterwhile/add_1/y:output:0*
T0*
_output_shapes
: Y
while/IdentityIdentitywhile/add_1:z:0^while/NoOp*
T0*
_output_shapes
: j
while/Identity_1Identitywhile_while_maximum_iterations^while/NoOp*
T0*
_output_shapes
: Y
while/Identity_2Identitywhile/add:z:0^while/NoOp*
T0*
_output_shapes
: 
while/Identity_3Identity:while/TensorArrayV2Write/TensorListSetItem:output_handle:0^while/NoOp*
T0*
_output_shapes
: :éèÒ}
while/Identity_4Identity while/simple_rnn_cell_21/add:z:0^while/NoOp*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿâ

while/NoOpNoOp0^while/simple_rnn_cell_21/BiasAdd/ReadVariableOp/^while/simple_rnn_cell_21/MatMul/ReadVariableOp1^while/simple_rnn_cell_21/MatMul_1/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 ")
while_identitywhile/Identity:output:0"-
while_identity_1while/Identity_1:output:0"-
while_identity_2while/Identity_2:output:0"-
while_identity_3while/Identity_3:output:0"-
while_identity_4while/Identity_4:output:0"v
8while_simple_rnn_cell_21_biasadd_readvariableop_resource:while_simple_rnn_cell_21_biasadd_readvariableop_resource_0"x
9while_simple_rnn_cell_21_matmul_1_readvariableop_resource;while_simple_rnn_cell_21_matmul_1_readvariableop_resource_0"t
7while_simple_rnn_cell_21_matmul_readvariableop_resource9while_simple_rnn_cell_21_matmul_readvariableop_resource_0"0
while_strided_slice_1while_strided_slice_1_0"¨
Qwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensorSwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor_0*(
_construction_contextkEagerRuntime*8
_input_shapes'
%: : : : :ÿÿÿÿÿÿÿÿÿ: : : : : 2b
/while/simple_rnn_cell_21/BiasAdd/ReadVariableOp/while/simple_rnn_cell_21/BiasAdd/ReadVariableOp2`
.while/simple_rnn_cell_21/MatMul/ReadVariableOp.while/simple_rnn_cell_21/MatMul/ReadVariableOp2d
0while/simple_rnn_cell_21/MatMul_1/ReadVariableOp0while/simple_rnn_cell_21/MatMul_1/ReadVariableOp: 

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :-)
'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ:

_output_shapes
: :

_output_shapes
: 
ß
¯
while_cond_4292500
while_while_loop_counter"
while_while_maximum_iterations
while_placeholder
while_placeholder_1
while_placeholder_2
while_less_strided_slice_15
1while_while_cond_4292500___redundant_placeholder05
1while_while_cond_4292500___redundant_placeholder15
1while_while_cond_4292500___redundant_placeholder25
1while_while_cond_4292500___redundant_placeholder3
while_identity
b

while/LessLesswhile_placeholderwhile_less_strided_slice_1*
T0*
_output_shapes
: K
while/IdentityIdentitywhile/Less:z:0*
T0
*
_output_shapes
: ")
while_identitywhile/Identity:output:0*(
_construction_contextkEagerRuntime*@
_input_shapes/
-: : : : :ÿÿÿÿÿÿÿÿÿ: ::::: 

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :-)
'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ:

_output_shapes
: :

_output_shapes
:
½

Ü
4__inference_simple_rnn_cell_21_layer_call_fn_4293804

inputs
states_0
unknown:i
	unknown_0:
	unknown_1:
identity

identity_1¢StatefulPartitionedCall
StatefulPartitionedCallStatefulPartitionedCallinputsstates_0unknown	unknown_0	unknown_1*
Tin	
2*
Tout
2*
_collective_manager_ids
 *:
_output_shapes(
&:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ*%
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *X
fSRQ
O__inference_simple_rnn_cell_21_layer_call_and_return_conditional_losses_4292607o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿq

Identity_1Identity StatefulPartitionedCall:output:1^NoOp*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0"!

identity_1Identity_1:output:0*(
_construction_contextkEagerRuntime*?
_input_shapes.
,:ÿÿÿÿÿÿÿÿÿi:ÿÿÿÿÿÿÿÿÿ: : : 22
StatefulPartitionedCallStatefulPartitionedCall:O K
'
_output_shapes
:ÿÿÿÿÿÿÿÿÿi
 
_user_specified_nameinputs:QM
'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
"
_user_specified_name
states/0
E
´
#__inference__traced_restore_4293965
file_prefix$
assignvariableop_adam_iter:	 (
assignvariableop_1_adam_beta_1: (
assignvariableop_2_adam_beta_2: '
assignvariableop_3_adam_decay: /
%assignvariableop_4_adam_learning_rate: L
:assignvariableop_5_simple_rnn_21_simple_rnn_cell_21_kernel:iV
Dassignvariableop_6_simple_rnn_21_simple_rnn_cell_21_recurrent_kernel:F
8assignvariableop_7_simple_rnn_21_simple_rnn_cell_21_bias:"
assignvariableop_8_total: "
assignvariableop_9_count: T
Bassignvariableop_10_adam_simple_rnn_21_simple_rnn_cell_21_kernel_m:i^
Lassignvariableop_11_adam_simple_rnn_21_simple_rnn_cell_21_recurrent_kernel_m:N
@assignvariableop_12_adam_simple_rnn_21_simple_rnn_cell_21_bias_m:T
Bassignvariableop_13_adam_simple_rnn_21_simple_rnn_cell_21_kernel_v:i^
Lassignvariableop_14_adam_simple_rnn_21_simple_rnn_cell_21_recurrent_kernel_v:N
@assignvariableop_15_adam_simple_rnn_21_simple_rnn_cell_21_bias_v:
identity_17¢AssignVariableOp¢AssignVariableOp_1¢AssignVariableOp_10¢AssignVariableOp_11¢AssignVariableOp_12¢AssignVariableOp_13¢AssignVariableOp_14¢AssignVariableOp_15¢AssignVariableOp_2¢AssignVariableOp_3¢AssignVariableOp_4¢AssignVariableOp_5¢AssignVariableOp_6¢AssignVariableOp_7¢AssignVariableOp_8¢AssignVariableOp_9î
RestoreV2/tensor_namesConst"/device:CPU:0*
_output_shapes
:*
dtype0*
valueBB)optimizer/iter/.ATTRIBUTES/VARIABLE_VALUEB+optimizer/beta_1/.ATTRIBUTES/VARIABLE_VALUEB+optimizer/beta_2/.ATTRIBUTES/VARIABLE_VALUEB*optimizer/decay/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/learning_rate/.ATTRIBUTES/VARIABLE_VALUEB&variables/0/.ATTRIBUTES/VARIABLE_VALUEB&variables/1/.ATTRIBUTES/VARIABLE_VALUEB&variables/2/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/0/total/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/0/count/.ATTRIBUTES/VARIABLE_VALUEBBvariables/0/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBBvariables/1/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBBvariables/2/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBBvariables/0/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBBvariables/1/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBBvariables/2/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEB_CHECKPOINTABLE_OBJECT_GRAPH
RestoreV2/shape_and_slicesConst"/device:CPU:0*
_output_shapes
:*
dtype0*5
value,B*B B B B B B B B B B B B B B B B B ó
	RestoreV2	RestoreV2file_prefixRestoreV2/tensor_names:output:0#RestoreV2/shape_and_slices:output:0"/device:CPU:0*X
_output_shapesF
D:::::::::::::::::*
dtypes
2	[
IdentityIdentityRestoreV2:tensors:0"/device:CPU:0*
T0	*
_output_shapes
:
AssignVariableOpAssignVariableOpassignvariableop_adam_iterIdentity:output:0"/device:CPU:0*
_output_shapes
 *
dtype0	]

Identity_1IdentityRestoreV2:tensors:1"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_1AssignVariableOpassignvariableop_1_adam_beta_1Identity_1:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_2IdentityRestoreV2:tensors:2"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_2AssignVariableOpassignvariableop_2_adam_beta_2Identity_2:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_3IdentityRestoreV2:tensors:3"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_3AssignVariableOpassignvariableop_3_adam_decayIdentity_3:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_4IdentityRestoreV2:tensors:4"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_4AssignVariableOp%assignvariableop_4_adam_learning_rateIdentity_4:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_5IdentityRestoreV2:tensors:5"/device:CPU:0*
T0*
_output_shapes
:©
AssignVariableOp_5AssignVariableOp:assignvariableop_5_simple_rnn_21_simple_rnn_cell_21_kernelIdentity_5:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_6IdentityRestoreV2:tensors:6"/device:CPU:0*
T0*
_output_shapes
:³
AssignVariableOp_6AssignVariableOpDassignvariableop_6_simple_rnn_21_simple_rnn_cell_21_recurrent_kernelIdentity_6:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_7IdentityRestoreV2:tensors:7"/device:CPU:0*
T0*
_output_shapes
:§
AssignVariableOp_7AssignVariableOp8assignvariableop_7_simple_rnn_21_simple_rnn_cell_21_biasIdentity_7:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_8IdentityRestoreV2:tensors:8"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_8AssignVariableOpassignvariableop_8_totalIdentity_8:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_9IdentityRestoreV2:tensors:9"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_9AssignVariableOpassignvariableop_9_countIdentity_9:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_10IdentityRestoreV2:tensors:10"/device:CPU:0*
T0*
_output_shapes
:³
AssignVariableOp_10AssignVariableOpBassignvariableop_10_adam_simple_rnn_21_simple_rnn_cell_21_kernel_mIdentity_10:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_11IdentityRestoreV2:tensors:11"/device:CPU:0*
T0*
_output_shapes
:½
AssignVariableOp_11AssignVariableOpLassignvariableop_11_adam_simple_rnn_21_simple_rnn_cell_21_recurrent_kernel_mIdentity_11:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_12IdentityRestoreV2:tensors:12"/device:CPU:0*
T0*
_output_shapes
:±
AssignVariableOp_12AssignVariableOp@assignvariableop_12_adam_simple_rnn_21_simple_rnn_cell_21_bias_mIdentity_12:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_13IdentityRestoreV2:tensors:13"/device:CPU:0*
T0*
_output_shapes
:³
AssignVariableOp_13AssignVariableOpBassignvariableop_13_adam_simple_rnn_21_simple_rnn_cell_21_kernel_vIdentity_13:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_14IdentityRestoreV2:tensors:14"/device:CPU:0*
T0*
_output_shapes
:½
AssignVariableOp_14AssignVariableOpLassignvariableop_14_adam_simple_rnn_21_simple_rnn_cell_21_recurrent_kernel_vIdentity_14:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_15IdentityRestoreV2:tensors:15"/device:CPU:0*
T0*
_output_shapes
:±
AssignVariableOp_15AssignVariableOp@assignvariableop_15_adam_simple_rnn_21_simple_rnn_cell_21_bias_vIdentity_15:output:0"/device:CPU:0*
_output_shapes
 *
dtype01
NoOpNoOp"/device:CPU:0*
_output_shapes
 ¯
Identity_16Identityfile_prefix^AssignVariableOp^AssignVariableOp_1^AssignVariableOp_10^AssignVariableOp_11^AssignVariableOp_12^AssignVariableOp_13^AssignVariableOp_14^AssignVariableOp_15^AssignVariableOp_2^AssignVariableOp_3^AssignVariableOp_4^AssignVariableOp_5^AssignVariableOp_6^AssignVariableOp_7^AssignVariableOp_8^AssignVariableOp_9^NoOp"/device:CPU:0*
T0*
_output_shapes
: W
Identity_17IdentityIdentity_16:output:0^NoOp_1*
T0*
_output_shapes
: 
NoOp_1NoOp^AssignVariableOp^AssignVariableOp_1^AssignVariableOp_10^AssignVariableOp_11^AssignVariableOp_12^AssignVariableOp_13^AssignVariableOp_14^AssignVariableOp_15^AssignVariableOp_2^AssignVariableOp_3^AssignVariableOp_4^AssignVariableOp_5^AssignVariableOp_6^AssignVariableOp_7^AssignVariableOp_8^AssignVariableOp_9*"
_acd_function_control_output(*
_output_shapes
 "#
identity_17Identity_17:output:0*5
_input_shapes$
": : : : : : : : : : : : : : : : : 2$
AssignVariableOpAssignVariableOp2(
AssignVariableOp_1AssignVariableOp_12*
AssignVariableOp_10AssignVariableOp_102*
AssignVariableOp_11AssignVariableOp_112*
AssignVariableOp_12AssignVariableOp_122*
AssignVariableOp_13AssignVariableOp_132*
AssignVariableOp_14AssignVariableOp_142*
AssignVariableOp_15AssignVariableOp_152(
AssignVariableOp_2AssignVariableOp_22(
AssignVariableOp_3AssignVariableOp_32(
AssignVariableOp_4AssignVariableOp_42(
AssignVariableOp_5AssignVariableOp_52(
AssignVariableOp_6AssignVariableOp_62(
AssignVariableOp_7AssignVariableOp_72(
AssignVariableOp_8AssignVariableOp_82(
AssignVariableOp_9AssignVariableOp_9:C ?

_output_shapes
: 
%
_user_specified_namefile_prefix
Ú

¹
 simple_rnn_21_while_cond_42931238
4simple_rnn_21_while_simple_rnn_21_while_loop_counter>
:simple_rnn_21_while_simple_rnn_21_while_maximum_iterations#
simple_rnn_21_while_placeholder%
!simple_rnn_21_while_placeholder_1%
!simple_rnn_21_while_placeholder_2:
6simple_rnn_21_while_less_simple_rnn_21_strided_slice_1Q
Msimple_rnn_21_while_simple_rnn_21_while_cond_4293123___redundant_placeholder0Q
Msimple_rnn_21_while_simple_rnn_21_while_cond_4293123___redundant_placeholder1Q
Msimple_rnn_21_while_simple_rnn_21_while_cond_4293123___redundant_placeholder2Q
Msimple_rnn_21_while_simple_rnn_21_while_cond_4293123___redundant_placeholder3 
simple_rnn_21_while_identity

simple_rnn_21/while/LessLesssimple_rnn_21_while_placeholder6simple_rnn_21_while_less_simple_rnn_21_strided_slice_1*
T0*
_output_shapes
: g
simple_rnn_21/while/IdentityIdentitysimple_rnn_21/while/Less:z:0*
T0
*
_output_shapes
: "E
simple_rnn_21_while_identity%simple_rnn_21/while/Identity:output:0*(
_construction_contextkEagerRuntime*@
_input_shapes/
-: : : : :ÿÿÿÿÿÿÿÿÿ: ::::: 

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :-)
'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ:

_output_shapes
: :

_output_shapes
:
Ý8
ö
 simple_rnn_21_while_body_42932308
4simple_rnn_21_while_simple_rnn_21_while_loop_counter>
:simple_rnn_21_while_simple_rnn_21_while_maximum_iterations#
simple_rnn_21_while_placeholder%
!simple_rnn_21_while_placeholder_1%
!simple_rnn_21_while_placeholder_27
3simple_rnn_21_while_simple_rnn_21_strided_slice_1_0s
osimple_rnn_21_while_tensorarrayv2read_tensorlistgetitem_simple_rnn_21_tensorarrayunstack_tensorlistfromtensor_0Y
Gsimple_rnn_21_while_simple_rnn_cell_21_matmul_readvariableop_resource_0:iV
Hsimple_rnn_21_while_simple_rnn_cell_21_biasadd_readvariableop_resource_0:[
Isimple_rnn_21_while_simple_rnn_cell_21_matmul_1_readvariableop_resource_0: 
simple_rnn_21_while_identity"
simple_rnn_21_while_identity_1"
simple_rnn_21_while_identity_2"
simple_rnn_21_while_identity_3"
simple_rnn_21_while_identity_45
1simple_rnn_21_while_simple_rnn_21_strided_slice_1q
msimple_rnn_21_while_tensorarrayv2read_tensorlistgetitem_simple_rnn_21_tensorarrayunstack_tensorlistfromtensorW
Esimple_rnn_21_while_simple_rnn_cell_21_matmul_readvariableop_resource:iT
Fsimple_rnn_21_while_simple_rnn_cell_21_biasadd_readvariableop_resource:Y
Gsimple_rnn_21_while_simple_rnn_cell_21_matmul_1_readvariableop_resource:¢=simple_rnn_21/while/simple_rnn_cell_21/BiasAdd/ReadVariableOp¢<simple_rnn_21/while/simple_rnn_cell_21/MatMul/ReadVariableOp¢>simple_rnn_21/while/simple_rnn_cell_21/MatMul_1/ReadVariableOp
Esimple_rnn_21/while/TensorArrayV2Read/TensorListGetItem/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"ÿÿÿÿi   ì
7simple_rnn_21/while/TensorArrayV2Read/TensorListGetItemTensorListGetItemosimple_rnn_21_while_tensorarrayv2read_tensorlistgetitem_simple_rnn_21_tensorarrayunstack_tensorlistfromtensor_0simple_rnn_21_while_placeholderNsimple_rnn_21/while/TensorArrayV2Read/TensorListGetItem/element_shape:output:0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿi*
element_dtype0Ä
<simple_rnn_21/while/simple_rnn_cell_21/MatMul/ReadVariableOpReadVariableOpGsimple_rnn_21_while_simple_rnn_cell_21_matmul_readvariableop_resource_0*
_output_shapes

:i*
dtype0ï
-simple_rnn_21/while/simple_rnn_cell_21/MatMulMatMul>simple_rnn_21/while/TensorArrayV2Read/TensorListGetItem:item:0Dsimple_rnn_21/while/simple_rnn_cell_21/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿÂ
=simple_rnn_21/while/simple_rnn_cell_21/BiasAdd/ReadVariableOpReadVariableOpHsimple_rnn_21_while_simple_rnn_cell_21_biasadd_readvariableop_resource_0*
_output_shapes
:*
dtype0ë
.simple_rnn_21/while/simple_rnn_cell_21/BiasAddBiasAdd7simple_rnn_21/while/simple_rnn_cell_21/MatMul:product:0Esimple_rnn_21/while/simple_rnn_cell_21/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿÈ
>simple_rnn_21/while/simple_rnn_cell_21/MatMul_1/ReadVariableOpReadVariableOpIsimple_rnn_21_while_simple_rnn_cell_21_matmul_1_readvariableop_resource_0*
_output_shapes

:*
dtype0Ö
/simple_rnn_21/while/simple_rnn_cell_21/MatMul_1MatMul!simple_rnn_21_while_placeholder_2Fsimple_rnn_21/while/simple_rnn_cell_21/MatMul_1/ReadVariableOp:value:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿÙ
*simple_rnn_21/while/simple_rnn_cell_21/addAddV27simple_rnn_21/while/simple_rnn_cell_21/BiasAdd:output:09simple_rnn_21/while/simple_rnn_cell_21/MatMul_1:product:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
8simple_rnn_21/while/TensorArrayV2Write/TensorListSetItemTensorListSetItem!simple_rnn_21_while_placeholder_1simple_rnn_21_while_placeholder.simple_rnn_21/while/simple_rnn_cell_21/add:z:0*
_output_shapes
: *
element_dtype0:éèÒ[
simple_rnn_21/while/add/yConst*
_output_shapes
: *
dtype0*
value	B :
simple_rnn_21/while/addAddV2simple_rnn_21_while_placeholder"simple_rnn_21/while/add/y:output:0*
T0*
_output_shapes
: ]
simple_rnn_21/while/add_1/yConst*
_output_shapes
: *
dtype0*
value	B :
simple_rnn_21/while/add_1AddV24simple_rnn_21_while_simple_rnn_21_while_loop_counter$simple_rnn_21/while/add_1/y:output:0*
T0*
_output_shapes
: 
simple_rnn_21/while/IdentityIdentitysimple_rnn_21/while/add_1:z:0^simple_rnn_21/while/NoOp*
T0*
_output_shapes
: ¢
simple_rnn_21/while/Identity_1Identity:simple_rnn_21_while_simple_rnn_21_while_maximum_iterations^simple_rnn_21/while/NoOp*
T0*
_output_shapes
: 
simple_rnn_21/while/Identity_2Identitysimple_rnn_21/while/add:z:0^simple_rnn_21/while/NoOp*
T0*
_output_shapes
: Ã
simple_rnn_21/while/Identity_3IdentityHsimple_rnn_21/while/TensorArrayV2Write/TensorListSetItem:output_handle:0^simple_rnn_21/while/NoOp*
T0*
_output_shapes
: :éèÒ§
simple_rnn_21/while/Identity_4Identity.simple_rnn_21/while/simple_rnn_cell_21/add:z:0^simple_rnn_21/while/NoOp*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
simple_rnn_21/while/NoOpNoOp>^simple_rnn_21/while/simple_rnn_cell_21/BiasAdd/ReadVariableOp=^simple_rnn_21/while/simple_rnn_cell_21/MatMul/ReadVariableOp?^simple_rnn_21/while/simple_rnn_cell_21/MatMul_1/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "E
simple_rnn_21_while_identity%simple_rnn_21/while/Identity:output:0"I
simple_rnn_21_while_identity_1'simple_rnn_21/while/Identity_1:output:0"I
simple_rnn_21_while_identity_2'simple_rnn_21/while/Identity_2:output:0"I
simple_rnn_21_while_identity_3'simple_rnn_21/while/Identity_3:output:0"I
simple_rnn_21_while_identity_4'simple_rnn_21/while/Identity_4:output:0"h
1simple_rnn_21_while_simple_rnn_21_strided_slice_13simple_rnn_21_while_simple_rnn_21_strided_slice_1_0"
Fsimple_rnn_21_while_simple_rnn_cell_21_biasadd_readvariableop_resourceHsimple_rnn_21_while_simple_rnn_cell_21_biasadd_readvariableop_resource_0"
Gsimple_rnn_21_while_simple_rnn_cell_21_matmul_1_readvariableop_resourceIsimple_rnn_21_while_simple_rnn_cell_21_matmul_1_readvariableop_resource_0"
Esimple_rnn_21_while_simple_rnn_cell_21_matmul_readvariableop_resourceGsimple_rnn_21_while_simple_rnn_cell_21_matmul_readvariableop_resource_0"à
msimple_rnn_21_while_tensorarrayv2read_tensorlistgetitem_simple_rnn_21_tensorarrayunstack_tensorlistfromtensorosimple_rnn_21_while_tensorarrayv2read_tensorlistgetitem_simple_rnn_21_tensorarrayunstack_tensorlistfromtensor_0*(
_construction_contextkEagerRuntime*8
_input_shapes'
%: : : : :ÿÿÿÿÿÿÿÿÿ: : : : : 2~
=simple_rnn_21/while/simple_rnn_cell_21/BiasAdd/ReadVariableOp=simple_rnn_21/while/simple_rnn_cell_21/BiasAdd/ReadVariableOp2|
<simple_rnn_21/while/simple_rnn_cell_21/MatMul/ReadVariableOp<simple_rnn_21/while/simple_rnn_cell_21/MatMul/ReadVariableOp2
>simple_rnn_21/while/simple_rnn_cell_21/MatMul_1/ReadVariableOp>simple_rnn_21/while/simple_rnn_cell_21/MatMul_1/ReadVariableOp: 

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :-)
'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ:

_output_shapes
: :

_output_shapes
: 
ß
¯
while_cond_4292914
while_while_loop_counter"
while_while_maximum_iterations
while_placeholder
while_placeholder_1
while_placeholder_2
while_less_strided_slice_15
1while_while_cond_4292914___redundant_placeholder05
1while_while_cond_4292914___redundant_placeholder15
1while_while_cond_4292914___redundant_placeholder25
1while_while_cond_4292914___redundant_placeholder3
while_identity
b

while/LessLesswhile_placeholderwhile_less_strided_slice_1*
T0*
_output_shapes
: K
while/IdentityIdentitywhile/Less:z:0*
T0
*
_output_shapes
: ")
while_identitywhile/Identity:output:0*(
_construction_contextkEagerRuntime*@
_input_shapes/
-: : : : :ÿÿÿÿÿÿÿÿÿ: ::::: 

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :-)
'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ:

_output_shapes
: :

_output_shapes
:
´
ê
O__inference_simple_rnn_cell_21_layer_call_and_return_conditional_losses_4292607

inputs

states0
matmul_readvariableop_resource:i-
biasadd_readvariableop_resource:2
 matmul_1_readvariableop_resource:
identity

identity_1¢BiasAdd/ReadVariableOp¢MatMul/ReadVariableOp¢MatMul_1/ReadVariableOpt
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes

:i*
dtype0i
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿr
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0v
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿx
MatMul_1/ReadVariableOpReadVariableOp matmul_1_readvariableop_resource*
_output_shapes

:*
dtype0m
MatMul_1MatMulstatesMatMul_1/ReadVariableOp:value:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿd
addAddV2BiasAdd:output:0MatMul_1:product:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿV
IdentityIdentityadd:z:0^NoOp*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿX

Identity_1Identityadd:z:0^NoOp*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp^MatMul_1/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0"!

identity_1Identity_1:output:0*(
_construction_contextkEagerRuntime*?
_input_shapes.
,:ÿÿÿÿÿÿÿÿÿi:ÿÿÿÿÿÿÿÿÿ: : : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp22
MatMul_1/ReadVariableOpMatMul_1/ReadVariableOp:O K
'
_output_shapes
:ÿÿÿÿÿÿÿÿÿi
 
_user_specified_nameinputs:OK
'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
 
_user_specified_namestates
±!
ß
while_body_4292659
while_while_loop_counter"
while_while_maximum_iterations
while_placeholder
while_placeholder_1
while_placeholder_2
while_strided_slice_1_0W
Swhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor_04
"while_simple_rnn_cell_21_4292681_0:i0
"while_simple_rnn_cell_21_4292683_0:4
"while_simple_rnn_cell_21_4292685_0:
while_identity
while_identity_1
while_identity_2
while_identity_3
while_identity_4
while_strided_slice_1U
Qwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor2
 while_simple_rnn_cell_21_4292681:i.
 while_simple_rnn_cell_21_4292683:2
 while_simple_rnn_cell_21_4292685:¢0while/simple_rnn_cell_21/StatefulPartitionedCall
7while/TensorArrayV2Read/TensorListGetItem/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"ÿÿÿÿi   ¦
)while/TensorArrayV2Read/TensorListGetItemTensorListGetItemSwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor_0while_placeholder@while/TensorArrayV2Read/TensorListGetItem/element_shape:output:0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿi*
element_dtype0«
0while/simple_rnn_cell_21/StatefulPartitionedCallStatefulPartitionedCall0while/TensorArrayV2Read/TensorListGetItem:item:0while_placeholder_2"while_simple_rnn_cell_21_4292681_0"while_simple_rnn_cell_21_4292683_0"while_simple_rnn_cell_21_4292685_0*
Tin	
2*
Tout
2*
_collective_manager_ids
 *:
_output_shapes(
&:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ*%
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *X
fSRQ
O__inference_simple_rnn_cell_21_layer_call_and_return_conditional_losses_4292607â
*while/TensorArrayV2Write/TensorListSetItemTensorListSetItemwhile_placeholder_1while_placeholder9while/simple_rnn_cell_21/StatefulPartitionedCall:output:0*
_output_shapes
: *
element_dtype0:éèÒM
while/add/yConst*
_output_shapes
: *
dtype0*
value	B :\
	while/addAddV2while_placeholderwhile/add/y:output:0*
T0*
_output_shapes
: O
while/add_1/yConst*
_output_shapes
: *
dtype0*
value	B :g
while/add_1AddV2while_while_loop_counterwhile/add_1/y:output:0*
T0*
_output_shapes
: Y
while/IdentityIdentitywhile/add_1:z:0^while/NoOp*
T0*
_output_shapes
: j
while/Identity_1Identitywhile_while_maximum_iterations^while/NoOp*
T0*
_output_shapes
: Y
while/Identity_2Identitywhile/add:z:0^while/NoOp*
T0*
_output_shapes
: 
while/Identity_3Identity:while/TensorArrayV2Write/TensorListSetItem:output_handle:0^while/NoOp*
T0*
_output_shapes
: :éèÒ
while/Identity_4Identity9while/simple_rnn_cell_21/StatefulPartitionedCall:output:1^while/NoOp*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ

while/NoOpNoOp1^while/simple_rnn_cell_21/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 ")
while_identitywhile/Identity:output:0"-
while_identity_1while/Identity_1:output:0"-
while_identity_2while/Identity_2:output:0"-
while_identity_3while/Identity_3:output:0"-
while_identity_4while/Identity_4:output:0"F
 while_simple_rnn_cell_21_4292681"while_simple_rnn_cell_21_4292681_0"F
 while_simple_rnn_cell_21_4292683"while_simple_rnn_cell_21_4292683_0"F
 while_simple_rnn_cell_21_4292685"while_simple_rnn_cell_21_4292685_0"0
while_strided_slice_1while_strided_slice_1_0"¨
Qwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensorSwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor_0*(
_construction_contextkEagerRuntime*8
_input_shapes'
%: : : : :ÿÿÿÿÿÿÿÿÿ: : : : : 2d
0while/simple_rnn_cell_21/StatefulPartitionedCall0while/simple_rnn_cell_21/StatefulPartitionedCall: 

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :-)
'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ:

_output_shapes
: :

_output_shapes
: 
ß
¯
while_cond_4293604
while_while_loop_counter"
while_while_maximum_iterations
while_placeholder
while_placeholder_1
while_placeholder_2
while_less_strided_slice_15
1while_while_cond_4293604___redundant_placeholder05
1while_while_cond_4293604___redundant_placeholder15
1while_while_cond_4293604___redundant_placeholder25
1while_while_cond_4293604___redundant_placeholder3
while_identity
b

while/LessLesswhile_placeholderwhile_less_strided_slice_1*
T0*
_output_shapes
: K
while/IdentityIdentitywhile/Less:z:0*
T0
*
_output_shapes
: ")
while_identitywhile/Identity:output:0*(
_construction_contextkEagerRuntime*@
_input_shapes/
-: : : : :ÿÿÿÿÿÿÿÿÿ: ::::: 

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :-)
'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ:

_output_shapes
: :

_output_shapes
:
í+
Ò
while_body_4293499
while_while_loop_counter"
while_while_maximum_iterations
while_placeholder
while_placeholder_1
while_placeholder_2
while_strided_slice_1_0W
Swhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor_0K
9while_simple_rnn_cell_21_matmul_readvariableop_resource_0:iH
:while_simple_rnn_cell_21_biasadd_readvariableop_resource_0:M
;while_simple_rnn_cell_21_matmul_1_readvariableop_resource_0:
while_identity
while_identity_1
while_identity_2
while_identity_3
while_identity_4
while_strided_slice_1U
Qwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensorI
7while_simple_rnn_cell_21_matmul_readvariableop_resource:iF
8while_simple_rnn_cell_21_biasadd_readvariableop_resource:K
9while_simple_rnn_cell_21_matmul_1_readvariableop_resource:¢/while/simple_rnn_cell_21/BiasAdd/ReadVariableOp¢.while/simple_rnn_cell_21/MatMul/ReadVariableOp¢0while/simple_rnn_cell_21/MatMul_1/ReadVariableOp
7while/TensorArrayV2Read/TensorListGetItem/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"ÿÿÿÿi   ¦
)while/TensorArrayV2Read/TensorListGetItemTensorListGetItemSwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor_0while_placeholder@while/TensorArrayV2Read/TensorListGetItem/element_shape:output:0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿi*
element_dtype0¨
.while/simple_rnn_cell_21/MatMul/ReadVariableOpReadVariableOp9while_simple_rnn_cell_21_matmul_readvariableop_resource_0*
_output_shapes

:i*
dtype0Å
while/simple_rnn_cell_21/MatMulMatMul0while/TensorArrayV2Read/TensorListGetItem:item:06while/simple_rnn_cell_21/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ¦
/while/simple_rnn_cell_21/BiasAdd/ReadVariableOpReadVariableOp:while_simple_rnn_cell_21_biasadd_readvariableop_resource_0*
_output_shapes
:*
dtype0Á
 while/simple_rnn_cell_21/BiasAddBiasAdd)while/simple_rnn_cell_21/MatMul:product:07while/simple_rnn_cell_21/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ¬
0while/simple_rnn_cell_21/MatMul_1/ReadVariableOpReadVariableOp;while_simple_rnn_cell_21_matmul_1_readvariableop_resource_0*
_output_shapes

:*
dtype0¬
!while/simple_rnn_cell_21/MatMul_1MatMulwhile_placeholder_28while/simple_rnn_cell_21/MatMul_1/ReadVariableOp:value:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ¯
while/simple_rnn_cell_21/addAddV2)while/simple_rnn_cell_21/BiasAdd:output:0+while/simple_rnn_cell_21/MatMul_1:product:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿÉ
*while/TensorArrayV2Write/TensorListSetItemTensorListSetItemwhile_placeholder_1while_placeholder while/simple_rnn_cell_21/add:z:0*
_output_shapes
: *
element_dtype0:éèÒM
while/add/yConst*
_output_shapes
: *
dtype0*
value	B :\
	while/addAddV2while_placeholderwhile/add/y:output:0*
T0*
_output_shapes
: O
while/add_1/yConst*
_output_shapes
: *
dtype0*
value	B :g
while/add_1AddV2while_while_loop_counterwhile/add_1/y:output:0*
T0*
_output_shapes
: Y
while/IdentityIdentitywhile/add_1:z:0^while/NoOp*
T0*
_output_shapes
: j
while/Identity_1Identitywhile_while_maximum_iterations^while/NoOp*
T0*
_output_shapes
: Y
while/Identity_2Identitywhile/add:z:0^while/NoOp*
T0*
_output_shapes
: 
while/Identity_3Identity:while/TensorArrayV2Write/TensorListSetItem:output_handle:0^while/NoOp*
T0*
_output_shapes
: :éèÒ}
while/Identity_4Identity while/simple_rnn_cell_21/add:z:0^while/NoOp*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿâ

while/NoOpNoOp0^while/simple_rnn_cell_21/BiasAdd/ReadVariableOp/^while/simple_rnn_cell_21/MatMul/ReadVariableOp1^while/simple_rnn_cell_21/MatMul_1/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 ")
while_identitywhile/Identity:output:0"-
while_identity_1while/Identity_1:output:0"-
while_identity_2while/Identity_2:output:0"-
while_identity_3while/Identity_3:output:0"-
while_identity_4while/Identity_4:output:0"v
8while_simple_rnn_cell_21_biasadd_readvariableop_resource:while_simple_rnn_cell_21_biasadd_readvariableop_resource_0"x
9while_simple_rnn_cell_21_matmul_1_readvariableop_resource;while_simple_rnn_cell_21_matmul_1_readvariableop_resource_0"t
7while_simple_rnn_cell_21_matmul_readvariableop_resource9while_simple_rnn_cell_21_matmul_readvariableop_resource_0"0
while_strided_slice_1while_strided_slice_1_0"¨
Qwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensorSwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor_0*(
_construction_contextkEagerRuntime*8
_input_shapes'
%: : : : :ÿÿÿÿÿÿÿÿÿ: : : : : 2b
/while/simple_rnn_cell_21/BiasAdd/ReadVariableOp/while/simple_rnn_cell_21/BiasAdd/ReadVariableOp2`
.while/simple_rnn_cell_21/MatMul/ReadVariableOp.while/simple_rnn_cell_21/MatMul/ReadVariableOp2d
0while/simple_rnn_cell_21/MatMul_1/ReadVariableOp0while/simple_rnn_cell_21/MatMul_1/ReadVariableOp: 

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :-)
'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ:

_output_shapes
: :

_output_shapes
: 
É,
ã
 __inference__traced_save_4293907
file_prefix(
$savev2_adam_iter_read_readvariableop	*
&savev2_adam_beta_1_read_readvariableop*
&savev2_adam_beta_2_read_readvariableop)
%savev2_adam_decay_read_readvariableop1
-savev2_adam_learning_rate_read_readvariableopF
Bsavev2_simple_rnn_21_simple_rnn_cell_21_kernel_read_readvariableopP
Lsavev2_simple_rnn_21_simple_rnn_cell_21_recurrent_kernel_read_readvariableopD
@savev2_simple_rnn_21_simple_rnn_cell_21_bias_read_readvariableop$
 savev2_total_read_readvariableop$
 savev2_count_read_readvariableopM
Isavev2_adam_simple_rnn_21_simple_rnn_cell_21_kernel_m_read_readvariableopW
Ssavev2_adam_simple_rnn_21_simple_rnn_cell_21_recurrent_kernel_m_read_readvariableopK
Gsavev2_adam_simple_rnn_21_simple_rnn_cell_21_bias_m_read_readvariableopM
Isavev2_adam_simple_rnn_21_simple_rnn_cell_21_kernel_v_read_readvariableopW
Ssavev2_adam_simple_rnn_21_simple_rnn_cell_21_recurrent_kernel_v_read_readvariableopK
Gsavev2_adam_simple_rnn_21_simple_rnn_cell_21_bias_v_read_readvariableop
savev2_const

identity_1¢MergeV2Checkpointsw
StaticRegexFullMatchStaticRegexFullMatchfile_prefix"/device:CPU:**
_output_shapes
: *
pattern
^s3://.*Z
ConstConst"/device:CPU:**
_output_shapes
: *
dtype0*
valueB B.parta
Const_1Const"/device:CPU:**
_output_shapes
: *
dtype0*
valueB B
_temp/part
SelectSelectStaticRegexFullMatch:output:0Const:output:0Const_1:output:0"/device:CPU:**
T0*
_output_shapes
: f

StringJoin
StringJoinfile_prefixSelect:output:0"/device:CPU:**
N*
_output_shapes
: L

num_shardsConst*
_output_shapes
: *
dtype0*
value	B :f
ShardedFilename/shardConst"/device:CPU:0*
_output_shapes
: *
dtype0*
value	B : 
ShardedFilenameShardedFilenameStringJoin:output:0ShardedFilename/shard:output:0num_shards:output:0"/device:CPU:0*
_output_shapes
: ë
SaveV2/tensor_namesConst"/device:CPU:0*
_output_shapes
:*
dtype0*
valueBB)optimizer/iter/.ATTRIBUTES/VARIABLE_VALUEB+optimizer/beta_1/.ATTRIBUTES/VARIABLE_VALUEB+optimizer/beta_2/.ATTRIBUTES/VARIABLE_VALUEB*optimizer/decay/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/learning_rate/.ATTRIBUTES/VARIABLE_VALUEB&variables/0/.ATTRIBUTES/VARIABLE_VALUEB&variables/1/.ATTRIBUTES/VARIABLE_VALUEB&variables/2/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/0/total/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/0/count/.ATTRIBUTES/VARIABLE_VALUEBBvariables/0/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBBvariables/1/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBBvariables/2/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBBvariables/0/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBBvariables/1/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBBvariables/2/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEB_CHECKPOINTABLE_OBJECT_GRAPH
SaveV2/shape_and_slicesConst"/device:CPU:0*
_output_shapes
:*
dtype0*5
value,B*B B B B B B B B B B B B B B B B B ö
SaveV2SaveV2ShardedFilename:filename:0SaveV2/tensor_names:output:0 SaveV2/shape_and_slices:output:0$savev2_adam_iter_read_readvariableop&savev2_adam_beta_1_read_readvariableop&savev2_adam_beta_2_read_readvariableop%savev2_adam_decay_read_readvariableop-savev2_adam_learning_rate_read_readvariableopBsavev2_simple_rnn_21_simple_rnn_cell_21_kernel_read_readvariableopLsavev2_simple_rnn_21_simple_rnn_cell_21_recurrent_kernel_read_readvariableop@savev2_simple_rnn_21_simple_rnn_cell_21_bias_read_readvariableop savev2_total_read_readvariableop savev2_count_read_readvariableopIsavev2_adam_simple_rnn_21_simple_rnn_cell_21_kernel_m_read_readvariableopSsavev2_adam_simple_rnn_21_simple_rnn_cell_21_recurrent_kernel_m_read_readvariableopGsavev2_adam_simple_rnn_21_simple_rnn_cell_21_bias_m_read_readvariableopIsavev2_adam_simple_rnn_21_simple_rnn_cell_21_kernel_v_read_readvariableopSsavev2_adam_simple_rnn_21_simple_rnn_cell_21_recurrent_kernel_v_read_readvariableopGsavev2_adam_simple_rnn_21_simple_rnn_cell_21_bias_v_read_readvariableopsavev2_const"/device:CPU:0*
_output_shapes
 *
dtypes
2	
&MergeV2Checkpoints/checkpoint_prefixesPackShardedFilename:filename:0^SaveV2"/device:CPU:0*
N*
T0*
_output_shapes
:
MergeV2CheckpointsMergeV2Checkpoints/MergeV2Checkpoints/checkpoint_prefixes:output:0file_prefix"/device:CPU:0*
_output_shapes
 f
IdentityIdentityfile_prefix^MergeV2Checkpoints"/device:CPU:0*
T0*
_output_shapes
: Q

Identity_1IdentityIdentity:output:0^NoOp*
T0*
_output_shapes
: [
NoOpNoOp^MergeV2Checkpoints*"
_acd_function_control_output(*
_output_shapes
 "!

identity_1Identity_1:output:0*s
_input_shapesb
`: : : : : : :i::: : :i:::i::: 2(
MergeV2CheckpointsMergeV2Checkpoints:C ?

_output_shapes
: 
%
_user_specified_namefile_prefix:

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :$ 

_output_shapes

:i:$ 

_output_shapes

:: 

_output_shapes
::	

_output_shapes
: :


_output_shapes
: :$ 

_output_shapes

:i:$ 

_output_shapes

:: 

_output_shapes
::$ 

_output_shapes

:i:$ 

_output_shapes

:: 

_output_shapes
::

_output_shapes
: 
í+
Ò
while_body_4293393
while_while_loop_counter"
while_while_maximum_iterations
while_placeholder
while_placeholder_1
while_placeholder_2
while_strided_slice_1_0W
Swhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor_0K
9while_simple_rnn_cell_21_matmul_readvariableop_resource_0:iH
:while_simple_rnn_cell_21_biasadd_readvariableop_resource_0:M
;while_simple_rnn_cell_21_matmul_1_readvariableop_resource_0:
while_identity
while_identity_1
while_identity_2
while_identity_3
while_identity_4
while_strided_slice_1U
Qwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensorI
7while_simple_rnn_cell_21_matmul_readvariableop_resource:iF
8while_simple_rnn_cell_21_biasadd_readvariableop_resource:K
9while_simple_rnn_cell_21_matmul_1_readvariableop_resource:¢/while/simple_rnn_cell_21/BiasAdd/ReadVariableOp¢.while/simple_rnn_cell_21/MatMul/ReadVariableOp¢0while/simple_rnn_cell_21/MatMul_1/ReadVariableOp
7while/TensorArrayV2Read/TensorListGetItem/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"ÿÿÿÿi   ¦
)while/TensorArrayV2Read/TensorListGetItemTensorListGetItemSwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor_0while_placeholder@while/TensorArrayV2Read/TensorListGetItem/element_shape:output:0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿi*
element_dtype0¨
.while/simple_rnn_cell_21/MatMul/ReadVariableOpReadVariableOp9while_simple_rnn_cell_21_matmul_readvariableop_resource_0*
_output_shapes

:i*
dtype0Å
while/simple_rnn_cell_21/MatMulMatMul0while/TensorArrayV2Read/TensorListGetItem:item:06while/simple_rnn_cell_21/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ¦
/while/simple_rnn_cell_21/BiasAdd/ReadVariableOpReadVariableOp:while_simple_rnn_cell_21_biasadd_readvariableop_resource_0*
_output_shapes
:*
dtype0Á
 while/simple_rnn_cell_21/BiasAddBiasAdd)while/simple_rnn_cell_21/MatMul:product:07while/simple_rnn_cell_21/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ¬
0while/simple_rnn_cell_21/MatMul_1/ReadVariableOpReadVariableOp;while_simple_rnn_cell_21_matmul_1_readvariableop_resource_0*
_output_shapes

:*
dtype0¬
!while/simple_rnn_cell_21/MatMul_1MatMulwhile_placeholder_28while/simple_rnn_cell_21/MatMul_1/ReadVariableOp:value:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ¯
while/simple_rnn_cell_21/addAddV2)while/simple_rnn_cell_21/BiasAdd:output:0+while/simple_rnn_cell_21/MatMul_1:product:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿÉ
*while/TensorArrayV2Write/TensorListSetItemTensorListSetItemwhile_placeholder_1while_placeholder while/simple_rnn_cell_21/add:z:0*
_output_shapes
: *
element_dtype0:éèÒM
while/add/yConst*
_output_shapes
: *
dtype0*
value	B :\
	while/addAddV2while_placeholderwhile/add/y:output:0*
T0*
_output_shapes
: O
while/add_1/yConst*
_output_shapes
: *
dtype0*
value	B :g
while/add_1AddV2while_while_loop_counterwhile/add_1/y:output:0*
T0*
_output_shapes
: Y
while/IdentityIdentitywhile/add_1:z:0^while/NoOp*
T0*
_output_shapes
: j
while/Identity_1Identitywhile_while_maximum_iterations^while/NoOp*
T0*
_output_shapes
: Y
while/Identity_2Identitywhile/add:z:0^while/NoOp*
T0*
_output_shapes
: 
while/Identity_3Identity:while/TensorArrayV2Write/TensorListSetItem:output_handle:0^while/NoOp*
T0*
_output_shapes
: :éèÒ}
while/Identity_4Identity while/simple_rnn_cell_21/add:z:0^while/NoOp*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿâ

while/NoOpNoOp0^while/simple_rnn_cell_21/BiasAdd/ReadVariableOp/^while/simple_rnn_cell_21/MatMul/ReadVariableOp1^while/simple_rnn_cell_21/MatMul_1/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 ")
while_identitywhile/Identity:output:0"-
while_identity_1while/Identity_1:output:0"-
while_identity_2while/Identity_2:output:0"-
while_identity_3while/Identity_3:output:0"-
while_identity_4while/Identity_4:output:0"v
8while_simple_rnn_cell_21_biasadd_readvariableop_resource:while_simple_rnn_cell_21_biasadd_readvariableop_resource_0"x
9while_simple_rnn_cell_21_matmul_1_readvariableop_resource;while_simple_rnn_cell_21_matmul_1_readvariableop_resource_0"t
7while_simple_rnn_cell_21_matmul_readvariableop_resource9while_simple_rnn_cell_21_matmul_readvariableop_resource_0"0
while_strided_slice_1while_strided_slice_1_0"¨
Qwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensorSwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor_0*(
_construction_contextkEagerRuntime*8
_input_shapes'
%: : : : :ÿÿÿÿÿÿÿÿÿ: : : : : 2b
/while/simple_rnn_cell_21/BiasAdd/ReadVariableOp/while/simple_rnn_cell_21/BiasAdd/ReadVariableOp2`
.while/simple_rnn_cell_21/MatMul/ReadVariableOp.while/simple_rnn_cell_21/MatMul/ReadVariableOp2d
0while/simple_rnn_cell_21/MatMul_1/ReadVariableOp0while/simple_rnn_cell_21/MatMul_1/ReadVariableOp: 

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :-)
'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ:

_output_shapes
: :

_output_shapes
: 
ä	

J__inference_sequential_20_layer_call_and_return_conditional_losses_4293055
simple_rnn_21_input'
simple_rnn_21_4293047:i#
simple_rnn_21_4293049:'
simple_rnn_21_4293051:
identity¢%simple_rnn_21/StatefulPartitionedCall­
%simple_rnn_21/StatefulPartitionedCallStatefulPartitionedCallsimple_rnn_21_inputsimple_rnn_21_4293047simple_rnn_21_4293049simple_rnn_21_4293051*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*%
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *S
fNRL
J__inference_simple_rnn_21_layer_call_and_return_conditional_losses_4292980}
IdentityIdentity.simple_rnn_21/StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿn
NoOpNoOp&^simple_rnn_21/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*0
_input_shapes
:ÿÿÿÿÿÿÿÿÿi: : : 2N
%simple_rnn_21/StatefulPartitionedCall%simple_rnn_21/StatefulPartitionedCall:` \
+
_output_shapes
:ÿÿÿÿÿÿÿÿÿi
-
_user_specified_namesimple_rnn_21_input
÷
¼
%__inference_signature_wrapper_4293308
simple_rnn_21_input
unknown:i
	unknown_0:
	unknown_1:
identity¢StatefulPartitionedCallÑ
StatefulPartitionedCallStatefulPartitionedCallsimple_rnn_21_inputunknown	unknown_0	unknown_1*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*%
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *+
f&R$
"__inference__wrapped_model_4292441o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*0
_input_shapes
:ÿÿÿÿÿÿÿÿÿi: : : 22
StatefulPartitionedCallStatefulPartitionedCall:` \
+
_output_shapes
:ÿÿÿÿÿÿÿÿÿi
-
_user_specified_namesimple_rnn_21_input
W
ì
"__inference__wrapped_model_4292441
simple_rnn_21_input_
Msequential_20_simple_rnn_21_simple_rnn_cell_21_matmul_readvariableop_resource:i\
Nsequential_20_simple_rnn_21_simple_rnn_cell_21_biasadd_readvariableop_resource:a
Osequential_20_simple_rnn_21_simple_rnn_cell_21_matmul_1_readvariableop_resource:
identity¢Esequential_20/simple_rnn_21/simple_rnn_cell_21/BiasAdd/ReadVariableOp¢Dsequential_20/simple_rnn_21/simple_rnn_cell_21/MatMul/ReadVariableOp¢Fsequential_20/simple_rnn_21/simple_rnn_cell_21/MatMul_1/ReadVariableOp¢!sequential_20/simple_rnn_21/whiled
!sequential_20/simple_rnn_21/ShapeShapesimple_rnn_21_input*
T0*
_output_shapes
:y
/sequential_20/simple_rnn_21/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: {
1sequential_20/simple_rnn_21/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:{
1sequential_20/simple_rnn_21/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:Ý
)sequential_20/simple_rnn_21/strided_sliceStridedSlice*sequential_20/simple_rnn_21/Shape:output:08sequential_20/simple_rnn_21/strided_slice/stack:output:0:sequential_20/simple_rnn_21/strided_slice/stack_1:output:0:sequential_20/simple_rnn_21/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskl
*sequential_20/simple_rnn_21/zeros/packed/1Const*
_output_shapes
: *
dtype0*
value	B :Ç
(sequential_20/simple_rnn_21/zeros/packedPack2sequential_20/simple_rnn_21/strided_slice:output:03sequential_20/simple_rnn_21/zeros/packed/1:output:0*
N*
T0*
_output_shapes
:l
'sequential_20/simple_rnn_21/zeros/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    À
!sequential_20/simple_rnn_21/zerosFill1sequential_20/simple_rnn_21/zeros/packed:output:00sequential_20/simple_rnn_21/zeros/Const:output:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
*sequential_20/simple_rnn_21/transpose/permConst*
_output_shapes
:*
dtype0*!
valueB"          ²
%sequential_20/simple_rnn_21/transpose	Transposesimple_rnn_21_input3sequential_20/simple_rnn_21/transpose/perm:output:0*
T0*+
_output_shapes
:ÿÿÿÿÿÿÿÿÿi|
#sequential_20/simple_rnn_21/Shape_1Shape)sequential_20/simple_rnn_21/transpose:y:0*
T0*
_output_shapes
:{
1sequential_20/simple_rnn_21/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: }
3sequential_20/simple_rnn_21/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:}
3sequential_20/simple_rnn_21/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:ç
+sequential_20/simple_rnn_21/strided_slice_1StridedSlice,sequential_20/simple_rnn_21/Shape_1:output:0:sequential_20/simple_rnn_21/strided_slice_1/stack:output:0<sequential_20/simple_rnn_21/strided_slice_1/stack_1:output:0<sequential_20/simple_rnn_21/strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask
7sequential_20/simple_rnn_21/TensorArrayV2/element_shapeConst*
_output_shapes
: *
dtype0*
valueB :
ÿÿÿÿÿÿÿÿÿ
)sequential_20/simple_rnn_21/TensorArrayV2TensorListReserve@sequential_20/simple_rnn_21/TensorArrayV2/element_shape:output:04sequential_20/simple_rnn_21/strided_slice_1:output:0*
_output_shapes
: *
element_dtype0*

shape_type0:éèÒ¢
Qsequential_20/simple_rnn_21/TensorArrayUnstack/TensorListFromTensor/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"ÿÿÿÿi   ´
Csequential_20/simple_rnn_21/TensorArrayUnstack/TensorListFromTensorTensorListFromTensor)sequential_20/simple_rnn_21/transpose:y:0Zsequential_20/simple_rnn_21/TensorArrayUnstack/TensorListFromTensor/element_shape:output:0*
_output_shapes
: *
element_dtype0*

shape_type0:éèÒ{
1sequential_20/simple_rnn_21/strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB: }
3sequential_20/simple_rnn_21/strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:}
3sequential_20/simple_rnn_21/strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:õ
+sequential_20/simple_rnn_21/strided_slice_2StridedSlice)sequential_20/simple_rnn_21/transpose:y:0:sequential_20/simple_rnn_21/strided_slice_2/stack:output:0<sequential_20/simple_rnn_21/strided_slice_2/stack_1:output:0<sequential_20/simple_rnn_21/strided_slice_2/stack_2:output:0*
Index0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿi*
shrink_axis_maskÒ
Dsequential_20/simple_rnn_21/simple_rnn_cell_21/MatMul/ReadVariableOpReadVariableOpMsequential_20_simple_rnn_21_simple_rnn_cell_21_matmul_readvariableop_resource*
_output_shapes

:i*
dtype0õ
5sequential_20/simple_rnn_21/simple_rnn_cell_21/MatMulMatMul4sequential_20/simple_rnn_21/strided_slice_2:output:0Lsequential_20/simple_rnn_21/simple_rnn_cell_21/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿÐ
Esequential_20/simple_rnn_21/simple_rnn_cell_21/BiasAdd/ReadVariableOpReadVariableOpNsequential_20_simple_rnn_21_simple_rnn_cell_21_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0
6sequential_20/simple_rnn_21/simple_rnn_cell_21/BiasAddBiasAdd?sequential_20/simple_rnn_21/simple_rnn_cell_21/MatMul:product:0Msequential_20/simple_rnn_21/simple_rnn_cell_21/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿÖ
Fsequential_20/simple_rnn_21/simple_rnn_cell_21/MatMul_1/ReadVariableOpReadVariableOpOsequential_20_simple_rnn_21_simple_rnn_cell_21_matmul_1_readvariableop_resource*
_output_shapes

:*
dtype0ï
7sequential_20/simple_rnn_21/simple_rnn_cell_21/MatMul_1MatMul*sequential_20/simple_rnn_21/zeros:output:0Nsequential_20/simple_rnn_21/simple_rnn_cell_21/MatMul_1/ReadVariableOp:value:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿñ
2sequential_20/simple_rnn_21/simple_rnn_cell_21/addAddV2?sequential_20/simple_rnn_21/simple_rnn_cell_21/BiasAdd:output:0Asequential_20/simple_rnn_21/simple_rnn_cell_21/MatMul_1:product:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
9sequential_20/simple_rnn_21/TensorArrayV2_1/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"ÿÿÿÿ   
+sequential_20/simple_rnn_21/TensorArrayV2_1TensorListReserveBsequential_20/simple_rnn_21/TensorArrayV2_1/element_shape:output:04sequential_20/simple_rnn_21/strided_slice_1:output:0*
_output_shapes
: *
element_dtype0*

shape_type0:éèÒb
 sequential_20/simple_rnn_21/timeConst*
_output_shapes
: *
dtype0*
value	B : 
4sequential_20/simple_rnn_21/while/maximum_iterationsConst*
_output_shapes
: *
dtype0*
valueB :
ÿÿÿÿÿÿÿÿÿp
.sequential_20/simple_rnn_21/while/loop_counterConst*
_output_shapes
: *
dtype0*
value	B : É
!sequential_20/simple_rnn_21/whileWhile7sequential_20/simple_rnn_21/while/loop_counter:output:0=sequential_20/simple_rnn_21/while/maximum_iterations:output:0)sequential_20/simple_rnn_21/time:output:04sequential_20/simple_rnn_21/TensorArrayV2_1:handle:0*sequential_20/simple_rnn_21/zeros:output:04sequential_20/simple_rnn_21/strided_slice_1:output:0Ssequential_20/simple_rnn_21/TensorArrayUnstack/TensorListFromTensor:output_handle:0Msequential_20_simple_rnn_21_simple_rnn_cell_21_matmul_readvariableop_resourceNsequential_20_simple_rnn_21_simple_rnn_cell_21_biasadd_readvariableop_resourceOsequential_20_simple_rnn_21_simple_rnn_cell_21_matmul_1_readvariableop_resource*
T
2
*
_lower_using_switch_merge(*
_num_original_outputs
*9
_output_shapes'
%: : : : :ÿÿÿÿÿÿÿÿÿ: : : : : *%
_read_only_resource_inputs
	*
_stateful_parallelism( *:
body2R0
.sequential_20_simple_rnn_21_while_body_4292376*:
cond2R0
.sequential_20_simple_rnn_21_while_cond_4292375*8
output_shapes'
%: : : : :ÿÿÿÿÿÿÿÿÿ: : : : : *
parallel_iterations 
Lsequential_20/simple_rnn_21/TensorArrayV2Stack/TensorListStack/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"ÿÿÿÿ   
>sequential_20/simple_rnn_21/TensorArrayV2Stack/TensorListStackTensorListStack*sequential_20/simple_rnn_21/while:output:3Usequential_20/simple_rnn_21/TensorArrayV2Stack/TensorListStack/element_shape:output:0*+
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
element_dtype0
1sequential_20/simple_rnn_21/strided_slice_3/stackConst*
_output_shapes
:*
dtype0*
valueB:
ÿÿÿÿÿÿÿÿÿ}
3sequential_20/simple_rnn_21/strided_slice_3/stack_1Const*
_output_shapes
:*
dtype0*
valueB: }
3sequential_20/simple_rnn_21/strided_slice_3/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
+sequential_20/simple_rnn_21/strided_slice_3StridedSliceGsequential_20/simple_rnn_21/TensorArrayV2Stack/TensorListStack:tensor:0:sequential_20/simple_rnn_21/strided_slice_3/stack:output:0<sequential_20/simple_rnn_21/strided_slice_3/stack_1:output:0<sequential_20/simple_rnn_21/strided_slice_3/stack_2:output:0*
Index0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
shrink_axis_mask
,sequential_20/simple_rnn_21/transpose_1/permConst*
_output_shapes
:*
dtype0*!
valueB"          ê
'sequential_20/simple_rnn_21/transpose_1	TransposeGsequential_20/simple_rnn_21/TensorArrayV2Stack/TensorListStack:tensor:05sequential_20/simple_rnn_21/transpose_1/perm:output:0*
T0*+
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
IdentityIdentity4sequential_20/simple_rnn_21/strided_slice_3:output:0^NoOp*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿÂ
NoOpNoOpF^sequential_20/simple_rnn_21/simple_rnn_cell_21/BiasAdd/ReadVariableOpE^sequential_20/simple_rnn_21/simple_rnn_cell_21/MatMul/ReadVariableOpG^sequential_20/simple_rnn_21/simple_rnn_cell_21/MatMul_1/ReadVariableOp"^sequential_20/simple_rnn_21/while*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*0
_input_shapes
:ÿÿÿÿÿÿÿÿÿi: : : 2
Esequential_20/simple_rnn_21/simple_rnn_cell_21/BiasAdd/ReadVariableOpEsequential_20/simple_rnn_21/simple_rnn_cell_21/BiasAdd/ReadVariableOp2
Dsequential_20/simple_rnn_21/simple_rnn_cell_21/MatMul/ReadVariableOpDsequential_20/simple_rnn_21/simple_rnn_cell_21/MatMul/ReadVariableOp2
Fsequential_20/simple_rnn_21/simple_rnn_cell_21/MatMul_1/ReadVariableOpFsequential_20/simple_rnn_21/simple_rnn_cell_21/MatMul_1/ReadVariableOp2F
!sequential_20/simple_rnn_21/while!sequential_20/simple_rnn_21/while:` \
+
_output_shapes
:ÿÿÿÿÿÿÿÿÿi
-
_user_specified_namesimple_rnn_21_input
ß
¯
while_cond_4293710
while_while_loop_counter"
while_while_maximum_iterations
while_placeholder
while_placeholder_1
while_placeholder_2
while_less_strided_slice_15
1while_while_cond_4293710___redundant_placeholder05
1while_while_cond_4293710___redundant_placeholder15
1while_while_cond_4293710___redundant_placeholder25
1while_while_cond_4293710___redundant_placeholder3
while_identity
b

while/LessLesswhile_placeholderwhile_less_strided_slice_1*
T0*
_output_shapes
: K
while/IdentityIdentitywhile/Less:z:0*
T0
*
_output_shapes
: ")
while_identitywhile/Identity:output:0*(
_construction_contextkEagerRuntime*@
_input_shapes/
-: : : : :ÿÿÿÿÿÿÿÿÿ: ::::: 

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :-)
'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ:

_output_shapes
: :

_output_shapes
:
à<
Ã
J__inference_simple_rnn_21_layer_call_and_return_conditional_losses_4293670

inputsC
1simple_rnn_cell_21_matmul_readvariableop_resource:i@
2simple_rnn_cell_21_biasadd_readvariableop_resource:E
3simple_rnn_cell_21_matmul_1_readvariableop_resource:
identity¢)simple_rnn_cell_21/BiasAdd/ReadVariableOp¢(simple_rnn_cell_21/MatMul/ReadVariableOp¢*simple_rnn_cell_21/MatMul_1/ReadVariableOp¢while;
ShapeShapeinputs*
T0*
_output_shapes
:]
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: _
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:_
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:Ñ
strided_sliceStridedSliceShape:output:0strided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskP
zeros/packed/1Const*
_output_shapes
: *
dtype0*
value	B :s
zeros/packedPackstrided_slice:output:0zeros/packed/1:output:0*
N*
T0*
_output_shapes
:P
zeros/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    l
zerosFillzeros/packed:output:0zeros/Const:output:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿc
transpose/permConst*
_output_shapes
:*
dtype0*!
valueB"          m
	transpose	Transposeinputstranspose/perm:output:0*
T0*+
_output_shapes
:ÿÿÿÿÿÿÿÿÿiD
Shape_1Shapetranspose:y:0*
T0*
_output_shapes
:_
strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: a
strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:Û
strided_slice_1StridedSliceShape_1:output:0strided_slice_1/stack:output:0 strided_slice_1/stack_1:output:0 strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskf
TensorArrayV2/element_shapeConst*
_output_shapes
: *
dtype0*
valueB :
ÿÿÿÿÿÿÿÿÿ´
TensorArrayV2TensorListReserve$TensorArrayV2/element_shape:output:0strided_slice_1:output:0*
_output_shapes
: *
element_dtype0*

shape_type0:éèÒ
5TensorArrayUnstack/TensorListFromTensor/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"ÿÿÿÿi   à
'TensorArrayUnstack/TensorListFromTensorTensorListFromTensortranspose:y:0>TensorArrayUnstack/TensorListFromTensor/element_shape:output:0*
_output_shapes
: *
element_dtype0*

shape_type0:éèÒ_
strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB: a
strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:é
strided_slice_2StridedSlicetranspose:y:0strided_slice_2/stack:output:0 strided_slice_2/stack_1:output:0 strided_slice_2/stack_2:output:0*
Index0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿi*
shrink_axis_mask
(simple_rnn_cell_21/MatMul/ReadVariableOpReadVariableOp1simple_rnn_cell_21_matmul_readvariableop_resource*
_output_shapes

:i*
dtype0¡
simple_rnn_cell_21/MatMulMatMulstrided_slice_2:output:00simple_rnn_cell_21/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
)simple_rnn_cell_21/BiasAdd/ReadVariableOpReadVariableOp2simple_rnn_cell_21_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0¯
simple_rnn_cell_21/BiasAddBiasAdd#simple_rnn_cell_21/MatMul:product:01simple_rnn_cell_21/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
*simple_rnn_cell_21/MatMul_1/ReadVariableOpReadVariableOp3simple_rnn_cell_21_matmul_1_readvariableop_resource*
_output_shapes

:*
dtype0
simple_rnn_cell_21/MatMul_1MatMulzeros:output:02simple_rnn_cell_21/MatMul_1/ReadVariableOp:value:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
simple_rnn_cell_21/addAddV2#simple_rnn_cell_21/BiasAdd:output:0%simple_rnn_cell_21/MatMul_1:product:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿn
TensorArrayV2_1/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"ÿÿÿÿ   ¸
TensorArrayV2_1TensorListReserve&TensorArrayV2_1/element_shape:output:0strided_slice_1:output:0*
_output_shapes
: *
element_dtype0*

shape_type0:éèÒF
timeConst*
_output_shapes
: *
dtype0*
value	B : c
while/maximum_iterationsConst*
_output_shapes
: *
dtype0*
valueB :
ÿÿÿÿÿÿÿÿÿT
while/loop_counterConst*
_output_shapes
: *
dtype0*
value	B : Ý
whileWhilewhile/loop_counter:output:0!while/maximum_iterations:output:0time:output:0TensorArrayV2_1:handle:0zeros:output:0strided_slice_1:output:07TensorArrayUnstack/TensorListFromTensor:output_handle:01simple_rnn_cell_21_matmul_readvariableop_resource2simple_rnn_cell_21_biasadd_readvariableop_resource3simple_rnn_cell_21_matmul_1_readvariableop_resource*
T
2
*
_lower_using_switch_merge(*
_num_original_outputs
*9
_output_shapes'
%: : : : :ÿÿÿÿÿÿÿÿÿ: : : : : *%
_read_only_resource_inputs
	*
_stateful_parallelism( *
bodyR
while_body_4293605*
condR
while_cond_4293604*8
output_shapes'
%: : : : :ÿÿÿÿÿÿÿÿÿ: : : : : *
parallel_iterations 
0TensorArrayV2Stack/TensorListStack/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"ÿÿÿÿ   Â
"TensorArrayV2Stack/TensorListStackTensorListStackwhile:output:39TensorArrayV2Stack/TensorListStack/element_shape:output:0*+
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
element_dtype0h
strided_slice_3/stackConst*
_output_shapes
:*
dtype0*
valueB:
ÿÿÿÿÿÿÿÿÿa
strided_slice_3/stack_1Const*
_output_shapes
:*
dtype0*
valueB: a
strided_slice_3/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
strided_slice_3StridedSlice+TensorArrayV2Stack/TensorListStack:tensor:0strided_slice_3/stack:output:0 strided_slice_3/stack_1:output:0 strided_slice_3/stack_2:output:0*
Index0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
shrink_axis_maske
transpose_1/permConst*
_output_shapes
:*
dtype0*!
valueB"          
transpose_1	Transpose+TensorArrayV2Stack/TensorListStack:tensor:0transpose_1/perm:output:0*
T0*+
_output_shapes
:ÿÿÿÿÿÿÿÿÿg
IdentityIdentitystrided_slice_3:output:0^NoOp*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿÒ
NoOpNoOp*^simple_rnn_cell_21/BiasAdd/ReadVariableOp)^simple_rnn_cell_21/MatMul/ReadVariableOp+^simple_rnn_cell_21/MatMul_1/ReadVariableOp^while*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*0
_input_shapes
:ÿÿÿÿÿÿÿÿÿi: : : 2V
)simple_rnn_cell_21/BiasAdd/ReadVariableOp)simple_rnn_cell_21/BiasAdd/ReadVariableOp2T
(simple_rnn_cell_21/MatMul/ReadVariableOp(simple_rnn_cell_21/MatMul/ReadVariableOp2X
*simple_rnn_cell_21/MatMul_1/ReadVariableOp*simple_rnn_cell_21/MatMul_1/ReadVariableOp2
whilewhile:S O
+
_output_shapes
:ÿÿÿÿÿÿÿÿÿi
 
_user_specified_nameinputs
ß
¯
while_cond_4293392
while_while_loop_counter"
while_while_maximum_iterations
while_placeholder
while_placeholder_1
while_placeholder_2
while_less_strided_slice_15
1while_while_cond_4293392___redundant_placeholder05
1while_while_cond_4293392___redundant_placeholder15
1while_while_cond_4293392___redundant_placeholder25
1while_while_cond_4293392___redundant_placeholder3
while_identity
b

while/LessLesswhile_placeholderwhile_less_strided_slice_1*
T0*
_output_shapes
: K
while/IdentityIdentitywhile/Less:z:0*
T0
*
_output_shapes
: ")
while_identitywhile/Identity:output:0*(
_construction_contextkEagerRuntime*@
_input_shapes/
-: : : : :ÿÿÿÿÿÿÿÿÿ: ::::: 

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :-)
'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ:

_output_shapes
: :

_output_shapes
:

¹
/__inference_sequential_20_layer_call_fn_4293083

inputs
unknown:i
	unknown_0:
	unknown_1:
identity¢StatefulPartitionedCallì
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*%
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *S
fNRL
J__inference_sequential_20_layer_call_and_return_conditional_losses_4293013o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*0
_input_shapes
:ÿÿÿÿÿÿÿÿÿi: : : 22
StatefulPartitionedCallStatefulPartitionedCall:S O
+
_output_shapes
:ÿÿÿÿÿÿÿÿÿi
 
_user_specified_nameinputs
óI
¥
J__inference_sequential_20_layer_call_and_return_conditional_losses_4293189

inputsQ
?simple_rnn_21_simple_rnn_cell_21_matmul_readvariableop_resource:iN
@simple_rnn_21_simple_rnn_cell_21_biasadd_readvariableop_resource:S
Asimple_rnn_21_simple_rnn_cell_21_matmul_1_readvariableop_resource:
identity¢7simple_rnn_21/simple_rnn_cell_21/BiasAdd/ReadVariableOp¢6simple_rnn_21/simple_rnn_cell_21/MatMul/ReadVariableOp¢8simple_rnn_21/simple_rnn_cell_21/MatMul_1/ReadVariableOp¢simple_rnn_21/whileI
simple_rnn_21/ShapeShapeinputs*
T0*
_output_shapes
:k
!simple_rnn_21/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: m
#simple_rnn_21/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:m
#simple_rnn_21/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
simple_rnn_21/strided_sliceStridedSlicesimple_rnn_21/Shape:output:0*simple_rnn_21/strided_slice/stack:output:0,simple_rnn_21/strided_slice/stack_1:output:0,simple_rnn_21/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask^
simple_rnn_21/zeros/packed/1Const*
_output_shapes
: *
dtype0*
value	B :
simple_rnn_21/zeros/packedPack$simple_rnn_21/strided_slice:output:0%simple_rnn_21/zeros/packed/1:output:0*
N*
T0*
_output_shapes
:^
simple_rnn_21/zeros/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    
simple_rnn_21/zerosFill#simple_rnn_21/zeros/packed:output:0"simple_rnn_21/zeros/Const:output:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿq
simple_rnn_21/transpose/permConst*
_output_shapes
:*
dtype0*!
valueB"          
simple_rnn_21/transpose	Transposeinputs%simple_rnn_21/transpose/perm:output:0*
T0*+
_output_shapes
:ÿÿÿÿÿÿÿÿÿi`
simple_rnn_21/Shape_1Shapesimple_rnn_21/transpose:y:0*
T0*
_output_shapes
:m
#simple_rnn_21/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: o
%simple_rnn_21/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:o
%simple_rnn_21/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:¡
simple_rnn_21/strided_slice_1StridedSlicesimple_rnn_21/Shape_1:output:0,simple_rnn_21/strided_slice_1/stack:output:0.simple_rnn_21/strided_slice_1/stack_1:output:0.simple_rnn_21/strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskt
)simple_rnn_21/TensorArrayV2/element_shapeConst*
_output_shapes
: *
dtype0*
valueB :
ÿÿÿÿÿÿÿÿÿÞ
simple_rnn_21/TensorArrayV2TensorListReserve2simple_rnn_21/TensorArrayV2/element_shape:output:0&simple_rnn_21/strided_slice_1:output:0*
_output_shapes
: *
element_dtype0*

shape_type0:éèÒ
Csimple_rnn_21/TensorArrayUnstack/TensorListFromTensor/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"ÿÿÿÿi   
5simple_rnn_21/TensorArrayUnstack/TensorListFromTensorTensorListFromTensorsimple_rnn_21/transpose:y:0Lsimple_rnn_21/TensorArrayUnstack/TensorListFromTensor/element_shape:output:0*
_output_shapes
: *
element_dtype0*

shape_type0:éèÒm
#simple_rnn_21/strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB: o
%simple_rnn_21/strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:o
%simple_rnn_21/strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:¯
simple_rnn_21/strided_slice_2StridedSlicesimple_rnn_21/transpose:y:0,simple_rnn_21/strided_slice_2/stack:output:0.simple_rnn_21/strided_slice_2/stack_1:output:0.simple_rnn_21/strided_slice_2/stack_2:output:0*
Index0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿi*
shrink_axis_mask¶
6simple_rnn_21/simple_rnn_cell_21/MatMul/ReadVariableOpReadVariableOp?simple_rnn_21_simple_rnn_cell_21_matmul_readvariableop_resource*
_output_shapes

:i*
dtype0Ë
'simple_rnn_21/simple_rnn_cell_21/MatMulMatMul&simple_rnn_21/strided_slice_2:output:0>simple_rnn_21/simple_rnn_cell_21/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ´
7simple_rnn_21/simple_rnn_cell_21/BiasAdd/ReadVariableOpReadVariableOp@simple_rnn_21_simple_rnn_cell_21_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0Ù
(simple_rnn_21/simple_rnn_cell_21/BiasAddBiasAdd1simple_rnn_21/simple_rnn_cell_21/MatMul:product:0?simple_rnn_21/simple_rnn_cell_21/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿº
8simple_rnn_21/simple_rnn_cell_21/MatMul_1/ReadVariableOpReadVariableOpAsimple_rnn_21_simple_rnn_cell_21_matmul_1_readvariableop_resource*
_output_shapes

:*
dtype0Å
)simple_rnn_21/simple_rnn_cell_21/MatMul_1MatMulsimple_rnn_21/zeros:output:0@simple_rnn_21/simple_rnn_cell_21/MatMul_1/ReadVariableOp:value:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿÇ
$simple_rnn_21/simple_rnn_cell_21/addAddV21simple_rnn_21/simple_rnn_cell_21/BiasAdd:output:03simple_rnn_21/simple_rnn_cell_21/MatMul_1:product:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ|
+simple_rnn_21/TensorArrayV2_1/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"ÿÿÿÿ   â
simple_rnn_21/TensorArrayV2_1TensorListReserve4simple_rnn_21/TensorArrayV2_1/element_shape:output:0&simple_rnn_21/strided_slice_1:output:0*
_output_shapes
: *
element_dtype0*

shape_type0:éèÒT
simple_rnn_21/timeConst*
_output_shapes
: *
dtype0*
value	B : q
&simple_rnn_21/while/maximum_iterationsConst*
_output_shapes
: *
dtype0*
valueB :
ÿÿÿÿÿÿÿÿÿb
 simple_rnn_21/while/loop_counterConst*
_output_shapes
: *
dtype0*
value	B : 
simple_rnn_21/whileWhile)simple_rnn_21/while/loop_counter:output:0/simple_rnn_21/while/maximum_iterations:output:0simple_rnn_21/time:output:0&simple_rnn_21/TensorArrayV2_1:handle:0simple_rnn_21/zeros:output:0&simple_rnn_21/strided_slice_1:output:0Esimple_rnn_21/TensorArrayUnstack/TensorListFromTensor:output_handle:0?simple_rnn_21_simple_rnn_cell_21_matmul_readvariableop_resource@simple_rnn_21_simple_rnn_cell_21_biasadd_readvariableop_resourceAsimple_rnn_21_simple_rnn_cell_21_matmul_1_readvariableop_resource*
T
2
*
_lower_using_switch_merge(*
_num_original_outputs
*9
_output_shapes'
%: : : : :ÿÿÿÿÿÿÿÿÿ: : : : : *%
_read_only_resource_inputs
	*
_stateful_parallelism( *,
body$R"
 simple_rnn_21_while_body_4293124*,
cond$R"
 simple_rnn_21_while_cond_4293123*8
output_shapes'
%: : : : :ÿÿÿÿÿÿÿÿÿ: : : : : *
parallel_iterations 
>simple_rnn_21/TensorArrayV2Stack/TensorListStack/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"ÿÿÿÿ   ì
0simple_rnn_21/TensorArrayV2Stack/TensorListStackTensorListStacksimple_rnn_21/while:output:3Gsimple_rnn_21/TensorArrayV2Stack/TensorListStack/element_shape:output:0*+
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
element_dtype0v
#simple_rnn_21/strided_slice_3/stackConst*
_output_shapes
:*
dtype0*
valueB:
ÿÿÿÿÿÿÿÿÿo
%simple_rnn_21/strided_slice_3/stack_1Const*
_output_shapes
:*
dtype0*
valueB: o
%simple_rnn_21/strided_slice_3/stack_2Const*
_output_shapes
:*
dtype0*
valueB:Í
simple_rnn_21/strided_slice_3StridedSlice9simple_rnn_21/TensorArrayV2Stack/TensorListStack:tensor:0,simple_rnn_21/strided_slice_3/stack:output:0.simple_rnn_21/strided_slice_3/stack_1:output:0.simple_rnn_21/strided_slice_3/stack_2:output:0*
Index0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
shrink_axis_masks
simple_rnn_21/transpose_1/permConst*
_output_shapes
:*
dtype0*!
valueB"          À
simple_rnn_21/transpose_1	Transpose9simple_rnn_21/TensorArrayV2Stack/TensorListStack:tensor:0'simple_rnn_21/transpose_1/perm:output:0*
T0*+
_output_shapes
:ÿÿÿÿÿÿÿÿÿu
IdentityIdentity&simple_rnn_21/strided_slice_3:output:0^NoOp*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
NoOpNoOp8^simple_rnn_21/simple_rnn_cell_21/BiasAdd/ReadVariableOp7^simple_rnn_21/simple_rnn_cell_21/MatMul/ReadVariableOp9^simple_rnn_21/simple_rnn_cell_21/MatMul_1/ReadVariableOp^simple_rnn_21/while*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*0
_input_shapes
:ÿÿÿÿÿÿÿÿÿi: : : 2r
7simple_rnn_21/simple_rnn_cell_21/BiasAdd/ReadVariableOp7simple_rnn_21/simple_rnn_cell_21/BiasAdd/ReadVariableOp2p
6simple_rnn_21/simple_rnn_cell_21/MatMul/ReadVariableOp6simple_rnn_21/simple_rnn_cell_21/MatMul/ReadVariableOp2t
8simple_rnn_21/simple_rnn_cell_21/MatMul_1/ReadVariableOp8simple_rnn_21/simple_rnn_cell_21/MatMul_1/ReadVariableOp2*
simple_rnn_21/whilesimple_rnn_21/while:S O
+
_output_shapes
:ÿÿÿÿÿÿÿÿÿi
 
_user_specified_nameinputs

¹
/__inference_simple_rnn_21_layer_call_fn_4293341

inputs
unknown:i
	unknown_0:
	unknown_1:
identity¢StatefulPartitionedCallì
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*%
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *S
fNRL
J__inference_simple_rnn_21_layer_call_and_return_conditional_losses_4292843o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*0
_input_shapes
:ÿÿÿÿÿÿÿÿÿi: : : 22
StatefulPartitionedCallStatefulPartitionedCall:S O
+
_output_shapes
:ÿÿÿÿÿÿÿÿÿi
 
_user_specified_nameinputs
í+
Ò
while_body_4292778
while_while_loop_counter"
while_while_maximum_iterations
while_placeholder
while_placeholder_1
while_placeholder_2
while_strided_slice_1_0W
Swhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor_0K
9while_simple_rnn_cell_21_matmul_readvariableop_resource_0:iH
:while_simple_rnn_cell_21_biasadd_readvariableop_resource_0:M
;while_simple_rnn_cell_21_matmul_1_readvariableop_resource_0:
while_identity
while_identity_1
while_identity_2
while_identity_3
while_identity_4
while_strided_slice_1U
Qwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensorI
7while_simple_rnn_cell_21_matmul_readvariableop_resource:iF
8while_simple_rnn_cell_21_biasadd_readvariableop_resource:K
9while_simple_rnn_cell_21_matmul_1_readvariableop_resource:¢/while/simple_rnn_cell_21/BiasAdd/ReadVariableOp¢.while/simple_rnn_cell_21/MatMul/ReadVariableOp¢0while/simple_rnn_cell_21/MatMul_1/ReadVariableOp
7while/TensorArrayV2Read/TensorListGetItem/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"ÿÿÿÿi   ¦
)while/TensorArrayV2Read/TensorListGetItemTensorListGetItemSwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor_0while_placeholder@while/TensorArrayV2Read/TensorListGetItem/element_shape:output:0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿi*
element_dtype0¨
.while/simple_rnn_cell_21/MatMul/ReadVariableOpReadVariableOp9while_simple_rnn_cell_21_matmul_readvariableop_resource_0*
_output_shapes

:i*
dtype0Å
while/simple_rnn_cell_21/MatMulMatMul0while/TensorArrayV2Read/TensorListGetItem:item:06while/simple_rnn_cell_21/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ¦
/while/simple_rnn_cell_21/BiasAdd/ReadVariableOpReadVariableOp:while_simple_rnn_cell_21_biasadd_readvariableop_resource_0*
_output_shapes
:*
dtype0Á
 while/simple_rnn_cell_21/BiasAddBiasAdd)while/simple_rnn_cell_21/MatMul:product:07while/simple_rnn_cell_21/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ¬
0while/simple_rnn_cell_21/MatMul_1/ReadVariableOpReadVariableOp;while_simple_rnn_cell_21_matmul_1_readvariableop_resource_0*
_output_shapes

:*
dtype0¬
!while/simple_rnn_cell_21/MatMul_1MatMulwhile_placeholder_28while/simple_rnn_cell_21/MatMul_1/ReadVariableOp:value:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ¯
while/simple_rnn_cell_21/addAddV2)while/simple_rnn_cell_21/BiasAdd:output:0+while/simple_rnn_cell_21/MatMul_1:product:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿÉ
*while/TensorArrayV2Write/TensorListSetItemTensorListSetItemwhile_placeholder_1while_placeholder while/simple_rnn_cell_21/add:z:0*
_output_shapes
: *
element_dtype0:éèÒM
while/add/yConst*
_output_shapes
: *
dtype0*
value	B :\
	while/addAddV2while_placeholderwhile/add/y:output:0*
T0*
_output_shapes
: O
while/add_1/yConst*
_output_shapes
: *
dtype0*
value	B :g
while/add_1AddV2while_while_loop_counterwhile/add_1/y:output:0*
T0*
_output_shapes
: Y
while/IdentityIdentitywhile/add_1:z:0^while/NoOp*
T0*
_output_shapes
: j
while/Identity_1Identitywhile_while_maximum_iterations^while/NoOp*
T0*
_output_shapes
: Y
while/Identity_2Identitywhile/add:z:0^while/NoOp*
T0*
_output_shapes
: 
while/Identity_3Identity:while/TensorArrayV2Write/TensorListSetItem:output_handle:0^while/NoOp*
T0*
_output_shapes
: :éèÒ}
while/Identity_4Identity while/simple_rnn_cell_21/add:z:0^while/NoOp*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿâ

while/NoOpNoOp0^while/simple_rnn_cell_21/BiasAdd/ReadVariableOp/^while/simple_rnn_cell_21/MatMul/ReadVariableOp1^while/simple_rnn_cell_21/MatMul_1/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 ")
while_identitywhile/Identity:output:0"-
while_identity_1while/Identity_1:output:0"-
while_identity_2while/Identity_2:output:0"-
while_identity_3while/Identity_3:output:0"-
while_identity_4while/Identity_4:output:0"v
8while_simple_rnn_cell_21_biasadd_readvariableop_resource:while_simple_rnn_cell_21_biasadd_readvariableop_resource_0"x
9while_simple_rnn_cell_21_matmul_1_readvariableop_resource;while_simple_rnn_cell_21_matmul_1_readvariableop_resource_0"t
7while_simple_rnn_cell_21_matmul_readvariableop_resource9while_simple_rnn_cell_21_matmul_readvariableop_resource_0"0
while_strided_slice_1while_strided_slice_1_0"¨
Qwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensorSwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor_0*(
_construction_contextkEagerRuntime*8
_input_shapes'
%: : : : :ÿÿÿÿÿÿÿÿÿ: : : : : 2b
/while/simple_rnn_cell_21/BiasAdd/ReadVariableOp/while/simple_rnn_cell_21/BiasAdd/ReadVariableOp2`
.while/simple_rnn_cell_21/MatMul/ReadVariableOp.while/simple_rnn_cell_21/MatMul/ReadVariableOp2d
0while/simple_rnn_cell_21/MatMul_1/ReadVariableOp0while/simple_rnn_cell_21/MatMul_1/ReadVariableOp: 

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :-)
'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ:

_output_shapes
: :

_output_shapes
: 
¦4
¤
J__inference_simple_rnn_21_layer_call_and_return_conditional_losses_4292564

inputs,
simple_rnn_cell_21_4292489:i(
simple_rnn_cell_21_4292491:,
simple_rnn_cell_21_4292493:
identity¢*simple_rnn_cell_21/StatefulPartitionedCall¢while;
ShapeShapeinputs*
T0*
_output_shapes
:]
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: _
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:_
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:Ñ
strided_sliceStridedSliceShape:output:0strided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskP
zeros/packed/1Const*
_output_shapes
: *
dtype0*
value	B :s
zeros/packedPackstrided_slice:output:0zeros/packed/1:output:0*
N*
T0*
_output_shapes
:P
zeros/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    l
zerosFillzeros/packed:output:0zeros/Const:output:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿc
transpose/permConst*
_output_shapes
:*
dtype0*!
valueB"          v
	transpose	Transposeinputstranspose/perm:output:0*
T0*4
_output_shapes"
 :ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿiD
Shape_1Shapetranspose:y:0*
T0*
_output_shapes
:_
strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: a
strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:Û
strided_slice_1StridedSliceShape_1:output:0strided_slice_1/stack:output:0 strided_slice_1/stack_1:output:0 strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskf
TensorArrayV2/element_shapeConst*
_output_shapes
: *
dtype0*
valueB :
ÿÿÿÿÿÿÿÿÿ´
TensorArrayV2TensorListReserve$TensorArrayV2/element_shape:output:0strided_slice_1:output:0*
_output_shapes
: *
element_dtype0*

shape_type0:éèÒ
5TensorArrayUnstack/TensorListFromTensor/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"ÿÿÿÿi   à
'TensorArrayUnstack/TensorListFromTensorTensorListFromTensortranspose:y:0>TensorArrayUnstack/TensorListFromTensor/element_shape:output:0*
_output_shapes
: *
element_dtype0*

shape_type0:éèÒ_
strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB: a
strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:é
strided_slice_2StridedSlicetranspose:y:0strided_slice_2/stack:output:0 strided_slice_2/stack_1:output:0 strided_slice_2/stack_2:output:0*
Index0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿi*
shrink_axis_maskð
*simple_rnn_cell_21/StatefulPartitionedCallStatefulPartitionedCallstrided_slice_2:output:0zeros:output:0simple_rnn_cell_21_4292489simple_rnn_cell_21_4292491simple_rnn_cell_21_4292493*
Tin	
2*
Tout
2*
_collective_manager_ids
 *:
_output_shapes(
&:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ*%
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *X
fSRQ
O__inference_simple_rnn_cell_21_layer_call_and_return_conditional_losses_4292488n
TensorArrayV2_1/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"ÿÿÿÿ   ¸
TensorArrayV2_1TensorListReserve&TensorArrayV2_1/element_shape:output:0strided_slice_1:output:0*
_output_shapes
: *
element_dtype0*

shape_type0:éèÒF
timeConst*
_output_shapes
: *
dtype0*
value	B : c
while/maximum_iterationsConst*
_output_shapes
: *
dtype0*
valueB :
ÿÿÿÿÿÿÿÿÿT
while/loop_counterConst*
_output_shapes
: *
dtype0*
value	B : 
whileWhilewhile/loop_counter:output:0!while/maximum_iterations:output:0time:output:0TensorArrayV2_1:handle:0zeros:output:0strided_slice_1:output:07TensorArrayUnstack/TensorListFromTensor:output_handle:0simple_rnn_cell_21_4292489simple_rnn_cell_21_4292491simple_rnn_cell_21_4292493*
T
2
*
_lower_using_switch_merge(*
_num_original_outputs
*9
_output_shapes'
%: : : : :ÿÿÿÿÿÿÿÿÿ: : : : : *%
_read_only_resource_inputs
	*
_stateful_parallelism( *
bodyR
while_body_4292501*
condR
while_cond_4292500*8
output_shapes'
%: : : : :ÿÿÿÿÿÿÿÿÿ: : : : : *
parallel_iterations 
0TensorArrayV2Stack/TensorListStack/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"ÿÿÿÿ   Ë
"TensorArrayV2Stack/TensorListStackTensorListStackwhile:output:39TensorArrayV2Stack/TensorListStack/element_shape:output:0*4
_output_shapes"
 :ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ*
element_dtype0h
strided_slice_3/stackConst*
_output_shapes
:*
dtype0*
valueB:
ÿÿÿÿÿÿÿÿÿa
strided_slice_3/stack_1Const*
_output_shapes
:*
dtype0*
valueB: a
strided_slice_3/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
strided_slice_3StridedSlice+TensorArrayV2Stack/TensorListStack:tensor:0strided_slice_3/stack:output:0 strided_slice_3/stack_1:output:0 strided_slice_3/stack_2:output:0*
Index0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
shrink_axis_maske
transpose_1/permConst*
_output_shapes
:*
dtype0*!
valueB"          
transpose_1	Transpose+TensorArrayV2Stack/TensorListStack:tensor:0transpose_1/perm:output:0*
T0*4
_output_shapes"
 :ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿg
IdentityIdentitystrided_slice_3:output:0^NoOp*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ{
NoOpNoOp+^simple_rnn_cell_21/StatefulPartitionedCall^while*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*9
_input_shapes(
&:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿi: : : 2X
*simple_rnn_cell_21/StatefulPartitionedCall*simple_rnn_cell_21/StatefulPartitionedCall2
whilewhile:\ X
4
_output_shapes"
 :ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿi
 
_user_specified_nameinputs
Õ
Ã
.sequential_20_simple_rnn_21_while_cond_4292375T
Psequential_20_simple_rnn_21_while_sequential_20_simple_rnn_21_while_loop_counterZ
Vsequential_20_simple_rnn_21_while_sequential_20_simple_rnn_21_while_maximum_iterations1
-sequential_20_simple_rnn_21_while_placeholder3
/sequential_20_simple_rnn_21_while_placeholder_13
/sequential_20_simple_rnn_21_while_placeholder_2V
Rsequential_20_simple_rnn_21_while_less_sequential_20_simple_rnn_21_strided_slice_1m
isequential_20_simple_rnn_21_while_sequential_20_simple_rnn_21_while_cond_4292375___redundant_placeholder0m
isequential_20_simple_rnn_21_while_sequential_20_simple_rnn_21_while_cond_4292375___redundant_placeholder1m
isequential_20_simple_rnn_21_while_sequential_20_simple_rnn_21_while_cond_4292375___redundant_placeholder2m
isequential_20_simple_rnn_21_while_sequential_20_simple_rnn_21_while_cond_4292375___redundant_placeholder3.
*sequential_20_simple_rnn_21_while_identity
Ò
&sequential_20/simple_rnn_21/while/LessLess-sequential_20_simple_rnn_21_while_placeholderRsequential_20_simple_rnn_21_while_less_sequential_20_simple_rnn_21_strided_slice_1*
T0*
_output_shapes
: 
*sequential_20/simple_rnn_21/while/IdentityIdentity*sequential_20/simple_rnn_21/while/Less:z:0*
T0
*
_output_shapes
: "a
*sequential_20_simple_rnn_21_while_identity3sequential_20/simple_rnn_21/while/Identity:output:0*(
_construction_contextkEagerRuntime*@
_input_shapes/
-: : : : :ÿÿÿÿÿÿÿÿÿ: ::::: 

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :-)
'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ:

_output_shapes
: :

_output_shapes
:
¦4
¤
J__inference_simple_rnn_21_layer_call_and_return_conditional_losses_4292722

inputs,
simple_rnn_cell_21_4292647:i(
simple_rnn_cell_21_4292649:,
simple_rnn_cell_21_4292651:
identity¢*simple_rnn_cell_21/StatefulPartitionedCall¢while;
ShapeShapeinputs*
T0*
_output_shapes
:]
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: _
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:_
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:Ñ
strided_sliceStridedSliceShape:output:0strided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskP
zeros/packed/1Const*
_output_shapes
: *
dtype0*
value	B :s
zeros/packedPackstrided_slice:output:0zeros/packed/1:output:0*
N*
T0*
_output_shapes
:P
zeros/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    l
zerosFillzeros/packed:output:0zeros/Const:output:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿc
transpose/permConst*
_output_shapes
:*
dtype0*!
valueB"          v
	transpose	Transposeinputstranspose/perm:output:0*
T0*4
_output_shapes"
 :ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿiD
Shape_1Shapetranspose:y:0*
T0*
_output_shapes
:_
strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: a
strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:Û
strided_slice_1StridedSliceShape_1:output:0strided_slice_1/stack:output:0 strided_slice_1/stack_1:output:0 strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskf
TensorArrayV2/element_shapeConst*
_output_shapes
: *
dtype0*
valueB :
ÿÿÿÿÿÿÿÿÿ´
TensorArrayV2TensorListReserve$TensorArrayV2/element_shape:output:0strided_slice_1:output:0*
_output_shapes
: *
element_dtype0*

shape_type0:éèÒ
5TensorArrayUnstack/TensorListFromTensor/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"ÿÿÿÿi   à
'TensorArrayUnstack/TensorListFromTensorTensorListFromTensortranspose:y:0>TensorArrayUnstack/TensorListFromTensor/element_shape:output:0*
_output_shapes
: *
element_dtype0*

shape_type0:éèÒ_
strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB: a
strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:é
strided_slice_2StridedSlicetranspose:y:0strided_slice_2/stack:output:0 strided_slice_2/stack_1:output:0 strided_slice_2/stack_2:output:0*
Index0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿi*
shrink_axis_maskð
*simple_rnn_cell_21/StatefulPartitionedCallStatefulPartitionedCallstrided_slice_2:output:0zeros:output:0simple_rnn_cell_21_4292647simple_rnn_cell_21_4292649simple_rnn_cell_21_4292651*
Tin	
2*
Tout
2*
_collective_manager_ids
 *:
_output_shapes(
&:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ*%
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *X
fSRQ
O__inference_simple_rnn_cell_21_layer_call_and_return_conditional_losses_4292607n
TensorArrayV2_1/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"ÿÿÿÿ   ¸
TensorArrayV2_1TensorListReserve&TensorArrayV2_1/element_shape:output:0strided_slice_1:output:0*
_output_shapes
: *
element_dtype0*

shape_type0:éèÒF
timeConst*
_output_shapes
: *
dtype0*
value	B : c
while/maximum_iterationsConst*
_output_shapes
: *
dtype0*
valueB :
ÿÿÿÿÿÿÿÿÿT
while/loop_counterConst*
_output_shapes
: *
dtype0*
value	B : 
whileWhilewhile/loop_counter:output:0!while/maximum_iterations:output:0time:output:0TensorArrayV2_1:handle:0zeros:output:0strided_slice_1:output:07TensorArrayUnstack/TensorListFromTensor:output_handle:0simple_rnn_cell_21_4292647simple_rnn_cell_21_4292649simple_rnn_cell_21_4292651*
T
2
*
_lower_using_switch_merge(*
_num_original_outputs
*9
_output_shapes'
%: : : : :ÿÿÿÿÿÿÿÿÿ: : : : : *%
_read_only_resource_inputs
	*
_stateful_parallelism( *
bodyR
while_body_4292659*
condR
while_cond_4292658*8
output_shapes'
%: : : : :ÿÿÿÿÿÿÿÿÿ: : : : : *
parallel_iterations 
0TensorArrayV2Stack/TensorListStack/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"ÿÿÿÿ   Ë
"TensorArrayV2Stack/TensorListStackTensorListStackwhile:output:39TensorArrayV2Stack/TensorListStack/element_shape:output:0*4
_output_shapes"
 :ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ*
element_dtype0h
strided_slice_3/stackConst*
_output_shapes
:*
dtype0*
valueB:
ÿÿÿÿÿÿÿÿÿa
strided_slice_3/stack_1Const*
_output_shapes
:*
dtype0*
valueB: a
strided_slice_3/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
strided_slice_3StridedSlice+TensorArrayV2Stack/TensorListStack:tensor:0strided_slice_3/stack:output:0 strided_slice_3/stack_1:output:0 strided_slice_3/stack_2:output:0*
Index0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
shrink_axis_maske
transpose_1/permConst*
_output_shapes
:*
dtype0*!
valueB"          
transpose_1	Transpose+TensorArrayV2Stack/TensorListStack:tensor:0transpose_1/perm:output:0*
T0*4
_output_shapes"
 :ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿg
IdentityIdentitystrided_slice_3:output:0^NoOp*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ{
NoOpNoOp+^simple_rnn_cell_21/StatefulPartitionedCall^while*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*9
_input_shapes(
&:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿi: : : 2X
*simple_rnn_cell_21/StatefulPartitionedCall*simple_rnn_cell_21/StatefulPartitionedCall2
whilewhile:\ X
4
_output_shapes"
 :ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿi
 
_user_specified_nameinputs
ß
¯
while_cond_4292658
while_while_loop_counter"
while_while_maximum_iterations
while_placeholder
while_placeholder_1
while_placeholder_2
while_less_strided_slice_15
1while_while_cond_4292658___redundant_placeholder05
1while_while_cond_4292658___redundant_placeholder15
1while_while_cond_4292658___redundant_placeholder25
1while_while_cond_4292658___redundant_placeholder3
while_identity
b

while/LessLesswhile_placeholderwhile_less_strided_slice_1*
T0*
_output_shapes
: K
while/IdentityIdentitywhile/Less:z:0*
T0
*
_output_shapes
: ")
while_identitywhile/Identity:output:0*(
_construction_contextkEagerRuntime*@
_input_shapes/
-: : : : :ÿÿÿÿÿÿÿÿÿ: ::::: 

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :-)
'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ:

_output_shapes
: :

_output_shapes
:
ß
¯
while_cond_4293498
while_while_loop_counter"
while_while_maximum_iterations
while_placeholder
while_placeholder_1
while_placeholder_2
while_less_strided_slice_15
1while_while_cond_4293498___redundant_placeholder05
1while_while_cond_4293498___redundant_placeholder15
1while_while_cond_4293498___redundant_placeholder25
1while_while_cond_4293498___redundant_placeholder3
while_identity
b

while/LessLesswhile_placeholderwhile_less_strided_slice_1*
T0*
_output_shapes
: K
while/IdentityIdentitywhile/Less:z:0*
T0
*
_output_shapes
: ")
while_identitywhile/Identity:output:0*(
_construction_contextkEagerRuntime*@
_input_shapes/
-: : : : :ÿÿÿÿÿÿÿÿÿ: ::::: 

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :-)
'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ:

_output_shapes
: :

_output_shapes
:
±!
ß
while_body_4292501
while_while_loop_counter"
while_while_maximum_iterations
while_placeholder
while_placeholder_1
while_placeholder_2
while_strided_slice_1_0W
Swhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor_04
"while_simple_rnn_cell_21_4292523_0:i0
"while_simple_rnn_cell_21_4292525_0:4
"while_simple_rnn_cell_21_4292527_0:
while_identity
while_identity_1
while_identity_2
while_identity_3
while_identity_4
while_strided_slice_1U
Qwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor2
 while_simple_rnn_cell_21_4292523:i.
 while_simple_rnn_cell_21_4292525:2
 while_simple_rnn_cell_21_4292527:¢0while/simple_rnn_cell_21/StatefulPartitionedCall
7while/TensorArrayV2Read/TensorListGetItem/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"ÿÿÿÿi   ¦
)while/TensorArrayV2Read/TensorListGetItemTensorListGetItemSwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor_0while_placeholder@while/TensorArrayV2Read/TensorListGetItem/element_shape:output:0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿi*
element_dtype0«
0while/simple_rnn_cell_21/StatefulPartitionedCallStatefulPartitionedCall0while/TensorArrayV2Read/TensorListGetItem:item:0while_placeholder_2"while_simple_rnn_cell_21_4292523_0"while_simple_rnn_cell_21_4292525_0"while_simple_rnn_cell_21_4292527_0*
Tin	
2*
Tout
2*
_collective_manager_ids
 *:
_output_shapes(
&:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ*%
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *X
fSRQ
O__inference_simple_rnn_cell_21_layer_call_and_return_conditional_losses_4292488â
*while/TensorArrayV2Write/TensorListSetItemTensorListSetItemwhile_placeholder_1while_placeholder9while/simple_rnn_cell_21/StatefulPartitionedCall:output:0*
_output_shapes
: *
element_dtype0:éèÒM
while/add/yConst*
_output_shapes
: *
dtype0*
value	B :\
	while/addAddV2while_placeholderwhile/add/y:output:0*
T0*
_output_shapes
: O
while/add_1/yConst*
_output_shapes
: *
dtype0*
value	B :g
while/add_1AddV2while_while_loop_counterwhile/add_1/y:output:0*
T0*
_output_shapes
: Y
while/IdentityIdentitywhile/add_1:z:0^while/NoOp*
T0*
_output_shapes
: j
while/Identity_1Identitywhile_while_maximum_iterations^while/NoOp*
T0*
_output_shapes
: Y
while/Identity_2Identitywhile/add:z:0^while/NoOp*
T0*
_output_shapes
: 
while/Identity_3Identity:while/TensorArrayV2Write/TensorListSetItem:output_handle:0^while/NoOp*
T0*
_output_shapes
: :éèÒ
while/Identity_4Identity9while/simple_rnn_cell_21/StatefulPartitionedCall:output:1^while/NoOp*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ

while/NoOpNoOp1^while/simple_rnn_cell_21/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 ")
while_identitywhile/Identity:output:0"-
while_identity_1while/Identity_1:output:0"-
while_identity_2while/Identity_2:output:0"-
while_identity_3while/Identity_3:output:0"-
while_identity_4while/Identity_4:output:0"F
 while_simple_rnn_cell_21_4292523"while_simple_rnn_cell_21_4292523_0"F
 while_simple_rnn_cell_21_4292525"while_simple_rnn_cell_21_4292525_0"F
 while_simple_rnn_cell_21_4292527"while_simple_rnn_cell_21_4292527_0"0
while_strided_slice_1while_strided_slice_1_0"¨
Qwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensorSwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor_0*(
_construction_contextkEagerRuntime*8
_input_shapes'
%: : : : :ÿÿÿÿÿÿÿÿÿ: : : : : 2d
0while/simple_rnn_cell_21/StatefulPartitionedCall0while/simple_rnn_cell_21/StatefulPartitionedCall: 

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :-)
'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ:

_output_shapes
: :

_output_shapes
: 
º
ì
O__inference_simple_rnn_cell_21_layer_call_and_return_conditional_losses_4293820

inputs
states_00
matmul_readvariableop_resource:i-
biasadd_readvariableop_resource:2
 matmul_1_readvariableop_resource:
identity

identity_1¢BiasAdd/ReadVariableOp¢MatMul/ReadVariableOp¢MatMul_1/ReadVariableOpt
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes

:i*
dtype0i
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿr
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0v
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿx
MatMul_1/ReadVariableOpReadVariableOp matmul_1_readvariableop_resource*
_output_shapes

:*
dtype0o
MatMul_1MatMulstates_0MatMul_1/ReadVariableOp:value:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿd
addAddV2BiasAdd:output:0MatMul_1:product:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿV
IdentityIdentityadd:z:0^NoOp*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿX

Identity_1Identityadd:z:0^NoOp*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp^MatMul_1/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0"!

identity_1Identity_1:output:0*(
_construction_contextkEagerRuntime*?
_input_shapes.
,:ÿÿÿÿÿÿÿÿÿi:ÿÿÿÿÿÿÿÿÿ: : : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp22
MatMul_1/ReadVariableOpMatMul_1/ReadVariableOp:O K
'
_output_shapes
:ÿÿÿÿÿÿÿÿÿi
 
_user_specified_nameinputs:QM
'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
"
_user_specified_name
states/0
½

Ü
4__inference_simple_rnn_cell_21_layer_call_fn_4293790

inputs
states_0
unknown:i
	unknown_0:
	unknown_1:
identity

identity_1¢StatefulPartitionedCall
StatefulPartitionedCallStatefulPartitionedCallinputsstates_0unknown	unknown_0	unknown_1*
Tin	
2*
Tout
2*
_collective_manager_ids
 *:
_output_shapes(
&:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ*%
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *X
fSRQ
O__inference_simple_rnn_cell_21_layer_call_and_return_conditional_losses_4292488o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿq

Identity_1Identity StatefulPartitionedCall:output:1^NoOp*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0"!

identity_1Identity_1:output:0*(
_construction_contextkEagerRuntime*?
_input_shapes.
,:ÿÿÿÿÿÿÿÿÿi:ÿÿÿÿÿÿÿÿÿ: : : 22
StatefulPartitionedCallStatefulPartitionedCall:O K
'
_output_shapes
:ÿÿÿÿÿÿÿÿÿi
 
_user_specified_nameinputs:QM
'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
"
_user_specified_name
states/0

»
/__inference_simple_rnn_21_layer_call_fn_4293330
inputs_0
unknown:i
	unknown_0:
	unknown_1:
identity¢StatefulPartitionedCallî
StatefulPartitionedCallStatefulPartitionedCallinputs_0unknown	unknown_0	unknown_1*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*%
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *S
fNRL
J__inference_simple_rnn_21_layer_call_and_return_conditional_losses_4292722o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*9
_input_shapes(
&:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿi: : : 22
StatefulPartitionedCallStatefulPartitionedCall:^ Z
4
_output_shapes"
 :ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿi
"
_user_specified_name
inputs/0
ä	

J__inference_sequential_20_layer_call_and_return_conditional_losses_4293044
simple_rnn_21_input'
simple_rnn_21_4293036:i#
simple_rnn_21_4293038:'
simple_rnn_21_4293040:
identity¢%simple_rnn_21/StatefulPartitionedCall­
%simple_rnn_21/StatefulPartitionedCallStatefulPartitionedCallsimple_rnn_21_inputsimple_rnn_21_4293036simple_rnn_21_4293038simple_rnn_21_4293040*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*%
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *S
fNRL
J__inference_simple_rnn_21_layer_call_and_return_conditional_losses_4292843}
IdentityIdentity.simple_rnn_21/StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿn
NoOpNoOp&^simple_rnn_21/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*0
_input_shapes
:ÿÿÿÿÿÿÿÿÿi: : : 2N
%simple_rnn_21/StatefulPartitionedCall%simple_rnn_21/StatefulPartitionedCall:` \
+
_output_shapes
:ÿÿÿÿÿÿÿÿÿi
-
_user_specified_namesimple_rnn_21_input
½	

J__inference_sequential_20_layer_call_and_return_conditional_losses_4292852

inputs'
simple_rnn_21_4292844:i#
simple_rnn_21_4292846:'
simple_rnn_21_4292848:
identity¢%simple_rnn_21/StatefulPartitionedCall 
%simple_rnn_21/StatefulPartitionedCallStatefulPartitionedCallinputssimple_rnn_21_4292844simple_rnn_21_4292846simple_rnn_21_4292848*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*%
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *S
fNRL
J__inference_simple_rnn_21_layer_call_and_return_conditional_losses_4292843}
IdentityIdentity.simple_rnn_21/StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿn
NoOpNoOp&^simple_rnn_21/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*0
_input_shapes
:ÿÿÿÿÿÿÿÿÿi: : : 2N
%simple_rnn_21/StatefulPartitionedCall%simple_rnn_21/StatefulPartitionedCall:S O
+
_output_shapes
:ÿÿÿÿÿÿÿÿÿi
 
_user_specified_nameinputs
ß
¯
while_cond_4292777
while_while_loop_counter"
while_while_maximum_iterations
while_placeholder
while_placeholder_1
while_placeholder_2
while_less_strided_slice_15
1while_while_cond_4292777___redundant_placeholder05
1while_while_cond_4292777___redundant_placeholder15
1while_while_cond_4292777___redundant_placeholder25
1while_while_cond_4292777___redundant_placeholder3
while_identity
b

while/LessLesswhile_placeholderwhile_less_strided_slice_1*
T0*
_output_shapes
: K
while/IdentityIdentitywhile/Less:z:0*
T0
*
_output_shapes
: ")
while_identitywhile/Identity:output:0*(
_construction_contextkEagerRuntime*@
_input_shapes/
-: : : : :ÿÿÿÿÿÿÿÿÿ: ::::: 

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :-)
'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ:

_output_shapes
: :

_output_shapes
:
´
ê
O__inference_simple_rnn_cell_21_layer_call_and_return_conditional_losses_4292488

inputs

states0
matmul_readvariableop_resource:i-
biasadd_readvariableop_resource:2
 matmul_1_readvariableop_resource:
identity

identity_1¢BiasAdd/ReadVariableOp¢MatMul/ReadVariableOp¢MatMul_1/ReadVariableOpt
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes

:i*
dtype0i
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿr
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0v
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿx
MatMul_1/ReadVariableOpReadVariableOp matmul_1_readvariableop_resource*
_output_shapes

:*
dtype0m
MatMul_1MatMulstatesMatMul_1/ReadVariableOp:value:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿd
addAddV2BiasAdd:output:0MatMul_1:product:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿV
IdentityIdentityadd:z:0^NoOp*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿX

Identity_1Identityadd:z:0^NoOp*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp^MatMul_1/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0"!

identity_1Identity_1:output:0*(
_construction_contextkEagerRuntime*?
_input_shapes.
,:ÿÿÿÿÿÿÿÿÿi:ÿÿÿÿÿÿÿÿÿ: : : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp22
MatMul_1/ReadVariableOpMatMul_1/ReadVariableOp:O K
'
_output_shapes
:ÿÿÿÿÿÿÿÿÿi
 
_user_specified_nameinputs:OK
'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
 
_user_specified_namestates
à<
Ã
J__inference_simple_rnn_21_layer_call_and_return_conditional_losses_4293776

inputsC
1simple_rnn_cell_21_matmul_readvariableop_resource:i@
2simple_rnn_cell_21_biasadd_readvariableop_resource:E
3simple_rnn_cell_21_matmul_1_readvariableop_resource:
identity¢)simple_rnn_cell_21/BiasAdd/ReadVariableOp¢(simple_rnn_cell_21/MatMul/ReadVariableOp¢*simple_rnn_cell_21/MatMul_1/ReadVariableOp¢while;
ShapeShapeinputs*
T0*
_output_shapes
:]
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: _
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:_
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:Ñ
strided_sliceStridedSliceShape:output:0strided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskP
zeros/packed/1Const*
_output_shapes
: *
dtype0*
value	B :s
zeros/packedPackstrided_slice:output:0zeros/packed/1:output:0*
N*
T0*
_output_shapes
:P
zeros/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    l
zerosFillzeros/packed:output:0zeros/Const:output:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿc
transpose/permConst*
_output_shapes
:*
dtype0*!
valueB"          m
	transpose	Transposeinputstranspose/perm:output:0*
T0*+
_output_shapes
:ÿÿÿÿÿÿÿÿÿiD
Shape_1Shapetranspose:y:0*
T0*
_output_shapes
:_
strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: a
strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:Û
strided_slice_1StridedSliceShape_1:output:0strided_slice_1/stack:output:0 strided_slice_1/stack_1:output:0 strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskf
TensorArrayV2/element_shapeConst*
_output_shapes
: *
dtype0*
valueB :
ÿÿÿÿÿÿÿÿÿ´
TensorArrayV2TensorListReserve$TensorArrayV2/element_shape:output:0strided_slice_1:output:0*
_output_shapes
: *
element_dtype0*

shape_type0:éèÒ
5TensorArrayUnstack/TensorListFromTensor/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"ÿÿÿÿi   à
'TensorArrayUnstack/TensorListFromTensorTensorListFromTensortranspose:y:0>TensorArrayUnstack/TensorListFromTensor/element_shape:output:0*
_output_shapes
: *
element_dtype0*

shape_type0:éèÒ_
strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB: a
strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:é
strided_slice_2StridedSlicetranspose:y:0strided_slice_2/stack:output:0 strided_slice_2/stack_1:output:0 strided_slice_2/stack_2:output:0*
Index0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿi*
shrink_axis_mask
(simple_rnn_cell_21/MatMul/ReadVariableOpReadVariableOp1simple_rnn_cell_21_matmul_readvariableop_resource*
_output_shapes

:i*
dtype0¡
simple_rnn_cell_21/MatMulMatMulstrided_slice_2:output:00simple_rnn_cell_21/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
)simple_rnn_cell_21/BiasAdd/ReadVariableOpReadVariableOp2simple_rnn_cell_21_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0¯
simple_rnn_cell_21/BiasAddBiasAdd#simple_rnn_cell_21/MatMul:product:01simple_rnn_cell_21/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
*simple_rnn_cell_21/MatMul_1/ReadVariableOpReadVariableOp3simple_rnn_cell_21_matmul_1_readvariableop_resource*
_output_shapes

:*
dtype0
simple_rnn_cell_21/MatMul_1MatMulzeros:output:02simple_rnn_cell_21/MatMul_1/ReadVariableOp:value:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
simple_rnn_cell_21/addAddV2#simple_rnn_cell_21/BiasAdd:output:0%simple_rnn_cell_21/MatMul_1:product:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿn
TensorArrayV2_1/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"ÿÿÿÿ   ¸
TensorArrayV2_1TensorListReserve&TensorArrayV2_1/element_shape:output:0strided_slice_1:output:0*
_output_shapes
: *
element_dtype0*

shape_type0:éèÒF
timeConst*
_output_shapes
: *
dtype0*
value	B : c
while/maximum_iterationsConst*
_output_shapes
: *
dtype0*
valueB :
ÿÿÿÿÿÿÿÿÿT
while/loop_counterConst*
_output_shapes
: *
dtype0*
value	B : Ý
whileWhilewhile/loop_counter:output:0!while/maximum_iterations:output:0time:output:0TensorArrayV2_1:handle:0zeros:output:0strided_slice_1:output:07TensorArrayUnstack/TensorListFromTensor:output_handle:01simple_rnn_cell_21_matmul_readvariableop_resource2simple_rnn_cell_21_biasadd_readvariableop_resource3simple_rnn_cell_21_matmul_1_readvariableop_resource*
T
2
*
_lower_using_switch_merge(*
_num_original_outputs
*9
_output_shapes'
%: : : : :ÿÿÿÿÿÿÿÿÿ: : : : : *%
_read_only_resource_inputs
	*
_stateful_parallelism( *
bodyR
while_body_4293711*
condR
while_cond_4293710*8
output_shapes'
%: : : : :ÿÿÿÿÿÿÿÿÿ: : : : : *
parallel_iterations 
0TensorArrayV2Stack/TensorListStack/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"ÿÿÿÿ   Â
"TensorArrayV2Stack/TensorListStackTensorListStackwhile:output:39TensorArrayV2Stack/TensorListStack/element_shape:output:0*+
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
element_dtype0h
strided_slice_3/stackConst*
_output_shapes
:*
dtype0*
valueB:
ÿÿÿÿÿÿÿÿÿa
strided_slice_3/stack_1Const*
_output_shapes
:*
dtype0*
valueB: a
strided_slice_3/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
strided_slice_3StridedSlice+TensorArrayV2Stack/TensorListStack:tensor:0strided_slice_3/stack:output:0 strided_slice_3/stack_1:output:0 strided_slice_3/stack_2:output:0*
Index0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
shrink_axis_maske
transpose_1/permConst*
_output_shapes
:*
dtype0*!
valueB"          
transpose_1	Transpose+TensorArrayV2Stack/TensorListStack:tensor:0transpose_1/perm:output:0*
T0*+
_output_shapes
:ÿÿÿÿÿÿÿÿÿg
IdentityIdentitystrided_slice_3:output:0^NoOp*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿÒ
NoOpNoOp*^simple_rnn_cell_21/BiasAdd/ReadVariableOp)^simple_rnn_cell_21/MatMul/ReadVariableOp+^simple_rnn_cell_21/MatMul_1/ReadVariableOp^while*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*0
_input_shapes
:ÿÿÿÿÿÿÿÿÿi: : : 2V
)simple_rnn_cell_21/BiasAdd/ReadVariableOp)simple_rnn_cell_21/BiasAdd/ReadVariableOp2T
(simple_rnn_cell_21/MatMul/ReadVariableOp(simple_rnn_cell_21/MatMul/ReadVariableOp2X
*simple_rnn_cell_21/MatMul_1/ReadVariableOp*simple_rnn_cell_21/MatMul_1/ReadVariableOp2
whilewhile:S O
+
_output_shapes
:ÿÿÿÿÿÿÿÿÿi
 
_user_specified_nameinputs
à<
Ã
J__inference_simple_rnn_21_layer_call_and_return_conditional_losses_4292980

inputsC
1simple_rnn_cell_21_matmul_readvariableop_resource:i@
2simple_rnn_cell_21_biasadd_readvariableop_resource:E
3simple_rnn_cell_21_matmul_1_readvariableop_resource:
identity¢)simple_rnn_cell_21/BiasAdd/ReadVariableOp¢(simple_rnn_cell_21/MatMul/ReadVariableOp¢*simple_rnn_cell_21/MatMul_1/ReadVariableOp¢while;
ShapeShapeinputs*
T0*
_output_shapes
:]
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: _
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:_
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:Ñ
strided_sliceStridedSliceShape:output:0strided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskP
zeros/packed/1Const*
_output_shapes
: *
dtype0*
value	B :s
zeros/packedPackstrided_slice:output:0zeros/packed/1:output:0*
N*
T0*
_output_shapes
:P
zeros/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    l
zerosFillzeros/packed:output:0zeros/Const:output:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿc
transpose/permConst*
_output_shapes
:*
dtype0*!
valueB"          m
	transpose	Transposeinputstranspose/perm:output:0*
T0*+
_output_shapes
:ÿÿÿÿÿÿÿÿÿiD
Shape_1Shapetranspose:y:0*
T0*
_output_shapes
:_
strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: a
strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:Û
strided_slice_1StridedSliceShape_1:output:0strided_slice_1/stack:output:0 strided_slice_1/stack_1:output:0 strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskf
TensorArrayV2/element_shapeConst*
_output_shapes
: *
dtype0*
valueB :
ÿÿÿÿÿÿÿÿÿ´
TensorArrayV2TensorListReserve$TensorArrayV2/element_shape:output:0strided_slice_1:output:0*
_output_shapes
: *
element_dtype0*

shape_type0:éèÒ
5TensorArrayUnstack/TensorListFromTensor/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"ÿÿÿÿi   à
'TensorArrayUnstack/TensorListFromTensorTensorListFromTensortranspose:y:0>TensorArrayUnstack/TensorListFromTensor/element_shape:output:0*
_output_shapes
: *
element_dtype0*

shape_type0:éèÒ_
strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB: a
strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:é
strided_slice_2StridedSlicetranspose:y:0strided_slice_2/stack:output:0 strided_slice_2/stack_1:output:0 strided_slice_2/stack_2:output:0*
Index0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿi*
shrink_axis_mask
(simple_rnn_cell_21/MatMul/ReadVariableOpReadVariableOp1simple_rnn_cell_21_matmul_readvariableop_resource*
_output_shapes

:i*
dtype0¡
simple_rnn_cell_21/MatMulMatMulstrided_slice_2:output:00simple_rnn_cell_21/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
)simple_rnn_cell_21/BiasAdd/ReadVariableOpReadVariableOp2simple_rnn_cell_21_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0¯
simple_rnn_cell_21/BiasAddBiasAdd#simple_rnn_cell_21/MatMul:product:01simple_rnn_cell_21/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
*simple_rnn_cell_21/MatMul_1/ReadVariableOpReadVariableOp3simple_rnn_cell_21_matmul_1_readvariableop_resource*
_output_shapes

:*
dtype0
simple_rnn_cell_21/MatMul_1MatMulzeros:output:02simple_rnn_cell_21/MatMul_1/ReadVariableOp:value:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
simple_rnn_cell_21/addAddV2#simple_rnn_cell_21/BiasAdd:output:0%simple_rnn_cell_21/MatMul_1:product:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿn
TensorArrayV2_1/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"ÿÿÿÿ   ¸
TensorArrayV2_1TensorListReserve&TensorArrayV2_1/element_shape:output:0strided_slice_1:output:0*
_output_shapes
: *
element_dtype0*

shape_type0:éèÒF
timeConst*
_output_shapes
: *
dtype0*
value	B : c
while/maximum_iterationsConst*
_output_shapes
: *
dtype0*
valueB :
ÿÿÿÿÿÿÿÿÿT
while/loop_counterConst*
_output_shapes
: *
dtype0*
value	B : Ý
whileWhilewhile/loop_counter:output:0!while/maximum_iterations:output:0time:output:0TensorArrayV2_1:handle:0zeros:output:0strided_slice_1:output:07TensorArrayUnstack/TensorListFromTensor:output_handle:01simple_rnn_cell_21_matmul_readvariableop_resource2simple_rnn_cell_21_biasadd_readvariableop_resource3simple_rnn_cell_21_matmul_1_readvariableop_resource*
T
2
*
_lower_using_switch_merge(*
_num_original_outputs
*9
_output_shapes'
%: : : : :ÿÿÿÿÿÿÿÿÿ: : : : : *%
_read_only_resource_inputs
	*
_stateful_parallelism( *
bodyR
while_body_4292915*
condR
while_cond_4292914*8
output_shapes'
%: : : : :ÿÿÿÿÿÿÿÿÿ: : : : : *
parallel_iterations 
0TensorArrayV2Stack/TensorListStack/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"ÿÿÿÿ   Â
"TensorArrayV2Stack/TensorListStackTensorListStackwhile:output:39TensorArrayV2Stack/TensorListStack/element_shape:output:0*+
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
element_dtype0h
strided_slice_3/stackConst*
_output_shapes
:*
dtype0*
valueB:
ÿÿÿÿÿÿÿÿÿa
strided_slice_3/stack_1Const*
_output_shapes
:*
dtype0*
valueB: a
strided_slice_3/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
strided_slice_3StridedSlice+TensorArrayV2Stack/TensorListStack:tensor:0strided_slice_3/stack:output:0 strided_slice_3/stack_1:output:0 strided_slice_3/stack_2:output:0*
Index0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
shrink_axis_maske
transpose_1/permConst*
_output_shapes
:*
dtype0*!
valueB"          
transpose_1	Transpose+TensorArrayV2Stack/TensorListStack:tensor:0transpose_1/perm:output:0*
T0*+
_output_shapes
:ÿÿÿÿÿÿÿÿÿg
IdentityIdentitystrided_slice_3:output:0^NoOp*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿÒ
NoOpNoOp*^simple_rnn_cell_21/BiasAdd/ReadVariableOp)^simple_rnn_cell_21/MatMul/ReadVariableOp+^simple_rnn_cell_21/MatMul_1/ReadVariableOp^while*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*0
_input_shapes
:ÿÿÿÿÿÿÿÿÿi: : : 2V
)simple_rnn_cell_21/BiasAdd/ReadVariableOp)simple_rnn_cell_21/BiasAdd/ReadVariableOp2T
(simple_rnn_cell_21/MatMul/ReadVariableOp(simple_rnn_cell_21/MatMul/ReadVariableOp2X
*simple_rnn_cell_21/MatMul_1/ReadVariableOp*simple_rnn_cell_21/MatMul_1/ReadVariableOp2
whilewhile:S O
+
_output_shapes
:ÿÿÿÿÿÿÿÿÿi
 
_user_specified_nameinputs

»
/__inference_simple_rnn_21_layer_call_fn_4293319
inputs_0
unknown:i
	unknown_0:
	unknown_1:
identity¢StatefulPartitionedCallî
StatefulPartitionedCallStatefulPartitionedCallinputs_0unknown	unknown_0	unknown_1*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*%
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *S
fNRL
J__inference_simple_rnn_21_layer_call_and_return_conditional_losses_4292564o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*9
_input_shapes(
&:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿi: : : 22
StatefulPartitionedCallStatefulPartitionedCall:^ Z
4
_output_shapes"
 :ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿi
"
_user_specified_name
inputs/0
ÍE

.sequential_20_simple_rnn_21_while_body_4292376T
Psequential_20_simple_rnn_21_while_sequential_20_simple_rnn_21_while_loop_counterZ
Vsequential_20_simple_rnn_21_while_sequential_20_simple_rnn_21_while_maximum_iterations1
-sequential_20_simple_rnn_21_while_placeholder3
/sequential_20_simple_rnn_21_while_placeholder_13
/sequential_20_simple_rnn_21_while_placeholder_2S
Osequential_20_simple_rnn_21_while_sequential_20_simple_rnn_21_strided_slice_1_0
sequential_20_simple_rnn_21_while_tensorarrayv2read_tensorlistgetitem_sequential_20_simple_rnn_21_tensorarrayunstack_tensorlistfromtensor_0g
Usequential_20_simple_rnn_21_while_simple_rnn_cell_21_matmul_readvariableop_resource_0:id
Vsequential_20_simple_rnn_21_while_simple_rnn_cell_21_biasadd_readvariableop_resource_0:i
Wsequential_20_simple_rnn_21_while_simple_rnn_cell_21_matmul_1_readvariableop_resource_0:.
*sequential_20_simple_rnn_21_while_identity0
,sequential_20_simple_rnn_21_while_identity_10
,sequential_20_simple_rnn_21_while_identity_20
,sequential_20_simple_rnn_21_while_identity_30
,sequential_20_simple_rnn_21_while_identity_4Q
Msequential_20_simple_rnn_21_while_sequential_20_simple_rnn_21_strided_slice_1
sequential_20_simple_rnn_21_while_tensorarrayv2read_tensorlistgetitem_sequential_20_simple_rnn_21_tensorarrayunstack_tensorlistfromtensore
Ssequential_20_simple_rnn_21_while_simple_rnn_cell_21_matmul_readvariableop_resource:ib
Tsequential_20_simple_rnn_21_while_simple_rnn_cell_21_biasadd_readvariableop_resource:g
Usequential_20_simple_rnn_21_while_simple_rnn_cell_21_matmul_1_readvariableop_resource:¢Ksequential_20/simple_rnn_21/while/simple_rnn_cell_21/BiasAdd/ReadVariableOp¢Jsequential_20/simple_rnn_21/while/simple_rnn_cell_21/MatMul/ReadVariableOp¢Lsequential_20/simple_rnn_21/while/simple_rnn_cell_21/MatMul_1/ReadVariableOp¤
Ssequential_20/simple_rnn_21/while/TensorArrayV2Read/TensorListGetItem/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"ÿÿÿÿi   ³
Esequential_20/simple_rnn_21/while/TensorArrayV2Read/TensorListGetItemTensorListGetItemsequential_20_simple_rnn_21_while_tensorarrayv2read_tensorlistgetitem_sequential_20_simple_rnn_21_tensorarrayunstack_tensorlistfromtensor_0-sequential_20_simple_rnn_21_while_placeholder\sequential_20/simple_rnn_21/while/TensorArrayV2Read/TensorListGetItem/element_shape:output:0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿi*
element_dtype0à
Jsequential_20/simple_rnn_21/while/simple_rnn_cell_21/MatMul/ReadVariableOpReadVariableOpUsequential_20_simple_rnn_21_while_simple_rnn_cell_21_matmul_readvariableop_resource_0*
_output_shapes

:i*
dtype0
;sequential_20/simple_rnn_21/while/simple_rnn_cell_21/MatMulMatMulLsequential_20/simple_rnn_21/while/TensorArrayV2Read/TensorListGetItem:item:0Rsequential_20/simple_rnn_21/while/simple_rnn_cell_21/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿÞ
Ksequential_20/simple_rnn_21/while/simple_rnn_cell_21/BiasAdd/ReadVariableOpReadVariableOpVsequential_20_simple_rnn_21_while_simple_rnn_cell_21_biasadd_readvariableop_resource_0*
_output_shapes
:*
dtype0
<sequential_20/simple_rnn_21/while/simple_rnn_cell_21/BiasAddBiasAddEsequential_20/simple_rnn_21/while/simple_rnn_cell_21/MatMul:product:0Ssequential_20/simple_rnn_21/while/simple_rnn_cell_21/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿä
Lsequential_20/simple_rnn_21/while/simple_rnn_cell_21/MatMul_1/ReadVariableOpReadVariableOpWsequential_20_simple_rnn_21_while_simple_rnn_cell_21_matmul_1_readvariableop_resource_0*
_output_shapes

:*
dtype0
=sequential_20/simple_rnn_21/while/simple_rnn_cell_21/MatMul_1MatMul/sequential_20_simple_rnn_21_while_placeholder_2Tsequential_20/simple_rnn_21/while/simple_rnn_cell_21/MatMul_1/ReadVariableOp:value:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
8sequential_20/simple_rnn_21/while/simple_rnn_cell_21/addAddV2Esequential_20/simple_rnn_21/while/simple_rnn_cell_21/BiasAdd:output:0Gsequential_20/simple_rnn_21/while/simple_rnn_cell_21/MatMul_1:product:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ¹
Fsequential_20/simple_rnn_21/while/TensorArrayV2Write/TensorListSetItemTensorListSetItem/sequential_20_simple_rnn_21_while_placeholder_1-sequential_20_simple_rnn_21_while_placeholder<sequential_20/simple_rnn_21/while/simple_rnn_cell_21/add:z:0*
_output_shapes
: *
element_dtype0:éèÒi
'sequential_20/simple_rnn_21/while/add/yConst*
_output_shapes
: *
dtype0*
value	B :°
%sequential_20/simple_rnn_21/while/addAddV2-sequential_20_simple_rnn_21_while_placeholder0sequential_20/simple_rnn_21/while/add/y:output:0*
T0*
_output_shapes
: k
)sequential_20/simple_rnn_21/while/add_1/yConst*
_output_shapes
: *
dtype0*
value	B :×
'sequential_20/simple_rnn_21/while/add_1AddV2Psequential_20_simple_rnn_21_while_sequential_20_simple_rnn_21_while_loop_counter2sequential_20/simple_rnn_21/while/add_1/y:output:0*
T0*
_output_shapes
: ­
*sequential_20/simple_rnn_21/while/IdentityIdentity+sequential_20/simple_rnn_21/while/add_1:z:0'^sequential_20/simple_rnn_21/while/NoOp*
T0*
_output_shapes
: Ú
,sequential_20/simple_rnn_21/while/Identity_1IdentityVsequential_20_simple_rnn_21_while_sequential_20_simple_rnn_21_while_maximum_iterations'^sequential_20/simple_rnn_21/while/NoOp*
T0*
_output_shapes
: ­
,sequential_20/simple_rnn_21/while/Identity_2Identity)sequential_20/simple_rnn_21/while/add:z:0'^sequential_20/simple_rnn_21/while/NoOp*
T0*
_output_shapes
: í
,sequential_20/simple_rnn_21/while/Identity_3IdentityVsequential_20/simple_rnn_21/while/TensorArrayV2Write/TensorListSetItem:output_handle:0'^sequential_20/simple_rnn_21/while/NoOp*
T0*
_output_shapes
: :éèÒÑ
,sequential_20/simple_rnn_21/while/Identity_4Identity<sequential_20/simple_rnn_21/while/simple_rnn_cell_21/add:z:0'^sequential_20/simple_rnn_21/while/NoOp*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿÒ
&sequential_20/simple_rnn_21/while/NoOpNoOpL^sequential_20/simple_rnn_21/while/simple_rnn_cell_21/BiasAdd/ReadVariableOpK^sequential_20/simple_rnn_21/while/simple_rnn_cell_21/MatMul/ReadVariableOpM^sequential_20/simple_rnn_21/while/simple_rnn_cell_21/MatMul_1/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "a
*sequential_20_simple_rnn_21_while_identity3sequential_20/simple_rnn_21/while/Identity:output:0"e
,sequential_20_simple_rnn_21_while_identity_15sequential_20/simple_rnn_21/while/Identity_1:output:0"e
,sequential_20_simple_rnn_21_while_identity_25sequential_20/simple_rnn_21/while/Identity_2:output:0"e
,sequential_20_simple_rnn_21_while_identity_35sequential_20/simple_rnn_21/while/Identity_3:output:0"e
,sequential_20_simple_rnn_21_while_identity_45sequential_20/simple_rnn_21/while/Identity_4:output:0" 
Msequential_20_simple_rnn_21_while_sequential_20_simple_rnn_21_strided_slice_1Osequential_20_simple_rnn_21_while_sequential_20_simple_rnn_21_strided_slice_1_0"®
Tsequential_20_simple_rnn_21_while_simple_rnn_cell_21_biasadd_readvariableop_resourceVsequential_20_simple_rnn_21_while_simple_rnn_cell_21_biasadd_readvariableop_resource_0"°
Usequential_20_simple_rnn_21_while_simple_rnn_cell_21_matmul_1_readvariableop_resourceWsequential_20_simple_rnn_21_while_simple_rnn_cell_21_matmul_1_readvariableop_resource_0"¬
Ssequential_20_simple_rnn_21_while_simple_rnn_cell_21_matmul_readvariableop_resourceUsequential_20_simple_rnn_21_while_simple_rnn_cell_21_matmul_readvariableop_resource_0"
sequential_20_simple_rnn_21_while_tensorarrayv2read_tensorlistgetitem_sequential_20_simple_rnn_21_tensorarrayunstack_tensorlistfromtensorsequential_20_simple_rnn_21_while_tensorarrayv2read_tensorlistgetitem_sequential_20_simple_rnn_21_tensorarrayunstack_tensorlistfromtensor_0*(
_construction_contextkEagerRuntime*8
_input_shapes'
%: : : : :ÿÿÿÿÿÿÿÿÿ: : : : : 2
Ksequential_20/simple_rnn_21/while/simple_rnn_cell_21/BiasAdd/ReadVariableOpKsequential_20/simple_rnn_21/while/simple_rnn_cell_21/BiasAdd/ReadVariableOp2
Jsequential_20/simple_rnn_21/while/simple_rnn_cell_21/MatMul/ReadVariableOpJsequential_20/simple_rnn_21/while/simple_rnn_cell_21/MatMul/ReadVariableOp2
Lsequential_20/simple_rnn_21/while/simple_rnn_cell_21/MatMul_1/ReadVariableOpLsequential_20/simple_rnn_21/while/simple_rnn_cell_21/MatMul_1/ReadVariableOp: 

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :-)
'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ:

_output_shapes
: :

_output_shapes
: 
=
Å
J__inference_simple_rnn_21_layer_call_and_return_conditional_losses_4293458
inputs_0C
1simple_rnn_cell_21_matmul_readvariableop_resource:i@
2simple_rnn_cell_21_biasadd_readvariableop_resource:E
3simple_rnn_cell_21_matmul_1_readvariableop_resource:
identity¢)simple_rnn_cell_21/BiasAdd/ReadVariableOp¢(simple_rnn_cell_21/MatMul/ReadVariableOp¢*simple_rnn_cell_21/MatMul_1/ReadVariableOp¢while=
ShapeShapeinputs_0*
T0*
_output_shapes
:]
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: _
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:_
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:Ñ
strided_sliceStridedSliceShape:output:0strided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskP
zeros/packed/1Const*
_output_shapes
: *
dtype0*
value	B :s
zeros/packedPackstrided_slice:output:0zeros/packed/1:output:0*
N*
T0*
_output_shapes
:P
zeros/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    l
zerosFillzeros/packed:output:0zeros/Const:output:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿc
transpose/permConst*
_output_shapes
:*
dtype0*!
valueB"          x
	transpose	Transposeinputs_0transpose/perm:output:0*
T0*4
_output_shapes"
 :ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿiD
Shape_1Shapetranspose:y:0*
T0*
_output_shapes
:_
strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: a
strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:Û
strided_slice_1StridedSliceShape_1:output:0strided_slice_1/stack:output:0 strided_slice_1/stack_1:output:0 strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskf
TensorArrayV2/element_shapeConst*
_output_shapes
: *
dtype0*
valueB :
ÿÿÿÿÿÿÿÿÿ´
TensorArrayV2TensorListReserve$TensorArrayV2/element_shape:output:0strided_slice_1:output:0*
_output_shapes
: *
element_dtype0*

shape_type0:éèÒ
5TensorArrayUnstack/TensorListFromTensor/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"ÿÿÿÿi   à
'TensorArrayUnstack/TensorListFromTensorTensorListFromTensortranspose:y:0>TensorArrayUnstack/TensorListFromTensor/element_shape:output:0*
_output_shapes
: *
element_dtype0*

shape_type0:éèÒ_
strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB: a
strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:é
strided_slice_2StridedSlicetranspose:y:0strided_slice_2/stack:output:0 strided_slice_2/stack_1:output:0 strided_slice_2/stack_2:output:0*
Index0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿi*
shrink_axis_mask
(simple_rnn_cell_21/MatMul/ReadVariableOpReadVariableOp1simple_rnn_cell_21_matmul_readvariableop_resource*
_output_shapes

:i*
dtype0¡
simple_rnn_cell_21/MatMulMatMulstrided_slice_2:output:00simple_rnn_cell_21/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
)simple_rnn_cell_21/BiasAdd/ReadVariableOpReadVariableOp2simple_rnn_cell_21_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0¯
simple_rnn_cell_21/BiasAddBiasAdd#simple_rnn_cell_21/MatMul:product:01simple_rnn_cell_21/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
*simple_rnn_cell_21/MatMul_1/ReadVariableOpReadVariableOp3simple_rnn_cell_21_matmul_1_readvariableop_resource*
_output_shapes

:*
dtype0
simple_rnn_cell_21/MatMul_1MatMulzeros:output:02simple_rnn_cell_21/MatMul_1/ReadVariableOp:value:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
simple_rnn_cell_21/addAddV2#simple_rnn_cell_21/BiasAdd:output:0%simple_rnn_cell_21/MatMul_1:product:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿn
TensorArrayV2_1/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"ÿÿÿÿ   ¸
TensorArrayV2_1TensorListReserve&TensorArrayV2_1/element_shape:output:0strided_slice_1:output:0*
_output_shapes
: *
element_dtype0*

shape_type0:éèÒF
timeConst*
_output_shapes
: *
dtype0*
value	B : c
while/maximum_iterationsConst*
_output_shapes
: *
dtype0*
valueB :
ÿÿÿÿÿÿÿÿÿT
while/loop_counterConst*
_output_shapes
: *
dtype0*
value	B : Ý
whileWhilewhile/loop_counter:output:0!while/maximum_iterations:output:0time:output:0TensorArrayV2_1:handle:0zeros:output:0strided_slice_1:output:07TensorArrayUnstack/TensorListFromTensor:output_handle:01simple_rnn_cell_21_matmul_readvariableop_resource2simple_rnn_cell_21_biasadd_readvariableop_resource3simple_rnn_cell_21_matmul_1_readvariableop_resource*
T
2
*
_lower_using_switch_merge(*
_num_original_outputs
*9
_output_shapes'
%: : : : :ÿÿÿÿÿÿÿÿÿ: : : : : *%
_read_only_resource_inputs
	*
_stateful_parallelism( *
bodyR
while_body_4293393*
condR
while_cond_4293392*8
output_shapes'
%: : : : :ÿÿÿÿÿÿÿÿÿ: : : : : *
parallel_iterations 
0TensorArrayV2Stack/TensorListStack/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"ÿÿÿÿ   Ë
"TensorArrayV2Stack/TensorListStackTensorListStackwhile:output:39TensorArrayV2Stack/TensorListStack/element_shape:output:0*4
_output_shapes"
 :ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ*
element_dtype0h
strided_slice_3/stackConst*
_output_shapes
:*
dtype0*
valueB:
ÿÿÿÿÿÿÿÿÿa
strided_slice_3/stack_1Const*
_output_shapes
:*
dtype0*
valueB: a
strided_slice_3/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
strided_slice_3StridedSlice+TensorArrayV2Stack/TensorListStack:tensor:0strided_slice_3/stack:output:0 strided_slice_3/stack_1:output:0 strided_slice_3/stack_2:output:0*
Index0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
shrink_axis_maske
transpose_1/permConst*
_output_shapes
:*
dtype0*!
valueB"          
transpose_1	Transpose+TensorArrayV2Stack/TensorListStack:tensor:0transpose_1/perm:output:0*
T0*4
_output_shapes"
 :ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿg
IdentityIdentitystrided_slice_3:output:0^NoOp*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿÒ
NoOpNoOp*^simple_rnn_cell_21/BiasAdd/ReadVariableOp)^simple_rnn_cell_21/MatMul/ReadVariableOp+^simple_rnn_cell_21/MatMul_1/ReadVariableOp^while*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*9
_input_shapes(
&:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿi: : : 2V
)simple_rnn_cell_21/BiasAdd/ReadVariableOp)simple_rnn_cell_21/BiasAdd/ReadVariableOp2T
(simple_rnn_cell_21/MatMul/ReadVariableOp(simple_rnn_cell_21/MatMul/ReadVariableOp2X
*simple_rnn_cell_21/MatMul_1/ReadVariableOp*simple_rnn_cell_21/MatMul_1/ReadVariableOp2
whilewhile:^ Z
4
_output_shapes"
 :ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿi
"
_user_specified_name
inputs/0
=
Å
J__inference_simple_rnn_21_layer_call_and_return_conditional_losses_4293564
inputs_0C
1simple_rnn_cell_21_matmul_readvariableop_resource:i@
2simple_rnn_cell_21_biasadd_readvariableop_resource:E
3simple_rnn_cell_21_matmul_1_readvariableop_resource:
identity¢)simple_rnn_cell_21/BiasAdd/ReadVariableOp¢(simple_rnn_cell_21/MatMul/ReadVariableOp¢*simple_rnn_cell_21/MatMul_1/ReadVariableOp¢while=
ShapeShapeinputs_0*
T0*
_output_shapes
:]
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: _
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:_
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:Ñ
strided_sliceStridedSliceShape:output:0strided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskP
zeros/packed/1Const*
_output_shapes
: *
dtype0*
value	B :s
zeros/packedPackstrided_slice:output:0zeros/packed/1:output:0*
N*
T0*
_output_shapes
:P
zeros/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    l
zerosFillzeros/packed:output:0zeros/Const:output:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿc
transpose/permConst*
_output_shapes
:*
dtype0*!
valueB"          x
	transpose	Transposeinputs_0transpose/perm:output:0*
T0*4
_output_shapes"
 :ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿiD
Shape_1Shapetranspose:y:0*
T0*
_output_shapes
:_
strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: a
strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:Û
strided_slice_1StridedSliceShape_1:output:0strided_slice_1/stack:output:0 strided_slice_1/stack_1:output:0 strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskf
TensorArrayV2/element_shapeConst*
_output_shapes
: *
dtype0*
valueB :
ÿÿÿÿÿÿÿÿÿ´
TensorArrayV2TensorListReserve$TensorArrayV2/element_shape:output:0strided_slice_1:output:0*
_output_shapes
: *
element_dtype0*

shape_type0:éèÒ
5TensorArrayUnstack/TensorListFromTensor/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"ÿÿÿÿi   à
'TensorArrayUnstack/TensorListFromTensorTensorListFromTensortranspose:y:0>TensorArrayUnstack/TensorListFromTensor/element_shape:output:0*
_output_shapes
: *
element_dtype0*

shape_type0:éèÒ_
strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB: a
strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:é
strided_slice_2StridedSlicetranspose:y:0strided_slice_2/stack:output:0 strided_slice_2/stack_1:output:0 strided_slice_2/stack_2:output:0*
Index0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿi*
shrink_axis_mask
(simple_rnn_cell_21/MatMul/ReadVariableOpReadVariableOp1simple_rnn_cell_21_matmul_readvariableop_resource*
_output_shapes

:i*
dtype0¡
simple_rnn_cell_21/MatMulMatMulstrided_slice_2:output:00simple_rnn_cell_21/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
)simple_rnn_cell_21/BiasAdd/ReadVariableOpReadVariableOp2simple_rnn_cell_21_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0¯
simple_rnn_cell_21/BiasAddBiasAdd#simple_rnn_cell_21/MatMul:product:01simple_rnn_cell_21/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
*simple_rnn_cell_21/MatMul_1/ReadVariableOpReadVariableOp3simple_rnn_cell_21_matmul_1_readvariableop_resource*
_output_shapes

:*
dtype0
simple_rnn_cell_21/MatMul_1MatMulzeros:output:02simple_rnn_cell_21/MatMul_1/ReadVariableOp:value:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
simple_rnn_cell_21/addAddV2#simple_rnn_cell_21/BiasAdd:output:0%simple_rnn_cell_21/MatMul_1:product:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿn
TensorArrayV2_1/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"ÿÿÿÿ   ¸
TensorArrayV2_1TensorListReserve&TensorArrayV2_1/element_shape:output:0strided_slice_1:output:0*
_output_shapes
: *
element_dtype0*

shape_type0:éèÒF
timeConst*
_output_shapes
: *
dtype0*
value	B : c
while/maximum_iterationsConst*
_output_shapes
: *
dtype0*
valueB :
ÿÿÿÿÿÿÿÿÿT
while/loop_counterConst*
_output_shapes
: *
dtype0*
value	B : Ý
whileWhilewhile/loop_counter:output:0!while/maximum_iterations:output:0time:output:0TensorArrayV2_1:handle:0zeros:output:0strided_slice_1:output:07TensorArrayUnstack/TensorListFromTensor:output_handle:01simple_rnn_cell_21_matmul_readvariableop_resource2simple_rnn_cell_21_biasadd_readvariableop_resource3simple_rnn_cell_21_matmul_1_readvariableop_resource*
T
2
*
_lower_using_switch_merge(*
_num_original_outputs
*9
_output_shapes'
%: : : : :ÿÿÿÿÿÿÿÿÿ: : : : : *%
_read_only_resource_inputs
	*
_stateful_parallelism( *
bodyR
while_body_4293499*
condR
while_cond_4293498*8
output_shapes'
%: : : : :ÿÿÿÿÿÿÿÿÿ: : : : : *
parallel_iterations 
0TensorArrayV2Stack/TensorListStack/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"ÿÿÿÿ   Ë
"TensorArrayV2Stack/TensorListStackTensorListStackwhile:output:39TensorArrayV2Stack/TensorListStack/element_shape:output:0*4
_output_shapes"
 :ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ*
element_dtype0h
strided_slice_3/stackConst*
_output_shapes
:*
dtype0*
valueB:
ÿÿÿÿÿÿÿÿÿa
strided_slice_3/stack_1Const*
_output_shapes
:*
dtype0*
valueB: a
strided_slice_3/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
strided_slice_3StridedSlice+TensorArrayV2Stack/TensorListStack:tensor:0strided_slice_3/stack:output:0 strided_slice_3/stack_1:output:0 strided_slice_3/stack_2:output:0*
Index0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
shrink_axis_maske
transpose_1/permConst*
_output_shapes
:*
dtype0*!
valueB"          
transpose_1	Transpose+TensorArrayV2Stack/TensorListStack:tensor:0transpose_1/perm:output:0*
T0*4
_output_shapes"
 :ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿg
IdentityIdentitystrided_slice_3:output:0^NoOp*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿÒ
NoOpNoOp*^simple_rnn_cell_21/BiasAdd/ReadVariableOp)^simple_rnn_cell_21/MatMul/ReadVariableOp+^simple_rnn_cell_21/MatMul_1/ReadVariableOp^while*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*9
_input_shapes(
&:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿi: : : 2V
)simple_rnn_cell_21/BiasAdd/ReadVariableOp)simple_rnn_cell_21/BiasAdd/ReadVariableOp2T
(simple_rnn_cell_21/MatMul/ReadVariableOp(simple_rnn_cell_21/MatMul/ReadVariableOp2X
*simple_rnn_cell_21/MatMul_1/ReadVariableOp*simple_rnn_cell_21/MatMul_1/ReadVariableOp2
whilewhile:^ Z
4
_output_shapes"
 :ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿi
"
_user_specified_name
inputs/0
©
Æ
/__inference_sequential_20_layer_call_fn_4292861
simple_rnn_21_input
unknown:i
	unknown_0:
	unknown_1:
identity¢StatefulPartitionedCallù
StatefulPartitionedCallStatefulPartitionedCallsimple_rnn_21_inputunknown	unknown_0	unknown_1*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*%
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *S
fNRL
J__inference_sequential_20_layer_call_and_return_conditional_losses_4292852o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*0
_input_shapes
:ÿÿÿÿÿÿÿÿÿi: : : 22
StatefulPartitionedCallStatefulPartitionedCall:` \
+
_output_shapes
:ÿÿÿÿÿÿÿÿÿi
-
_user_specified_namesimple_rnn_21_input"ÛL
saver_filename:0StatefulPartitionedCall_1:0StatefulPartitionedCall_28"
saved_model_main_op

NoOp*>
__saved_model_init_op%#
__saved_model_init_op

NoOp*Ì
serving_default¸
W
simple_rnn_21_input@
%serving_default_simple_rnn_21_input:0ÿÿÿÿÿÿÿÿÿiA
simple_rnn_210
StatefulPartitionedCall:0ÿÿÿÿÿÿÿÿÿtensorflow/serving/predict:ÁU

layer_with_weights-0
layer-0
	optimizer
	variables
trainable_variables
regularization_losses
	keras_api
__call__
*&call_and_return_all_conditional_losses
	_default_save_signature


signatures"
_tf_keras_sequential
Ã
cell

state_spec
	variables
trainable_variables
regularization_losses
	keras_api
__call__
*&call_and_return_all_conditional_losses"
_tf_keras_rnn_layer

iter

beta_1

beta_2
	decay
learning_ratem8m9m:v;v<v="
	optimizer
5
0
1
2"
trackable_list_wrapper
5
0
1
2"
trackable_list_wrapper
 "
trackable_list_wrapper
Ê
non_trainable_variables

layers
metrics
layer_regularization_losses
layer_metrics
	variables
trainable_variables
regularization_losses
__call__
	_default_save_signature
*&call_and_return_all_conditional_losses
&"call_and_return_conditional_losses"
_generic_user_object
2
/__inference_sequential_20_layer_call_fn_4292861
/__inference_sequential_20_layer_call_fn_4293072
/__inference_sequential_20_layer_call_fn_4293083
/__inference_sequential_20_layer_call_fn_4293033À
·²³
FullArgSpec1
args)&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults
p 

 

kwonlyargs 
kwonlydefaultsª 
annotationsª *
 
ö2ó
J__inference_sequential_20_layer_call_and_return_conditional_losses_4293189
J__inference_sequential_20_layer_call_and_return_conditional_losses_4293295
J__inference_sequential_20_layer_call_and_return_conditional_losses_4293044
J__inference_sequential_20_layer_call_and_return_conditional_losses_4293055À
·²³
FullArgSpec1
args)&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults
p 

 

kwonlyargs 
kwonlydefaultsª 
annotationsª *
 
ÙBÖ
"__inference__wrapped_model_4292441simple_rnn_21_input"
²
FullArgSpec
args 
varargsjargs
varkwjkwargs
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsª *
 
,
 serving_default"
signature_map
è

kernel
recurrent_kernel
bias
!	variables
"trainable_variables
#regularization_losses
$	keras_api
%_random_generator
&__call__
*'&call_and_return_all_conditional_losses"
_tf_keras_layer
 "
trackable_list_wrapper
5
0
1
2"
trackable_list_wrapper
5
0
1
2"
trackable_list_wrapper
 "
trackable_list_wrapper
¹

(states
)non_trainable_variables

*layers
+metrics
,layer_regularization_losses
-layer_metrics
	variables
trainable_variables
regularization_losses
__call__
*&call_and_return_all_conditional_losses
&"call_and_return_conditional_losses"
_generic_user_object
2
/__inference_simple_rnn_21_layer_call_fn_4293319
/__inference_simple_rnn_21_layer_call_fn_4293330
/__inference_simple_rnn_21_layer_call_fn_4293341
/__inference_simple_rnn_21_layer_call_fn_4293352Õ
Ì²È
FullArgSpecB
args:7
jself
jinputs
jmask

jtraining
jinitial_state
varargs
 
varkw
 
defaults

 
p 

 

kwonlyargs 
kwonlydefaultsª 
annotationsª *
 
2
J__inference_simple_rnn_21_layer_call_and_return_conditional_losses_4293458
J__inference_simple_rnn_21_layer_call_and_return_conditional_losses_4293564
J__inference_simple_rnn_21_layer_call_and_return_conditional_losses_4293670
J__inference_simple_rnn_21_layer_call_and_return_conditional_losses_4293776Õ
Ì²È
FullArgSpecB
args:7
jself
jinputs
jmask

jtraining
jinitial_state
varargs
 
varkw
 
defaults

 
p 

 

kwonlyargs 
kwonlydefaultsª 
annotationsª *
 
:	 (2	Adam/iter
: (2Adam/beta_1
: (2Adam/beta_2
: (2
Adam/decay
: (2Adam/learning_rate
9:7i2'simple_rnn_21/simple_rnn_cell_21/kernel
C:A21simple_rnn_21/simple_rnn_cell_21/recurrent_kernel
3:12%simple_rnn_21/simple_rnn_cell_21/bias
 "
trackable_list_wrapper
'
0"
trackable_list_wrapper
'
.0"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
ØBÕ
%__inference_signature_wrapper_4293308simple_rnn_21_input"
²
FullArgSpec
args 
varargs
 
varkwjkwargs
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsª *
 
5
0
1
2"
trackable_list_wrapper
5
0
1
2"
trackable_list_wrapper
 "
trackable_list_wrapper
­
/non_trainable_variables

0layers
1metrics
2layer_regularization_losses
3layer_metrics
!	variables
"trainable_variables
#regularization_losses
&__call__
*'&call_and_return_all_conditional_losses
&'"call_and_return_conditional_losses"
_generic_user_object
"
_generic_user_object
°2­
4__inference_simple_rnn_cell_21_layer_call_fn_4293790
4__inference_simple_rnn_cell_21_layer_call_fn_4293804¾
µ²±
FullArgSpec3
args+(
jself
jinputs
jstates

jtraining
varargs
 
varkw
 
defaults
p 

kwonlyargs 
kwonlydefaultsª 
annotationsª *
 
æ2ã
O__inference_simple_rnn_cell_21_layer_call_and_return_conditional_losses_4293820
O__inference_simple_rnn_cell_21_layer_call_and_return_conditional_losses_4293836¾
µ²±
FullArgSpec3
args+(
jself
jinputs
jstates

jtraining
varargs
 
varkw
 
defaults
p 

kwonlyargs 
kwonlydefaultsª 
annotationsª *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
'
0"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
N
	4total
	5count
6	variables
7	keras_api"
_tf_keras_metric
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
:  (2total
:  (2count
.
40
51"
trackable_list_wrapper
-
6	variables"
_generic_user_object
>:<i2.Adam/simple_rnn_21/simple_rnn_cell_21/kernel/m
H:F28Adam/simple_rnn_21/simple_rnn_cell_21/recurrent_kernel/m
8:62,Adam/simple_rnn_21/simple_rnn_cell_21/bias/m
>:<i2.Adam/simple_rnn_21/simple_rnn_cell_21/kernel/v
H:F28Adam/simple_rnn_21/simple_rnn_cell_21/recurrent_kernel/v
8:62,Adam/simple_rnn_21/simple_rnn_cell_21/bias/v­
"__inference__wrapped_model_4292441@¢=
6¢3
1.
simple_rnn_21_inputÿÿÿÿÿÿÿÿÿi
ª "=ª:
8
simple_rnn_21'$
simple_rnn_21ÿÿÿÿÿÿÿÿÿÄ
J__inference_sequential_20_layer_call_and_return_conditional_losses_4293044vH¢E
>¢;
1.
simple_rnn_21_inputÿÿÿÿÿÿÿÿÿi
p 

 
ª "%¢"

0ÿÿÿÿÿÿÿÿÿ
 Ä
J__inference_sequential_20_layer_call_and_return_conditional_losses_4293055vH¢E
>¢;
1.
simple_rnn_21_inputÿÿÿÿÿÿÿÿÿi
p

 
ª "%¢"

0ÿÿÿÿÿÿÿÿÿ
 ·
J__inference_sequential_20_layer_call_and_return_conditional_losses_4293189i;¢8
1¢.
$!
inputsÿÿÿÿÿÿÿÿÿi
p 

 
ª "%¢"

0ÿÿÿÿÿÿÿÿÿ
 ·
J__inference_sequential_20_layer_call_and_return_conditional_losses_4293295i;¢8
1¢.
$!
inputsÿÿÿÿÿÿÿÿÿi
p

 
ª "%¢"

0ÿÿÿÿÿÿÿÿÿ
 
/__inference_sequential_20_layer_call_fn_4292861iH¢E
>¢;
1.
simple_rnn_21_inputÿÿÿÿÿÿÿÿÿi
p 

 
ª "ÿÿÿÿÿÿÿÿÿ
/__inference_sequential_20_layer_call_fn_4293033iH¢E
>¢;
1.
simple_rnn_21_inputÿÿÿÿÿÿÿÿÿi
p

 
ª "ÿÿÿÿÿÿÿÿÿ
/__inference_sequential_20_layer_call_fn_4293072\;¢8
1¢.
$!
inputsÿÿÿÿÿÿÿÿÿi
p 

 
ª "ÿÿÿÿÿÿÿÿÿ
/__inference_sequential_20_layer_call_fn_4293083\;¢8
1¢.
$!
inputsÿÿÿÿÿÿÿÿÿi
p

 
ª "ÿÿÿÿÿÿÿÿÿÇ
%__inference_signature_wrapper_4293308W¢T
¢ 
MªJ
H
simple_rnn_21_input1.
simple_rnn_21_inputÿÿÿÿÿÿÿÿÿi"=ª:
8
simple_rnn_21'$
simple_rnn_21ÿÿÿÿÿÿÿÿÿË
J__inference_simple_rnn_21_layer_call_and_return_conditional_losses_4293458}O¢L
E¢B
41
/,
inputs/0ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿi

 
p 

 
ª "%¢"

0ÿÿÿÿÿÿÿÿÿ
 Ë
J__inference_simple_rnn_21_layer_call_and_return_conditional_losses_4293564}O¢L
E¢B
41
/,
inputs/0ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿi

 
p

 
ª "%¢"

0ÿÿÿÿÿÿÿÿÿ
 »
J__inference_simple_rnn_21_layer_call_and_return_conditional_losses_4293670m?¢<
5¢2
$!
inputsÿÿÿÿÿÿÿÿÿi

 
p 

 
ª "%¢"

0ÿÿÿÿÿÿÿÿÿ
 »
J__inference_simple_rnn_21_layer_call_and_return_conditional_losses_4293776m?¢<
5¢2
$!
inputsÿÿÿÿÿÿÿÿÿi

 
p

 
ª "%¢"

0ÿÿÿÿÿÿÿÿÿ
 £
/__inference_simple_rnn_21_layer_call_fn_4293319pO¢L
E¢B
41
/,
inputs/0ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿi

 
p 

 
ª "ÿÿÿÿÿÿÿÿÿ£
/__inference_simple_rnn_21_layer_call_fn_4293330pO¢L
E¢B
41
/,
inputs/0ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿi

 
p

 
ª "ÿÿÿÿÿÿÿÿÿ
/__inference_simple_rnn_21_layer_call_fn_4293341`?¢<
5¢2
$!
inputsÿÿÿÿÿÿÿÿÿi

 
p 

 
ª "ÿÿÿÿÿÿÿÿÿ
/__inference_simple_rnn_21_layer_call_fn_4293352`?¢<
5¢2
$!
inputsÿÿÿÿÿÿÿÿÿi

 
p

 
ª "ÿÿÿÿÿÿÿÿÿ
O__inference_simple_rnn_cell_21_layer_call_and_return_conditional_losses_4293820·\¢Y
R¢O
 
inputsÿÿÿÿÿÿÿÿÿi
'¢$
"
states/0ÿÿÿÿÿÿÿÿÿ
p 
ª "R¢O
H¢E

0/0ÿÿÿÿÿÿÿÿÿ
$!

0/1/0ÿÿÿÿÿÿÿÿÿ
 
O__inference_simple_rnn_cell_21_layer_call_and_return_conditional_losses_4293836·\¢Y
R¢O
 
inputsÿÿÿÿÿÿÿÿÿi
'¢$
"
states/0ÿÿÿÿÿÿÿÿÿ
p
ª "R¢O
H¢E

0/0ÿÿÿÿÿÿÿÿÿ
$!

0/1/0ÿÿÿÿÿÿÿÿÿ
 â
4__inference_simple_rnn_cell_21_layer_call_fn_4293790©\¢Y
R¢O
 
inputsÿÿÿÿÿÿÿÿÿi
'¢$
"
states/0ÿÿÿÿÿÿÿÿÿ
p 
ª "D¢A

0ÿÿÿÿÿÿÿÿÿ
"

1/0ÿÿÿÿÿÿÿÿÿâ
4__inference_simple_rnn_cell_21_layer_call_fn_4293804©\¢Y
R¢O
 
inputsÿÿÿÿÿÿÿÿÿi
'¢$
"
states/0ÿÿÿÿÿÿÿÿÿ
p
ª "D¢A

0ÿÿÿÿÿÿÿÿÿ
"

1/0ÿÿÿÿÿÿÿÿÿ