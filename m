Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D96253603FB;
	Mon, 22 Jun 2026 06:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782111205; cv=none; b=WSoEu+k4/k7OZAzEocbdZvf5nFiP6DtrfEnnn2od/OJuwi/vyfngCASPDWHzvX/ULcKSMgpbpDleZletsL8sZQtUkBYVPUr/VQ+0drSzDoQ4FKAfHEmSTRa0Qds/pNp6hauY/GH5lIMl6VPgXEp+klSY69uL6inBNQ+iDuUN/9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782111205; c=relaxed/simple;
	bh=xJE59v9U/RGuFKGh04E+DKagISo5eJpEWuOn2F38TMI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TyECAsdeKmQwdQmWA8XhjYTYnf0JPtNS3tvd9j39A+1P6OnJdn4+/GmfYiTuULUZKUlHMceHqsyTVjd2iZWSyIJo9Ic72nPZYA/eJXEh3AcYUirGrOBU0utGWDA9Q/IEtXdJ5X/QXVq6dv4fb9iW6ndno8cOEPHpgDpFRZuVZhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PpQ+uHHS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PpQ+uHHS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38E3F1F00A3A;
	Mon, 22 Jun 2026 06:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782111204;
	bh=A2rMRvVyssE3p6tT7auvTCOrg4YHeKw7lUtG12RdRuE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PpQ+uHHSqbDE7paCYFoRa8h/TRgKbyhkDdYv1s5MkFKW+jMI58l5NCnusdjhsOHhA
	 hY1rj2mxfsSHtMV3ERO/X7Jisa5wRiyjPDqrd5jDmh+mF5J5aD4SpsAHAIy+t4qhnU
	 jUGp5vgWLIdl5/qHnizEKGmV0LBTrTwYRlfir9jm0oj+1DoxE9i8hBnkFiYRtE+jE7
	 Swdc9BthzGU+E4E844OWAFO8XM/79+z6y8f8BK5JBGea/SpvBHgNKZcfq5fZsCCAML
	 Xz2KuXyWPiAuFoVR/unC9ln6Ar/FSIgwNsRTspOnA7dvG5UpTfDAwKqVm22erbkdwV
	 486LWQuBj4dIA==
Date: Mon, 22 Jun 2026 08:53:22 +0200
From: Thierry Reding <thierry.reding@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, Arnd Bergmann <arnd@arndb.de>, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soc/tegra: pmc: fix #ifdef block in header
Message-ID: <ajjbi8xTqeUFHQRt@orome>
References: <20260618143654.2102062-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xfkmufg626wjqu2u"
Content-Disposition: inline
In-Reply-To: <20260618143654.2102062-1-arnd@kernel.org>


--xfkmufg626wjqu2u
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] soc/tegra: pmc: fix #ifdef block in header
MIME-Version: 1.0

On Thu, Jun 18, 2026 at 04:36:50PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>=20
> When build testing on ARM without the PMC driver, the other drivers
> fail to link:
>=20
> ld.lld: error: undefined symbol: tegra_pmc_core_domain_state_synced
> >>> referenced by regulators-tegra30.c
> >>>               drivers/soc/tegra/regulators-tegra30.o:(tegra30_regulat=
or_balance_voltage) in archive vmlinux.a
> >>> referenced by regulators-tegra20.c
> >>>               drivers/soc/tegra/regulators-tegra20.o:(tegra20_core_rt=
c_update) in archive vmlinux.a
>=20
> Adapt the checks in the header to cover both cases on other architectures
> and without PMC.
>=20
> Fixes: 8318af5dd29c ("soc/tegra: pmc: Move legacy code behind CONFIG_ARM =
guard")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  include/soc/tegra/pmc.h | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)

Heh... guess that was just one combination too much for me. Thanks for
catching this.

Thierry

--xfkmufg626wjqu2u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmo42+IACgkQ3SOs138+
s6EeUxAApmtf8l1/tWZrDXnqsQAzhcsEJpUhNQZI0mE8m1Nn+nCBBUAVFKDcIZkn
9vzHRRDfr0DMOb53UgjU1BE6f5FqOf6FVfBOTuQ05ScJ/c58vrcv1U7REwEW80hh
08boUn0KnP0TgrDgS/aTyABn07oBAki2QGTRZmchJawfKhBIjpsXObV/NJVXMGxh
jp/NdcAOab4f4bjiQU7QchEKhnhW5CDJwz//HIkEWOL2HSk6nDTfhn8g/8B0Wohs
+2YhL91eYh4p+Dfwt44Eq9exoFPoGBCWFzxVWo/SlQ/p5ffO/fatGv1VjPvBGoDN
K/MX0+EoH+Zc3FQak1Ju1Gk6AqJEL3+xxPFVMvzLsEAOR1WamKvYA2sK02BvyJvI
OL0J9v1Y86mKmLuD17PngFPSpI1jw0OOXqPY+sDeifP8XaXdmK52UG9Co8NuECl8
koWOgardhCcvWc5yIgvZJzQMJwLtWr4UJTlIaXIjqfVoHTa3noej75lqbAllbyFQ
JggwcFwduOmawkFGgogvB8YWrQPaXEmZMNY6bR7FsJeW8x16GYetFlyFU1X7Ziit
yIKXiA+895bC6pNeWEdVBwgy3j7Wh6BzfQwYDc9bbfo4vgDAKUjuyofsHwFqnwph
zeygOkIC0D97sG9i03yeDLOXBXH4uL31LohPUS+XTXA3aaUQTp0=
=GDrZ
-----END PGP SIGNATURE-----

--xfkmufg626wjqu2u--
