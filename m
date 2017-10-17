From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/4] reset: tegra: check BPMP response return code
Date: Tue, 17 Oct 2017 13:49:10 +0200
Message-ID: <20171017114910.GA684@ulmo>
References: <cover.1504776489.git.talho@nvidia.com>
 <00e7714871d7568e9fc848dc5f76d14e07984a1e.1504776489.git.talho@nvidia.com>
 <20171017104043.GB30589@ulmo>
 <1508237537.6854.8.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="EeQfGwPcQSOJBaQU"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1508237537.6854.8.camel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Timo Alho <talho-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--EeQfGwPcQSOJBaQU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 17, 2017 at 12:52:17PM +0200, Philipp Zabel wrote:
> Hi Thierry,
>=20
> On Tue, 2017-10-17 at 12:40 +0200, Thierry Reding wrote:
> > On Thu, Sep 07, 2017 at 12:31:03PM +0300, Timo Alho wrote:
> > > Add checks for return code in BPMP response message.
> > >=20
> > > Signed-off-by: Timo Alho <talho-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > > ---
> > >  drivers/reset/tegra/reset-bpmp.c | 9 ++++++++-
> > >  1 file changed, 8 insertions(+), 1 deletion(-)
> >=20
> > Hi Philipp,
> >=20
> > Would you provide an Acked-by on this so that I can take it into the
> > Tegra tree? There's a build dependency on patch 1/4 in the series.
>=20
> Acked-by: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
>=20
> to take this via the Tegra tree.

Thanks!

> > Quoting in full since you were not previously on Cc, unfortunately.
> >=20
> > Timo, please remember to always Cc the relevant maintainers.
> >=20
> > Thierry
> >=20
> > > diff --git a/drivers/reset/tegra/reset-bpmp.c b/drivers/reset/tegra/r=
eset-bpmp.c
> > > index 5daf2ee..fac2db6 100644
> > > --- a/drivers/reset/tegra/reset-bpmp.c
> > > +++ b/drivers/reset/tegra/reset-bpmp.c
> > > @@ -23,6 +23,7 @@ static int tegra_bpmp_reset_common(struct reset_con=
troller_dev *rstc,
> > >  	struct tegra_bpmp *bpmp =3D to_tegra_bpmp(rstc);
> > >  	struct mrq_reset_request request;
> > >  	struct tegra_bpmp_message msg;
> > > +	int err;
> > > =20
> > >  	memset(&request, 0, sizeof(request));
> > >  	request.cmd =3D command;
> > > @@ -33,7 +34,13 @@ static int tegra_bpmp_reset_common(struct reset_co=
ntroller_dev *rstc,
> > >  	msg.tx.data =3D &request;
> > >  	msg.tx.size =3D sizeof(request);
> > > =20
> > > -	return tegra_bpmp_transfer(bpmp, &msg);
> > > +	err =3D tegra_bpmp_transfer(bpmp, &msg);
> > > +	if (err < 0)
> > > +		return err;
> > > +	else if (msg.rx.ret < 0)
> > > +		return -EINVAL;
>=20
> I don't really understand why you complicate the call sites like this
> instead of just letting tegra_bmp_transfer return -EINVAL if msg.rx.ret
> < 0, but I haven't seen the other patches.

Timo replied to a similar question from Jon here:

	https://patchwork.ozlabs.org/patch/810934/

Essentially this boils down to that there are cases where we may want to
know the exact error because it is relevant. In this case, we don't, but
BPMP provides a number of other services where the errors may be useful.

Thierry

--EeQfGwPcQSOJBaQU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlnl7jMACgkQ3SOs138+
s6FjFhAAsbFyFBDLEijC0+teD6UUq8O7CVia87tff4kX6RQzH7whsh/mcwAk1s52
OldmFyhpzJ2gi1f9rqWMcTxcAUUMj6ziffYH7conRTgqXiLpl1e7FGBAVCUSeJJ8
u4CWCc7WpdWBcRijr0cwrsV362eY8K32wc3HW0tGqLHLGmYN4ki9rAz3+sRiZFKk
iDnrvbDackR9b3MGZD5uWTL8EEfhv5TdfhKFUTHc+Ut8vxKmqCzLQyqr+6Dj30L6
1f2d4iE2/0+/r+Rjfy93CJ/Gc+ys5hlNJ0gBB/iNel6B90lE8I8cyUhf+TPP1oKB
ER0vP8TmdCaWN3EI+lOfGUHveCm9Hv0BPEnNxBNncf3yUAWDSFmvwaH8xPrT64aG
CUPxkNybjUu5u7+nqZu/WMZUP1C9iNjfWTDfbcsXgmZvjEiJaxeBB9KCgim4nYdn
eA/0iT8MoG46kXPVNWsRNUTz1gM/XgBsj0x12SmKmQ7dusDx96eG2R0mD62GmhbN
jB+zh5oSCaEj2Pj4i+O9DG3QY+pKMkv/8jMScz8gwsjjxar/c96gxgv5a0/miySv
DO6bPDr/YQLu9rL+gSmOqbS9W1nSS1sDiUMiaG5RPN86fg+E1QaS1uZ4jAZj+XVp
6fM28Bi+EhXByeNoJhb1obBZ91QN+y8wYAc2ZotCCTSIUKCa1Uw=
=K9Wf
-----END PGP SIGNATURE-----

--EeQfGwPcQSOJBaQU--
