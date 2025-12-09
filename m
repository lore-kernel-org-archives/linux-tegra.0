Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 415D620ED;
	Tue,  9 Dec 2025 01:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765242083; cv=none; b=J87y7oQ6vi/HOoESJcN2tvyROu/hjEt5mZ9nOxKXzNzPiQT6d75k5d3hc99fxaeW5vojitWQp5KGlSRb8vjPkZSdptxsCuj6N6fP9+SBIYojqsxp8qPTXtFUCUcAlc/tZ4v7s8kvoDvmVHy60eXnZ5W+Bc31kdvSTQSyxQQvhXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765242083; c=relaxed/simple;
	bh=Wkh8WRXTyXA3al+0N7oykuiGqkemLNYSOkxyYHfS5NY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aL15th03CFoBTxlE8gJxgtPzqfu8CPaLLfkVtwKQedcKroaME8EIvzbO6Ij0rILJc03L6ugnDxwLu3+0Ne8Jhmr4HjsKDaCmOO4wvB78QT2D1BnOdjqxkv4380/h6/L6oa/om5Z5eUvzX82+pUveoueT8qjqrIVhoTiq88hYzxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cz2oey7a; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cz2oey7a"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94832C4CEF1;
	Tue,  9 Dec 2025 01:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765242082;
	bh=Wkh8WRXTyXA3al+0N7oykuiGqkemLNYSOkxyYHfS5NY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Cz2oey7aJH34nfxoYDFqgsbbDU1xL9lhX5J1YAN/rUJMaI1BLejiJT2gxL+gjtqzG
	 LUmfD8sHSFEYk2n5XO2eBKTFnR7JMrCCR5JFKEOe3sFiqvt9IvnJlW6GGTBxZtBbF8
	 e6mKlEUA0j/tp5r0GvF/uytEkcGK7kYTbESPsMvx74cdoPf/OxXumapAQ7ug6hhTBN
	 ydxiR07yDgrGJsvx3kWW+xC2WSKgN4X15fTGsV4ZRHVoFdDhA3bgggDWDrmPouOJS+
	 IO9W1v0HlH7ZZmowqmusxK22NUCU3G/uABxEd7g6hLoD9GQoGVmaDy2Tb5B+sHbZ+X
	 Ipmc36l6qQb5g==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 34B901ACB951; Tue, 09 Dec 2025 01:01:16 +0000 (GMT)
Date: Tue, 9 Dec 2025 10:01:16 +0900
From: Mark Brown <broonie@kernel.org>
To: Sander Vanheule <sander@svanheule.net>
Cc: "Sheetal ." <sheetal@nvidia.com>, linux-sound@vger.kernel.org,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: tegra: Fix uninitialized flat cache warning in
 tegra210_ahub
Message-ID: <aTd03OxYFeRtvoU-@sirena.co.uk>
References: <20251208052040.4025612-1-sheetal@nvidia.com>
 <3c8b0ff11a7b5bcc26c2e99b7369cb50d48621ec.camel@svanheule.net>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/WAReHNCRpGeELmn"
Content-Disposition: inline
In-Reply-To: <3c8b0ff11a7b5bcc26c2e99b7369cb50d48621ec.camel@svanheule.net>
X-Cookie: It's clever, but is it art?


--/WAReHNCRpGeELmn
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 08, 2025 at 09:57:01PM +0100, Sander Vanheule wrote:
> On Mon, 2025-12-08 at 10:50 +0530, Sheetal . wrote:

> > The tegra210_ahub driver started triggering a warning after commit
> > e062bdfdd6ad ("regmap: warn users about uninitialized flat cache"),
> > which flags drivers using REGCACHE_FLAT without register defaults.
> > Since the driver omits default definitions because its registers are
> > zero initialized, the following warning is shown:
> >=20
> > =A0 WARNING KERN tegra210-ahub 2900800.ahub: using zero-initialized fla=
t cache,
> > this may cause unexpected behavior

> > Switch to REGCACHE_FLAT_S which is the recommended cache type for
> > sparse register maps without defaults. This cache type initializes
> > entries on-demand from hardware, eliminating the warning while using
> > memory efficiently.

Like Sander says we can't just do this without checking that the driver
isn't relying on the fact that the cache ends up defaulting to zero
initialisation, that's the whole reason there are two separate cache
types here.

> > Fixes: e062bdfdd6ad ("regmap: warn users about uninitialized flat cache=
")

> I disagree with this tag. The commit is working as intended by giving a w=
arning.

Yes.

> This device's reset state happens to match the zero-initialization of the=
 flat
> cache, so there were no issues here. An earlier version of this sparse fl=
at
> cache indicated a potential problem with another driver, so there are lik=
ely
> drivers out there that do need fixing:

The driver could also just provide the defaults FWIW but there's likely
to be little practical difference.

--/WAReHNCRpGeELmn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmk3dNkACgkQJNaLcl1U
h9C3Jgf/Z6Po5PVge50POLhiU8PI42c1SORDYxAW39DlrYJv3+xMW9YBZ6LUjRUQ
uDU38rDcJozU8ruSXJs4gtupm8+t5Lh5X70bcdGkrcdPBpD6yED1kgIJ6o0a8bV5
Wqa+3RGd1uva3d8boMyvYCM9G6mc8skEhVCltVd1fXwatFAs7s3s6y2krQfEt4XH
bf5oQJxfZnBdv6E/91yfyr9g8aiJXATzj0hVNYoYWbdxjJUysqFUy+8ZetDtaqSP
tviXvHOOCECaA8eH3JRGItQDSxI737QFlUUOT5LnIvWfk4b/Rv+WKj9ByKQnGERQ
KbxHaAufB4XwIFrV0vD+I4YT7CvaSA==
=+TQK
-----END PGP SIGNATURE-----

--/WAReHNCRpGeELmn--
