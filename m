From: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 2/5] char: tile-srom: Remove reference to platform_bus
Date: Mon, 01 Sep 2014 13:27:40 +0100
Message-ID: <1409574460.4343.7.camel@hornet>
References: <1406298233-27876-1-git-send-email-pawel.moll@arm.com>
	 <1406298233-27876-2-git-send-email-pawel.moll@arm.com>
	 <53DAA605.2030500@tilera.com> <1406913678.22529.46.camel@hornet>
	 <53E139C8.9000502@tilera.com> <1407515691.31897.26.camel@hornet>
	 <5400C9C1.4060904@tilera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5400C9C1.4060904-kv+TWInifGbQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chris Metcalf <cmetcalf-kv+TWInifGbQT0dZR+AlfA@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Catalin Marinas <Catalin.Marinas-5wv7dgnIgG8@public.gmane.org>, "paul-DWxLp4Yu+b8AvxtiuMwx3w@public.gmane.org" <paul-DWxLp4Yu+b8AvxtiuMwx3w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Fri, 2014-08-29 at 19:43 +0100, Chris Metcalf wrote:
> >> Thank you for volunteering to write a bit of code; if that's the b=
est
> >> way to clarify this for us, fantastic, or else pointing us at exis=
ting
> >> good practices or documentation would be great too.
> > [...]
> > @@ -350,7 +351,7 @@ static int srom_setup_minor(struct srom_dev *sr=
om, int index)
> >  		       SROM_PAGE_SIZE_OFF, sizeof(srom->page_size)) < 0)
> >  		return -EIO;
> >
> > -	dev =3D device_create(srom_class, &platform_bus,
> > +	dev =3D device_create(srom_class, srom_parent,
> >  			    MKDEV(srom_major, index), srom, "%d", index);
> >  	return PTR_ERR_OR_ZERO(dev);
> >  }
>=20
> The second argument should be &srom_parent.dev though, I think.  Righ=
t?

Yes, sure - as I said, I haven't really tested this code, sorry!


> If the
> consensus is that this is the way to go, I can certainly take this ch=
ange
> into the Tile tree.

That would be cool, and left us only with the scsi/DMA as the last user
of platform_bus. But this is a completely different story ;-)

Pawe=C5=82
