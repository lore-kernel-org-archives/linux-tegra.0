Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32A4130EF94;
	Mon, 12 Jan 2026 12:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768220805; cv=none; b=C01oAv6EbO07NK8Xm7+NGMzD80fj8grxDn7NHcPcgeORRb76h2q9z4fQiFVQVZ4nbY2vI6QGrnMgxoQhJYhbiTMfZWfxjUEvudjjQ8hwZkq55GP+Qx9dXNQnwhnDJakHXy7N9Ag/aGAeozrbDdqrsm/taiQy6JHw2OVF0j78tp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768220805; c=relaxed/simple;
	bh=nQo/UZsGlE8xxRFkoYYkAFCh/CWk30Vd/a166cmz9XQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OlUp16GqQ8UebLz2rToEkvwZUn2sC3cy8zAcSjB8gxMnxlqXqKDjl3E1XmWPiXLbrwmvPg9cZAhcwqUg2wF48PIJXkesH7YTLM6bqOaugMIfeDH2ZUvdO4JV+fjwTwLV+XRgUBRxVfIC5gkjuIgA/CS7fhdW6mEGizYsvsNpIf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c+n86LZm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c+n86LZm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 949EBC19422;
	Mon, 12 Jan 2026 12:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768220804;
	bh=nQo/UZsGlE8xxRFkoYYkAFCh/CWk30Vd/a166cmz9XQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c+n86LZmXMUqm+MMNINOENllSe7yakTs7X1SLs/y9092GQojXuiCdzzuMvvMQCcuA
	 eoPqY7Q5FLgTEkBZM3oCK0gLmWVlLtDpp8f/XnehrJNnBiTDZ320/wTAVT9ajC9MZK
	 rFMlrwMMkAWkrV635emiq4xnJBGHiVKkZw3oodylTwRizAKFwYTYkg9UnGgSnTM/z/
	 n7FixvzaZciEhjIS6XECjJYccmm9JZ5PcFQTc7knsG3QDpO3jmdhz8PfuDttKRDmyb
	 CQkDfai3zfS6IkyBv+8DCALyDv052sTral+X+9Nu3ykZVIeFWfQrhwUIhpLIOkplwr
	 l6GYQx1EPInpg==
Date: Mon, 12 Jan 2026 12:26:37 +0000
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
	Mohan kumar <mkumard@nvidia.com>, linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [RFC PATCH v2 3/3] ASoC: tegra: Enable
 flat_cache_default_is_zero for audio drivers
Message-ID: <bea00d79-35df-43f8-8a3c-62d6db7952ef@sirena.org.uk>
References: <20260112042841.51799-1-sheetal@nvidia.com>
 <20260112042841.51799-4-sheetal@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+XQ5gWSoOpfMxsu8"
Content-Disposition: inline
In-Reply-To: <20260112042841.51799-4-sheetal@nvidia.com>
X-Cookie: And on the eighth day, we bulldozed it.


--+XQ5gWSoOpfMxsu8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 12, 2026 at 09:58:41AM +0530, Sheetal . wrote:
> From: Sheetal <sheetal@nvidia.com>
>=20
> Set flat_cache_default_is_zero flag in Tegra audio driver regmap
> configurations.

This doesn't apply against current code, please check and resend.

--+XQ5gWSoOpfMxsu8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmlk6HwACgkQJNaLcl1U
h9BPJgf/RzY7dP68dlkCCmj2ZYFholfVpoTVxTvrAQWTpGn97TGQu1Dt89IHWKPI
FZ83GhQGjcH//IfG/nO1+h3v1Cu7/WobyCDg9CcyVyUEEp90jq8qYgtMbhPaubz4
Phd8DyYpjfFIbDA4xt4hvWR7rHQKwjGBtcx+wgHJ3k5bd5bRjzoQkWQ5Cm+v/0bA
JY1rPcwFhBDI0awWDafatArHd/bciPXxZ7+oV9ACEh3IUguksr1MtgdmoG51f+iW
r/oGQoO9b2tfViwnNtejanE090uMQ6ShLVIKu2TtOc8whrGkQnaGvG+S5g4MKu2d
+UfXrJjBWEblQergOWxAU/XFHTFc+g==
=U57v
-----END PGP SIGNATURE-----

--+XQ5gWSoOpfMxsu8--
