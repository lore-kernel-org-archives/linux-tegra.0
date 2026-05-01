Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15FFF79CD;
	Fri,  1 May 2026 00:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777597038; cv=none; b=brgVvhANQvyjNj7pI9HfrwPFUwy3EHrGEIHHqWHaAYNggZ+/ppoX7hVXk8FCXmXr0PS2+JYavj84s6I2pKneUVRFKArTsFs1OIMDN7eKTyoSn1k1rdEo7upJzzCsf4lFfcgshR6IYp+bsJeoehVBNF5/VEWiobK5cFXayuTJP5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777597038; c=relaxed/simple;
	bh=PG9ltAWBLj8EtAjYTgCzT0ZRbzn2Rm/InA+LF3h+xBg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y7+H+Qy/Nv873L9sy8HptognYBkzj3tePysiYXBksZUlCgHOf+bNPopjG8UCpM528Ov49/+aMnXV/0zm1g8T2NL2DI55IjZW6KOOFwpaiHVksRWuMjjo+T0hIFbRT7Nd8uiLx4onKC5WwBcA5+v8j/4KZXOfgqLsRO6+C8uvPyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g4m4RRYB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g4m4RRYB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81DFAC2BCB3;
	Fri,  1 May 2026 00:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777597037;
	bh=PG9ltAWBLj8EtAjYTgCzT0ZRbzn2Rm/InA+LF3h+xBg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g4m4RRYB2N8oxdneirtbwnEec5RVHmYBrsqFf4i2dDPhSDiOjXq2S7+vCOJ5OLuaE
	 65RUkTKmv0cWs9iNSXlFKXgWK3qRHn9o8eTe+aMTXakCvEAs09ov5tdb5a42+YFmge
	 5y7HsATQU+Yst6nuSrp+ynCqYhtxdPwCMAujyLm9A9vVjHU4iB6KwCP7z3JuLj59LS
	 +gifv6MILoCuj0mbEe+AaUKh7o1XWKhMgm2AeJcmg0plHcLly/xifjbgWRkPj2GWFT
	 gTa3ZPda0O7RzEtwAp6pGw4u+wJ8GYTegYCyazhMnEb6ex3YAVkbtSJyKlJBxDdItj
	 R/LgMaIkqG6DQ==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 36FA71AC5860; Fri, 01 May 2026 01:57:15 +0100 (BST)
Date: Fri, 1 May 2026 09:57:15 +0900
From: Mark Brown <broonie@kernel.org>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-sound@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	"open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ASoC: tegra: ADMAIF: allocate with a single kzalloc
Message-ID: <afP6ayAbxtTq6xaJ@sirena.co.uk>
References: <20260430214202.58405-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4tm3J6wD+vEuxauR"
Content-Disposition: inline
In-Reply-To: <20260430214202.58405-1-rosenp@gmail.com>
X-Cookie: 667:


--4tm3J6wD+vEuxauR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 30, 2026 at 02:42:02PM -0700, Rosen Penev wrote:
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
> Consolidate the allocations for capture_dma_data and playback_dma_data
> into a single kzalloc by using a flexible array member at the end of
> the tegra_admaif struct. This reduces the number of allocations from
> three to one, simplifies error handling, and improves memory locality.
>=20

Why is the changelog for this included after the --- as something to be
removed from the commit?

--4tm3J6wD+vEuxauR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnz+moACgkQJNaLcl1U
h9BiWwgAgO6V0o4cZ4mPkLEYlu9A2t7Irt+J3SuuKeZbQ5PfXcGU/ikU/NTfPAgU
x4c0TFnE3YRTuCGwWNJH9BrTYIruO7HGYtmjEAV0yd6Lj1SiRNzk7BmjMPiCo4ZV
KDakfoB+lykPAJuVAktZNF2mNr893rHEY4NrN4LCjqNg2bNb+B94mv155yH6BpMA
zXCO6ZAa8tvdF55sHrg4X5BiYSbkJlg6PRjp8Gh9CTeXS8CezAHnredFKq0XlorC
6CxEvvED7L9I0yYlhvs3n6VlXzGLEJhhqprlGqLuf9MfbH2eYHjhIhqo5ahwssbA
marj+b+nESmMZBfBADvOvjjpJq3wAA==
=vDWH
-----END PGP SIGNATURE-----

--4tm3J6wD+vEuxauR--
