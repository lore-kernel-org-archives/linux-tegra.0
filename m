From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] soc: tegra: fix tegra_pmc_get_suspend_mode definition
Date: Wed, 8 Apr 2020 23:56:37 +0300
Message-ID: <50869779-9a58-4248-a189-e51bf806695e@gmail.com>
References: <20200408190127.587768-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200408190127.587768-1-arnd-r2nGTMty4D4@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, soc-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Venkat Reddy Talla <vreddytalla-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

08.04.2020 22:01, Arnd Bergmann пишет:
> When CONFIG_PM_SLEEP is disabled, the function is not defined,
> causing a link failure:
> 
> arm-linux-gnueabi-ld: drivers/cpuidle/cpuidle-tegra.o: in function `tegra_cpuidle_probe':
> cpuidle-tegra.c:(.text+0x24): undefined reference to `tegra_pmc_get_suspend_mode'
> 
> Change the #ifdef check according to the definition.
> 
> Fixes: 382ac8e22b90 ("cpuidle: tegra: Disable CC6 state if LP2 unavailable")
> Signed-off-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
> ---

Reviewed-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
