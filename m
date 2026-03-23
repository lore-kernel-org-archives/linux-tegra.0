Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F04B73630A2;
	Mon, 23 Mar 2026 21:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774302215; cv=none; b=M1UkW+VZpuRzJWB4I68KE9/mvUjPDrIjCZz5+WD7JVgEAiYQji+UH4uxy3IN1C6SuLc24aC7UC64asZKAX2KwwZOUZKTnXEVWtkb3tK16dXMP/JuK3MbuJH2FAWDg5kGFKe/uL/WAF/N/1UCoNiwaf69TrGH+ioOoeAi/YXJZqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774302215; c=relaxed/simple;
	bh=//uAUSA5u8KTZ4EtjpPk3W8X1OMtu/OmjpPbLC38CYg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VYIDCHyq2eQSK7dmoPxW2pxY8HLsRo8yTA4JkKIA9sYii0N4fj1BhpQ2mffAPRVcSKOsLM3nDckKb2tDYd0Z9eR2GdBraUX11/6NKLbMShpA5eIypcwiXkFXDI+cEjIMT/hKFHdpWU7baArgNQWqSgI+zCks+NaUwvn7xkAF3jM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nmeMKc2Z; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nmeMKc2Z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 562D0C4CEF7;
	Mon, 23 Mar 2026 21:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774302214;
	bh=//uAUSA5u8KTZ4EtjpPk3W8X1OMtu/OmjpPbLC38CYg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nmeMKc2ZQ++WnFF1I46NHtq1/hdFKcWPmmXkfk+WEtOMamvA2jaXLjfwLg7TSIRlB
	 diuD3E3+DPiRZj87CkWIKlmaRqlY4hoHeJ+Pe9M1o5d26zAwZrDkVaH+cX666d7sMj
	 Q9HUUAc2s8uVhAZlwFjBiqWZBXE9rnogTw+KPWJNykr+HhqJiGvomhnBtBjaOg9KIU
	 YzCSL80SQYLJaVbdFdLOV68/cng6sNvmGxbrLkK9C0Fkq1a0t7QxvSr9jToXS85jBG
	 pIb8PyA51CEpDI87qbD15fABHpSpprT3E2n/XB0XYX3X9E7mjeNKgk/g1J3QrD39SD
	 SqG6sBO2mMOCQ==
Date: Mon, 23 Mar 2026 21:43:29 +0000
From: Mark Brown <broonie@kernel.org>
To: Sheetal <sheetal@nvidia.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Mohan Kumar <mkumard@nvidia.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-sound@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ASoC: tegra: Add error logging for probe and callback
 failures
Message-ID: <bac4efed-0603-46a2-9b95-91281729b0f0@sirena.org.uk>
References: <20260323101242.3100108-1-sheetal@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="QlcpgGI6Y6KfLhXJ"
Content-Disposition: inline
In-Reply-To: <20260323101242.3100108-1-sheetal@nvidia.com>
X-Cookie: This is a good time to punt work.


--QlcpgGI6Y6KfLhXJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 23, 2026 at 10:12:42AM +0000, Sheetal wrote:
> Add error logging across probe and runtime error paths in Tegra audio
> drivers to improve debuggability. Use dev_err_probe() in all probe
> error paths as a defensive measure against future API changes that
> may return -EPROBE_DEFER. Use dev_err() for runtime callback paths.
> Skip redundant logging where the underlying API already reports errors.

BTW, can I suggest splitting this up per driver or something - the
change is 99% good, if it were split up then most of it could get merged
even if there's one or two odd bits need some work.

--QlcpgGI6Y6KfLhXJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnBtAAACgkQJNaLcl1U
h9AxbQf/aLzSbClqimW3VUGOp78umZJoN65wRqxOnOi3sq/EE7hAvBOBYpz+n/Ic
e5AQ2ni0btycFRypVF+pOOteScKzCO2yrZLdZj7ew8va+ngXCHq+Yba3D51pkytD
hlCnJaVw6jHHrvP/+P1cQAVz3CCu7bKauc8FBy8/ylcxDul7j9oAVtAtVXentUAU
PbMBa3YwhJiCfaYZt7HOfg1JBUN5l1ZTdkDFFbxUd9zgofDEbtscEdxZ4sVV+3Zr
G/R0+s8ezmjDEDA9JWHnyYWU9Fv67/mu0VZf7gMeVp1aCwgaDqZej1Ot3tUqcfi7
NeYSgdUuZIcMdB3/HujpmmgVm2HMZA==
=JYSH
-----END PGP SIGNATURE-----

--QlcpgGI6Y6KfLhXJ--
