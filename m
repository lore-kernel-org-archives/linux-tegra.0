Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37F523CF69C;
	Wed, 22 Apr 2026 11:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776857181; cv=none; b=OEiUKGnLkcVcofbqfJloBpaEbDLd2rz5w4hUmlT+OHdKpY5svJh3xpQ8B9QjvFguWZL8y1IAgHqdEMbIvsAeNmdH2E+kfDYa6bQJR9ihcf6TDODa6KRbE9pgVjKXwFrAkE+1bcIKDvb5PVUv7BO+le2V/A+PSlCb7TCATzudYXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776857181; c=relaxed/simple;
	bh=PogCZHVp0QQqzo41o3AKHaILLQ5MixRXQwwxYi5qMnw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZZTwdm9FlcHPaPzen4dblV0ZSGv9Jtgrnbv8ZZLPybEYMIIm5XpY7KMH/yQ25m3d4CfFlMWcC3mJuqfn7gWjz9cwQHUiN+BKlUpfx0oWPkjP2pXs/65+6a39pkuq8mpWfBVkJ2PAKvySd4DyB2Kf/EeqRffsxD42tTgkT5d8/Wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TwVhreVa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TwVhreVa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C6FFC2BCB6;
	Wed, 22 Apr 2026 11:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776857180;
	bh=PogCZHVp0QQqzo41o3AKHaILLQ5MixRXQwwxYi5qMnw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TwVhreVaJWOzpcLPMLVbRR50lj5g7mvXxOO4tn1YXauPkjUrs6rX754YUn135FAS2
	 IdHUt254SoUmOwUREEqQPEp/OYTb6XNygi53b4Ob2+1e0rU4GfvwJRTG3CGYMqJiOK
	 gx63uvPsu8e0x3m7zBMYRNaa+HaB5892F/SaLwfQ436KoyGq1/+3XBvs0CwkWc/rZ5
	 U87/UhKdMOxJV+6EBcLQK8iWTf2jtdFkC0mChnS65ooVWM8WCsEmKp2kLjCVj88DWa
	 E4SM6HCaZuqg2rzhZNuE5Ee1fAc77N6RI2mPM1Pfo2x2TWHF4X+EzMjouXyacI00VL
	 EJn4fVE4VfTfw==
Date: Wed, 22 Apr 2026 12:26:15 +0100
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
Subject: Re: [PATCH] ASoC: tegra: Add Mixer Fade controls
Message-ID: <aea9de3f-1128-49b1-a6e6-cc467d76673b@sirena.org.uk>
References: <20260422102957.2706861-1-sheetal@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xsRwQoHyr+8dlzzD"
Content-Disposition: inline
In-Reply-To: <20260422102957.2706861-1-sheetal@nvidia.com>
X-Cookie: I'm definitely not in Omaha!


--xsRwQoHyr+8dlzzD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 22, 2026 at 10:29:57AM +0000, Sheetal wrote:
> Add fade controls for the Tegra mixer to allow the user to configure
> the gain and duration for each mixer stream. The mixer supports up to
> 10 input streams (RX1 through RX10), each with independently

>   amixer -c <card> cset name="MIXER1 Fade" \
>     "<id1>,<gain1>,<duration1>[,<id2>,<gain2>,<duration2>,...]"
>   id       - mixer input RX stream index (1 to 10)
>   gain     - target gain level
>   duration - fade duration in samples (N3 parameter)

This would be more idomatically represented as 10 pairs of controls, one
with the gain and one with the duration.  Possibly also with an
additional strobe control which actually makes the changes take effect
if there's a need to do a block of them at once.

> +static int tegra210_mixer_put_fade(struct snd_kcontrol *kcontrol,
> +				   struct snd_ctl_elem_value *ucontrol)
> +{

> +	struct snd_soc_component *cmpnt = snd_kcontrol_chip(kcontrol);
> +	struct tegra210_mixer *mixer = snd_soc_component_get_drvdata(cmpnt);
> +	u32 rx_id, rx_gain, rx_duration;
> +	int id, base, err = 0;
> +
> +	/* Process array of RX stream parameters (id, gain, duration) */
> +	for (id = 0; id < TEGRA210_MIXER_RX_MAX; id++) {
> +		base = 3 * id;
> +		rx_id = ucontrol->value.integer.value[base];
> +		rx_gain = ucontrol->value.integer.value[base + 1];
> +		rx_duration = ucontrol->value.integer.value[base + 2];

I'm not seeing much validation of these, for example it looks like you
can set a duration of 0 quite happily which seems to be a problem as we
divide by the duration when configuring.

> +               /* Only update if values are different */
> +               if (mixer->duration[rx_id] != rx_duration ||
 +                   mixer->gain_value[rx_id] != rx_gain) {
> +                       err = tegra210_mixer_configure_gain(cmpnt, rx_id, false);

...

> +                       mixer->duration[rx_id] = rx_duration;
> +                       mixer->gain_value[rx_id] = rx_gain;

Doesn't this mean that the values that get configured are the ones that
were previously set, not the new ones?

--xsRwQoHyr+8dlzzD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnosFcACgkQJNaLcl1U
h9Aq5Qf/X6PZgI26EwaU2QoOpndpmHVCIog2npSYT+dQxAFBzPOwFCdEvrixXZOX
poWrO0LQgKPUpNFllp1yJAS37A/HIC/uHTkhPjmD+5Trr3NpKq4+ip2OcRLxW6w8
80DTsmH+jo01hNSQrzEBYN76taxXRjQ9Q4jTDVAi2Mryti8xFwGl0D2j+FUbRggP
1/+YYmnI8DC2xRXRTmJp0ikaeb+t5KxQtK6P9JsGE15BncYMLnOu+khKe2eODnVB
j86H/gykWMCYdQgyQDwPFXC6Z3OT5jVT61nCrQUbcWvuQxeD7ug42me0GzTCLHFF
vxYDXDBI/EGTHU65w4sQyctSfThj8g==
=0Khg
-----END PGP SIGNATURE-----

--xsRwQoHyr+8dlzzD--
