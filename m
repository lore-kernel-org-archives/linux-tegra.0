From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v1 2/2] usb: chipidea: tegra: Select Tegra's PHY in
 Kconfig
Date: Mon, 11 Dec 2017 11:04:00 +0100
Message-ID: <20171211100400.GE10671@ulmo>
References: <b820f290730e57c999c211e5f82cf833755c299f.1512947332.git.digetx@gmail.com>
 <d6b64530412955aba1284886b3f5f74e42d776da.1512947332.git.digetx@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="a1QUDc0q7S3U7/Jg"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <d6b64530412955aba1284886b3f5f74e42d776da.1512947332.git.digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Felipe Balbi <balbi@kernel.org>, Alan Stern <stern@rowland.harvard.edu>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jonathan Hunter <jonathanh@nvidia.com>, Peter Chen <Peter.Chen@nxp.com>, linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--a1QUDc0q7S3U7/Jg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 11, 2017 at 02:10:00AM +0300, Dmitry Osipenko wrote:
> UDC driver won't probe without Tegra's PHY, hence select it in the
> Kconfig.
>=20
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/usb/chipidea/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/usb/chipidea/Kconfig b/drivers/usb/chipidea/Kconfig
> index 785f0ed037f7..2ef3b27ea72b 100644
> --- a/drivers/usb/chipidea/Kconfig
> +++ b/drivers/usb/chipidea/Kconfig
> @@ -27,6 +27,7 @@ config USB_CHIPIDEA_PCI
>  config USB_CHIPIDEA_UDC
>  	bool "ChipIdea device controller"
>  	depends on USB_GADGET
> +	select USB_TEGRA_PHY if ARCH_TEGRA

This is kind of pointless given that USB_TEGRA_PHY originally was
automatically enabled if ARCH_TEGRA was enabled.

What do we gain by these two patches, other than maybe make the driver
buildable as a module?

Thierry

--a1QUDc0q7S3U7/Jg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlouWBAACgkQ3SOs138+
s6Fmag/+KXeUWColoRE9PIwR/KKMmjhx/WZDiGTzDXP/D3TbZcUxRKJKzAoR2jd3
jbEDHlJNCnPfu0xOElBzooO+H5bMELiECKns6OVcQXTKkdk8AIhUlULJxb49nvFO
bQxW5ztSUu4HlWD2DQqql8yavlYnOJUHKOhhXISkJvbgQiJ1YoxbYMxiKTAIU7tW
sJgcE1foIfDXcj1WSfdO4U7rKUvxA9PsamPpyKGBIk7byKiayT/0uAF4fWzBItee
uTLIPBr4EFLJPXjpROz6Wb7D0gFR5ldyekDigIqVHV1WF/QVvIUM5elAi5K4NIY5
X1eJNJMg08oFz3TR+zeSJU8cqPPKCA9rfuUnZo/09EjQiFumAZ+e/eXKX7prSNVW
qK+V/MpKLO2UsICOIdXynTPi8m2uCxoJIZary1f0R+qA6R610kVXwzLI+Pz7DfGU
J197dK7ZP7AVlaKipxXJRy79eva2GkkD7vMaJ+ulRGFM+gBHXkGvfV3zVcsAWXmL
4XMWYB8ZFRCifxHQZVaVIxfEsiqsJ3jsYCd0n03W3wNnqOullqVNzI5V18mjvHbr
Dz2ScOa8Vq1/4pmTp+GnWcsEAceUbzTbOXsa78JWF0FUeR78I7k/6B7RvdKFKeH7
/9ATqpPbYl2QWeaZB4yryAiMlGDwU2bHm0gFGyTQHQKMj2PEOKA=
=Cs+u
-----END PGP SIGNATURE-----

--a1QUDc0q7S3U7/Jg--
