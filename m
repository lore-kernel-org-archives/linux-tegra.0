From: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v2 0/9] Tegra xHCI support
Date: Mon, 18 Aug 2014 12:35:42 -0700
Message-ID: <CAL1qeaGuMWbaZ4GQWATtrnYe-RjuTwLpFnrdhibWGNWm0iF+=g@mail.gmail.com>
References: <1408381705-3623-1-git-send-email-abrestic@chromium.org>
	<53F2381B.8020801@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <53F2381B.8020801-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-usb-u79uwXL29TbrhsbdSgBK9A@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Mon, Aug 18, 2014 at 10:30 AM, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote:
> On 08/18/2014 11:08 AM, Andrew Bresticker wrote:
>>
>> This series adds support for xHCI on NVIDIA Tegra SoCs.  This includes:
>>   - adding a driver for the mailbox used to communicate with the xHCI
>>     controller's firmware,
>>   - extending the XUSB pad controller driver to support the USB PHY
>>     types (UTMI, HSIC, and USB3), and
>>   - adding a xHCI host-controller driver.
>
>
> Can you please remind us what dependencies exist between the patches? In
> other words, is it possible to apply parts of the series to their usual
> subsystem branches, or does the whole thing need to go into a single topic
> branch in order to avoid compile-time problems, or run-time problems in
> features unrelated to the new functionality? Thanks.

The whole thing will probably need to go into one branch.  Patch 4/9
("pinctrl: tegra-xusb: Add USB PHY support") has compile-time
dependencies on patch 2/9 ("mailbox: Add NVIDIA Tegra XUSB mailbox
driver") and patch 6/9 ("usb: xhci: Add NVIDIA Tegra xHCI
host-controller driver") has compile-time dependencies on both patches
2/9 and 4/9.
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
