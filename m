From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v2 1/2] i2c: tegra: Better handle case where CPU0 is busy
 for a long time
Date: Mon, 27 Apr 2020 19:02:05 +0300
Message-ID: <127a2c32-e5fb-2944-3062-361b276490c0@gmail.com>
References: <a5198024-7273-74c4-b4f4-3a29d042bc36@nvidia.com>
 <f8fb1f7f-2497-033e-ff2c-c86c6caa9706@gmail.com>
 <fd1ca178-1ea3-851f-20a6-10bf00453ce3@nvidia.com>
 <a5734f19-254e-b6bc-e791-fa1ac63f11a4@gmail.com>
 <79f6560e-dbb5-0ae1-49f8-cf1cd95396ec@nvidia.com>
 <20200427074837.GC3451400@ulmo> <20200427084424.GA28817@kunai>
 <820200ce-17f3-18c0-6f79-3e582f45492d@gmail.com>
 <20200427103553.GA24446@kunai> <20200427105029.GB3464906@ulmo>
 <20200427153244.GF3464906@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-i2c-owner@vger.kernel.org>
In-Reply-To: <20200427153244.GF3464906@ulmo>
Content-Language: en-US
Sender: linux-i2c-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Wolfram Sang <wsa@the-dreams.de>
Cc: Jon Hunter <jonathanh@nvidia.com>, Laxman Dewangan <ldewangan@nvidia.com>, Manikanta Maddireddy <mmaddireddy@nvidia.com>, Vidya Sagar <vidyas@nvidia.com>, linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

27.04.2020 18:32, Thierry Reding пишет:
> On Mon, Apr 27, 2020 at 12:50:29PM +0200, Thierry Reding wrote:
>> On Mon, Apr 27, 2020 at 12:35:53PM +0200, Wolfram Sang wrote:
>>> On Mon, Apr 27, 2020 at 12:07:19PM +0300, Dmitry Osipenko wrote:
>>>> 27.04.2020 11:44, Wolfram Sang пишет:
>>>>>
>>>>>> Wolfram, can you revert the following two patches for v5.7, please?
>>>>>>
>>>>>> 	8814044fe0fa i2c: tegra: Synchronize DMA before termination
>>>>
>>>> This patch has nothing to do with your trouble, why do you want to
>>>> revert it?
>>>
>>> I'll wait some more before pushing out, so you can discuss it.
>>
>> Okay, let me run a quick test with that second patch still applied to
>> make sure it really is harmless.
> 
> Alright, I tested v5.7-rc3 with this patch reverted:
> 
> 	a900aeac2537 i2c: tegra: Better handle case where CPU0 is busy for a long time
> 
> and the results came back positive, so I think we can leave patch:
> 
> 	8814044fe0fa i2c: tegra: Synchronize DMA before termination
> 
> in. But then again, I see that Dmitry posted this yesterday:
> 
> 	https://lkml.org/lkml/2020/4/26/481
> 
> which seems like it would be related to this and potentially be a
> follow-up fix for some corner cases?

This is a follow-up to my previous message in this thread:

https://lkml.org/lkml/2020/4/23/792

> So I'm not sure how well this whole set has been tested yet.

It depends on what you're meaning by the testing. We have some
yet-out-of-tree real-world devices that are using APBDMA for Bluetooth,
Audio, I2C (touchscreens) and etc peripherals. These devices were using
the DMA patches before they were posted to the ML.

> Maybe a better solution would be for the DMA synchronization patch to go
> into the 5.8 queue instead to make sure we get more testing cycles.

It should be fine to re-queue the patches for 5.8. I'm just a bit afraid
that if patches are simply dropped now, then you won't get back to it
for a year or so ;)
