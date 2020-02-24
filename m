From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v9 00/17] Consolidate and improve NVIDIA Tegra CPUIDLE
 driver(s)
Date: Mon, 24 Feb 2020 19:44:19 +0300
Message-ID: <6fc959d6-8602-5ab0-d624-b410827005cf@gmail.com>
References: <20200212235134.12638-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200212235134.12638-1-digetx@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Daniel Lezcano <daniel.lezcano@linaro.org>, =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, Jasper Korten <jja2000@gmail.com>, David Heidelberg <david@ixit.cz>, Peter Geis <pgwipeout@gmail.com>
Cc: linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
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
> 
> Changelog:
> 
> v9: - Added acks from Peter De Schrijver.
> 
>     - Added tested-by from Peter Geis, Jasper Korten and David Heidelberg
>       who tested these patches on Ouya, TF300T and Nexus 7 devices.
> 
>     - Temporarily dropped the "cpuidle: tegra: Support CPU cluster power-down
>       state on Tegra30" patch because Michał Mirosław reported that it didn't
>       work well on his TF300T. After some testing we found that changing
>       a way in which firmware performs L2 cache maintenance helps, but later
>       on we also found that the current v9 series works just fine without the
>       extra firmware changes using recent linux-next and the reason why v8
>       didn't work before is still unknown (need more testing). So I decided
>       that it will be better to postpone the dropped patch until we know for
>       sure that it works well for everyone in every possible configuration.
> 
>     - Rebased this series on top of recent linux-next, in a result dropped
>       the "cpuidle: Avoid NULL dereference in cpuidle_driver_state_disabled()"
>       patch because it's not needed anymore.

I just noticed that this patchset was versioned wrongly, it should've
been v10. Sorry for the confusion, next version will be v11.
