From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 03/73] ARM: tegra: Remove simple regulators bus
Date: Tue, 16 Jun 2020 20:24:11 +0100
Message-ID: <cf8eb9d4-70d5-400f-ecc8-2139c25563a9@nvidia.com>
References: <20200616135238.3001888-1-thierry.reding@gmail.com>
 <20200616135238.3001888-4-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200616135238.3001888-4-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org



On 16/06/2020 14:51, Thierry Reding wrote:
> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> The standard way to do this is to list out the regulators at the top
> level. Adopt the standard way to fix validation.
> 
> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  arch/arm/boot/dts/tegra114-dalmore.dts    | 129 +++++------
>  arch/arm/boot/dts/tegra114-roth.dts       | 120 +++++-----
>  arch/arm/boot/dts/tegra114-tn7.dts        |  65 +++---
>  arch/arm/boot/dts/tegra124-jetson-tk1.dts | 238 +++++++++----------
>  arch/arm/boot/dts/tegra124-nyan.dtsi      | 259 ++++++++++-----------
>  arch/arm/boot/dts/tegra124-venice2.dts    | 265 ++++++++++------------
>  arch/arm/boot/dts/tegra20-harmony.dts     | 121 +++++-----
>  arch/arm/boot/dts/tegra20-medcom-wide.dts |  66 +++---
>  arch/arm/boot/dts/tegra20-paz00.dts       |  38 ++--
>  arch/arm/boot/dts/tegra20-plutux.dts      |  66 +++---
>  arch/arm/boot/dts/tegra20-seaboard.dts    | 125 +++++-----
>  arch/arm/boot/dts/tegra20-tamonten.dtsi   |  39 +---
>  arch/arm/boot/dts/tegra20-tec.dts         |  66 +++---
>  arch/arm/boot/dts/tegra20-trimslice.dts   |  85 +++----
>  arch/arm/boot/dts/tegra20-ventana.dts     |  85 +++----
>  arch/arm/boot/dts/tegra30-beaver.dts      | 193 ++++++++--------
>  arch/arm/boot/dts/tegra30-cardhu-a02.dts  | 128 +++++------
>  arch/arm/boot/dts/tegra30-cardhu-a04.dts  | 149 ++++++------
>  arch/arm/boot/dts/tegra30-cardhu.dtsi     | 261 ++++++++++-----------
>  19 files changed, 1130 insertions(+), 1368 deletions(-)

...

> diff --git a/arch/arm/boot/dts/tegra124-venice2.dts b/arch/arm/boot/dts/tegra124-venice2.dts
> index 6a7a31c831c5..effdb303c7f7 100644
> --- a/arch/arm/boot/dts/tegra124-venice2.dts
> +++ b/arch/arm/boot/dts/tegra124-venice2.dts
> @@ -1077,164 +1077,145 @@ power {
>  
>  	panel: panel {
>  		compatible = "lg,lp129qe";
> -
> +		power-supply = <&vdd_3v3_panel>;
>  		backlight = <&backlight>;
>  		ddc-i2c-bus = <&dpaux>;
>  	};

Is this meant to be in this patch?

> diff --git a/arch/arm/boot/dts/tegra20-tamonten.dtsi b/arch/arm/boot/dts/tegra20-tamonten.dtsi
> index 20137fc578b1..95e6bccdb4f6 100644
> --- a/arch/arm/boot/dts/tegra20-tamonten.dtsi
> +++ b/arch/arm/boot/dts/tegra20-tamonten.dtsi
> @@ -495,40 +495,25 @@ usb-phy@c5008000 {
>  		status = "okay";
>  	};
>  
> -	sdhci@c8000600 {
> +	mmc@c8000600 {
>  		cd-gpios = <&gpio TEGRA_GPIO(H, 2) GPIO_ACTIVE_LOW>;
>  		wp-gpios = <&gpio TEGRA_GPIO(H, 3) GPIO_ACTIVE_HIGH>;
>  		bus-width = <4>;
>  		status = "okay";
>  	};
>  
> -	clocks {
> -		compatible = "simple-bus";
> -		#address-cells = <1>;
> -		#size-cells = <0>;
> -
> -		clk32k_in: clock@0 {
> -			compatible = "fixed-clock";
> -			reg = <0>;
> -			#clock-cells = <0>;
> -			clock-frequency = <32768>;
> -		};
> +	clk32k_in: clock@0 {
> +		compatible = "fixed-clock";
> +		clock-frequency = <32768>;
> +		#clock-cells = <0>;
>  	};

The above appears in to be in the wrong patch.

> diff --git a/arch/arm/boot/dts/tegra30-cardhu-a02.dts b/arch/arm/boot/dts/tegra30-cardhu-a02.dts
> index a02ec5082287..4899e05a0d9c 100644
> --- a/arch/arm/boot/dts/tegra30-cardhu-a02.dts
> +++ b/arch/arm/boot/dts/tegra30-cardhu-a02.dts
> @@ -9,87 +9,75 @@ / {
>  	model = "NVIDIA Tegra30 Cardhu A02 evaluation board";
>  	compatible = "nvidia,cardhu-a02", "nvidia,cardhu", "nvidia,tegra30";
>  
> -	sdhci@78000400 {
> +	mmc@78000400 {
>  		status = "okay";
>  		power-gpios = <&gpio TEGRA_GPIO(D, 4) GPIO_ACTIVE_HIGH>;
>  		bus-width = <4>;
>  		keep-power-in-suspend;
>  	};

And here.

> diff --git a/arch/arm/boot/dts/tegra30-cardhu-a04.dts b/arch/arm/boot/dts/tegra30-cardhu-a04.dts
> index 9234988624ec..c1c0ca628af1 100644
> --- a/arch/arm/boot/dts/tegra30-cardhu-a04.dts
> +++ b/arch/arm/boot/dts/tegra30-cardhu-a04.dts
> @@ -11,99 +11,86 @@ / {
>  	model = "NVIDIA Tegra30 Cardhu A04 (A05, A06, A07) evaluation board";
>  	compatible = "nvidia,cardhu-a04", "nvidia,cardhu", "nvidia,tegra30";
>  
> -	sdhci@78000400 {
> +	mmc@78000400 {
>  		status = "okay";
>  		power-gpios = <&gpio TEGRA_GPIO(D, 3) GPIO_ACTIVE_HIGH>;
>  		bus-width = <4>;
>  		keep-power-in-suspend;
>  	};

And here.

Jon

-- 
nvpublic
