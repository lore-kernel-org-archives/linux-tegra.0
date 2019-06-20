From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH] irqchip/gic-pm: remove PM_CLK dependency
Date: Thu, 20 Jun 2019 17:03:09 +0100
Message-ID: <e96e6d33-697c-8997-1049-e9011ea6b6be@nvidia.com>
References: <1561046268-16329-1-git-send-email-spujar@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1561046268-16329-1-git-send-email-spujar@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sameer Pujar <spujar@nvidia.com>, thierry.reding@gmail.com, marc.zyngier@arm.com, jason@lakedaemon.net, tglx@linutronix.de
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 20/06/2019 16:57, Sameer Pujar wrote:
> gic-pm driver does not use pm-clk interface now and hence the dependency
> is removed from Kconfig.
> 
> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
> ---
>  drivers/irqchip/Kconfig | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
> index 2d3b5a2..6346d6f 100644
> --- a/drivers/irqchip/Kconfig
> +++ b/drivers/irqchip/Kconfig
> @@ -15,7 +15,6 @@ config ARM_GIC_PM
>  	bool
>  	depends on PM
>  	select ARM_GIC
> -	select PM_CLK
>  
>  config ARM_GIC_MAX_NR
>  	int
> 

Thanks. We should probably populate the 'Fixes:' tag for this to show
which commit this fixes. Otherwise ...

Acked-by: Jon Hunter <jonathanh@nvidia.com>

Cheers
Jon

-- 
nvpublic
