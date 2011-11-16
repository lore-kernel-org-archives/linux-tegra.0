From: Nicolas Pitre <nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org>
Subject: RE: [PATCH 0/23] mach/vmalloc.h removal, and ioremap optimization
Date: Wed, 16 Nov 2011 18:08:04 -0500 (EST)
Message-ID: <alpine.LFD.2.02.1111161807390.3307@xanadu.home>
References: <1321422521-1138-1-git-send-email-nico@fluxnic.net>
 <74CDBE0F657A3D45AFBB94109FB122FF1740D748BE@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; CHARSET=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <74CDBE0F657A3D45AFBB94109FB122FF1740D748BE-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, 16 Nov 2011, Stephen Warren wrote:

> Nicolas Pitre wrote at Tuesday, November 15, 2011 10:48 PM:
> > This patch series removes all instances of mach/vmalloc.h in order to
> > have a more unified memory map across all ARM architectures. ...
> 
> For Tegra, the series:
> 
> Tested-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> (On Seaboard/Springbank, booted DT, booted non-DT and tested audio, both
> with root filesystem on SD card)

Thanks for testing!


Nicolas
