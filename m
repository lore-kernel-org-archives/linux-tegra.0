From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 03/10] ASoC: tegra: add Tegra210 based DMIC driver
Date: Fri, 21 Feb 2020 13:00:05 +0000
Message-ID: <20200221130005.GD5546@sirena.org.uk>
References: <1582180492-25297-1-git-send-email-spujar@nvidia.com>
 <1582180492-25297-4-git-send-email-spujar@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="2Z2K0IlrPCVsbNpk"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1582180492-25297-4-git-send-email-spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sameer Pujar <spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: perex-/Fr2/VpizcU@public.gmane.org, tiwai-IBi9RG/b67k@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sharadg-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mkumard-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, viswanathl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, rlokhande-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, dramesh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, atalambedu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--2Z2K0IlrPCVsbNpk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Feb 20, 2020 at 12:04:45PM +0530, Sameer Pujar wrote:

> +++ b/sound/soc/tegra/tegra210_dmic.c
> @@ -0,0 +1,515 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * tegra210_dmic.c - Tegra210 DMIC driver
> + *
> + * Copyright (c) 2020 NVIDIA CORPORATION.  All rights reserved.

Please make the entire comment a C++ one so things look more
intentional.

> +	/* Below enables all filters - DCR, LP and SC */
> +	{ TEGRA210_DMIC_DBG_CTRL, 0xe },

So this isn't the hardware default?

> +	srate = params_rate(params);
> +	if (dmic->srate_override)
> +		srate = dmic->srate_override;

How does this work for userspace?  If we just ignore the sample rate we
were asked for I'd expect that the application would get upset.

> +	if (strstr(kcontrol->id.name, "Boost Gain"))
> +		dmic->boost_gain = value;

Volume controls should end in "Volume".

> +	else if (strstr(kcontrol->id.name, "Audio Channels"))
> +		dmic->audio_ch_override = value;

This is something that would usually come from hw_params?

> +	else if (strstr(kcontrol->id.name, "LR Polarity Select"))
> +		dmic->lrsel = value;

This and some of the others look like they're describing details of how
the board is wired up so I'd not expect them to be runtime selectable?

> +	SND_SOC_DAPM_MIC("Dummy Input", NULL),

This is just the microphone that happens to be attached, isn't it?  If
so that's a weird name.

> +static const char * const tegra210_dmic_mono_conv_text[] = {
> +	"ZERO", "COPY",
> +};

It'd be more idiomatic for ALSA to write these as Zero and Copy.

> +	SOC_ENUM_EXT("Channel Select", tegra210_dmic_ch_enum,
> +		     tegra210_dmic_get_control, tegra210_dmic_put_control),
> +	SOC_ENUM_EXT("Mono To Stereo",
> +		     tegra210_dmic_mono_conv_enum, tegra210_dmic_get_control,
> +		     tegra210_dmic_put_control),
> +	SOC_ENUM_EXT("Stereo To Mono",
> +		     tegra210_dmic_stereo_conv_enum, tegra210_dmic_get_control,
> +		     tegra210_dmic_put_control),

I'd expect these to be in DAPM.

--2Z2K0IlrPCVsbNpk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5P1FQACgkQJNaLcl1U
h9BA2Af/VZiFzp4MoCq6aYyxTqN++XhNykseNkA914Q2unjc80Do1s4RvyBiVMMC
wBE6BBamgXepZrzc9ZWbWkzZfVELsrMSoQd7vM/fhpf9tGek5CWS6vpJH2RvB4v+
O9C3WID4h/y+P9Hhk1wfqW76BDWm/iU3qlSc+TOwsV1pX3DG99lXX91VDg7J5llP
nA0V3PRaJzrhMeIYpNv2O8ZeG6mCYgsUJ3KzgDcqYn25Ry+BlV92ABRPq4jQrere
feW4lb8CKHMkTxj88Y7AmSRbYrqFoztdu9ce9APLVRVnDU9BcvediwEroMXKvGoQ
78AyFutp7288RxEv5Bwa85y4EMQaxQ==
=oc1c
-----END PGP SIGNATURE-----

--2Z2K0IlrPCVsbNpk--
