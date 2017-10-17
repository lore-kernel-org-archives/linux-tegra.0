From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 1/2] staging: Introduce NVIDIA Tegra20 video decoder
 driver
Date: Tue, 17 Oct 2017 22:24:07 +0200
Message-ID: <20171017202407.GA10482@ulmo>
References: <cover.1507752381.git.digetx@gmail.com>
 <3d432aa2617977a2b0a8621a1fc2f36f751133e1.1507752381.git.digetx@gmail.com>
 <20171017201354.efgjrwvakkseyvr7@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="y0ulUmNC+osPPQO6"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20171017201354.efgjrwvakkseyvr7@rob-hp-laptop>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--y0ulUmNC+osPPQO6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 17, 2017 at 03:13:54PM -0500, Rob Herring wrote:
[...]
> > diff --git a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20=
-vde.txt b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-vde.t=
xt
[...]
> > +- resets : Must contain an entry for each entry in reset-names.
> > +  See ../reset/reset.txt for details.
> > +- reset-names : Must include the following entries:
> > +  - vde
>=20
> -names is pointless when there is only one.

I'd prefer to keep it. In the past we occasionally had to add clocks or
resets to a device tree node where only one had been present (and hence
no -names property) and that caused some awkwardness because verbiage
had to be added to the bindings that clarified that one particular entry
(the original one) always had to come first.

Thierry

--y0ulUmNC+osPPQO6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlnmZt8ACgkQ3SOs138+
s6F7GBAAlryGt57YMC3zYutGNkc9sIbScZ8BauDqsd4DDTt4QGBz0o3IdUY4bvGH
kMlnaiTUIVkFKrxUJxQiH7dqoLytmvhsgvTjB/u0FHIVbpa93CaAIqgbrtC/blw9
mVM1t7FJAGoGENq67Z4t8AU6MEu62lVxhHkCcBkyO8JtPk46gvvOwGVPvSlqAqfy
vsnV3uwkZ12UguHgI+2ruJ58Z1smDdChEjqJjPHZzm3huFiAZARBeIprECA7vUFO
p8rv3MODxWyz9JZDdlvOnYk+PIgtUjbz5Spymx7mYei8xbHongynEIui5mBC/VOi
nWeYpNPT2//zU2RC4HOP0X5Dw4LLC9IjSK1JpnLjJ9fAnIF0df1OleuYK7JM3bxd
/MSElRVCg6aGDc9821bwyNbgoMrOownOROnkPBqyInlO0tAFDaeIrjBuEFHG4WaI
VNnQZFnWO8YN1+PHGTeYpE6AlpcgxcVhVs0QxnaKVx4oEpK8R4LqHooWQEiqmZ5z
6FF0/NzrLCDMh+vqmAkzoc/2Zl/+i3qokIEbw+e4EasHrRIzPZQoWhf+GdpmSwCS
goEBbbr1kw1eeGup8/qoTTjLWlTLTBM7b4V/uvaj/JFv+veP6wbGA6O2sxt7RxPX
K/NajIAHT7NWAVNw/6HBT/2KRVoyQBCTLXIcL2wQxxCjBLDYTME=
=a8IM
-----END PGP SIGNATURE-----

--y0ulUmNC+osPPQO6--
