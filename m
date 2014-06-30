From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v2 3/4] soc/tegra: Initialize interrupt controller from
 DT
Date: Mon, 30 Jun 2014 14:31:02 -0600
Message-ID: <53B1C906.2080806@wwwdotorg.org>
References: <1403917351-13215-1-git-send-email-thierry.reding@gmail.com> <1403917351-13215-3-git-send-email-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1403917351-13215-3-git-send-email-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 06/27/2014 07:02 PM, Thierry Reding wrote:
> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> Obtains the register ranges for the legacy interrupt controller from DT
> and provide hard-coded values as fallback.

> diff --git a/arch/arm/mach-tegra/irq.c b/arch/arm/mach-tegra/irq.c
> -	if (num_ictlrs > ARRAY_SIZE(ictlr_reg_base)) {
> -		WARN(1, "Too many (%d) interrupt controllers found. Maximum is %d.",
> -			num_ictlrs, ARRAY_SIZE(ictlr_reg_base));
> -		num_ictlrs = ARRAY_SIZE(ictlr_reg_base);
> +	if (num_ictlrs != max_ictlrs) {
> +		WARN(1, "Too many (%d) interrupt controllers found. Maximum is %u.",
> +		     num_ictlrs, max_ictlrs);

We should change that message to something more like:

Wrong number (%d) interrupt controllers found. Expected %u.

Feel free to make that a separate patch though.

> -	if (!of_have_populated_dt())
> -		gic_init(0, 29, distbase,
> -			IO_ADDRESS(TEGRA_ARM_PERIF_BASE + 0x100));
> +	if (!of_have_populated_dt()) {
> +		void __iomem *cpubase = ioremap_nocache(0x50040000, 0x2000);
> +		gic_init(0, 29, distbase, cpubase);
> +	}

That if will never fire these days. We should rip out that block sometime.
