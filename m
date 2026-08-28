Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A19A5450415;
	Fri, 28 Aug 2026 15:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787929682; cv=none; b=iVqxBfiD3MJsqVhoDdAV3igysuZnOol9sIreJDeFgLN3Hu0WCxLYKy02ddI3g54g7opVFI/mPLktdCbfhWtsG9AqNhvtgTmc04XmTrxGu4Z3CwsO2Ku7sfc+XAotHlnVfEe1p0iXnJqBmSy8BZZsY03nM0G+gCgBq6bnHowLnlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787929682; c=relaxed/simple;
	bh=k/qFB1nnnujAgPzCssOCujjmGWkrsUhzjQwh/kkAK84=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WurTK29CTADjydPKb8IjmAAWAzZBl5+tyKBEA16z3jH1btezHYU4ak1Duy37Qk/cEm93PruwULoabv9OzOI/o8r51HIg1O4u6AC4UuBJFBPbjvKcos+Api+AlvW764mMUVDbuK3TirBtXy9KYQkTf8kkoP3QPojOrQFCcam4Brw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nU4QXkpU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nU4QXkpU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4094E1F000E9;
	Fri, 28 Aug 2026 15:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787929681;
	bh=UVAEZSkYMA8nYalGUkjyhlyifXwXdSeY/RtT14FpX8s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nU4QXkpUjrfY/yGDF93vNbV573tsB0XrQXGWhFO6WCrulLiQMZ+9YYhiA35whtr7S
	 iCVS+dIognqG7N7MPxIOpTgfr1+aQpBryQ/sNzP4YxRS5/aZbxTIGRBrAU/Kxv0r0c
	 gywpvGcgannBd/0ihZlLTRiuDPMHObSCQMC4cfuyDYS/gqq5B04DGaCcNqHpyiuRgD
	 8QJKv7xfOHZQnXJVKOMUiyHxl/q/1AFTvssXzl9puxslrdCGl1yNadtvAKRWGMkCiF
	 AjMq0st6Om/sPg5fbNHor1WJws7GaLvXQDGfyJeNGnrDNzriFonj8vyb55/fv6B95I
	 Fae3suubgTizA==
Date: Fri, 28 Aug 2026 16:07:57 +0100
From: Mark Brown <broonie@kernel.org>
To: Thierry Reding <thierry.reding@kernel.org>
Cc: linux-next@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: linux-next: Add Tegra fixes branch
Message-ID: <2753de8c-0154-4780-a645-a67686021dc1@sirena.org.uk>
References: <apGZ3emy2duQxLri@orome>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="WO+wJJy0T4t4vtvE"
Content-Disposition: inline
In-Reply-To: <apGZ3emy2duQxLri@orome>
X-Cookie: Subject to change without notice.


--WO+wJJy0T4t4vtvE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 28, 2026 at 04:28:41PM +0200, Thierry Reding wrote:

> Can you add this branch:

>   https://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git#fixes

> to linux-next, please?

I've updated the configuration, the new tree should appear from Monday.

Thanks for adding your subsystem tree as a participant of linux-next.  As
you may know, this is not a judgement of your code.  The purpose of
linux-next is for integration testing and to lower the impact of
conflicts between subsystems in the next merge window.

You will need to ensure that the patches/commits in your tree/series have
been:
     * submitted under GPL v2 (or later) and include the Contributor's
        Signed-off-by,
     * posted to the relevant mailing list,
     * reviewed by you (or another maintainer of your subsystem tree),
     * successfully unit tested, and
     * destined for the current or next Linux merge window.

Basically, this should be just what you would send to Linus (or ask him
to fetch).  It is allowed to be rebased if you deem it necessary.

--WO+wJJy0T4t4vtvE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqRpEwACgkQJNaLcl1U
h9CZxQf+Nymi/7umP7bwWlMxv/9viwWsZD/AbtUaeT3whL++IOLmrE4CQh1HxhZP
Srt5bn33mQ3AUWWW+lDhtAQGWClSU/4OyxpbqBhltN5eIAmLbiFKJy59GdYlwfgx
Tg311L+Cv90GM5XsdyXRdOZKqsvXH98DiqgxycfTjMH20ZG9EezdWDk/ec4CY4yC
67bfIgVHFPJCpplBV1IOGW+k7rqC/Eq6hD7BKbEVbVzAfetlklO4Bbb/LU3EcnpD
jG8WosHMNpuHAJCeJ0APaeVzfDKFSHPguKAksstN0wQwO22QtDTg327z76UOYt6G
ooZedCgjgLXtjFzRqo6ZjQ9KidkenA==
=GnNT
-----END PGP SIGNATURE-----

--WO+wJJy0T4t4vtvE--
