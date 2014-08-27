From: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v2 3/9] of: Update Tegra XUSB pad controller binding for USB
Date: Wed, 27 Aug 2014 09:36:33 -0700
Message-ID: <CAL1qeaGHuMegpeyumD8GrFRmeufkiiUygAdqu1ECHrfSkixwOQ@mail.gmail.com>
References: <1408381705-3623-1-git-send-email-abrestic@chromium.org>
	<1408381705-3623-4-git-send-email-abrestic@chromium.org>
	<53FB8A8C.8040107@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <53FB8A8C.8040107-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-usb-u79uwXL29TbrhsbdSgBK9A@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Mon, Aug 25, 2014 at 12:12 PM, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote:
> On 08/18/2014 11:08 AM, Andrew Bresticker wrote:
>>   - #phy-cells: Should be 1. The specifier is the index of the PHY to
>> reference.
>>     See <dt-bindings/pinctrl/pinctrl-tegra-xusb.h> for the list of valid
>> values.
>> +- mboxes: Must contain an entry for the XUSB PHY mailbox channel.
>> +  See ../mailbox/mailbox.txt for details.
>
>
> Can we require the mbox-names property here, so that everything is looked up
> by names. I know that the proposed mbox binding states that using indexes is
> preferred over names, but that's just silly considering that names are
> widely used in most other similar bindings, and are much easier to extend in
> a backwards compatible fashion in the face of optional entries. As such, I'd
> prefer that all Tegra bindings use foo-names properties where they exist.

Sure, will do.

>> +Optional properties:
>> +-------------------
>> +- vbus-otg-{0,1,2}-supply: VBUS regulator for the corresponding UTMI pad.
>
>
> Why "-otg"? It's quite possible to have a regulator for VBUS even on systems
> that don't support OTG, but rather simply have the ability to turn VBUS off.

Because they're the VBUS supplies for the OTG 'lanes'.  It doesn't
really add anything, so I'll omit the "-otg".
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
