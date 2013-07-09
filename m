From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: enable palmas device for dalmore
Date: Tue, 09 Jul 2013 10:57:36 -0600
Message-ID: <51DC4100.4050309@wwwdotorg.org>
References: <1373290688-2257-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1373290688-2257-1-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 07/08/2013 07:38 AM, Laxman Dewangan wrote:
> Make the entry of Dalmore Power Management Unit device TPS65913
> in dalmore DTS file. The Palma driver support this device.
> 
> Enable following submodule of the TPS65913:
> - GPIO driver
> - RTC driver.
> - Power regulator driver.

> diff --git a/arch/arm/boot/dts/tegra114-dalmore.dts b/arch/arm/boot/dts/tegra114-dalmore.dts

> +		palmas: tps65913@58 {

I assume there's only one TPS65913 in the system, so that node name
doesn't need to contain the unit address to make it unique; the node can
simply be named "tps65913".

> +			palmas_gpio: palmas_gpio {
> +			palmas_rtc {
> +			palmas_pmic {

I don't think those node names need "palmas" in them; they can simply be
"gpio", "rtc", "pmic".


> +			    ldousb-in-supply = <&tps65090_dcdc1_reg>;
> +			    regulators {

You'd usually leave a blank line between properties and nodes.

> +		vdd_cam_1v8_reg: regulator@6 {
...
> +			gpio = <&palmas_gpio 6 0>; /* Palmas GPIO6 */

That comment probably isn't worthwhile; I only insisted on them for
Tegra GPIOs so that the GPIO name could be included somewhere, whereas
for devices with just a small handful of GPIOs without any other names,
there's no point putting a comment, since it's obvious from the cell
content.
