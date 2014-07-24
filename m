From: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v3] platform: Make platform_bus device a platform device
Date: Thu, 24 Jul 2014 18:12:52 +0100
Message-ID: <1406221972.25343.184.camel@hornet>
References: <20140722173713.GA8959@kroah.com>
	 <1406051719-17354-1-git-send-email-pawel.moll@arm.com>
	 <1406052069.25343.93.camel@hornet> <20140722181505.GA9898@kroah.com>
	 <1406135762.25343.151.camel@hornet> <20140723193434.GA31983@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140723193434.GA31983-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Catalin Marinas <Catalin.Marinas-5wv7dgnIgG8@public.gmane.org>, "paul-DWxLp4Yu+b8AvxtiuMwx3w@public.gmane.org" <paul-DWxLp4Yu+b8AvxtiuMwx3w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, 2014-07-23 at 20:34 +0100, Greg Kroah-Hartman wrote:
> > > > > diff --git a/drivers/scsi/hosts.c b/drivers/scsi/hosts.c
> > > > > index 3cbb57a..c14c36f 100644
> > > > > --- a/drivers/scsi/hosts.c
> > > > > +++ b/drivers/scsi/hosts.c
> > > > > @@ -218,7 +218,7 @@ int scsi_add_host_with_dma(struct Scsi_Host *shost, struct device *dev,
> > > > >                 goto fail;
> > > > > 
> > > > >         if (!shost->shost_gendev.parent)
> > > > > -               shost->shost_gendev.parent = dev ? dev : &platform_bus;
> > > > > +               shost->shost_gendev.parent = dev ? dev : &platform_bus.dev;
> > > > >         if (!dma_dev)
> > > > >                 dma_dev = shost->shost_gendev.parent;
> > > > > 
> > > > 
> > > > shost_gendev is a generic (as in struct device, non-platform one)
> > > > device, that is being explicitly placed in the hierarchy.
> > > 
> > > Then make it a virtual device, as that's what it is, replace this with
> > > NULL.
> > 
> > Makes sense to me, I just wonder what the author meant.
> 
> With scsi code, who knows :)

Looking at this further, it seems that the main purpose here is to make
sure that dma_dev is not NULL...

So it's not just simply a case of s/&platform_bus/NULL/ - maybe the
function should fail when !dma_dev? I'll split the patch so each case is
separate and post them to relevant maintainers.

Pawel
