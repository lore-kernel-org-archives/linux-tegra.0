From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v1 3/9] of: Update Tegra XUSB pad controller binding for
 USB
Date: Wed, 25 Jun 2014 15:46:18 -0600
Message-ID: <53AB432A.7010400@wwwdotorg.org>
References: <1403072180-4944-1-git-send-email-abrestic@chromium.org> <1403072180-4944-4-git-send-email-abrestic@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1403072180-4944-4-git-send-email-abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 06/18/2014 12:16 AM, Andrew Bresticker wrote:
> Add new bindings used for USB support by the Tegra XUSB pad controller.
> This includes additional PHY types, USB-specific pinconfig properties, etc.

> diff --git a/Documentation/devicetree/bindings/pinctrl/nvidia,tegra124-xusb-padctl.txt b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra124-xusb-padctl.txt

> @@ -21,6 +21,12 @@ Required properties:
>    - padctl
>  - #phy-cells: Should be 1. The specifier is the index of the PHY to reference.
>    See <dt-bindings/pinctrl/pinctrl-tegra-xusb.h> for the list of valid values.
> +- nvidia,xusb-mbox: Handle to the Tegra XUSB mailbox node.

Why does the padctrl code need access to the XUSB mailbox? Isn't the
padctrl HW module something that provides services to the XUSB code. I
would have expected the XUSB node to reference the padctrl node. If
notifications need to be sent back from XUSB padctrl to XUSB, then that
seems like an internal SW detail that doesn't need to be represented in DT.

> +Optional properties:
> +-------------------
> +- vbus-otg-{0,1,2}-supply: VBUS regulator for the corresponding UTMI pad.

Isn't VBUS something that's controlled by the USB PHY? I think the PHYs
are part of the XUSB controller, whereas the XUSB pad control is just
the low level IO pad HW.

> +- nvidia,usb3-port-num: USB3 port (0 or 1) to which the lane is mapped.
> +- nvidia,usb2-port-num: USB2 port (0, 1, or 2) to which the lane is mapped.
> +- nvidia,hsic-strobe-trim: HSIC strobe trimmer value.
> +- nvidia,hsic-rx-strobe-trim: HSIC RX strobe trimmer value.
> +- nvidia,hsic-rx-data-trim: HSIC RX data trimmer value.
> +- nvidia,hsic-tx-rtune-n: HSIC TX RTUNEN value.
> +- nvidia,hsic-tx-rtune-p: HSIC TX RTUNEP value.
> +- nvidia,hsic-tx-slew-n: HSIC TX SLEWN value.
> +- nvidia,hsic-tx-slew-p: HSIC TX SLEWP value.
> +- nvidia,hsic-auto-term: Enables HSIC AUTO_TERM. (0: no, 1: yes)

I wonder if some of that isn't part of the PHY not the pads?

>      Valid functions for this group are: "snps", "xusb", "uart", "rsvd".
>  
> -    The nvidia,iddq property does not apply to this group.
> +    The nvidia,iddq, nvidia,usb3-port-num, nvidia,usb2-port-num, and
> +    nvidia,hsic-* properties do not apply to this group.

Given the increased number of properties we now have, it seems better to
list the properties that *do* apply to each group, rather than those
that don't.
