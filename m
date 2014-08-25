From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v2 3/9] of: Update Tegra XUSB pad controller binding for
 USB
Date: Mon, 25 Aug 2014 13:12:12 -0600
Message-ID: <53FB8A8C.8040107@wwwdotorg.org>
References: <1408381705-3623-1-git-send-email-abrestic@chromium.org> <1408381705-3623-4-git-send-email-abrestic@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1408381705-3623-4-git-send-email-abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 08/18/2014 11:08 AM, Andrew Bresticker wrote:
> Add new bindings used for USB support by the Tegra XUSB pad controller.
> This includes additional PHY types, USB-specific pinconfig properties, etc.

I'll mainly defer to Thierry for this patch, since he's the expert on 
this HW module.

> diff --git a/Documentation/devicetree/bindings/pinctrl/nvidia,tegra124-xusb-padctl.txt b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra124-xusb-padctl.txt

>   - #phy-cells: Should be 1. The specifier is the index of the PHY to reference.
>     See <dt-bindings/pinctrl/pinctrl-tegra-xusb.h> for the list of valid values.
> +- mboxes: Must contain an entry for the XUSB PHY mailbox channel.
> +  See ../mailbox/mailbox.txt for details.

Can we require the mbox-names property here, so that everything is 
looked up by names. I know that the proposed mbox binding states that 
using indexes is preferred over names, but that's just silly considering 
that names are widely used in most other similar bindings, and are much 
easier to extend in a backwards compatible fashion in the face of 
optional entries. As such, I'd prefer that all Tegra bindings use 
foo-names properties where they exist.

> +Optional properties:
> +-------------------
> +- vbus-otg-{0,1,2}-supply: VBUS regulator for the corresponding UTMI pad.

Why "-otg"? It's quite possible to have a regulator for VBUS even on 
systems that don't support OTG, but rather simply have the ability to 
turn VBUS off.


>     - pcie-0, pcie-1, pcie-2, pcie-3, pcie-4, sata-0:
>
>       Valid functions for this group are: "pcie", "usb3", "sata", "rsvd".
>
> +    The nvidia,usb2-port-num property only applies and is required when
> +    the function is usb3.
> +
>

There are 2 blank lines there.
