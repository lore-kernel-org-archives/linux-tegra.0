Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CEAE19D092;
	Thu, 30 Apr 2026 05:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777528800; cv=none; b=sq1Myu9QmYomOnOaeD14/8pdoZli0plNCB1080ir5u6CgkIx3UaORskI9Yds5YyShCoJk/XJO79oPfaMsFPnC6hlMvPpGnVF7BBZSMGqFgo1smUUiNPFw35XealJMOX/KsXwvkSxh9OmsZMduw5HEiPP9pl9MqfJLAu0nPWMejg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777528800; c=relaxed/simple;
	bh=VILLUmaEI3VxYczJPbzj72pY8Mq3pBWIFnAWWa4Byvk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HhQuj5FFf1a7aGVKYLUreCZF57cbvk5dTt2Knc6XTPqzea8iuSVtAxJxqfaaGk063RozBXcqD7A8cmoFy3DXlXcB0IhJnLmGtiEL/yNOd7M246oBKxJok6BadIt6QpeAYqcgoILKY0BOFup1pZHkOZaXXWYl+r/Bfqgf/Qy2LUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PG6+z9J7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PG6+z9J7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CE22C2BCB8;
	Thu, 30 Apr 2026 05:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777528799;
	bh=VILLUmaEI3VxYczJPbzj72pY8Mq3pBWIFnAWWa4Byvk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PG6+z9J7FQZBNNLhhLtp1wXWUuqFN+d6gT8Z+jiVbpfrr2pzJVOfvzL6/ZpF6JdhX
	 9Pwp3BHPR4MsKRxH77+trF0PKx48BNYxHXiWS4DXKbxWBtzHYHCRdRu8+craG4qZDc
	 owWoKx890oN6Ts/0VBxtxT2fx1uAfsin3scVIyu/J6jJg091jreOoroCfxq95WvIGG
	 y7zNIv4NLMqQqieCzYQTgy6nwr2XmvxyHmYgoO47spy6B0rUX0Zof2U3A2wkyG1svB
	 9NlRE80V7Gq+P2ClocdkEwotkbLdRKt2I1nqKWu79xhgLAT5cuPLlG6P4TV33I8fr2
	 lhW7wWOVzvHZw==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 897321AC585D; Thu, 30 Apr 2026 06:59:57 +0100 (BST)
Date: Thu, 30 Apr 2026 14:59:57 +0900
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
Subject: Re: [PATCH v2] ASoC: tegra: Add per-stream Mixer Fade controls
Message-ID: <afLv3S6kWnt0D6PW@sirena.co.uk>
References: <20260429070603.2791011-1-sheetal@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ELuvR44kxn05ZwYn"
Content-Disposition: inline
In-Reply-To: <20260429070603.2791011-1-sheetal@nvidia.com>
X-Cookie: 667:


--ELuvR44kxn05ZwYn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 29, 2026 at 07:06:03AM +0000, Sheetal wrote:
> Add per-stream fade controls for the Tegra mixer to allow
> independently configuring target gain and fade duration for each of
> the 10 input streams (RX1 through RX10).

> +static int tegra210_mixer_get_fade_status(struct snd_kcontrol *kcontrol,
> +					  struct snd_ctl_elem_value *ucontrol)
> +{

> +		if (count >=3D mixer->duration[id]) {
> +			ucontrol->value.integer.value[id] =3D TEGRA210_MIXER_FADE_COMPLETE;
> +			regmap_update_bits(mixer->regmap,
> +					   MIXER_REG(TEGRA210_MIXER_RX1_CTRL, id),
> +					   TEGRA210_MIXER_SAMPLE_COUNT_ENABLE, 0);
> +			mixer->in_fade[id] =3D false;
> +		} else {
> +			ucontrol->value.integer.value[id] =3D TEGRA210_MIXER_FADE_ACTIVE;
> +		}

Is the _FADE_COMPLETE state a good idea here?  Only the first read after
a fade will show it, and functionally it's the same as _IDLE - there's
no current fade running. =20

Also is there any overhead to having the sample counting enabled?  This
is the only thing that turns it off AFAICT so if userspace doesn't look
at the control we'll just leave it running indefinitely.  Perhaps a
timer to disable might be useful?  It's generally a bit odd that we have
a write to the hardware in a get().

> +	SOC_SINGLE_EXT("Fade Enable", SND_SOC_NOPM, 0, 1, 0,
> +		       tegra210_mixer_get_fade_enable,
> +		       tegra210_mixer_put_fade_enable),

Fade Switch.

>  struct tegra210_mixer {
>  	int gain_value[TEGRA210_MIXER_RX_MAX];
> +	u32 duration[TEGRA210_MIXER_RX_MAX];
> +	bool in_fade[TEGRA210_MIXER_RX_MAX];
> +	bool fade_pending[TEGRA210_MIXER_RX_MAX];
>  	struct regmap *regmap;
>  };

gain_value is used by the existing RX n Gain Volume controls, don't we
need separate data for the fade controls here, or should we just have
the new Fade Gain controls?  Having the separate controls is more
complicated.

--ELuvR44kxn05ZwYn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmny79wACgkQJNaLcl1U
h9DydAf/T97FNM3DJU21+ekLVDuQYxuinNrazGteFkDOnbd9lM1t9wcxqb4958Ds
qi9VFgUnjSBSP+kmK3gSs4l5+QsrXRHariwSKh8pdWuaTUlAOuRljbBxwevToVae
kj7JuGD/lj2f66OECG6UTAbfHvbsOHhVdTjFHPZ2XHFQmJ/ChIGOj9T2igj+gDGC
LJqDb/W0DMfEgVifq+RFff3PNepm8DhzgDJ4r5p7mf8DAk6wW/Hp9gW1oVuqOpJH
8UY/Q5F3QLKKO8BLDfeQnxuzLyayVgsdaSIz0Xgf9KxidDCxcKNM6VeZzmpCNQqF
A5jy+fnCxnC2OOYECGTUYK0+yJd/Pg==
=YDWg
-----END PGP SIGNATURE-----

--ELuvR44kxn05ZwYn--
