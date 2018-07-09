From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v1 1/2] ARM: dts: tegra20: Add Memory Client reset to VDE
Date: Mon, 9 Jul 2018 10:59:02 +0200
Message-ID: <20180709085902.GD13963@ulmo>
References: <20180520134846.31046-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4494560774732429228=="
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <20180520134846.31046-1-digetx@gmail.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Dmitry Osipenko <digetx@gmail.com>
Cc: devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, Jonathan Hunter <jonathanh@nvidia.com>, Hans Verkuil <hverkuil@xs4all.nl>, linux-tegra@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--===============4494560774732429228==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ZJcv+A0YCCLh2VIg"
Content-Disposition: inline


--ZJcv+A0YCCLh2VIg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, May 20, 2018 at 04:48:44PM +0300, Dmitry Osipenko wrote:
> Hook up Memory Client reset of the Video Decoder to the decoders DT node.
>=20
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  arch/arm/boot/dts/tegra20.dtsi | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)

Applied, thanks.

Thierry

--ZJcv+A0YCCLh2VIg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAltDI9YACgkQ3SOs138+
s6HNlg//WWXO7YBRWnaR2AaXE6q2QxdZKw7Fy69Flx4luA1rQYO7jlMkh6CQkxra
gbzAsStpe3WZSKFjgC+ysUta7zRFmBG2uANyUPp9UJp28hVkJSwV5JzY8McNlLZ2
n8CV7Kj2JHRi/cm7VeaYaWVkOdZF8sKkKuowqrTlFCbFxx1QqGxS5n/lyB46KB8S
2MWXWoCCUAq+bbHPUGpMlWgjI+6eoofVAB65wQdsX1bTNMv7U5/LkokbU6xWG7uA
qutgMouPOhqtTztX7Qspe30aVn+bvdjsQwd2/KwYJHXCVtrKWYyIey8fEcUzWeFU
LnQP+rnYEB9WA9Vpx4h7Gehs2YlQ2d68BWZX0mijvFMlj2gK92ZMGg4qyscuAMjd
1jh5nYzRU8JKlNPXo9HTC3rifQRJFlzm00Ch9zXRYH4KGREqg06ojqm22OHGNOvZ
UU0wyg+BTFGmwnPIDKbebFm1XtUpfR0UfI8/Ok3m5DF2n5QOSz2B6+vboGAO6I/2
kczw2NUgQdjnwaqJqro7rzD05wFeNbjAwErQTLijTG1ozqssZoEpIupkmKIv3t3z
bWQZkQ+m/sqJGgI+dtujIO8QmFT09qCAiUSWdqxFKZUv2XgHrNNMhsQRNXm5GDfd
0JSNOhZkMA4fijTrwHCmpEvhkJ5VXOXc4VJE7CbBziwEO1RZnPo=
=s+P9
-----END PGP SIGNATURE-----

--ZJcv+A0YCCLh2VIg--

--===============4494560774732429228==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devel mailing list
devel@linuxdriverproject.org
http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel

--===============4494560774732429228==--
