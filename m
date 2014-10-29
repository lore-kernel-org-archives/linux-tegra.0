From: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH RESEND V4 0/9] Tegra xHCI support
Date: Wed, 29 Oct 2014 14:52:45 +0900
Message-ID: <CAAVeFuJ0GhKENAERubGywAHOQp9=iohOxux6O=58xfXNcxG_dg@mail.gmail.com>
References: <1414535277-15645-1-git-send-email-abrestic@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1414535277-15645-1-git-send-email-abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWMMKQXVYFwzLw@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, Oct 29, 2014 at 7:27 AM, Andrew Bresticker
<abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
> This series adds support for xHCI on NVIDIA Tegra SoCs.  This includes:
>  - patches 1 and 2: adding a driver for the mailbox used to communicate
>    with the xHCI controller's firmware,
>  - patches 3 and 4: extending the XUSB pad controller driver to support
>    the USB PHY types (UTMI, HSIC, and USB3),
>  - patches 5 and 6: adding a xHCI host-controller driver, and
>  - patches 7, 8, and 9: updating the relevant DT files.
>
> The PHY and host drivers have compile-time dependencies on the mailbox
> driver, and the host driver has compile-time dependencies on the PHY
> driver.  It is probably best if these all get merged through the Tegra
> tree.  This series still needs ACKs from the relevant maintainers for
> the mailbox and xHCI host drivers and their device-tree bindings.
>
> Tested on Venice2, Jetson TK1, and Big with a variety of USB2.0 and
> USB3.0 memory sticks and ethernet dongles using controller firmware
> recently posted by Andrew Chew [0].
>
> Based on v3.18-rc2.  All other dependencies (xHCI modules and mailbox
> series) have been merged.

I do not feel comfortable enough with xHCI to give a reviewed-by tag,
but FWIW I have found nothing wrong with these patches.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
