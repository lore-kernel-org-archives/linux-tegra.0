From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 2/3] ARM: tegra: Add Avionic Design Medcom-Wide support
Date: Fri, 27 Jul 2012 14:26:06 -0600
Message-ID: <5012F95E.9050200@wwwdotorg.org>
References: <1343228775-1330-1-git-send-email-thierry.reding@avionic-design.de> <1343228775-1330-2-git-send-email-thierry.reding@avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1343228775-1330-2-git-send-email-thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 07/25/2012 09:06 AM, Thierry Reding wrote:
> The Medcom is a 16:9 15" terminal that is used for patient infotainment
> in hospitals.

> diff --git a/arch/arm/boot/dts/tegra20-medcom.dts b/arch/arm/boot/dts/tegra20-medcom.dts

> +	model = "Avionic Design Medcom-Wide board";
> +	compatible = "ad,medcom-wide", "nvidia,tegra20";

The filename implies just "medcom" but the compatible value says
"medcom-wide". I assume the two should match. Are there multiple medcom
versions, with SW-visible differences?

> +	sdhci@c8000600 {
> +		cd-gpios = <&gpio 58 0>; /* gpio PH2 */
> +		wp-gpios = <&gpio 59 0>; /* gpio PH3 */
> +		status = "okay";
> +	};

You want a bus-width property in that node. Same for Plutux.

> +	backlight {
> +		compatible = "pwm-backlight";
> +		pwms = <&pwm 0 5000000>;

The tegra20.dtsi doesn't assign label "pwm" to the PWM controller yet...

The Plutux comments all apply here as well.
