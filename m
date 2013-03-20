From: Shawn Guo <shawn.guo@linaro.org>
Subject: Re: [PATCH V4 6/9] ARM: mxs: Provide regulator to pwm-backlight
Date: Wed, 20 Mar 2013 11:13:26 +0800
Message-ID: <20130320031324.GB26941@S2101-09.ap.freescale.net>
References: <1363719573-20926-1-git-send-email-achew@nvidia.com>
 <1363719573-20926-7-git-send-email-achew@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1363719573-20926-7-git-send-email-achew@nvidia.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: Andrew Chew <achew@nvidia.com>
Cc: romain.naour@openwide.fr, kgene.kim@samsung.com, drwyrm@gmail.com, stefan@openezx.org, laforge@openezx.org, philipp.zabel@gmail.com, lost.distance@yahoo.com, marek.vasut@gmail.com, robert.jarzmik@free.fr, eric.y.miao@gmail.com, linux@arm.linux.org.uk, haojian.zhuang@gmail.com, kyungmin.park@samsung.com, gxt@mprc.pku.edu.cn, linux@prisktech.co.nz, swarren@wwwdotorg.org, thierry.reding@avionic-design.de, acourbot@nvidia.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, openezx-devel@lists.openezx.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Tue, Mar 19, 2013 at 11:59:30AM -0700, Andrew Chew wrote:
> The pwm-backlight driver now takes a mandatory regulator that is gotten
> during driver probe.  Initialize a dummy regulator to satisfy this
> requirement.
> 
> Signed-off-by: Andrew Chew <achew@nvidia.com>
> ---
>  arch/arm/boot/dts/imx23-evk.dts      | 6 ++++++
>  arch/arm/boot/dts/imx28-apf28dev.dts | 6 ++++++
>  arch/arm/boot/dts/imx28-cfa10049.dts | 6 ++++++
>  arch/arm/boot/dts/imx28-evk.dts      | 6 ++++++
>  arch/arm/boot/dts/imx28-tx28.dts     | 6 ++++++
>  5 files changed, 30 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/imx23-evk.dts b/arch/arm/boot/dts/imx23-evk.dts
> index 035c13f..e48e36c 100644
> --- a/arch/arm/boot/dts/imx23-evk.dts
> +++ b/arch/arm/boot/dts/imx23-evk.dts
> @@ -97,10 +97,16 @@
>  		};
>  	};
>  
> +	bl_en: fixed-regulator {

The node name is too generic.  Very likely we have other fixed regulator
in a dts.

For mxs, we have all such board level regulators defined in node
"regulators" as children.

Shawn

> +		compatible = "regulator-fixed";
> +		regulator-name = "bl-en-supply";
> +        };
> +
>  	backlight {
>  		compatible = "pwm-backlight";
>  		pwms = <&pwm 2 5000000>;
>  		brightness-levels = <0 4 8 16 32 64 128 255>;
>  		default-brightness-level = <6>;
> +		enable-supply = <&bl_en>;
>  	};
>  };
