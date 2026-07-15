Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 133B743A7FB;
	Wed, 15 Jul 2026 11:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784116348; cv=none; b=r4V13GdItBBbOUkQCCMTCVGLo1zM69bFsNe/T264UF4sv6MupKbQgBwYE9SOtQYzRKvBgynSbJdNoYgjFM3ah7BaomF0FQ+JcMTzaEKG7faLZaKACumU2AiQKkBsMPxT80q2Cdh14e3IwJY7uypja2ZLbSTjLd09UAiYvJpaApY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784116348; c=relaxed/simple;
	bh=8ULvJQIoSjKTURpGhk9S15PCC0YJqx4411hpdjXxHA8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MqvX1j27uSbSf21Px4jpDJm5FVh9H7YxaZUAT/UMI6M7NhiLxTM7++t3cJ5hRA5qjzWNYao2vyQyIz1h7f7tP3uv69VltiLL69Nxnv12ivEzOQulbwZvhi2B9DM00COtXfeVo5yqkJIIHlE9gZnmTlfLZIt7xrnlnADMCs19d78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KxFpa7oq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KxFpa7oq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 241EF1F000E9;
	Wed, 15 Jul 2026 11:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784116346;
	bh=pj/ARY+WoaODUI15ZuASsCan1ELdT179BkHdN1ltSvI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KxFpa7oqK2t5Z1P+zQnAFa/NgLzXdbbQpJdEARHq0o0q4+cP6AMte/L4YvXpv/vw5
	 S2K4Kc/c2WkO4Y+3lY8X6TviY3TfNu/KMz8DeId7dyJoekuNMDWkHfY8STPY/NBRTu
	 t/JVVUtL6YXyLntl2LqhUN3pAIC4Ctn23NMciyQK07APR8HP9PVH7hmBD7HAoFtevj
	 LMzofREahTupX7klXjCvweoRJcqAV/meolWmwkbTTDPeo47Ku7jv/+jYJhwk7YNJD9
	 tjleegBe5TTfRkxsa8W5meva5US324qlKPj4xgho9VE8FfFmYea3ScArnA17FV4vTQ
	 qDe37A167C1zQ==
Date: Wed, 15 Jul 2026 13:52:24 +0200
From: Thierry Reding <thierry.reding@kernel.org>
To: phucduc.bui@gmail.com
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
	Sheetal <sheetal@nvidia.com>, u.kleine-koenig@baylibre.com, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Rosen Penev <rosenp@gmail.com>, 
	Piyush Patle <piyushpatle228@gmail.com>, Takashi Sakamoto <o-takashi@sakamocchi.jp>, 
	Bjorn Helgaas <bhelgaas@google.com>, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-sound@vger.kernel.org
Subject: Re: [PATCH 4/4] ASoC: tegra: tegra210: Use devm_clk_get_optional()
 for sync_input clock
Message-ID: <ald0NfwnTmBsiM_j@orome>
References: <20260715051115.17385-1-phucduc.bui@gmail.com>
 <20260715051115.17385-5-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tbuz2hzdnvsz5cs6"
Content-Disposition: inline
In-Reply-To: <20260715051115.17385-5-phucduc.bui@gmail.com>


--tbuz2hzdnvsz5cs6
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 4/4] ASoC: tegra: tegra210: Use devm_clk_get_optional()
 for sync_input clock
MIME-Version: 1.0

On Wed, Jul 15, 2026 at 12:11:15PM +0700, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
>=20
> The existing comment states that the sync_input clock is only needed
> when another I/O is configured to use the current I2S instance as its
> input clock, and the current code does not treat its absence as an
> error.
> Use devm_clk_get_optional() to match the existing behaviour while still
> reporting real failures via dev_err_probe(). Update the comment to
> describe the optional nature of the clock rather than the previous error
> handling.
>=20
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> ---
>  sound/soc/tegra/tegra210_i2s.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)

Reviewed-by: Thierry Reding <treding@nvidia.com>

--tbuz2hzdnvsz5cs6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmpXdHgACgkQ3SOs138+
s6F2/g//R6Z8PVSVJHa/k17C5yXexk+ibyD0k518KFWDMmajhR7tBUXOA6+GhQ/8
XDFMhHGlNpskzPwt7YU0wKwjN6zq9WeW6Q9jhknvXhV1GoW2KRdMJ21QfHfaoooV
Ob8HaIh+Nm/60U4uP44WE5C/0HEKiymwrPKHE7zcNYBjNz+4kmgiz5lGkQ2SAN4J
coNWawc68oRTHbGRwPYs9QcuDqqpvANj6Rio1+SD3qBA4TaktV1U5eGkuPO8+Dno
U3ubu16QlH/57WgMZZPzCB5CR4Emt/ZMm2JdEUURRoqgjtabblT8+iWmvHu7NWy4
ApUAbx0fMpoAHOg5fH2MpHcobpMjKjO7JhdxvPM0/m9quPrOZZ/eT8kMfc8fZlnZ
69Dyfy+tDQ8PIMCAyppcogpOt7NJG6o2m5SFiC8RUkPJ5u8t7AAG5yy/+BGZXrg3
bQGqt038hUedNfHi/8NKJpnGKAtm0wsnV7C9wXIKgg8NJiTpJpoI0mH0K3y+VaTl
hJCjnULMYY31GMdJIu0zujevWWVMGQldh+8PB0oDIE7U8iQCN00i8Lw96SqzOtNy
n9qfpuL5usuCYWBnSOrLkyoRdLBYAd69Xm6cq3u8fLRlmF6p8yPGWfg4LBmwAFMM
M8E1xuKuI4GejEwugIyrvQ9d2JsFnnOqiYJ5aRmQKQRBcHZuliU=
=bEvT
-----END PGP SIGNATURE-----

--tbuz2hzdnvsz5cs6--
