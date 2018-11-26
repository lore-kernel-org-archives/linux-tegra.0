From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 1/7] gpu: host1x: Resize channel register region on
 Tegra186 and later
Date: Mon, 26 Nov 2018 16:30:13 +0100
Message-ID: <20181126153013.GC19710@ulmo>
References: <20181123123138.20739-1-thierry.reding@gmail.com>
 <CAKb7UvhRuSxYWxn8_avXEu+0WduaYrTJ+uVcXP85HbAzi6gDhg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0498060268=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CAKb7UvhRuSxYWxn8_avXEu+0WduaYrTJ+uVcXP85HbAzi6gDhg@mail.gmail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Ilia Mirkin <imirkin@alum.mit.edu>
Cc: linux-tegra@vger.kernel.org, jonathanh@nvidia.com, dri-devel <dri-devel@lists.freedesktop.org>, mperttunen@nvidia.com
List-Id: linux-tegra@vger.kernel.org


--===============0498060268==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="TiqCXmo5T1hvSQQg"
Content-Disposition: inline


--TiqCXmo5T1hvSQQg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 26, 2018 at 10:11:39AM -0500, Ilia Mirkin wrote:
> On Fri, Nov 23, 2018 at 7:31 AM Thierry Reding <thierry.reding@gmail.com>=
 wrote:
> >
> > From: Thierry Reding <treding@nvidia.com>
> >
> > The register region allocated per channel was decreased from 16384 bytes
> > to 256 bytes on Tegra186 and later. Resize the region to make sure every
> > channel (instead of only the first) is properly programmed.
> >
> > Suggested-by: Mikko Perttunen <mperttunen@nvidia.com>
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> >  drivers/gpu/host1x/hw/channel_hw.c | 7 +++++--
> >  1 file changed, 5 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/host1x/hw/channel_hw.c b/drivers/gpu/host1x/hw=
/channel_hw.c
> > index d188f9068b91..95ea81172a83 100644
> > --- a/drivers/gpu/host1x/hw/channel_hw.c
> > +++ b/drivers/gpu/host1x/hw/channel_hw.c
> > @@ -26,7 +26,6 @@
> >  #include "../intr.h"
> >  #include "../job.h"
> >
> > -#define HOST1X_CHANNEL_SIZE 16384
> >  #define TRACE_MAX_LENGTH 128U
> >
> >  static void trace_write_gather(struct host1x_cdma *cdma, struct host1x=
_bo *bo,
> > @@ -203,7 +202,11 @@ static void enable_gather_filter(struct host1x *ho=
st,
> >  static int host1x_channel_init(struct host1x_channel *ch, struct host1=
x *dev,
> >                                unsigned int index)
> >  {
> > -       ch->regs =3D dev->regs + index * HOST1X_CHANNEL_SIZE;
> > +#if HOST1X_HW < 6
> > +       ch->regs =3D dev->regs + index * 0x4000;
> > +#else
> > +       ch->regs =3D dev->regs + index * 0x100;
> > +#endif
>=20
> Just an observation ... this makes it impossible to build this module
> for multiple host1x hw revisions in the same kernel. I believe that
> supporting multiple platforms is frequently desirable, but perhaps
> there's more going on here (like arm64 vs arm32, etc).

It actually does work. If you look close enough this file is included
multiple times by generation specific source files. It's sort of like
a template if you want.

It's not a design that's entirely to my liking, but it's not been a
strong enough itch to scratch for me to have gotten around to changing
how it works.

Thierry

--TiqCXmo5T1hvSQQg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlv8EYQACgkQ3SOs138+
s6GB0Q//S6xDndnUo+0FKk0aFJ+6Q4fnjHAG8gQZ+ip640d81uZDO66VQAtDIPEX
KVehn+gKiybSnKMbgj/oqkIpqBMsHPkP/oaeAHq2DhFePWfoeXy+bakNvm7e+MZw
Beplt1ckHhLk/487g1feUjWcEDIT57W43R0CKvP030JSWJbJWgZK+xxtyaRgbj52
QQjuogbaiBo/mG2Fy2Y5nOpXQCL1XJsu/965tLxPU+IgSX+w0Tgf7v6ZWHf01wed
Vomb67rFR7ZAECMmESdvRtZ4jOxl/KP+LLu/MhPUDqGeEIbuPczqyc8/F0QDeuag
aAYzDCr1uoiz4DoaGcByqQZnEPiB4lFboovsmhQRL+JLK2b0l8W0lY/XnaWJ/n+V
HeUpB5LRlv0FogVdhd/DYTx/lJMc3UzG9MgYfj6x3wHpSb466vxryy3DccP4lAgP
mhJROeyT2e/zTCR2RdRO8csR6PxzZxpRY0EL6Lm3EpVvCpDZdCxS1yj9qKSnsV8v
bRkvjRWL34qql5iqPD/ix7AKaSBiFnXxLFdN1weUsKeHBx7XZHavbvGqRtfm2ah9
4izzCaM262BemXbTb6EAIzUXs4rUBO2m6751Kh5oZzFun2GutJeWCEurcZqCsVLl
3UBKVWl6ZLwmp/6Q1c+Jn1wpwGFUhcVoJSbvgRFo+z5LlmEJj3U=
=65c7
-----END PGP SIGNATURE-----

--TiqCXmo5T1hvSQQg--

--===============0498060268==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0498060268==--
