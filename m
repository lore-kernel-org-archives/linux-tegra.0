From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Patch V3 06/18] phy: tegra: xusb: Add set_mode support for USB
 2 phy on Tegra210
Date: Tue, 28 Jan 2020 18:41:49 +0100
Message-ID: <20200128174149.GD2293590@ulmo>
References: <1577704195-2535-1-git-send-email-nkristam@nvidia.com>
 <1577704195-2535-7-git-send-email-nkristam@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="8w3uRX/HFJGApMzv"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1577704195-2535-7-git-send-email-nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nagarjuna Kristam <nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--8w3uRX/HFJGApMzv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 30, 2019 at 04:39:43PM +0530, Nagarjuna Kristam wrote:
> Add support for set_mode on USB 2 phy. This allow XUSB host/device mode
> drivers to configure the hardware to corresponding modes.
>=20
> Signed-off-by: Nagarjuna Kristam <nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> V2-V3:
>  - No changes in this version
> ---
>  drivers/phy/tegra/xusb-tegra210.c | 126 ++++++++++++++++++++++++++++++--=
------
>  1 file changed, 99 insertions(+), 27 deletions(-)

Acked-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

--8w3uRX/HFJGApMzv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl4wcl0ACgkQ3SOs138+
s6Gzdw//T0TzStcx4Ls9rs7glP6lCDnKHC7MT3T3R3bCcl+5lfRhw57519KSLJ08
tnZN7R5VikD552BdU4rx7Az5Xc2WyMD75FC46BlJaYB5J2+EBep405gs3chsT5c6
a0BLT1tibvdeO1iE2Bkf4EaP3k2Mh4vkZ+mDeHaxMtsYARi80asTTnFZ9S43YUh9
EmVZXguUi+Nc9qbPpCGabyCxzBUDU+uvi2itwVL8pk+STjiLmfV0LAlIxycBmw77
CEaRP7xEy4f9QjibvRs45UmgkVFZybvQoOi3M2Rs3Katzdsl1vgXlQP1yIvhaT6P
r/eUNQSx2Jt1e8FIjDEdK7LPmJvfRV2sqbPTYK1o281dvSi8ip8bQm28WT02fdnz
OvSG/cub4k7mk4XIP3MQliz3pIsT31AUPWCJ3Cx4pU2+Duu65oy2JfKQ2Le0qI+l
oYYS/oO7cxBlVVaFnFPKXWNd8HbRyjbmlMWPTXgXWluxaDqDEDBDy+Q7Eqr/nxOV
1qAEFwFlPve6s6Vz/HW2wiOiaBUS206WsqodwH+ymGD197bwagDpAKy4a4mpNJUS
4Dg7xkVHpLePFMTSRsM2OcJ2y7zEdNajimnwtrcPtTUc4PhG0uijp4Ple52t1moT
WWRSMfNRkUDBrb4V7ftmJg7/HTuCCge154ywzlzeFPQrWeDZjvE=
=CMq6
-----END PGP SIGNATURE-----

--8w3uRX/HFJGApMzv--
