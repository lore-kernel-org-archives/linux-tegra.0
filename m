From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH v1 07/17] cpufreq: tegra20: Use generic cpufreq-dt driver
 (Tegra30 supported now)
Date: Wed, 16 Oct 2019 10:48:02 +0530
Message-ID: <20191016051802.rrxv56vtvxfm6qqe@vireshk-i7>
References: <20191015211618.20758-1-digetx@gmail.com>
 <20191015211618.20758-8-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20191015211618.20758-8-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Rob Herring <robh+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Peter Geis <pgwipeout@gmail.com>, Nicolas Chauvet <kwizart@gmail.com>, Marcel Ziswiler <marcel.ziswiler@toradex.com>, linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 16-10-19, 00:16, Dmitry Osipenko wrote:
> Re-parenting to intermediate clock is supported now by the clock driver
> and thus there is no need in a customized CPUFreq driver, all that code
> is common for both Tegra20 and Tegra30. The available CPU freqs are now
> specified in device-tree in a form of OPPs, all users should update their
> device-trees.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/cpufreq/Kconfig.arm          |   4 +-
>  drivers/cpufreq/cpufreq-dt-platdev.c |   2 +
>  drivers/cpufreq/tegra20-cpufreq.c    | 236 ++++++---------------------
>  3 files changed, 55 insertions(+), 187 deletions(-)
> 
> diff --git a/drivers/cpufreq/Kconfig.arm b/drivers/cpufreq/Kconfig.arm
> index a905796f7f85..2118c45d0acd 100644
> --- a/drivers/cpufreq/Kconfig.arm
> +++ b/drivers/cpufreq/Kconfig.arm
> @@ -301,8 +301,8 @@ config ARM_TANGO_CPUFREQ
>  	default y
>  
>  config ARM_TEGRA20_CPUFREQ
> -	tristate "Tegra20 CPUFreq support"
> -	depends on ARCH_TEGRA
> +	bool "Tegra20 CPUFreq support"

Google is currently working on the GKI (generic kernel image) project where they
want to use a single kernel image with modules for all kind of android devices.
And for that they need all such drivers to be built as module. Since this is
already an module, I would ask you to keep it as is instead of moving it to bool
here. Else some google guy will switch it back as module later on.

LGTM otherwise. Nice work. Thanks.

-- 
viresh
