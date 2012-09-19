From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v4 3/5] ARM: tegra: Add Avionic Design Plutux support
Date: Wed, 19 Sep 2012 09:56:55 -0600
Message-ID: <5059EB47.5010600@wwwdotorg.org>
References: <1347979144-24462-1-git-send-email-thierry.reding@avionic-design.de> <1347979144-24462-3-git-send-email-thierry.reding@avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1347979144-24462-3-git-send-email-thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 09/18/2012 08:39 AM, Thierry Reding wrote:
> The Plutux is a set-top box device based on the Tamonten SOM and can be
> connected to a display via HDMI.

> diff --git a/arch/arm/boot/dts/tegra20-plutux.dts b/arch/arm/boot/dts/tegra20-plutux.dts

> +	sound {
> +		compatible = "ad,tegra-audio-plutux",
> +			     "nvidia,tegra-audio-wm8903";
> +		nvidia,model = "Avionic Design Plutux";
> +
> +		nvidia,audio-routing =
> +			"Headphone Jack", "HPOUTR",
> +			"Headphone Jack", "HPOUTL",
> +			"Int Spk", "ROP",
> +			"Int Spk", "RON",
> +			"Int Spk", "LOP",
> +			"Int Spk", "LON",
> +			"Mic Jack", "MICBIAS",
> +			"IN1L", "Mic Jack";
> +
> +		nvidia,i2s-controller = <&tegra_i2s1>;
> +		nvidia,audio-codec = <&wm8903>;
> +
> +		nvidia,spkr-en-gpios = <&wm8903 2 0>;
> +		nvidia,hp-det-gpios = <&gpio 178 0>; /* gpio PW2 */
> +		nvidia,int-mic-en-gpios = <&gpio 184 0>; /*gpio PX0 */
> +		nvidia,ext-mic-en-gpios = <&gpio 185 0>; /* gpio PX1 */

Does your board really have all of those GPIOs? Having both
int-mic-en-gpios and ext-mic-en-gpios is something pretty unique to
Harmony so far, and also a pretty broken HW design, so I'd hope people
haven't copied it.
