From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 02/73] ARM: tegra: Remove simple clocks bus
Date: Tue, 16 Jun 2020 20:06:56 +0100
Message-ID: <74f8be81-216b-b69b-4517-c90d5f7d578a@nvidia.com>
References: <20200616135238.3001888-1-thierry.reding@gmail.com>
 <20200616135238.3001888-3-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200616135238.3001888-3-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org



On 16/06/2020 14:51, Thierry Reding wrote:
> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> The standard way to do this is to list out the clocks at the top-level.
> Adopt the standard way to fix validation.
> 
> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  arch/arm/boot/dts/tegra114-dalmore.dts    | 15 ++++-----------
>  arch/arm/boot/dts/tegra114-roth.dts       | 15 ++++-----------
>  arch/arm/boot/dts/tegra114-tn7.dts        | 15 ++++-----------
>  arch/arm/boot/dts/tegra124-jetson-tk1.dts | 15 ++++-----------
>  arch/arm/boot/dts/tegra124-nyan.dtsi      | 15 ++++-----------
>  arch/arm/boot/dts/tegra124-venice2.dts    | 15 ++++-----------
>  arch/arm/boot/dts/tegra20-harmony.dts     | 15 ++++-----------
>  arch/arm/boot/dts/tegra20-paz00.dts       | 15 ++++-----------
>  arch/arm/boot/dts/tegra20-seaboard.dts    | 15 ++++-----------
>  arch/arm/boot/dts/tegra20-trimslice.dts   | 19 ++++++-------------
>  arch/arm/boot/dts/tegra20-ventana.dts     | 15 ++++-----------
>  arch/arm/boot/dts/tegra30-beaver.dts      | 15 ++++-----------
>  arch/arm/boot/dts/tegra30-cardhu.dtsi     | 15 ++++-----------
>  13 files changed, 54 insertions(+), 145 deletions(-)

...

> diff --git a/arch/arm/boot/dts/tegra20-trimslice.dts b/arch/arm/boot/dts/tegra20-trimslice.dts
> index 8debd3d3c20d..5b26482a55b7 100644
> --- a/arch/arm/boot/dts/tegra20-trimslice.dts
> +++ b/arch/arm/boot/dts/tegra20-trimslice.dts
> @@ -366,30 +366,23 @@ usb-phy@c5008000 {
>  		status = "okay";
>  	};
>  
> -	sdhci@c8000000 {
> +	mmc@c8000000 {
>  		status = "okay";
>  		broken-cd;
>  		bus-width = <4>;
>  	};
>  
> -	sdhci@c8000600 {
> +	mmc@c8000600 {
>  		status = "okay";
>  		cd-gpios = <&gpio TEGRA_GPIO(P, 1) GPIO_ACTIVE_LOW>;
>  		wp-gpios = <&gpio TEGRA_GPIO(P, 2) GPIO_ACTIVE_HIGH>;
>  		bus-width = <4>;
>  	};

I think that the above belongs in patch 13/73.

Jon
-- 
nvpublic
