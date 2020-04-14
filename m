From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v6 11/14] memory: tegra: Support derated timings on
 Tegra210
Date: Tue, 14 Apr 2020 17:47:53 +0200
Message-ID: <20200414154753.GQ3593749@ulmo>
References: <20200409175238.3586487-1-thierry.reding@gmail.com>
 <20200409175238.3586487-12-thierry.reding@gmail.com>
 <7f23f140-4c56-3d9a-946e-f29bc569f40c@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============9009579722167363084=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane-mx.org@lists.infradead.org>
In-Reply-To: <7f23f140-4c56-3d9a-946e-f29bc569f40c@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane-mx.org@lists.infradead.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Jon Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>, Joseph Lo <josephl@nvidia.com>, linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org


--===============9009579722167363084==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="zfSPj0+0wxNpTjLN"
Content-Disposition: inline


--zfSPj0+0wxNpTjLN
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 10, 2020 at 02:44:16AM +0300, Dmitry Osipenko wrote:
> 09.04.2020 20:52, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> ...
> >  	tegra210_emc_debugfs_init(emc);
> > =20
> > +	cd =3D devm_thermal_of_cooling_device_register(emc->dev, np, "emc", e=
mc,
> > +						     &tegra210_emc_cd_ops);
> > +	if (IS_ERR(cd)) {
> > +		err =3D PTR_ERR(cd);
> > +		dev_err(emc->dev, "failed to register cooling device: %d\n",
> > +			err);
>=20
> > +		goto detach;
>=20
> I think it's not really worthwhile to fail whole EMC driver because of
> the failed CDEV.

Well, we do kind of need this cooling device mechanism in order for the
memory to continue to operate properly at high temperatures. It's also
very unlikely that this will ever fail, so I don't see any harm in
making this mandatory.

Thierry

--zfSPj0+0wxNpTjLN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl6V2ykACgkQ3SOs138+
s6EAeA/+IsxKWQvGh2RYgVTWhjjt4UXdnCKicikH4x5BNbL8tXenzOzKPEmGNWD5
Ts2RFpne3QaRGscpN0bTZry+XjKv8UHoInOHgYZtd1KyS1+yJUbgZYeoHBA87Z+P
bF7X/Pq8ZJPhqgvn6dAuNO2GWl/EpR9h5ne+TI7cEL84bqgAfaqRQjdqnyJdnc6X
gg2eP8U7dff0CO9jR4JJHt1PckFrb/r6cwsCg9WlYbu+MBXj8mCXJzo0PvXHM9ea
uLVXjEDdN8RV9kqypiiDiLpWxdaDBZqwD14yvdOfTYSXW/S/Ai8txPjlD2NqaqJE
v+WikKx5xk3wUx4ul+v21cj3Xm1IClxl30UULyvznZGm5MqNHf/Nh+t/2ehgVslS
CyzybTooPUv5qDkvlOPV+0ipG4UEask6NU80mNE90f27g9d5JhghOD2OgFKjiNLH
hhzBwzz2innAetUGUI92suwYpXf3MyJqLnXdS9aGOQTT/lS68zMYRzCQvNwebT1K
RzRzzPIywb2oegonGMCc6Y2aokC3dMmlyXaAkzmZD4rgjGjU8Q4i4iAvgqgAsRzu
ZJdWtLqmc9IzFjWLDS1ThvojvXWSqtp/o08teaSw8Wv259svK8sfOm5/2K5zFKdk
AmE9XGUvw/1zolMRomOMUkvvbDH9M7vBzeQbQqPwBBHAnz75HO8=
=4S/7
-----END PGP SIGNATURE-----

--zfSPj0+0wxNpTjLN--


--===============9009579722167363084==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============9009579722167363084==--
