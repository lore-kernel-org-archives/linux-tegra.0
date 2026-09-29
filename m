Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8644938F658;
	Tue, 29 Sep 2026 11:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790680866; cv=none; b=cuWy5Jofu2fiM7BUCu2TwZte8eexixKp/yXDAcppaffDRoWHpj6+kfP5sB42cxOnQsZSv233YKxFODRturGzOkCMawyuHmd26SIdUr880a/z9frlDQsw86FCDL/I8IgqwiPYsHjfG6HDyK+3TupSBUQCV5jEAtGYtLiL3qUhJos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790680866; c=relaxed/simple;
	bh=GN0ptm9/xuiWtlfJ0GmqKqGwOYXL5Mrc6ioE1kTRdDs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mWWOZ+SK027eqffD6wBxVWwfyPYKVYoMC8XUGtaP7sw6jpsmTDYffs0idS8PACpckZbN6V8ONbzwanqwxOxQscfoOS8zEb7jCaExhAmMcJmpuqYnJnP7186R6x0onQd2W+uXuaxPG88wpGlhWs7o2j9vKoZivehhH8h9ULIWmvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fBKH+M65; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fBKH+M65"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D22C51F000FF;
	Tue, 29 Sep 2026 11:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790680865;
	bh=1cSpO1W2accRw3GFvPv6MdP/m0t60IX3vpjYza3hvSM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fBKH+M6535Qxc651fBA9N+lc460wrFo2C/JAyIZONvZ9CUF18Sjk4XlJ7wG2vhaAh
	 14aifrQDf7IscKiOuCrSovOAx6EKX/jbgM90IPdGR2BtCLl7X2Z9Nhqg2WBM5m7Yio
	 ql9TMYm4eD02JAD8UkRWQI91QpIl0aKjD5JGNZNU/DNULAUXVVmqYS8IIzPE3TTT0c
	 XoMrJpnZ9bwWEZLaLDNSuuvVh4iBzMtyKJk/iOJkWbpGg5uI8GLOh/be7526vGXznw
	 mMhQGlo7LwigOt5vtJd5YVQQ7bmrTH2eUZnFLGXEUy+qo6CPE4FrhtdNXsSMkK72n7
	 JoiHNj029zyXQ==
Date: Tue, 29 Sep 2026 13:21:02 +0200
From: Thierry Reding <thierry.reding@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Laxman Dewangan <ldewangan@nvidia.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, mfd@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>, 
	linux-sound@vger.kernel.org, linux-tegra@vger.kernel.org, Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH 2/2] dt-bindings: sound: tegra-ahub: Convert to
 json-schema
Message-ID: <arueJco9rLWm_lh3@orome>
References: <20260928-as3722-bindings-v1-0-35f423a9f2b2@nvidia.com>
 <20260928-as3722-bindings-v1-2-35f423a9f2b2@nvidia.com>
 <20260928214615.GA886365-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ujbwkw6nowr57p2n"
Content-Disposition: inline
In-Reply-To: <20260928214615.GA886365-robh@kernel.org>


--ujbwkw6nowr57p2n
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 2/2] dt-bindings: sound: tegra-ahub: Convert to
 json-schema
MIME-Version: 1.0

On Mon, Sep 28, 2026 at 04:46:15PM -0500, Rob Herring wrote:
> On Mon, Sep 28, 2026 at 06:24:41PM +0200, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > Convert Tegra AHUB bindings from the free-form text format to
> > json-schema.
>=20
> Pretty sure there was a prior version posted... Please check any=20
> comments there.

I thought so, too, but when I searched lore I could find any references.

[...]
> > diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra30-ahu=
b.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra30-ahub.yaml
> > new file mode 100644
> > index 000000000000..c064a2acae5e
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/sound/nvidia,tegra30-ahub.yaml
> > @@ -0,0 +1,260 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/sound/nvidia,tegra30-ahub.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: NVIDIA Tegra30 AHUB (Audio Hub)
> > +
> > +maintainers:
> > +  - Thierry Reding <thierry.reding@gmail.com>
> > +  - Jon Hunter <jonathanh@nvidia.com>
> > +
> > +description: AHUB client modules need to specify the IDs of their CIFs=
 (Client InterFaces). For RX
> > +  CIFs, the numbers indicate the register number within AHUB routing r=
egister space (APBIF 0..3 RX,
> > +  I2S 0..5 RX, DAM 0..2 RX 0..1, SPDIF RX 0..1). For TX CIFs, the numb=
ers indicate the bit position
> > +  within the AHUB routing registers (APBIF 0..3 TX, I2S 0..5 TX, DAM 0=
=2E.2 TX, SPDIF TX 0..1).
>=20
> CR after 'description' and rewrap to 80 chars.

Sure.

> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - nvidia,tegra30-ahub
> > +      - nvidia,tegra114-ahub
> > +      - nvidia,tegra124-ahub
> > +
> > +  reg:
> > +    minItems: 2
> > +    maxItems: 3
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    items:
> > +      - description: digital audio clock
> > +      - description: module clock
> > +
> > +  clock-names:
> > +    items:
> > +      - const: d_audio
> > +      - const: apbif
> > +
> > +  resets:
> > +    minItems: 11
> > +    maxItems: 21
> > +
> > +  reset-names:
> > +    minItems: 11
> > +    maxItems: 21
> > +
> > +  ranges: true
> > +
> > +  dmas:
> > +    minItems: 8
> > +    maxItems: 20
> > +
> > +  dma-names:
> > +    minItems: 8
> > +    maxItems: 20
> > +
> > +  "#address-cells":
> > +    enum: [ 1, 2 ]
> > +
> > +  "#size-cells":
> > +    enum: [ 1, 2 ]
> > +
> > +patternProperties:
> > +  "^i2s@[0-9a-f]+$":
> > +    type: object
>=20
>        required:
>          - compatible
>=20
> Otherwise, we can't be sure it is validated. Or if there isn't a=20
> compatible, then the schema needs to go here (directly or via a $ref).

Good point. These do have compatible strings, so I'll add the required
here.

Thanks,
Thierry

--ujbwkw6nowr57p2n
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmq7nx4ACgkQ3SOs138+
s6HOZA//UtYmv9tJbBiEjCOnMmTLfOVECe/8FSn5LbmjRfqdjQCihtkSh+uN9RtL
7Dil/D9saqSUrexSm8oPnGZsgptVMQgTwKOQh7kxpANQt2+uRndPZ9M2kbrelyE+
ZPCAS6OSRY+vlUM6H7fAeyYZXwNZZdOFujAd3PyDGSc5vyuvVJEN3tVkr1N+ygCb
O44ggMgvi1ImAQx0abSR50d7Er91nZYqnahMUcjz0hpn5/qYhlG8DeRLc9XgD2PT
LQLWGAJbQjbIVLMKYVNbz/kb8VCblIZy7ZaLrUJ7rhRP/YG3SS66cDB/oqgvT6Qc
RHpoeh1mebuVSJZqR1+LZz4Hdh6MIsr6oBHFaxnEfRbC8GlAcLfkgcyO5Ksy0UT4
Lybji69KXaH1gMXL+4htBgn36Wxr8QH7Rr4uqBwEpkVCyQ5YP+cFan9qnfytZjoC
dkFCkoANa1zniDzqkByDxTodSXEYA2NB5lJjinFUMfx+mKwr8NWF1Y9MJbcFZ4NZ
t+wwO7jgrXSEPNdFgJS2aYxFatJeZ15QavQjEAKMYylh1Yi31lx1551GWlMugbXX
huut965EteWimKnAQJOSTqjhyutGQTd1YR65zYwT4+c3j6YnJehh4fBkw5mlYCNQ
6V7jWSvIbgTHlxvuwAjebJoNE4pW1a+Bepx49s3yNy/6oX2e+LI=
=JbJn
-----END PGP SIGNATURE-----

--ujbwkw6nowr57p2n--
