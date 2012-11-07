From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 1/2] gpio: tegra: create irq mapping in gpio_to_irq
Date: Wed, 07 Nov 2012 10:08:09 -0700
Message-ID: <509A9579.5090002@wwwdotorg.org>
References: <1352300492-24779-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1352300492-24779-1-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 11/07/2012 08:01 AM, Laxman Dewangan wrote:
> The gpio interrupts get mapped linearly and hence the mapping
> of irq need to be created by irq_create_mapping().
> 
> The function gpio_to_irq() returns the irq by irq_find_mapping()
> and so returns 0 as there is no mapping created. Fix the function
> to create mapping when gpio_to_irq() get called.

I'm not convinced this should be needed. tegra_gpio_probe() contains:

>         for (gpio = 0; gpio < tegra_gpio_chip.ngpio; gpio++) {
>                 int irq = irq_create_mapping(irq_domain, gpio);

which should create the mapping for every IRQ.

(although I do think the gpiochip_add() should be moved to the very end
of probe(), I doubt that impacts this issue much)
