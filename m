From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v9 00/17] Consolidate and improve NVIDIA Tegra CPUIDLE
 driver(s)
Date: Tue, 18 Feb 2020 17:56:55 +0300
Message-ID: <234f1d75-d86a-58b4-29d6-c0497498e85c@gmail.com>
References: <20200212235134.12638-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200212235134.12638-1-digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "Rafael J. Wysocki" <rjw-LthD3rsA81gm4RdzfppkhA@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux-CoA6ZxLDdyEEUmgCuDUIdw@public.gmane.org>, Jasper Korten <jja2000-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Heidelberg <david-W22tF5X+A20@public.gmane.org>, Peter Geis <pgwipeout-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-pm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

13.02.2020 02:51, Dmitry Osipenko пишет:
> Hello,
> 
> This series does the following:
> 
>   1. Unifies Tegra20/30/114 drivers into a single driver and moves it out
>      into common drivers/cpuidle/ directory.
> 
>   2. Enables CPU cluster power-down idling state on Tegra30.
> 
> In the end there is a quite nice clean up of the Tegra CPUIDLE drivers
> and of the Tegra's arch code in general. Please apply, thanks!
> 
> !!!WARNING!!! This series was made on top of the cpufreq patches [1]. But it
>               should be fine as long as Thierry Reding would pick up this and
>               the cpufreq patchsets via the Tegra tree, otherwise there will
>               one minor merge-conflict.
> 
> [1] https://patchwork.ozlabs.org/project/linux-tegra/list/?series=158206
...
>   cpuidle: Refactor and move out NVIDIA Tegra20 driver into
>     drivers/cpuidle
>   cpuidle: tegra: Squash Tegra30 driver into the common driver
>   cpuidle: tegra: Squash Tegra114 driver into the common driver
>   cpuidle: tegra: Disable CC6 state if LP2 unavailable

Hello Rafael and Daniel,

Could you please let us know whether you're fine with the above patches
by giving an ACK to them? My understanding is that Thierry can't take
the cpuidle patches through the Tegra tree without yours ACK. Thanks in
advance!
