From: Stefan Agner <stefan@agner.ch>
Subject: Re: [PATCH v6 1/4] ARM: dts: tegra: Remove usage of deprecated
 skeleton.dtsi
Date: Wed, 23 May 2018 12:46:09 +0200
Message-ID: <9a42132399d8ea69b5b7ce76c442b7b0@agner.ch>
References: <1527069406-6359-1-git-send-email-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1527069406-6359-1-git-send-email-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Marcel Ziswiler <marcel.ziswiler@toradex.com>, Lucas Stach <dev@lynxeye.de>
List-Id: linux-tegra@vger.kernel.org

On 23.05.2018 11:56, Krzysztof Kozlowski wrote:
> Remove the usage of skeleton.dtsi because it was deprecated since commit
> 9c0da3cc61f1 ("ARM: dts: explicitly mark skeleton.dtsi as deprecated").
> It also allows later to fix DTC warnings for missing unit name in
> /memory nodes.
> 
> The /chosen and /aliases nodes are added only when dependent DTSes do
> not define them.  Compiled DTB is the same as before this commit.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Hm I see, you cannot add unit address here because the board level
device tree do not have it yet... That makes the split indeed a bit less
appealing.

Anyway, now we have it, and I think it is still nice to have a separate
change.

Reviewed-by: Stefan Agner <stefan@agner.ch>

--
Stefan



> 
> ---
> 
> Changes since v5:
> 1. New patch, split with skeleton.dtsi removal (suggested by Stefan).
> ---
>  arch/arm/boot/dts/tegra114.dtsi       |  8 ++++++--
>  arch/arm/boot/dts/tegra124.dtsi       |  6 ++++--
>  arch/arm/boot/dts/tegra20.dtsi        | 11 +++++++++--
>  arch/arm/boot/dts/tegra30-apalis.dtsi |  4 ++++
>  arch/arm/boot/dts/tegra30.dtsi        | 11 +++++++++--
>  5 files changed, 32 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/tegra114.dtsi b/arch/arm/boot/dts/tegra114.dtsi
> index 0e4a13295d8a..27ef515e5640 100644
> --- a/arch/arm/boot/dts/tegra114.dtsi
> +++ b/arch/arm/boot/dts/tegra114.dtsi
> @@ -5,11 +5,15 @@
>  #include <dt-bindings/pinctrl/pinctrl-tegra.h>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  
> -#include "skeleton.dtsi"
> -
>  / {
>  	compatible = "nvidia,tegra114";
>  	interrupt-parent = <&lic>;
> +	#address-cells = <1>;
> +	#size-cells = <1>;
> +
> +	memory {
> +		device_type = "memory";
> +	};
>  
>  	host1x@50000000 {
>  		compatible = "nvidia,tegra114-host1x", "simple-bus";
> diff --git a/arch/arm/boot/dts/tegra124.dtsi b/arch/arm/boot/dts/tegra124.dtsi
> index 174092bfac90..951feea784af 100644
> --- a/arch/arm/boot/dts/tegra124.dtsi
> +++ b/arch/arm/boot/dts/tegra124.dtsi
> @@ -7,14 +7,16 @@
>  #include <dt-bindings/reset/tegra124-car.h>
>  #include <dt-bindings/thermal/tegra124-soctherm.h>
>  
> -#include "skeleton.dtsi"
> -
>  / {
>  	compatible = "nvidia,tegra124";
>  	interrupt-parent = <&lic>;
>  	#address-cells = <2>;
>  	#size-cells = <2>;
>  
> +	memory {
> +		device_type = "memory";
> +	};
> +
>  	pcie@1003000 {
>  		compatible = "nvidia,tegra124-pcie";
>  		device_type = "pci";
> diff --git a/arch/arm/boot/dts/tegra20.dtsi b/arch/arm/boot/dts/tegra20.dtsi
> index 0a7136462a1a..88dd1afb5877 100644
> --- a/arch/arm/boot/dts/tegra20.dtsi
> +++ b/arch/arm/boot/dts/tegra20.dtsi
> @@ -4,11 +4,18 @@
>  #include <dt-bindings/pinctrl/pinctrl-tegra.h>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  
> -#include "skeleton.dtsi"
> -
>  / {
>  	compatible = "nvidia,tegra20";
>  	interrupt-parent = <&lic>;
> +	#address-cells = <1>;
> +	#size-cells = <1>;
> +
> +	chosen { };
> +	aliases { };
> +
> +	memory {
> +		device_type = "memory";
> +	};
>  
>  	iram@40000000 {
>  		compatible = "mmio-sram";
> diff --git a/arch/arm/boot/dts/tegra30-apalis.dtsi
> b/arch/arm/boot/dts/tegra30-apalis.dtsi
> index d1d21ec2a844..6f29cbad6e8a 100644
> --- a/arch/arm/boot/dts/tegra30-apalis.dtsi
> +++ b/arch/arm/boot/dts/tegra30-apalis.dtsi
> @@ -10,6 +10,10 @@
>  	model = "Toradex Apalis T30";
>  	compatible = "toradex,apalis_t30", "nvidia,tegra30";
>  
> +	memory {
> +		reg = <0 0>;
> +	};
> +
>  	pcie@3000 {
>  		avdd-pexa-supply = <&vdd2_reg>;
>  		vdd-pexa-supply = <&vdd2_reg>;
> diff --git a/arch/arm/boot/dts/tegra30.dtsi b/arch/arm/boot/dts/tegra30.dtsi
> index a110cf84d85f..19237c08c166 100644
> --- a/arch/arm/boot/dts/tegra30.dtsi
> +++ b/arch/arm/boot/dts/tegra30.dtsi
> @@ -5,11 +5,18 @@
>  #include <dt-bindings/pinctrl/pinctrl-tegra.h>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  
> -#include "skeleton.dtsi"
> -
>  / {
>  	compatible = "nvidia,tegra30";
>  	interrupt-parent = <&lic>;
> +	#address-cells = <1>;
> +	#size-cells = <1>;
> +
> +	chosen { };
> +	aliases { };
> +
> +	memory {
> +		device_type = "memory";
> +	};
>  
>  	pcie@3000 {
>  		compatible = "nvidia,tegra30-pcie";
