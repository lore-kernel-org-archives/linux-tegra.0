Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3918450415;
	Mon, 21 Sep 2026 11:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789991413; cv=none; b=OtcgumG+rXSKIdMv+7Z3bpT6VRdx0aHKqvZbsP7UsSVlmlhDT7KG3LsFLWFjsFmWde+/JsROk3Ew/2K7IxOY4KkSXhLE63GVlp6/VhrPJJNQ1avxf3XfR+t0/uEomjifMMvXYW+fb3gkKgreDTuALMbwSCfDH6F9wNoZ7ZYs9aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789991413; c=relaxed/simple;
	bh=BuYCbG4609uclEMiwwu1T1LUi0se/44kkBsJzTS6KKI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ot+Q+AfivfkzNRZFGzAfwFf2ff0c3pRZeZX0nDQ0SdJbkDVWYOrKj7at1Zi7IxN+AxHIv9MLLzg3+QPnMVhppnVW1bCuSXF3j993T3zOhCUv7Qpz7Fw7RT3NgLVNz+bMVo1tUFfTRqfreGob60w92aPdVSXlF7cdTDsk8swifhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ChroMDjY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ChroMDjY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBB501F000FF;
	Mon, 21 Sep 2026 11:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789991411;
	bh=11cfo609n2zF2bKHSoLIybH1BMS+6xWU1lGWi8txzk0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ChroMDjY3X4zE9Pd/uKNUTiIFatEPF/yJ134c+PDVNorxj8i5rvRC57BSQO1Z+14Y
	 TKF4XAjauGcGnU/kFLufTPulb+8rT9i0tUeVDAooswlB4JtNm6yWo2sk4gD/P5lU1k
	 H0BBo3rHzHiiQ9RfLROjCrcYO0wPX7Z9VtAlfcu4C8BjWeuLDRrRAc9dVjMsVfUE3N
	 gqg1InkdxMut4fd7FVf3CjUVGU85jpan2OUnKC0qC524YMA4op246TdagphfcZTTM1
	 LDf+6iTH19r9sNev+/8SRZdUGyTqXJ8ft7F1tmNyzN6r2jRTpHu+iAqh2QNghF5l1e
	 WU14HLKpEPREw==
Date: Mon, 21 Sep 2026 13:50:08 +0200
From: Thierry Reding <thierry.reding@kernel.org>
To: Sheetal <sheetal@nvidia.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Sameer Pujar <spujar@nvidia.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Mohan Kumar <mkumard@nvidia.com>, linux-sound@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 2/3] ASoC: tegra: Update ASRC ratio controls
Message-ID: <arEYfjIHa4w--rTE@orome>
References: <20260921085704.1248920-1-sheetal@nvidia.com>
 <20260921085704.1248920-3-sheetal@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pjqavvxthiz3kxji"
Content-Disposition: inline
In-Reply-To: <20260921085704.1248920-3-sheetal@nvidia.com>


--pjqavvxthiz3kxji
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [RFC PATCH 2/3] ASoC: tegra: Update ASRC ratio controls
MIME-Version: 1.0

On Mon, Sep 21, 2026 at 08:57:03AM +0000, Sheetal wrote:
> Replace the separate integer and fractional ASRC ratio controls with a
> single two-value control for each stream. This is a userspace-visible
> control ABI change, but:
>=20
> 1. Keeping writable compatibility controls would preserve the non-atomic
>    update path that can expose a transient mixed ratio to hardware.
> 2. This is limited to only the Tegra ASRC driver.
>=20
> Validate both values before programming hardware. The fractional field
> keeps the existing 32-bit maximum, while the integer field is rejected
> when it exceeds the hardware field width.
>=20
> ALSA exposes one min and max range for all values in an integer-array
> control, so the paired ratio controls advertise the fractional field's
> full 32-bit range. The put callback validates the integer part separately
> against the hardware field width.
>=20
> Serialize ratio-source changes, stream setup, and ratio updates with a
> driver mutex so cached ratio state and paired hardware programming remain
> consistent.
>=20
> Unlock and re-lock the ASRC stream before programming a software ratio
> when the new ratio differs from the cached ratio by more than 20%.
> Large ratio jumps require the hardware lock to be refreshed around the
> paired integer/fractional update.
>=20
> Roll back the previous hardware pair and lock state if a paired ratio
> update fails after partially programming the hardware.
>=20
> Signed-off-by: Sheetal <sheetal@nvidia.com>
> ---
>  sound/soc/tegra/tegra186_asrc.c | 443 ++++++++++++++++++++------------
>  sound/soc/tegra/tegra186_asrc.h |   4 +
>  2 files changed, 276 insertions(+), 171 deletions(-)
>=20
> diff --git a/sound/soc/tegra/tegra186_asrc.c b/sound/soc/tegra/tegra186_a=
src.c
> index d8ae5d997615..2b67d23f5fa7 100644
> --- a/sound/soc/tegra/tegra186_asrc.c
> +++ b/sound/soc/tegra/tegra186_asrc.c
> @@ -19,6 +19,9 @@
>  #include "tegra186_asrc.h"
>  #include "tegra_cif.h"
> =20
> +#define TEGRA186_ASRC_RATIO_PERCENT_SCALE		100
> +#define TEGRA186_ASRC_RATIO_UNLOCK_THRESHOLD_PERCENT	20
> +
>  #define ASRC_STREAM_SOURCE_SELECT(id)					       \
>  	(TEGRA186_ASRC_CFG + ((id) * TEGRA186_ASRC_STREAM_STRIDE))
> =20
> @@ -65,13 +68,125 @@ static const struct reg_default tegra186_asrc_reg_de=
faults[] =3D {
>  	{ TEGRA186_ASRC_CYA, 0x0},
>  };
> =20
> -static void tegra186_asrc_lock_stream(struct tegra186_asrc *asrc,
> -				      unsigned int id)
> +static int tegra186_asrc_set_stream_lock(struct tegra186_asrc *asrc,
> +					 unsigned int id, bool lock)
>  {
> -	regmap_write(asrc->regmap,
> -		     ASRC_STREAM_REG(TEGRA186_ASRC_RATIO_LOCK_STATUS,
> -				     id),
> -		     1);
> +	return regmap_write(asrc->regmap,
> +			    ASRC_STREAM_REG(TEGRA186_ASRC_RATIO_LOCK_STATUS,
> +					    id),
> +			    lock);
> +}
> +
> +static int tegra186_asrc_write_ratio_pair(struct tegra186_asrc *asrc,
> +					  unsigned int id,
> +					  unsigned int int_part,
> +					  unsigned int frac_part)
> +{
> +	int ret;
> +
> +	ret =3D regmap_write(asrc->regmap,
> +			   ASRC_STREAM_REG(TEGRA186_ASRC_RATIO_INT_PART, id),
> +			   int_part);
> +	if (ret)
> +		return ret;
> +
> +	return regmap_write(asrc->regmap,
> +			    ASRC_STREAM_REG(TEGRA186_ASRC_RATIO_FRAC_PART, id),
> +			    frac_part);
> +}
> +
> +static int tegra186_asrc_read_ratio_pair(struct tegra186_asrc *asrc,
> +					 unsigned int id, unsigned int *int_part,
> +					 unsigned int *frac_part)
> +{
> +	int ret;
> +
> +	ret =3D regmap_read(asrc->regmap,
> +			  ASRC_STREAM_REG(TEGRA186_ASRC_RATIO_INT_PART, id),
> +			  int_part);
> +	if (ret)
> +		return ret;
> +
> +	return regmap_read(asrc->regmap,
> +			   ASRC_STREAM_REG(TEGRA186_ASRC_RATIO_FRAC_PART, id),
> +			   frac_part);
> +}
> +
> +static void tegra186_asrc_cache_ratio(struct tegra186_asrc *asrc,
> +				      unsigned int id, unsigned int int_part,
> +				      unsigned int frac_part)
> +{
> +	asrc->lane[id].int_part =3D int_part;
> +	asrc->lane[id].frac_part =3D frac_part;
> +}
> +
> +static int tegra186_asrc_apply_ratio(struct tegra186_asrc *asrc,
> +				     unsigned int id, unsigned int int_part,
> +				     unsigned int frac_part, bool unlock)
> +{
> +	unsigned int old_int_part, old_frac_part, old_lock;
> +	int ret, restore_ret;
> +
> +	ret =3D tegra186_asrc_read_ratio_pair(asrc, id, &old_int_part,
> +					    &old_frac_part);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D regmap_read(asrc->regmap,
> +			  ASRC_STREAM_REG(TEGRA186_ASRC_RATIO_LOCK_STATUS, id),
> +			  &old_lock);
> +	if (ret)
> +		return ret;
> +
> +	if (unlock) {
> +		ret =3D tegra186_asrc_set_stream_lock(asrc, id, false);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	ret =3D tegra186_asrc_write_ratio_pair(asrc, id, int_part, frac_part);
> +	if (ret)
> +		goto restore_ratio;
> +
> +	ret =3D tegra186_asrc_set_stream_lock(asrc, id, true);
> +	if (!ret)
> +		return 0;
> +
> +restore_ratio:
> +	restore_ret =3D tegra186_asrc_write_ratio_pair(asrc, id,
> +						     old_int_part,
> +						     old_frac_part);
> +	if (!restore_ret) {
> +		if (old_lock)
> +			restore_ret =3D tegra186_asrc_set_stream_lock(asrc, id,
> +								    true);
> +		else
> +			restore_ret =3D tegra186_asrc_set_stream_lock(asrc, id,
> +								    false);
> +	}
> +
> +	return ret ?: restore_ret;
> +}
> +
> +static int tegra186_asrc_apply_cached_ratio(struct tegra186_asrc *asrc,
> +					    unsigned int id)
> +{
> +	return tegra186_asrc_apply_ratio(asrc, id, asrc->lane[id].int_part,
> +					asrc->lane[id].frac_part, false);
> +}
> +
> +static bool tegra186_asrc_need_unlock(u64 old_ratio, u64 new_ratio)
> +{
> +	u64 ratio_diff;
> +
> +	if (!old_ratio || !new_ratio)
> +		return false;
> +
> +	ratio_diff =3D (old_ratio > new_ratio) ?
> +		     (old_ratio - new_ratio) : (new_ratio - old_ratio);
> +
> +	return ((ratio_diff * TEGRA186_ASRC_RATIO_PERCENT_SCALE) >
> +		(old_ratio * TEGRA186_ASRC_RATIO_UNLOCK_THRESHOLD_PERCENT));
>  }

There's a fair bit of complication introduced by the concept of locking
here, so I wonder what the impact of this is. The function name implies
that sometimes unlocking is needed and sometimes it isn't.

What if we unlock unconditionally? That doesn't get rid of all the
locking and unlocking, but at least it would avoid the need to track the
current locking status.

The unlock operation doesn't seem overly expensive, so maybe it isn't
worth trying to avoid it?

[...]
> diff --git a/sound/soc/tegra/tegra186_asrc.h b/sound/soc/tegra/tegra186_a=
src.h
> index 0c98e26d5e72..9cc8cec6c204 100644
> --- a/sound/soc/tegra/tegra186_asrc.h
> +++ b/sound/soc/tegra/tegra186_asrc.h
> @@ -7,6 +7,8 @@
>  #ifndef __TEGRA186_ASRC_H__
>  #define __TEGRA186_ASRC_H__
> =20
> +#include <linux/mutex.h>
> +
>  /* ASRC stream related offset */
>  #define TEGRA186_ASRC_CFG				0x0
>  #define TEGRA186_ASRC_RATIO_INT_PART			0x4
> @@ -111,6 +113,8 @@ struct tegra186_asrc {
>  	const struct tegra_asrc_soc_data *soc_data;
>  	struct tegra186_asrc_lane lane[TEGRA186_ASRC_STREAM_MAX];
>  	struct regmap *regmap;
> +	/* Serializes ratio source, cache, and paired register updates. */
> +	struct mutex ratio_lock;

All of the operations that are serialized by this lock seem to be non-
sleeping register or cache updates. Could the lock be turned into a
spinlock instead?

Thierry

--pjqavvxthiz3kxji
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmqxGe4ACgkQ3SOs138+
s6Hglw/+ML3dqtWuuEXPljPWWKlU5V6CxzKflHbjTE2wgyj5x4/Bl6tqpeAtFiQG
pROG5x+CfLnvYzQ7FpJumlJb0w6oIjj3jfDgtmfVSVmkeQXu/dBG8uwJ4G2u6Ryq
vqle7nonPNOUfZFyRbG4WRKOvsOEbRqp5ZLmrHqNRByIWpt3e4/jE3NtFVS2NBgj
lFRxJpHubHh9q0/qys9ZqCBy1YDWb3ToteVDKC9mHcrIswB4FUic1nsbPb/QJbX1
fYA+A9i21I84TpGg/AXnyT5oWPi9rmBfjjvPWnOLd/1i2GQLM4WYXlGdb5Rcnev3
fCja6odKZezfEJBk/Bp3u4khtYff311PZZ4cdwwNUl8SzcMJi6IUzbyyxV+OXz+Z
x/rLFV4Ih2vnLw14MlUnNBrsZdZjf74kaVyppINvdvcUOVlLlJLstI8ThEA/tOoO
/9TPWZlmFqSKRGPTZCTH0nAG8yilAEW4nkK8M254v5aHyd+iBKRM1+uvu8N11Khr
q0c6HSjd0KcsxongHCcPo+I+rQlQxi8u+TPnsh73K1ESh7VZjXw770dE/I3SAGTD
UoGTMAhWP4Xr/nmaf8RkWMmp+31FD/PDfM5iJghP2MBOownIIEzv80itADESBK/L
rBVwhiSASYOLeFjU4iaJ79yfpaWXHomMiVkDDhXkaFLW+REJDaE=
=JBb1
-----END PGP SIGNATURE-----

--pjqavvxthiz3kxji--
