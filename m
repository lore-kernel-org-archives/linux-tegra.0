From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v4 1/5] phy: tegra: xusb: Protect Tegra186 soc with config
Date: Mon, 14 Oct 2019 15:11:29 +0200
Message-ID: <20191014131129.GD422231@ulmo>
References: <20191009024343.30218-1-jckuo@nvidia.com>
 <20191009024343.30218-2-jckuo@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="zbGR4y+acU1DwHSi"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20191009024343.30218-2-jckuo@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: JC Kuo <jckuo@nvidia.com>
Cc: gregkh@linuxfoundation.org, jonathanh@nvidia.com, kishon@ti.com, linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, nkristam@nvidia.com
List-Id: linux-tegra@vger.kernel.org


--zbGR4y+acU1DwHSi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 09, 2019 at 10:43:39AM +0800, JC Kuo wrote:
> As xusb-tegra186.c will be reused for Tegra194, it would be good to
> protect Tegra186 soc data with CONFIG_ARCH_TEGRA_186_SOC. This commit
> also reshuffles Tegra186 soc data single CONFIG_ARCH_TEGRA_186_SOC
> will be sufficient.
>=20
> Signed-off-by: JC Kuo <jckuo@nvidia.com>
> ---
> Changes in v4: none
> Changes in v3: none
> Changes in v2:
> - new patch to protect Tegra186 soc data with config
>=20
>  drivers/phy/tegra/xusb-tegra186.c | 70 ++++++++++++++++---------------
>  1 file changed, 36 insertions(+), 34 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--zbGR4y+acU1DwHSi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl2kdAEACgkQ3SOs138+
s6ENixAAwT1uDw7S/gb/XqpdKkQQys43Yphllfc3nDJpIKo/3ALvyR/5zy0vs2eY
XXgRaMTbrwGk24LX9W6LaVy3J/yHDU3rGwtbMVhumATQ/XuoUzOOQK3jgmgNlEGl
RqqHgFUM1zxsANjl+UpnJI0m0ba1ZeAfFqDl72OE9TaQOYdNoxq3Hc9nDiPYTZRh
CWKJwtku6U65v9kpWMSMdZ1P18ZkYDNPzFLD/QHy8LdBz/4Vxtf4QuTdWYZWwEqD
XdzddtF47QmKvPhMry4vpR3AYdknLnRG6dFEevqBKoVU3kgNmjg1d+CIWTLI/BUx
AyDUmbFmgqQyCg+Af3RL2UZ4TaWUYMyY9tfDgmrRskwcgIkklP030Hw9Foua7gHK
EDS5vc/7Uuj+8TF7fa9gHIpSDZ+bfhKjO+mvIZHP51vnQwbpj6ZU1syZHZ3bMq0A
09HHUflkmEj+IJF/gp0/Zqh6pnHaxGEKVSBDsaDjKJ5n6du0ZMReH7xI9i04f0dr
KKahgPpmppYykkJLnInFCOJCPFMtYPRh4qUSs9Z2xJM5zuEU5b+2deznAZvzHmu3
Juf4eAGf1F8rGKYL6f0S9yJqikyg7+F2NqB/sUoT70CpZlup3Y788sSuh9dBb7uW
gmkL0vUTFP5R+4OhEnbK+3SiFRdJZNbnDcYeU/WEaoUFHk/+On4=
=jsyo
-----END PGP SIGNATURE-----

--zbGR4y+acU1DwHSi--
