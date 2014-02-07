From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: enable I2C MUX PCA954x
Date: Fri, 07 Feb 2014 16:34:45 -0700
Message-ID: <52F56D95.50707@wwwdotorg.org>
References: <1391806412-8561-1-git-send-email-pengw@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1391806412-8561-1-git-send-email-pengw-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bryan Wu <cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 02/07/2014 01:53 PM, Bryan Wu wrote:
> Cardhu has a PCA9546 for I2C bus extension, which connects to 3
> cameras. It's required for Tegra V4L2 soc camera driver and camera
> sensor drivers.

>  arch/arm/boot/dts/tegra30-cardhu.dtsi | 8 ++++++++
>  arch/arm/configs/tegra_defconfig      | 1 +

DT and defconfig changes go into separate branches. Could I get this
split into two patches please?

> diff --git a/arch/arm/boot/dts/tegra30-cardhu.dtsi b/arch/arm/boot/dts/tegra30-cardhu.dtsi

> +		/* NXP PCA9546 I2C Mux */

That comment isn't useful, since the compatible value below spells out
what the device is.

> +		pca9546@70 {

DT nodes should be named after the class/type of device, not the
identify. As such, use "i2cmux@70".
