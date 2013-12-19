From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 10/10] ARM: tegra: Enable USB on Venice2
Date: Thu, 19 Dec 2013 14:37:36 -0700
Message-ID: <52B36720.8080205@wwwdotorg.org>
References: <1387469182-14398-1-git-send-email-treding@nvidia.com> <1387469182-14398-11-git-send-email-treding@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1387469182-14398-11-git-send-email-treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 12/19/2013 09:06 AM, Thierry Reding wrote:
> USB1 and USB3 are routed to two external connectors, while USB2 is used
> for the integrated webcam.
> 
> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> Note: connecting a USB mouse to USB3 works properly and lsusb also detects
> the integrated webcam, though I haven't tested whether the camera actually
> works.
> 
> USB1 doesn't seem to work, but I suspect that might just be because it's
> used for recovery mode and we can't switch it around at runtime yet.

The two regulators you added don't actually hook up to any GPIOs for
control of VBUS, so perhaps this isn't surprising. The regulators added
for VBUS control by Laxman's patch (which I already applied) *do* have
some gpio properties. However, testing indicates:

* With Laxman's patch applied, and your patch 1/10 not applied since
it's a duplicate, this patch doesn't work, i.e. I see no USB devices.

* With Laxman's patch reverted and your patch 1/10 replacing it, I do
see USB devices, and they work. However, then we're not actually
controlling VBUS, so USB1 doesn't work.

Can you please rebase this whole series on the latest Tegra for-3.14/dt
and sort out the issues? Thanks.
