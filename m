From: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v2 6/9] usb: xhci: Add NVIDIA Tegra xHCI host-controller driver
Date: Sun, 31 Aug 2014 12:04:08 -0700
Message-ID: <CAL1qeaGhMQiWqEV7GwjFt-4xXSTceRFm8RcaVs9vvVHJ9U8hRQ@mail.gmail.com>
References: <1408381705-3623-1-git-send-email-abrestic@chromium.org>
	<1408381705-3623-7-git-send-email-abrestic@chromium.org>
	<20140830211558.GA13814@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140830211558.GA13814-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>"linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linu>
List-Id: linux-tegra@vger.kernel.org

On Sat, Aug 30, 2014 at 2:15 PM, Greg Kroah-Hartman
<gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org> wrote:
> On Mon, Aug 18, 2014 at 10:08:22AM -0700, Andrew Bresticker wrote:
>> Add support for the on-chip xHCI host controller present on Tegra SoCs.
>>
>> The driver is currently very basic: it loads the controller with its
>> firmware, starts the controller, and is able to service messages sent
>> by the controller's firmware.  The hardware supports device mode as
>> well as lower-power operating modes, but support for these is not yet
>> implemented here.
>
> So you are saying the device doesn't really work?  Can it handle USB
> transactions properly?

Huh?  It's just as functional as any other xHCI platform host.
Perhaps I should have been more clear about "lower-power operating
modes": this refers to the runtime powergating of the controller's
SuperSpeed and host-controller logic and has nothing to do with USB
link/hub/device power management.

> I have a jetson board here, is this the controller for that hardware?
> Can I test this series on that platform, or is it for something else?

Yup, that's the platform I primarily used for testing this series.

>> +static const struct tegra_xhci_soc_config tegra124_soc_config = {
>> +     .firmware_file = "nvidia/tegra124/xusb.bin",
>> +};
>> +MODULE_FIRMWARE("nvidia/tegra124/xusb.bin");
>
> Has this file been submitted to the linux-firmware tree?

It has been posted, see https://patchwork.ozlabs.org/patch/384013/
