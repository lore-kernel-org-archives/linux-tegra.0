From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 2/2 v4] ARM: tegra: fix the status of PWM nodes
Date: Wed, 13 Mar 2013 10:07:22 -0600
Message-ID: <5140A43A.4060808@wwwdotorg.org>
References: <1363131651-13734-1-git-send-email-achew@nvidia.com> <1363131651-13734-2-git-send-email-achew@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1363131651-13734-2-git-send-email-achew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Chew <achew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 03/12/2013 05:40 PM, Andrew Chew wrote:
> We should be defining the PWM nodes with status as "disabled" in the
> chip-specific dtsi file, since we don't know whether specific boards
> will use the PWM or not.  This patch fixes the PWM node status for
> Tegra20 and Tegra30.

> diff --git a/arch/arm/boot/dts/tegra20-medcom-wide.dts b/arch/arm/boot/dts/tegra20-medcom-wide.dts

> +	pwm: pwm {
> +		status = "okay";
> +	}
> +
>  	backlight {

You don't need to repeat the label ("pwm:") in this file; it's already
defined in tegra20.dtsi.

Also, the node sort order is wrong here; pwm's reg value is before i2c's
reg value (which is the current node immediately before the backlight
node in this file).

I'll fix these issues up when applying the patch since they're easy.
