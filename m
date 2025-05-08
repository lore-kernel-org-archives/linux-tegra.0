Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E3DB205E3E;
	Thu,  8 May 2025 07:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746691176; cv=none; b=W9xfsh+i90iPbMFjg6pWaEpiTCHAaEIvz6bOH7DtTVxuHZ3W0FZ+1suv/842plppudwpcigtChTnA0kIaAxtKstNc2pqm3h0S7A4u1hr0LQn8/jFj4ZXcb4+PytA5N8z+eip1QpE8+VpT/DT3wGfFTJ3xITU6MMgpDA6BGTjwyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746691176; c=relaxed/simple;
	bh=dPH6lmAX9zOSKjiLScS4YgUsvICa9ww3IywiF6FbSeE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FCbCgQgkKTfNKSiYedwE+SRha827xKG+fPZ59JiKedbUsp4PiWe0Md8V78gfnRCFb/o4H7h7Zdw1rtUTjNGwE9SmL4IUMb76ES7xAnZYzXB+JEW4Zmzori604plfbt2rUdFEZRr9WE/qF5q+6Ie1lVxpt+kJkqdBYD5DBzCE78Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=irH5/aY/; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="irH5/aY/"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43cf628cb14so12866525e9.1;
        Thu, 08 May 2025 00:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746691173; x=1747295973; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Db9LjxuIeRocAHB3p/zvlDGjKId3tP1sAigufhRVP8o=;
        b=irH5/aY/YqG+n9LPakRuntKaLO1xl/KeqWUKhCLGdu4ZTyZAhh4jh2cJVLT6nQK+aG
         Lf1ERg3F5+zuKETrvADas5b/fM9CZpSyJqBaYUBAB9ekNhVeV3wbj/r6l+qFlNeQVqw4
         V9tGDd5ywHiLX5vVedUD5AAM0R84H16/FqrJJ397RPIGsxekjSUmJXIrDoVuf7bmJI+y
         dCdRQwdBfPGYz54gaHeEw4jFkrUlDdjugYmC2rj3FkPcT2GLBEQAAVF2mq3/1G48GNyy
         ceN+Udx8WINSHVDqnuPMpal1Ctb4QMh5fqtIj1ONfybhxCArG8PBZC2XJrwnCtuH2Qnp
         6jeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746691173; x=1747295973;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Db9LjxuIeRocAHB3p/zvlDGjKId3tP1sAigufhRVP8o=;
        b=rollWOElAcnoQHZhfo2J3nmqRsmjmlgYTLkj5QWcAowrCZAMpz5gi2BSi+pzhCN6wX
         WFUFxMAUnvNzfDCCmQ6B7t549YEujAzKhvY902FHvmmDyDlj/2/Z8yufdWPQeU9nEjhk
         89B4m/suDDuA6PARAJhbLxuXNqNVQ+GypaJUSY9TyQANqzKxpmS322e46csEB69Fw/us
         VGCctx5jToNQyc6BvJDOyKx7JzL417cKezXK2mR6b+OE/n+Vsh30iheT/Z8TJsCiEwGv
         9u1DnodSyuLpJw8RBdlep4ERABPD18z7ny044EhJehD8D/sZpSvswYTQ7Kq2tflgqTPp
         nSMg==
X-Forwarded-Encrypted: i=1; AJvYcCVdcR3C9yM46TTmPTfMwp9qFp1YZzuegdWmaJ7I05oxkgC//lQmMRHpwu1t5StdYjo7xipIhQLiP6cL/1w=@vger.kernel.org, AJvYcCXdqwTGjLx09Gj+YyKRu2NJ5EslvXAA++56zffsEEzGISewxZP6K/OPVSamjpMHBb34CVBYozL3U3EI@vger.kernel.org
X-Gm-Message-State: AOJu0YxZaD5O8qfS9y8eFhrjd+/Hr7bbjuMi0LdLPaHUgAlkt+vPTDso
	rVtXK57Ad8I9qfVSHlrNvnCTtxQb++Tz7lSe1FovX0UZ9XsoOrPn
X-Gm-Gg: ASbGncua72WQjirnALgym3ZCsUcF6LHIIG9zzoRZ00hwxl4//OoI+iWNk8a8MDzjzo0
	DxOF8xVFGjskHcO3SQaPzhgDBeQB7YpyGOTmlXm93WFt1Gy5dfj/EmrL+840Z19t1lXzlk9HL6k
	u69er1zZAF6WfU59ss49Ob0kkjkx5cUI5VvecM9BQkzlaH8Lw3I+xyOs3I1uDEeKc+rEZeQU9b0
	2gmn/q+72ju68ce4LH5MX10FkIueBFjJAOXc57e3F+lwqcqR3iXIrUgVvrCOb4GhwdWOlamR1HX
	ZL1cU0n6UAc0tFglmbFYiGvh6UFZlDgvnhIzEzW7oBzZDA7XIJbKP/5NiSOkDxTTcZT+JbVubx2
	8pxRyeQU1hXonKpsyIDLpqoN0r9k=
X-Google-Smtp-Source: AGHT+IE8XCD7/PYMkt2ylx1/nOIpd4VBRT9tXMV4j1Un5IAz2BmunL2G1GCGow/bv5ib6VsDnRBqPA==
X-Received: by 2002:a05:600c:3150:b0:439:5f04:4f8d with SMTP id 5b1f17b1804b1-442d02ef128mr19224135e9.12.1746691172350;
        Thu, 08 May 2025 00:59:32 -0700 (PDT)
Received: from orome (p200300e41f281b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd3b7b83sm26997065e9.33.2025.05.08.00.59.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 00:59:31 -0700 (PDT)
Date: Thu, 8 May 2025 09:59:29 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 4/8] dt-bindings: Add Tegra264 clock and reset definitions
Message-ID: <kut7odtjumfmqia7to75yda4qwtsyhwmm3xejkwtfm7yxyap5t@icfpljkitpwp>
References: <20250507143802.1230919-1-thierry.reding@gmail.com>
 <20250507143802.1230919-5-thierry.reding@gmail.com>
 <8a26a37a-26ce-41ef-96e4-10ee09ebe704@kernel.org>
 <12d0eac8-545a-4595-a1df-1dc52728ef54@kernel.org>
 <rz64mnhdb5vu42tcerlobmulkyxvpqgeeer43t57thwzxnrcou@6xcpuiiru66b>
 <0501c0b2-df78-4c93-9ca1-7f32767b0225@kernel.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ed4stfeyr2kqil54"
Content-Disposition: inline
In-Reply-To: <0501c0b2-df78-4c93-9ca1-7f32767b0225@kernel.org>


--ed4stfeyr2kqil54
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 4/8] dt-bindings: Add Tegra264 clock and reset definitions
MIME-Version: 1.0

On Thu, May 08, 2025 at 09:49:12AM +0200, Krzysztof Kozlowski wrote:
> On 08/05/2025 09:46, Thierry Reding wrote:
> > On Thu, May 08, 2025 at 09:40:38AM +0200, Krzysztof Kozlowski wrote:
> >> On 08/05/2025 09:39, Krzysztof Kozlowski wrote:
> >>> On 07/05/2025 16:37, Thierry Reding wrote:
> >>>> From: Thierry Reding <treding@nvidia.com>
> >>>>
> >>>> Signed-off-by: Thierry Reding <treding@nvidia.com>
> >>>
> >>> Missing commit msg
> >>>
> >>>> ---
> >>>>  include/dt-bindings/clock/tegra264-clock.h | 9 +++++++++
> >>>>  include/dt-bindings/reset/tegra264-reset.h | 7 +++++++
> >>>>  2 files changed, 16 insertions(+)
> >>>>  create mode 100644 include/dt-bindings/clock/tegra264-clock.h
> >>>>  create mode 100644 include/dt-bindings/reset/tegra264-reset.h
> >>>
> >>>
> >>> Filename equal to the compatible. That's the standard convention for =
all
> >>> the headers since some years.
> >>
> >> Huh, I cannot find the binding in this patchset. Where is the actual
> >> binding added?
> >=20
> > The bindings for this are in
> >=20
> >   Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp.yaml
>=20
> There is no tegra264 in that binding.

That's part of an earlier series I sent out (and linked to from the
cover letter). It's here:

	https://lore.kernel.org/linux-tegra/20250506133118.1011777-1-thierry.redin=
g@gmail.com/T/#m96bb396b352659581a9e71a4610c51e6ab4d5b6a

> The header always goes with the binding and the drivers.
>=20
> >=20
> > There's no 1:1 mapping to a compatible for this because BPMP is many
> > things. It's a clock provider, a reset provider, a power domain
>=20
> Sure, that's fine.
>=20
> > provider. These definitions reflect the IDs assigned by the BPMP ABI
> > and we've used this structure ever since this was introduced back in
> > 2016.
> >=20
> > I don't think changing the convention for this is a net advantage.
>=20
> Headers still should match the compatible one way or another. Can be
> nvidia,tegra264.h
> (because -clock is redundant and you do not want to use the actual
> compatible)

I get it. You want consistency. But what about consistency with earlier
chip generations? Do you want me to go and rename all of these files?

Thierry

--ed4stfeyr2kqil54
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmgcZGEACgkQ3SOs138+
s6EagQ//UlzVoHHEdakhc24zRCO4VnwLEyoPYprmuWP80OUlNNOghNX4chLKZZLC
8P+djXVgZD5JeZk3SZm7DHPyzGbVtmLIrPtlCU4Wpb5p5K120/fXxyoIoHqxTyNS
PToYjUJEcwjs4TrqLmEL0+r6E25VPphKbwHDRkDfYRyrGLNKao2BfbwuBizYoJW/
anqIEhMFYCi91KO/tlYy0KwsKvjj9nmJDrfRixu3RdJQFygrsgV0Iv10qwPT8xs6
cu+apOBzLWrV/dPsyI0zh9A7TAaWz8t+XEyEnw21RKNRrhrp+4ugN7S35Jgboz5V
3p919umvhL3Eep0uuO+lKfXVG7IJ2k2IBNGIeopDnIFo1X3ZPtTmAiaSdAAdN1Zz
BYBKbUPHEm1dO91TWiX8g6Zt6Oso+pRQUNsFxofsywPsHrGIEWMQV8e9tsek2272
nySpApsAvwLHOVMn0G+ABe0+DlOcbS3nrF2EZURLVhRS1e0cX1tvA3N9YY5zuIut
TCvGPV4mTcZ1JelrkvnBMT/x+PTvmBtBgTSHI/p8FAElUdQ1csSe2ohlSaA2WWIp
5aTGr/fDPeSOM4cvu9Ynh1OQbG5VHXyhvlFsbEbZs9W7f/bGwl+ECxGAQsstmeQC
X/3ws7XFrWWTA+ijfuiuPBHw0KEe8wk1I8T8gu+43r5mA8ged/I=
=tIRR
-----END PGP SIGNATURE-----

--ed4stfeyr2kqil54--
