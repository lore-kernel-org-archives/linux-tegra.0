From: "Cousson, Benoit" <b-cousson-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH V2] arm/tegra: convert tegra20 to GIC devicetree binding
Date: Tue, 29 Nov 2011 14:00:58 +0100
Message-ID: <4ED4D78A.6000400@ti.com>
References: <1322528052-6516-1-git-send-email-swarren@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1322528052-6516-1-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi Stephen & Peter,

On 11/29/2011 1:54 AM, Stephen Warren wrote:
> From: pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org<pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

[...]

> @@ -125,6 +131,14 @@ void __init tegra_init_irq(void)
>   	gic_arch_extn.irq_unmask = tegra_unmask;
>   	gic_arch_extn.irq_retrigger = tegra_retrigger;
>
> -	gic_init(0, 29, IO_ADDRESS(TEGRA_ARM_INT_DIST_BASE),
> -		 IO_ADDRESS(TEGRA_ARM_PERIF_BASE + 0x100));
> +#ifdef CONFIG_OF
> +	/* Check if there is a devicetree present as of_irq_init doesn't
> +	 * indicate if an interrupt controller node was found.
> +	 */
> +	if (of_find_node_by_path("/"))
> +		of_irq_init(tegra_irq_match);
> +	else
> +#endif

For the same kind of need, I found the following API:

of_have_populated_dt()

Moreover, it returns false if !CONFIG_OF, so it will avoid the #ifdef.

Regards,
Benoit
