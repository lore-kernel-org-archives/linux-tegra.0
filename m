From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v3 4/4] ARM: tegra: jetson-tk1: Add XUSB pad controller
Date: Mon, 16 Jun 2014 15:39:00 -0600
Message-ID: <539F63F4.8030800@wwwdotorg.org>
References: <1402930623-28886-1-git-send-email-thierry.reding@gmail.com> <1402930623-28886-4-git-send-email-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1402930623-28886-4-git-send-email-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 06/16/2014 08:57 AM, Thierry Reding wrote:
> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> Assign lanes to the XUSB pads as used on the Jetson TK1.

This series looks OK to me.

Linus, are you OK with my taking it through the Tegra tree? If so, an
ack on patch 2/4 would be great. I expect there will be other series
(PCIe, SATA, XUSB drivers) that depend on this, so whichever tree it
goes through, we'll need to put it into a standalone topic branch for
various other trees to merge, or for other series to be applied on top of.
