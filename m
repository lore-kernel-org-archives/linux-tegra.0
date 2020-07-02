From: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v4 17/37] PM / devfreq: tegra20: Relax Kconfig
 dependency
Date: Thu, 2 Jul 2020 11:10:29 +0900
Message-ID: <876019c4-2dfa-b966-a6e7-573b5189d374@samsung.com>
References: <20200609131404.17523-1-digetx@gmail.com>
        <CGME20200609131659epcas1p25e50d1a206229fefa3425740a476c989@epcas1p2.samsung.com>
        <20200609131404.17523-18-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200609131404.17523-18-digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Georgi Djakov <georgi.djakov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, MyungJoo Ham <myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org>
Cc: =?UTF-8?B?QXJ0dXIgxZp3aWdvxYQ=?= <a.swigon-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 6/9/20 10:13 PM, Dmitry Osipenko wrote:
> The Tegra EMC driver now could be compiled as a loadable kernel module.
> Currently devfreq driver depends on the EMC/MC drivers in Kconfig, and
> thus, devfreq is forced to be a kernel module if EMC is compiled as a
> module. This build dependency could be relaxed since devfreq driver
> checks MC/EMC presence on probe, allowing kernel configuration where
> devfreq is a built-in driver and EMC driver is a loadable module.
> This change puts Tegra20 devfreq Kconfig entry on a par with the Tegra30
> devfreq entry.
> 
> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  drivers/devfreq/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/devfreq/Kconfig b/drivers/devfreq/Kconfig
> index 37dc40d1fcfb..0ee36ae2fa79 100644
> --- a/drivers/devfreq/Kconfig
> +++ b/drivers/devfreq/Kconfig
> @@ -123,7 +123,7 @@ config ARM_TEGRA_DEVFREQ
>  
>  config ARM_TEGRA20_DEVFREQ
>  	tristate "NVIDIA Tegra20 DEVFREQ Driver"
> -	depends on (TEGRA_MC && TEGRA20_EMC) || COMPILE_TEST
> +	depends on ARCH_TEGRA_2x_SOC || COMPILE_TEST
>  	depends on COMMON_CLK
>  	select DEVFREQ_GOV_SIMPLE_ONDEMAND
>  	help
> 

Acked-by: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>

-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
