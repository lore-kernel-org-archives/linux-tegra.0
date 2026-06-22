Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7031524BBEB;
	Mon, 22 Jun 2026 07:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782113047; cv=none; b=hWkmm9U6c6bCzzCgLRF4nTmO0wEUqcVNuFwDFz8X+HT1B7X67bo1ltwEaSxKNOexe9srl6iC5MskeNfPyqWSl83nykgHItjRcl5VRhIGu15a0TPtwylVULNtyk22QyvCxJTBCnwjGXwuf5NJq07lrYPxOSLEJz9V/WdUT+TsPRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782113047; c=relaxed/simple;
	bh=o7zcFKJWtJroVuk3/irWEsNy2qOtZC1nUvhYDKFUzYA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EicIfuP7GoeDCFHOOefkY4unz3hPTvAK1IkpZbxrn4euLJRy5y9KKJpO7x4w5TATd62Ijp4iTSCZ8shbCzXW5xyrsxFjv3cQjxAkMUAUc4IA83kI1KevEXeUYplW9py1Xc/Ku7y2elgH4ZPgEgAsO0MR7CVA7kiqn6hcgylWdrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dNtmchRD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dNtmchRD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FC4B1F000E9;
	Mon, 22 Jun 2026 07:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782113046;
	bh=Yin5P1NCTxzImSQPhZOUF3w34OplqtJ7ZRzDT1eUnTI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dNtmchRDRiWH+5Q91oTikez7+0USZxZOHRO0E9XxQqlZ1pTFn6v7ch7qr6NVEqi8K
	 Dt8lOWiJZFy9b7Dvv0bgBVARAReuv8zOQSFkEhFcT0w3vBZ5i3JuXc2fYYT16grE9t
	 ReyvN1D/WJeehtzo73oMjcQOFI9ninjPYYCYoFb7qsfhb/pD10xZjgXZMIG2EOMmHI
	 IFsOEQfKHcxAqGHbX/lqvoyPuw+qdpoL5qKrNJpUZ/GwLPUNfouN0uBOIIdIkGfewz
	 0cMHs635tYUHuh/G1XFs1W7xCOMhbPPQCnAbV71odg6dGCHp1F+9ETlKMrGTI85fOj
	 jdAa4z9QPq5ig==
Date: Mon, 22 Jun 2026 09:24:03 +0200
From: Thierry Reding <thierry.reding@kernel.org>
To: Breno Leitao <leitao@debian.org>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, 
	Dmitry Osipenko <digetx@gmail.com>, Thierry Reding <treding@nvidia.com>, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH] soc/tegra: fuse: Fix spurious straps warning on SMCCC
 platforms
Message-ID: <ajjfgOLpDXuVHpI0@orome>
References: <20260604-tegra_warn_fix-v1-1-78522c852340@debian.org>
 <ajAa4JAXyssMpr1R@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fgqw2ypldyvannkc"
Content-Disposition: inline
In-Reply-To: <ajAa4JAXyssMpr1R@gmail.com>


--fgqw2ypldyvannkc
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] soc/tegra: fuse: Fix spurious straps warning on SMCCC
 platforms
MIME-Version: 1.0

On Mon, Jun 15, 2026 at 08:32:25AM -0700, Breno Leitao wrote:
>=20
> On Thu, Jun 04, 2026 at 03:36:17AM -0700, Breno Leitao wrote:
> > My Grace host started to show this warning:
> >   WARNING: drivers/soc/tegra/fuse/tegra-apbmisc.c:120 at tegra_read_str=
aps
> >    tegra30_fuse_add_randomness
> >    tegra30_fuse_init
> >    tegra_fuse_probe
> >=20
> > tegra_read_straps() warns when the static "chipid" cache is still zero,
> > using it as a proxy for "APBMISC has been initialised". However chipid
> > is only ever populated lazily by tegra_read_chipid() when it reads the
> > APBMISC register.
> >=20
> > Guard on apbmisc_base instead, which is set unconditionally in
> > tegra_init_apbmisc_resources() for all platforms and is already the
> > sentinel used by tegra_read_chipid().
> >=20
> > Fixes: c71f213fa5af ("soc/tegra: fuse: Warn if straps are not ready")
> > Signed-off-by: Breno Leitao <leitao@debian.org>
> > ---
> >  drivers/soc/tegra/fuse/tegra-apbmisc.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/soc/tegra/fuse/tegra-apbmisc.c b/drivers/soc/tegra=
/fuse/tegra-apbmisc.c
> > index 87ae63a7e52d..7aba7c58bad0 100644
> > --- a/drivers/soc/tegra/fuse/tegra-apbmisc.c
> > +++ b/drivers/soc/tegra/fuse/tegra-apbmisc.c
> > @@ -117,7 +117,7 @@ bool tegra_is_silicon(void)
> > =20
> >  u32 tegra_read_straps(void)
> >  {
> > -	WARN(!chipid, "Tegra ABP MISC not yet available\n");
> > +	WARN(!apbmisc_base, "Tegra ABP MISC not yet available\n");
>=20
> Hello Thierry,
>=20
> Have you had a chance to look at this one? This is showing up in my
> Grace all the time.

Yeah, sorry for the delay. You're right in that we now get the warning
until we end up calling tegra_read_chipid(). However, I don't think the
Fixes: reference is right. I think this started showing up after:

  8b8ee2e56f95 ("soc/tegra: Use ARM SMCCC to get chip ID, revision, and pla=
tform info")

I don't think we accounted for tegra_read_straps() in that case and I
suspect that we're not seeing this elsewhere because we do end up
calling tegra_read_chipid() earlier in DT systems whereas for ACPI it
might only get called at a later point, if at all.

There's also this patch:

  https://lore.kernel.org/linux-tegra/20260514051252.2401568-1-kkartik@nvid=
ia.com/

IIUC, that's the only place where tegra_read_straps() gets called on
ACPI systems. Would you mind testing that patch (without the one that
we're currently discussing) to confirm that that's the only callsite?
It doesn't really matter either way, because applying your fix here is
the right thing to do, but it'd still be useful as a data point.

If you don't have any objections, I'm going to replace the Fixes: line,
but otherwise this patch looks good.

Also, I'm going to check if we can get some better coverage in our daily
testing for the ACPI platforms. Do you happen to run any daily tests on
your systems for linux-next?

Thierry

--fgqw2ypldyvannkc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmo44w8ACgkQ3SOs138+
s6FQMg/8DMHt9b5zHEMgFUu+Ar0CgYGc6LMdKqUd0hF4Qz9zZLJxdlW4H6cvkcZD
ccz2rrDzelDMlBLJk+/70R5nYTROQ00L+VOwJj7fwrMORKxAh0mtuLZzQEkCCwF+
emc/kKjN07JEUO7TtDjXkXUtr7uQB4x4gM8UAQ0zXzbu4D8WrVYbAjWLDRxJlag6
Zd6+vtVh9fprH0AqN4XV+qFnTSPFRY03wvQe5waZn59twYqCF+6SzUeo33FsZi/f
mvGe3s88qkpLdMH47jm4q+UU7pTLIXEEOu1aaBpfRlNzlnBCxBTrgJus/JP8CTzE
xEfXg7qKvbKxLEflp5RZ6Z6mv9/qRywU9AL62M2LGA7wPDOsKYJwfUGbFCl97RDN
mH2eh+TdHyX0pzg+19cwiRURK6Xq0nWo7EkNITbbnXf7pr3szytYoleRwQZQQyb1
geruwnWy1Yw+jLM9cE5B4xaLzppHLY4DWMls2WmPFUEh4JvSBtN2JDyEehHdbBP7
BPKt3q4r5SCwEVaJ309rzjuTYbJ+jEtqRzCzmideokI0h8LwhmK/tcugQF0FlL0D
kYDm//H5taXpbyK3ShOksp19qAm0EhTiPrj9dy6W9YTaC535DzvFqBha4eUsVQYw
S3lCl5YTrMxxD6VLIKK0fhMUxg+g+pQSig/32CDqZKNsk0C1Xik=
=rHb+
-----END PGP SIGNATURE-----

--fgqw2ypldyvannkc--
