From: Kevin Hilman <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/6] dmaengine: tegra-apb: Correct runtime-pm usage
Date: Tue, 03 Nov 2015 13:25:09 -0800
Message-ID: <7hvb9iai8a.fsf@deeprootsystems.com>
References: <1444983957-18691-1-git-send-email-jonathanh@nvidia.com>
	<1444983957-18691-2-git-send-email-jonathanh@nvidia.com>
	<20151028070345.GF3041@vkoul-mobl.iind.intel.com>
	<5630CE5C.7070201@nvidia.com>
	<20151029015709.GE18368@vkoul-mobl.iind.intel.com>
	<5638DF7E.9080700@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5638DF7E.9080700-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> (Jon Hunter's message of "Tue, 3
	Nov 2015 16:23:26 +0000")
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> writes:

> On 29/10/15 01:57, Vinod Koul wrote:
>> On Wed, Oct 28, 2015 at 01:32:12PM +0000, Jon Hunter wrote:
>>>
>>> On 28/10/15 07:03, Vinod Koul wrote:
>>>> On Fri, Oct 16, 2015 at 09:25:52AM +0100, Jon Hunter wrote:

[...]

>>>>>  	/* Enable clock before accessing register */
>>>>> -	ret = tegra_dma_runtime_resume(dev);
>>>>> +	ret = pm_runtime_get_sync(dev);
>>>>
>>>> If you are runtime suspended then core will runtime resume you before
>>>> invoking suspend, so why do we need this
>>>
>>> Is this change now in the mainline? Do you have commit ID for that?
>>>
>>> I recall the last time we discussed this that Rafael said that they were
>>> going to do that, but he said as a rule of thumb if you need to resume
>>> it, resume it [0].
>> 
>> IIRC this has been always the behaviour, at least I see this when I test the
>> devices
>
> I have been doing some testing today and if the DMA is runtime
> suspended, then I don't see it runtime resumed before suspend is called.
>
> Can you elborate on "at least I see this when I test the devices"? What
> are you looking at? Are you using kernel function tracers in some way?

The PM core does a _get_noresume()[1] which tries to prevent runtime
suspends *during* a system suspend.  However, the PM core should not be
doing an actual runtime resume of the device, so if the device is
already runtime suspended, it will not be runtime resumed by the core,
so if the driver needs it to be runtime resumed, it needs to do it
itself.

Kevin


[1] c.f. drivers/base/power/main.c::device_prepare()
