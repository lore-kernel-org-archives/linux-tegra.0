From: =?windows-1252?Q?Terje_Bergstr=F6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: First version of host1x intro
Date: Wed, 5 Dec 2012 11:47:29 +0200
Message-ID: <50BF1831.3060606@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>, Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi,

I created a base for host1x introduction text, and pasted it into
https://gitorious.org/linux-tegra-drm/pages/Host1xIntroduction. For
convenience, I also copy it below.

As I've worked with all of this for so long, I cannot know what areas
are most interesting to you, so I just tried to put in the basics and
scope it to the features we've been discussing so far. Please point out
the features that you'd like more information on so I can add details.

2D is still totally missing from here. Everything is treated as generic
host1x clients. libdrm is touched on only briefly.

The text is written in LaTeX, and converted with pandoc. I beg for
forgiveness for any formatting oddities.

Hardware introduction
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

HOST1X is a front-end to a list of client units which deal with graphic=
s
and multimedia. The most important features are channels for serializin=
g
and offloading programming of the client units, and sync points for
synchronizing client units with each other, or with CPU.

Channels
--------

Channel is a push buffer containing HOST1X opcodes. The push buffer
boundaries are defined with `HOST1X_CHANNEL_DMASTART_0` and
`HOST1X_CHANNEL_DMAEND_0`. `HOST1X_CHANNEL_DMAGET_0` indicates the next
position within the boundaries that is going to be processes, and
`HOST1X_CHANNEL_DMAPUT_0` indicates the position of last valid opcode.
Whenever `HOST1X_CHANNEL_DMAPUT_0` and `HOST1X_CHANNEL_DMAGET_0` differ=
,
command DMA will copy commands from push buffer to a command FIFO.

If command DMA sees opcode GATHER, it will a memory area to command
=46IFO. The number of words is indicated in GATHER opcode, and the base
address is read from the following word. GATHERs are not recursive.

HOST1X command processor goes through the FIFO and executes opcodes.
Each channel has some stored state, such as the client unit this channe=
l
is talking to. The most important opcodes are:

-   SETCL for changing the target client unit

-   IMM, INCR, NONINCR, MASK write values to registers of client unit

-   GATHER instructs command DMA to fetch from another memory area

-   RESTART instructs command DMA to start over from beginning of push
    buffer

Channel class can also be HOST1X itself. Register writes to HOST1X will
invoke host class methods. The most important use is
`NV_CLASS_HOST_WAIT_SYNCPT_0`, which freezes a channel until sync point
reaches a threshold value.

Synchronization
---------------

A sync point is a 32-bit register in HOST1X. There are 32 sync points i=
n
Tegra2 and Tegra3. HOST1X can be programmed to assert an interrupt when
a value higher than a pre-determined threshold is written to sync
pointer register. Each channel can also be frozen waiting for a
threshold to be reached.

Sync points are initialized to zero at boot-up, and treated as
monotonously incrementing counter with wrapping. CPU can increment a
sync point by writing the sync point id (0-31 in Tegra2 and Tegra3) to
register `HOST1X_SYNC_SYNCPT_CPU_INCR_0`. Client units all have sync
point increment method at offset 0, and the command streams request
client units to increment sync point using that. The parameters for the
increment method are condition and sync point id. Condition could be
`OP_DONE` telling to increment sync point when previous operations are
done, or `RD_DONE` indicating that client unit has finished all reads
from buffers.

Software
=3D=3D=3D=3D=3D=3D=3D=3D

There are three components involved with programming HOST1X and its
client units. Linux kernel contains the drivers tegradrm and host1x.
User space library libdrm is added functionality to communicate with th=
e
tegradrm, which communicates with host1x driver.

This text discusses only pieces relevant to HOST1X and its client units=
,
excluding the part about frame buffer and display controller
programming.

libdrm
=3D=3D=3D=3D=3D=3D

libdrm communicates with tegradrm kernel driver to allocate buffers,
create and send command streams, synchronize.

TODO

tegradrm
=3D=3D=3D=3D=3D=3D=3D=3D

tegradrm contains functionality to allocate buffers, and open channels.
The only channel available at the moment is 2D channel, which is handle=
d
by the 2D driver inside tegradrm.

Command stream management and synchronization is passed on from 2D
driver to host1x driver. The 2D driver inside tegradrm processes the
requests from user space, and calls relevant calls in host1x.

host1x driver
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

At bootup, host1x initializes hardware. It clears sync points, and
registers interrupt handlers.

Sync points
-----------

Each sync point register is treated as a range. The range minimum is a
shadow copy of the sync point register, and the maximum tracks how many
increments we expect to be done. A fence is a pair (sync point id,
threshold value) indicating completion of an event of interest to
software.

Due to wrapping, software does pre-checking for each sync point wait,
whether done via HOST1X channel, or CPU. Each wait is potentially for a=
n
already expired fence. Any wait whose threshold value lies outside the
range ]min, max] is treated as already expired and will not be sent to
HOST1X hardware.

The sync point CPU wait is handled by registering the threshold value a=
s
an event to the interrupt code, and waiting for completion of that
event.

Interrupt management
--------------------

HOST1X has two kinds of interrupt: generic and sync point. Generic
interrupts are not interesting in this scope, so this text focuses on
sync point threshold interrupts.

Interrupt code manages a sorted list of events, and their sync point
threshold values. The earliest event is kept first in the list.

`nvhost_intr_add_action()` adds an action to the event list. If the
event list was empty, HOST1X interrupt is programmed to assert interrup=
t
when that threshold is reached.

When an interrupt is asserted, the event list is processed. Each event
that has had its threshold passes will be moved to a completed list, an=
d
removed from the event list. Submit complete is treated specially to
optimize for the fact that processing the event is heavy, so we call it
only once even though we have completed multiple submit complete events=
=2E

`action_submit_complete()` handles all clean-up for completed jobs.

`action_wakeup()` and `action_wakeup_interruptible()` wake up a thread
waiting for a particular sync point threshold.

After the list of events is processed, the value of the head of the lis=
t
is written to HOST1X as the next interrupt threshold.

Job management
--------------

Each command stream sent from user space to kernel is treated as a job.
User space indicates how many sync point increments that stream
generates, and which sync point register it=92s using. It also indicate=
s
the buffers involved with the command stream, and the locations in
command stream where the buffers are referred to. Last but not least,
user space indicates locations of sync point waits and thresholds.

=46irst action taken is taking a reference to all buffers in the comman=
d
stream. This includes the command stream buffers themselves, but also
the target buffers. We also map each buffer to target hardware to get a
device virtual address.

After this, relocation information is processed. Each reference to
target buffers in command stream are replaced with device virtual
addresses. The relocation information contains the reference to target
buffer, and to command stream to be able to do this.

After relocation, each wait is checked against expiration. Any wait
whose threshold has already expired will be converted to a no-wait by
writing `0x00000000` over the word. This will essentially turn any
expired wait into a wait for sync point register 0, value 0, and thus w=
e
keep sync point 0 reserved for this purpose and never change it from
value 0.

In upstream kernel without IOMMU support we also check the contents of
the command stream for any accesses to memory that are not taken care o=
f
by relocation information.

Next, the number of sync point increments is checked and the id of the
sync point. The sync point maximum value is incremented by the number o=
f
increments, and thus kernel ends up with a fence indicating when that
job has completed. Then each command stream is added to push buffer. In
case of IOMMU support, GATHER opcodes referring to the command streams
are added to the channel push buffer. If IOMMU isn=92t supported, the
contents of the GATHER is copied. The fence is added to interrupt event
list as a submit complete action, and at this point the job is
submitted.

When a fence for a job is reached, `action_submit_complete()` will call
`nvhost_cdma_update()`. It goes through list of jobs in channel, and
frees the resources associated for all jobs whose fence has been
reached.

At submit time, we also start a timer for each job. If the timer times
out, the job is removed from the channel, and the sync point increments
that haven=92t been done, will be done by the host1x driver. This preve=
nts
channel from remaining stuck in case a command stream is formed
incorrectly and cannot be completed.
