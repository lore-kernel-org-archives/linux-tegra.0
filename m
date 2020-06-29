From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [TEGRA194_CPUFREQ PATCH v4 4/4] arm64: defconfig: Enable
 CONFIG_ARM_TEGRA194_CPUFREQ
Date: Mon, 29 Jun 2020 11:47:42 +0530
Message-ID: <20200629061742.26pd4rzswlb5wegx@vireshk-i7>
References: <1593186236-12760-1-git-send-email-sumitg@nvidia.com>
 <1593186236-12760-5-git-send-email-sumitg@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1593186236-12760-5-git-send-email-sumitg@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sumit Gupta <sumitg@nvidia.com>
Cc: rjw@rjwysocki.net, catalin.marinas@arm.com, will@kernel.org, thierry.reding@gmail.com, robh+dt@kernel.org, devicetree@vger.kernel.org, jonathanh@nvidia.com, talho@nvidia.com, linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, bbasu@nvidia.com, mperttunen@nvidia.com
List-Id: linux-tegra@vger.kernel.org

On 26-06-20, 21:13, Sumit Gupta wrote:
> Enable Tegra194 CPU frequency scaling support by default.
> 
> Signed-off-by: Sumit Gupta <sumitg@nvidia.com>
> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index f9d378d..385bd35 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -91,6 +91,7 @@ CONFIG_ARM_QCOM_CPUFREQ_NVMEM=y
>  CONFIG_ARM_QCOM_CPUFREQ_HW=y
>  CONFIG_ARM_RASPBERRYPI_CPUFREQ=m
>  CONFIG_ARM_TEGRA186_CPUFREQ=y
> +CONFIG_ARM_TEGRA194_CPUFREQ=y
>  CONFIG_QORIQ_CPUFREQ=y
>  CONFIG_ARM_SCPI_PROTOCOL=y
>  CONFIG_RASPBERRYPI_FIRMWARE=y

Instead of this, maybe you can rather add a default y thing in the
Kconfig itself as this is a single platform driver.

-- 
viresh
