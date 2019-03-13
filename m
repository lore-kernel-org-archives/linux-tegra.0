From: Marc Zyngier <marc.zyngier@arm.com>
Subject: Re: [PATCH 1/5] irqchip/gic-pm: add driver remove support
Date: Wed, 13 Mar 2019 17:57:09 +0000
Message-ID: <58f4ad18-c584-429c-9170-72cd7a3061bc@arm.com>
References: <1552474956-25513-1-git-send-email-spujar@nvidia.com>
 <0cd78fb7-4bcb-b735-54ca-24a179b9ff72@arm.com>
 <bc00b804-2248-4f8b-1537-3e3db151d74d@nvidia.com>
 <da01de60-b76a-9575-16ed-138a78d997c1@arm.com> <20190313163435.GA6926@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190313163435.GA6926@ulmo>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <treding@nvidia.com>
Cc: Sameer Pujar <spujar@nvidia.com>, tglx@linutronix.de, jason@lakedaemon.net, catalin.marinas@arm.com, heiko@sntech.de, horms+renesas@verge.net.au, maxime.ripard@bootlin.com, andy.gross@linaro.org, olof@lixom.net, bjorn.andersson@linaro.org, jagan@amarulasolutions.com, enric.balletbo@collabora.com, stefan.wahren@i2se.com, ezequiel@collabora.com, marc.w.gonzalez@free.fr, christoffer.dall@arm.com, drjones@redhat.com, julien.thierry@arm.com, will.deacon@arm.com, jonathanh@nvidia.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Hi Thierry,

On 13/03/2019 16:34, Thierry Reding wrote:
> On Wed, Mar 13, 2019 at 02:20:41PM +0000, Marc Zyngier wrote:

[...]

>> Sure, but look at the result:
>>
>> - you remove your gic-pm module
>> - the MMIO mapping disappears
>> - the GIC data structures *are still live*
>> - a driver does a disable_irq() on an interrupt routed to this block
>> (because nothing has taken the interrupts away, as far as the kernel is
>> concerned)
>> - ...
>> - profit! (or kernel panic, your choice)
> 
> I suppose we could use device links to model the dependency, but perhaps
> it's not worth it for something like the GIC. The AGIC is somewhat of an
> outlier because it serves a fairly encapsulated part of the system, so
> it would be manageable to make it unloadable.

The problem is that the GIC is required so early that it cannot be a
real device (devices require sysfs, which requires the VFS, which has
indirect dependencies in the scheduler, which needs the timer, which
needs interrupts -- I've been pondering turning that upside down for
years, but life is too short).

> 
>> Even better if something else in the system has mapped anything that
>> ends up in the same vmalloc range. Congratulations, you have now
>> corrupted unsuspecting memory. This reminds me of the e1000 corruption
>> bug. Great stuff.
> 
> Can you elaborate on this point? How would unloading a driver cause
> memory corruption in another driver's mapped memory? I've never heard of
> this before, so I want to make sure I understand what to look out for in
> the future.

The MMIO ranges get their VA as part of the vmalloc space. If you free
that space (iounmap), you allow it to be reused by another mapping if
the hole you've created fits the new ioremap. Now the GIC driver (which,
remember, still has references to that VA space all over the place)
unexpectedly pokes into another driver's MMIO space.

But it can be worse. You could have loaded a module instead, which also
ends up in the vmalloc region. And now the GIC driver is writing to the
module code or data. Or anything that gets allocated using vmalloc.

> 
>> So for the whole thing, NAK. You don't pull an irqchip from under the
>> kernel's feet.
> 
> Maybe we should also set the driver's .suppress_bind_attrs = true while
> at it, to prevent anyone from trying to force unbind the driver via
> sysfs?

Would that prevent a 'modprobe -r'? With the current approach, anything
that allows the driver to be removed is potentially fatal.

Thanks,

	M.
-- 
Jazz is not dead. It just smells funny...
