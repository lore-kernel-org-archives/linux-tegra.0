From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 3/3] soc/tegra: fuse: Add Tegra132 support
Date: Fri, 9 Jan 2015 11:05:12 +0100
Message-ID: <20150109100510.GF27845@ulmo>
References: <1420701887-1465-3-git-send-email-thierry.reding@gmail.com>
 <1420707308-6974-1-git-send-email-thierry.reding@gmail.com>
 <CAAVeFuKbnquF0iBp4L8Sv4tp-F3YevKjaSkVtyT2LJnDDvXCbg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="9ADF8FXzFeE7X4jE"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAAVeFuKbnquF0iBp4L8Sv4tp-F3YevKjaSkVtyT2LJnDDvXCbg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Paul Walmsley <paul-DWxLp4Yu+b8AvxtiuMwx3w@public.gmane.org>, Vince Hsu <vinceh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--9ADF8FXzFeE7X4jE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 09, 2015 at 12:49:25PM +0900, Alexandre Courbot wrote:
> On Thu, Jan 8, 2015 at 5:55 PM, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>=
 wrote:
> > From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >
> > Tegra132 is very similar to Tegra124 from a peripheral point of view and
> > uses the same fuse controller.
> >
> > Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > ---
> > Changes in v2:
> > - add missing break in Tegra132 case for legacy fuse init (Vince Hsu)
> >
> >  drivers/soc/tegra/fuse/fuse-tegra.c   | 1 +
> >  drivers/soc/tegra/fuse/fuse-tegra30.c | 3 +++
> >  2 files changed, 4 insertions(+)
> >
> > diff --git a/drivers/soc/tegra/fuse/fuse-tegra.c b/drivers/soc/tegra/fu=
se/fuse-tegra.c
> > index 011a3363c265..c0d660f1aaac 100644
> > --- a/drivers/soc/tegra/fuse/fuse-tegra.c
> > +++ b/drivers/soc/tegra/fuse/fuse-tegra.c
> > @@ -81,6 +81,7 @@ static const struct of_device_id car_match[] __initco=
nst =3D {
> >         { .compatible =3D "nvidia,tegra30-car", },
> >         { .compatible =3D "nvidia,tegra114-car", },
> >         { .compatible =3D "nvidia,tegra124-car", },
> > +       { .compatible =3D "nvidia,tegra132-car", },
> >         {},
> >  };
> >
> > diff --git a/drivers/soc/tegra/fuse/fuse-tegra30.c b/drivers/soc/tegra/=
fuse/fuse-tegra30.c
> > index d1a4290cda5c..9e3679594259 100644
> > --- a/drivers/soc/tegra/fuse/fuse-tegra30.c
> > +++ b/drivers/soc/tegra/fuse/fuse-tegra30.c
> > @@ -184,6 +184,9 @@ static void __init legacy_fuse_init(void)
> >         case TEGRA124:
> >                 fuse_info =3D &tegra124_info;
> >                 break;
> > +       case TEGRA132:
> > +               fuse_info =3D &tegra124_info;
> > +               break;
>=20
> Nit, but why not
>=20
>         case TEGRA124:
> +       case TEGRA132:
>                 fuse_info =3D &tegra124_info;
>                 break;

Yes, that's even better.

Thierry

--9ADF8FXzFeE7X4jE
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUr6fWAAoJEN0jrNd/PrOhZTgP/16zmYUnYvEQajHzxIqDhPbQ
NVBWHCZgHKpHUggBCH82g2+u7pKzfcv6TY2MC+FEe7SWI9Izups3VmoRdfooO1Ic
TWD1aZpBihjfwKNXQUws7bZC7qdSzxM14aaOBGxFhiXz3c1gKIgQ6a5GOyMnDWXb
tPUCsZ9aZjUCMJU7s7ysLhg/kQlMDCEZhszGrtQ0xS4q6I0ZvP7QvcN+olZWodQt
dI8EQOe5pEWLJ1r5mZ9wNkgtbJONJgDw4hnlpIOTu+tJUqMmR9cbmfg3S3vNweLg
gwZDQwwmUSObI23/q7xJfVDXjkuWHUfq1xHxrKwW5IY/9Rollm6igNoyMvbZjaYu
NcULRlcTb9I+e8APprYZIi3M6Std6G5kjgRV56SZo6RJ0aeaIJJg96Pr0tOd1idm
2YAODXl+C6kDoqQSq8jVDWN52TMPMU0LGEZcB6HWkqAAVarhpULiAFdb1CBsNuf+
omZz9GvvdEayziB+ZTAyhOI/9z5rLirePKa/lvrMpue8i7OsDrQvN5KphQSyJnAT
a/WiPMO33vsNu0njTs1wax2u/seILM8GR+rA9Li1YJN51F9AF88ynmyJuirz68xz
acdNmGTdEhGOjElxXdR9266ROtPJDyb2cvqL7Yrah464YYZJCtRJDFIlqDsiY3Za
E/jskYzf/Y1lLMNZbQbx
=lKgv
-----END PGP SIGNATURE-----

--9ADF8FXzFeE7X4jE--
