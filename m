From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH] arm/tegra: pinmux: ioremap registers
Date: Tue, 11 Oct 2011 17:41:33 -0700
Message-ID: <20111012004133.GA9555@quad.lixom.net>
References: <1318375320-21138-1-git-send-email-swarren@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1318375320-21138-1-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Nicolas Pitre <nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi,

Overall this looks pretty good, with a couple of nits below.

I'm not super-happy with all the opencoding of the reg / access passing into
pg_readl/writel, but adding new helpers for all 4 kinds is also kind of
verbose.

On Tue, Oct 11, 2011 at 05:22:00PM -0600, Stephen Warren wrote:

> diff --git a/arch/arm/mach-tegra/include/mach/pinmux.h b/arch/arm/mach-tegra/include/mach/pinmux.h
> index defd877..741147f 100644
> --- a/arch/arm/mach-tegra/include/mach/pinmux.h
> +++ b/arch/arm/mach-tegra/include/mach/pinmux.h
> @@ -199,6 +199,7 @@ struct tegra_drive_pingroup_config {
>  
>  struct tegra_drive_pingroup_desc {
>  	const char *name;
> +	s16 reg_space;
>  	s16 reg;
>  };
>  
> @@ -207,6 +208,9 @@ struct tegra_pingroup_desc {
>  	int funcs[4];
>  	int func_safe;
>  	int vddio;
> +	s16 tri_space;	/* Register space the tri_reg exists within */
> +	s16 mux_space;	/* Register space the mux_reg exists within */
> +	s16 pupd_space;	/* Register space the pupd_reg exists within */
>  	s16 tri_reg; 	/* offset into the TRISTATE_REG_* register bank */
>  	s16 mux_reg;	/* offset into the PIN_MUX_CTL_* register bank */
>  	s16 pupd_reg;	/* offset into the PULL_UPDOWN_REG_* register bank */

'space' is really 'bank number' here, with *_reg is the offset into that bank,
right?  Calling it a register bank seems to go with the pre-existing language
in the driver a bit more.

[...]

> diff --git a/arch/arm/mach-tegra/pinmux.c b/arch/arm/mach-tegra/pinmux.c
> index 46b9d87..99c2751 100644
> --- a/arch/arm/mach-tegra/pinmux.c
> +++ b/arch/arm/mach-tegra/pinmux.c
> @@ -170,15 +170,17 @@ static const char *pupd_name(unsigned long val)
>  	}
>  }
>  
> +static int nspaces;
> +static void __iomem **regs;
>  
> -static inline unsigned long pg_readl(unsigned long offset)
> +static inline u32 pg_readl(u32 reg, u32 space)
>  {
> -	return readl(IO_TO_VIRT(TEGRA_APB_MISC_BASE + offset));
> +	return readl(regs[space] + reg);
>  }
>  
> -static inline void pg_writel(unsigned long value, unsigned long offset)
> +static inline void pg_writel(u32 val, u32 reg, u32 space)
>  {
> -	writel(value, IO_TO_VIRT(TEGRA_APB_MISC_BASE + offset));
> +	writel(val, regs[space] + reg);
>  }

For both of these, having the space (bank) before the offset into the bank seems
a bit more logical, imho.



-Olof
