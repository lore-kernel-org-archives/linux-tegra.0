From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 2/6] ARM: tegra114: fuse: add DFLL FCPU minimum voltage
 override test function
Date: Thu, 19 Dec 2013 16:12:05 -0700
Message-ID: <52B37D45.4090905@wwwdotorg.org>
References: <20131219122857.3226.42830.stgit@tamien> <20131219123652.3226.98741.stgit@tamien>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131219123652.3226.98741.stgit@tamien>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Paul Walmsley <pwalmsley-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 12/19/2013 05:36 AM, Paul Walmsley wrote:
> Add a function to test the internal Tegra114 chip fuse that indicates
> whether the VDD_CPU lower voltage limit for the fast CPU cluster
> should be overridden.

> diff --git a/arch/arm/mach-tegra/fuse.c b/arch/arm/mach-tegra/fuse.c

> +bool tegra114_fuse_read_min_vdd_cpu_override(void)
> +{
> +	if (tegra_chip_id != TEGRA114)
> +		return -EINVAL;

-EINVAL doesn't translate to "bool" too well...

> +
> +	return tegra_spare_fuse(TEGRA114_SPARE_FUSE_VDD_CPU_OVERRIDE) ? true :
> +		false;

In the spirit of my comment on patch 1 and consistency, instead perhaps
just read this fuse at boot, and assign it to a global?

BTW, why the need for "? true : false" - doesn't the compiler do the
conversion correctly itself. Perhaps it's to avoid a performance
warning, in which case a leading !! seems to be more popular.
