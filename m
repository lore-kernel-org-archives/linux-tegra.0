From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] drm/tegra: dpaux: Fix transfers larger than 4 bytes
Date: Mon, 20 Jul 2015 11:35:59 +0200
Message-ID: <20150720093558.GT29614@ulmo>
References: <1437374978-1330-1-git-send-email-thierry.reding@gmail.com>
 <CAOvMTZiuq=qesVD9PYuePz2zAKqh_m-1FbBZwBa6S4CLHv7mvw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="nDmTXYS4kVhtHHfR"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAOvMTZiuq=qesVD9PYuePz2zAKqh_m-1FbBZwBa6S4CLHv7mvw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Steev Klimaszewski <threeway-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--nDmTXYS4kVhtHHfR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 20, 2015 at 02:39:36AM -0500, Steev Klimaszewski wrote:
> On Mon, Jul 20, 2015 at 1:49 AM, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> wrote:
>=20
> > From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >
> > The DPAUX read/write FIFO registers aren't sequential in the register
> > space, causing transfers larger than 4 bytes to cause accesses to non-
> > existing FIFO registers.
> >
> > Fixes: 6b6b604215c6 ("drm/tegra: Add eDP support")
> > Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > ---
> >  drivers/gpu/drm/tegra/dpaux.c | 18 ++++++++----------
> >  1 file changed, 8 insertions(+), 10 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/tegra/dpaux.c b/drivers/gpu/drm/tegra/dpau=
x.c
> > index d6b55e3e3716..a43a836e6f88 100644
> > --- a/drivers/gpu/drm/tegra/dpaux.c
> > +++ b/drivers/gpu/drm/tegra/dpaux.c
> > @@ -72,34 +72,32 @@ static inline void tegra_dpaux_writel(struct
> > tegra_dpaux *dpaux,
> >  static void tegra_dpaux_write_fifo(struct tegra_dpaux *dpaux, const u8
> > *buffer,
> >                                    size_t size)
> >  {
> > -       unsigned long offset =3D DPAUX_DP_AUXDATA_WRITE(0);
> >         size_t i, j;
> >
> > -       for (i =3D 0; i < size; i +=3D 4) {
> > -               size_t num =3D min_t(size_t, size - i, 4);
> > +       for (i =3D 0; i < DIV_ROUND_UP(size, 4); i++) {
> > +               size_t num =3D min_t(size_t, size - i * 4, 4);
> >                 unsigned long value =3D 0;
> >
> >                 for (j =3D 0; j < num; j++)
> > -                       value |=3D buffer[i + j] << (j * 8);
> > +                       value |=3D buffer[i * 4 + j] << (j * 8);
> >
> > -               tegra_dpaux_writel(dpaux, value, offset++);
> > +               tegra_dpaux_writel(dpaux, value,
> > DPAUX_DP_AUXDATA_WRITE(i));
> >         }
> >  }
> >
> >  static void tegra_dpaux_read_fifo(struct tegra_dpaux *dpaux, u8 *buffe=
r,
> >                                   size_t size)
> >  {
> > -       unsigned long offset =3D DPAUX_DP_AUXDATA_READ(0);
> >         size_t i, j;
> >
> > -       for (i =3D 0; i < size; i +=3D 4) {
> > -               size_t num =3D min_t(size_t, size - i, 4);
> > +       for (i =3D 0; i < DIV_ROUND_UP(size, 4); i++) {
> > +               size_t num =3D min_t(size_t, size - i * 4, 4);
> >                 unsigned long value;
> >
> > -               value =3D tegra_dpaux_readl(dpaux, offset++);
> > +               value =3D tegra_dpaux_readl(dpaux, DPAUX_DP_AUXDATA_REA=
D(i));
> >
> >                 for (j =3D 0; j < num; j++)
> > -                       buffer[i + j] =3D value >> (j * 8);
> > +                       buffer[i * 4 + j] =3D value >> (j * 8);
> >         }
> >  }
> >
> > --
> > 2.4.5
> >
> >
>=20
> This fixes the issue that I reported earlier, so feel free to add my
>=20
> Tested-by: Steev Klimaszewski <steev-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>

Great, thanks.

Thierry

--nDmTXYS4kVhtHHfR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJVrMD+AAoJEN0jrNd/PrOhDsEQAKLxL2sn5bcmkpgTUAvAmRoJ
jpjusV7iPAK4PJv4ER+QgaKoMXwkJ58liMijYzztCeLsu+fMvcGcScFLFUWKYEMg
aqdQd1ejWDQGj+9qqsk4PiM88vbfdveTMzeeWO6IbPjssjBAApk9b4YW8I5wSEzk
X62PVi9MN0uZBtrxMw0HCPng70dvw9j1lL7Ebm411oMfAG2Cch/O4PfKrMlAHZRq
3rwc3rQTiCJtywGQoHwULcP9aQRwkAIrA/rXKjMuoainDdR4xufysXXxGb2Nrjc+
ratjiIpRg/scbVMMi4pVfQyonh7j8iuBQMikS/0/ZX5YPkGBOE7dEnAhBkj8KuEF
fkmGav1yT6vJz2SpwbheTSghfYxyiWqTAbCXOYKZN0BrBvCD6D+nwo2tm1ZymeIv
Mw3XasdTtrS/iKdhgtrtt382AzFAHMsr8S5yoXXbOyvzC94mkM6v4tjx+0vMxyVh
ImNZS2xcrUuywyCIBWGARLYM3c6ojchUN1jgtPPYoYBN7DTCIGj8d9Zg3AU/R6eV
fpz6upKSGOX1mVlZUYfBcUVHN2BOuzPuI1wIU6c3y+NhMm2xk1dEb0jaAJZMiSkl
v+KNkl7L6ilNTOVBeF2fGHQ2sSKxue1/wc+fZT4n6++hZoSEI6PJTa7mPxPTuL3g
sCeC0c1dr127NHcMIWoc
=9DjN
-----END PGP SIGNATURE-----

--nDmTXYS4kVhtHHfR--
