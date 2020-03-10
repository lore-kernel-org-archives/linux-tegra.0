From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v5 5/8] memory: tegra: Add EMC scaling support code for
 Tegra210
Date: Tue, 10 Mar 2020 18:13:38 +0100
Message-ID: <20200310171338.GF3079591@ulmo>
References: <20200310152003.2945170-1-thierry.reding@gmail.com>
 <20200310152003.2945170-6-thierry.reding@gmail.com>
 <4ea3a96f-52cb-4eab-cf92-932f6882ad85@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="NGIwU0kFl1Z1A3An"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4ea3a96f-52cb-4eab-cf92-932f6882ad85-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--NGIwU0kFl1Z1A3An
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 10, 2020 at 07:43:12PM +0300, Dmitry Osipenko wrote:
> 10.03.2020 18:20, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > From: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >=20
> > This is the initial patch for Tegra210 EMC frequency scaling. It has the
> > code to program various aspects of the EMC that are standardized, but it
> > does not yet include the specific programming sequence needed for clock
> > scaling.
> >=20
> > The driver is designed to support LPDDR4 SDRAM. Devices that use LPDDR4
> > need to perform training of the RAM before it can be used. Firmware will
> > perform this training during early boot and pass a table of supported
> > frequencies to the kernel via device tree.
> >=20
> > For the frequencies above 800 MHz, periodic retraining is needed to
> > compensate for changes in timing. This periodic training will have to be
> > performed until the frequency drops back to or below 800 MHz.
> >=20
> > This driver provides helpers used during this runtime retraining that
> > will be used by the sequence specific code in a follow-up patch.
> >=20
> > Based on work by Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>.
> >=20
> > Signed-off-by: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > ---
> > Changes in v5:
> > - major rework and cleanup
> >=20
> >  drivers/memory/tegra/tegra210-emc.c | 1952 +++++++++++++++++++++------
> >  drivers/memory/tegra/tegra210-emc.h |  893 +++++++++++-
> >  2 files changed, 2390 insertions(+), 455 deletions(-)
> >=20
> > diff --git a/drivers/memory/tegra/tegra210-emc.c b/drivers/memory/tegra=
/tegra210-emc.c
> > index 80ea14d1e6ce..4ea8fb70a4fd 100644
> > --- a/drivers/memory/tegra/tegra210-emc.c
> > +++ b/drivers/memory/tegra/tegra210-emc.c
> > @@ -1,6 +1,6 @@
> >  // SPDX-License-Identifier: GPL-2.0
> >  /*
> > - * Copyright (c) 2015-2019, NVIDIA CORPORATION.  All rights reserved.
> > + * Copyright (c) 2015-2020, NVIDIA CORPORATION.  All rights reserved.
> >   */
>=20
> Would be nice to avoid all the unnecessary changes, like the one above
> and then all the code's removals/reshuffling.
>=20
> Such that a new patch was a clean addition to a previous patch, instead
> of a re-write.

I think this is the result of me messing up a rebase. The EMC driver
changes added in the clock driver patch should've been in this patch,
which would've made this a clean addition. I'll reshuffle the code
for the next revision.

Thanks for pointing that out.

Thierry

--NGIwU0kFl1Z1A3An
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl5nysIACgkQ3SOs138+
s6HEAA//QmK3t4ukt87828r7Nv2SwiHTTaa2Ye2D+MviiW5gQGuejM71cG0f1yVD
pRfZtF83Vw0y8rITa25HiCjM+qCBk8ZaHMgokgXgSPW1t3Ata4aoCnjyGlFfNSGX
SM8DmMt7zFLdoVgjV4oWgk16CnbwamqmCvTGLrIObnvilJMD1EGaJpAgliom5DJt
VHsxit2CGv2jsEkHsBvqpUq2Vfe959FiiCQoQwyf8uYaMM7RWhYKTTDGhi0y0Wdb
Xktq0/448CK9QW2jj/rWfmFLCOt0NnuYK3rFf3ldtDsYkFfUu4iqn5rt3u9XxqCo
+1g8vUzEc+1peAUeTSO/GjtiTEx2qcE2W0yx2AikAejEM/qNwR5VopkInSclClKl
Cv5JAg10mHFJCySzZqTiKojCgllnj/WHvgN3UJER+hYsBQ3Vx1qTAQ2gVymlHVyq
2ee70J8KN5sQj43sQ+4WlwjtrtT03ORmdLCwL6gUhQZM/JfblDIJ0YE8Cvd+QMWk
utuXITH33f+CJcu7OrYOapFUqwTyyXOyXbJpnegYlYtqoygZ8GRWsr1aIIAP3Nht
0yGpo0lxdGeAt6jqqYgABOMwWphCsJ5ihofV5RhecXyFAVlLt+9HlWgXH9LSKONl
fD/QqzKMIPOWdmBkSfavRfK1pb+hqFcHlwpoin67t1H026CexQs=
=+3N+
-----END PGP SIGNATURE-----

--NGIwU0kFl1Z1A3An--
