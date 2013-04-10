From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: Add charger subnode to tps65090 node
Date: Wed, 10 Apr 2013 16:30:37 -0600
Message-ID: <5165E80D.7050106@wwwdotorg.org>
References: <1365623505-6309-1-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1365623505-6309-1-git-send-email-rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 04/10/2013 01:51 PM, Rhyland Klein wrote:
> The charger is now represented by a distinct subnode of the tps65090
> device. Add this node and enable low current charging with it.

> diff --git a/arch/arm/boot/dts/tegra114-dalmore.dts b/arch/arm/boot/dts/tegra114-dalmore.dts

> +			charger {
> +				compatible = "ti,tps65090-charger";
> +				ti,enable-low-current-chrg;

So does the TPS65090 driver scan all its sub-nodes like a bus an
instantiate anything? That's a little odd since the regulators node is
at the same level, yet doesn't represent a device on that same internal
bus...
