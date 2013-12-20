From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 05/10] ARM: tegra: Add Tegra114 DSI support
Date: Fri, 20 Dec 2013 12:54:26 +0100
Message-ID: <20131220115426.GO27787@ulmo.nvidia.com>
References: <1387468774-14216-1-git-send-email-treding@nvidia.com>
 <1387468774-14216-6-git-send-email-treding@nvidia.com>
 <52B34FC2.5010409@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="lCFQJunhLz1tFGpX"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <52B34FC2.5010409-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--lCFQJunhLz1tFGpX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 19, 2013 at 12:57:54PM -0700, Stephen Warren wrote:
> On 12/19/2013 08:59 AM, Thierry Reding wrote:
> > Add device tree nodes for the DSI controllers found on Tegra114 SoCs.
>=20
> > diff --git a/arch/arm/boot/dts/tegra114.dtsi b/arch/arm/boot/dts/tegra1=
14.dtsi
>=20
> > +		dsi@54300000 {
> > +			compatible =3D "nvidia,tegra114-dsi";
> > +			reg =3D <0x54300000 0x00040000>;
> > +			clocks =3D <&tegra_car TEGRA114_CLK_DSIA>,
> > +				 <&tegra_car TEGRA114_CLK_DSIALP>,
> > +				 <&tegra_car TEGRA114_CLK_PLL_D_OUT0>;
> > +			clock-names =3D "dsi", "lp", "parent";
>=20
> The binding document
> Documentation/devicetree/bindings/gpu/nvidia,tegra20-host1x.txt doesn't
> mention an "lp" clock:
>=20
>   - clock-names: Must include the following entries:
>     - dsi
>       This MUST be the first entry.
>     - parent
>=20
> I assume this is simply an oversight, since this is an obvious extension
> of the binding, and that the DT binding will be updated to include that
> clock in the list, and hence won't block applying the series because of
> this.

Yes, that was merely an oversight. I've updated the DT binding to
include the lp clock.

Thanks,
Thierry

--lCFQJunhLz1tFGpX
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJStC/xAAoJEN0jrNd/PrOh0o8P+QG+5qoR1PlNznQH+8+epGvQ
SCF3Fi6uzSUEE7aIzmljPVA+yJTCQCQEQDvp+B8aEOCXI0gZVuD2Ys3MfinIOX8H
N35kqc3ep8QJMe/t2h0nRQzsnhF7qZ+gKOlfkzKIhJqyPr2r9WLjRC9qW3Z/jCxz
dfV4kHBD1jQdcHvXVYQvo3jpRHOnTVvRUwxQ4Dn3D/4cXZUuyCJAkHmSR2BTji/v
RRWD8tNyMM5epkvYgLsALE0iaU26cDGE6/VcJfrkEGNFKXSAm46KuSy1suLHGrN9
6kyY2un5FU8+8q241wfZmWdi8M7NZccDKJuNzb7cO4hmtDhb8RpOxyrmCllM602l
x+8cMCNEgDXBqLSsAFjA9T3pNAANFUYWCifoGWnlnzgn3XA+ydGtqZ72XIt55UR4
I6oQbZwvSY/BIJR/G+GaQOqIOFilIvGYV/hct84fqWIufv7dt83rBbdb6a1klBhq
MpiPVZKgQlHMWkmL+HQbe0trHihDleOZxSbUCuW1XUBPA1hHiD7q92NHh4iUH/ff
GwGfYCMnE1O67/GfgNoBkVY9+TFBWVIZXrWPItfJR0AeY95zdp8vv9qV6ctU5Nrh
G6ulyVt1RFg01PqkEaXU8AUkdHgvIUdlN+ndH5RPxRKydm78t8NNq9LceQHj+i6h
JYJ8+kPUg1kkovkAmToN
=qL6V
-----END PGP SIGNATURE-----

--lCFQJunhLz1tFGpX--
