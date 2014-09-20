From: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Subject: Re: [PATCH v2] i2c: i2c-tegra: Move clk_prepare/clk_set_rate to probe
Date: Sat, 20 Sep 2014 11:16:22 +0200
Message-ID: <20140920091622.GC1612@katana>
References: <1409909298-11361-1-git-send-email-cyndis@kapsi.fi>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="oJ71EGRlYNjSvfq7"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1409909298-11361-1-git-send-email-cyndis-/1wQRMveznE@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org>
Cc: ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--oJ71EGRlYNjSvfq7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 05, 2014 at 12:28:18PM +0300, Mikko Perttunen wrote:
> From: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> Currently the i2c-tegra bus driver prepares, enables
> and set_rates its clocks separately for each transfer.
> This causes locking problems when doing I2C transfers
> from clock notifiers; see
> http://lists.infradead.org/pipermail/linux-arm-kernel/2014-July/268653.ht=
ml
>=20
> This patch moves clk_prepare/unprepare and clk_set_rate calls to
> the probe function, leaving only clk_enable/disable to be
> done on each transfer. This solves the locking issue.
>=20
> Signed-off-by: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Applied to for-current, thanks!


--oJ71EGRlYNjSvfq7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUHUXmAAoJEBQN5MwUoCm28ZYP/iIYviAk+B8pKLMWEIh1eX9I
oKYcs4KqGu3tH5ArnHUHwaG0CAd/i/GWCKmNpaC3OQDhUxl39bZ5DIYMsF1dYtpL
eUaBOUfOOzO8JepOosvwwZfoW4dETpsmSabogNAOyQdtE+kLKJN26/Cl1wj6fQTR
753pdVN+2v4tEMQ4Thvo10gwyxS8yNzilhS/kBDWEcl3qyxE/RehpxZxGg8MFckj
dx3MlKGLZ0G8+NUkqpvKWid8cf7j+ApvZCCHSD1cUV9/LxgfX0XuKlZcE8Ac981N
vZxpLmvTt2u9NwPHFXbBXyFOH+Q49dWMYDrLayoBulvTLnbvH8YJ67RqzlRKFSOt
RwqHGkXgHWrzhBbmDFGXoKPn5d5Cv7OamWMg/jzNPu6YoHCRxatKeCoHrH8U31gG
0j+7kRdCtrNlUYKGurIHLiCimwLGCyqH9YoBW69mKuOmiP/IAr0P3IzoTAB2g5Nc
SZCpesj29QpO9ovqLQy4g0DBJl2qwli5haJjtXhcOJrjRgUW+aLTh8RKSAwmMm9/
HWwDnqPFG8EVhY/vi88DK94n1bRKbjK26Ivvvhr2S8FW6BkKnp8Uj9QmzHsduzJx
oDugZRlQNeATxHbnULQnUqnDPsPRpBjdhUMbI+l8YrxN90JDYelOUtOxXEMongwk
nX2KELemU4A30tSClQEg
=ZLCh
-----END PGP SIGNATURE-----

--oJ71EGRlYNjSvfq7--
