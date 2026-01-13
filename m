Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CCD2392B64
	for <linux-tegra@vger.kernel.org>; Tue, 13 Jan 2026 15:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768318952; cv=none; b=iGS8r8jxOXCXusff7xfuqKUOpQGeF/Wd7+H99Yi9hx8URzK1u1brseOuQ4WR45A54xiq406JE+OWlEEn4WElstuztT2CG3wEJJQHGhdWGKaGcpguX5PmOsjLlplE+rZzypj0R/ozV4TVYQOtjVTrtbPs9mqzBKZgVC5ynW17hjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768318952; c=relaxed/simple;
	bh=b9BdClwFRMuBO9jA+GrMW4gTegX0rOwU1B3a6nKxKww=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YMiElS1csh1/RqK8pvw2UR2dF569BrhjW11sBIUJvfn7BCjhxxsNyBn8MTFiwimp7K3kjwyOXNDlXFlBqP4tAro5zQSkh7EJgcJv00WzeylOFzeSj8V7hTlEAK9HsG28wMySzJran9MSgdDM5UWdRLsxZ9dIS8B/bWFbLF0ApmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=SCTLMZNC; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="SCTLMZNC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=b9Bd
	ClwFRMuBO9jA+GrMW4gTegX0rOwU1B3a6nKxKww=; b=SCTLMZNCz/t/UieORRhn
	cDeflLEYIloYYsqmo9cIqtqKkTenZfPdq6ELrHIARQ4sd+2q8NrTymB/Ov63F3+h
	fRhz/IJhloH3EQTKCaed3xsm+/GL8tW/9EXxff5d1XkW87g6iqW3fq8bRLKpizte
	Zgf5ZjON7NivcXKMr6wuzoV140aZGowRT7uItEHEIklsqcOSFUBTYfvQ0TBLQkpc
	pujWkCnFKyoBZHZQfTg0e77ZzGnt6a9VxEVE0RnsX51RGGW2QTnGpBxDtXCrzKRX
	7PJXrFCoKWBiqNdPvCU1pazDld/iw0GtX1g8J3WLsANZ/62STQKkG6vVpcuUJvXa
	mw==
Received: (qmail 1757700 invoked from network); 13 Jan 2026 16:42:21 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Jan 2026 16:42:21 +0100
X-UD-Smtp-Session: l3s3148p1@rHZa1kZItqsujnvx
Date: Tue, 13 Jan 2026 16:42:21 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Akhil R <akhilrajeev@nvidia.com>
Cc: andi.shyti@kernel.org, digetx@gmail.com, jonathanh@nvidia.com,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org, thierry.reding@gmail.com,
	wsa@kernel.org, kkartik@nvidia.com, ldewangan@nvidia.com,
	smangipudi@nvidia.com
Subject: Re: [PATCH v13 2/6] i2c: tegra: Use separate variables for fast and
 fastplus
Message-ID: <aWZn3TsXokQ2SUfz@ninjato>
References: <20251118140620.549-1-akhilrajeev@nvidia.com>
 <20251118140620.549-3-akhilrajeev@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="A3LYHKePk1llEWjP"
Content-Disposition: inline
In-Reply-To: <20251118140620.549-3-akhilrajeev@nvidia.com>


--A3LYHKePk1llEWjP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 18, 2025 at 07:36:16PM +0530, Akhil R wrote:
> The current implementation uses a single value of THIGH, TLOW and setup
> hold time for both fast and fastplus. But these values can be different
> for each speed mode and should be using separate variables. Split the
> variables used for fast and fast plus mode.
>=20
> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
> Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
> Acked-by: Thierry Reding <treding@nvidia.com>

Applied to for-next, thanks!


--A3LYHKePk1llEWjP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmlmZ90ACgkQFA3kzBSg
KbbCkhAAph4COATXmoYgZKiWHhqfdHCVPnhAoW1C/YtaT+yI5SfWTk9n1y8amAc4
73KkA1xDNU/QPWxSpeYg3PxQdmO+1VpZaGyH4McBA1XzNjx0H1I2pLF6remUp+QH
hAYA4mJrzhu/cHig4BIwrIoh5D1wTl1fryk1Ea7Ihkk40iXL6ozUcBdG1NR9bplR
odP+5WwcSWfNzFWJjIOgu88gOmRxF/NIo2tVQDTMartWTj2lTibRLYIhboGJR1Vm
cb2hIK0uG+sMWswM0RGZCARHFCgYzkYCEqURQ5oMq40WlLHhiyiyhIDBakwYymLd
A+CRgimhuau19CmJqi8KB+rwJ28+VPPXr/qiHiLRWRGJmoptiNHKM18HcUc2vHXX
X7jyC4miKLAjMdnIRlC8NTCv59dVFMASlG1Mvw7O/FGSRWsXb2USCYz8k10ReYd7
bjFzcnvYcCxIBDExEKP/8cjjB9cFVyAC80e5I3Ot6KnvX2x5zXrch7u+CQHG/sth
OpyIeUMwNZaVJh6JaA6FpnyeJwZAPrVUQ9uR7BfmesrkecZO8M0zm8m+OMfx0teO
J5tWbLQZS2AaUC94Zw+BStDgM6f5GKGLL9d0PZVmn5og1Q7B0VhEklz28qfeiuHo
DNqjkA7zewhy+GCKRF1njGKUZ6nxZqt+WGUTQ6jOGpszH4nQz6Q=
=6QBl
-----END PGP SIGNATURE-----

--A3LYHKePk1llEWjP--
