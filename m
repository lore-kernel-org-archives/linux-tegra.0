From: Mathias Nyman <mathias.nyman-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [PATCH v8 1/9] xhci: Set shared HCD's hcd_priv in xhci_gen_setup
Date: Fri, 22 May 2015 15:19:19 +0300
Message-ID: <555F1EC7.602@linux.intel.com>
References: <1430761002-9327-1-git-send-email-abrestic@chromium.org>	<1430761002-9327-2-git-send-email-abrestic@chromium.org> <CAL1qeaGo2-T=suBiCTtHmyR1sNeS_ZG-2j2FuuLdGc9vmct2ug@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL1qeaGo2-T=suBiCTtHmyR1sNeS_ZG-2j2FuuLdGc9vmct2ug-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Roger Quadros <rogerq-l0cyMroinI0@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi

On 19.05.2015 21:39, Andrew Bresticker wrote:
> Hi Mathias,
> 
> On Mon, May 4, 2015 at 10:36 AM, Andrew Bresticker
> <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
>> xhci_gen_setup() sets the hcd_priv field for the primary HCD, but not
>> for the shared HCD, requiring xHCI host-controller drivers to set it
>> between usb_create_shared_hcd() and usb_add_hcd().  There's no reason
>> xhci_gen_setup() can't set the shared HCD's hcd_priv as well, so move
>> that bit out of the host-controller drivers and into xhci_gen_setup().
>>
>> Signed-off-by: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>> Reviewed-by: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
>> Cc: Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
>> Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
> 
> Any chance you could pick this up for 4.2?  It's a dependency for the
> xhci-tegra driver which looks like it's going to slip to 4.3 now.
> 

I got some internal tasks I need(ed) to attend, and I'm a bit late with
the 4.2 patches. I'll try to sort it out next week. 

A got some patches from Roger Quadros where he changed 
how struct xhci_hcd is allocated to get xhci working with OTG code.

That code will conflict with patch 1/9, so patch 1/9 will probably be dropped,
but that shouldn't affect the rest of your patches.

-Mathias
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
