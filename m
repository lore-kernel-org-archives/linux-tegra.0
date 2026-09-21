Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F96048EBF6;
	Mon, 21 Sep 2026 12:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789992443; cv=none; b=h4RgpodGfhfH8p53hxd8cG+NyN76AzRDOnZdv+NKQFYl1+F+/4FaTIi0bMkJAoX3KqhXRhAsSTVk6ALkrEjFcOO0IVL303P199zyNEB0f7jBXIjko7vHoVU6OT7XnNJomdjy6/iBh43cQ/G9S2NoqnnRn/5IochoIfRqy18eKJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789992443; c=relaxed/simple;
	bh=/5Walc3cjaSwroiEzmN8sLMeAmjeoQcDDIqd1wodBC0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VJWvMCY86c4tX4ZBWfDuozs84LY1qcQHBoXyxWAH2uVbL6kpsSDp7VRroD5uLPrJkAWi8Z9SWGTcLsaLBvRfonjp7qptHqWgL8o3jVYhwZcJtpy+AFizmI5FpzrG2SeRYxe/ORp7UYyLB7OgOFS8UnqGG9huL+5BshgfHrcEd4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SAMPBgRs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SAMPBgRs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73A651F000FF;
	Mon, 21 Sep 2026 12:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789992442;
	bh=/5Walc3cjaSwroiEzmN8sLMeAmjeoQcDDIqd1wodBC0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SAMPBgRsLuE+fu5Qdwu97K7t48iJYOFTrfqGnca8W/N31jyJQau+tyjdEjS7RHbMd
	 lZAi67rbqjDMsT6zg2dZ+/SDEgn3F5nMvOVSNmEYznhpbxOr0eEH31J5DOO9A49Rgf
	 QYVU46CvLtoEEylNKMcjAIBrm6Tf5Ak1sLi1YsNAkkr2Wd2IIl4O3heEDR9yOkQo+j
	 kYu9UbfN9uUotEuRaFVLsOVSZboQsv1UskcGSYSk1cTt7N8ynGkdLG10ztbyRCN2qS
	 ijh3+NAhhprhJRJpwrEPAggnvpjd4DKh7fjrIQpzmsptyU9zC4M4K/biEevx3U+tuX
	 /h1Wz0lXI5c4Q==
Date: Mon, 21 Sep 2026 14:07:19 +0200
From: Thierry Reding <thierry.reding@kernel.org>
To: Sheetal <sheetal@nvidia.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Sameer Pujar <spujar@nvidia.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Mohan Kumar <mkumard@nvidia.com>, linux-sound@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 0/3] ASoC: tegra: ASRC control fixes and ratio caching
Message-ID: <arEaioTIrCyJqwKn@orome>
References: <20260921085704.1248920-1-sheetal@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jhizgarl7ooit75x"
Content-Disposition: inline
In-Reply-To: <20260921085704.1248920-1-sheetal@nvidia.com>


--jhizgarl7ooit75x
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [RFC PATCH 0/3] ASoC: tegra: ASRC control fixes and ratio caching
MIME-Version: 1.0

On Mon, Sep 21, 2026 at 08:57:01AM +0000, Sheetal wrote:
> This RFC series updates the Tegra186 ASRC driver control handling.
>=20
> The main RFC point is the userspace-visible ALSA mixer control ABI
> change in patch 2. The existing per-stream controls expose the software
> ratio as separate integer and fractional mixer controls. This series
> replaces each pair with one two-value mixer control so userspace updates
> the integer and fractional parts together. That avoids programming a
> transient mixed ratio to hardware, but it does require userspace that
> sets ASRC software ratios to switch to the new paired controls.

Given the ABI change, do we have a good understanding of who might be
using these features? My understanding is that these are used for the
setup of hardware pipelines involving sample rate conversions. So these
are likely not your regular users that just want to change the volume
for headphones and such. This is for highly specific use-cases. Do we
know if people use extra userspace software on top of ALSA to set these
up, or are they typically dealing with fixed configuration files for
specifying these values?

So essentially to be able to better understand how to proceed it'd be
good to know what the upgrade path is for this. How easy or difficult
will it be for people to transition to this? Can we transition them
automatically by keeping write-only backwards-compatibility controls
that mirror the old ABI and maybe provide a hint that people should be
upgrading to the new controls?

Since we expect this to also fix the occasional glitch caused by
mismatched ratios, I think we really want this, but we need to make sure
users aren't left in the dark about such changes and have a reasonable
upgrade path.

Mark, Liam, do you have any guidelines on how to handle such ABI
changes?

Thierry

--jhizgarl7ooit75x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmqxHfQACgkQ3SOs138+
s6EZ2A/+LftH9l4aFzMUci3zRpp5yKQkxogs17WHYtErsoJX0a+1PbARbgyZppyc
OnVo6z1m4w2pGH4G7RKhSBARlmBGZiGT/ha9sICRQh4/JsSGAWjoycZC2K3VTP84
Hlk1EJZVlJkVxjqlMu+Cxgf1681oSgETCELH1Evxhw5Rgu9vBzCSuP8by4ol76Pe
pnmJDimbHs9Zx+ohnNEmvqqcVoHzKCfRZZsxAscknG+tQ29Cyw4hfrSDm1CIZhAF
7KRETjmyuVuVjD9aU30Dkg9qll6cZgJLUwPpi8BbOAvvM3D4mDpyF/+VZAK3TdXx
gZ1qSKQPGK7o7fHLKNSViZWoFB8bBv53SHBbgjAlZA0yAWwO+kYO0s2ZVgeXHSZU
AAxM8Cgr1qtFiAY1cBVzsl2bGWJNHbyioiLvHLhHz8oh5hIYD1ovLTgASuAlBhg+
/h1nVVcmnCvOzcFhm/x+kR2tuYHkH9/FKkhiGPdiuvWyri+bERFpE+Tg/leOSED9
aXeZewebkZx8gbN1BtwATx1LnIR2No1nFy/e1MwZH1hGVXYK3rhs3/ICNr4cm1Fw
UfxCnzxi5yg8WtluryxHRcczf9I/zi/JQwFOtjSDdSQVfgj7T7ikJ78r/31SGkDo
wE/uwWw9Es+5NSl/hRftp13UO//lhR8PrRNzioUWsBHiKG8xRiY=
=dZmk
-----END PGP SIGNATURE-----

--jhizgarl7ooit75x--
