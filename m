Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B53023CF678;
	Wed, 25 Mar 2026 13:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774443839; cv=none; b=GAuG/d5dcbBvqfHWITNjCOssEWDwVNBwQCkA7ajh8rdLFNLrhhCajssnbH3tsobl2mYE/KDPeg28ANyC9FeQ300E+dUQirJnWiQytLhjdy/2WqoBQkWjG6F0qLVGHIwSyR5BmR8NkUon9CaQgdrJLjEWeg2KXqu9SeJgJNjDlFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774443839; c=relaxed/simple;
	bh=QES88xL6akW7bBHMi1ukRuC9zuIVipDraXMMpULMd4s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mR+2arCZxtC6sZSajjjMyupIkiGotDW7XH1APxT1mLdpnPF7C1czNCaWgOgUD6DgRw18MRvs0tPH90h2/mMZU3d9GYVUBL9Cv81HNbQ0rTKAxqWsjSPiKDo+THljFERAu0xskh8GvSBX0b1IaJ7AlmKShGIC+C3Ivw8jtG+gyj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IfGO5b0E; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IfGO5b0E"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34D77C4CEF7;
	Wed, 25 Mar 2026 13:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774443839;
	bh=QES88xL6akW7bBHMi1ukRuC9zuIVipDraXMMpULMd4s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IfGO5b0EGBvif6ZEMtFOsz/dXeOeIS+ZMEE81cfyzOc7BQsJZG6irI6vUL7BeI+ji
	 NTteuMdCu7M1LE6oIVKDBh8+49VuC59xIJtF/TC5jVjemprdR51YA8JA14EVQRfnjS
	 xxVeFcVbzGgn+x7MOsS7kileMkN9ygXV1xv88RWXePt2fty0UI2nn3e49xMFqgfVkK
	 GFgqAX5iECIzUV3L3HNvib2JOmLDbTcdQeUt4uzfaMh4VNEXavw9JCcBHgieAjhQ9J
	 Fu9zpyWGOnPF73WZ7Bu4KCqQM5gZRaLeiVFN+/qxfllR0LxNHzu/AiP3qkEyYjTVpA
	 EbcRrSdSkUR3w==
Date: Wed, 25 Mar 2026 13:03:54 +0000
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
Subject: Re: [PATCH v3 01/14] ASoC: tegra: Use dev_err_probe() in
 tegra186_asrc probe
Message-ID: <1fdadbd8-b059-43c8-8e76-b969f7132306@sirena.org.uk>
References: <20260325101437.3059693-1-sheetal@nvidia.com>
 <20260325101437.3059693-2-sheetal@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5cOzXhEXdHc41uXz"
Content-Disposition: inline
In-Reply-To: <20260325101437.3059693-2-sheetal@nvidia.com>
X-Cookie: Those who can't write, write manuals.


--5cOzXhEXdHc41uXz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 25, 2026 at 10:14:24AM +0000, Sheetal wrote:
> Log errors in the Tegra186 ASRC probe path using dev_err_probe().
>=20

There's still dev_err() logging on regmap init failures here (I'll take
this patch, please send a separate patch).

--5cOzXhEXdHc41uXz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnD3TkACgkQJNaLcl1U
h9AwTgf/WYXwN/R2CjhX6WzfQGNGy8hX2hmkLpgvxFIsH087uSia6ub1qWqmJUO5
bXPWCGhsIUflnedTOyc02Tr/7Nz2SdnB2HDaloI0QszS1LGiI9z+MIwN1Gu9CRTX
w5xkezZyG/PQK4rJHYnJJDmymK3a9Hes77mDoiubabaDEntsSGUhu9BJgarIm9QW
2v957e2EnQg7rEwg2s8+oS/NzIOOKsdsB4+avMOXobOCz8uGA9LLUQ0zD3W/m0nT
3hBd+/1Uq2USCSEDtwOuIZxDeia3xdnFtFwfen2bStYOCOVvusMQawg4htIZNaHW
l0nypUXmiHVb5n0S35aypxLTJEKWrQ==
=dmju
-----END PGP SIGNATURE-----

--5cOzXhEXdHc41uXz--
