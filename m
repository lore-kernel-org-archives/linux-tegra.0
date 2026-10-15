Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C5C751B16C;
	Thu, 15 Oct 2026 13:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792069746; cv=none; b=NQXFYZ7W/OYTZ3XrMgg9X6En51HF1ectG613hCOMSqa/9/ybqIMrrrzcnQ6Dqe7w44CapzqbK7Zm8pwJxfJKEHqf1cH+qVaQfixPGOuHV2O8NeF3tJevJwMlSc5BRjUB5pk1wry/um6tTI95cWE9iJa/xh4LyzWrS8dmgGILc08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792069746; c=relaxed/simple;
	bh=1fdlVaal3GLrRFh6uh8s9DzMiket9ynEjYP5esVxAI0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RvPhKcZZk4TL1YlSxwLXdWNMF38PRkjtzhSDKkEmdnUF573DKw8vV2QAooR8iZjeh8laX2NvizEYPyJQXW7zCVqBvX9hCUjAUCTk1BKujwdic0pUgx576Mtq2J+jJgOfhFcsNFZZikWTDcoKXANUgJVadMbVEEclr9RJoQNYd1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D2YFSY5P; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D2YFSY5P"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D98E1F000C4;
	Thu, 15 Oct 2026 13:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792069744;
	bh=5sPB/6sXfeibpDcKzKHXp+nhVUEGqxPgJsZVGdo2G9o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=D2YFSY5P+DLFLZ5Gh2caidLphvjbb+jX6QMwk4RrqOeKDmIAKu8Wta0a+t4v7jxgh
	 zqxC+wkd5BBhGRkH8McJ4AGo+VdOBk1yMhihzi3CSWzQoHNSNHS8w3aXdoeVt1ItK3
	 h3iB0TbVfKwYQiTNhCeKIR3jWCB1AVVfnQSMzjWr8Pi4RZme2TpOLXnRuqJItSNHXG
	 3F7yn/s5/2fWD9ttTTsv+fw0loTLWw0WjhCgeyaIZXJUgFaVtSCCpGqx+Ei/++MWYQ
	 /sK6GOvDFTsIzGc4NtLf/bsJl2YzSTKn5k3JG/yjepKVIagh//JJ1HZk8z95GNP/8p
	 /cIjAsa14a8gA==
Date: Thu, 15 Oct 2026 14:08:59 +0100
From: Mark Brown <broonie@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 0/1] ASoC: dt-bindings: nvidia,tegra-audio:
 Consolidate all codec support into a single schema
Message-ID: <d3648f08-17b2-4a90-8c23-3036cf71f1e1@sirena.org.uk>
References: <20261015130628.184279-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1MDTMyHTJkEiHO1L"
Content-Disposition: inline
In-Reply-To: <20261015130628.184279-1-clamor95@gmail.com>
X-Cookie: Tax and title extra.


--1MDTMyHTJkEiHO1L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 15, 2026 at 04:06:27PM +0300, Svyatoslav Ryhel wrote:
> The number of codecs supported by the NVIDIA Tegra audio complex is
> increasing, which leads to an increasing number of bindings with minimal
> changes. The main differences between codecs are the compatible strings
> and possible pin configurations. With the introduction of auxiliary
> devices, a definitive description of possible pin configurations becomes
> nearly impossible.

Please don't send cover letters for single patches, if there is anything
that needs saying put it in the changelog of the patch or after the ---
if it's administrative stuff.  This reduces mail volume and ensures that=20
any important information is recorded in the changelog rather than being
lost.=20

--1MDTMyHTJkEiHO1L
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrQ0GsACgkQJNaLcl1U
h9DxzAf/XF+cezuzRJkynPNZClWWh5eup+5BF6H5PuLHWhv6ks/3SsTnHhp9bhJ7
2mqSIEAAH9S5Pb+QDxKZNL/gbBpp6y1/DIA5Pi3wkMYs3V60uYEnNvXhYtLhlley
mT3sS0eIQNYl7WUH4XwISuO04FlxoAmtTreAAmh0NoxoF1QibruAaws8rEVnDqYz
UiqxoT3dkGtm6TQbev1eDEyS5ncd9Tgb4rueVO2jXxyUMuzniPtISM685rmD4P7q
/mXwb9tJX+ec3lL7hp8yX5qu3h3PVgpcsGCn3jsbrUXAujkNheh1B4oE7sy9Rl1s
IzQ7dASGZsvt7AR4Z0+Pgnt3Ml31Wg==
=/Bs7
-----END PGP SIGNATURE-----

--1MDTMyHTJkEiHO1L--
