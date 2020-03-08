 
RTTHREAD_DIR=$(dir $(word $(words $(MAKEFILE_LIST)),$(MAKEFILE_LIST)))rtthread-nano

# ----------------------------------------------------------------------
# CORE PART
# ----------------------------------------------------------------------
RTTHREAD_SRC_C = $(addprefix ,\
	clock.c \
	components.c \
	cpu.c \
	idle.c \
	ipc.c \
	irq.c \
	kservice.c \
	mem.c \
	memheap.c \
	mempool.c \
	object.c \
	scheduler.c \
	slab.c \
	thread.c \
	timer.c \
	)

# ----------------------------------------------------------------------
# Component PART
# ----------------------------------------------------------------------
RTTHREAD_SRC_C += \
	cmd.c \
	shell.c \
	msh.c				  


# ----------------------------------------------------------------------
# Add Platform port - Here file for RISC-V port
# ----------------------------------------------------------------------
# RTTHREAD_SRC_C += cpuport.c
RTTHREAD_SRC_C += stack.c
#RTTHREAD_SRC_C += interrupt.c
RTTHREAD_SRC_S += context_gcc.S
RTTHREAD_SRC_S += entry_gcc.S
RTTHREAD_SRC_S += metal_start_gcc.S

# ----------------------------------------------------------------------
# Includes Location
# ----------------------------------------------------------------------
RTTHREAD_INC := -I${RTTHREAD_DIR}
RTTHREAD_INC += -I${RTTHREAD_DIR}/include
RTTHREAD_INC += -I${RTTHREAD_DIR}/finsh
RTTHREAD_INC += -I${RTTHREAD_DIR}/libcpu/risc-v
RTTHREAD_INC += -I${RTTHREAD_DIR}/include/libc

# ----------------------------------------------------------------------
# Modify the VPATH
# ----------------------------------------------------------------------
VPATH:=${RTTHREAD_DIR}:${RTTHREAD_DIR}/src:${RTTHREAD_DIR}/finsh:${RTTHREAD_DIR}/libcpu/risc-v:${VPATH}
