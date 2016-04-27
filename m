From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: next-20160427 build: 1 failures 15 warnings (next-20160427)
Date: Wed, 27 Apr 2016 16:48:04 +0200
Message-ID: <20160427144802.GA4176@ulmo.ba.sec>
References: <E1avM7P-0002LM-3R@optimist>
 <20160427122438.GK3217@sirena.org.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Qxx1br4bt0+wmkIi"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160427122438.GK3217-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Content-Disposition: inline
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, kernel-build-reports-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, linaro-kernel-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

--Qxx1br4bt0+wmkIi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 27, 2016 at 01:24:38PM +0100, Mark Brown wrote:
> * PGP Signed by an unknown key
>=20
> On Wed, Apr 27, 2016 at 10:50:51AM +0100, Build bot for Mark Brown wrote:
>=20
> Today's next fails to build an arm64 allmodconfig due to:
>=20
> > 	arm64-allmodconfig
> > ../drivers/phy/tegra/xusb-tegra210.c:1721:3: error: label 'out' used bu=
t not defined
>=20
> caused by 44f5d38eaa21d (phy: tegra: Add Tegra210 support).

Yes, I just realized this now as well. I pushed a fix to Tegra's
for-next, so this should be fixed in tomorrow's linux-next.

Sorry for this.
Thierry

--Qxx1br4bt0+wmkIi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXINEeAAoJEN0jrNd/PrOhtSIQAMMF6Co9755PX2n2ERXH/YBm
dW6f5WAlUSkjO6OKfgz+jn9HuI6l/2TJuIX9faNkg8T3Ub/gGd4tGH2+gTzWMhiE
2jyfEE4JchfGcrMBPhMH1ccpg12OFNAoS3/i0zMem4lCy57cdMDLxRlo3b001Dzv
M2RhGKNI0buqpyokUnLkLn2R1dmuynQwC1BxVhHER+NuxQqKFnMO93mas/E+2lpV
RbW0oez4bk6S+pjE9wHpN5RobBv534M9l6hKLLH6v0Ae976I9MOgcC8cgc15QEjd
kM/xCUvkn5w3drlDr1FSCUSp3Cd+KFuS7YrAg7ZzifUb/er+osaF9XSauidZwm9O
H9DB1/FbaWHODH9sXMERYEKYClNiT/ncnBvl+9kwo+zOWeqlCoeVo0bTA3XrAz8U
dqC8kcd9Ew0bbKj6S56L5r5HPFH7TEK8Cl5QxuYhmebdQM7W7AiVC7Mkda1raAK0
iOquZZkR8p1oW8hFTiKPnrWeIAHxCW/0824H8vyS+peGjyYrFFvVRPxgpBo5jXd/
SMEFqQ1lpX8Ug7wKdVNJZKaznui9AW0gdp5lpoIw9Iw/priSastylS9I4pw3ZhxN
nOLdCTodn2zB6xy1Y2ILOz8fu7vX71mDyC9DaShjoYtP6kZsaVpLvU/aMrjwf2vN
ekNxp5HJPSNUQxRopVYx
=YzX7
-----END PGP SIGNATURE-----

--Qxx1br4bt0+wmkIi--
