From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 05/10] ARM: tegra: Enable eDP for Venice2
Date: Thu, 19 Dec 2013 14:40:23 -0700
Message-ID: <52B367C7.9010301@wwwdotorg.org>
References: <1387469182-14398-1-git-send-email-treding@nvidia.com> <1387469182-14398-6-git-send-email-treding@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1387469182-14398-6-git-send-email-treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 12/19/2013 09:06 AM, Thierry Reding wrote:
> Venice2 has a 12.9" (2560x1700) panel connected to the eDP output of the
> Tegra124. The panel has an EDID to describe the video timings but needs
> a few extra nodes to get the backlight to come up.

I started with next-20131219, merged your latest drm/for-next branch,
and this doesn't seem to work.

With Laxman's regulator patch applied and your 1/10 dropped since it's a
duplicate, the LCD backlight doesn't light up. I extracted the following
from this patch to fix Laxman's regulator definitions:

                        gpio = <&gpio TEGRA_GPIO(P, 2) GPIO_ACTIVE_LOW>;
+                       enable-active-high;
                };

and the backlight does light up, but that's all.

With Laxman's regulator patch reverted and your patch 1/10 applied to
replace it, I see the backlight working without having to manually fix
up the device tree. However, that's still all; nothing is actually
displayed.

Again, can you please rebase this whole series on the latest Tegra
for-3.14/dt and sort out the issues? Thanks.
