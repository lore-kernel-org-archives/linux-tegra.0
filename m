From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 29/37] ARM: tegra: colibri_t20: iris: simplify model
 and compatible properties
Date: Tue, 25 Sep 2018 14:04:48 -0500
Message-ID: <20180925190448.GA9309@bogus>
References: <20180902100906.25792-1-marcel@ziswiler.com>
 <20180902100906.25792-30-marcel@ziswiler.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180902100906.25792-30-marcel@ziswiler.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marcel Ziswiler <marcel@ziswiler.com>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Marcel Ziswiler <marcel.ziswiler@toradex.com>, Mikko Perttunen <mperttunen@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Mark Rutland <mark.rutland@arm.com>
List-Id: linux-tegra@vger.kernel.org

On Sun, Sep 02, 2018 at 12:08:58PM +0200, Marcel Ziswiler wrote:
> From: Marcel Ziswiler <marcel.ziswiler@toradex.com>
> 
> Simplify model and compatible by dropping the 256/512 MB from the model,
> -512 from the compatible and rename that property from toradex,iris to
> toradex,colibri_t20-iris to be more in-line with all our other device
> trees.

Doesn't seem to be anything related to '-512' in the patch.

> 
> Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>
> 
> ---
> 
> Changes in v2:
> - Also reflect this change in the device tree bindings documentation.
> 
>  Documentation/devicetree/bindings/arm/tegra.txt | 2 +-
>  arch/arm/boot/dts/tegra20-colibri-iris.dts      | 3 ++-
>  2 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/tegra.txt b/Documentation/devicetree/bindings/arm/tegra.txt
> index 5e1b0b30ece2..0909122a2bee 100644
> --- a/Documentation/devicetree/bindings/arm/tegra.txt
> +++ b/Documentation/devicetree/bindings/arm/tegra.txt
> @@ -54,9 +54,9 @@ board-specific compatible values:
>    toradex,apalis-tk1-v1.2
>    toradex,apalis-tk1-v1.2-eval
>    toradex,colibri_t20
> +  toradex,colibri_t20-iris
>    toradex,colibri_t30
>    toradex,colibri_t30-eval-v3
> -  toradex,iris
>  
>  Trusted Foundations
>  -------------------------------------------
> diff --git a/arch/arm/boot/dts/tegra20-colibri-iris.dts b/arch/arm/boot/dts/tegra20-colibri-iris.dts
> index cd47ac5b528f..dbdf596dd151 100644
> --- a/arch/arm/boot/dts/tegra20-colibri-iris.dts
> +++ b/arch/arm/boot/dts/tegra20-colibri-iris.dts
> @@ -6,7 +6,8 @@
>  
>  / {
>  	model = "Toradex Colibri T20 on Iris";
> -	compatible = "toradex,iris", "toradex,colibri_t20", "nvidia,tegra20";
> +	compatible = "toradex,colibri_t20-iris", "toradex,colibri_t20",
> +		     "nvidia,tegra20";
>  
>  	aliases {
>  		rtc0 = "/i2c@7000c000/rtc@68";
> -- 
> 2.14.4
> 
