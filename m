From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC] tegra: dpaux: pinctrl proposal
Date: Tue, 19 May 2015 16:46:55 +0200
Message-ID: <20150519144654.GG26748@ulmo.nvidia.com>
References: <1431963229-12867-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Cgrdyab2wu3Akvjd"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1431963229-12867-1-git-send-email-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--Cgrdyab2wu3Akvjd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 18, 2015 at 04:33:49PM +0100, Jon Hunter wrote:
> Background:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> On tegra124 and tegra132 devices the pads used by the Display Port Auxili=
ary
> (DPAUX) channel are multiplexed such that they can also be used by one of=
 the
> internal i2c controllers. Note that this is different from i2c-over-AUX
> supported by the DPAUX controller. The register that configures these pad=
s is
> part of the DPAUX controllers register set and so requires the clock for =
the
> DPAUX controller to be enabled to access the register as well as keeping =
the
> SOR (serial output resource) power domain enabled.
>=20
> Currently, there is no pinctrl device for these pads and so cannot be eas=
ily
> mapped to function as an i2c interface. Furthermore, when using the pads =
for
> the DPAUX channel, the DPAUX driver (drivers/gpu/drm/tegra/dpaux.c) direc=
tly
> writes the to appropriate register to setup the pads.
>=20
> There are some products based upon the tegra132 that use these pads for an
> internal i2c controller and hence we want to support this configuration i=
n the
> kernel.

Good timing, I was going to (reluctantly) add this to my long TODO list.
I generally like the proposal.

> Proposal:
> =3D=3D=3D=3D=3D=3D=3D=3D
> Add a DPAUX MFD device that consists of a DPAUX controller, for the Displ=
ay
> Port Auxiliary related functionality and a DPAUX pad controller, for hand=
ling
> the pinctrl for the DPAUX pads. Both the DPAUX controller and DPAUX pad
> controller need to access the DPAUX register set and therefore, by making=
 the
> MFD compatible with "simple-mfd" and "syscon", a regmap for the DPAUX reg=
isters
> will be created to synchronise register accesses made by the drivers.

Can we not do without an MFD here? Not only would it break DT ABI, but
it's also way more complicated than it needs to be in my opinion, we're
only sharing a single register (or perhaps even two) after all. Keeping
everything in a single DT node would also make the binding less awkward
because the power domain doesn't apply to the pad controller part of
DPAUX.

Can't the dpaux driver simply register the pinmux controller itself?

Thierry

--Cgrdyab2wu3Akvjd
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJVW0zbAAoJEN0jrNd/PrOh9nsP/iOfL7JooK/ps13dXbMI65Ts
TiQ8zNDMQCtK4qXI+CImlWavSnVQQjYvJnXjgJLk3qmk6+iikJb8JliJdfgzt7DE
obnP6zbnehA347NWkvhsk6QBEUDlAQ6AjuAU+pBxOTpW7YnBE2MqjnnTzENaAGfz
pKYMR79vB/V6iEisooZd1gobzjbwdAAYbvY7vKrlnOow4Uc95cOEWwSBC/tsmZFy
EC5gwS9z2R3qDLi7wzaj18WtXg7qBwJV5ArOc9+jUohWhT5JuFVexNyNFh4Pout6
vDpSPrHRM9XKnVxE+5HLcGOSTzrime+lni0IUtgMidFNqd1AfiJYeVRxEvOJpodU
nOhLi64/g/fv0/T3eaU6rxVI902BsrTz2cNNEeLHSZZppHFZ9x7IY408Cp4GR74p
lhY7hJzHd3npG9siKG7Unok5uc4EYjzHLbO5ljDhILMGvzYA/oOzpSYR6P/6zGiA
Jbfu5z3YdWxPP+x0Xfsoku8dE1yIZknKWlbRCj4qB6Jyr/WPV5ZRXn0WcbpePgoS
YHbfmp/smQpYyiBcHDhCIERTpK11zR2l7KYFRWQD46U0GEMZzavlD6dqJlkgWuAq
+J14JxXXSwEa8xcNT0y/iTDU2u54Ffx1nBz2yn6zga/r6b8uJ6HtHLPEEp4IY9vH
MRCRO/O4r0CA93WL2eF0
=hrwi
-----END PGP SIGNATURE-----

--Cgrdyab2wu3Akvjd--
