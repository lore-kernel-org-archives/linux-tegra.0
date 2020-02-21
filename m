From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v3 04/10] ASoC: tegra: add Tegra210 based I2S driver
Date: Fri, 21 Feb 2020 13:21:28 +0000
Message-ID: <20200221132128.GE5546@sirena.org.uk>
References: <1582180492-25297-1-git-send-email-spujar@nvidia.com>
 <1582180492-25297-5-git-send-email-spujar@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="FEz7ebHBGB6b2e8X"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1582180492-25297-5-git-send-email-spujar@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sameer Pujar <spujar@nvidia.com>
Cc: perex@perex.cz, tiwai@suse.com, robh+dt@kernel.org, lgirdwood@gmail.com, thierry.reding@gmail.com, jonathanh@nvidia.com, digetx@gmail.com, alsa-devel@alsa-project.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, sharadg@nvidia.com, mkumard@nvidia.com, viswanathl@nvidia.com, rlokhande@nvidia.com, dramesh@nvidia.com, atalambedu@nvidia.com
List-Id: linux-tegra@vger.kernel.org


--FEz7ebHBGB6b2e8X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Feb 20, 2020 at 12:04:46PM +0530, Sameer Pujar wrote:

> @@ -0,0 +1,938 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * tegra210_i2s.c - Tegra210 I2S driver
> + *

All C++ please.

> +static void tegra210_i2s_set_data_offset(struct tegra210_i2s *i2s,
> +					 unsigned int data_offset)
> +{
> +	unsigned int mask = I2S_CTRL_DATA_OFFSET_MASK;
> +	unsigned int shift = I2S_DATA_SHIFT;
> +	unsigned int reg;
> +
> +	reg = TEGRA210_I2S_TX_CTRL;
> +	regmap_update_bits(i2s->regmap, reg, mask, data_offset << shift);
> +
> +	reg = TEGRA210_I2S_RX_CTRL;
> +	regmap_update_bits(i2s->regmap, reg, mask, data_offset << shift);

The way this is written is *weird*, especially the use of reg - it'd
probably be clearer to just use the values directly rather than have
these intermediate temporary values.

> +static int tegra210_i2s_get_control(struct snd_kcontrol *kcontrol,
> +				    struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_component *compnt = snd_soc_kcontrol_component(kcontrol);
> +	struct tegra210_i2s *i2s = snd_soc_component_get_drvdata(compnt);
> +	long *uctl_val = &ucontrol->value.integer.value[0];
> +
> +	if (strstr(kcontrol->id.name, "Loopback"))
> +		*uctl_val = i2s->loopback;
> +	else if (strstr(kcontrol->id.name, "Sample Rate"))
> +		*uctl_val = i2s->srate_override;
> +	else if (strstr(kcontrol->id.name, "FSYNC Width"))
> +		*uctl_val = i2s->fsync_width;
> +	else if (strstr(kcontrol->id.name, "Playback Audio Bit Format"))
> +		*uctl_val = i2s->audio_fmt_override[I2S_RX_PATH];
> +	else if (strstr(kcontrol->id.name, "Capture Audio Bit Format"))
> +		*uctl_val = i2s->audio_fmt_override[I2S_TX_PATH];

Same issue as the DMIC driver, these really shouldn't be exposed to
userspace as regular controls.

> +	/*
> +	 * For playback I2S RX-CIF and for capture TX-CIF is used.
> +	 * With reference to AHUB, for I2S, SNDRV_PCM_STREAM_CAPTURE stream is
> +	 * actually for playback.
> +	 */
> +	path = (substream->stream == SNDRV_PCM_STREAM_CAPTURE) ?
> +	       I2S_RX_PATH : I2S_TX_PATH;

Please write normal conditional statements, it makes things easier to
read.

--FEz7ebHBGB6b2e8X
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5P2VcACgkQJNaLcl1U
h9D/awf/U2ZCR7nNWNrI95I8xTMDKuA/JDQe0xYLuDIfs3GKQSPQMpUDhki+WZMN
DqFveacFKjMaU6kxGpoFWONkDSLzRjWguMjv0+SwXJPDbwYmJFsfOFNPc8AjXIDc
YsgXv6n/zHWQGC9w7tU3/Goy7n87FGWsBIKsBAQF2K4ZhubTgA9zggVBKLArj7J1
WpidsKFtr0DqBk/BKpQfERYQIQqND2xScFnTkrp80A55wu0rzNW2wP4XXWcOkPbS
jYoVHY81EV3ExQzN3T7FbOO6PWfXZMPwUw+UwfODLvFCbpmQJSkiMiv5x4qXJDrS
wxx80JuxpcjWr6qKYltb4t/R/+AgZg==
=0K47
-----END PGP SIGNATURE-----

--FEz7ebHBGB6b2e8X--
