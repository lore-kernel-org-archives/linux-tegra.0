From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: Re: [RFC PATCH v3 4/6] media: tegra: Add Tegra210 Video input driver
Date: Sun, 16 Feb 2020 12:22:03 -0800
Message-ID: <0f84d37c-105f-8de6-c922-186d2f9ea156@nvidia.com>
References: <1581704608-31219-1-git-send-email-skomatineni@nvidia.com>
 <1581704608-31219-5-git-send-email-skomatineni@nvidia.com>
 <30e417ba-84e1-63d2-de74-22cfe859bddb@xs4all.nl>
 <920b4276-b2ca-646c-a21b-ca0b9bacf471@nvidia.com>
 <6bb124db-681c-55c1-e328-6e1f766a8bb3@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <6bb124db-681c-55c1-e328-6e1f766a8bb3@nvidia.com>
Content-Language: en-US
Sender: linux-clk-owner@vger.kernel.org
To: Hans Verkuil <hverkuil@xs4all.nl>, thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com, helen.koike@collabora.com, sboyd@kernel.org
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 2/16/20 12:11 PM, Sowjanya Komatineni wrote:
>
> On 2/16/20 11:54 AM, Sowjanya Komatineni wrote:
>>
>> On 2/16/20 3:03 AM, Hans Verkuil wrote:
>>> External email: Use caution opening links or attachments
>>>
>>>
>>> On 2/14/20 7:23 PM, Sowjanya Komatineni wrote:
>>>> Tegra210 contains a powerful Video Input (VI) hardware controller
>>>> which can support up to 6 MIPI CSI camera sensors.
>>>>
>>>> Each Tegra CSI port can be one-to-one mapped to VI channel and can
>>>> capture from an external camera sensor connected to CSI or from
>>>> built-in test pattern generator.
>>>>
>>>> Tegra210 supports built-in test pattern generator from CSI to VI.
>>>>
>>>> This patch adds a V4L2 media controller and capture driver support
>>>> for Tegra210 built-in CSI to VI test pattern generator.
>>>>
>>>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>>>> ---
>>>> =C2=A0 drivers/staging/media/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0 2 +
>>>> =C2=A0 drivers/staging/media/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0 1 +
>>>> =C2=A0 drivers/staging/media/tegra/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 10 +
>>>> =C2=A0 drivers/staging/media/tegra/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0=C2=A0=C2=A0 8 +
>>>> =C2=A0 drivers/staging/media/tegra/TODO=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 10 +
>>>> =C2=A0 drivers/staging/media/tegra/tegra-common.h |=C2=A0 239 +++++++
>>>> =C2=A0 drivers/staging/media/tegra/tegra-csi.c=C2=A0=C2=A0=C2=A0 |=C2=
=A0 374 ++++++++++
>>>> =C2=A0 drivers/staging/media/tegra/tegra-csi.h=C2=A0=C2=A0=C2=A0 |=C2=
=A0 115 ++++
>>>> =C2=A0 drivers/staging/media/tegra/tegra-vi.c=C2=A0=C2=A0=C2=A0=C2=A0 =
| 1019=20
>>>> ++++++++++++++++++++++++++++
>>>> =C2=A0 drivers/staging/media/tegra/tegra-vi.h=C2=A0=C2=A0=C2=A0=C2=A0 =
|=C2=A0=C2=A0 79 +++
>>>> =C2=A0 drivers/staging/media/tegra/tegra-video.c=C2=A0 |=C2=A0 118 +++=
+
>>>> =C2=A0 drivers/staging/media/tegra/tegra-video.h=C2=A0 |=C2=A0=C2=A0 3=
2 +
>>>> =C2=A0 drivers/staging/media/tegra/tegra210.c=C2=A0=C2=A0=C2=A0=C2=A0 =
|=C2=A0 767=20
>>>> +++++++++++++++++++++
>>>> =C2=A0 drivers/staging/media/tegra/tegra210.h=C2=A0=C2=A0=C2=A0=C2=A0 =
|=C2=A0 190 ++++++
>>>> =C2=A0 14 files changed, 2964 insertions(+)
>>>> =C2=A0 create mode 100644 drivers/staging/media/tegra/Kconfig
>>>> =C2=A0 create mode 100644 drivers/staging/media/tegra/Makefile
>>>> =C2=A0 create mode 100644 drivers/staging/media/tegra/TODO
>>>> =C2=A0 create mode 100644 drivers/staging/media/tegra/tegra-common.h
>>>> =C2=A0 create mode 100644 drivers/staging/media/tegra/tegra-csi.c
>>>> =C2=A0 create mode 100644 drivers/staging/media/tegra/tegra-csi.h
>>>> =C2=A0 create mode 100644 drivers/staging/media/tegra/tegra-vi.c
>>>> =C2=A0 create mode 100644 drivers/staging/media/tegra/tegra-vi.h
>>>> =C2=A0 create mode 100644 drivers/staging/media/tegra/tegra-video.c
>>>> =C2=A0 create mode 100644 drivers/staging/media/tegra/tegra-video.h
>>>> =C2=A0 create mode 100644 drivers/staging/media/tegra/tegra210.c
>>>> =C2=A0 create mode 100644 drivers/staging/media/tegra/tegra210.h
>>>>
>>> <snip>
>>>
>>>> +/*
>>>> + * videobuf2 queue operations
>>>> + */
>>>> +static int tegra_channel_queue_setup(struct vb2_queue *vq,
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int *nbuffe=
rs,
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int *nplane=
s,
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int sizes[]=
,
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct device *alloc=
_devs[])
>>>> +{
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 struct tegra_vi_channel *chan =3D vb2_get_dr=
v_priv(vq);
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 if (*nplanes)
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 return sizes[0] < chan->format.sizeimage ? -EINVAL : 0;
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 *nplanes =3D 1;
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 sizes[0] =3D chan->format.sizeimage;
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 alloc_devs[0] =3D chan->vi->dev;
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 /*
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * allocate min 3 buffers in queue to a=
void race between DMA
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * writes and userspace reads.
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 if (*nbuffers < 3)
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 *nbuffers =3D 3;
>>> First of all, don't check this here, instead set the struct=20
>>> vb2_queue field
>>> 'min_buffers_needed' to 3 instead.
>>>
>>> But the reason given for this check is peculiar: there should not be=20
>>> any
>>> race at all. Usually the reason for requiring a specific minimum=20
>>> number of
>>> buffers is that the DMA engine needs at least 2 buffers before it=20
>>> can start
>>> streaming: it can't give back a buffer to userspace (vb2_buffer_done())
>>> unless there is a second buffer it can start to capture to next. So=20
>>> for many
>>> DMA implementations you need a minimum of 2 buffers: two buffers for=20
>>> the
>>> DMA engine, one buffer being processed by userspace.
>>>
>>> If the driver is starved of buffers it will typically keep capturing to
>>> the last buffer until a new buffer is queued.
>>>
>>> In any case, once the driver releases a buffer via vb2_buffer_done()=20
>>> the
>>> buffer memory is no longer owned by the driver.
>>>
>>> To be precise, buffer ownership is as follows:
>>>
>>> userspace -> VIDIOC_QBUF -> vb2 -> buf_queue -> driver ->=20
>>> vb2_buffer_done() -> vb2 -> VIDIOC_DQBUF -> userspace
>>>
>>> (vb2 =3D=3D videobuf2 framework)
>>>
>>> Note that vb2 never touches the buffer memory.
>>>
>>> So if you get a race condition in this driver, then there is something
>>> strange going on. It looks like vb2_buffer_done() is called while=20
>>> DMA is
>>> still ongoing, or because the driver really needs to keep one buffer
>>> available at all times.
>>>
>>> Regards,
>>>
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Hans
>>
>> Thanks Hans.
>>
>> On running v4l2-compliance streaming tests for longer run, I noticed=20
>> kernel reporting unable to write to read-only memory and with debugs=20
>> I observed when this error was reported, I see 2 buffers queued and=20
>> both using same address.
>>
>> for first buffer capture start thread initiates capture and wakes=20
>> done thread to wait for memory write ack and once its done buffer is=20
>> released to user space but I see upon buffer released to user space=20
>> immediate next buffer capture single shot gets issued (as soon as=20
>> single shot is issued frame capture data is written to memory by DMA)=20
>> and I see this kernel error of unable to write to read-only memory.
>>
>> This error happens rare and happens on long run and all the times of=20
>> repro's, I see when other thread releases buffer immediate I see=20
>> single shot gets issued as 2 buffers are queued up at the same time=20
>> with same DMA address.
>>
> Just to be clear, I meant all the times when kernel reports error=20
> unable to write to read-only memory, I see 2 buffers gets queued and=20
> as the capture start thread and done thread are parallel and when=20
> capture thread wakes done thread on receiving FS event, done thread=20
> for waiting for memory write happens parallel to next frame capture=20
> and I see while vb2_buffer_done happens in done thread next frame=20
> single shot has been issues by capture start thread in parallel when=20
> it hits this error.

For low latency, we use 2 threads one thread for capture and wait for FS=20
and on receiving FS even wakes other done thread to wait for memory=20
write to finish.

While other done thread waits for memory write to finish, capture thread=20
can start capture for next frame and as soon as single shot is issued=20
capture frame is written to memory and as this thread runs in parallel=20
to done thread

there is a possibility vb2_buffer_done being called by=20
kthread_capture_done while DMA is ongoing by kthread_capture_start and I=20
observed same DMA address being used got both buffers that got queued at=20
same time when it hits this error.

>> With using minimum 3 buffers, this issue doesnt happen at all from=20
>> almost 72 hours of testing.
>>
>>
>> Will try with setting vb2 queue field min_buffers_needed as 3 instead=20
>> of adding check in queue setup.
>>
>
>>
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>>>> +}
