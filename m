From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 11/31] dma: add channel request API that supports deferred
 probe
Date: Mon, 25 Nov 2013 11:07:03 -0700
Message-ID: <529391C7.8070304@wwwdotorg.org>
References: <528D28A1.2050307@wwwdotorg.org> <CAPcyv4jRYu7iTOuiXuj9F-t5dpF3ErVHT4X-PKrkJAYfn91a0w@mail.gmail.com> <528E4F55.9070204@wwwdotorg.org> <CAPcyv4jTUVjhFFXP8RL2jCqFj1MqxSCKQYvfdLHTj+1PRDDL3Q@mail.gmail.com> <528F95A9.2050305@wwwdotorg.org> <CAPcyv4iXmBmcsHDc7yjxxbH7sO8m1nVoEO6PUibuDeb1Wtge+g@mail.gmail.com> <528F9DF9.6080706@wwwdotorg.org> <20131123003442.GH16735@n2100.arm.linux.org.uk> <5293883A.8050808@wwwdotorg.org> <CAA9_cmfMtp4WjRGVzfTxrwcNWP95+HE7DAYg_GeWfqi=L2K2aw@mail.gmail.com> <20131125180000.GR16735@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131125180000.GR16735-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: "treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org" <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "Koul, Vinod" <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org" <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andy Shevchenko <andriy.shevchenko-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 11/25/2013 11:00 AM, Russell King - ARM Linux wrote:
> On Mon, Nov 25, 2013 at 09:45:18AM -0800, Dan Williams wrote:
>> Regardless of whether the driver was dma_request_channel as a
>> fallback, it will currently use NULL to indicate an allocation
>> failure.
> 
> At the moment, dma_request_slave_channel()'s return values are valid
> pointer or NULL.  I'd suggest as that's how it's been established,
> that function is left alone - changing the return values in this kind
> of invisible way is Really Bad(tm) because you can't check that it's
> right in any future users - unless you're prepared to review every
> single new user of this function for the next few years or more.
> 
> Instead, leaving it as is and introducing a new function name with
> the different return error method is the right way to do this.

Uggh. So here's the history of my patch series:

a) Started modifying dma_request_slave_channel() since there are very
few users right now, and it seemed simple to convert them all.

b) Found that some places mixed dma_request_slave_channel() and
dma_request_channel(). Converting dma_request_channel()'s return value
in the same way seemed prohibitive since it's much more widely used and
has been around for longer.

c) Rewrote patch to introduce a new function instead, since that didn't
require converting any existing drivers.

d) Received review feedback that I really should convert the existing
function's return code.

e) Started work on that using the return-value-conversion idea from Dan,
which allowed the two "return value styles" to co-exist easily, since I
figured that would be accepted.

Now you're telling me I should do what I already did in the patch, but
Dan is telling me to do the opposite:-(

How do we resolve this? Is there an option both you and Dan can accept?
