From: Marcel Ziswiler <marcel-mitwqZ+T+m9Wk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: colibri t30: fix on-module ethernet
Date: Fri, 21 Nov 2014 12:57:52 +0100
Message-ID: <1416571072.2744.4.camel@localhost.localdomain>
References: <b1cdc96ce8bb15059d7eea282f6586a826bee124.1416566157.git.marcel@ziswiler.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <b1cdc96ce8bb15059d7eea282f6586a826bee124.1416566157.git.marcel-mitwqZ+T+m9Wk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org
Cc: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, stefan-XLVq0VzYD2Y@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Fri, 2014-11-21 at 11:41 +0100, Marcel Ziswiler wrote:
> Looks like Ethernet only ever worked if U-Boot properly brought it up
> as both the reset as well as the VBUS lines were not actively handled
> in-kernel.
> This patch fixes this by just pulling up the reset GPIO

Doing automatic power-cycle tests revealed that this is still not enough
and a proper reset-cycle might be required. However I don't know as of
yet how one can easily do that in mainline with a USB device otherwise
not mentioned anywhere in the device tree. Any ideas?

> and properly
> enabling VBUS via a GPIO enabled fixed regulator VBUS supply.
> 
> Signed-off-by: Marcel Ziswiler <marcel-mitwqZ+T+m9Wk0Htik3J/w@public.gmane.org>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
