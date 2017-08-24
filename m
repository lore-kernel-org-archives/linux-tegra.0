From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [v2] timers: Fix excessive granularity of new timers after a
 nohz idle
Date: Thu, 24 Aug 2017 10:36:50 +0200
Message-ID: <20170824083650.GA25582@ulmo>
References: <20170815134114.17547-6-thierry.reding@gmail.com>
 <599D3EF6.9030000@rock-chips.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="cNdxnHkX5QqsyA0e"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <599D3EF6.9030000-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: jeffy <jeffy.chen-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--cNdxnHkX5QqsyA0e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 23, 2017 at 04:38:14PM +0800, jeffy wrote:
> Hi Thierry,
>=20
> i hit a compile error with this patch:
>=20
>   CC      drivers/gpu/drm/tegra/trace.o
> In file included from drivers/gpu/drm/tegra/trace.h:68:0,
>                  from drivers/gpu/drm/tegra/trace.c:2:
> ./include/trace/define_trace.h:88:43: fatal error: ./trace.h: No such file
> or directory
> compilation terminated.
> scripts/Makefile.build:311: recipe for target
> 'drivers/gpu/drm/tegra/trace.o' failed
>=20
>=20
> On 08/22/2017 04:43 PM, Nicholas Piggin wrote:
> > +++ b/drivers/gpu/drm/tegra/Makefile
> > @@ -24,4 +24,6 @@ tegra-drm-$(CONFIG_ARCH_TEGRA_186_SOC) +=3D \
> >   	parker/dsi.o \
> >   	parker/sor.o
> >=20
> > +tegra-drm-y +=3D trace.o
> > +
>=20
> maybe we need this:
>=20
> +++ b/drivers/gpu/drm/tegra/Makefile
> @@ -19,4 +19,6 @@ tegra-drm-y :=3D \
>=20
>  tegra-drm-y +=3D trace.o
>=20
> +CFLAGS_trace.o :=3D -I$(src)
> +
>  obj-$(CONFIG_DRM_TEGRA) +=3D tegra-drm.o

Dmitry had also reported this earlier and I think the right fix is this,
which is now in today's linux-next:

commit 702800b5d6f45b18db6b6d6b1057af6fd1c75e20
Author: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Date:   Wed Aug 23 19:13:26 2017 +0200

    drm/tegra: trace: Fix path to include

    The TRACE_INCLUDE_FILE macro needs to specify the path relative to the
    define_trace.h header rather than relative to the file defining it.

    Reported-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
    Tested-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
    Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

--cNdxnHkX5QqsyA0e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlmekCIACgkQ3SOs138+
s6Ek3A/9GlVV5Yu1eG7GKdLNqsdhhgkxxddmN75LH3BR6w5pt3JEXdxPFmJbJ1GJ
rJHYYnDjlt5Pm3TQM2LA7GTTuw5FxkmHYyO0yQ880pb1Ri9NyNFlEJM6cFG2XKt7
ofrdazV+zXaoGyQs8JNi35L25+BqmafEr4FUvq4DVtk3l1YUqvBYOSfO73ncbPo/
NAgrlftnLufd3DhpQczLSjmUh1h5WrzHnJ8Saxr5ss8FXpPygbAmt0I95HRkfYNR
R8JyY+iubB6vKJseXZnUpjPz6mv+YWXUuBtocmdlbkqWAks/ZGnmEJaTAyHpNLCq
ZnP7w/+3F6cHUZe/7j0eN3exK5XNIKPzkIAQeRuXLMX/VZqfgimVPhxw/x2N3WkA
pee2XJA0XugAfOEunc84Mb59yqMNIJi4nxNiUK+HGgaFB2mesSYZwnO27oaBRgmi
9rvzO9R2nbJEMiY5yZf+FqD1j8xbTwQpOfG6Q8A1pLe3WGgTGKni5hlQ1kqSLMvS
/331LKwf0WUiRS0XdMB0pCuykq8a+Y+VznvZOMSPHWsLBBIIxvB5uLgcdcVOCBBl
yWSaYbJPc5Ib68evZp3U9CeETdtPgwpAfGOyGprPZ/HNla82s1q2VEBxO/7pQBRA
Ze57H+6MOAL6sEKy/TEpOscrKjNMqycHEJfKq5sH5/+3zs9HYN4=
=Px3M
-----END PGP SIGNATURE-----

--cNdxnHkX5QqsyA0e--
