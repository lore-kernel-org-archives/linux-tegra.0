From: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Subject: Re: [PATCH 1/2] usb: host: tegra: don't touch EMC clock
Date: Wed, 23 Jan 2013 10:45:26 +0100
Message-ID: <1358934326.1540.32.camel@tellur>
References: <1358900903-27654-1-git-send-email-swarren@wwwdotorg.org>
	 <D958900912E20642BCBC71664EFECE3E6E1B13B855@BGMAIL02.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <D958900912E20642BCBC71664EFECE3E6E1B13B855-QZ+emBqkIFBDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Venu Byravarasu <vbyravarasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Venkat Moganty <vmoganty-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Am Mittwoch, den 23.01.2013, 12:25 +0530 schrieb Venu Byravarasu:
> > -----Original Message-----
> > From: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org [mailto:linux-tegra-
> > owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org] On Behalf Of Stephen Warren
> > Sent: Wednesday, January 23, 2013 5:58 AM
> > To: Alan Stern; Greg Kroah-Hartman; Stephen Warren
> > Cc: Venu Byravarasu; linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linux-arm-
> > kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org; linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; Stephen Warren
> > Subject: [PATCH 1/2] usb: host: tegra: don't touch EMC clock
> > 
> > From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > 
> > Clock "emc" is for the External Memory Controller. The USB driver has no
> > business touching this clock directly. Remove the code that does so.
> 
> Stephen,
> This was primarily done to make sure that EMC is set to a minimum
> frequency, below which data errors may occur during USB transfers.
> If we plan to remove this, how should we make sure that the EMC
> is programmed for the required frequency during USB transfers?
>  
You could use something like the API I added in "ARM: tegra: add EMC
clock scaling API". This needs some rework and I looked into integrating
this with the DEVFREQ framework, but I don't think it fits too well.

Bandwidth requirements should always be communicated to the EMC driver
and not described by clock rates.

Regards,
Lucas
