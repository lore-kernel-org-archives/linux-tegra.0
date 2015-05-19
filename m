From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 1/3] pinctrl: tegra-xusb: Remove unused structure
Date: Tue, 19 May 2015 16:20:43 +0200
Message-ID: <20150519142042.GC26748@ulmo.nvidia.com>
References: <1432044863-2035-1-git-send-email-jonathanh@nvidia.com>
 <1432044863-2035-2-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="wxDdMuZNg1r63Hyj"
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1432044863-2035-2-git-send-email-jonathanh@nvidia.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>, Alexandre Courbot <gnurou@gmail.com>, linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--wxDdMuZNg1r63Hyj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 19, 2015 at 03:14:21PM +0100, Jon Hunter wrote:
> The structure tegra_xusb_padctl_group is defined but never used and so
> remove this.
>=20
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
>  drivers/pinctrl/pinctrl-tegra-xusb.c | 5 -----
>  1 file changed, 5 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--wxDdMuZNg1r63Hyj
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJVW0a5AAoJEN0jrNd/PrOhfBYQAIIvwVr6OKYII5LA/OPQDjw7
NhKCFA3iDNMYwdc89pGWWqhdK7xXZPTvZP6tpY2PVamW77kVfL9AitVI5qosi6dI
3t4OsrrMm2vmrJN8lhwshMIpcCi4PrAr2oWy/+3T34wl53HOEj1n3LgN7DoeGadn
ipOquqqfCT+PQyOriAJZ20SD2K0G8Y2hF1Clx1LSZdm0OrjtVyPvRfl3oqYWsaDH
aMz/Z3YXQ7RqXELZP5DqadAN88k3My7WRS3D369NBscPKxFnrz0FQuUr4mE0mKYU
4aVv5AQE2hHOnNSKNVzRHfcn+g+9BxfFku9Zgza7QABWKRULglx1BjIWJ0ll7uQ6
KZkmgC6cl/qOMmC+c3SrPPXGCAhWfkY0CtHvNWfhUnPZzJ+cv7j5vjwB4xII6TMH
HryixKmr+fxLQCOk1lgN5LShVF2WRWlBiMMiQxpo3GqWDeGjKs8qzvobSwlz8XVd
hh8ac9jFLQ2l6Hdsi9cUJHSGG/ESekMrF4m52wZ1EyQATMnYl3WIHt34nv4A+oeu
gZH6zMJy0c6REU8rM76krLN3OHlk4Zazm4j6P5HKotfngCLKRSscpJFgV8n7eZ/P
QrpBWazMhGgjqjlZY4ZJoF+Ag3+WgBFURRmb8+INoThSHNK5/GBJ/uJvOTv3/Bna
WTi7pjxSyhZrzHEABJv8
=TCho
-----END PGP SIGNATURE-----

--wxDdMuZNg1r63Hyj--
