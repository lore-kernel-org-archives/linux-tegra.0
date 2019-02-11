From: Sameer Pujar <spujar@nvidia.com>
Subject: Re: [PATCH] ARM: tegra: enforce PM requirement
Date: Mon, 11 Feb 2019 19:29:37 +0530
Message-ID: <d78324ad-25de-a125-a1bd-6088f069ef58@nvidia.com>
References: <1549365418-26283-1-git-send-email-spujar@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1549365418-26283-1-git-send-email-spujar@nvidia.com>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: linux@armlinux.org.uk, jhogan@kernel.org
Cc: thierry.reding@gmail.com, jonathanh@nvidia.com, linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 2/5/2019 4:46 PM, Sameer Pujar wrote:
> Drivers need to handle !PM case with work arounds for managing clocks
> and power explicitly, which is not really necessary when PM support on
> tegra is in good shape. In fact ARM 64-bit tegra platforms enforce PM
> support and there is no reason why this cannot be done for 32-bit.
>
> This patch selects PM unconditionally and drivers can rely on runtime
> PM framework for clock and power management.
>
> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
> Reviewed-by: Thierry Reding <treding@nvidia.com>
> Reviewed-by: Jonathan Hunter <jonathanh@nvidia.com>
> ---
>   arch/arm/mach-tegra/Kconfig | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm/mach-tegra/Kconfig b/arch/arm/mach-tegra/Kconfig
> index 7f3b83e..51a8fa3 100644
> --- a/arch/arm/mach-tegra/Kconfig
> +++ b/arch/arm/mach-tegra/Kconfig
> @@ -10,6 +10,7 @@ menuconfig ARCH_TEGRA
>   	select HAVE_ARM_SCU if SMP
>   	select HAVE_ARM_TWD if SMP
>   	select PINCTRL
> +	select PM
>   	select PM_OPP
>   	select ARCH_HAS_RESET_CONTROLLER
>   	select RESET_CONTROLLER

Request for review comments or approval.

Thanks,
Sameer.
