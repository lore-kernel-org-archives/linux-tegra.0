Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93DB46F2F2;
	Thu, 30 May 2024 11:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717066984; cv=none; b=NWMngKIfnYYsGfl5SuPnDVZt4nDmifQZe8eooeg6JdPI+gT57eWBPA21hMvCGpIBnkpnYb8iNKMNYk8MBz//i9zcjH7r3iNVzhphmkE+kpSQkhi0Ge78uxNBoGl9hz75sRiuoaLSM0otWBRlHkzGTgw0Qme+YETVP4CgXuyVczY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717066984; c=relaxed/simple;
	bh=i/cH1Oed34nB4rUVqJOO34KFhysDv2OP2yNOxaD2bRU=;
	h=Content-Type:Mime-Version:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=RxYW4olWE6l0n6dfOY84Kb2Nh8jyx2hdL+W9DZBuSsZzniq7k9fnmBE5TTGhkrLzhi4DmYSUCV2j7GKmcLnp+HJLqItVVced/Ky38on7RWObUMgwyZU+yPRbnMR3j8NUFGeP6OpQbSDPoQC+hY+C77vrWWfiHP3wcYN0jb0hics=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PLdPuVuL; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PLdPuVuL"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a6341cf2c99so63679266b.0;
        Thu, 30 May 2024 04:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717066981; x=1717671781; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IN8Ag9dsU+qcO8AbayqXPvzgIuVH1q2hLdD6f3uNqMk=;
        b=PLdPuVuLMpPEuBlz2ngydR/wIwv7l1URk0hp4qdYwad4+js7nkeY+xabgx0/oovPTQ
         etCxX51iMRl+yXuizHT4/HLgfrEmxC06X9NxSylcdLj8gPdi5y/LiB30jTtF5ewMIAhr
         W0fEpJohPrg75ZZIl6kwEZsF6oSWAGodRb1Esf6MgiI1DHBcthcZ6qjUZRvcopba6mRb
         gWWzM2gqsiqV79K+/8C+BCA20bGdK09e9cKmOU1GRwliGt7Cxy4fjH8en0prlEsW3Jmh
         gDk9IJhZZD7p9vEQ0dn27/zEDuD24nHJYEsAZdjVwWdKBrtmK4Zv64nt3iB+wZDl1mNl
         K7/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717066981; x=1717671781;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IN8Ag9dsU+qcO8AbayqXPvzgIuVH1q2hLdD6f3uNqMk=;
        b=rMakkOPpeSRDrHXt9AB1phvqSiFAm+OZNy4Ld5lFsGcy6u7+vgQKQZ5knjI+u11vvC
         ZEmlFYIxlyvrSpFH+QadGF43FzYaEe72HFfz4vEY8vSskWzmoReBz7BCxKPRqfWtFNNp
         RGSkFcMEsxaotv6bn4fxuneZ/w/5kYbBEKLTvSb2JmAbxoCiOE2/+mqkq+dLoqadeXsS
         3KQGxWVcVRwidyeISwXjR7Rj6hOQx+Kxa8BGgqxRTd9tX8PGBSvCCKOpyLfwQU2Q29yP
         6hbuMnGHJuHJoV9zlkyl1Iw8dB+dnIxdg9OEFDno6Gvu8wnHGquGOLGiB4LzDbSMEmGM
         IlWw==
X-Forwarded-Encrypted: i=1; AJvYcCXEhWu0R2zWfTR5kGDaa2p+2SEQ8urwaIXBABJzDCrjC9056WustSDZVqCmafA1UWUogpJrK29owUKpMwZosXp+QrTOHnsfqixy7MJQ9/L7y+omM5R6fZlwxdwNMO+pIIx0SsiVewA1sWY=
X-Gm-Message-State: AOJu0Yz9o22PXSwJY/8ZkWgbfs4xlv3go2ppdjHIHZMIkDyqS+qoME99
	yV+czAW06wv7WiC88ybygEo1urBR9aKDY1oRj99CsvBOrpMDd3/c
X-Google-Smtp-Source: AGHT+IHcCmk/btCzRhf9yemPdTTGPMH1O3rBjgm7CRQKcXYJ1AMKlRTHe3fRaWloMB1fhTa7FypVIA==
X-Received: by 2002:a17:907:cc19:b0:a65:d7f7:f3f5 with SMTP id a640c23a62f3a-a65e8d3653amr95250066b.8.1717066980545;
        Thu, 30 May 2024 04:03:00 -0700 (PDT)
Received: from localhost (p200300e41f162000f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f16:2000:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a626cc8c1a1sm807898066b.166.2024.05.30.04.02.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 May 2024 04:03:00 -0700 (PDT)
Content-Type: multipart/signed;
 boundary=b04e15e85d503ad3de99a862da1f51c734f1e4825c9724c1f5249d05531d;
 micalg=pgp-sha256; protocol="application/pgp-signature"
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Date: Thu, 30 May 2024 13:02:59 +0200
Message-Id: <D1MXG0PGXQW8.2GBRKOVBQM49H@gmail.com>
Cc: <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <lgirdwood@gmail.com>, <jonathanh@nvidia.com>, <mkumard@nvidia.com>
Subject: Re: [PATCH v2 1/2] ASoC: simple-card-utils: Split
 simple_fixup_sample_fmt func
From: "Thierry Reding" <thierry.reding@gmail.com>
To: "Sameer Pujar" <spujar@nvidia.com>, <broonie@kernel.org>,
 <linux-sound@vger.kernel.org>, <alsa-devel@alsa-project.org>
X-Mailer: aerc 0.16.0-1-0-g560d6168f0ed-dirty
References: <20240527125608.2461300-1-spujar@nvidia.com>
 <20240527125608.2461300-2-spujar@nvidia.com>
In-Reply-To: <20240527125608.2461300-2-spujar@nvidia.com>

--b04e15e85d503ad3de99a862da1f51c734f1e4825c9724c1f5249d05531d
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Mon May 27, 2024 at 2:56 PM CEST, Sameer Pujar wrote:
> From: Mohan Kumar <mkumard@nvidia.com>
>
> Split the simple_fixup_sample_fmt() into two functions by adding
> one more function named simple_util_get_sample_fmt() to return
> the sample format value.
>
> This is useful for drivers that wish to simply get the sample format
> without setting the mask.
>
> Signed-off-by: Mohan Kumar <mkumard@nvidia.com>
> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
> ---
>  include/sound/simple_card_utils.h     |  2 ++
>  sound/soc/generic/simple-card-utils.c | 26 ++++++++++++++++++++------
>  2 files changed, 22 insertions(+), 6 deletions(-)
>
> diff --git a/include/sound/simple_card_utils.h b/include/sound/simple_car=
d_utils.h
> index ad67957b7b48..2c2279d082ec 100644
> --- a/include/sound/simple_card_utils.h
> +++ b/include/sound/simple_card_utils.h
> @@ -174,6 +174,8 @@ void simple_util_parse_convert(struct device_node *np=
, char *prefix,
>  			       struct simple_util_data *data);
>  bool simple_util_is_convert_required(const struct simple_util_data *data=
);
> =20
> +int simple_util_get_sample_fmt(struct simple_util_data *data);
> +
>  int simple_util_parse_routing(struct snd_soc_card *card,
>  				      char *prefix);
>  int simple_util_parse_widgets(struct snd_soc_card *card,
> diff --git a/sound/soc/generic/simple-card-utils.c b/sound/soc/generic/si=
mple-card-utils.c
> index 81077d16d22f..f1f5a1c025fc 100644
> --- a/sound/soc/generic/simple-card-utils.c
> +++ b/sound/soc/generic/simple-card-utils.c
> @@ -13,12 +13,11 @@
>  #include <sound/pcm_params.h>
>  #include <sound/simple_card_utils.h>
> =20
> -static void simple_fixup_sample_fmt(struct simple_util_data *data,
> -					 struct snd_pcm_hw_params *params)
> +int simple_util_get_sample_fmt(struct simple_util_data *data)
>  {
>  	int i;
> -	struct snd_mask *mask =3D hw_param_mask(params,
> -					      SNDRV_PCM_HW_PARAM_FORMAT);
> +	int val =3D -EINVAL;
> +
>  	struct {
>  		char *fmt;
>  		u32 val;
> @@ -33,11 +32,26 @@ static void simple_fixup_sample_fmt(struct simple_uti=
l_data *data,
>  	for (i =3D 0; i < ARRAY_SIZE(of_sample_fmt_table); i++) {
>  		if (!strcmp(data->convert_sample_format,
>  			    of_sample_fmt_table[i].fmt)) {
> -			snd_mask_none(mask);
> -			snd_mask_set(mask, of_sample_fmt_table[i].val);
> +			val =3D of_sample_fmt_table[i].val;
>  			break;
>  		}
>  	}
> +	return val;
> +}
> +EXPORT_SYMBOL_GPL(simple_util_get_sample_fmt);
> +
> +static void simple_fixup_sample_fmt(struct simple_util_data *data,
> +				    struct snd_pcm_hw_params *params)
> +{
> +	int val;
> +	struct snd_mask *mask =3D hw_param_mask(params,
> +					      SNDRV_PCM_HW_PARAM_FORMAT);
> +
> +	val =3D simple_util_get_sample_fmt(data);
> +	if (val >=3D 0) {

Maybe nothing that we need to worry about, but this could be potentially
a problem if the snd_pcm_format_t ever outgrows the non-negative number
space. snd_pcm_format_t is defined to be an int as well, so any very
large number would wrap into a negative value and then would be
considered an error in this check.

Then again, if that ever were to happen, we'd likely get a compiler
error for the snd_pcm_format_t overflowing, so we'd probably notice and
rewrite at that point.

So I suppose:

Reviewed-by: Thierry Reding <treding@nvidia.com>

--b04e15e85d503ad3de99a862da1f51c734f1e4825c9724c1f5249d05531d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmZYXOMACgkQ3SOs138+
s6Hq1Q/+O1LuOBIU5Ga0AXMC62PY26RnEsxrv6TJtxcqwaolgwRpZlyOUDAzVvsg
ltAPTkzGEK3kTTeilIIMN2ZXK6fmMYH9qwF8AebVBUtNhRqIo/UnQsz9O6gzxPMa
ZbpfwO/MZGm06ZcKidnTDmLtRotFEx/6o0LW/tJhabOow998nCrD1yGdq3oXGFRC
lqovd9U1RoeI5IP4r3zJpJ5GbYSc/a9K04vqwq9nkvClx2xNoA03KuHce2FtkjAj
R6xknIHgcSKHIoh82lQE6pDOPt26+/Fd80b5UwqRtr74IRiUmJOboRxWKMqoJNiY
TQgIE5PN0R1OGKzrBLb/0kMLXM+VYa5LJKQMxI9FWTWNVx0B79Vyrb1lE8hMpcgE
yRuvzBHWeYedzriZDJgwEdVVayBf2u2rAoXTRGRtuBAmywtoek3oakbPxYArfnXb
fjtgV3wq9x/37DJZtPVKBU57IOxu/Pbz2SqWdw81b8DfT931IPeq4sMn+0rnv15m
zXuIMuqKefis9QMHAEmLjsCfPCnDmZCdXQdELspUMXNBprZNYrOmFctd4xStilvs
WKsKuAk0Kgox0qGDKM8fPH2F8LexSIZc41UT1EgLTlO1bZ9keROIUCoFpReQg0ET
xv/16iwcHORl2WGuLvkvBIWQ/AISHDJB8czKV3OB15j2vWTwxz8=
=dpDb
-----END PGP SIGNATURE-----

--b04e15e85d503ad3de99a862da1f51c734f1e4825c9724c1f5249d05531d--
