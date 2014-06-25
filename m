From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v1 1/9] of: Add NVIDIA Tegra XUSB mailbox binding
Date: Wed, 25 Jun 2014 17:00:03 -0600
Message-ID: <53AB5473.3050204@wwwdotorg.org>
References: <1403072180-4944-1-git-send-email-abrestic@chromium.org>	<1403072180-4944-2-git-send-email-abrestic@chromium.org>	<53AB422E.4040707@wwwdotorg.org> <CAL1qeaFPjq9nqA2GDZZW+=DZsddWCkUjJcnRsfPkBWj8gmFsiw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL1qeaFPjq9nqA2GDZZW+=DZsddWCkUjJcnRsfPkBWj8gmFsiw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 06/25/2014 04:37 PM, Andrew Bresticker wrote:
> On Wed, Jun 25, 2014 at 2:42 PM, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote:
>> On 06/18/2014 12:16 AM, Andrew Bresticker wrote:
>>> Add device-tree bindings for the Tegra XUSB mailbox which will be used
>>> for communication between the Tegra XHCI controller and the host.
>>
>> Sorry for the slow review.
>>
>>> diff --git a/Documentation/devicetree/bindings/mailbox/nvidia,tegra124-xusb-mbox.txt b/Documentation/devicetree/bindings/mailbox/nvidia,tegra124-xusb-mbox.txt
>>
>>> +NVIDIA Tegra XUSB mailbox
>>> +=========================
>>> +
>>> +The Tegra XUSB mailbox is used by the Tegra XHCI controller's firmware to
>>> +communicate with the host.
>>
>> Isn't the mailbox an internal implementation detail of the XUSB controller.
>>
>> In other words, I'd naively think that there isn't a standalone generic
>> mailbox that can be used by anything, but we just happen to want to use
>> for XUSB. Rather, there's an XUSB controller, and part of the interface
>> to that controller is a mailbox.
> 
> Yes, the mailbox isn't an actual piece of hardware but rather the
> interface through which the XUSB host and AP communicate.
> 
>> As such, I don't think we want a standalone mailbox node in DT. Rather,
>> we should add the required reg and interrupt values into the XUSB DT node.
>>
>> The driver for that XUSB HW module can either:
>>
>> a) Register as both a mailbox driver and an EHCI driver.
>>
>> b) Spawn a child device to instantiate the mailbox driver.
>>
>> Perhaps (b) could be assisted by using the MFD framework?
> 
> So in the RFC series I did something like (a) where the XUSB host
> handled the mailbox interrupt with both the PHY and host could
> registering notifiers to handle the messages.  It was suggested by
> Arnd though that I make a separate mailbox driver.  Instead of having
> a both a host and mailbox node, I could have a single XUSB host node
> and have the mailbox driver bind to that - thoughts?

Yes, that sounds like what I meant by (b) above. I don't think you can
actually have 2 drivers bind to the same DT node though, so it'd have to
work something like:

* XUSB host node causes a platform device to be instantiated
* XUSB host driver probe()s against that
* XUSB host driver's probe() creates a platform device for the mailbox
* XUSB mailbox driver probe()s against that.

Or, perhaps go completely MFD, and have 2 child devices (XUSB host and
XUSB mailbox) instantiated by the MFD parent, which is what is in the DT.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
