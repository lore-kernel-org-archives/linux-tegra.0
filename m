From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v4 2/5] phy: tegra: xusb: Add Tegra194 support
Date: Mon, 14 Oct 2019 15:12:25 +0200
Message-ID: <20191014131225.GE422231@ulmo>
References: <20191009024343.30218-1-jckuo@nvidia.com>
 <20191009024343.30218-3-jckuo@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="imjhCm/Pyz7Rq5F2"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20191009024343.30218-3-jckuo@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: JC Kuo <jckuo@nvidia.com>
Cc: gregkh@linuxfoundation.org, jonathanh@nvidia.com, kishon@ti.com, linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, nkristam@nvidia.com
List-Id: linux-tegra@vger.kernel.org


--imjhCm/Pyz7Rq5F2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 09, 2019 at 10:43:40AM +0800, JC Kuo wrote:
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
> introduce a new device node property "nvidia,disable-gen2" that can
> be used to specifically disable Gen 2 speed for a particular USB 3.0
> port so that the port can be limited to Gen 1 speed and avoid the
> instability.
>=20
> Signed-off-by: JC Kuo <jckuo@nvidia.com>
> ---
> Changes in v4: none
> Changes in v3: none
> Changes in v2:
> - removed unnecessary #if/#endif pairs
> - introduce new soc->supports_gen2 flag which indicate whether or not
>   a soc supports USB 3.1 Gen 2 speed
>=20
>  drivers/phy/tegra/Makefile        |  1 +
>  drivers/phy/tegra/xusb-tegra186.c | 74 +++++++++++++++++++++++++++++++
>  drivers/phy/tegra/xusb.c          |  7 +++
>  drivers/phy/tegra/xusb.h          |  6 +++
>  4 files changed, 88 insertions(+)

Acked-by: Thierry Reding <treding@nvidia.com>

--imjhCm/Pyz7Rq5F2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl2kdDkACgkQ3SOs138+
s6HmyBAAuA9yYTCpqDsfbICoS5AwmWxkyiNCMD/+fgNqJV2XVKdmNaVhQ9XOZRMZ
l3IeKSV0xhPbaWRCBsTZftOdYUYgF4dMXJ2G5TAf5tGsJF693fPakF+AvXvazcwj
1+1FBw8z9V6C+jcZ74/bOtUmgAW9BWTxjd4wJE7VQtGflFEYiLfiA3kjMs2S1nMU
J600wdV6v9RH7wwQVUIm8FMiTlwC48QkCNQfoBc0Nzg4kMv+16+dgR1TM7TRAa3z
uon24QnKx2/Kx3d4CRxzCs51OEDwdAvuhfsRUYVJVvEWPu1fOHwTLxBSuaML1hxC
XtKtZNsyKU3b56yhDX2QCvST1r8lAyXXgt+l7lFxVgBvDv3qFMZxK9b7o1o9YXqO
JPvbmjHvjIF9RcLFH+beAhXTHxQVyhSgcwCFHLB2wa2TP6tdU5J9MF+PV70tj8fv
UVJwkb77jsdRr+taovr03j8k6wsysrzr/2WUCrbjuLdxtptTjYxmiMmclKxz2eEp
N8sSvSPBeizdxeH3wUvHjvH8bU8YlyjIMCw3qRzlx1vNgWD/NFm+QcUmudPq2Jn5
BfYtYwSpSD6yoUspOXgqs4GbiS3gXB3q2JzZG6d4ayq33HVZoIRqyQwi2CZ1f+QS
iBhZwtetGAhEgLhD+DXPcyAjBcCs0hqP0UiA6v1HQjUHZooXWo4=
=EPIq
-----END PGP SIGNATURE-----

--imjhCm/Pyz7Rq5F2--
