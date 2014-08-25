From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v2 1/9] of: Add NVIDIA Tegra XUSB mailbox binding
Date: Mon, 25 Aug 2014 12:48:23 -0600
Message-ID: <53FB84F7.8030509@wwwdotorg.org>
References: <1408381705-3623-1-git-send-email-abrestic@chromium.org> <1408381705-3623-2-git-send-email-abrestic@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1408381705-3623-2-git-send-email-abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 08/18/2014 11:08 AM, Andrew Bresticker wrote:
> Add device-tree bindings for the Tegra XUSB mailbox which will be used
> for communication between the Tegra xHCI controller's firmware and the
> host processor.

> diff --git a/Documentation/devicetree/bindings/mailbox/nvidia,tegra124-xusb-mbox.txt b/Documentation/devicetree/bindings/mailbox/nvidia,tegra124-xusb-mbox.txt

> +NVIDIA Tegra XUSB mailbox
> +=========================
> +
> +The Tegra XUSB mailbox is used by the Tegra xHCI controller's firmware to
> +communicate requests to the host and PHY drivers.
> +
> +Required properties:
> +--------------------
> + - compatible: Should be "nvidia,tegra124-xusb-mbox".
> + - reg: Address and length of the XUSB FPCI registers.
> + - interrupts: XUSB mailbox interrupt.
> + - #mbox-cells: Should be 1.  The specifier is the index of the mailbox to
> +   reference.  See <dt-bindings/mailbox/tegra-xusb-mailbox.h> for the list
> +   of valid values.

Is there a common mailbox binding somewhere? I couldn't find one. While 
the text above specifies the value for #mbox-cells, it doesn't specify 
the details of what the property is used for (i.e. there's no 
documentation of the consumer-side of this property, for parsing the 
mboxes property). Typically, that would be part of a subsystem's common 
binding document, and that document would be referenced here.

> diff --git a/include/dt-bindings/mailbox/tegra-xusb-mailbox.h b/include/dt-bindings/mailbox/tegra-xusb-mailbox.h

> +#define TEGRA_XUSB_MBOX_CHAN_HOST	0
> +#define TEGRA_XUSB_MBOX_CHAN_PHY	1

I can't work out how these values relate to hardware at all. Are they in 
fact properties of the particular firmware that's loaded into the XUSB 
module? If so, I don't think the DT should contain these values at all. 
I wonder if the individual MBOX_CMD_* values from patch 2 are any 
better, although I think those are also defined by the firmware, not the 
hardware?
