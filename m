From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V1 3/4] usb: gadget: tegra-xudc: Add Tegra194 support
Date: Tue, 28 Apr 2020 14:21:20 +0200
Message-ID: <20200428122120.GM3592148@ulmo>
References: <1587022460-31988-1-git-send-email-nkristam@nvidia.com>
 <1587022460-31988-4-git-send-email-nkristam@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="VLAOICcq5m4DWEYr"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1587022460-31988-4-git-send-email-nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nagarjuna Kristam <nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--VLAOICcq5m4DWEYr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 16, 2020 at 01:04:19PM +0530, Nagarjuna Kristam wrote:
> This commit adds support for XUSB device mode controller support on
> Tegra194 SoC. This is very similar to the existing Tegra186 XUDC, with lpm
> support added in addition.
>=20
> Signed-off-by: Nagarjuna Kristam <nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/usb/gadget/udc/tegra-xudc.c | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>=20
> diff --git a/drivers/usb/gadget/udc/tegra-xudc.c b/drivers/usb/gadget/udc=
/tegra-xudc.c
> index 52a6add..fb01117 100644
> --- a/drivers/usb/gadget/udc/tegra-xudc.c
> +++ b/drivers/usb/gadget/udc/tegra-xudc.c
> @@ -3494,6 +3494,13 @@ static const char * const tegra186_xudc_clock_name=
s[] =3D {
>  	"fs_src",
>  };
> =20
> +static const char * const tegra194_xudc_clock_names[] =3D {
> +	"dev",
> +	"ss",
> +	"ss_src",
> +	"fs_src",
> +};
> +

This looks identical to tegra186_xudc_clock_names, so there's no need to
duplicate them. Just reuse the other one for Tegra194.

With that fixed:

Acked-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

--VLAOICcq5m4DWEYr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl6oH8AACgkQ3SOs138+
s6G2ag/8CU0kKOqPbPmx1dYndCz1V9xbrpIjqRROzzgU7SJ+NGfKfceJe7gTfGZM
AZKeUlVoN494QnDJSB4Z1wII+i14sio5Y7kznzURcHniZnv2leNqI3jlagiVYCOe
nTgBwCPp7Ls/pzgmOlULelIVr/7xtEbxXFB9V6VCkV67jEmsaea8FUGmksXIC+YN
u/oFdPHWhXw96NHF1PBHpyuLNdGyw8iXB/zLn/zJC05eSfQirP1xb5oWDXZNIe+9
OZjNEWv7hMJEpt+Xe7T+6EBSH50Se+yMfj6qX6uZGHM1xY33JT80K2acbAOsKxYT
6JBTUQ655uYJu8+fxV1yl8eUJhYUjkU/NLTJROBqKBD4TqOsNxFSiqVckEXG0d0p
T/r3mKHEKbC7NB/Fd7xL4JTWkK8erqLWzgqOzc4iz3lJ2KHEPpnWkWsGGBqiMJPV
BUUugLiZ6XWi5S3L1OXkqV5Ritz5PWaHzLSYHaihSO7e8p3WDdDNAcLPcy651buQ
cBjHlsMbABNo459gBdiEvbDX7MWkNzWr8QjBzOK1wigVSUav9wKvutCwaFsIRJfh
44KtPIK+cdyaQIoK3rFHKaTnNlD6857wJWqhuOyYTcd9znRh/e0xU3d1Jwvb6mBv
a+osPQeem0I+hhJg8dP/FqLGHK52oM5kA1IZNPh5ZOTX9d+dh50=
=BU7n
-----END PGP SIGNATURE-----

--VLAOICcq5m4DWEYr--
