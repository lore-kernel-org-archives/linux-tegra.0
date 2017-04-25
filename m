From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH V3 4/4] soc/tegra: pmc: Use the new reset APIs to manage
 reset controllers
Date: Tue, 25 Apr 2017 12:33:20 +0200
Message-ID: <1493116400.2394.32.camel@pengutronix.de>
References: <1492514488-27385-1-git-send-email-vivek.gautam@codeaurora.org>
         <1492514488-27385-5-git-send-email-vivek.gautam@codeaurora.org>
         <e87a846b-4bbf-03cf-f3a6-99d5e468425c@nvidia.com>
         <afcddcbe-7086-2739-6de2-84f5c1d34374@codeaurora.org>
         <b3f2cbe5-4a1a-2f7b-2e4a-6a06eeadc890@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <b3f2cbe5-4a1a-2f7b-2e4a-6a06eeadc890-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Vivek Gautam <vivek.gautam-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, 2017-04-25 at 11:05 +0100, Jon Hunter wrote:
> On 25/04/17 05:15, Vivek Gautam wrote:
> > On 04/24/2017 06:15 PM, Jon Hunter wrote:
> >> On 18/04/17 12:21, Vivek Gautam wrote:
> >>> Make use of reset_control_array_*() set of APIs to manage
> >>> an array of reset controllers available with the device.
> >> Before we apply this patch, I need to check to see if the order of the
> >> resets managed by the PMC driver matter. Today the order of the resets
> >> is determined by the order they appear in the DT node and although the
> >> new APIs work in the same way they do not guarantee this. So let me
> >> check to see if we can any concerns about ordering here. Otherwise would
> >> be nice to use these APIs.
> > 
> > Right, that will be perfect.
> 
> So I don't see any restrictions here and so I think this change is fine.

Thank you for checking.

> BTW, for the DT case, is there any reason why we don't just say the
> order will be determine by the order the resets are list in the DT node?

I'd rather not make any promises, so I don't have to care about keeping
them. This makes it easier to think about and allows for more freedom in
changing the core code if needed.

What if in the future there is a use case for enabling a bunch of resets
by flipping a number of bits in a single register at the same time? Or
if people accidentally depend on the ordering when in reality there is a
small delay necessary between assertions that just happens to be hidden
by the framework overhead?

If there is a use case for an array of reset controls that must be
(de)asserted in a fixed order and doesn't need any delay between the
steps and is not suitable to be described by named resets for some
reason, we can discuss this. Until then, I'm happy that tegra pmc can
handle arrays without any particular ordering.

regards
Philipp


--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
