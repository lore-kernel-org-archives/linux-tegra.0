From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] arm64: tegra: Enable cros-ec and charger on Smaug
Date: Fri, 15 Apr 2016 15:38:02 +0200
Message-ID: <20160415133802.GA3472@ulmo.ba.sec>
References: <1460663838-27175-1-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="mP3DRpeJDSE+ciuQ"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1460663838-27175-1-git-send-email-rklein@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rhyland Klein <rklein@nvidia.com>
Cc: Stephen Warren <swarren@wwwdotorg.org>, Alexandre Courbot <gnurou@gmail.com>, Andrew Bresticker <abrestic@chromium.org>, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--mP3DRpeJDSE+ciuQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 14, 2016 at 03:57:18PM -0400, Rhyland Klein wrote:
> Add nodes for the ChromeOS Embedded Controller and for the gas gauge
> connected to the I2C bus that it controls.
>=20
> Signed-off-by: Rhyland Klein <rklein@nvidia.com>
> ---
>  arch/arm64/boot/dts/nvidia/tegra210-smaug.dts | 27 +++++++++++++++++++++=
++++++
>  1 file changed, 27 insertions(+)

Applied, thanks.

Thierry

--mP3DRpeJDSE+ciuQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXEO60AAoJEN0jrNd/PrOhLE0P/A5H/y53ruVd3MqR/P2Kvy7O
vChiGgcr4wtJlKT0DOW6nUsOtvv5Kp06Qrx31aXHb8CN4lGJr3TWLGNvlu1g+Irj
r1HrwbB58jh7RSuaAx14dbaZBs//sbassS7aXx7jZ3fZ5kSiAZzW80hKIfpwjxLV
r5+VdBM+it9H8tp+Yrms9Lh8ljfT2xRfHHYK6KFV3b0aFa61JDIug/hVDbYndpVX
ihfYsoTYvD1sddlQuya1iaW+mu+6q9ZS32hSJ7aANzT7o4DqqeQo43BO2r/LZFIC
Q0R4TskgfZ62SfSF/cOfp/XpgADjUUH8OngGTistr04jgyq6pOb8JW7V6iwJoRcX
nS/HwWPmPvEATMIp7SY1gjKWz2+62VBJN/5SAs32EEAPyUh2D/vL9e/yoV/1b5si
3ugLP95Di6EJjm/EEsxfTflBQUIUA495igT5+R+9Wjxb988+ma2VMZ/2g0F/22Ts
tJaDGESOy4SN+lC2TPEowSeAP3kWTzCz6Amm/3tgwJXu2eqSNKE/H9ucBlha+vka
YJJDNbq4fxWIrf9gFO4yN581BxHvwDnwJneqHXsqKRRRqueYmbC42/n5x8D3RyZa
9II/4sfg2WLUuhCuIB77EtcrDvGneekgnwJMefJA4ZfX3MpUZs669wLu2sRyqSNm
VKYytaUlGPyBpST1/azr
=s4h9
-----END PGP SIGNATURE-----

--mP3DRpeJDSE+ciuQ--
