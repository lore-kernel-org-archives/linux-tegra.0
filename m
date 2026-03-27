Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C90742D8795;
	Fri, 27 Mar 2026 23:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774655290; cv=none; b=AkYH/fW5+Qp7lgHBWdc0yOXToWbPcHDRGLI1XPfViDuqjd6fHT6u8w6tim2nSttOHgxaiiq87m2Hznt9y7M57IvV6XkpIKxRE/bJ/303yUZm9Jzhm+2FbAbo0GQM0lenGGDoMUms86eLamvDEM66my45VB9dOINb3tBgY8Uq7Bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774655290; c=relaxed/simple;
	bh=gvuzInyL1s7mBPhcQ53ZyLAWB0v6xQc4KFMEABlBz5k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d4iql6Dd6CUg6xy6cFXtqTjWLslibtGTIgoZ9oDb/+QcW6nRwQazttdR2LTamxbRcg/WzrA8fjvoWzvtXiQXKFE7loW2bHIQRYmmWhuY64Ycvb+6tsnlQMyiChGXrM9FSkkd6lQ+uzjoeepGlvHuCrWYjMItkyy9yRKGsvzISAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TG2MgLlT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TG2MgLlT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D937BC19423;
	Fri, 27 Mar 2026 23:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774655290;
	bh=gvuzInyL1s7mBPhcQ53ZyLAWB0v6xQc4KFMEABlBz5k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TG2MgLlTuJwVVVf3TbSMZhbnGTLkgnbXsmf9RZdgRw4KfdbuT8yj+46pmgrkc3nBS
	 LcTQkQVhLUTniSQv5zatgCBcW+iJ6UBjtvFc2U9zzSqqRdEcZN31lDBMIJjRT2PMz6
	 4T3WlHj7LuXsFxCRGzim1TyALY5KwXkJDNs0RkmFY+HSELA+MCY5FuFuXEXHm4+J26
	 KLR1HXlWEPcaSZBOCGUDdHtogyo+T5nFBCuej55GNZJ5JB6j5PpBUyLcTosSni88QF
	 vZYqJ6rviYe5tNGge5rPY7EECJsruvmsq1vAvbMW44x3XhcdVhprGX/J0jinls+xy2
	 zkT0+O4EtboXg==
Date: Sat, 28 Mar 2026 00:48:07 +0100
From: Thierry Reding <thierry.reding@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Mikko Perttunen <mperttunen@nvidia.com>, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 0/5] ARM: tegra: configure EMC and PMC
Message-ID: <accWqpdggPTQLC8G@orome>
References: <20260126191536.78829-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="j3hiczsu5tlu2vze"
Content-Disposition: inline
In-Reply-To: <20260126191536.78829-1-clamor95@gmail.com>


--j3hiczsu5tlu2vze
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1 0/5] ARM: tegra: configure EMC and PMC
MIME-Version: 1.0

On Mon, Jan 26, 2026 at 09:15:31PM +0200, Svyatoslav Ryhel wrote:
> Add nodes for ACTMON, EMC, PMC power domains and interlink them.
>=20
> Part of previous patchset: https://lore.kernel.org/lkml/20251125120559.15=
8860-1-clamor95@gmail.com/
>=20
> Plus added commit with power domains.
>=20
> Svyatoslav Ryhel (5):
>   ARM: tegra: Add ACTMON node to Tegra114 device tree
>   ARM: tegra: Add External Memory Controller node on Tegra114
>   ARM: tegra: Add EMC OPP and ICC properties to Tegra114 EMC and ACTMON
>     device-tree nodes
>   ARM: tegra: add DC interconnections for Tegra114
>   ARM: tegra: configure Tegra114 power domains

Unfortunately I can only apply patches 1 & 2, patches 3-5 seem to have a
build-time dependency on the series at:

    https://patchwork.ozlabs.org/project/linux-tegra/list/?series=3D489808

It's probably best to integrate patches 3-5 with that series so the
dependency is implicit.

Thierry

--j3hiczsu5tlu2vze
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmnHFzcACgkQ3SOs138+
s6FUbg/9Fc0V5576xeQ7ZJLZkoEJFxuuj7EjdjqpHQ/AUgn9hP1oGtFFx+tP2jOC
QVWrZCeJaZi9pxBDcpRwFbq+nlnq3lFC0rpGhaU/pYMwGkrXuQAIfYBo0B0hJ1ip
JS7apiuYCwOfzChMdEZDyhZZt9D41kNQ0FwSjPq5Uj8mdcKwU68KIk5tVwRrk1+U
LNun5AkdvLk5NFZySqW7+6kTtXFXWddEmFx+h1Pi3S/001aKSxf7x6SP56AwKw/K
cdpHZQzQU5Smc5GLxC1aUB95jujeM2LRyrbc6HzsVX2KaAMTUrafBPog73W6JZsx
/Am1zUfcoa/heIowSqQv3T+4/xMjASOpxpdE4L1i3vx62io4cSOXOm0adL40X/lm
/wPnreTjaGI7dVZiqBP7filsISJOxfMfiesnoKGjRWsVj6ApM52J5VzFAmzf/5U7
c5QV4D8ynMbFcVnybVQSS3SQkoqNQnQJ+VNHHs+RvDo8kV9kB/TvNaMp6ATKaivs
JrcpHxKjDPey9Urgefs1zN8o2h8rXLbWr6l6W1Dai+9havwxlGBC8D0vMd1Addrs
QwWId5rpiKIBQVpgYOzt/rMwc3VLuyxCa5J2eVyDe989BQfL5/iauBu5XKphfsDO
yvQj+jsW25/Kj4zGojwg4J0ajxWLabQwat5jvYAFOTekF+W/8xU=
=wRfJ
-----END PGP SIGNATURE-----

--j3hiczsu5tlu2vze--
