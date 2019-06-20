From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH] bus: tegra-aconnect: remove PM_CLK dependency
Date: Thu, 20 Jun 2019 17:02:27 +0100
Message-ID: <55217434-2a50-7abe-25c3-6f4f90d8ba34@nvidia.com>
References: <1561045919-15449-1-git-send-email-spujar@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1561045919-15449-1-git-send-email-spujar@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sameer Pujar <spujar@nvidia.com>, thierry.reding@gmail.com
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 20/06/2019 16:51, Sameer Pujar wrote:
> aconnect bus driver does not use pm-clk interface now and hence the
> dependency is removed from Kconfig.
> 
> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
> ---
>  drivers/bus/Kconfig | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/bus/Kconfig b/drivers/bus/Kconfig
> index 1851112..4587ef2 100644
> --- a/drivers/bus/Kconfig
> +++ b/drivers/bus/Kconfig
> @@ -128,7 +128,6 @@ config TEGRA_ACONNECT
>  	tristate "Tegra ACONNECT Bus Driver"
>  	depends on ARCH_TEGRA_210_SOC
>  	depends on OF && PM
> -	select PM_CLK
>  	help
>  	  Driver for the Tegra ACONNECT bus which is used to interface with
>  	  the devices inside the Audio Processing Engine (APE) for Tegra210.

Thanks. We should probably populate the 'Fixes:' tag for this to show
which commit this fixes. Otherwise ...

Acked-by: Jon Hunter <jonathanh@nvidia.com>

Cheers
Jon

-- 
nvpublic
