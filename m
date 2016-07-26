From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC 3/6] dt/bindings: Add bindings for Tegra20/30 NOR bus driver
Date: Tue, 26 Jul 2016 10:32:40 +0200
Message-ID: <20160726083240.GA2433@ulmo.ba.sec>
References: <1468935397-11926-1-git-send-email-mirza.krak@gmail.com>
 <1468935397-11926-4-git-send-email-mirza.krak@gmail.com>
 <20160725113034.GD21170@ulmo.ba.sec>
 <CALw8SCWEFVu__8Gyr5q995h+=oMQEz1VUNB=Ne7MRb0O-tZXqg@mail.gmail.com>
 <20160725141544.GN21170@ulmo.ba.sec>
 <CALw8SCVmVL82kZapEJA97XqQv6XZnR_S6ddsW1Gwk61v4Px9AA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="fdj2RfSjLxBAspz7"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CALw8SCVmVL82kZapEJA97XqQv6XZnR_S6ddsW1Gwk61v4Px9AA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mirza Krak <mirza.krak-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--fdj2RfSjLxBAspz7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 25, 2016 at 09:59:34PM +0200, Mirza Krak wrote:
> 2016-07-25 16:15 GMT+02:00 Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>:
> > On Mon, Jul 25, 2016 at 03:16:28PM +0200, Mirza Krak wrote:
> >> 2016-07-25 13:30 GMT+02:00 Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>:
> >> >
> >> > I would've expected this to require some sort of infrastructure to a=
llow
> >> > devices connected to the GMI controller to acquire the bus via some =
API
> >> > to select their chip.
> >>
> >> Yes, ultimately you would need some sort of infrastructure to allow
> >> devices to acquire the GMI bus if you want to solve this in software.
> >> But at the moment I do not see such an infrastructure in place, and is
> >> it feasible to add one specifically for the GMI controller? If one
> >> such infrastructure was in place we would need to modify all the
> >> drivers that want to use to include Tegra specific infrastructure to
> >> access the GMI bus?
> >>
> >> Since my knowledge is limited it hard for me to comment on this, maybe
> >> there is a simple way of doing this?
> >
> > I don't think there's a simple way to do this. In order to properly
> > implement it we'd need to implement a generic infrastructure for chip
> > selects so that drivers such as the one for your CAN controller can be
> > written without tying them specifically to the Tegra GMI controller.
> >
> > From what you and Jon were saying it sounds like the drivers are
> > completely agnostic of any chip-select, so conversion won't be easy.
> > But technically if these chips take a chip-select as input then it's
> > always possible to hook them up to a controller that doesn't do this
> > automatic translation of address to chip-select, so eventually some
> > setup is bound to come along where they'd need explicit chip-select
> > handling as well.
> >
> > I don't think it's fair to require you to implement this infrastructure
> > if you don't actually need it. At the same time I want to be cautious
> > and make sure we keep the driver and binding flexible enough to allow
> > us to implement explicit chip-selects should we later need them.
> >
> > Thierry
>=20
> One thing that should be noted, and that is the GMI controller also
> supports a DMA master mode (feature for the future?).
>=20
> I do not really know how this effects the binding we are discussing
> but wanted to put it out there.

Yes, that had occurred to me as well. I don't really have any good ideas
on how to use that other than to implement it as a DMA engine driver and
have drivers use those, if available.

But I don't think we have to worry about it right now. If we ever need
it, the binding can be extended in a backwards-compatible way.

Thierry

--fdj2RfSjLxBAspz7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXlyAlAAoJEN0jrNd/PrOhe54P/iim3thW4mwzXG/ov1noaSi8
+Eex7c/JT/Fi6mVwKCs2OwvIpnuSFWY4RuRw0iFDypHCkPWshEr+MdcqGFZgf8Bm
wzn1gEma1y6uObWMr6bzO5K0ZwYzwyDE21IraHxN2+amjfUgRv6MO4pjTUagtZ3m
d9wobbepnrn3Nocf8vWNAQPQpchrc7Cxy6zroauZCVHx2xPa1mHPQ6HrL5s8POed
35jvfKPYVgOE9ns8tUKNDJSvpsUP/gXhsSHhELaL/FaExBkS2gjB8NIcqiADpTtO
IUO2LmaE1KJbZmwk2UctBtVmTBAfGQt33vzZH8ywTFUnHyfmnkfDZjGSWoFu+FyE
4wvhUAJQIOWVA29HLCt3fPS+cZNelqzXd8Ikonj3FSkjNrRpSzrsj0WFlMxbunEH
PAqWPSZS3TaPfiBAAIj3e+ufWIOyCDdfjs5BK9fX/ouc3yXbVlqk6CyCUNZs/hhS
Wuc26YOiEyXX+K1z73Uy/Aoe0i4dI+H3lAZTgSQ7k1gVFe4aaEJOOCEk6Io7x3GI
Tzm2dXC6Paq1AE9+hpRqgWOPmuUkClXfp/agpsWTqJnQ5+G9qwYYF6Vlp4eAhh36
bDwJrTgZ/oCmbqkulu553G3A2AWPkMbjsRJ0pU4uOa6+XX3vRMibTuc6ofE61VB9
CzAx3WC3omfwzTPdKlSd
=zq0y
-----END PGP SIGNATURE-----

--fdj2RfSjLxBAspz7--
