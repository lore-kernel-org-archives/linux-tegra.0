From: Kevin Hilman <khilman@kernel.org>
Subject: Re: [PATCH 1/6] dmaengine: tegra-apb: Correct runtime-pm usage
Date: Wed, 04 Nov 2015 08:59:43 -0800
Message-ID: <7hvb9hr98g.fsf@deeprootsystems.com>
References: <1444983957-18691-1-git-send-email-jonathanh@nvidia.com>
	<1444983957-18691-2-git-send-email-jonathanh@nvidia.com>
	<20151028070345.GF3041@vkoul-mobl.iind.intel.com>
	<5630CE5C.7070201@nvidia.com>
	<20151029015709.GE18368@vkoul-mobl.iind.intel.com>
	<5638DF7E.9080700@nvidia.com> <7hvb9iai8a.fsf@deeprootsystems.com>
	<20151104083438.GJ12910@localhost>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20151104083438.GJ12910@localhost> (Vinod Koul's message of "Wed,
	4 Nov 2015 14:04:38 +0530")
Sender: linux-kernel-owner@vger.kernel.org
To: Vinod Koul <vinod.koul@intel.com>
Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>, Jon Hunter <jonathanh@nvidia.com>, Laxman Dewangan <ldewangan@nvidia.com>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, dmaengine@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Vinod Koul <vinod.koul@intel.com> writes:

> On Tue, Nov 03, 2015 at 01:25:09PM -0800, Kevin Hilman wrote:
>> >>>>>  	/* Enable clock before accessing register */
>> >>>>> -	ret = tegra_dma_runtime_resume(dev);
>> >>>>> +	ret = pm_runtime_get_sync(dev);
>> >>>>
>> >>>> If you are runtime suspended then core will runtime resume you before
>> >>>> invoking suspend, so why do we need this
>> >>>
>> >>> Is this change now in the mainline? Do you have commit ID for that?
>> >>>
>> >>> I recall the last time we discussed this that Rafael said that they were
>> >>> going to do that, but he said as a rule of thumb if you need to resume
>> >>> it, resume it [0].
>> >> 
>> >> IIRC this has been always the behaviour, at least I see this when I test the
>> >> devices
>> >
>> > I have been doing some testing today and if the DMA is runtime
>> > suspended, then I don't see it runtime resumed before suspend is called.
>> >
>> > Can you elborate on "at least I see this when I test the devices"? What
>> > are you looking at? Are you using kernel function tracers in some way?
>> 
>> The PM core does a _get_noresume()[1] which tries to prevent runtime
>> suspends *during* a system suspend.  However, the PM core should not be
>> doing an actual runtime resume of the device, so if the device is
>> already runtime suspended, it will not be runtime resumed by the core,
>> so if the driver needs it to be runtime resumed, it needs to do it
>> itself.
>
> + Rafael
>
> This is contrariry to what I see, If my driver is runtime suspended and on
> suspend, it gets runtime resumed and then suspended

Since I was late to the thread, can you explain what kind of driver and
on what bus type you're seeing this behavior?

It could be that your bus-type is doing something, but I don't think it
should be the PM core.

Kevin
