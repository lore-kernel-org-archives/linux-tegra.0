From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 10/10] gpu: host1x: Optionally block when acquiring
 channel
Date: Sat, 11 Nov 2017 00:15:11 +0300
Message-ID: <dcb8c4ef-9eb9-556f-cc96-651a50636afa@gmail.com>
References: <20171105110118.15142-1-mperttunen@nvidia.com>
 <20171105110118.15142-11-mperttunen@nvidia.com>
 <9c5676eb-ba6f-c187-29e4-7b331bd3962f@gmail.com>
 <38340901-7016-3444-5ace-64159b32f1c7@kapsi.fi>
 <1b35ec93-167b-3436-0ff2-5e2e0886aea7@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1b35ec93-167b-3436-0ff2-5e2e0886aea7-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org>, Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 07.11.2017 18:29, Dmitry Osipenko wrote:
> On 07.11.2017 16:11, Mikko Perttunen wrote:
>> On 05.11.2017 19:14, Dmitry Osipenko wrote:
>>> On 05.11.2017 14:01, Mikko Perttunen wrote:
>>>> Add an option to host1x_channel_request to interruptibly wait for a
>>>> free channel. This allows IOCTLs that acquire a channel to block
>>>> the userspace.
>>>>
>>>
>>> Wouldn't it be more optimal to request channel and block after job's pining,
>>> when all patching and checks are completed? Note that right now we have locking
>>> around submission in DRM, which I suppose should go away by making locking fine
>>> grained.
>>
>> That would be possible, but I don't think it should matter much since contention
>> here should not be the common case.
>>
>>>
>>> Or maybe it would be more optimal to just iterate over channels, like I
>>> suggested before [0]?
>>
>> Somehow I hadn't noticed this before, but this would break the invariant of
>> having one client/class per channel.
>>
> 
> Yes, currently there is a weak relation of channel and clients device, but seems
> channels device is only used for printing dev_* messages and device could be
> borrowed from the channels job. I don't see any real point of hardwiring channel
> to a specific device or client.

Although, it won't work with syncpoint assignment to channel.
