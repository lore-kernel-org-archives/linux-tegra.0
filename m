From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: Re: [RFC PATCH v1 4/5] media: tegra: Add Tegra Video input
 driver for Tegra210
Date: Thu, 30 Jan 2020 13:20:55 +0100
Message-ID: <20200130122055.GA2584455@ulmo>
References: <1580235801-4129-1-git-send-email-skomatineni@nvidia.com>
 <1580235801-4129-5-git-send-email-skomatineni@nvidia.com>
 <20200129111340.GF2479935@ulmo>
 <070f9a4c-1919-f3f6-fef3-ed0a84cf5776@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="J2SCkAp4GZ/dPZZf"
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <070f9a4c-1919-f3f6-fef3-ed0a84cf5776@nvidia.com>
Sender: linux-clk-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>
Cc: jonathanh@nvidia.com, frankc@nvidia.com, hverkuil@xs4all.nl, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--J2SCkAp4GZ/dPZZf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 29, 2020 at 09:23:38AM -0800, Sowjanya Komatineni wrote:
>=20
> On 1/29/20 3:13 AM, Thierry Reding wrote:
> > On Tue, Jan 28, 2020 at 10:23:20AM -0800, Sowjanya Komatineni wrote:
[...]
> > > diff --git a/drivers/staging/media/tegra/host1x-video.c b/drivers/sta=
ging/media/tegra/host1x-video.c
[...]
> > > +	media_device_init(&cam->media_dev);
> > > +	ret =3D media_device_register(&cam->media_dev);
> > > +	if (ret < 0) {
> > > +		dev_err(cam->dev, "failed to register media device: %d\n", ret);
> > > +		return ret;
> > > +	}
> > > +
> > > +	cam->v4l2_dev.mdev =3D &cam->media_dev;
> > > +	ret =3D v4l2_device_register(cam->dev, &cam->v4l2_dev);
> > > +	if (ret < 0) {
> > > +		dev_err(cam->dev, "V4L2 device registration failed: %d\n", ret);
> > > +		goto register_error;
> > > +	}
> > > +
> > > +	dev_set_drvdata(&dev->dev, cam);
> > > +
> > > +	ret =3D host1x_device_init(dev);
> > > +	if (ret < 0)
> > > +		goto dev_exit;
> > > +
> > > +	return 0;
> > > +
> > > +dev_exit:
> > > +	host1x_device_exit(dev);
> > There should be no need to call host1x_device_exit() when
> > host1x_device_init() failed because the latter already takes care of
> > undoing whatever it did already.
> >=20
> host1x_device_init can fail if any of its client ops init fails.
>=20
> So, calling host1x_device_exit here to undo the things done in other
> successful client init ops.

host1x_device_init() already takes care of undoing what it did on
failure. Also, it makes sure to only undo what had already been done,
rather than tear down every client, even if it hadn't been initialized
yet when the failure happened. The latter is what would happen if you
called host1x_device_exit() to cleanup at this point.

Thierry

--J2SCkAp4GZ/dPZZf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl4yyiQACgkQ3SOs138+
s6Egvw/+Nt0LgFzPcflJKTBtvEJ+MNiUId+X2Lhb9zZ6HgVKJ2WZqabYUUydRq7a
RePVuSe28Q9GPY7XIBS5qLsaglkrI4TqELRyOFzBwrhFGg14XQbeMGs84IDTLfd+
okiQvOORTCHDzhYfyYU1Fn62+IVzAV5hXsMfYDKo1U43JgocUfwDlateRn7E47HI
T/sQbQ7/AlxY+9pWPy+pBErXZ+PxbbHnotTlM1pCYO3aQIueOJwUo3PpXiUg1oSa
DtFxxh4Ez8dfOpb5JEU35/URi2yUNlFGuuAb6d7rAVwQXm9bcIdUZcnwd7ICUSD8
qiZo88c/s9qb8niupzp4kWP1oq6ddk0QWQ+tin3Pk5mtp3+6OXZLzwYYnYBI+UXm
y4tcfSLc5jMn9VpLg3aH5cZjPGBg6Iv3Elku0+iIZQLBO48A1YRd5g1+uDjl2D/g
3Ee0mA/zX6XcjAj0OJm/tM14mNgQTrORC3xZ1uY/4iYrvFPaP/yO+4ijaxo5bWhX
qsJmfubdA5Uz9Fp3TLkiBsXuiJ/3yJV3NCG6Ci86nFhGBBjsbYBYite+k2O3sPNU
s8T6yjyIPnSF1eJPZpr0BUVgR2FMc8saU3Hyy38qpTDGbAREiMHidYG2u7FigvAS
NV5GHdLs4DAUf58P5f2EVPmVVVqzhxgC4kUaaP1HHGvJGJUVflc=
=kfTx
-----END PGP SIGNATURE-----

--J2SCkAp4GZ/dPZZf--
