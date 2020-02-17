From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v6 2/5] phy: tegra: xusb: Add Tegra194 support
Date: Mon, 17 Feb 2020 09:28:48 +0100
Message-ID: <20200217082848.GA1339021@ulmo>
References: <20200212061133.11665-1-jckuo@nvidia.com>
 <20200212061133.11665-3-jckuo@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="sdtB3X0nJg68CQEu"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200212061133.11665-3-jckuo-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: JC Kuo <jckuo-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--sdtB3X0nJg68CQEu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 12, 2020 at 02:11:30PM +0800, JC Kuo wrote:
> Add support for the XUSB pad controller found on Tegra194 SoCs. It is
> mostly similar to the same IP found on Tegra186, but the number of
> pads exposed differs, as do the programming sequences. Because most of
> the Tegra194 XUSB PADCTL registers definition and programming sequence
> are the same as Tegra186, Tegra194 XUSB PADCTL can share the same
> driver, xusb-tegra186.c, with Tegra186 XUSB PADCTL.
>=20
> Tegra194 XUSB PADCTL supports up to USB 3.1 Gen 2 speed, however, it
> is possible for some platforms have long signal trace that could not
> provide sufficient electrical environment for Gen 2 speed. This patch
> adds a "maximum-speed" property to usb3 ports which can be used to
> specify the maximum supported speed for any particular USB 3.1 port.
> For a port that is not capable of SuperSpeedPlus, "maximum-speed"
> property should carry "super-speed".
>=20
> Signed-off-by: JC Kuo <jckuo-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> Changes in v6: none
> Changes in v5:
> - re-use "maximum-speed" instead of adding "nvidia,disable-gen2"
> Changes in v4: none
> Changes in v3: none
> Changes in v2:
> - removed unnecessary #if/#endif pairs
> - introduce new soc->supports_gen2 flag which indicate whether or not
>   a soc supports USB 3.1 Gen 2 speed
>=20
>  drivers/phy/tegra/Makefile        |  1 +
>  drivers/phy/tegra/xusb-tegra186.c | 73 +++++++++++++++++++++++++++++++
>  drivers/phy/tegra/xusb.c          | 17 +++++++
>  drivers/phy/tegra/xusb.h          |  5 +++
>  4 files changed, 96 insertions(+)

Acked-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

--sdtB3X0nJg68CQEu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl5KTrwACgkQ3SOs138+
s6GXxA/8D37/XlTzbjLKco4jPyFn81sBehbABl9f415ypjEivpMsR9KaXQSd1G+b
TGftxQLo/ZCqSEbbPmLRqn+v0XS/Qv/Q0Bgyam7JzU5xPpZlVB4p7B/dGGySQCEJ
HbHOhB5KkKjqfhyjwaM0CCGOqieynpgWMd3Ij3hLIAGCGVuwt4hUs7E3VVHBwIbr
VAjULUBCn4oIBzUsF+LEe6WiCPzy9/+9YRyK2O1UR9QnfFNInqHbDAhOWsifAkm8
L/FdzT5n514MZwGB+99AJ3sC36BNUYJ6IeOvmEAxIxqHDoISzE/+EvUPDgGzZLnS
6qRkohCb9Hj43h2hrCLLoYEr0oHmDULGRIqR6O2yJXLsitU94JcdefH1zoNqyO9X
EbxQysIyfN5BVvonrESuVZfqGy7QgaZj5TzIskGRWYWXaBgPRnv5zBP5i8f2D9Rf
Vq9MX72/9O6v42O3pQHj9A6BLFICX/Aa+l1PQhjWTSolCbHG54vnJfa+c6gsfa1O
2200pnRcv4qhq0UNYdm36M2GdTmN2eCvSxcv/grui5qHN/PmXSlE8m265Dg0Nir1
jx0a8nuanyZ52p9N0YVCPGu2Dndc7yNgQUwg8t3iWAtRTI6u0tl5DR8Wgt352rUA
dAbewl7akPXh9Hew7SsK9Jgv8E9VLuoCtNIuSHPQIcXSrpZaRt4=
=NIJH
-----END PGP SIGNATURE-----

--sdtB3X0nJg68CQEu--
