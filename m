From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM: DT: tegra: Add Toradex Iris carrier board with
 T20 512MB COM
Date: Thu, 17 Jan 2013 13:57:32 -0700
Message-ID: <50F865BC.5050900@wwwdotorg.org>
References: <1358423961-24318-1-git-send-email-dev@lynxeye.de> <1358423961-24318-2-git-send-email-dev@lynxeye.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1358423961-24318-2-git-send-email-dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 01/17/2013 04:59 AM, Lucas Stach wrote:
> This adds the device tree for the Toradex Iris carrier board used
> together with a Colibri T20 512MB COM.

> diff --git a/arch/arm/boot/dts/tegra20-iris-512.dts b/arch/arm/boot/dts/tegra20-iris-512.dts

> +	board_regulators {

Similarly, name that node just regulators

> +		compatible = "simple-bus";
> +		#address-cells = <1>;
> +		#size-cells = <0>;

Those properties will then already exist, so no need to duplicate them here.

> +		usb_host_vbus {

That would be regulator@3

> +			compatible = "regulator-fixed";
> +			reg = <0>;

That reg = <3>;

(or start numbering the board entries at say 100 to leave room for
changes in the COM include file)

> +			regulator-name = "usb_host_vbus";
> +			regulator-min-microvolt = <5000000>;
> +			regulator-max-microvolt = <5000000>;
> +			regulator-boot-on;
> +			regulator-always-on;
> +			gpio = <&gpio 178 0>;
> +		};
> +
> +		vcc_sd_reg: regulator@3 {
> +			compatible = "regulator-fixed";
> +			reg = <1>;

And the node name and reg property here would be 4.

> +			regulator-name = "vcc_sd";
> +			regulator-min-microvolt = <3300000>;
> +			regulator-max-microvolt = <3300000>;
> +		};
> +	};
> +};

Oh and in patch 1, I noticed spaces after < or before >; could you
remove those while you're at it. Thanks.
