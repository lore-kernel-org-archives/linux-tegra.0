From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH 1/2] ARM: dts: tegra20: add labels to i2c nodes
Date: Fri, 20 Dec 2019 17:00:46 +0300
Message-ID: <01ac756c-1e51-5d62-ca45-9e0b4f106a29@gmail.com>
References: <20191219130431.30458-1-richard.leitner@skidata.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191219130431.30458-1-richard.leitner@skidata.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Richard Leitner <richard.leitner@skidata.com>, robh+dt@kernel.org, mark.rutland@arm.com, thierry.reding@gmail.com, jonathanh@nvidia.com
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

19.12.2019 16:04, Richard Leitner пишет:
> Add numbered labels to the i2c nodes of the Tegra20 SoC so we just need
> to alias it from derived boards.
> 
> Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
> ---
>  arch/arm/boot/dts/tegra20.dtsi | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/tegra20.dtsi b/arch/arm/boot/dts/tegra20.dtsi
> index 9c58e7fcf5c0..e02f75757a7e 100644
> --- a/arch/arm/boot/dts/tegra20.dtsi
> +++ b/arch/arm/boot/dts/tegra20.dtsi
> @@ -464,7 +464,7 @@
>  		clocks = <&tegra_car TEGRA20_CLK_RTC>;
>  	};
>  
> -	i2c@7000c000 {
> +	i2c1: i2c@7000c000 {
>  		compatible = "nvidia,tegra20-i2c";
>  		reg = <0x7000c000 0x100>;
>  		interrupts = <GIC_SPI 38 IRQ_TYPE_LEVEL_HIGH>;
> @@ -494,7 +494,7 @@
>  		status = "disabled";
>  	};
>  
> -	i2c@7000c400 {
> +	i2c2: i2c@7000c400 {
>  		compatible = "nvidia,tegra20-i2c";
>  		reg = <0x7000c400 0x100>;
>  		interrupts = <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>;
> @@ -510,7 +510,7 @@
>  		status = "disabled";
>  	};
>  
> -	i2c@7000c500 {
> +	i2c3: i2c@7000c500 {
>  		compatible = "nvidia,tegra20-i2c";
>  		reg = <0x7000c500 0x100>;
>  		interrupts = <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>;
> 

Hello Richard,

Why derived boards couldn't label nodes by themselves? That's what all
derived boards are doing already.

BTW, upstream should benefit from the submitted changes. This is not a
very useful change for upstream if you're not updating the actual DTs of
any of the boards in arch/arm/boot/dts/*.
