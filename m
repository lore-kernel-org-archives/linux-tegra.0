From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v6 11/14] memory: tegra: Support derated timings on
 Tegra210
Date: Tue, 14 Apr 2020 18:29:24 +0200
Message-ID: <20200414162924.GR3593749@ulmo>
References: <20200409175238.3586487-1-thierry.reding@gmail.com>
 <20200409175238.3586487-12-thierry.reding@gmail.com>
 <937a1aa6-473a-f6c5-729a-4f34e4ee3abb@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="juwRYO7N74otsfNI"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <937a1aa6-473a-f6c5-729a-4f34e4ee3abb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--juwRYO7N74otsfNI
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 10, 2020 at 05:28:22PM +0300, Dmitry Osipenko wrote:
> 09.04.2020 20:52, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > -enum tegra210_emc_dram_over_temp_state {
> > -	TEGRA210_EMC_DRAM_OVER_TEMP_NONE =3D 0,
> > -	TEGRA210_EMC_DRAM_OVER_TEMP_REFRESH_X2,
> > -	TEGRA210_EMC_DRAM_OVER_TEMP_REFRESH_X4,
> > -	TEGRA210_EMC_DRAM_OVER_TEMP_THROTTLE, /* 4x Refresh + derating. */
> > +enum tegra210_emc_refresh {
> > +	TEGRA210_EMC_REFRESH_NOMINAL =3D 0,
> > +	TEGRA210_EMC_REFRESH_2X,
> > +	TEGRA210_EMC_REFRESH_4X,
> > +	TEGRA210_EMC_REFRESH_THROTTLE, /* 4x Refresh + derating. */
> >  };
>=20
> What about to avoid all the unnecessary renamings?

Looks like I forgot to move the addition of this enum to a later patch.

Thierry

--juwRYO7N74otsfNI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl6V5OEACgkQ3SOs138+
s6GedxAAjMev/glkxqVALMJ3js/+OL+6+tcWF8fwUwt8eeVSB90IejTNv+f0yaGL
agERwBMUH07L0WgF+jp+XFTuKAx1v5FhsF60B30Xh/PpxsMGh8M+nJ3EFDERkzCH
TVVKSuUrx/thQH6OF0Y+iWs1coXD113XNi8KcqNdcSPtSwo9tglvSF/Qb/PPS+4t
/F4+TSNfa3EZk1JZ0JOejJkfIXgJ+Hrkwp8vrhz6Oux7DuZ1vTX6A/ktYuqC+XX/
SDLpOPhnGnhU+BV54+39taQB7k/44cbmmfRgSNdeZUx1yznOAHnsUKvy3IRHq3Bf
8Z0R+2yHTxttx1hiZBMXt5g0Mbek4b5V6NSpWTdW2J6aPmMkiwrQke+M5o+PnYV5
hsB6YVj0qoFVciCfSR1lZSw0qB6e2RibSHkyHC8CiD4qJpJhBfOdXVVGJTLY8lbK
POz8E/LuDaOvCSJf7EhwZ4tUVMOJROzR6WSqaloObQ3s0Bgd0NpS/GWd/LqQLNi/
kFHoHWoFJ0WiuEzNuFjLJ+x/YGIzEChFK5KAPG05RFUyn78pvdmAdfUtMxxuD3cH
KPMzH6+J/1AhszE5mbSRaydbALB0wEMmE5K96anC9ufbe3zGxOKed2q4eYSA853m
gregdGClQ1FEUkDIBiubvqh2DzPhAYz7NnTdY6salzA4mQWoFu8=
=p4SC
-----END PGP SIGNATURE-----

--juwRYO7N74otsfNI--
