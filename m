Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 313143515CF;
	Thu,  3 Sep 2026 21:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788469278; cv=none; b=Zbfi7F4Pmh1zWJ4Ixogqz3EEqkPtklv2y/duGtYUTnb9D/b3zS3ougfDOpXx5qnYYFTiKkOkhXedVbSMQHzlNsMtkwn7ds1bVrHjfWvFeEQW1vgg0AJoF9/fjzkZBVhjOXfL24yg0hdfyluEdbaJ4FbubtGh/AWzy89PZc8xO/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788469278; c=relaxed/simple;
	bh=YYxuBmZAH47wgXQP9XeaVmlhdYRTXofjQ1oQ/sIshac=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fj+w54Szbv7PdVZQKp1gzO8o4Xg/ar1Jv4dnTI13axcjsetLf4qsBfVa5dtTkE5K2Y89datbVyXnCRsoU9haFksZdAFBu6TY1xd5z+fRBTADVauV0Cu5sSaz9DTJSXSzyomeIisWtYW1Xh/hgt7IJ3NmOfrlI00gIs+DUqg6NsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FCl9wfTi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FCl9wfTi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CDC91F000E9;
	Thu,  3 Sep 2026 21:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788469267;
	bh=Uv8ZzIHycIvf6yeL4vgkmrAt3UAxDnPLrH4lIK6QkvE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FCl9wfTilfdE1Ux2g/CYVVtvAQ3OD4ice2Ynu8cIiKzAaO46I1GdKOWUtMA9WHzk1
	 3U5iryqL/7rPwvCcsLyEXL99ciO4qIvdxQmXMbkEQFo66Kka1THf+DoeLoJFIDl8en
	 EFqrLypie86VuvRlaLPHRs9QGjXbkPnhgyJKAkkahDeghSpRj/slTWZpTfcsoCHIf7
	 QpliT+m3Q4lNwyWdExztwk0RZCToYH3m9gjxvGbAEYf4eaNcrBusw8zKH+q6YGMWuD
	 RYajAmAo+CMG9aKyfbj6IiO/G8AW75/43++pPMcM2Sy51XKmWdo5l+8Lm09SJBvNii
	 IgD/jUox910vA==
Date: Thu, 3 Sep 2026 22:01:02 +0100
From: Mark Brown <broonie@kernel.org>
To: Diogo Ivo <diogo.ivo@bootlin.com>, Oder Chiou <oder_chiou@realtek.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Animesh Agarwal <animeshagarwal28@gmail.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org, Ben Zhang <benzh@chromium.org>
Subject: Re: [PATCH 1/2] ASoC: dt-bindings: realtek,rt5677: Add clock property
Message-ID: <12b9d08f-e773-49a9-8b36-2088c8e13cf6@sirena.org.uk>
References: <20260903-rt5677-mclk-v1-0-b71a5a3533f9@bootlin.com>
 <20260903-rt5677-mclk-v1-1-b71a5a3533f9@bootlin.com>
 <aplEfd33wSz59iLS@sirena.org.uk>
 <0746f828-a424-4001-8054-1e52ed07139b@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="M0WeFJ5o30F4cSnU"
Content-Disposition: inline
In-Reply-To: <0746f828-a424-4001-8054-1e52ed07139b@bootlin.com>
X-Cookie: One picture is worth 128K words.


--M0WeFJ5o30F4cSnU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 03, 2026 at 03:26:46PM +0200, Diogo Ivo wrote:
> On 9/3/26 11:57 AM, Mark Brown wrote:
> > On Thu, Sep 03, 2026 at 12:11:00AM +0200, Diogo Ivo wrote:

> > > +  clock-names:
> > > +    items:
> > > +      - const: mclk

> > The driver code has a reference to MCLK1 which implies multiple MCLKs,
> > unfortunately no pinout seems to be available and other references in
> > the driver are just to MCLK so it could be cut'n'paste.

> Thanks for raising this point, I had missed it completely. In fact,
> looking at rt5677.h there are two places where MCLK2 is mentioned:

> #define RT5677_MCLK_SRC_SFT                     10
> #define RT5677_MCLK1_SRC                        (0x0 << 10)
> #define RT5677_MCLK2_SRC                        (0x1 << 10)

> and

> #define RT5677_PLL2_PR_SRC_SFT                  15
> #define RT5677_PLL2_PR_SRC_MCLK1                (0x0 << 15)
> #define RT5677_PLL2_PR_SRC_MCLK2                (0x1 << 15)

> so to me it _looks_ like there are indeed two MCLK inputs, both of which
> can drive the MCLK clock and can also be the input of PLL2. However, as
> you mentioned I also wasn't able to find the pinout/datasheet and I have
> no way of testing this. I think the safest bet here is that I send a v2
> where I rename "mclk" to "mclk1" that we know for a fact exists, and
> then later on if someone with access to the actual datasheet comes along
> and confirms the existence of "mclk2" we can add it to the binding.

> Let me know what you think!

That would be safe, but let's add the Realtek maintainer (who I'm
surprised you didn't CC...).  I've also added Ben Zhang who did a bunch
of work on the device for Chrome and might be able to check too.

--M0WeFJ5o30F4cSnU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqZ4A0ACgkQJNaLcl1U
h9CCOQf9GzylS/V+CerOOxwbKCvbewffQbRcRgiXPgxRIhzHXEtGzmH4mOCrB5al
lSBM3Sxkmg3FYsXOs6ZGjwYAj5gPuoruOu3ITBwTCieymS19GPfGNMLSzg+5FQL/
nBb9V4nU5tnhbQP4Q4hHYXaVdqM/fAs7FdNCFBlMcMeUQIGfiZT3aJdqACkxh/DO
oED1guanpd06xtdFrpN+S3UOv4+p76lB8MXlp/S0x6Lk9JAm0QRdVhCqngjP6Wuo
BT5riCffnQdpLI2b3FMzqhZeik7YFAJfUYc8mmqbvWjzzdDqKUwgTNjcMu2sw2//
OlBy7hSOXrqaocNlfaMyCsIIdNnMMA==
=czcJ
-----END PGP SIGNATURE-----

--M0WeFJ5o30F4cSnU--
