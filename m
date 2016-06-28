From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 08/12] i2c: core: Add support for 'i2c-bus' subnode
Date: Tue, 28 Jun 2016 23:10:08 +0200
Message-ID: <20160628210952.GA1760@mithrandir.ba.sec>
References: <1466697545-11868-1-git-send-email-jonathanh@nvidia.com>
 <1466697545-11868-9-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7AUc2qLy4jB3hD7Z"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1466697545-11868-9-git-send-email-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--7AUc2qLy4jB3hD7Z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 23, 2016 at 04:59:01PM +0100, Jon Hunter wrote:
> If the 'i2c-bus' device-tree node is present for an I2C adapter then
> parse this subnode for I2C slaves.
>=20
> Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/i2c/i2c-core.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)

Hi Wolfram,

are you okay with this change? I'd like to take this through the Tegra
tree, with your Acked-by, to resolve the dependency of subsequent
patches.

Would you be okay if I take this patch along with the device tree
binding change into a stable branch and provide a tag for you to pull
into the I2C tree?

Thierry

--7AUc2qLy4jB3hD7Z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXcuedAAoJEN0jrNd/PrOhMuEP/3gZGfGsCmpsnuUcDw7r8x0T
zEAmoX7hLkNAtr1Tesr7lY/k3ByPJpCArOWvcwVCXwTwtuqWbrazIMm8n4iN01EP
WnXu+aQPY7v83O1rBRpL+X/6k2yp0MF8QWAXIzbJ9HOsnPEDjBQzN6sqh5kWf2iH
scWzygXeUT9eaFGFEMOXERPZVPUDCA0Smu32dc8+bwOJuH8DmrBNQlxyTKbWpMdN
SzpWCfhBuq7KZA36Z3tN+yYUtzCQbifrZVi5LOwK3d7hpiWXbFT0dNh1LKKnAYYy
NkwsT1a75RKnhQeMLNVmBuvFKCnt410OEuy5PvY1aLrWnvxstZmNgoh5aAaNK+6q
PiOjJRfqtV01jgWIo/c88p4z3JRFK0A6bbqo1QipKiP+tJin8hlHEEf2SiafbemW
PQY2uCy6GuziDjcBqi5GXs34jylMRXzYk+FwxCMeHM7B4ALzAO3ZT/MLnNRmZGEO
qTLe/f9prVsnr7uNkttGbllsm/jbVo0HTLKMSQY7o8hqUAdiUPQlrc/zXxdJjo36
Q4u5x3laBjREo12X2D+IaQRCoawOI0SJobZvozCxsQSAhnDEOD0ufCbfZTVZAjtz
DCOUjybeLSZcz4HM5xs6DZfGcQTnpxT/rEv3xTphENH4XF1HTkvmvjIN1E1O/CWZ
Wi8tVY0BFFPQ5J/hcww3
=52Fk
-----END PGP SIGNATURE-----

--7AUc2qLy4jB3hD7Z--
