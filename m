From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH 2/2] arm/tegra: Delete irq_to_gpio
Date: Mon, 8 Aug 2011 07:26:00 -0700
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF049F172168@HQMAIL01.nvidia.com>
References: <1312582534-10871-1-git-send-email-swarren@nvidia.com>
 <1312582534-10871-2-git-send-email-swarren@nvidia.com>
 <20110806174519.GB31966@ponder.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20110806174519.GB31966-e0URQFbLeQY2iJbIjFUEsiwD8/FfD2ys@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Grant Likely wrote at Saturday, August 06, 2011 11:45 AM:
> On Fri, Aug 05, 2011 at 04:15:34PM -0600, Stephen Warren wrote:
> > irq_to_gpio is deprecated and in the process of being removed. Make that
> > happen now for ARM Tegra.
> >
> > Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> Applied both.  Thanks.

Didn't you want an Ack by a Tegra maintainer first?

I assume they were both applied to gpio-next (although a fresh fetch  of that
doesn't show the commits)

> > I assume this will go into one of arm-soc.git's branches, but it depends
> > on the previous patch in this series to compile. Arnd, I see you already
> > have Grant's gpio/next tree in your repo as depends/gpio, so I assume
> > you'll just pick up and merge the latest version of Grant's tree before
> > applying this patch?
> >
> > Both patches compiled with a number of Tegra boards enable and tested on
> > Harmony. All without Device Tree support.
> >
> >  arch/arm/mach-tegra/include/mach/gpio.h |    8 --------
> >  1 files changed, 0 insertions(+), 8 deletions(-)

-- 
nvpublic
