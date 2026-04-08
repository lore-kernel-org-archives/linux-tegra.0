Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 481B933A9F8;
	Wed,  8 Apr 2026 17:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775670109; cv=none; b=Iwsps1zFfP3P1KGEO3h3O907sTBxsNDuPyV76q5b7+t4Sq6m7HGhTJa/mFY+RcS9AHfnNbmTCscf1W5ux1/xh67wzkYbS1Mbi28zTOkxfdevGPLXLGeWPfPCB05rMMUPSB3DgMVRqp9K0R+TilLrh9QFQzIAO+z39JHYSUM4P3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775670109; c=relaxed/simple;
	bh=J84vD1MfHdhlIE45pWpk4QorgWHsZyV9Z6xCzUY9sJA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g9uohN/JnsX+DQN16K8ZflxdhZlmnmjgUptfosr/m6Bnr877uymR7rXsdOqJki2mQ1vf6agzW1CURbv2WGY0N9tD9egIWtBZONPGnH9k3bZTeUidecnX9YhyfEh9oeXesad4ZvkFBykmgyVSpucJLHCqWIZPqXV2fEAMT5OfeWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Br3oYPxw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Br3oYPxw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B04FCC19421;
	Wed,  8 Apr 2026 17:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775670108;
	bh=J84vD1MfHdhlIE45pWpk4QorgWHsZyV9Z6xCzUY9sJA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Br3oYPxwfxE8avFS7AyaPEOtJrWtjvL3Fm90zg6D/SojjwMubCNx8DSNKX1c+IXZo
	 8sjtPcyzK52uN/Unc+jOy0JHGRyp5Q28wVLwmOeVAe1e1StPGSyGoWik6tpdq+CCPc
	 wpy5HtfU2xxTanfOSfeQSB/0y67OeMyhh1/QZqrFQXLRmMOl6+Fjf+NHia9T3vEYvw
	 0UC3E6LZt1eDtGZktlofoFrTZCTuHGi+YTUEZo8FQ7QzixS9jS2i/6FNtRafnGDLPN
	 GpHJ8bUiXrgKhggH1fujysnIfi7g3DAL5cES/Ds2rpgnABgQHGLXFtAUXrcYB+5C37
	 uzSQvlGfTJM/g==
Date: Wed, 8 Apr 2026 18:41:44 +0100
From: Mark Brown <broonie@kernel.org>
To: Piyush Patle <piyushpatle228@gmail.com>
Cc: Sheetal <sheetal@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-sound@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] ASoC: tegra210: simplify byte map handling in ADX
 and AMX
Message-ID: <75436380-cb29-4bb0-bee6-c5a55dec25ae@sirena.org.uk>
References: <20260407170308.100238-3-piyushpatle228@gmail.com>
 <20260408170818.70322-1-piyushpatle228@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rLKbNeXUz46oRQav"
Content-Disposition: inline
In-Reply-To: <20260408170818.70322-1-piyushpatle228@gmail.com>
X-Cookie: Often things ARE as bad as they seem!


--rLKbNeXUz46oRQav
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 08, 2026 at 10:38:16PM +0530, Piyush Patle wrote:
> The Tegra210 ADX and AMX drivers both keep their "Byte Map N" ALSA
> control state as a byte-packed u32 map[] array along with a separate
> byte_mask[] bitmap. This is because the control range exposed to
> userspace is [0, 256], where 256 is the "disabled" sentinel and
> does not fit in a byte, so the two arrays have to be cross-checked
> on every get()/put().

Please don't send new patches in reply to old patches or serieses, this
makes it harder for both people and tools to understand what is going
on - it can bury things in mailboxes and make it difficult to keep track
of what current patches are, both for the new patches and the old ones.

--rLKbNeXUz46oRQav
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnWk1cACgkQJNaLcl1U
h9CV7gf+OnvvdaesJ+iuZqcfsbhlSFtHcqc0HnBEI7swWON42gcgZK1sJ/gNzwrn
S8uvnTcrnhdFBZm6yxtY52ldPjiajMKb7d1VVf5FShfkCdm6sZewYujlA0WJa3YN
Mr4imkGLazSQmeDwUuaP54LCgMFk8wnL/PGzly5S7gnnuhUYtAXoKMsqja77uTqz
f+B3h62B+uY7o1G+bz1zE4lnH4yN9CNFM9Kb3HloOkL2D/cd8AKUPCTK28qq6L4K
Ov0PDP7lbR3SQ7/n0V8hLYtrgDvG8E8eAGIt2zLOJeD0g41DQVe4mS6i0TclfPmg
t5CiBK3j6SSOXYAjpFI/2gnGl0lr4A==
=hyAv
-----END PGP SIGNATURE-----

--rLKbNeXUz46oRQav--
