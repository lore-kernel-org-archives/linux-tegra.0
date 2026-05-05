Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAB8E78F4A;
	Tue,  5 May 2026 01:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777944814; cv=none; b=a6yzqqGX35GYVIGvEq2JSqm2/jPpMfGkZzBHGpXZ5oQxUOnfoHD8ZgkCNz0ztrDpaj6PKIUlYTMY8Fk6lh2jigwemD5oufW6/cz1KfjyrmW3f+4Tp8oZoaP4y5SizznDc5tm5R3w9WcTF3nUjgw6ZaDWXxBy+d8OHZn2NXkaZkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777944814; c=relaxed/simple;
	bh=531U/ura2lGclcMT9muQeinmIdsS8LIUdVAX3tvAsy4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S1xpPcGzpL57hm5PS03MNHs/ojsjMQ8arrDeFnJ9CcT0dZ2E7BDDjno0E5QLFDySH0wU3crbTJ9wv/vk3tp9Q82gln3iBQNWjlltrAtNM167iGAn0+vsuL0mgbh7iMxiwtgnOT9HG3JhNeGNNT6E4t+m6a0r1GJqoY/+f9QeeCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TcrBL9Qj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TcrBL9Qj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32159C2BCB8;
	Tue,  5 May 2026 01:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777944814;
	bh=531U/ura2lGclcMT9muQeinmIdsS8LIUdVAX3tvAsy4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TcrBL9QjrDAsDwjWv4afTcgoMhSpWEzKqwdxnXCqQTmMCDoCocmu5yXSpINQGaMfz
	 R5haR4luO2MvOD7MLoyS5/JSPETHcO3zggS0kjzzEJZ927vQlEbu0glUYx1WsuEvOz
	 HbCG1fm5XsqUMMCzjg29hK16b/L+xGaXXFlUw4836Hqg/uMxDBlht6N73XyGiaGgkf
	 Omfdvw1FBkjLZcMlN0W543l6OfQEJhl8vZhzA/NUlZONlIc0hM1LO1kXYRNjYHPN4g
	 VH4xMlzJP6yo5eKRswJ18OzledVeZFeiy3Tkf6b6kD2W8toJJaxPm/u0lZ0PAmm9bR
	 EIxDsOoYi/s7A==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 111451AC586C; Tue, 05 May 2026 02:33:32 +0100 (BST)
Date: Tue, 5 May 2026 10:33:32 +0900
From: Mark Brown <broonie@kernel.org>
To: Sheetal <sheetal@nvidia.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sameer Pujar <spujar@nvidia.com>, Mohan Kumar <mkumard@nvidia.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-sound@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] ASoC: tegra: Add per-stream Mixer Fade controls
Message-ID: <aflI7IFr6nt05g4R@sirena.co.uk>
References: <20260504100051.3820808-1-sheetal@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="TwBU4RHH5eeFXzaY"
Content-Disposition: inline
In-Reply-To: <20260504100051.3820808-1-sheetal@nvidia.com>
X-Cookie: Alex Haley was adopted!


--TwBU4RHH5eeFXzaY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 04, 2026 at 10:00:51AM +0000, Sheetal wrote:

> +static int tegra210_mixer_put_fade_duration(struct snd_kcontrol *kcontrol,
> +					    struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct soc_mixer_control *mc =
> +		(struct soc_mixer_control *)kcontrol->private_value;
> +	struct snd_soc_component *cmpnt = snd_kcontrol_chip(kcontrol);
> +	struct tegra210_mixer *mixer = snd_soc_component_get_drvdata(cmpnt);
> +	unsigned int id = mc->reg;
> +	u32 duration = ucontrol->value.integer.value[0];
> +
> +	if (duration == 0)
> +		return -EINVAL;
> +
> +	if (mixer->duration[id] == duration)
> +		return 0;
> +
> +	mixer->duration[id] = duration;
> +	mixer->fade_pending[id] = true;
> +
> +	return 1;

We're not validating against TEGRA210_MIXER_FADE_DURATION_MAX here,
similarly for the gain.


> +static int tegra210_mixer_get_fade_status(struct snd_kcontrol *kcontrol,
> +					  struct snd_ctl_elem_value *ucontrol)
> +{

> +		if (count >= mixer->duration[id]) {
> +			ucontrol->value.integer.value[id] = TEGRA210_MIXER_FADE_IDLE;
> +			mixer->in_fade[id] = false;

This doesn't disable the sample counting so subsequent enables will be
noops (due to use of _update_bits()).

--TwBU4RHH5eeFXzaY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmn5SOsACgkQJNaLcl1U
h9DFqgf/RN2JgQVwd8dwjlnkphKnsXAyl9hIfOWWJ6X4YesN+kTET713RTWIRwnS
H0uRUOW4wEaBUY7ukytDQq9ZM9pYyeNm9YvE0w5aL1ORdpFC4h3SBiD0wC0ixUxR
iRChXAFYOfDuKYh5L+0kNsw7LrG/iwv+mPhW2DNwrrtBhkHjvnoU1H4aNLmT3WfE
FvDSbJb0zADimA/j8TQ/3I1QPpE7KYeYbnXmUdiPOaxzPqULz744tvC01wCVv5r9
IH5wBGNxbkQ4x/AU/vddiN/UCq0ChWfvwwrt/d44l2s53BGGgvrI0UYE28Are4+C
6XeBmhR0SPIbdFTVpTe/rx5A7bwu6Q==
=CNlT
-----END PGP SIGNATURE-----

--TwBU4RHH5eeFXzaY--
