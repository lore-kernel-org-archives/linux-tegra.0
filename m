From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] ARM: dt: tegra: cardhu: Add drm components
Date: Fri, 16 Nov 2012 09:46:15 -0700
Message-ID: <50A66DD7.3030805@wwwdotorg.org>
References: <1353042045-3182-1-git-send-email-markz@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1353042045-3182-1-git-send-email-markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 11/15/2012 10:00 PM, Mark Zhang wrote:
> This patch adds the rgb and hdmi nodes which are necessary for
> tegra drm driver.

> diff --git a/arch/arm/boot/dts/tegra30-cardhu.dtsi b/arch/arm/boot/dts/tegra30-cardhu.dtsi

> +	host1x {
> +		dc@54200000 {
> +			rgb {
> +				status = "okay";
> +				nvidia,ddc-i2c-bus = <&rgbddc>;
> +			};
> +		};
> +
> +		hdmi {
> +			status = "okay";
...
> +		};
> +	};

This patch enables both LCD (which will always get enabled, since
there's no way to unplug it) and HDMI (which may optionally get enabled,
depending on whether an HDMI device is plugged in). tegradrm currently
has issues when two outputs are enabled at once (and I just validated
this is still true with all the latest patches). As such, please can you
repost with only the internal LCD enabled. We can enable the LCD port
later once the tegradrm issues are fixed. Thanks.

With no HDMI plugged in, I tested Cardhu's LCD and it works fine.
