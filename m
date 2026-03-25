Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89E343D6696;
	Wed, 25 Mar 2026 13:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774444109; cv=none; b=njvmodnDTRuBqdcX+SqUe6+u0iJDyUfs1GovgMkUIHPn/CZhYu+lv5sphU6KGEPpYqUVwECcory/AyNdIO+2uG44sZwitIvgOUEf7jRKa0QkrGhfnzT6JiuvGwsmqxyaVijrenF+2woGkebvK6uuIxM5CEnJiqpKI7SaVKM6I4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774444109; c=relaxed/simple;
	bh=nf5dtJJ74Ewd+aNB+gLcjeuQd74uYnkSPme4TN/8Ptg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RNekMtlX2fcsEX7jyzVC3y256P70b4CqnhCiT8DpGY7q7E9N3bfU0X5RozAZTP1SIb4JB5qkAPlmnEX3Xqpq/A8ekBY70QCuD2tNOmp8LbolKsJAdLcRZxho0qbRZHcEN6nGrN7Zu0jeZQGoIYaSQgUDRM7VYMmNC3P57P+dFxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hTG8YVgK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hTG8YVgK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D97E0C4CEF7;
	Wed, 25 Mar 2026 13:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774444109;
	bh=nf5dtJJ74Ewd+aNB+gLcjeuQd74uYnkSPme4TN/8Ptg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hTG8YVgKqL6789zt0crxg+r39AFxDaYscmCOqXZ/c0GPIONUxo9w/V13eLmx/1Trc
	 flvhrmZvMwq2NZRIoRjPk/EjpSjGGtSAVbTm7H0Z7krsCy8n/e+zQRV3sOcxrJjq5/
	 F3gaeGy9RPRK7XLVRLAJAewh25FkSRtqI9mNDadhcjznKbLRxI+qBBLpDuKqP/57Xo
	 lbryigQMpV6yP5Nrj0f1N3I6oUQJAOvh436wre3UW63pr9jydTLEb9DnypKYFTb7st
	 Ju+Gl25cW+EJzviq0jTZ4ulHJoe9hOLkpUbWMIwGgwhuueEIwpW5+TdMnZgOvPQzKr
	 Y1k4EIh/J7RTA==
Date: Wed, 25 Mar 2026 13:08:24 +0000
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
Subject: Re: [PATCH v3 07/14] ASoC: tegra: Use dev_err_probe() in
 tegra210_dmic probe
Message-ID: <123b2518-1220-4e91-a8f1-3e279cc64d90@sirena.org.uk>
References: <20260325101437.3059693-1-sheetal@nvidia.com>
 <20260325101437.3059693-8-sheetal@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SMCTTQypcSD2u0Cj"
Content-Disposition: inline
In-Reply-To: <20260325101437.3059693-8-sheetal@nvidia.com>
X-Cookie: Those who can't write, write manuals.


--SMCTTQypcSD2u0Cj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 25, 2026 at 10:14:30AM +0000, Sheetal wrote:
> Log errors in the Tegra210 DMIC probe path using dev_err_probe().

Another one with a regmap log.

--SMCTTQypcSD2u0Cj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnD3kcACgkQJNaLcl1U
h9Co1AgAhwRDaUeqOt0QZ2rSLqLNG5En+5ZQXsUtIIHfST+MzL9HUzeyuFr9YgA5
FAxY9ZlECodHR7UfSsZkPUZNA6Li4g77qCO+iJd1KMvxdNHmvSB1I6g+4jyd9pGb
00rSQx7WqD5CLHUAkPOBenkAZRHAU2Y82hRWOqItGMT109ufiHgcjUZlizM1R3Qv
RK358+4FbwIbaKBmsh39SkBr63GoSu5jm/s3iQYXhCvsBjWkfVOsTyVWIqg2g8yY
UFcCW4KJNJPkPNa81NodZotO7i4oRZRt/o6x2CG29hzJsY3tAFoA3ZtKq231sPB3
M04qj1PiykrUVVNndnEOGDqF1EKVqg==
=qvw5
-----END PGP SIGNATURE-----

--SMCTTQypcSD2u0Cj--
