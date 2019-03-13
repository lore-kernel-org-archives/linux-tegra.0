From: Marc Zyngier <marc.zyngier@arm.com>
Subject: Re: [PATCH 1/5] irqchip/gic-pm: add driver remove support
Date: Wed, 13 Mar 2019 14:20:41 +0000
Message-ID: <da01de60-b76a-9575-16ed-138a78d997c1@arm.com>
References: <1552474956-25513-1-git-send-email-spujar@nvidia.com>
 <0cd78fb7-4bcb-b735-54ca-24a179b9ff72@arm.com>
 <bc00b804-2248-4f8b-1537-3e3db151d74d@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <bc00b804-2248-4f8b-1537-3e3db151d74d@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sameer Pujar <spujar@nvidia.com>, tglx@linutronix.de, jason@lakedaemon.net, catalin.marinas@arm.com, heiko@sntech.de, horms+renesas@verge.net.au, maxime.ripard@bootlin.com, andy.gross@linaro.org, olof@lixom.net, bjorn.andersson@linaro.org, jagan@amarulasolutions.com, enric.balletbo@collabora.com, stefan.wahren@i2se.com, ezequiel@collabora.com, marc.w.gonzalez@free.fr, christoffer.dall@arm.com, drjones@redhat.com, julien.thierry@arm.com
Cc: will.deacon@arm.com, treding@nvidia.com, jonathanh@nvidia.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 13/03/2019 13:50, Sameer Pujar wrote:
> 
> On 3/13/2019 4:52 PM, Marc Zyngier wrote:
>> First things first:
>>
>> - Where is the cover letter?
>> - This series should be flagged as v2, as it not the same as the one you
>> sent last week.
> I had the dilemma whether to name this series as v2 or not, thought the 
> commits
> in the series are different and v2 may not be necessary.

This is an iteration on the same theme. Please always bump up the
counter. Better do it more often than not.

> Also felt commit messages are descriptive enough and all belong to 
> irq-gic-pm,
> hence did not send cover letter.
> If you suggest so, I will send a cover letter next patch version(v2)

You should always send a cover letter if you have more than a single patch.

>>
>> On 13/03/2019 11:02, Sameer Pujar wrote:
>>> This is a preparatory patch for using irq-gic-pm driver as module and thus
>>> implement remove() call for the driver. Details of remove() are as below,
>>>
>>>   * pm_runtime_force_suspend() is added to balance runtime PM, otherwise
>>>     following is seen: "agic-controller: Unbalanced pm_runtime_enable!"
>>>   * Function gic_teardown() is exported from gic driver and called in remove
>>>     to perform io unmap.
>>>   * pm_clk_destroy() to free clock resources
>>>   * irq is unmapped and freed with irq_dispose_mapping()
>>>
>> Let's be clear, I have no desire to export any GIC symbol at all. Why
>> should we do this? This "driver" is the tiniest thing, and making it
>> modular doesn't get us anything.
>>
>> So what's the rational for doing so?
> Reason for this was, the driver gets used for AGIC block and audio is not
> boot critical and hence module option was preferred.

Sure, but look at the result:

- you remove your gic-pm module
- the MMIO mapping disappears
- the GIC data structures *are still live*
- a driver does a disable_irq() on an interrupt routed to this block
(because nothing has taken the interrupts away, as far as the kernel is
concerned)
- ...
- profit! (or kernel panic, your choice)

Even better if something else in the system has mapped anything that
ends up in the same vmalloc range. Congratulations, you have now
corrupted unsuspecting memory. This reminds me of the e1000 corruption
bug. Great stuff.

So for the whole thing, NAK. You don't pull an irqchip from under the
kernel's feet.

Thanks,

	M.
-- 
Jazz is not dead. It just smells funny...
