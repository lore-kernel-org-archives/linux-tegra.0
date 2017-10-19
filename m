From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH v7 3/4] usb: dwc3: of-simple: Add support to get resets
 for the device
Date: Thu, 19 Oct 2017 13:47:26 +0200
Message-ID: <1508413646.7665.8.camel@pengutronix.de>
References: <1500479948-29988-1-git-send-email-p.zabel@pengutronix.de>
         <1500479948-29988-4-git-send-email-p.zabel@pengutronix.de>
         <87y3o7h3zu.fsf@linux.intel.com> <1508409939.7665.7.camel@pengutronix.de>
         <87shefgyqc.fsf@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <87shefgyqc.fsf-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Vivek Gautam <vivek.gautam-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Thu, 2017-10-19 at 14:31 +0300, Felipe Balbi wrote:
> Hi,
> 
> Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> writes:
> > Hi Felipe,
> > 
> > On Thu, 2017-10-19 at 12:38 +0300, Felipe Balbi wrote:
> > > Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> writes:
> > > 
> > > > From: Vivek Gautam <vivek.gautam-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> > > > 
> > > > Add support to get a list of resets available for the device.
> > > > These resets must be kept de-asserted until the device is
> > > > in use.
> > > > 
> > > > Cc: Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> > > > Signed-off-by: Vivek Gautam <vivek.gautam-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> > > > [p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org: switch to hidden reset control array]
> > > > Signed-off-by: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> > > 
> > > now this seems like it depends on patch 1/4, right? Is the reset API
> > > change going on v4.15?
> > 
> > Thank you for the reminder. Patch 1 has made it into v4.14-rc1, commit
> > 17c82e206d2a ("reset: Add APIs to manage array of resets"). The other
> > patches could be picked up for v4.15 without any dependency issues.
> 
> patch 2 applied fine. patch 3 fails to apply hunk 2.
> 
> checking file drivers/usb/dwc3/dwc3-of-simple.c
> Hunk #1 succeeded at 28 (offset -1 lines).
> Hunk #2 FAILED at 98.
> 1 out of 5 hunks FAILED
> 
> 
> Care to rebase on my testing/next?

Thanks, I'll resend patch 3 separately.

regards
Philipp
