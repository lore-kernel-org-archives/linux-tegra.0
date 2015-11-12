From: Kevin Hilman <khilman@kernel.org>
Subject: Re: [RFC PATCH 1/2] genirq: Add runtime resume/suspend support for IRQ chips
Date: Thu, 12 Nov 2015 15:20:40 -0800
Message-ID: <7hio56dctz.fsf@deeprootsystems.com>
References: <1447166377-19707-1-git-send-email-jonathanh@nvidia.com>
	<1447166377-19707-2-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1447166377-19707-2-git-send-email-jonathanh@nvidia.com> (Jon
	Hunter's message of "Tue, 10 Nov 2015 14:39:36 +0000")
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Jon Hunter <jonathanh@nvidia.com> writes:

> Some IRQ chips may be located in a power domain outside of the CPU subsystem
> and hence will require device specific runtime power management. Ideally,
> rather than adding more functions to the irq_chip_ops function table, using
> existing chip functions such as irq_startup/shutdown or
> irq_request/release_resources() would be best. However, these existing chip
> functions are called in the context of a spinlock which is not ideal for
> power management operations that may take some time to power up a domain.
>
> Two possible solutions are:
> 1. Move existing chip operators such as irq_request/release_resources()
>    outside of the spinlock and use these helpers.
> 2. Add new chip operators that are called outside of any spinlocks while
>    setting up and freeing an IRQ.

> Not knowing whether we can safely move irq_request/release_resources() to
> outside the spinlock (but hopefully this will solicit some feedback), add
> new chip operators for runtime resuming and suspending of an IRQ chip.

I'm not quite seeing how this would connect to the actual hardware
power domain (presumabaly managed by genpd) and any other devices in
that domain (presumably managed by runtime PM.)

If all the RPM devices in the domain go idle, it will be powered off
independently of the status of the irqchip because the irqchip isn't
using RPM. 

Is there a longer-term plan to handle the irqchips as a "normal" device
and use RPM?  IMO, that approach would be helpful even for irqchips that
share power domains with CPUs, since there are efforts working towards
using genpd/RPM to manage CPUs/clusters.

Kevin
