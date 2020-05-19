From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/5] i2c: tegra: Restore pinmux on system resume
Date: Tue, 19 May 2020 18:07:35 +0200
Message-ID: <20200519160735.GB2113674@ulmo>
References: <20200506193358.2807244-1-thierry.reding@gmail.com>
 <20200506193358.2807244-3-thierry.reding@gmail.com>
 <2a0404ac-73bf-2f27-9147-8bef28ae995f@gmail.com>
 <20200508103130.GB3030605@ulmo>
 <f149bb64-e93b-364e-47bc-c851e9638a35@gmail.com>
 <86fee5a3-fe2f-05ab-bc05-1c441d2845e9@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="yEPQxsgoJgBvi8ip"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <86fee5a3-fe2f-05ab-bc05-1c441d2845e9-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--yEPQxsgoJgBvi8ip
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 09, 2020 at 06:35:41PM +0300, Dmitry Osipenko wrote:
> > 2. Could you please explain why I2C driver has to care about restoring
> > the pinmux state? Why pinctrl driver isn't doing that for I2C and
> > everything else?
>=20
> Although, now I see what you meant in the commit's message.
>=20
> Perhaps the "their I2C controllers may have lost the pinmux state in
> hardware" paragraph should be removed from the commit's message because
> it's irrelevant to this patch. The pinctrl state is changed once
> tegra_i2c_runtime_resume() is invoked and it is not about the change
> made by this patch.

The pinctrl state is changed in tegra_i2c_runtime_resume() *only if*
tegra_i2c_runtime_resume() has previously been called. So this patch
does indeed cause the pinmux to be restored, even though it does so
indirectly.

I think that paragraph is necessary to explain that. It's the pinctrl
that doesn't "notice" that the actual pinctrl state has changed from
"I2C" to "idle", so on resume it still thinks we're at "I2C" and won't
try to reapply the same state. Calling tegra_i2c_runtime_suspend() is
making sure that pinctrl explicitly switches to "idle", so that during
resume it will apply the "I2C" state since it is different from "idle".

Thierry

--yEPQxsgoJgBvi8ip
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl7EBEUACgkQ3SOs138+
s6GXww/8C5zoI1u4Lh6LK6fp1jeHnAkYeC+2cxleVMjjcxcuXuAmBVpWXuKemeDy
XdSeO3FqXAQgfa+vY9FwkqFGbEHXIFfHSVQkQdHR8AtrAc4pGx81YIFiBTPxudFW
hikeUdd72nvtVVDJvB5UjNTXtm9Rgn46bKAB6tg8DZ+DeZ5C2YFeiPH2isquWhgn
OaUwU7Ycwovq2g6J4Na8RYdY5CbRdaS1O0jQ1RILYidbpVREQ67IaYDY+FVAamDZ
GCgR+jJdiDERSQHnZ1mTkVa0dMBEkpS0+cGAFcfrScJWHYUPf4+C8bQJWOBUV1P4
CfhIbAmyyObBLDpO6Jc9eWX7UIe2YHR1Ej9gM652I7NZHZBmJGMYyclLSoTj3acW
9hFarojsGlg3s2Ibz4i8qL5dX+DWer8kvzBE/yv0N9k/79xWraKTtsr4QY+znuR8
RUaSP1/sJUiDYjJ4P5Bs0lebNggu33+b0KjkXf2iotpnxQZSn90mT7FYHyi9O/oY
jlBonjGOx5svBj9IEkoIsGUdC4G0dn6CaRq8t2gT3sNfTpa5U/By7MdLyVj+roK9
rUg1aTogGrr2zahmMKgkwjtKnZy9DiSguj+hZ63i0BzNzuCQh/O46PLHAJjdokTh
XoG9q8cVfbVFLWhP+ZbF9F4yHAL6NbnTpgX8UqM5D3mEqJy/EWg=
=Knpt
-----END PGP SIGNATURE-----

--yEPQxsgoJgBvi8ip--
