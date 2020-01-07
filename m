From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v6 00/12] NVIDIA Tegra20 CPUFreq driver major update
Date: Wed, 8 Jan 2020 02:17:00 +0300
Message-ID: <ff3006a1-b5b1-5854-3a2c-67278e53b6dd@gmail.com>
References: <20191218202142.11717-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191218202142.11717-1-digetx@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Viresh Kumar <viresh.kumar@linaro.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Peter Geis <pgwipeout@gmail.com>, Nicolas Chauvet <kwizart@gmail.com>, Marcel Ziswiler <marcel.ziswiler@toradex.com>, linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

18.12.2019 23:21, Dmitry Osipenko пишет:
> Hello,
> 
> This series moves intermediate-clk handling from tegra20-cpufreq into
> tegra-clk driver. This allows us to switch to generic cpufreq-dt driver
> which brings voltage scaling, per-hardware OPPs and Tegra30 support out
> of the box. All boards need to adopt CPU OPPs in their device-trees in
> order to get cpufreq support.
> 
> Changelog:
> 
> v6: - Dropped "cpufreq: dt-platdev: Blacklist NVIDIA Tegra20 and Tegra30 SoCs"
>       patch from the series since Viresh picked up that patch separately.
> 
>     - Added two new patches to this series:
> 
>         ARM: tegra: Switch CPU to PLLP on resume from LP1 on Tegra30/114/124
>         ARM: tegra: Don't enable PLLX while resuming from LP1 on Tegra30
> 
>       Previously these patches were sent out separately from this series,
>       but it should be more consistent to include them into the series since
>       they directly relate to enabling of the cpufreq driver on Tegra30.
> 
> v5: - The "Use generic cpufreq-dt driver (Tegra30 supported now)" patch
>       is separated now into two patches by factoring out the blacklisting
>       of cpufreq-dt-platdev into a standalone patch. This is done in a
>       response to request from Jon Hunter to fix the warning splats during
>       boot that are coming from OPP core because OPPs are unavailable. The
>       OPPs will become available once tegra20-cpufreq driver will be updated
>       to support the cpufreq-dt.
> 
> v4: - Updated CCLK diagram in the "Add custom CCLK implementation" patch.
> 
>     - <linux/cpu.h> is now included in the "Use generic cpufreq-dt driver"
>       patch, for consistency.
> 
>     - Returned value of get_cpu_device() is now checked in the "Use generic
>       cpufreq-dt driver" patch, for consistency as well.
> 
> v3: - The "Add custom CCLK implementation" patch was updated in accordance
>       to the comments from Peter De Schrijver. We will not use the clock
>       skipper.
> 
>     - Re added OPPs for T30 Beaver board because Thierry has that board ;)
> 
>     - Added r-b for the "DT binding" patch from Rob Herring.
> 
> v2: - Kept modularity of the tegra20-cpufreq as was requested by Viresh Kumar
>       in a review comment to v1.
> 
>     - Added acks from Viresh Kumar.
> 
>     - Added tested-by from Nicolas Chauvet to the "trimslice" patch.
>       Nicolas told me on IRC that it works fine.
> 
>     - Fixed compilation of the "Add custom CCLK implementation" patch. The
>       error happened because v1 was based on top of yet unreviewed/unapplied
>       patch "clk: tegra: divider: Support enable-bit for Super clocks".
>       Thanks to Peter Geis for reporting the problem.
> 
>     - Replaced Tegra30 "beaver" board with "cardhu-a04" because turned out
>       that's what NVIDIA uses in the testing farm.
> 
> Dmitry Osipenko (12):
>   clk: tegra: Add custom CCLK implementation
>   clk: tegra: pll: Add pre/post rate-change hooks
>   clk: tegra: cclk: Add helpers for handling PLLX rate changes
>   clk: tegra20: Use custom CCLK implementation
>   clk: tegra30: Use custom CCLK implementation
>   ARM: tegra: Switch CPU to PLLP on resume from LP1 on Tegra30/114/124
>   ARM: tegra: Don't enable PLLX while resuming from LP1 on Tegra30
>   dt-bindings: cpufreq: Add binding for NVIDIA Tegra20/30
>   cpufreq: tegra20: Use generic cpufreq-dt driver (Tegra30 supported
>     now)
>   ARM: tegra: Create tegra20-cpufreq platform device on Tegra30
>   ARM: dts: tegra30: beaver: Set up voltage regulators for DVFS
>   ARM: dts: tegra30: beaver: Add CPU Operating Performance Points
> 
>  .../cpufreq/nvidia,tegra20-cpufreq.txt        |  56 +++++
>  arch/arm/boot/dts/tegra30-beaver.dts          |  40 +++-
>  arch/arm/mach-tegra/sleep-tegra30.S           |  18 +-
>  arch/arm/mach-tegra/tegra.c                   |   4 +
>  drivers/clk/tegra/Makefile                    |   1 +
>  drivers/clk/tegra/clk-pll.c                   |  12 +-
>  drivers/clk/tegra/clk-tegra-super-cclk.c      | 212 +++++++++++++++++
>  drivers/clk/tegra/clk-tegra20.c               |   7 +-
>  drivers/clk/tegra/clk-tegra30.c               |   6 +-
>  drivers/clk/tegra/clk.h                       |  19 +-
>  drivers/cpufreq/Kconfig.arm                   |   6 +-
>  drivers/cpufreq/tegra20-cpufreq.c             | 217 +++++-------------
>  12 files changed, 418 insertions(+), 180 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/cpufreq/nvidia,tegra20-cpufreq.txt
>  create mode 100644 drivers/clk/tegra/clk-tegra-super-cclk.c
> 

Hello Peter,

Could you please take a look at the patches and ACK them if they are
okay to you?
