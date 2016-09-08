From: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Subject: Re: [PATCH] i2c: tegra: Fix assignment of boolean variables
Date: Thu, 8 Sep 2016 22:26:10 +0200
Message-ID: <20160908202610.GD3166@katana>
References: <1473155445-3046-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="EP0wieDxd4TSJjHq"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1473155445-3046-1-git-send-email-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--EP0wieDxd4TSJjHq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 06, 2016 at 10:50:45AM +0100, Jon Hunter wrote:
> Fix the following warnings reported by coccinelle for the Tegra I2C
> driver.
>=20
> drivers/i2c/busses/i2c-tegra.c:513:2-23: WARNING: Assignment of bool to 0=
/1
> drivers/i2c/busses/i2c-tegra.c:539:3-24: WARNING: Assignment of bool to 0=
/1
>=20
> Reported-by: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
> Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Applied to for-next, thanks!


--EP0wieDxd4TSJjHq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJX0cliAAoJEBQN5MwUoCm2X1sQAJYNli760Dgnsj3ZRN5O/jOk
sDQ6/4TNVK2XgWrqgExV0tcYLdmwWO+nePmhNfirDi+sk+ExuCyaJGWk1mk/tx9Y
vd36B59zZAItGkvKy9QIzuBKrePNw/NJxJ7hpFY7/EMDePXTiqJWryCekiE1l4BO
a/SlBXVL1GU15cTFckByIidVKqERoPuJi4ultQiq9Vufr+Ws7cTv8JBJvLXCLwvR
a+iab9wPAZtRs2NnoRPQZlja+pmZzQJCzJqszno7bXluJ9cIDzK7sbVNpRtRbA8H
86YihFrvLxEmHdPRb3nzGS63Ak79I0rGUrDtjhKM0p/PsFzv0AZZoU6FLtQfw0Dr
9JFqIWK1+Z48VvT+KdugWngfg95M89iju8a/7+umJnVNTrOE9NfnMhV1MI4b68yJ
i+1v+8bo381P3lahGsn9Zn0Qh4+km/CiIoNQxor9KmSfTywV4lPEfRdOnKe/Roql
6HqtohtzNOhlRbq5PBHBfSLG1n+8CzAH4hmv9s7cfWGYfR3k6oc9U4YP6r8B6IqG
Ty9eT2CPrfu70GsoEJ3tAX4UinGAGd6GFUWgsMl+MSa9+khSaI57Irr01bHwSia/
GLpIzWGKrJdU13+t1I6oo3h/0NJ5U1p55NFC7rZYoiOE2QGmC5eyPyMFQAeqljjK
D00mn7USNCm+tzhBi2Yg
=3ftH
-----END PGP SIGNATURE-----

--EP0wieDxd4TSJjHq--
