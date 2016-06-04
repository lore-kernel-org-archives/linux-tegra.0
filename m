From: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH V4 3/9] irqdomain: Don't set type when mapping an IRQ
Date: Sat, 4 Jun 2016 10:51:55 +0100
Message-ID: <20160604105155.107441c9@arm.com>
References: <1463066372-13115-1-git-send-email-jonathanh@nvidia.com>
	<1463066372-13115-4-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1463066372-13115-4-git-send-email-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kevin Hilman <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Thu, 12 May 2016 16:19:26 +0100
Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:

> Some IRQ chips, such as GPIO controllers or secondary level interrupt
> controllers, may require require additional runtime power management
> control to ensure they are accessible. For such IRQ chips, it makes sense
> to enable the IRQ chip when interrupts are requested and disabled them
> again once all interrupts have been freed.
> 
> When mapping an IRQ, the IRQ type settings are read and then programmed.
> The mapping of the IRQ happens before the IRQ is requested and so the
> programming of the type settings occurs before the IRQ is requested. This
> is a problem for IRQ chips that require additional power management
> control because they may not be accessible yet. Therefore, when mapping
> the IRQ, don't program the type settings, just save them and then program
> these saved settings when the IRQ is requested (so long as if they are not
> overridden via the call to request the IRQ).
> 
> Add a stub function for irq_domain_free_irqs() to avoid any compilation
> errors when CONFIG_IRQ_DOMAIN_HIERARCHY is not selected.
> 
> Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Reviewed-by: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>

As discussed just before the 4.7 merge window, this patch is going to
uncover quite a few broken configurations (the main one being the PPI
triggers for the ARM architected timer, which seems to be wrong on a lot
of different platforms).

I'm proposing to put this patch[1] in the same queue in order to
uncover the guilty ones, but we have to be prepared for more breakage
(I've also identified kvmtool as a sinner).

Thanks,

	M.
[1] https://lkml.org/lkml/2016/5/9/546
-- 
Jazz is not dead. It just smells funny.
