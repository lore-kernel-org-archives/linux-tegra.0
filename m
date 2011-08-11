From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH V4] ARM: tegra: paz00: add clocks required for usb
 operation
Date: Thu, 11 Aug 2011 05:49:21 -0700
Message-ID: <20110811124921.GA4664@quad.lixom.net>
References: <201108101921.58149.marc.dietrich@ap.physik.uni-giessen.de>
 <74CDBE0F657A3D45AFBB94109FB122FF04A068758D@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF04A068758D-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Marc Dietrich <Marc.Dietrich-wkdnK3oF/XPYtB+G+YtuwQgYPMzSbZxj@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, Aug 10, 2011 at 01:39:58PM -0700, Stephen Warren wrote:
> Marc Dietrich wrote at Wednesday, August 10, 2011 11:22 AM:
> > These clocks are required for usb operation. pll_p_out4 needs to be set
> > to 24 MHz. The other clocks default to "off" in order to save some energy.
> > 
> > Signed-off-by: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
> 
> Acked-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> Given the rest of the thread, this is fine for now. We can address any
> deficiencies in the bus clock and clk_m parenting when it's addressed
> globally for all boards later.

Agreed; I don't have good access to hardware while on vacation, so I won't
be able to test and post the clock change patches until towards the end of next
week.

I've applied and pushed this patch out to boards-for-3.2 meanwhile.


-Olof
