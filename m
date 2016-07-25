From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC 3/6] dt/bindings: Add bindings for Tegra20/30 NOR bus driver
Date: Mon, 25 Jul 2016 14:10:45 +0200
Message-ID: <20160725121045.GG21170@ulmo.ba.sec>
References: <1468935397-11926-1-git-send-email-mirza.krak@gmail.com>
 <1468935397-11926-4-git-send-email-mirza.krak@gmail.com>
 <434561ec-510e-a3bf-c7b6-c961db299bd6@nvidia.com>
 <CALw8SCU0cz6mbO=oudCZ4-=2PHVORNt3gwmg2bzNjyhJFnWS3g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="xs+9IvWevLaxKUtW"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CALw8SCU0cz6mbO=oudCZ4-=2PHVORNt3gwmg2bzNjyhJFnWS3g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mirza Krak <mirza.krak-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--xs+9IvWevLaxKUtW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 21, 2016 at 10:10:49PM +0200, Mirza Krak wrote:
> 2016-07-21 11:56 GMT+02:00 Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>:
> >> +
> >> +The NOR controller supports a number of memory types, including synch=
ronous NOR,
> >> +asynchronous NOR, and other flash memories with similar interfaces, s=
uch as
> >> +MuxOneNAND. One could also connect high speed devices like FPGAs, DSP=
s,
> >> +CAN chips, Wi-Fi chips etc.
> >
> > Nit-pick ... the Tegra documentation refers to this controller as the
> > GMI (general memory interface) or SNOR (sync-NOR) controller because it
> > is not just limited to NOR as you mentioned. I see references to GMI in
> > the Tegra pinctrl driver and so may be we should use this name.
>=20
> ACK.
>=20
>=20
> >> +Required properties:
> >> +
> >> + - compatible: should be "nvidia,tegra20-nor", "nvidia,tegra30-nor"
> >
> > I see at least one difference at the register level between Tegra20 and
> > Tegra30 and so I think this should be something like ...
> >
> >  - compatible : Should contain one of the following:
> >         For Tegra20 must contain "nvidia,tegra20-gmi".
> >         For Tegra30 must contain "nvidia,tegra30-gmi".
>=20
> ACK. Just curious, which register was it? I only checked that they
> have the same count of registers.
>=20
> >> + - nvidia,config: This property represents the SNOR_CONFIG_0 register.
> >
> > There is also a SNOR_MIO_CONFIG for the MIO address space and so I think
> > that this should be nvidia,snor-config to be explicit. It might be nice
> > to also add a "nvidia,mio-config" while you are at it as well, however,
> > that could always be done later. If you do, then the
> > "nvidia,snor-config" becomes optional depending on whether you are using
> > the SNOR or MIO address space.
>=20
> ACK the nvidia,snor-config part, will though wait for further comments
> regarding what to do with the config registers, break-out or keep it
> is a one property / register.
>=20
> Regarding mio-config, not sure about if I would like to include that
> part in this stage. If you feel strongly about this we can do it. If
> it only comes to down to replicate the same configurations that we do
> for SNOR to MIO then I do not see much of a problem, but would like
> SNOR to be accepted and would not like the MIO part to halt this. But
> then again this up to you guys.

What's the difference between SNOR and MIO? Sorry if I'm being dense but
a quick look around the internet didn't yield anything related. I'd be
happy to read up if somebody can provide a link.

> > I wonder if it is worth mentioning that the chip-select specified in the
> > "nvidia,config" prop should match that in the "ranges" prop unless you
> > have some external decoding logic to provide an external chip-select.
> > Which raises a question, what does the chip-select in the ranges
> > actually represent? I am not sure if there is a common practice here for
> > device tree when boards have external logic to provide additional
> > chip-selects. I am sure this is quite common.
>=20
> I do not understand why CS pin setting in nvidia,config need to match
> the "ranges" prop? Other then maybe cosmetics.
>=20
> If we do not have any external decoding logic to create more
> chip-selects we only have ONE chip-select, and that one should always
> be indexed as 0? Regardless of which CS pin is used. Because
> ultimately what we configure in SNOR_CONFIG is which PIN(function) to
> use as chip-select. The address space remains the same.

Is that really so? Looking at the list of pins there are 8 CS outputs
=66rom the GMI controller. That and the presence of the SNOR_SEL field in
the SNOR_CONFIG_0 register indicate to me that you can use software to
assert any of the CS outputs (though only one at the same time, which
makes sense since you want to avoid writing to multiple chips at once).

Of course the documentation is to blame here, it doesn't go into any
detail at all about how to use the GMI controller.

Thierry

--xs+9IvWevLaxKUtW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXlgHDAAoJEN0jrNd/PrOhI38P/ifxFgrt222EXA6DucwYQCY3
OezwQw8bSMXDls+WC/FDRZuwgCKxeM6maEHWmkKWIuGzdt3W4mxCOAIkhF3x5AMK
mFyU6GRYLEjrztP2vP4s+GW/3XPx0Mcz3tF4Q865G7ghTuz0lx0t4m1Kg3VAi1ha
bzJNFk7q9JLR76i51BC0+zy6ekfnfwt6smOCh8xATbuqU/M/HMrmGD4exQlHiAMQ
8kZmuQhy339Qy8wEhDaOhrrr9aMjAIhu7P7s94ayV9IsSoe2UOujNRHTTFNTOWZY
yiPT3fpuDR/MiVvvhkDqPGcD5VG/wNfI9KnwlFiZD+RfsNm5pwkdium8yVgffOPu
jpIie62khANjA5Bxd+voXNNjjCYVUbqGrFrmlQ0wEK1+l39Ni/uHLZmazFTrEC33
bxAiLomB1cu+jGqXsp/qvXfrH2vRAEZQp7w94+wqTAlxu0mYDvlWfeHC9bplX6EI
8cuNXSHbglpoktmF8etyzyPhKTQsKpKYLuwqDpzWs3iWptmO+t36Pyy1A6PiEFgw
Jm1ksTiuiW6Hf6tPVjsPfYiNrX6X9afcE4cND6fess+xcaNK2vda2wSSI2aYQm8N
X1OByw/Rg10mm3Hj4rw2IwZrOWkyjVGclJASb8wOBfIDWlOb4evRsYCcnSCWs3/O
vmnUwD5PfLs2f32eJEKc
=HN5s
-----END PGP SIGNATURE-----

--xs+9IvWevLaxKUtW--
