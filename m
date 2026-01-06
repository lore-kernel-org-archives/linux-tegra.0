Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BA3D333447;
	Tue,  6 Jan 2026 15:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767712349; cv=none; b=Izz802126PJTsvpmNCkOnqxS0nBpdEGBYa9zDlKTG4t8MSbEdprIGHfald+fDHtnoUbDTTvyg41S+BaG8Vp36h6T5MqDaqdIsh3d+HlEVl2aLXl3JIyFpshcJtChQ79eLXxvYwWQD5dKU6rWwgqfn7CWYj82hcSGry34FsS7t/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767712349; c=relaxed/simple;
	bh=RvJosjM2WM4ada8mc4JDbKDyT+WLWIvBlIZF4l6Xwqg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YDDxa4KjiensQDgVu6u6klwgDiSd22WAF0M+aZtPyL8xKcnF94H2Uy1IfWN6iMiOqjzzD6m0prDrUOxP1ONZiKWq7h0s7ne5XcsU+ZzvFzFG+SHG8KsgYy0DaMEfEUXmI9UXkiC/tjrfufAHxZ+gpPmpbO7n1GZ3zVqUKAuVvrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DVXlkRWT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DVXlkRWT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FC6BC16AAE;
	Tue,  6 Jan 2026 15:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767712348;
	bh=RvJosjM2WM4ada8mc4JDbKDyT+WLWIvBlIZF4l6Xwqg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DVXlkRWTbf4YeGrE9ED2Vseyqa9NFVMVJrDOyjuKSYnumbnOTudvaRpZqHOg4SnQG
	 X5XhtdIAGPzRhCMEi58FRzeqHTIUnubZM2KLPOBMRhtTAkohNDFZQBlhmyEWa5HRLK
	 xpsbsvTu89FgKobHhFMWFE3wyu5xY4hpAYyyPwFsytEAuezzprIN2Es1iSB28M22FO
	 dB92UF4fxbA0tjTw01rvQEj7p3PIVrFn9f1WBlO1GUgb3K8CwsqYS1wTSAdc5fsQOV
	 4St4ZdNA5zBHNwIm2H/2ymmrEy2qhZdryIYvUM+zTNq8arn4XHPGXUoynrNr8G/14m
	 6spi8TsH3JbmQ==
Date: Tue, 6 Jan 2026 15:12:23 +0000
From: Mark Brown <broonie@kernel.org>
To: "Sheetal ." <sheetal@nvidia.com>
Cc: Sander Vanheule <sander@svanheule.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: Re: [RFC PATCH 1/2] regmap: Add cache_default_is_zero flag for flat
 cache
Message-ID: <b5f70864-baf9-4590-880d-96727b7b80cb@sirena.org.uk>
References: <20260106140827.3771375-1-sheetal@nvidia.com>
 <20260106140827.3771375-2-sheetal@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="RrxpOOpQbjl0BM5x"
Content-Disposition: inline
In-Reply-To: <20260106140827.3771375-2-sheetal@nvidia.com>
X-Cookie: People respond to people who respond.


--RrxpOOpQbjl0BM5x
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 06, 2026 at 07:38:26PM +0530, Sheetal . wrote:

> 2. No functional benefit: Entries like { REG, 0x0 } only set the
>    validity bit; the cache value is already zero.

For sparse caches specifying the register also allocates the cache
entry.

> Add a cache_default_is_zero flag to struct regmap_config. When set,
> the flat cache marks registers as valid on first read instead of
> warning. This ensures only accessed registers are marked valid,

Why do this on first read rather than than just fill the valid flags
during initialisation?

> index b0b9be750d93..bf918f88bfd3 100644
> --- a/include/linux/regmap.h
> +++ b/include/linux/regmap.h
> @@ -452,6 +452,7 @@ struct regmap_config {
>  	enum regcache_type cache_type;
>  	const void *reg_defaults_raw;
>  	unsigned int num_reg_defaults_raw;
> +	bool cache_default_is_zero;

It would be better if this were something specific to the flat cache
since otherwise we have to consider what this means for the other cache
types.

--RrxpOOpQbjl0BM5x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmldJlYACgkQJNaLcl1U
h9DUXAf+MrsD1XR/lY1jelkduBXhVrPCitlhjU1DtD6m0maoyGi3YwMjDeC8q/Ru
o2Ofo0pL0gtVTEaoiLtjd8Hk6lqESE1vsaVa6ADZPhc3y1zYz6n/uu44/sR6wQYx
ATd+QNKJ5Zb7wCAkdeWPh2nwWOW9NeCsPAPhZqiGhHgiXCYMGbPJnP2SkZ2Q5Yap
1h+mqzqvca/2LYzdqPkAW3FqIHqcu3gy2jn54nLI9rt/AdclIHq1S0kHUHHEC6nq
59ZDQBgMi1Q8/uJCOVkZZ46MZY2wdbvzBywLYQH1JhXQF4oc+C5l2hHTnCN0z3aM
xBAkUUrIz2rbZ0FiMAUnc8aQu655Tg==
=5kns
-----END PGP SIGNATURE-----

--RrxpOOpQbjl0BM5x--
