From: Andy Shevchenko <andriy.shevchenko-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [PATCH 00/12] dma: various minor clean ups for slave drivers
Date: Wed, 10 Jul 2013 10:54:34 +0300
Message-ID: <1373442874.24799.215.camel@smile>
References: <1369656882-25241-1-git-send-email-andriy.shevchenko@linux.intel.com>
	 <20130530174727.GE3767@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130530174727.GE3767-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: Andy Shevchenko <andriy.shevchenko-b5Z7lJ3WibVrdx17CPfAsdBPR1lH4CV8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Dan Williams <djbw-b10kYP2dOMg@public.gmane.org>, Li Yang <leoli-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Zhang Wei <zw-aYo+Mbtxn2uXDw4h08c5KA@public.gmane.org>, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, 2013-05-30 at 23:17 +0530, Vinod Koul wrote: 
> On Mon, May 27, 2013 at 03:14:30PM +0300, Andy Shevchenko wrote:
> > Here is a set of small independent patches that clean up or fix minor things
> > across DMA slave drivers.
> The series looks fine. I am going to wait a day more and apply, pls speak up if
> you disagree and ack if you agree

Kindly remind about this series.

> 
> --
> ~Vinod
> > 
> > Andy Shevchenko (12):
> >   imx-sdma: remove useless variable
> >   mxs-dma: remove useless variable
> >   edma: no need to assign residue to 0 explicitly
> >   ep93xx_dma: remove useless use of lock
> >   fsldma: remove useless use of lock
> >   mmp_pdma: remove useless use of lock
> >   mpc512x_dma: remove useless use of lock
> >   pch_dma: remove useless use of lock
> >   tegra20-apb-dma: remove useless use of lock
> >   ipu_idmac: re-use dma_cookie_status()
> >   mmp_tdma: set cookies as well when asked for tx status
> >   txx9dmac: return DMA_SUCCESS immediately from device_tx_status()
> > 
> >  drivers/dma/edma.c            |  2 --
> >  drivers/dma/ep93xx_dma.c      | 10 +---------
> >  drivers/dma/fsldma.c          | 10 +---------
> >  drivers/dma/imx-sdma.c        |  9 +++------
> >  drivers/dma/ipu/ipu_idmac.c   |  5 +----
> >  drivers/dma/mmp_pdma.c        | 10 +---------
> >  drivers/dma/mmp_tdma.c        |  3 ++-
> >  drivers/dma/mpc512x_dma.c     | 10 +---------
> >  drivers/dma/mxs-dma.c         |  4 +---
> >  drivers/dma/pch_dma.c         |  9 +--------
> >  drivers/dma/tegra20-apb-dma.c |  8 +++-----
> >  drivers/dma/txx9dmac.c        | 13 ++++++-------
> >  12 files changed, 21 insertions(+), 72 deletions(-)
> > 
> > -- 
> > 1.8.2.rc0.22.gb3600c3
> > 
> 

-- 
Andy Shevchenko <andriy.shevchenko-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Intel Finland Oy
