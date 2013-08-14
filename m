From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v3 4/5] ARM: tegra: set CPU reset handler with firmware
 op
Date: Wed, 14 Aug 2013 15:40:31 -0600
Message-ID: <520BF94F.60907@wwwdotorg.org>
References: <1376360992-1508-1-git-send-email-acourbot@nvidia.com> <1376360992-1508-5-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1376360992-1508-5-git-send-email-acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Dave Martin <Dave.Martin-5wv7dgnIgG8@public.gmane.org>, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 08/12/2013 08:29 PM, Alexandre Courbot wrote:
> Use a firmware operation to set the CPU reset handler and only resort to
> doing it ourselves if there is none defined.
> 
> This supports the booting of secondary CPUs on devices using a TrustZone
> secure monitor.

> diff --git a/arch/arm/mach-tegra/reset.c b/arch/arm/mach-tegra/reset.c

> +	err = call_firmware_op(set_cpu_boot_addr, 0, reset_address);
> +	switch (err) {
> +	case -ENOSYS:
> +		tegra_cpu_reset_handler_set(reset_address);
> +		/* pass-through */
> +	case 0:
> +		is_enabled = true;
> +		break;
> +	default:
> +		pr_crit("Cannot set CPU reset handler: %d\n", err);
> +		BUG();
> +	}

Instead of trying and failing, does it make sense to register
tegra_cpu_reset_handler_set() as the set_cpu_boot_addr firmware op when
there is no firmware present? That would simplify all call-sites of any
firmware op.
