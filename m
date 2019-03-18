From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 1/5] reset: add acquired/released state for exclusive
 reset controls
Date: Mon, 18 Mar 2019 17:59:26 +0100
Message-ID: <20190318165926.GA30394@ulmo>
References: <20190221152557.8534-1-thierry.reding@gmail.com>
 <20190221152858.GA8652@ulmo>
 <20190318091216.GB14465@ulmo>
 <1552927250.7558.10.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="8t9RHnE3ZwKMSgU+"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1552927250.7558.10.camel@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--8t9RHnE3ZwKMSgU+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 18, 2019 at 05:40:50PM +0100, Philipp Zabel wrote:
> Hi Thierry,
>=20
> On Mon, 2019-03-18 at 10:12 +0100, Thierry Reding wrote:
> > On Thu, Feb 21, 2019 at 04:28:58PM +0100, Thierry Reding wrote:
> > > On Thu, Feb 21, 2019 at 04:25:53PM +0100, Thierry Reding wrote:
> > > > From: Philipp Zabel <p.zabel@pengutronix.de>
> > > >=20
> > > > There are cases where a driver needs explicit control over a reset =
line
> > > > that is exclusively conneted to its device, but this control has to=
 be
> > > > temporarily handed over to the power domain controller to handle re=
set
> > > > requirements during power transitions.
> > > > Allow multiple exclusive reset controls to be requested in 'release=
d'
> > > > state for the same physical reset line, only one of which can be
> > > > acquired at the same time.
> > > >=20
> > > > Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> > > > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > > > ---
> > > >  drivers/reset/core.c  | 139 ++++++++++++++++++++++++++++++++++++++=
----
> > > >  include/linux/reset.h |  93 ++++++++++++++++++++++------
> > > >  2 files changed, 200 insertions(+), 32 deletions(-)
> > >=20
> > > Hi Philipp,
> > >=20
> > > the bulk of this is unchanged relative to what you had posted
> > > originally. I squashed in the few things that we had already discussed
> > > earlier (EINVAL -> EPERM) and a couple of minor fixes for issues that=
 I
> > > found while working with this.
> > >=20
> > > Attached is my fixup patch which contains all the changes I made on t=
op
> > > of your version and that I squashed into this.
> > >=20
> > > Thierry
> >=20
> > Hi Philipp,
> >=20
> > do you have any further comments on this series?
>=20
> Sorry for the delay, I'll have a closer look tomorrow. I obviously don't
> disagree on the implementation and I appreciate the added documentation.
>=20
> As for how to merge this, would you be fine with me providing a stable
> branch that contains the first three patches? That could then go into
> both reset/next and tegra trees.

Yeah, that's fine with me.

Thanks,
Thierry

--8t9RHnE3ZwKMSgU+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlyPzmsACgkQ3SOs138+
s6E60Q/8C+YV1bw2+WoXIgMelxZWByBTkvnpFMiJvB+DtpmqPo04j1H+NJjzYlNn
1NMw/YPhjh4W5153Z1RrtOIHPyzvqs+lpm+rt8i8aT4e2AJGl7x1YcZE7Q8kuBIn
JUpZ2Sth34ErfKemoPCWxd+rDD6YpKjGFEY4FFAlrmLyDXdfNvadbvy/FCMM6vx8
GiX1Z1TKSf0BPvRISGJTO8iOcdZLSzn9xIzTPzcOExZI2Bdx0tsSTrnQU2fcQPbA
/NAdRkBL+cQCnm4QTtmEPbh+ndTop2a3MUHZLkoZVnd13gGYI8kRs4VmxR9ZG/cb
ajsLMZvs/R4xiLJ2OU30EDSLDCoSzzTFt3bhlQY04hV5cH02dwfWZCCMhfkd8WXc
3eM9nC0pyE7PtzsT4jRu9apalWwoCLikSnB8rwAO0KjPKoLh7/jrCqpBPm7TS2/f
FokVAh4QiCpGic3NSUbb9Ndfth1lrpPphrc+qn1sF13OH00fLNNxeqyFzalS7gd9
CJ8b0FRjImsIOJ+c+qhUwP03bnyMdO18KcHnEmGGWo/ODguZuefeOfEanH+tlTCK
8HHr7haJOMJ9vaBT1ZjISikUyyJ3UAzeLpeJp7P/4DjwU61ZrY7SY988QqGGbc6t
PhpH87PXRE40ciezZhyCDPQxVTE4UErE4zUPX3qzOif5oSUj8zE=
=kGHE
-----END PGP SIGNATURE-----

--8t9RHnE3ZwKMSgU+--
