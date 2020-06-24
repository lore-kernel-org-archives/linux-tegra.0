From: Felipe Balbi <balbi@kernel.org>
Subject: Re: [PATCH] usb: phy: tegra: Remove unnecessary spaces and tables
Date: Wed, 24 Jun 2020 09:45:20 +0300
Message-ID: <87zh8tvu67.fsf@kernel.org>
References: <20200528112859.6160-1-tangbin@cmss.chinamobile.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200528112859.6160-1-tangbin@cmss.chinamobile.com>
Sender: linux-kernel-owner@vger.kernel.org
To: gregkh@linuxfoundation.org, thierry.reding@gmail.com, jonathanh@nvidia.com
Cc: linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Tang Bin <tangbin@cmss.chinamobile.com>
List-Id: linux-tegra@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

Tang Bin <tangbin@cmss.chinamobile.com> writes:
> The macros in phy-tegra-usb.c have inconsistent sapces between
> the macro name and the value. Thus sets all the macros to have
> a signal space between the name and value.
>
> Signed-off-by: Tang Bin <tangbin@cmss.chinamobile.com>
> ---
>  drivers/usb/phy/phy-tegra-usb.c | 214 ++++++++++++++++----------------
>  1 file changed, 107 insertions(+), 107 deletions(-)
>
> diff --git a/drivers/usb/phy/phy-tegra-usb.c b/drivers/usb/phy/phy-tegra-=
usb.c
> index 6153cc35a..c294dc617 100644
> --- a/drivers/usb/phy/phy-tegra-usb.c
> +++ b/drivers/usb/phy/phy-tegra-usb.c
> @@ -30,124 +30,124 @@
>  #include <linux/usb/tegra_usb_phy.h>
>  #include <linux/usb/ulpi.h>
>=20=20
> -#define ULPI_VIEWPORT				0x170
> +#define ULPI_VIEWPORT	0x170
>=20=20
>  /* PORTSC PTS/PHCD bits, Tegra20 only */
> -#define TEGRA_USB_PORTSC1			0x184
> -#define TEGRA_USB_PORTSC1_PTS(x)		(((x) & 0x3) << 30)
> -#define TEGRA_USB_PORTSC1_PHCD			BIT(23)
> +#define TEGRA_USB_PORTSC1	0x184
> +#define TEGRA_USB_PORTSC1_PTS(x)	(((x) & 0x3) << 30)
> +#define TEGRA_USB_PORTSC1_PHCD	BIT(23)

the idea was the line up the definitions. I'm not taking this, sorry.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl7y9oEACgkQzL64meEa
mQbi1w/+MTIv4tIMgZim0yPtzrtJUSjxtFHBZzzmIj9J2W6LiwfvtfkDiX7Sww9o
KXfigdY2/GQRFZHLTOtlnK/VBmXBoM/W3OF6lZv6/QtJ4DbYmAY/LwXdOAA4VRg6
vtwzYUJ0rnCv6jFU2CBKCyL5gNmWreFUXF4elbrFLHhjggGxmz3wBgXeGGSPTmF6
qmL8qo95kjyP1DuPsWWLtsEzZb4mCm/c4xps5u+Ig8g3eKTYAMn2TPqTj/0LZrZH
ZR1Blcinzv42j6jK8R30HlrRZUxKhsf85G2uzGoUQsRoipZwPtBqka0bVyudpBUZ
ZpvWKLmx9DuCysKTIpd7PXhwgQhTQwigauEQIzg5rlkaZ6TWH5iQsCij1v9piSA8
swtgqN6sEvnCtQ6/mtrlSGzzRilxIIf2rEm3cCHIdVyHx2b9x49jTAS0RrFibJHI
Qfp0e1MscQRW3cCmrtBHZ9BLGPTXxyTZBIyACduW3/TB3jTQTbCipOxeBmnO34km
ggzzI/e41b8BfI6Aeo35ktZjiOCJiJ6ZWLAdi9pXpD8mohwk/wuP+rGM0OnHXKqZ
yRLJTs7tPfCR7x3N9Pkbu49DW31AAPhL0Hw7CNIQ7yV6NsYTysQgtK+E9e/HsMkv
LWh7rOVFaEnWNLTLNpgituZalVT1p1V5zVrMpsxhRJYlU/QXD1Y=
=SZhD
-----END PGP SIGNATURE-----
--=-=-=--
