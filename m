From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V2 3/8] phy: tegra: xusb: Add support for UTMI pad power
 control
Date: Tue, 28 Apr 2020 12:04:51 +0200
Message-ID: <20200428100451.GC3592148@ulmo>
References: <1586939108-10075-1-git-send-email-nkristam@nvidia.com>
 <1586939108-10075-4-git-send-email-nkristam@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="xo44VMWPx7vlQ2+2"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1586939108-10075-4-git-send-email-nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nagarjuna Kristam <nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--xo44VMWPx7vlQ2+2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 15, 2020 at 01:55:03PM +0530, Nagarjuna Kristam wrote:
> Add support for UTMI pad power on and off API's via soc ops. These API
> can be used by operations like charger detect to power on and off UTMI
> pad if needed. Update powered_on flag in the pad power control API's.
>=20
> Signed-off-by: Nagarjuna Kristam <nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> V2:
>  - Patch re-based.
> ---
>  drivers/phy/tegra/xusb-tegra186.c | 51 ++++++++++++++++++---------------=
------
>  drivers/phy/tegra/xusb.h          |  2 ++
>  2 files changed, 26 insertions(+), 27 deletions(-)

Can we not simply pass another reference to the UTMI PHY to the charger
detect code so that we can avoid this custom API?

Thierry

--xo44VMWPx7vlQ2+2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl6n/8MACgkQ3SOs138+
s6FYKRAAqpXiamm0RvGR2izSuYbKEcEOvzxc1iQ6OjqGlTkQY8qiW0sUQob8c54J
2+weCIjkd6HhULC4XGi6qdP1MgNBXQiniGmsj1+9cRING/Qg2Ad3sd6mOCfjBmYw
rkd0erSue+hecchK9PlIdEQc1HRhFMRTKAWAPfFyXjE4y0gUKnTyFYmHmYYd3aJs
FlNE6tOnNBvGkTndMyYX/ikByJECinH0dyonLcGrrCuGDhVF+qu8YZRJNCAFQ/H8
HJn2zp3qm4BNs89UF05rs/OB6V7jGk3eAV34YBWw7aMt4TjC8l/AB05m6YAs19yB
T+wcqzTHFpUm86zcAM5jDBwRGou9C6Gr7CQUDiEVBMo7P0wRlHoj7dQ5CCA9iO17
ELSvO7svvJaNqqumcB1bOTsD2Oy/XNIeCnoA/PCO2ZmuDjSr2p8onshOpoZbyFvg
IW8pzi/9QkPcnA1WproUoXOfmUuiTui83/6nv1k167OjyfD2RcjHxxsflEbfn9zP
u/Hk31VMscbKS4oA+QE5b1OkGYzLGD/YxwuOtnLwMhcEInMEqJrS9SKua6Zyn4jL
HNKPNcd7sxPbccbWG0+YQhWGTVMdfqppSilUJNQK7jtYsr/2tikA0/zYOoiWVof9
biMSeF+0rVjSd9UBsbx12onY7p9wUM8EWoAePAB/A1ScEEKWl/I=
=27Yf
-----END PGP SIGNATURE-----

--xo44VMWPx7vlQ2+2--
