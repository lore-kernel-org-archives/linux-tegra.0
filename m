From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [RFC PATCH 00/10] Tegra XHCI support
Date: Thu, 15 May 2014 13:33:51 -0600
Message-ID: <5375169F.3060809@wwwdotorg.org>
References: <1400113986-339-1-git-send-email-abrestic@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1400113986-339-1-git-send-email-abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 05/14/2014 06:32 PM, Andrew Bresticker wrote:
> This is a first pass at the host and PHY drivers necessary for USB3.0
> support on Tegra114 and Tegra124.  The Tegra XHCI host controller requires
> external firmware [1] which must be loaded before using any USB ports owned
> by the controller.  The XUSB PHY driver handles mapping and enabling of
> the UTMI, HSIC, and SuperSpeed pads to the XHCI controller.
> 
> Tested on a Venice2 with a variety of USB2.0 and USB3.0 memory sticks
> and ethernet dongles.  
> 
> Notes:
>  - I've included support for Tegra114, but since I don't have Tegra114-based
>    hardware, it is completely untested.
>  - The PCIe and SATA PHYs also are programmed using the XUSB_PADCTL space
>    as well.  At least some of the code can be re-used, specifically with
>    respect to lane programming.  I believe Thierry is working on the PCIe
>    parts of this.

If I understand the HW correctly, there's a separate "pad control" HW
block that provides routing/sharing of signals from USB2(?), USB3, SATA,
and PCIe to the pads.

I believe Thierry is working on exposing this block as a pinctrl driver,
or at least something that the other drivers can call into in order to
configure that block. It'd be good if you can co-ordinate with him to
rebase this driver on top of that, rather than (I assume; haven't read
the code yet...) directly manipulating the padctrl registers inside each
of the different drivers. Co-ordinating that could turn out to be
problematic, and presumably if each driver does its own thing, we end up
duplicating defines, code, and DT bindings for configuring the padctrl HW.
