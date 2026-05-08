Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B8972571B8;
	Fri,  8 May 2026 10:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778235199; cv=none; b=NlzYWzWmR8Z28tKZC/gHMEemPzoRvZB3UmWOXU5NGWvxHgfHCxV3gqBvjbsRxFAPqO6svSU5/B2Fm1KFbVIuQDex4MxPYrHeZ1BJAfwGaryQleEwCzgn+Zo7PNJQgCHvOEPvP+/gNbFoec8yxPsgMcSPrzJH4fx65Jtjd3+5DrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778235199; c=relaxed/simple;
	bh=fVDQzkUKNfl/R0v1s+VN2h2II1UVCJ9Cvjvygizfobo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VEgJqP6oPrhN6W7uDSdM1aw4f/25H4icVJh9hPKdwUi0E/wnBM4bbu2I1y/2zCRZygPcQTcOhN4yxert6l/pEplZFVUMgFyWg/t7LgkHgZZkFI60/MjcVSrDKJLec6ZpGBvPXPzMCOtLZSlqR2gNgwtAp3qYsw4qwC8UcmNfVa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UEBNIA0+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UEBNIA0+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45825C2BCB0;
	Fri,  8 May 2026 10:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778235198;
	bh=fVDQzkUKNfl/R0v1s+VN2h2II1UVCJ9Cvjvygizfobo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UEBNIA0+RPl6p9If692y9KygAvPx+Nulwm9qOdM4w0BB/GRMk/Or/5dlM3Pg+z5DT
	 ScGjSHux0LKwmbWMWm3SRJywdYa9Keme0JofKpCrjItivuY3BVCUlI1O0Ib2W/0v+X
	 +YvK5HRFDgomrD3hAE40TWPQLOAL1tuBIQN+BIpdKVOAvWWs2ieppunrFCxrms65t4
	 BDTHeq+QLaFFYRqAaaAV51tgwFkogdGO0NDWKkKz0DqQDfDyoLDyK9dNI34I2Z5iaH
	 HHaOtRtsWpbYwQNhubLgb9O4Ku87wBqEeh5w7W5vKQX+AfnRZ2CV3LMaGsFOL/5wnd
	 nKQgg0IFTF7hw==
Date: Fri, 8 May 2026 12:13:16 +0200
From: Thierry Reding <thierry.reding@kernel.org>
To: Ethan Tidmore <ethantidmore06@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Mikko Perttunen <mperttunen@nvidia.com>, 
	Kees Cook <kees@kernel.org>, Svyatoslav Ryhel <clamor95@gmail.com>, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] memory: tegra: Fix possible null pointer dereference
Message-ID: <af21Jb1jJgxfyL79@orome>
References: <20260508015716.652347-1-ethantidmore06@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dhmzqmkbiusimksb"
Content-Disposition: inline
In-Reply-To: <20260508015716.652347-1-ethantidmore06@gmail.com>


--dhmzqmkbiusimksb
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] memory: tegra: Fix possible null pointer dereference
MIME-Version: 1.0

On Thu, May 07, 2026 at 08:57:16PM -0500, Ethan Tidmore wrote:
> The function tegra114_emc_find_timing() has the possibility of returning
> null and it's return value 'timing' is dereferenced before it is
> checked for null.
>=20
> Place dereference after null pointer check.
>=20
> Detected by Smatch:
> drivers/memory/tegra/tegra114-emc.c:520 tegra114_emc_prepare_timing_chang=
e()
> warn: variable dereferenced before check 'timing' (see line 515)
>=20
> Fixes: dce208b5405f4 ("memory: tegra: Add Tegra114 EMC driver")
> Signed-off-by: Ethan Tidmore <ethantidmore06@gmail.com>
> ---
>  drivers/memory/tegra/tegra114-emc.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

It's a *very* theoretically possible NULL pointer dereference. Both the
clock and EMC drivers read the timing information from exactly the same
device tree nodes, so their timings should always match. If they don't
something *really* bad is going on and it might be safer to just crash.

On the other hand, if this silences a smatch warning people are just
going to keep sending patches and we might as well just "fix" it now,
so:

Acked-by: Thierry Reding <treding@nvidia.com>

--dhmzqmkbiusimksb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmn9tzgACgkQ3SOs138+
s6EZsQ/5AUAhUVOkCaRFQvpK1d3EfnOmNFu+gmrl/Tm9xcLri0428cDpwoMQBiDD
ULT57uLWPUKbsb7wFh8cUIdMBV4QGKQzT/5e2vQi6tKT8j9MqEAIRwxFqFGJMJHi
/jY/bRIGTFrq7izHhQ5+Gx4/05XRaTl2NKGjKEsTUfeTwnK68d5eW47PrYfPA72Y
3ROEtZ6wIsA6IL9M++UkuRY+kLRAAOTNHFeu2/VhidRO6VOWZZXing7UMacoKg5w
BF/d8DGaAbFWohk/ledLkSkXH9og7I3FQGlYnvPAxZWL1FpkqUepQL/IzQcy1TiL
cJmrub5o8TABC91QnGswZ4tzQ1h7LM6VCtvN3t5+1z1KB2FaQwTev9hDxFRWD4yp
/6JnzPclEnjhbEpbDKQdBv9c/HoaZ+42AHJYW9eb+HCnnvPk63MS88sAXWijrPAy
HLormLUC0QTck+qTG8Rq8DvUMj7i0zZKspxMkR4ek7Cz+Fd82KFrftjuTDI4zoNK
X1sKlynbdaBnIZ2/S3NGdmZv13lgyFPKksqTZmo5hkTOKkZ38yF9NRn9vjo6SoJV
guhHbYTZ3Wi2Frdqr+EVidP/ctdQXkTeNY8ijfsQ2oE8H+GsUuCrzGv9k1uZZ77I
i7gUlYKUAEa3HRSXEQ5ljmFKD40acH52CsrhA7zqqz8bb3rOL2s=
=17iG
-----END PGP SIGNATURE-----

--dhmzqmkbiusimksb--
