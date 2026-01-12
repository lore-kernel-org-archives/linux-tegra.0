Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B72B221D5BC;
	Mon, 12 Jan 2026 13:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768224769; cv=none; b=u0yVJc33Ob/6CnFWUT7V1OmjnUnbJ+a4vzOiK4K4t+DiwsqxdhBncS/juOkm2V0eOfb8LmVLk4IpWjBlCHGekA1WG6nYHl+deedaejLtF0+cSwc/oZbhVvEPAww70BS/fmqDyyNqsfocrFjD8Ae+yWAQXhfCnqlAVZUXzwdAKbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768224769; c=relaxed/simple;
	bh=TvTemodO8ZOiq4qJMaD5+qVcIED0WAb96Y6XEj4ktW0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ufj4yfcLyBm7wgJaKPLjDUDV4BRsrkZhYm3bV+6In1Vuu5A/QGKmFlxIbFe6N5HUmEKyodniYrmWmWax0oGQFrd8Tfzd8oW6d2Ur9fdHaw9Md1+iNRgy1jTs+nJE+SilBbkg5arqdcVcAh14wG85wXmar0GAf68KQSYGGYNpUDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nxAntsnl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nxAntsnl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C03E0C19421;
	Mon, 12 Jan 2026 13:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768224769;
	bh=TvTemodO8ZOiq4qJMaD5+qVcIED0WAb96Y6XEj4ktW0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nxAntsnlW6zqS/xRCXDAGovRoBxUYIJEPwp00w1WLKBYgSnbVlSdZQ0ewWja72chW
	 RIqa+RecVr8KBL1sp4odP7Coo7l7CyRPmm8mGp9MavvR1yuBUzjasLrOeJBMJVGPCT
	 1OD/GsA+foW5/s0dtuvjPBx0ztKfFP0GqaaJd8Wzh+oQHEPXj9XRGiXqGThpNpDkh8
	 4yL/nk88Msp7VZ/ny2M5w49LwZjY2bDKGLw7nzzXuF2Yc7IrL468GUFZK2gAZX+DgG
	 vKCbfXwNDLNmpZW58n5jdImfyEa8m7jGyJ6jWBWAfy1ZIuZ8g3lB5/c2tX6g+m9XXW
	 8AF4t4NqEYWqg==
Date: Mon, 12 Jan 2026 13:32:43 +0000
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
Message-ID: <46339904-debc-407e-bd94-82de26be5cf3@sirena.org.uk>
References: <20260112042841.51799-1-sheetal@nvidia.com>
 <20260112042841.51799-4-sheetal@nvidia.com>
 <bea00d79-35df-43f8-8a3c-62d6db7952ef@sirena.org.uk>
 <cfa7045d-bec6-4b3c-8413-fbcf1f1543e5@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fspn8TNLtx/VwpuA"
Content-Disposition: inline
In-Reply-To: <cfa7045d-bec6-4b3c-8413-fbcf1f1543e5@nvidia.com>
X-Cookie: A company is known by the men it keeps.


--fspn8TNLtx/VwpuA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 12, 2026 at 06:23:39PM +0530, Sheetal . wrote:
> On 12-01-2026 17:56, Mark Brown wrote:

> > This doesn't apply against current code, please check and resend.

> As mentioned in the commit message,

> This patch depends on:
> https://patchwork.ozlabs.org/project/linux-tegra/patch/20251217132524.2844499-1-sheetal@nvidia.com/.

Please include human readable descriptions of things like commits and
issues being discussed in e-mail in your mails, this makes them much
easier for humans to read especially when they have no internet access.
I do frequently catch up on my mail on flights or while otherwise
travelling so this is even more pressing for me than just being about
making things a bit easier to read.

> Kindly let me know if any additional action is required on my part.

Please resend when the dependencies are lined up.

--fspn8TNLtx/VwpuA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmlk9/sACgkQJNaLcl1U
h9BjjQf+Im05h4W4wxCIUJ/nhZMyQ+q5FFSfpVX1rEryssioOCO+bknehrRWzIT/
tynfhaRgz5SN+y8Q2sE2en4Dv+oCZnPnjhEBbVxS0O729kBt+KQfaxI+QxEUokbg
UhWvxlRGKY8r0ZdO4lUJ+3e7/bBd8Zu1IVn2/ijztzah3dHkPMKn7Gkxx2mK2Kgi
QJKrqbKGAF41Fu8Lgyj+N+giN2wq73vKP4KN+1hT5X+pieVTgulJtuYJPlvX8noh
H99tRhPYzppD7vXs8ed3v9QQtpHndVtnwt+6gCOfQ1iFbG2RFxXCqM5+TLGSQZVt
5pyN9jxB2T3p7G0kR86N563YtmFJWQ==
=Q8d5
-----END PGP SIGNATURE-----

--fspn8TNLtx/VwpuA--
