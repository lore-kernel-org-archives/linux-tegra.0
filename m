Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E70531F999;
	Fri, 27 Mar 2026 15:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774624725; cv=none; b=dQ92XxtLEAnjCwoE/k4nMumuIvlqsEceE4dkG+AeYf5zKGYfBjnFvgWD8NfmNMYwige4V83LZaYaE8bPdzBX+mongsiSFkSTxNxco/VO1zdVnfOHqNwEc3USqL5FI2/cEwEY83vJcRIPOU+wAybvc8gXLiBiepMzqesDIoBFIjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774624725; c=relaxed/simple;
	bh=BRl7w35F+Nx4nZiloKXPb0hNGeT4yNF1MUfmbXxPOgc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BqXrBu8y6Wycvemjc0WlUkn97kcbVQRJkE/BJGYmZpJK6nm8nPyKVCaxdmjt/0Re35rwy5rCOKqTnTkY3fSBe/NN4FYXOkM3cS4m0BpPBckKJMh5BInqYHM6khOS3X4mpBAxE9Kw+ZpiXs9OG4UaPKy2YfECg8pidoLTG0UmS0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dY4vpwP2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dY4vpwP2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E37BC19423;
	Fri, 27 Mar 2026 15:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774624725;
	bh=BRl7w35F+Nx4nZiloKXPb0hNGeT4yNF1MUfmbXxPOgc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dY4vpwP2u/TtjeDu6zGlUMDNNOaPHd8syT1LqyNCDgF3lU0qoo3T9aNlhE+hRRE+R
	 xlRrvPGlVTEZvC7lIJtEnS1xu1lfyoYnL1I7sJgMTL0d0gmpiMrTWpx+eYrMs0Z+i7
	 f6SYF1kSttQ6NOsymciFHYeueoeG8Ofhm5kweJi9zfGCKdPUP8NtP2B5wbVlpYwGgS
	 1Qv6j0YjR6GZIYUsjKuN/DXFJG+aiC1nP7pEIkyJ/CSXSLQC/oFBATuiQ68vQZeNBA
	 mnLUSrmRsEicxDAWpcLyg+EomtMecQ75m30Y2xrqO9HlkTf1OjsYBh2eZHt2fOFrVN
	 uKSGde65Gjb5Q==
Date: Fri, 27 Mar 2026 16:18:42 +0100
From: Thierry Reding <thierry.reding@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Thierry Reding <treding@nvidia.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] ARM: tegra: transformers: add connector node
Message-ID: <acafk7munaGrCTK3@orome>
References: <20260223065500.13357-1-clamor95@gmail.com>
 <20260223065500.13357-3-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="v4rbe2jimz4b2bgy"
Content-Disposition: inline
In-Reply-To: <20260223065500.13357-3-clamor95@gmail.com>


--v4rbe2jimz4b2bgy
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 2/2] ARM: tegra: transformers: add connector node
MIME-Version: 1.0

On Mon, Feb 23, 2026 at 08:55:00AM +0200, Svyatoslav Ryhel wrote:
> All ASUS Transformers have micro-HDMI connector directly available. After
> Tegra HDMI got bridge/connector support, we should use connector framework
> for proper HW description.
>=20
> Tested-by: Andreas Westman Dorcsak <hedmoo@yahoo.com> # ASUS TF T30
> Tested-by: Robert Eckelmann <longnoserob@gmail.com> # ASUS TF101 T20
> Tested-by: Svyatoslav Ryhel <clamor95@gmail.com> # ASUS TF201 T30
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  .../boot/dts/nvidia/tegra30-asus-tf600t.dts   | 21 +++++++++++++++++--
>  1 file changed, 19 insertions(+), 2 deletions(-)

Two things about you commit messages that I have to fixup every time:

  1. caps after the subject prefix
  2. wrap commit message at 72 characters

Both patches applied, thanks.

Thierry

--v4rbe2jimz4b2bgy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmnGn9IACgkQ3SOs138+
s6H8PQ//WDF56CankhI0lPuYlTAwtTyUwqBLWoyTKzs31bOKmybw9ca7lgvdRQjL
59xuW/qbfCpXHOZAK6fZqcpRRQGgMZSP0P8izSrA40CXDNKO7S34DIxD8yfv+h8/
d6cFnzQrxu/lMadP4YZ7tsujynCu+MHlYIUg44R0bdS9o9wtyc2OvlST0R9wk4J5
jGZuKn65PUA40/nu2dM+fwCD/0HloGxhrBRaYx0Pdm6O32MwuVT5Yx7kAN7KnPKC
OjGrq4Rxe8bt4XUCjM48aPZVAeHn0sh/hWBmxC98HneYwpzOnAx3bF7CU2m7RWpZ
Nl+5ojqdg49r0opy3eQFTEES4NHlPI9M52nmOTS9KCIzJacRtmZ7pzQC/dLgykPv
eSo1d5kte1xC75zDPqZp8QrZ+MSb7kealA/r0Zudy5cXd/DEhVl7dNjgzrW4+No4
HM5TveOG23D432Gn0R7doqg1RdfiawmnRioRjzI4GmFRypt/XvfoXXo1LqfUkTil
LiKoOqsrGw27IRoXwbZTQW37PB69fP+rPA/lQYGXjhHXJG/NmtRP+HbxJtxdwOoF
21wS+ps27eEpVpoUGb93+wSdDt9tnrhOMtXVWWPfYmfhNyGviFou5y7OTI/BPblC
roQZdXXlWmDulr42xacXH78uwNtTQye1TS2s+VaE5XgdBATv9HU=
=pX+M
-----END PGP SIGNATURE-----

--v4rbe2jimz4b2bgy--
