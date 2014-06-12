From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v2 3/3] arm: tegra: initial support for apalis t30
Date: Thu, 12 Jun 2014 13:45:27 -0600
Message-ID: <539A0357.6070403@wwwdotorg.org>
References: <dadd07f9ed693d6bcf541764b62a2caf4cc38630.1402353627.git.marcel@ziswiler.com> <95c131deb3e410e8defc9fe125dc662bdb276310.1402353627.git.marcel@ziswiler.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <95c131deb3e410e8defc9fe125dc662bdb276310.1402353627.git.marcel-mitwqZ+T+m9Wk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marcel Ziswiler <marcel-mitwqZ+T+m9Wk0Htik3J/w@public.gmane.org>, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, stefan-XLVq0VzYD2Y@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 06/09/2014 04:52 PM, Marcel Ziswiler wrote:
> This patch adds the device tree to support Toradex Apalis T30, a
> computer on module which can be used on different carrier boards.

This looks OK; I'll apply once the merge window is done.

> diff --git a/arch/arm/boot/dts/tegra30-apalis-eval.dts b/arch/arm/boot/dts/tegra30-apalis-eval.dts

> +	pwmleds {
...
> +		pwm3 {
> +		pwm2 {
> +		pwm1 {

Those still aren't sorted. I'll try and remember to fix that when I
apply it.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
