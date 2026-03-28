Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 304671A9F88;
	Sat, 28 Mar 2026 00:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774657303; cv=none; b=gSFtlJTyVnOzsZ340uJtf5Ens3acLrfoWyzAC3wlJSrybksxsM3jhvDFl4KDqZbR2OpIQCCaLFskdG3IDKCd0nqDF1WHA2vS1Sai3wiqeOE1m0uBrYadyT3hmpkh1EssN3UR6i4YSBBjwMmVCJsR2wQB2TZuWhbTowBfo7rJiBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774657303; c=relaxed/simple;
	bh=9UTNgnVyZK7CtGzOQ+KTtCnadAUg2Yr+hR6yAC9O7JA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u5WksjhTXC0zn2akrWO8++eOd1ccwGoue/oJYXHNTpDGP5xaYgI27d4Cf1i7oe5ZeOkYpv2NcXcuhz7tUoKat6XEzoN1SFKGuhaDyf7ILpUc9p0nQt1Ycs3AtHPy93/X/Mgcc45LVWlR5w7u9Ww6l/KIQstAg0AK5Jm/kHt7e0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kUnHDJRo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kUnHDJRo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A53B9C2BC87;
	Sat, 28 Mar 2026 00:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774657303;
	bh=9UTNgnVyZK7CtGzOQ+KTtCnadAUg2Yr+hR6yAC9O7JA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kUnHDJRoIxTROjRvSUtoDnoXON2SjhQf7wmoFF1ztRbDiMiRbzRmKcEbiEgnJDdfS
	 okmyTtsnNs1acfoi4Uc9Db2emHl8ajpdX61y1+lcBqqAO4RgP9x+14pMgCb2lpUuAi
	 pZ5Ll+qdK8w+CQa1uDtig9WEKNdDSXhHzPFr+MR4IKXpfEY+rdOqIWoIj17TVq61xk
	 5icQ+7v1k04LPOIGZHEwA4aIo+AYNBrOzb1KGpqFrfUXkW9Rf1A8PyuYXU/ObuejdP
	 LXN6fURy5XTUVBeCPU1YYtqH4MMTE+fnwMF1zATtRwcpS23EI1OibVH64SpaGwVHDC
	 gpCqh/OeuAHsw==
Date: Sat, 28 Mar 2026 01:21:40 +0100
From: Thierry Reding <thierry.reding@kernel.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Oskar Ray-Frayssinet <rayfraytech@gmail.com>, marvin24@gmx.de, 
	linux-staging@lists.linux.dev, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] staging: nvec: fix block comment style in nvec.c
Message-ID: <accc-kOYHllCEnxi@orome>
References: <2026030929-uncheck-reclining-315b@gregkh>
 <20260309220718.6475-1-rayfraytech@gmail.com>
 <2026031833-pampers-steed-4804@gregkh>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kc7lm5gu5ldem5af"
Content-Disposition: inline
In-Reply-To: <2026031833-pampers-steed-4804@gregkh>


--kc7lm5gu5ldem5af
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3] staging: nvec: fix block comment style in nvec.c
MIME-Version: 1.0

On Wed, Mar 18, 2026 at 03:59:43PM +0100, Greg KH wrote:
> On Mon, Mar 09, 2026 at 11:07:18PM +0100, Oskar Ray-Frayssinet wrote:
> > Fix block comment formatting to use * on subsequent lines
> > and */ on a separate line as required by kernel coding style.
> >=20
> > Signed-off-by: Oskar Ray-Frayssinet <rayfraytech@gmail.com>
> > ---
> >  drivers/staging/nvec/nvec.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
> > index e70fafc095f2..0e655f79ea4a 100644
> > --- a/drivers/staging/nvec/nvec.c
> > +++ b/drivers/staging/nvec/nvec.c
> > @@ -659,7 +659,7 @@ static irqreturn_t nvec_interrupt(int irq, void *de=
v)
> >  			nvec_tx_set(nvec);
> >  			to_send =3D nvec->tx->data[0];
> >  			nvec->tx->pos =3D 1;
> > -			/* Delay ACK due to AP20 HW Bug
> > +			/* delay ACK due to AP20 HW Bug
> >  			 * do not replace by usleep_range
> >  			 */
> >  			udelay(33);
> > --=20
> > 2.43.0
> >=20
> >=20
>=20
> This change is not what you documented is changing :(

Hm... this is the 8th version of this patch that I've seen.

I don't know why there was a flurry of these. The checkpatch warning
certainly isn't new, so maybe this was a new wave of janitors or
something? Or maybe people using AI agents to get into kernel
development. Not that it matters much, but it's not a pattern that I've
seen before.

Also, the fact that 7 out of the 8 versions came in after the first had
already landed in linux-next:

  29e79c66b3cc ("staging: nvec: fix block comment style in nvec_interrupt()=
")

suggests that people aren't using linux-next as their baseline. Do we
need to be stricter in this regard? Seems a bit wasteful for you to have
to spend so much time looking at duplicates, even though it seems like
your automation did a lot of the work.

Thierry

--kc7lm5gu5ldem5af
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmnHHxAACgkQ3SOs138+
s6E3KA/9F+uwKMnlyqJx+rSjJN3SkHYQoyqLntwktJN84VteZlbk3CNHLgi1/5Nh
DMs0neW/qzNMmszn6ZavkwfCZ9hde9biVGaoIZfwcXQWD4zipnKC+vW5J3yKtuvb
DsnOGfSxmRH+r7DF1AGJqBDqLqJnuvHmTjHvhscYGNSezjraYBKkK2QyO4l2zXLr
CHtFQp2DRkTOo9FJDK9B9GPA88fzKc8r1MpAR4PdluDrSxpN5G+UzR8eEQWAVfW7
Rn093DrolDNshMwIxaERXD+tRwj7bi/hZkuv9DjUIrBF+7KaWsADvtAjbCL8QCfV
c1VhM7S8FJGpE4zA3duU+ZSCw3b15upFFEUJUX+o80Sm/BK8Ux9sgJ0p6UhA/Xxq
woNLDHWDl+Pf+b1wELSJ1BOs2NR9piKmaHdFi0+ZYZW7ddeBsQ7upwFK8hR5bnIm
BJ7Wq4/EOEollzK7PljUmcRlMjSegl2PgEk2REU9QbZnTnPPqLy8DhkBbv7u74Wn
cvLwxJH79BMHA0yHbBB4ZjzZQyc6YdnDmA3PvqCffPaiGoa6zNPXYZ9fnFMwy0cP
NLQtj1zC3V1v3NwAw2o6HNOXaz1O9r/Ss3tN+yUPRu1XE4cgs5nvO+jvnALdFNXn
7NS7GdFzVH5mT+74Z80oN16LICOimPlv3si43hCFD0qWmfJjfpY=
=q3Kd
-----END PGP SIGNATURE-----

--kc7lm5gu5ldem5af--
