From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH 10/10] gpu: host1x: Optionally block when acquiring
 channel
Date: Wed, 29 Nov 2017 15:18:02 +0300
Message-ID: <07e28b40-dd2b-774f-2d07-3b5d6cf08c46@gmail.com>
References: <20171105110118.15142-1-mperttunen@nvidia.com>
 <20171105110118.15142-11-mperttunen@nvidia.com>
 <9c5676eb-ba6f-c187-29e4-7b331bd3962f@gmail.com>
 <38340901-7016-3444-5ace-64159b32f1c7@kapsi.fi>
 <1b35ec93-167b-3436-0ff2-5e2e0886aea7@gmail.com>
 <dcb8c4ef-9eb9-556f-cc96-651a50636afa@gmail.com>
 <775a2536-b225-2d96-3954-7efab6bc5c3e@gmail.com>
 <794b713e-e4f9-0b71-d9eb-168d002ab6a2@kapsi.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <794b713e-e4f9-0b71-d9eb-168d002ab6a2@kapsi.fi>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Mikko Perttunen <cyndis@kapsi.fi>, Mikko Perttunen <mperttunen@nvidia.com>, thierry.reding@gmail.com, jonathanh@nvidia.com
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 29.11.2017 12:10, Mikko Perttunen wrote:
> On 12.11.2017 13:23, Dmitry Osipenko wrote:
>> On 11.11.2017 00:15, Dmitry Osipenko wrote:
>>> On 07.11.2017 18:29, Dmitry Osipenko wrote:
>>>> On 07.11.2017 16:11, Mikko Perttunen wrote:
>>>>> On 05.11.2017 19:14, Dmitry Osipenko wrote:
>>>>>> On 05.11.2017 14:01, Mikko Perttunen wrote:
>>>>>>> Add an option to host1x_channel_request to interruptibly wait for a
>>>>>>> free channel. This allows IOCTLs that acquire a channel to block
>>>>>>> the userspace.
>>>>>>>
>>>>>>
>>>>>> Wouldn't it be more optimal to request channel and block after job's pining,
>>>>>> when all patching and checks are completed? Note that right now we have
>>>>>> locking
>>>>>> around submission in DRM, which I suppose should go away by making locking
>>>>>> fine
>>>>>> grained.
>>>>>
>>>>> That would be possible, but I don't think it should matter much since
>>>>> contention
>>>>> here should not be the common case.
>>>>>
>>>>>>
>>>>>> Or maybe it would be more optimal to just iterate over channels, like I
>>>>>> suggested before [0]?
>>>>>
>>>>> Somehow I hadn't noticed this before, but this would break the invariant of
>>>>> having one client/class per channel.
>>>>>
>>>>
>>>> Yes, currently there is a weak relation of channel and clients device, but
>>>> seems
>>>> channels device is only used for printing dev_* messages and device could be
>>>> borrowed from the channels job. I don't see any real point of hardwiring
>>>> channel
>>>> to a specific device or client.
>>>
>>> Although, it won't work with syncpoint assignment to channel.
>>
>> On the other hand.. it should work if one syncpoint could be assigned to
>> multiple channels, couldn't it?
> 
> A syncpoint can only be mapped to a single channel, so unfortunately this won't
> work.
Okay, in DRM we are requesting syncpoint on channels 'open' and syncpoint
assignment happens on jobs submission. So firstly submitted job will assign
syncpoint to the first channel and second job would re-assign syncpoint to a
second channel while first job is still in-progress, how is it going to work?
