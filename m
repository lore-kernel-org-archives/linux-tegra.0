From: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v9 12/17] cpuidle: Refactor and move out NVIDIA Tegra20
 driver into drivers/cpuidle
Date: Fri, 21 Feb 2020 16:44:09 +0100
Message-ID: <20200221154409.GP10516@linaro.org>
References: <20200212235134.12638-1-digetx@gmail.com>
 <20200212235134.12638-13-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200212235134.12638-13-digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "Rafael J. Wysocki" <rjw-LthD3rsA81gm4RdzfppkhA@public.gmane.org>, =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux-CoA6ZxLDdyEEUmgCuDUIdw@public.gmane.org>, Jasper Korten <jja2000-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Heidelberg <david-W22tF5X+A20@public.gmane.org>, Peter Geis <pgwipeout-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-pm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Thu, Feb 13, 2020 at 02:51:29AM +0300, Dmitry Osipenko wrote:
> The driver's code is refactored in a way that will make it easy to
> support Tegra30/114/124 SoCs by this unified driver later on. The
> current functionality is equal to the old Tegra20 driver, only the
> code's structure changed a tad. This is also a proper platform driver
> now.
> 
> Acked-by: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  arch/arm/mach-tegra/Makefile          |   3 -
>  arch/arm/mach-tegra/cpuidle-tegra20.c | 216 --------------------
>  arch/arm/mach-tegra/cpuidle.c         |  14 +-
>  arch/arm/mach-tegra/cpuidle.h         |   4 -
>  drivers/cpuidle/Kconfig.arm           |   8 +
>  drivers/cpuidle/Makefile              |   1 +
>  drivers/cpuidle/cpuidle-tegra.c       | 277 ++++++++++++++++++++++++++

Is it possible to use -M option here to make the review easier?
