From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v5 2/8] clk: tegra: Export functions for EMC clock scaling
Date: Tue, 10 Mar 2020 18:08:32 +0100
Message-ID: <20200310170832.GC3079591@ulmo>
References: <20200310152003.2945170-1-thierry.reding@gmail.com>
 <20200310152003.2945170-3-thierry.reding@gmail.com>
 <8e1f11e9-a95a-500f-ff44-6f44ad990863@gmail.com>
 <1ac24caf-e4c1-b20e-4c3d-97b328a97ea5@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="7gGkHNMELEOhSGF6"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1ac24caf-e4c1-b20e-4c3d-97b328a97ea5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--7gGkHNMELEOhSGF6
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 10, 2020 at 07:16:15PM +0300, Dmitry Osipenko wrote:
> 10.03.2020 19:13, Dmitry Osipenko =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > 10.03.2020 18:19, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >> From: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >>
> >> Export functions to allow accessing the CAR register required by EMC
> >> clock scaling. These functions will be used to access the CAR register
> >> as part of the scaling sequence.
> >>
> >> Signed-off-by: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >> ---
> >> Changes in v5:
> >> - remove tegra210_clk_emc_update_setting() which is no longer needed
> >>
> > ...
> >> +EXPORT_SYMBOL_GPL(tegra210_clk_emc_update_setting);
> > ...
> >> +extern void tegra210_clk_emc_dll_enable(bool flag);
> >> +extern void tegra210_clk_emc_dll_update_setting(u32 emc_dll_src_value=
);
> >> +extern void tegra210_clk_emc_update_setting(u32 emc_src_value);
> >=20
> > Why these exports are needed given that the EMC driver is built-in?
> >=20
>=20
> Also, seems changelog doesn't match the patch itself.

I don't understand. These functions access the EMC clock's registers in
the CAR.

Oh... are you referring to tegra210_clk_emc_update_setting()
specifically? Yes, it looks like I forgot to remove the implementation
for it. I only removed the prototype.

Thierry

--7gGkHNMELEOhSGF6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl5nyY8ACgkQ3SOs138+
s6FE0g//Yhx1IIFBW0cnxGdopt71ts3wwH28AgKUyvq0sqSSrXWDcQ4rzkMotYBS
Q+sqXngUYZxTMuMJNxnOWs9GHE6jWAcUJYQVX1yZL5LRkraSL9GHZQkKA2UYpxU6
juV+JuOnUNMzb3Q9JtbZbxxRIgh+Sc90/ikKsMHaHzK5womAbxy1WDIrddBplgpq
VqtprZ5a7mQU4pi8i199lOEPhxuTX9AecjGthoplAOuCQtWrwIg+vYX1DdJkC5W9
j3IJeVryWM5KgJMx1PEmOE8+/66o1jcp4WACHK+cuNYc243vjMsAqi0AE3Ypyj9+
EbQ0YvZReoY9SIKQ7pyUg4lAgeSkf9E84e8+EWXXvm4g1+e5DqVbjxBJwsdWBK2b
ubflw4Wq5wsDWTT33Vqt2yXSEYNQETUckPjb8n3+Wh53BfeSMxKFvNhtDOwWGiMB
XI5JzInL10lMiXiB9z3/W/xC3C8roZRop9ihtvG8ImbpjHmkH+apWmcKpiKsIF7u
FNLjHK5G2hHJG+zamTFb2LVh3Btj/ZNmdMp0k49qR4W38FyEKPY9J0WKQGC+npnj
w7DS4a1Hw43+h1gbPZi0T+MzRc7zH74qHE9po7RyHBeQSEI5oCX/uVhDsZ7o2tyq
ELLmiPSibKQWaxcm3lloD8Duwqv0HUsnH+6zmnWiPFJPhHvmlw8=
=1/1K
-----END PGP SIGNATURE-----

--7gGkHNMELEOhSGF6--
