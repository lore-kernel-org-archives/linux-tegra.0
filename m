From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] soc/tegra: refactor soc_is_tegra()
Date: Wed, 21 Nov 2018 15:43:20 +0100
Message-ID: <20181121144320.GA6446@ulmo>
References: <20181121141204.22819-1-tiny.windzz@gmail.com>
 <2d534bbb-7b75-8521-bf88-36b52c918d19@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="M9NhX3UHpAaciwkO"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <2d534bbb-7b75-8521-bf88-36b52c918d19@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Yangtao Li <tiny.windzz@gmail.com>, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--M9NhX3UHpAaciwkO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 21, 2018 at 02:34:57PM +0000, Jon Hunter wrote:
>=20
> On 21/11/2018 14:12, Yangtao Li wrote:
> > of_find_node_by_path() acquires a reference to the node returned by
> > it and that reference needs to be dropped by its caller.soc_is_tegra()
> > doesn't do that, so fix it.Call of_machine_is_compatible() to refactor
> > soc_is_tegra() whcih automatically manages the reference count.
> >=20
> > Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
> > ---
> >  drivers/soc/tegra/common.c | 12 +++++++-----
> >  1 file changed, 7 insertions(+), 5 deletions(-)
> >=20
> > diff --git a/drivers/soc/tegra/common.c b/drivers/soc/tegra/common.c
> > index cd8f41351add..0b40700b672a 100644
> > --- a/drivers/soc/tegra/common.c
> > +++ b/drivers/soc/tegra/common.c
> > @@ -22,11 +22,13 @@ static const struct of_device_id tegra_machine_matc=
h[] =3D {
> > =20
> >  bool soc_is_tegra(void)
> >  {
> > -	struct device_node *root;
> > +	struct of_device_id *match =3D tegra_machine_match;
> > =20
> > -	root =3D of_find_node_by_path("/");
> > -	if (!root)
> > -		return false;
> > +	while(match->compatible){
> > +		if(of_machine_is_compatible(match->compatible))
> > +			return true;
> > +		match++;
> > +	}
> > =20
> > -	return of_match_node(tegra_machine_match, root) !=3D NULL;
> > +	return false;
> >  }
>=20
> Ugh ... sorry, I thought that of_machine_is_compatible() looped through
> the matches. OK, let's stick with your initial fix.

Actually I prefer this one. Even if it is slightly more verbose, I think
it's much clearer what's actually going on. Also this hides all of the
OF node reference counting in a core function, so it's worth the extra
line, in my opinion.

Thierry

--M9NhX3UHpAaciwkO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlv1bwUACgkQ3SOs138+
s6Eksg//TwuKgBqk1HtsPEhiWVFzTb5mDYtG8SXlwIO1sLcdML57mPszrfU9Og9J
H+XTtiJobofywHxbEmkKBstNx+DOe5T4B8nnvVFpeyvraN+1Jsey2lkt04+rh7en
UfAlPgtWdhif6BKObnvlBv7L1wkYOWQYfF3HNCafnjxMgLBsImjbpq90PU50ykgT
bnfDI2ArcrwpbL+WIHmWETLGIHdNJ2BGQMweMdYTgZyh5J5VVkvBc/L5TqLkk06M
aclKBhRCc1XgULqTmLmXpBFeAKtFakSjivqJyoowrAaGo0hoiAeaRe53pqknvGU9
j8T4pAT8RK5rC3luRjz7qTJrKAqVrarIVAZS+mh1Flv1c4Yl7gTmFUGVWCnn595v
0EACE8YSgxGKONXySC3Pmd2upWHbf+ZLg5RErkL9TYwqgHuG61RpyzaiMqNDLWlt
2cSz9MQw4VktnvFJwSqOBKCYEQKGPG5HlQsABQ//LSDpsHETyc/arj8kW+JKNzvd
NgFs7SNWdlpeHb4BKIy34zMwaSL079MFIa772G4xmlMt1GLIdwEae4syMbvl/4c8
i8yCPyIe/Mni+n43GLpCx0cvrVUSJLMoNobWxW+BVW1HBHJp4zn9u1lICHYohxas
SW9U0DrK2SBRyhXxnQP+px0uW3HriWYyzEXggKeTndseSWW4nds=
=rH1v
-----END PGP SIGNATURE-----

--M9NhX3UHpAaciwkO--
