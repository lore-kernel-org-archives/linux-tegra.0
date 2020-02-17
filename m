From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Patch V5 11/21] usb: gadget: tegra-xudc: use phy_set_mode to
 set/unset device mode
Date: Mon, 17 Feb 2020 09:40:41 +0100
Message-ID: <20200217084041.GH1339021@ulmo>
References: <1581322307-11140-1-git-send-email-nkristam@nvidia.com>
 <1581322307-11140-12-git-send-email-nkristam@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="uJrvpPjGB3z5kYrA"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1581322307-11140-12-git-send-email-nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nagarjuna Kristam <nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--uJrvpPjGB3z5kYrA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 10, 2020 at 01:41:37PM +0530, Nagarjuna Kristam wrote:
> When device mode is set/uset, VBUS override activity is done via
> exported functions from padctl driver. Use phy_set_mode() instead.
>=20
> Signed-off-by: Nagarjuna Kristam <nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> V5:
>  - No changes.
> ---
> V4:
>  - Updated commit message as per comments from Thierry.
> ---
> V2-V3:
>  - No changes in this version
> ---
>  drivers/usb/gadget/udc/tegra-xudc.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)

Acked-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

--uJrvpPjGB3z5kYrA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl5KUYkACgkQ3SOs138+
s6H/sBAAg6AIq68tpGRjr+GzL0QiaW7lEnUDT60VSUtVvSIndYMVDmHMbfNzo3oz
c7LP+xipIG/cM3hlnTsCMZWLQOJfo5eKKpW4jW2RjVBlkv15XX93FD+mL+ro4G5s
x6HnqM9AyNz9dkfmJA0mXfz9DkDfkTlsGASLvXoIrtpfGIUgINlyuTzPRypyfmti
SNZQYZe1x69rCBby53zWG3KE8NvV32lseI6avplpck0QnXGhHh3zIIRnHtniOcmv
NlejZbfDByQIub9UAAHoarnt/yOG/tzh/GfQxTcHKky8YU8IuZOJt0JlxfwhNkgH
UJI/INy2b2FuYsJ8DGclTmsIbakuu/k+vwjBHjRpv60B8Kr/thDCocdeieACs4Hu
Ut7Z0yds6Eg9wZb5xpZdPiFud7y9tz90jTVbsh8YOTRGrEWftFUyj66UKCvdWmCO
YUKrap8aR76VfMiqFwi/QC91Bttqhbu7dU6dscMxTs53ztyufhGFTqqZeffP5oRg
EbQv9SFdVTIyuqGkcGL9WQFUv5bsBWZDZhLOq52iq6u3iJO+nVA+/pURNc8g3rWb
lJjF8DGh+cRNrid9nnVtFxGW+1Z2dg3ca60pdp6KmVfYjK+yetV3TKuS/cxYzoma
+rzCC/9EdkSbmfAtY6KsWQov/yafgd6Eq2cX7F54uzJWb3Jibxw=
=MyRo
-----END PGP SIGNATURE-----

--uJrvpPjGB3z5kYrA--
