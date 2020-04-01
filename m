From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: Re: [RFC PATCH v5 6/9] media: tegra: Add Tegra210 Video input driver
Date: Wed, 1 Apr 2020 11:24:05 -0700
Message-ID: <e3b437c6-76e1-d407-e81d-c05912ffcd0b@nvidia.com>
References: <20200325110358.GB853@valkosipuli.retiisi.org.uk>
 <8bc44545-7d1e-0e37-db27-d37784679574@xs4all.nl>
 <20200331103215.GI2394@valkosipuli.retiisi.org.uk>
 <ba37eb84-392c-3767-57f6-d297b0ab79a3@xs4all.nl>
 <20200331111018.GJ2394@valkosipuli.retiisi.org.uk>
 <a1145ee4-2991-a958-1225-090c57fec533@xs4all.nl>
 <20200331115221.GA4767@pendragon.ideasonboard.com>
 <6aa7d86c-3943-d508-ccf6-5ac46546abe9@nvidia.com>
 <3b00a559-992a-2da9-92b1-bee44e137ba2@nvidia.com>
 <1c60491b-1bb2-6291-80a6-c0fa14094077@nvidia.com>
 <20200401165805.GE4876@pendragon.ideasonboard.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200401165805.GE4876@pendragon.ideasonboard.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, Sakari Ailus <sakari.ailus@iki.fi>, thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com, helen.koike@collabora.com, digetx@gmail.com, sboyd@kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 4/1/20 9:58 AM, Laurent Pinchart wrote:
> External email: Use caution opening links or attachments
>
>
> Hi Sowjanya,
>
> On Wed, Apr 01, 2020 at 09:36:03AM -0700, Sowjanya Komatineni wrote:
>> Hi Sakari/Laurent,
>>
>> Few questions to confirm my understanding on below discussion.
>>
>> 1. Some sensors that you are referring as don't work with single devnode
>> controlling pipeline devices are ISP built-in sensors where setup of
>> pipeline and subdevices happen separately?
> Sensors that include ISPs could indeed require to be exposed as multiple
> subdevs, but I was mostly referring to raw Bayer sensors with hardware
> architectures similar to the SMIA++ and MIPI CCS specifications. Those
> sensors can perform cropping in up to three different locations (analog
> crop, digital crop, output crop), and can also scale in up to three
> different locations (binning, skipping and filter-based scaling).
>
> Furthermore, with the V4L2 support for multiplexed streams that we are
> working on, a sensor that can produce both image data and embedded data
> would also need to be split in multiple subdevs.

Thanks Laurent.

For sensors with meta/embedded data along with image in same frame, 
Tegra VI HW extracts based on programmed embedded data size info.

So in our driver we capture this as separate buffer as embedded data is 
part of frame.

You above comment on multiplexed streams is for sensors using different 
virutal channels for diff streams?


>> 2. With driver supporting single device node control of entire pipeline
>> devices compared to MC-based, limitation is with userspace apps for only
>> these complex camera sensors?
> In those cases, several policy decisions on how to configure the sensor
> (whether to use binning, skipping and/or filter-based scaling for
> instance, or how much cropping and scaling to apply to achieve a certain
> output resolution) will need to be implemented in the kernel, and
> userspace will not have any control on them.
>
>> 3. Does all upstream video capture drivers eventually will be moved to
>> support MC-based?
> I think we'll see a decrease of the video-node-centric drivers in the
> future for embedded systems, especially the ones that include an ISP.
> When a system has an ISP, even if the ISP is implemented as a
> memory-to-memory device separate from the CSI-2 capture side, userspace
> will likely have a need for fine-grained control of the camera sensor.
>
>> 4. Based on libcamera doc looks like it will work with both types of
>> MC-based and single devnode based pipeline setup drivers for normal
>> sensors and limitation is when we use ISP built-in sensor or ISP HW
>> block. Is my understanding correct?
> libcamera supports both, it doesn't put any restriction in that area.
> The pipeline handler (the device-specific code in libcamera that
> configures and control the hardware pipeline) is responsible for
> interfacing with the kernel drivers, and is free to use an MC-centric or
> video-node-centric API depending on what the kernel drivers offer.
>
> The IPA (image processing algorithms) module is also vendor-specific.
> Although it will not interface directly with kernel drivers, it will
> have requirements on how fine-grained control of the sensor is required.
> For systems that have an ISP in the SoC, reaching a high image quality
> level requires fine-grained control of the sensor, or at the very least
> being able to retrieve fine-grained sensor configuration information
> from the kernel. For systems using a camera sensor with an integrated
> ISP and a CSI-2 receiver without any further processing on the SoC side,
> there will be no such fine-grained control of the sensor by the IPA (and
> there could even be no IPA module at all).
>
> --
> Regards,
>
> Laurent Pinchart
