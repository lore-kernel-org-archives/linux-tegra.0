From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 4/9] of/irq: Introduce of_irq_get()
Date: Tue, 17 Sep 2013 15:28:35 +0200
Message-ID: <20130917132834.GC6757@ulmo>
References: <1379320326-13241-1-git-send-email-treding@nvidia.com>
 <1379320326-13241-5-git-send-email-treding@nvidia.com>
 <5237771F.1060908@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="tqI+Z3u+9OQ7kwn0"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5237771F.1060908-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--tqI+Z3u+9OQ7kwn0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 16, 2013 at 04:24:47PM -0500, Rob Herring wrote:
> On 09/16/2013 03:32 AM, Thierry Reding wrote:
> > This is a version of irq_of_parse_and_map() that propagates the precise
> > error code instead of returning 0 for all errors. It will be used in
> > subsequent patches to allow further propagation of error codes.
> >=20
> > To avoid code duplication, implement irq_of_parse_and_map() as a wrapper
> > around the new of_irq_get().
>=20
> *_get typically also implies some reference counting which I don't
> believe this does. I don't think having 2 functions with completely
> different names doing the same thing with only a different calling
> convention is good either. So I would keep the old name and the names
> aligned.

Okay, I'll make the new function __irq_of_parse_and_map().

> >  unsigned int irq_of_parse_and_map(struct device_node *dev, int index)
> >  {
> > -	struct of_irq oirq;
> > +	unsigned int virq;
> > =20
> > -	if (of_irq_map_one(dev, index, &oirq))
> > +	if (of_irq_get(dev, index, &virq))
> >  		return 0;
> > =20
> > -	return irq_create_of_mapping(oirq.controller, oirq.specifier,
> > -				     oirq.size);
> > +	return virq;
>=20
> This can be an inline and written more concisely:
>=20
> {
> 	unsigned int virq;
> 	return (of_irq_get(dev, index, &virq) < 0) ? 0 : virq;
> }

I find code such as the above very hard to read. But if you insist I can
move the function into include/of/of_irq.h and make it static inline
with the implementation above.

Thierry

--tqI+Z3u+9OQ7kwn0
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iQIcBAEBAgAGBQJSOFkCAAoJEN0jrNd/PrOhkIAP/Anrr5d0VlOE+xZmwhAET+e8
Ctfb3Tm0NJPbKxjX9MvSVNZ3WlhBbbwXVdK7FDaOleDIszL+tefUw2jBb5NVGE7y
ZpeMaq2HWZuTgAd6Tdfz9PEmTosGqZMKecg1+MxGsAnvLHapWLOajUNcBbQOAAtS
qgsllbHzmQ0zS8/wH+c9NbGTC4z7AKruWo49CEuyd95t1l2qzPp4CgQ8ZKnWzROo
I+qP7P3xVSM4nj33IOml+kF60R8vZZYFBQvRGeCbgiLmS3CKqA9e0njuP4dzs2XJ
D2Ii0tjZSDtozeAdavZTF4VnwzjedAsSimuAW3FHrJVGuKPLYFTRcLHV7X9uz+ob
YJSicMfgS0+49tAq/lLhnYP58jX5XlEhzqkGIcPihooVd5NAsREOl9Go6RxYStSP
s4S2IQwcPducd09msXQczPMru0DC+0QczFZ9G79fc+N5FdFEwq9rQkZD/o9J3Xwk
ufo1izoEofAHU5bq8BkSk94r7js01rrAG7KIQQ+QKlm8sDuvWAs+sdK42z7grrHf
up1wp+qUnR31dIiuVhnBj6UVpJth9uQaRFXvdC+VGK2Uutf7qMRyiLu+HzK4FZgJ
23Q5GRiuqLJ9BT13pu6bWANAJmkxXRRv3hAqTmf/HC6KYUsRY+7We0CdzUYCO2F7
AsHkDeGTJa5EvD7zNrFH
=qJ1y
-----END PGP SIGNATURE-----

--tqI+Z3u+9OQ7kwn0--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
