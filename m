From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [RFC PATCH V2 1/8] irqdomain: Ensure type settings match for an
 existing mapping
Date: Thu, 17 Dec 2015 14:16:25 +0100
Message-ID: <CACRpkdYPvMfqou7t9K_5=Ojx3U_sc8B2Zkxgeu=1JXxCUU_E2Q@mail.gmail.com>
References: <1450349309-8107-1-git-send-email-jonathanh@nvidia.com>
	<1450349309-8107-2-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1450349309-8107-2-git-send-email-jonathanh@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Jiang Liu <jiang.liu@linux.intel.com>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Kevin Hilman <khilman@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Grygorii Strashko <grygorii.strashko@ti.com>, Lars-Peter Clausen <lars@metafoo.de>, Soren Brinkmann <soren.brinkmann@xilinx.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, Dec 17, 2015 at 11:48 AM, Jon Hunter <jonathanh@nvidia.com> wrote:

> When mapping an IRQ, if a mapping already exists, then we simply return
> the virual IRQ number. However, we do not check that the type settings for

^virtual

Just that it isn't virtual, it's a Linux IRQ number, we actually use
hwirq for the non-virtual IRQ number/offse in this function.

But I know I may be fighting weathermills here.

>  unsigned int irq_create_fwspec_mapping(struct irq_fwspec *fwspec)
>  {
> +       struct device_node *of_node;
>         struct irq_domain *domain;
>         irq_hw_number_t hwirq;
> +       unsigned int cur_type = IRQ_TYPE_NONE;
>         unsigned int type = IRQ_TYPE_NONE;
>         int virq;
>
> @@ -587,23 +589,49 @@ unsigned int irq_create_fwspec_mapping(struct irq_fwspec *fwspec)
>         if (irq_domain_translate(domain, fwspec, &hwirq, &type))
>                 return 0;
>
> -       if (irq_domain_is_hierarchy(domain)) {
> -               /*
> -                * If we've already configured this interrupt,
> -                * don't do it again, or hell will break loose.
> -                */
> -               virq = irq_find_mapping(domain, hwirq);
> -               if (virq)
> -                       return virq;
> +       of_node = irq_domain_get_of_node(domain);

Marc's patches went to great lengths to do this fwspec-neutral,
i.e. it doesn't matter if it's done by DT or ACPI (or whatever).

This just drives a truck through all of that by making
the whole function OF-specific again.

>
> -               virq = irq_domain_alloc_irqs(domain, 1, NUMA_NO_NODE, fwspec);
> -               if (virq <= 0)
> -                       return 0;
> +       /*
> +        * If we've already configured this interrupt,
> +        * don't do it again, or hell will break loose.
> +        */
> +       virq = irq_find_mapping(domain, hwirq);
> +       if (!virq) {
> +               if (irq_domain_is_hierarchy(domain)) {
> +                       virq = irq_domain_alloc_irqs(domain, 1, NUMA_NO_NODE,
> +                                                    fwspec);
> +                       if (virq <= 0)
> +                               return 0;
> +               } else {
> +                       virq = irq_domain_alloc_descs(-1, 1, hwirq,
> +                                                     of_node_to_nid(of_node));

What is this all of a sudden? Not even mentioned in the
commit. Plus I bet ACPI need something else than OF nid
passed here.

Yours,
Linus Walleij
