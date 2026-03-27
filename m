Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62C1D3F54AA;
	Fri, 27 Mar 2026 14:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774621889; cv=none; b=rAYQUp8y2TzPDDnJJHAqRhcnqjZmznMGi2CRsUI5sZwKb7f8eESWWxE/xQj399DG8ty0TibJP+49emFLmwrBN56LpdADaHB+r5y0d17lwCrqo6Y19y+1AbzW4MFYYK1cI+x0K1g5oGZ+Dn3JdfbNShbLTsR8x+aX1VNDT/ZrSN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774621889; c=relaxed/simple;
	bh=HVdFSd/GdvrYuE/uSDJrCEGC9Y9FE/iPTsDxEj8fqyE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IsujB8vBVpQNxEqFlL5bxr8l/QiVfi5lp2HiPXCfj314pz/JyesXvzWGA/5v0TrUVYSafs7Z9iOvb4OM6nClp8ZwwSebMiZup2FLYXAw1tOai9NiA5YfJMmTAUcCnDX9AWj8aP/NFIunfloMZoqCp3ACsWxnCe9xmmOfQT8IY0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JlLBYHMS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JlLBYHMS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A265AC19423;
	Fri, 27 Mar 2026 14:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774621889;
	bh=HVdFSd/GdvrYuE/uSDJrCEGC9Y9FE/iPTsDxEj8fqyE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JlLBYHMS5lnIhdzcTQttEXtlm8HQeTLrd7kGFBED+SU2CUPYJQNUsgXyYpSzO7qfY
	 w84mz+gCfbbSEedxA3nSxlPKVav9k9/nVIm+BU4b54yQtfefFethmzCNjCVsazLc9f
	 JIIaAzVAqEc9oLGTgYoEDYuH0hwRLo73EIr0HLGHKyXWGL6Tr0reLprTlwLSRVBu+Q
	 X+nDRMhFitc18dvr0SkrrmD5x5oCqBQ9yxeOuupTQJvI3g2lC5Y9vBEaA6jL1W2RLK
	 bv77a3vQMVEIA2x/p7isHX/uGjfmDU/7guhuQaQ+p2x2pSTlll3LgLmnm7Qcj3uot7
	 AKRrkbuSkfiDQ==
Date: Fri, 27 Mar 2026 15:31:26 +0100
From: Thierry Reding <thierry.reding@kernel.org>
To: Sumit Gupta <sumitg@nvidia.com>
Cc: treding@nvidia.com, jonathanh@nvidia.com, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org, bbasu@nvidia.com
Subject: Re: [PATCH 0/3] soc/tegra: cbb: Bug fixes for CBB 2.0 driver
Message-ID: <acaUtjynT5Wu6Qw7@orome>
References: <20260121101205.3186310-1-sumitg@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ygno5qykbilu4jhs"
Content-Disposition: inline
In-Reply-To: <20260121101205.3186310-1-sumitg@nvidia.com>


--ygno5qykbilu4jhs
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 0/3] soc/tegra: cbb: Bug fixes for CBB 2.0 driver
MIME-Version: 1.0

On Wed, Jan 21, 2026 at 03:42:02PM +0530, Sumit Gupta wrote:
> Bug fixes for Tegra CBB 2.0 driver addressing resume handling,
> fabric lookup table sizing, and cross-fabric timeout lookup.
>=20
> Sumit Gupta (3):
>   soc/tegra: cbb: set ERD on resume for err interrupt
>   soc/tegra: cbb: fix incorrect ARRAY_SIZE in fabric lookup tables
>   soc/tegra: cbb: fix cross-fabric target timeout lookup
>=20
>  drivers/soc/tegra/cbb/tegra234-cbb.c | 35 +++++++++++++++++++++++++---
>  1 file changed, 32 insertions(+), 3 deletions(-)

Applied, thanks.

Thierry

--ygno5qykbilu4jhs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmnGlL4ACgkQ3SOs138+
s6HeFw/9FtZGEADXkppzY7VTCXnfBjgNadrIK+2TyGNoVTYl2M64GLycDpFOoN8H
SAcQkk6r4nXhSZylhLLGGBdEU/+4TfPRNh27S9dWFsKBEhds5t9NejXIpnViPBOk
Zw/Xt2Vh7glWxSRfURDxrGCycR7D/nAQsCiMd1AR/4lESoUs0yuHWBtRg5SI98L3
9t7ayOvi9skP1Yvgkb7iG6kWI6UkPvyXQExPWBO8+1IjbFtaYG6d1b2ZtlDoB/BU
RzG+rnD1x3QZV7jRQk0XoboV/eicEHl6bMGNsTK3kBUhTg/dRrlnNCPp7g54ZG06
a4LjAlHPmK9h5UewFnPwwuQrYbh9zn6GEuJwg/l5KXCjNaJz8/pbY4Aj6YpJDpnA
bxcbmHrJ01/Te1iCHIaPyrNG/Z0hUXB4F9mQDtn29kub51KkRMR6CgLhoZ5AyIJX
pVSsH93yOyU7QzOiKXkJnJp/puk4F5C1+PdOTjsAayoME3CXvv/xuXl4DvBodoSf
XJF+zbLIzHHJcvwD9BNPnBuT5NxhubBeLKMYTJ81PPZ5HMgx0qyc3jRNvtGvCxN6
kL3LHXWEEJUfqwovPWRcJppXXavHFAqZWBtIHzgijIR6gnELlYBzzQxG0hdfOnPH
TONb0nqXQHUAiBgkFPxMsCSyVWx/B6cMkhvSUHq+kUCvJXc5w+8=
=MBVX
-----END PGP SIGNATURE-----

--ygno5qykbilu4jhs--
