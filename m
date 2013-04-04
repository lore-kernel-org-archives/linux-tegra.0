From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: CPU idle LP2 breaks MSI on TrimSlice
Date: Thu, 4 Apr 2013 11:16:21 +0300
Message-ID: <20130404081621.GX18519@tbergstrom-lnx.Nvidia.com>
References: <20130403075454.GA25174@avionic-0098.mockup.avionic-design.de>
 <1364976857.16957.56.camel@jlo-ubuntu-64.nvidia.com>
 <20130403084036.GA28417@avionic-0098.mockup.avionic-design.de>
 <1364980234.16957.75.camel@jlo-ubuntu-64.nvidia.com>
 <515C5BC8.3040902@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <515C5BC8.3040902-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, Apr 03, 2013 at 06:41:44PM +0200, Stephen Warren wrote:
> On 04/03/2013 03:10 AM, Joseph Lo wrote:
> > On Wed, 2013-04-03 at 16:40 +0800, Thierry Reding wrote:
> >> On Wed, Apr 03, 2013 at 04:14:17PM +0800, Joseph Lo wrote:
> >>> On Wed, 2013-04-03 at 15:54 +0800, Thierry Reding wrote:
> >>> BTW, you can also check the minimal interval to keep the connection
> >>> alive. For Tegra20, it need at lease 10 mS for CPU cluster power down.
> >>> It means when CPU go into LP2, even there is an interrupt wake up him
> >>> immediately. The CPU need to wait for power ready. It's 10mS. Only
> >>> Tegra20 had this limitation.
> >>
> >> Okay, theoretically we could have something like the following sequence:
> >>
> >>   1) user runs "ifconfig eth0 up"
> >>   2) driver programs network interface to bring up link
> >>   3) driver waits for IRQ
> >>   4) CPU goes to idle
> >>   5) MSI is received
> > 5.5) interrupt delivered to interrupt controller
> >>   6) CPU is woken up by interrupt controller
> >>   7) CPU needs 10 ms before power is ready
> > (The 10mS is the interval for PMIC to make the power of vdd_cpu rail
> > ready.)
> > 8) CPU handle the ISR of MSI or R8169.
> > 
> > I am not sure the time interval cause some functions can't work anymore
> > on MSI or R8169. If this is the case, you may need a work around to
> > trigger interrupt more frequently to make CPU not go into LP2 when PCIe
> > ethernet working.
> > 
> > BTW, the interrupt shouldn't lost, I didn't see this case before. The
> > device interrupt was always routed to CPU0.
> 
> Joseph,
> 
> The legacy interrupt controller steers interrupts to either the A9 CPUs
> or the AVP. Does this legacy controller lose power when the A9 CPUs
> enter LP2? If so, does it need reprogramming when resuming the A9 CPUs
> from LP2?

No, The legacy interrupt controller is part of non-powergateable domain afaik,
so it will only lose its state when we enter LP0. CPUs entering/exiting LP2
should not affect its state.

Cheers,

Peter.
