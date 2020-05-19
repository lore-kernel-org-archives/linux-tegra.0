From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/5] i2c: tegra: Restore pinmux on system resume
Date: Tue, 19 May 2020 17:57:28 +0200
Message-ID: <20200519155728.GA2113674@ulmo>
References: <20200506193358.2807244-1-thierry.reding@gmail.com>
 <20200506193358.2807244-3-thierry.reding@gmail.com>
 <2a0404ac-73bf-2f27-9147-8bef28ae995f@gmail.com>
 <20200508103130.GB3030605@ulmo>
 <f149bb64-e93b-364e-47bc-c851e9638a35@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="dDRMvlgZJXvWKvBx"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <f149bb64-e93b-364e-47bc-c851e9638a35-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--dDRMvlgZJXvWKvBx
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 08, 2020 at 06:00:57PM +0300, Dmitry Osipenko wrote:
> 08.05.2020 13:31, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> ...
> >> Is it legal to touch DPAUX registers while DPAUX is in a suspended sta=
te?
> >=20
> > DPAUX is never runtime suspended and the dependency from the I2C
> > controller on DPAUX should ensure that they are suspended and resumed in
> > the right order during system sleep.
>=20
> 1. Could you please explain why DPAUX is never suspended? Isn't it a
> problem?
>=20
> It looks a bit odd that driver is doing this [1][2]. RPM is supposed to
> be used for the *dynamic* power management. Should we remove RPM usage
> from the DPAUX driver?
>=20
> [1]
> https://elixir.bootlin.com/linux/v5.7-rc4/source/drivers/gpu/drm/tegra/dp=
aux.c#L524
> [2]
> https://elixir.bootlin.com/linux/v5.7-rc4/source/drivers/gpu/drm/tegra/dp=
aux.c#L591

Looks more like the intention had been to eventually enable dynamic
power management but I never got around to it. The runtime PM
implementations are what's necessary to runtime suspend the device,
so all that should be needed is hook up the pm_runtime_get() and
pm_runtime_put() calls correctly.

> 2. Could you please explain why I2C driver has to care about restoring
> the pinmux state? Why pinctrl driver isn't doing that for I2C and
> everything else?

We could probably do it either way. I did it this way because the
runtime suspend/resume will get called either way, so might as well
reuse the same code paths rather than add context save/restore.

Thierry

--dDRMvlgZJXvWKvBx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl7EAeQACgkQ3SOs138+
s6GxKA/9F1d7M5zu28FG0E8bt+oxWhTeupG07NNioVF1IUKq6TKzLAcMcRIiJ6tk
QKxlEEEQJRdzGQ49rX0WZE6Qanqy3tf3id32rS6vbna4mIImdaWt1jAGLICubLus
689DsfyFIGHiZCdcbsCC23Mpa3YkQm6fcet1ymObfV8WjMGgr8H2sCqkzC2xX//a
KXlXUdA6GEXsrWx9NJIvk+U7+M0o7mraj6hM7lm4Qy6eNSu/NhvPibZ+IDGEBbJY
daGf//ugxAp5/byoK6v09XJUniI2sXQhoMx8zBgnTitAOwiubNd3Mjd4hgiHRTu/
+OBECb1vyTNizvSCb61qNqpMABTS+NymosVCTSwxDyqmlFwW9TKexO2Rsd31o05P
s2oaMQjAdrcwXSbS6XImANfnUBfVhw0RQu0Nc3Gr21+oKnXyGnIEdUlY6nKYKWIg
XckwfFytvCK51L/xdzDhsTUUCbcUxNMWwTDot3Ul5DPYrvzBK41Cya8Z8Ik+w7rf
9KzJ9FBnnLs3TZ5c+7quEEGlUGNpyj5CNQvjXMW1ib9F44vH0BJ0bCtEPEWMlimO
2JkI2iDdRQ1zQUV9gnvXI1WuwdoibNkDO1PAuQGvIY3XzsqzyKaDxW+DERTXeriZ
AWjBe000xllVPEvZMYhcxDdgNvbbxgMLMJtVvICxKW50F7w9wRY=
=Osjb
-----END PGP SIGNATURE-----

--dDRMvlgZJXvWKvBx--
