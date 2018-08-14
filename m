From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] soc/tegra: pmc: fix child-node lookup
Date: Tue, 14 Aug 2018 16:24:54 +0200
Message-ID: <20180814142454.GB21075@ulmo>
References: <20171115094458.31666-1-johan@kernel.org>
 <20180322142432.GA5853@ulmo>
 <20180813143317.GI24218@localhost>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="O5XBE6gyVG5Rl6Rj"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180813143317.GI24218@localhost>
Sender: linux-kernel-owner@vger.kernel.org
To: Johan Hovold <johan@kernel.org>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Mikko Perttunen <mperttunen@nvidia.com>
List-Id: linux-tegra@vger.kernel.org


--O5XBE6gyVG5Rl6Rj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 13, 2018 at 04:33:17PM +0200, Johan Hovold wrote:
> Hi Thierry,
>=20
> On Thu, Mar 22, 2018 at 03:24:32PM +0100, Thierry Reding wrote:
> > On Wed, Nov 15, 2017 at 10:44:58AM +0100, Johan Hovold wrote:
> > > Fix child-node lookup during probe, which ended up searching the whole
> > > device tree depth-first starting at the parent rather than just match=
ing
> > > on its children.
> > >=20
> > > To make things worse, the parent pmc node could end up being prematur=
ely
> > > freed as of_find_node_by_name() drops a reference to its first argume=
nt.
> > >=20
> > > Fixes: 3568df3d31d6 ("soc: tegra: Add thermal reset (thermtrip) suppo=
rt to PMC")
> > > Cc: stable <stable@vger.kernel.org>     # 4.0
> > > Cc: Mikko Perttunen <mperttunen@nvidia.com>
> > > Signed-off-by: Johan Hovold <johan@kernel.org>
> > > ---
> > >  drivers/soc/tegra/pmc.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > Applied, thanks.
>=20
> I noticed this one still hasn't made it into linux-next. Looks like it
> wasn't included in you 4.17 pull request and is still sitting in the
> tegra for-4.17/soc branch.

Indeed. Looking at my tree it seems like I applied this to for-4.17/soc
a couple of days after the signed tag for the pull request. It probably
should've gone into a for-4.18/soc, or perhaps into fixes pull request.

I've cherry-picked it into for-4.20/soc now. Thanks for the reminder.

Thierry

--O5XBE6gyVG5Rl6Rj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlty5jYACgkQ3SOs138+
s6Et9hAAnZ04tRIizkcPqVJmHyaTRnw4dedbCFiKwJCInlc/o6l8lj9+g52bazTb
1tbqzzrMqVT1zWtILFZsoPKDXE5OMOv98twCGZEwIJ6Got6w5TsJbI0ctPhdL2Be
B+nUNM0wAOyaQluqhHSWikJJEvkHZ6rftXUwzQMVhwxVEh01QzIwRW/jGHDB6Twe
a06gnfKHGCqhZm4Qb5aeA4mUopTbad5VCrXclWAXGMcfUQA/KV2BKz7Stj0dTWlA
Q09/CPgMFnBTqCR1n3Pd2HZp0H8TAx3YopQr1r6SGsiZdh/udjvmIoo2Ih4GFXy7
pN5y/kjiuOKrsjx3FkmAxwN8SkJfi4BwzsL7ACpsqr5cXJJLmuQguotjm5q20fSQ
4Be+SrOPt91eeLEDIrXO5Zgs0O3HmGjpzBBsZZQuzbMa009lQPGyOqVjN85trx2o
73lrfZKdecVEOVQivaiHdLX8QTeSVbgm79HSdnQjSrTh1SfmuGpJIwAJczIj+l6l
l9PCnznTGQiQoLpBpXnEgjZEKE1KQa/rJxZBhbTk/D7fqFMJkklexXW5o6pkS7sN
fOsZXeldMXvhdkxH53fZOUBj6nX/8if+jqLa9wGSIW4Z03Ic/tgTM7reC72EjqYT
SmB46t/mz4qG1bph2pVeax6+bogJS6SfW9eiLAGztrCgczEwXAg=
=Usxc
-----END PGP SIGNATURE-----

--O5XBE6gyVG5Rl6Rj--
