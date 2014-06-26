From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v1 6/9] usb: xhci: Add NVIDIA Tegra XHCI host-controller
 driver
Date: Thu, 26 Jun 2014 12:07:14 -0600
Message-ID: <53AC6152.5060908@wwwdotorg.org>
References: <1403072180-4944-1-git-send-email-abrestic@chromium.org>	<1403072180-4944-7-git-send-email-abrestic@chromium.org>	<53AB4F2D.2060208@wwwdotorg.org> <CAL1qeaFhfYdW06Md10eGVYWBrRR+f1yykVYHNp5+9-t1C9joPQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL1qeaFhfYdW06Md10eGVYWBrRR+f1yykVYHNp5+9-t1C9joPQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 06/25/2014 06:06 PM, Andrew Bresticker wrote:
> On Wed, Jun 25, 2014 at 3:37 PM, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote:
>> On 06/18/2014 12:16 AM, Andrew Bresticker wrote:
>>> Add support for the on-chip XHCI host controller present on Tegra SoCs.
>>>
>>> The driver is currently very basic: it loads the controller with its
>>> firmware, starts the controller, and is able to service messages sent
>>> by the controller's firmware.  The hardware supports device mode as
>>> well as runtime power-gating, but support for these is not yet
>>> implemented here.

>>> diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c

>>> +static int tegra_xhci_set_ss_clk(struct tegra_xhci_hcd *tegra,
>>> +                              unsigned long rate)
>>
>>> +     switch (rate) {
>>> +     case TEGRA_XHCI_SS_CLK_HIGH_SPEED:
>>> +             /* Reparent to PLLU_480M. Set div first to avoid overclocking */
>>> +             old_parent_rate = clk_get_rate(clk_get_parent(clk));
>>> +             new_parent_rate = clk_get_rate(tegra->pll_u_480m);
>>> +             div = new_parent_rate / rate;
>>> +             ret = clk_set_rate(clk, old_parent_rate / div);
>>> +             if (ret)
>>> +                     return ret;
>>> +             ret = clk_set_parent(clk, tegra->pll_u_480m);
>>> +             if (ret)
>>> +                     return ret;
>>
>> Don't you need to call clk_set_rate() again after reparenting, since the
>> divisor will be different, and the rounding too.
> 
> Nope, the divider we set before remains in-tact after clk_set_parent().

Oh I see, the clk_set_rate() call is setting up div so it's appropriate
after the new parent is selected.

Wouldn't it be better to just stop the clock, assert reset, reparent the
clock, and then set the desired rate directly?
