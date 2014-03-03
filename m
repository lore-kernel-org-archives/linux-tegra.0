From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: add device tree for SHIELD
Date: Mon, 03 Mar 2014 10:00:43 -0700
Message-ID: <5314B53B.4010107@wwwdotorg.org>
References: <1393818596-26775-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1393818596-26775-1-git-send-email-acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 03/02/2014 08:49 PM, Alexandre Courbot wrote:
> Add a device tree for NVIDIA SHIELD. The set of enabled features is
> still minimal with no display option and USB requiring external power.
> 
> A default kernel command-line as well as initrd addresses are hardcoded
> to match the static values the bootloader is known to use. This allows
> booting from an appended DTB without having to alter it at boot time,
> since the bootloader has no Device Tree support.

This and the TN7 patch look fine. Hopefully I'll apply them soon,
pending the ti,irq-externally-inverted discussion.

> +	/* SD card */

Oh, that's all you meant by wanting to add comments? I guess I just
recognize SD-vs-eMMC by the bus width, but adding the comments is a good
idea.
