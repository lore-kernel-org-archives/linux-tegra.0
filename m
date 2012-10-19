From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] ARM: dt: tegra: ventana: define pinmux for ddc
Date: Fri, 19 Oct 2012 09:48:56 -0600
Message-ID: <50817668.6020709@wwwdotorg.org>
References: <1350626311-18131-1-git-send-email-markz@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1350626311-18131-1-git-send-email-markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 10/18/2012 11:58 PM, Mark Zhang wrote:
> Define pinmux for DDC. The DDC pinmux in Ventana is 2 pins in I2C2.

> +++ b/arch/arm/boot/dts/tegra20-ventana.dts

> -			ddc {
> -				nvidia,pins = "ddc", "owc", "spdi", "spdo",
> -					"uac";
> -				nvidia,function = "rsvd2";
> -			};

So that removes the entries for 5 pin groups, yet below, entries are
only added for the ddc and pta pingroups, so the other 4 pin groups
become unconfigured.

> +
> +		state_i2cmux_ddc: pinmux_i2cmux_ddc {
> +			ddc {
> +				nvidia,pins = "ddc";
> +				nvidia,function = "i2c2";
> +			};
> +			pta {
> +				nvidia,pins = "pta";
> +				nvidia,function = "rsvd4";
> +			};

Does this actually work? The pta pingroup is configured by the "hog"
pinctrl state of the pinctrl node itself, so this state should fail to
be applied since it attempts to touch the same pingroup.

> +	i2cmux {
...
> +		i2c@1 {
> +			reg = <1>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			smart-battery@b {
> +				compatible = "ti,bq24617", "smart-battery-1.1";
> +				reg = <0xb>;
> +				ti,i2c-retry-count = <2>;
> +				ti,poll-retry-count = <10>;
> +			};

That wasn't there before. Does that device actually exist on Ventana?
Adding it should be a separate patch if so, since this one is just about
introducing the I2C mux, not adding an SBS device. Was this all just
cut/paste from Seaboard without validation?
