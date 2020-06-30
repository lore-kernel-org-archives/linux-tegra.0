From: Hans Verkuil <hverkuil@xs4all.nl>
Subject: Re: [RFC PATCH v2 00/18] Support for Tegra video capture from
 external sensor
Date: Tue, 30 Jun 2020 17:13:33 +0200
Message-ID: <a60d8f80-312d-fce3-61f5-328e7f2a7a64@xs4all.nl>
References: <1592358094-23459-1-git-send-email-skomatineni@nvidia.com>
 <b3f63f3f-50b2-e818-2c59-8009c31a9825@xs4all.nl>
 <f5c84071-46ad-aa6f-0820-1813d4a907c9@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <f5c84071-46ad-aa6f-0820-1813d4a907c9@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>, thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com, sakari.ailus@iki.fi, robh+dt@kernel.org, helen.koike@collabora.com
Cc: digetx@gmail.com, sboyd@kernel.org, gregkh@linuxfoundation.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 30/06/2020 16:58, Sowjanya Komatineni wrote:
> 
> On 6/30/20 2:21 AM, Hans Verkuil wrote:
>> On 17/06/2020 03:41, Sowjanya Komatineni wrote:
>>> This series adds support for video capture from external camera sensor to
>>> Tegra video driver.
>>>
>>> Jetson TX1 has camera expansion connector and supports custom camera module
>>> designed as per TX1 design specification.
>>>
>>> This series also enables camera capture support for Jetson Nano which has
>>> Raspberry PI camera header.
>>>
>>> This series is tested with IMX219 camera sensor.
>> Which tree did you base this on? The media_tree master? Or the mainline kernel?
> These patches are with linux-next base at the time I sent them out which 
> are on 20200616
>>
>> I now have the imx219 detected, but if I try to stream I get this:
>>
>> $ v4l2-ctl --stream-mmap
>> <[  512.840944] video4linux video0: MW_ACK_DONE syncpt timeout: -11
>> [  512.972975] video4linux video0: frame start syncpt timeout: -11
>> <VIDIOC_DQBUF: failed: Input/output error
>> [  513.180770] video4linux video0: MW_ACK_DONE syncpt timeout: -11
>>
>> And then everything hangs and I need to reset.
>>
>> I'm testing with the media_tree master with your patches on top.
>>
>> Regards,
>>
>> 	Hans
> 
> Are you using same device tree as I sent offline? It uses CSI A for IMX219.
> 
> Does you setup also uses CSI-A as x2 for IMX219?
> 
> I tested them on Jetson Nano + IMX219 rasp PI module and also on Jetson 
> TX1 + IMX274.
> 
> I did not see any issue and am able to capture from both.
> 
> Will try again on my side with today's latest linux-next and update result.

Please use the media_tree master, that's what I use as well.

I did some more testing and there is something weird going on.

I have a Leopard Imaging camera expansion board (LI-JTX1-MIPI-ADPT) with
three camera connectors. See here for the datasheet:

https://www.leopardimaging.com/uploads/LI-TX1-KIT-IMX274M12-T_datasheet.pdf

The first connector (with an IMX274) causes this error:

$ v4l2-ctl -d1 --stream-mmap
[  599.265885] video4linux video1: MW_ACK_DONE syncpt timeout: -11
[  599.473883] video4linux video1: MW_ACK_DONE syncpt timeout: -11
[  599.681904] video4linux video1: frame start syncpt timeout: -11
[  599.681909] video4linux video1: MW_ACK_DONE syncpt timeout: -11
<VIDIOC_DQBUF: failed: Input/output error
[  599.897884] video4linux video1: MW_ACK_DONE syncpt timeout: -11

Similar to the test above where I had an IMX219 connected. Except it didn't
hang with the IMX274 (I'm beginning to suspect a locking issue in the imx219
driver that is causing the hang, I'll look at that tomorrow).

If I connect the IMX219 to the middle camera connector, then it works fine.
I think I tested this with the IMX274 as well, but I'm not 100% certain, also
something to double check tomorrow.

If I connect the IMX219 or IMX274 to the third camera connector, then I get this:

$ v4l2-ctl -d0 --stream-mmap
[  820.513866] tegra-mc 70019000.memory-controller: viw: write @0x00000001b5fd08c0: EMEM address decode error (EMEM decode error)

[  820.525354] tegra-mc 70019000.memory-controller: viw: write @0x00000001b5fd08c0: EMEM address decode error (EMEM decode error)

[  820.536780] tegra-mc 70019000.memory-controller: viw: write @0x00000001b5fd08c0: EMEM address decode error (EMEM decode error)

[  820.548222] tegra-mc 70019000.memory-controller: viw: write @0x00000001b5fd08c0: EMEM address decode error (EMEM decode error)

[  820.559639] tegra-mc 70019000.memory-controller: viw: write @0x00000001b5fd08c0: EMEM address decode error (EMEM decode error)
<[  820.646931] tegra-mc 70019000.memory-controller: viw: write @0x00000001b5fd08c0: EMEM address decode error (EMEM decode error)
[  820.658355] tegra-mc 70019000.memory-controller: viw: write @0x00000001b5fd08c0: EMEM address decode error (EMEM decode error)
[  820.669797] tegra-mc 70019000.memory-controller: viw: write @0x00000001b5fd08c0: EMEM address decode error (EMEM decode error)
[  820.681216] tegra-mc 70019000.memory-controller: viw: write @0x00000001b5fd08c0: EMEM address decode error (EMEM decode error)
[  820.692601] tegra-mc 70019000.memory-controller: viw: write @0x00000001b5fd08c0: EMEM address decode error (EMEM decode error)
<<<<<<<<<<<<<<< 14.50 fps
<<<<<<<<<<<<<<< 14.75 fps
<<<<<<<<<<<<<<< 14.73 fps
<<<<<<<<<<<<<<< 14.80 fps
<<<<<<<<<<<<<[  825.517854] tegra_mc_irq: 133437 callbacks suppressed
[  825.517874] tegra-mc 70019000.memory-controller: viw: write @0x00000001b5fd08c0: EMEM address decode error (EMEM decode error)
[  825.534395] tegra-mc 70019000.memory-controller: viw: write @0x00000001b5fd08c0: EMEM address decode error (EMEM decode error)
[  825.545833] tegra-mc 70019000.memory-controller: viw: write @0x00000001b5fd08c0: EMEM address decode error (EMEM decode error)
[  825.557280] tegra-mc 70019000.memory-controller: viw: write @0x00000001b5fd08c0: EMEM address decode error (EMEM decode error)
[  825.579346] tegra-mc 70019000.memory-controller: viw: write @0x00000001b5fd08c0: EMEM address decode error (EMEM decode error)
[  825.590764] tegra-mc 70019000.memory-controller: viw: write @0x00000001b5fd08c0: EMEM address decode error (EMEM decode error)
[  825.602188] tegra-mc 70019000.memory-controller: viw: write @0x00000001b5fd08c0: EMEM address decode error (EMEM decode error)
[  825.613649] tegra-mc 70019000.memory-controller: viw: write @0x00000001b5fd08c0: EMEM address decode error (EMEM decode error)
[  825.625075] tegra-mc 70019000.memory-controller: viw: write @0x00000001b5fd08c0: EMEM address decode error (EMEM decode error)
[  825.645983] tegra-mc 70019000.memory-controller: viw: write @0x00000001b5fd08c0: EMEM address decode error (EMEM decode error)
< 14.64 fps
<<<<<<<<<<<<<<<< 14.87 fps
<<<<<<<<<<<<<<< 14.89 fps

Something is producing EMEM address decode errors. But it is streaming.

If I enable the TPG then everything is fine.

So I have currently three different behaviors for three camera connectors.

Do you have a datasheet for your Jetson TX1 camera board? It could be useful
to compare the two.

Regards,

	Hans

> 
>>
>>> This series include,
>>>
>>> VI I2C related fixes
>>> - Camera sensor programming happens through VI I2C which is on host1x bus.
>>> - These patches includes device tree and I2C driver fixes for VI I2C.
>>>
>>> Tegra video driver updates
>>> - TPG Vs Non-TPG based on Kconfig
>>> - Support for external sensor video capture based on device graph from DT.
>>> - Support for selection ioctl operations
>>> - Tegra MIPI CSI pads calibration
>>> - CSI T-CLK and T-HS settle time computation based on clock rates.
>>>
>>> Host1x driver updates
>>> - Adds API to allow creating mipi device for specific device node.
>>> - Splits MIPI pads calibrate start and waiting for calibration to be done.
>>>
>>> Device tree updates
>>> - Adds camera connector 2V8, 1V8, 1V2 regulator supplies to Jetson TX1 DT.
>>> - Enabled VI and CSI support in Jetson Nano DT.
>>>
>>>
>>> Delta between patch versions:
>>>
>>> [v2]:	Includes below changes based on v1 feedback
>>> 	- dt-binding document and the driver update for device graph to use
>>> 	  separate ports for sink endpoint and source endpoint for csi.
>>> 	- Use data-lanes endpoint property for csi.
>>> 	- Update tegra_mipi_request() to take device node pointer argument
>>> 	  rather than adding extra API.
>>> 	- Remove checking for clk pointer before clk_disable.
>>>
>>>
>>> Sowjanya Komatineni (18):
>>>    dt-bindings: i2c: tegra: Document Tegra210 VI I2C clocks and
>>>      power-domains
>>>    arm64: tegra: Add missing clocks and power-domains to Tegra210 VI I2C
>>>    i2c: tegra: Don't mark VI I2C as IRQ safe runtime PM
>>>    i2c: tegra: Fix the error path in tegra_i2c_runtime_resume
>>>    i2c: tegra: Fix runtime resume to re-init VI I2C
>>>    i2c: tegra: Avoid tegra_i2c_init_dma() for Tegra210 vi i2c
>>>    media: tegra-video: Fix channel format alignment
>>>    media: tegra-video: Enable TPG based on kernel config
>>>    media: tegra-video: Update format lookup to offset based
>>>    dt-bindings: tegra: Update VI and CSI bindings with port info
>>>    media: tegra-video: Add support for external sensor capture
>>>    media: tegra-video: Add support for selection ioctl ops
>>>    gpu: host1x: mipi: Update tegra_mipi_request() to be node based
>>>    gpu: host1x: mipi: Split tegra_mipi_calibrate and tegra_mipi_wait
>>>    media: tegra-video: Add CSI MIPI pads calibration
>>>    media: tegra-video: Compute settle times based on the clock rate
>>>    arm64: tegra: jetson-tx1: Add camera supplies
>>>    arm64: tegra: Enable Tegra VI CSI support for Jetson Nano
>>>
>>>   .../display/tegra/nvidia,tegra20-host1x.txt        |  92 ++-
>>>   .../devicetree/bindings/i2c/nvidia,tegra20-i2c.txt |  19 +-
>>>   arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi     |  41 ++
>>>   arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts |  10 +
>>>   arch/arm64/boot/dts/nvidia/tegra210.dtsi           |   6 +
>>>   drivers/gpu/drm/tegra/dsi.c                        |   9 +-
>>>   drivers/gpu/host1x/mipi.c                          |  30 +-
>>>   drivers/i2c/busses/i2c-tegra.c                     |  39 +-
>>>   drivers/staging/media/tegra-video/Kconfig          |   7 +
>>>   drivers/staging/media/tegra-video/csi.c            | 245 ++++++-
>>>   drivers/staging/media/tegra-video/csi.h            |   8 +
>>>   drivers/staging/media/tegra-video/tegra210.c       |  25 +-
>>>   drivers/staging/media/tegra-video/vi.c             | 770 +++++++++++++++++++--
>>>   drivers/staging/media/tegra-video/vi.h             |  23 +-
>>>   drivers/staging/media/tegra-video/video.c          |  23 +-
>>>   include/linux/host1x.h                             |   4 +-
>>>   16 files changed, 1251 insertions(+), 100 deletions(-)
>>>
