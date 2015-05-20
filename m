From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC] tegra: dpaux: pinctrl proposal
Date: Wed, 20 May 2015 17:40:24 +0200
Message-ID: <20150520154022.GB7734@ulmo.nvidia.com>
References: <1431963229-12867-1-git-send-email-jonathanh@nvidia.com>
 <20150519144654.GG26748@ulmo.nvidia.com>
 <555C901F.8090009@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="8GpibOaaTibBMecb"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <555C901F.8090009-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--8GpibOaaTibBMecb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 20, 2015 at 02:46:07PM +0100, Jon Hunter wrote:
>=20
> On 19/05/15 15:46, Thierry Reding wrote:
> > * PGP Signed by an unknown key
> >=20
> > On Mon, May 18, 2015 at 04:33:49PM +0100, Jon Hunter wrote:
> >> Background:
> >> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >> On tegra124 and tegra132 devices the pads used by the Display Port Aux=
iliary
> >> (DPAUX) channel are multiplexed such that they can also be used by one=
 of the
> >> internal i2c controllers. Note that this is different from i2c-over-AUX
> >> supported by the DPAUX controller. The register that configures these =
pads is
> >> part of the DPAUX controllers register set and so requires the clock f=
or the
> >> DPAUX controller to be enabled to access the register as well as keepi=
ng the
> >> SOR (serial output resource) power domain enabled.
> >>
> >> Currently, there is no pinctrl device for these pads and so cannot be =
easily
> >> mapped to function as an i2c interface. Furthermore, when using the pa=
ds for
> >> the DPAUX channel, the DPAUX driver (drivers/gpu/drm/tegra/dpaux.c) di=
rectly
> >> writes the to appropriate register to setup the pads.
> >>
> >> There are some products based upon the tegra132 that use these pads fo=
r an
> >> internal i2c controller and hence we want to support this configuratio=
n in the
> >> kernel.
> >=20
> > Good timing, I was going to (reluctantly) add this to my long TODO list.
> > I generally like the proposal.
>=20
> Ok, great.
> =20
> >> Proposal:
> >> =3D=3D=3D=3D=3D=3D=3D=3D
> >> Add a DPAUX MFD device that consists of a DPAUX controller, for the Di=
splay
> >> Port Auxiliary related functionality and a DPAUX pad controller, for h=
andling
> >> the pinctrl for the DPAUX pads. Both the DPAUX controller and DPAUX pad
> >> controller need to access the DPAUX register set and therefore, by mak=
ing the
> >> MFD compatible with "simple-mfd" and "syscon", a regmap for the DPAUX =
registers
> >> will be created to synchronise register accesses made by the drivers.
> >=20
> > Can we not do without an MFD here? Not only would it break DT ABI, but
> > it's also way more complicated than it needs to be in my opinion, we're
> > only sharing a single register (or perhaps even two) after all. Keeping
> > everything in a single DT node would also make the binding less awkward
> > because the power domain doesn't apply to the pad controller part of
> > DPAUX.
> >=20
> > Can't the dpaux driver simply register the pinmux controller itself?
>=20
> Do you think something that looks like the below?
>=20
> +Example (tegra124 DPAUX):
> +
> +/ {
> +       ...
> +
> +       host1x {
> +               compatible =3D "nvidia,tegra124-host1x", "simple-bus";
> +               ...
> +
> +               dpaux: dpaux@0,545c0000 {
> +                       compatible =3D "nvidia,tegra124-dpaux",
> +                       reg =3D <0x0 0x545c0000 0x0 0x40000>;
> +                       interrupts =3D <GIC_SPI 159 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks =3D <&tegra_car TEGRA124_CLK_DPAUX>,
> +                                <&tegra_car TEGRA124_CLK_PLL_DP>;
> +                       clock-names =3D "dpaux", "parent";
> +                       resets =3D <&tegra_car 181>;
> +                       reset-names =3D "dpaux";
> +                       pinctrl-0 =3D <&dpaux_state>;
> +                       pinctrl-names =3D "default";
> +                       status =3D "disabled";
> +
> +                       dpaux_padctl@0,545c0124 {
> +                               compatible =3D "nvidia,tegra124-dpaux-pad=
ctl";
> +
> +                               dpaux_state: dpaux_state0 {
> +                                       dpaux {
> +                                               nvidia,function =3D "dpau=
x";
> +                                       };
> +                               };
> +
> +                               i2c_state: i2c_state0 {
> +                                       i2c {
> +                                               nvidia,function =3D "i2c";
> +                                       };
> +                               };
> +                       };

Why even have this subnode? Couldn't we simply have this:

	host1x@... {
		...

		dpaux@... {
			compatible =3D "nvidia,tegra124-dpaux";
			...
			pinctrl-0 =3D <&dpaux_aux_state>;
			pinctrl-1 =3D <&dpaux_i2c_state>;
			pinctrl-names =3D "aux", "i2c";
			...

			dpaux_aux_state: pinmux-aux {
				...
			};

			dpaux_i2c_state: pinmux-i2c {
				...
			};
		};
	};

?

We might need to add in indices to tell apart DPAUX and DPAUX1, though
perhaps we could refer to these states by path instead of phandle to
avoid that. Anyway, I don't see any particular reason why a subnode
would be necessary.

Thierry

--8GpibOaaTibBMecb
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJVXKrkAAoJEN0jrNd/PrOhEZIQAKYhuZuGAYz3lLxCuDlELIT7
1O5moIcZziX2rEgKK4B7EQ60tjgg6euGo28Oc33PF47q7/4gJ9GYxJBoI2n0aAQc
OrFfZKskDQFRaA13WF5PJlbPMrqA/ulTL53Saa/1eEiHCQQc+TGegJ7A2OgtFFfM
3L+WW+H1dLoX+kmPN8pJlBcP2wVy12xK/yj/KUdhPuGmlH70z2IwX1QV4gVsYBvb
GLmieDd4OTpSNKQjcelga3+vPq6P1XbUIfxyfM8RVAKXQ2zXHtYP8LNbezGuWF0q
MTrTY0lYWktMO0bDjQRL4PNaQ0x8CHAs0x5IpO4ur4Grlz05yn+Ar/EoFW4/NIcq
X2fLHdhVvK9V3b0Ms2rO1mWpht2Xkhxbkak1DVbkMK+221nhkydDpEQbEgKLBpRv
4aUcwMKGRSvQeCXWnPgAgmMcyZzv1hID39N0QLaGiQ6O1XSG6iMxwvrmRXWArieu
ORuThtRjY+X5J2wVo+5rWtiZ58hLw82PHbgvAKVREIfyqNs7Xip9LGCjy0J5xM7J
M8DQk6XvpNhnnSHVzrbKPETLrgsxbJdZ+FtmSjikZX5d64++vBjx9OvHEc8DXyqC
fr4/Gh6qw7632l3QJTT/QBfIgcGdvbozUv+KjLMVPZOtI5lq/cdE2iKJIzdp43Pj
HFyuMu06fzB7XK+helki
=1Kcj
-----END PGP SIGNATURE-----

--8GpibOaaTibBMecb--
