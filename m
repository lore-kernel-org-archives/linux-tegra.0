Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BE95331A67;
	Mon,  5 Jan 2026 16:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767631669; cv=none; b=Oapgu+6SbK5RSsrJ1S75u+CQ1OFntaD7DvNMT+FU9Xnl3P4XZEFG3pxVhrO89UTEkqqxOC28EfJaXLt4F3uZgfDvBe/Nc3y/nnJm/hVpzFq+whS90ZUP7GYIY2ikFgqijQIOnddCr1/3pLDG2TFjGGyqZOf90EkfJD9btbpMpjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767631669; c=relaxed/simple;
	bh=ZiJrrEY9P9FpfATo28nJ11jflRNk+YNVn+ZFqq9fLjg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ieweug9pX3fz8sGlFj9U+zovdLlHXGMlcOH0QeQJsFKZ/5LxH4piFzGWUw0CN6YC1rRP4nuzLYn8K1+yR2X9sFCHjOOwev7fjC5HgxmTpTzOitzCsuNGSicEikQaA/pTy3INZnE/QD69dzwOVMfRl9J8oGVdr02Op6UMwHQC1cM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LYDRbEjQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LYDRbEjQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E13CC19425;
	Mon,  5 Jan 2026 16:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767631667;
	bh=ZiJrrEY9P9FpfATo28nJ11jflRNk+YNVn+ZFqq9fLjg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LYDRbEjQgP2Asfn/x/gNHx0H/dSoyL9YaCywJKqXf3tajVXwIhW6qQa84DASWdWvc
	 KlLnBw7ZPkkPspa4P25TZ/tzSM69XhO+JvSJLPO2ASgAI/imFz2e5ze9P28XE0Je7n
	 VG3NprNzHutKqd8gPrub59ZQm3jAMvs1q9uIFJVdtoKtcUzB1gPqmx7ROcnRIrYy+h
	 fflBRt+1T3Pe3FKZoqIzsr+IsOa0QgEu7SuJr2YNoviO7yD8SKKKKPFKxQbLDZSSxf
	 UChBhlsDMEB+yEh8aTbma2m/iUfpvB/Rug/EZpEn8/a78HeQCxtE7rU/fMfOJOA133
	 wK8RGf0KilPFg==
Date: Mon, 5 Jan 2026 16:47:42 +0000
From: Mark Brown <broonie@kernel.org>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: "Sheetal ." <sheetal@nvidia.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] ASoC: tegra: Revert fix for uninitialized flat cache
 warning in tegra210_ahub
Message-ID: <23b9831e-e52e-4959-a9ab-70a234d2f1ab@sirena.org.uk>
References: <20251217132524.2844499-1-sheetal@nvidia.com>
 <41cb1bac-5503-4765-b45a-200963448e5a@nvidia.com>
 <f44287d4-2f76-409d-b537-038896c5bc59@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZE7vn+Pl0qm1pY4z"
Content-Disposition: inline
In-Reply-To: <f44287d4-2f76-409d-b537-038896c5bc59@nvidia.com>
X-Cookie: So many women


--ZE7vn+Pl0qm1pY4z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 05, 2026 at 04:06:22PM +0000, Jon Hunter wrote:

> Now we are into the new year, I just wanted to send a reminder for this f=
ix.
> We need to get this revert into v6.19.

Please don't send content free pings and please allow a reasonable time
for review.  People get busy, go on holiday, attend conferences and so=20
on so unless there is some reason for urgency (like critical bug fixes)
please allow at least a couple of weeks for review.  If there have been
review comments then people may be waiting for those to be addressed.

Sending content free pings adds to the mail volume (if they are seen at
all) which is often the problem and since they can't be reviewed
directly if something has gone wrong you'll have to resend the patches
anyway, so sending again is generally a better approach though there are
some other maintainers who like them - if in doubt look at how patches
for the subsystem are normally handled.

--ZE7vn+Pl0qm1pY4z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmlb6y4ACgkQJNaLcl1U
h9Aktgf/YskRTy3ysPw73JSAw7OD5tgVrt8/5YkXInt0AIlzMRt+PJit8lDcwK9/
/oomtffPqj9k/qoQjmNlOEQsWArX0215RBFmuuw55UU5ptqqPH2o3Qie9xB0aILh
qTdKiCDy18abjkR8cqMHyhPPYkoZc5zHjgHTkovH05tTE3lXEl2Uow98RdP3/wIl
yGuftO0fw0b9A5Jbtkg0l4XOHeeVPe5lzOUPnjhjZ9H1FmzFzJiHVjiQlHzNGIBK
Ocv8sM4P3fMJD3eqH0SpU4wo5lMx6TY0F/INsSF8lyYIveYMMMdySiSExMqQ63xl
jF+MzzKhGjYCnBZWslqincodZc5nlw==
=xSa6
-----END PGP SIGNATURE-----

--ZE7vn+Pl0qm1pY4z--
