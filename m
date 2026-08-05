Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07B953DBD51;
	Wed,  5 Aug 2026 07:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785915608; cv=none; b=RkMXUm0x6lpdh7mEkMBAOV2ZPlOF42XkcT/qo/GGl7Oo8K3+M+c8qzsETUPowcSDzYsQ8kBHTDQX1BfvHnR7Ae0rMX3/DwidvS6jPIZ7/wttmuhG6MBQDa2P6g8TH7FJqomN5hsiazgqE0NYM1hiSr+D5jkKRzcG5DGbSsJ65Is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785915608; c=relaxed/simple;
	bh=LLOMEYospUj8og+7in+AdW+YQltpZVn5CXPOBd5McYc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Sqf2MSeD3hpvGqo82pHx1JdIL9etoCWAnflVxgHFsXAzJC/KPHe0I352FKZjt7Fu/47D2LldzAKs2oVlTnjnsu+qE/v9d/6cIONePgHp0OLcnnve8teF0bIfvuZr27vbLaKpTEJYpJFw5w5yrzRDMg7A5WkBDBUH06MmF4RFLAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l5iQ19hM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l5iQ19hM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E381F1F000E9;
	Wed,  5 Aug 2026 07:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785915606;
	bh=6EVAAQQ00JF1xOm7PUVTyUvqKjAm1WAWarJjcWRlgHc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=l5iQ19hMMY0php0gdRwFgomaBPxewxGHlNlx/At0QXZMibwCfXhWyg0KTCecnnrIy
	 nQxFrHEQXGoPrnxfSW1c+g5cxBKgl2lwUYLo3OmMIbkwfK6vCAhwBpze/ohOkHL+aW
	 KXHeMB7GgOwnyOVlhmdl/w7UhSDtdmSXUfOMgaFq1ALd/MetzLzm6ZpJ/n1RJnBR5H
	 mUB5ZIxeF32ft97wsmAc0/xoq6vUiOdApXNWN6t4FrxK5p51IX3eIutcp0eH69fJNb
	 dvuczSowlLncg9MS5lOzq1yKNe9XFK/miXIRiOJsFdDLg9YJALtuDZ/5tMZR0ol4jf
	 hvRIQhk3M1bjw==
Date: Wed, 5 Aug 2026 09:40:03 +0200
From: Thierry Reding <thierry.reding@kernel.org>
To: Jinhui Guo <guojinhui.liam@bytedance.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Kartik Rajput <kkartik@nvidia.com>
Subject: Re: [PATCH 1/2] soc/tegra: fuse: Return -ENODEV for unsupported
 legacy SoCs
Message-ID: <anLnFvF8slRICc6R@orome>
References: <20260804121910.4961-1-guojinhui.liam@bytedance.com>
 <20260804121910.4961-2-guojinhui.liam@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vh6hi6mdbexesfye"
Content-Disposition: inline
In-Reply-To: <20260804121910.4961-2-guojinhui.liam@bytedance.com>


--vh6hi6mdbexesfye
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 1/2] soc/tegra: fuse: Return -ENODEV for unsupported
 legacy SoCs
MIME-Version: 1.0

On Tue, Aug 04, 2026 at 08:19:09PM +0800, Jinhui Guo wrote:
> When booting without a FUSE device tree node, tegra_init_fuse() falls
> back to legacy SoC detection on 32-bit ARM systems. If the detected chip
> ID does not match any supported SoC, the default case only prints a
> warning and breaks out of the switch statement.
>=20
> In that case fuse->soc remains NULL, but initialization continues and
> later calls fuse->soc->init(fuse), which results in a NULL pointer
> dereference.
>=20
> Return -ENODEV from the default case to stop initialization immediately
> when the legacy fallback detects an unsupported SoC.
>=20
> Fixes: 7e939de1b2bb ("soc/tegra: fuse: Unify Tegra20 and Tegra30 drivers")
> Signed-off-by: Jinhui Guo <guojinhui.liam@bytedance.com>
> ---
>  drivers/soc/tegra/fuse/fuse-tegra.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

The likelihood of this happening is pretty much zero. The only way that
you could potentially trigger it is by intentionally booting the system
with an entirely wrong DTB. Like if you booted a Tegra DTB on an Exynos
system or something. In that case it's likely that things will go side-
ways much earlier than this and you kind of deserve the crash from the
fuse->soc being NULL.

As such this is kind of a feature that prevents the boot from continuing
even though it doesn't stand a chance.

Then again, I suspect some AI or static analyzer flagged that we might
run into a NULL dereference, so if I don't take this, someone else is
just going to send a similar patch at some point.

Maybe a good compromise would be to turn the pr_warn() into a BUG() to
keep the system from booting and make it obvious to analyzers that we're
not intending to proceed in this case.

Thierry

--vh6hi6mdbexesfye
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmpy6NAACgkQ3SOs138+
s6EY0hAAsk8MjtBlce3zfcsweOa5LAYZsMHbIKzJZ1BXFjirCsVQLst8PLGaKw+o
jus0+T2+ZZcij6bAijoc7BvAarXG3GnFkH8c/zbi4xQnS145Xg5RAilj6NzFmNq8
Zvf4WMRT19uV49s6Jp7OwfcnMogr43JVNELlv8o8Fo22dbajEmin1Yyk9dVgB6B9
rhx+rM54IJLlAtPfr5wOUfV9kaiB6ZEVhlxvewtAx/Wb0ohZ+dno1liSRmJokdqL
+volFXqNPpobuYqnadkqcX+T0bqHnPGQKes6LkU55yoxEiPzIP7V6S1P6b77ymbF
YQSN5huflhiREThjaGwOihIFUl/gAtgGlZClzk9u0cCKc9brZ/noCgl8BVozJllk
pvVBAMK8d7k1RwRH3qTq6dYuT7czVK3OGPBudSI9BkYAVWaiO7bnpaXYIszYqe9d
DTPZeIUae5g8rxR/yfivmmvzjk+PaLojFRYKyptHEDvhsBepD9lOyfR/a9fWm0tD
DieioLyuojFhHlBHILWpXAJdyAV6bvCgMa4HqCo8cBrKtO36H0d2QHIeIbTYU7mu
Z3wJ4lJomxhSqFzMdG/2nG8r5PMQ62Q/2f87iikdYbRwSNSJhmII2WGUVcIYbAuY
fyH4cFai24in/x2DLvgPyQ179eHE0PAwg97R1lupFDwjIM9fKiA=
=10WP
-----END PGP SIGNATURE-----

--vh6hi6mdbexesfye--
