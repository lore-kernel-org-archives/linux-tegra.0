From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v4 2/5] ARM: tegra: Add Avionic Design Tamonten support
Date: Wed, 19 Sep 2012 09:55:30 -0600
Message-ID: <5059EAF2.10706@wwwdotorg.org>
References: <1347979144-24462-1-git-send-email-thierry.reding@avionic-design.de> <1347979144-24462-2-git-send-email-thierry.reding@avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1347979144-24462-2-git-send-email-thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 09/18/2012 08:39 AM, Thierry Reding wrote:
> The Tamonten is an NVIDIA Tegra2 based system-on-module (SOM) that is
> designed to cover a broad range of applications.

> diff --git a/arch/arm/boot/dts/tegra20-tamonten.dtsi b/arch/arm/boot/dts/tegra20-tamonten.dtsi
...
> +		pmic: tps6586x@34 {
...
> +			regulators {
...
> +					regulator-name = "vdd_sys";
...
> +					regulator-name = "vdd_sm0,vdd_core";
...
> +					regulator-name = "vdd_sm1,vdd_cpu";
...
> +					regulator-name = "vdd_sm2,vin_ldo*";
...
> +					regulator-name = "vdd_ldo0,vddio_pex_clk";

etc.

I just wanted to confirm that those regulator-name values truly are the
signal names in the schematic and not something copied blindly from the
Harmony .dts file without any updates. Same for the voltages.
