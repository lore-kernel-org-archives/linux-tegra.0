From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] arm/tegra: convert tegra20 to GIC devicetree binding
Date: Fri, 18 Nov 2011 14:03:09 +0200
Message-ID: <20111118120309.GY19069@tbergstrom-lnx.Nvidia.com>
References: <1321542430-17971-1-git-send-email-pdeschrijver@nvidia.com>
 <74CDBE0F657A3D45AFBB94109FB122FF1740D74C1E@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF1740D74C1E-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, Nov 17, 2011 at 07:51:35PM +0100, Stephen Warren wrote:
> Peter De Schrijver wrote at Thursday, November 17, 2011 8:07 AM:
> > Convert tegra20 IRQ intialization to the GIC devicetree binding. Modify the
> > interrupt definitions in the dts files according to
> > Documentation/devicetree/bindings/arm/gic.txt
> > 
> > Signed-off-by: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> tegra-harmony.dts contains an interrupts property that wasn't updated,
> for the WM8903 codec.
> 
> board-dt.c contains logic to search for a node with compatible of
> nvidia,tegra20-gic, and then call irq_domain_add_simple. I assume that
> logic is replaced by the new common GIC code, and so should be removed
> from board-dt.c entirely?
> 
> >  	serial@70006000 {
> >  		compatible = "nvidia,tegra20-uart";
> > -		reg = <0x70006000 0x40>;
> > +		reg = <0x70006000 0x040>;
> 
> Here and a few other places, why change the reg property?

Oops. That was probably an overly agressive search and replace :)

Cheers,

Peter.
