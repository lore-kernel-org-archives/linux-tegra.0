Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B05612116F4
	for <linux-tegra@vger.kernel.org>; Fri, 16 Jan 2026 12:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768567865; cv=none; b=QtQPug2tlb61yo2dwmjM8XcNb43tPD00BUmvXFd17wvrjKjvd1LJ/bT5A9BUntjYHnpP0PmxyLEabC2MqmG/pDuy/zt+Zih2qjFmSdB8NuVAZMPhKMGO7CA934V5PG7TpvyFABO1GPuoByErd0jDHMWp6ekDtjepyyVHRGpmQC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768567865; c=relaxed/simple;
	bh=DSALMvzBwB081u4Jt8c9NpYNawx04HscrqIhArOIoek=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BIUG41DFt2IaM0phNCYvVyGVCU6ofWEA5XEV3wDRrimkLu2KGaB+FWjpqHPTsRUjtlhBaD02aX7EqOBfAQCdCDoFxNRaIcKrI3M7IuIGXYjBtozk4o4h9zQbhk9M17SFXHPaWrFb4caaTT9mOklV/+k7gWHOps349jDJRBxcOHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KxBBS7n7; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KxBBS7n7"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-47ee76e8656so23914275e9.0
        for <linux-tegra@vger.kernel.org>; Fri, 16 Jan 2026 04:51:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768567862; x=1769172662; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zTkxHu8mh7w4aqi9Nu456ezpUXh108CX0ltHIeT0yH8=;
        b=KxBBS7n7iqVxeR9Hb6Vd4u5g7iWEVl9aTG5LuuuEdQfRIN9cFeE3sLlPuipmGoyAJ/
         p+9L1ziS5tMxV/UDnCnM5ovcVEeLHQwylikPsPUBD5mdM2h1oBbFPLPYGFRsrwRpvWkR
         stY4zb5N8B0AvtPbUxqnKEpXd45HoOcVo1ibEpbBJhlAaVg98kmR3sdEbsYCVTmio0pv
         1RfBeDbLZB5ZNgBdmBccVjQbpZLTJIvUjev+8lugg1G+89eS/zG3CBKUrN7/LUgxvL92
         34OxZpjvJLVy7pum0QZgh42jdYTL5HiPw59n57Pte4dbz8BIY+23WYtrinZTvK4USzfl
         OWZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768567862; x=1769172662;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zTkxHu8mh7w4aqi9Nu456ezpUXh108CX0ltHIeT0yH8=;
        b=mGfluuhRUjjU4Ce8TSYDDogsKicCiL1EkPbdxB4pkDQGNauzWlCnR5AOEfjlrkC7qP
         derGVpsEHcykBHPW5bzc0+U9J85+7f4hnnCTfn0ENNFrzbFXDQeTw+ZwyEl92LHsDoWv
         XK+jcyhzAgFbv2zndmW4pDy7728TmuwakN0woKUOEURfwgAo3uCRU2e9L9exivvw22Am
         DZkjka8RBHSNdqwNx/Khqd3RuHW8hMyzIQYssyqqt4ZRNLd/KPf2U1Lcp4EUp+v2Dxmy
         KFluGo2ODQv29jTm7kP1FbtkXszIfq8XrQ3q9qxZ2lMntzEW/qX6OR9R8FLymUPlAj/v
         C+YQ==
X-Forwarded-Encrypted: i=1; AJvYcCV9k1sTM8eiaA6i5lz091i2asMtL/2GKCc2pTzCtp8MalipB6xHBS6tXl2ki8u7ZPSMhdQVAp226DgkEA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyJp/fFfxBO6encx4R5gWTUnNEI8KucOw/OPtJSMz3MHEvKxXRD
	5c572zssnsGwlJsWGtv2RzxtlzgR9csT7ShrD2cRxp8k4hId/l4ThDlN
X-Gm-Gg: AY/fxX6ryUMxaMKPnggC0GUMPj1619TLSLd1eqURY8VV6k7yXNPe7c6VdXeezniKdvz
	aWVf5WOYJrhb54DtP8PipNen7CrwUBW36wrVTv/toUdnlI/CBwpMuVrQ7R0RWf/wYxZlDYWoBCm
	zswZo16D/CzJ9prbWEIK3pds1sy+HIFh3r3K0q/rynKwU2U53QUfonxDcHiAvT2PboN9W6A8nCH
	AbL1oo48uynJqWrhHGCQ+wColrci4BnsmWeAaEYHyOCWEYJZ3fn+E34dPGueg1z3ME9exnVrLJ/
	8BZn9Y2W4ZyKvIGSAIwSG/N+ubT93vGRdkoRCqRK9Y7bdzixG+msVIBe0mfQDqo4+PiLznp3Pra
	0cvomu8YjNfkvXP88PKjPTBxfYtxTXGGSBDZ6RABwnp45leHPW8eaTlgwHGgdYS2NQRZ8pS2Vx0
	XAp+8iKuubX3BQmm1ofJqDXnUl6fKbvqytxw3FVVJAXQGh9eJRhRY8+7gTMW7abhCnimbOlF5qU
	Q==
X-Received: by 2002:a05:6000:2004:b0:433:2f55:7cab with SMTP id ffacd0b85a97d-43569bbafd6mr3570766f8f.37.1768567861918;
        Fri, 16 Jan 2026 04:51:01 -0800 (PST)
Received: from orome (p200300e41f0ffa00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f0f:fa00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4356997eb0bsm5012584f8f.34.2026.01.16.04.50.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 04:51:00 -0800 (PST)
Date: Fri, 16 Jan 2026 13:50:58 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Linus Walleij <linusw@kernel.org>, Joel Stanley <joel@jms.id.au>, 
	Emil Renner Berthing <kernel@esmil.dk>, Hal Feng <hal.feng@starfivetech.com>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Basavaraj Natikar <Basavaraj.Natikar@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, Steen Hegelund <Steen.Hegelund@microchip.com>, 
	Daniel Machon <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com, 
	Jonathan Hunter <jonathanh@nvidia.com>, Heiko Stuebner <heiko@sntech.de>, 
	Patrice Chotard <patrice.chotard@foss.st.com>, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, sophgo@lists.linux.dev, linux-tegra@vger.kernel.org, 
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 08/11] pinctrl: tegra-xusb: Return void in padctl
 enable/disable functions
Message-ID: <aWo0LESc5bIs1kHi@orome>
References: <20260114-pinctrl-cleanup-guard-v1-0-a14572685cd3@oss.qualcomm.com>
 <20260114-pinctrl-cleanup-guard-v1-8-a14572685cd3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bhhiv6s43avuu3l7"
Content-Disposition: inline
In-Reply-To: <20260114-pinctrl-cleanup-guard-v1-8-a14572685cd3@oss.qualcomm.com>


--bhhiv6s43avuu3l7
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 08/11] pinctrl: tegra-xusb: Return void in padctl
 enable/disable functions
MIME-Version: 1.0

On Wed, Jan 14, 2026 at 04:30:09PM +0100, Krzysztof Kozlowski wrote:
> Make the padctl functions a bit simpler by returning void instead of
> always '0'.  The callers - phy init/exit - still need to return 0, but
> these are smaller function without if/branching.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  drivers/pinctrl/tegra/pinctrl-tegra-xusb.c | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--bhhiv6s43avuu3l7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmlqNDIACgkQ3SOs138+
s6HKVA//WbWB3AVvEbOYpT8fr129RiWvQ5lRtQceA8fb/1Ep4k0qX0M5cVujq72g
OFie2IcJyCzuci1ZmKEf7fTaR/cjlzExIrXvmox2TLmtKm5kBAFTu2UcHzvAbRcs
VbasfUeQ/Wi7dlT6+I6JeNLYaXbstuH2RQV3NQ2BC3zPUsJk27p7DARdqBLUSNTJ
7jX2sBu0xKu5n0hrBhesTMi/zBLMI3pZvqmMlhGzTU01GSlmPz72GMI5J6YmeeF0
Midhy4ZCbs40l7nJPghjxdtQoKLhUPG6z+NzTyp9Hfelr7q/cYZ1avlAGkJ/39fI
ugJEOfjl0ed/HMarlvwrRPSTjF6f2BUKH1Ub2xGxErbhGaGvOsKGJizbjsK0CGzl
jdVsdFUF/wmzPeX27RIel8DxTdTYnhpUyZoylg7l9thjdhYGceKGJHeHb1DaOOZ+
OhsSUZlejccTbalvk7OeBxtnujGfE56nEXsSByA0C6kaDRxPZmsH9WWtp4mwIzXg
rvw2hOERLedWoFTjFynl0+3hazgw2hh21iH/uE+uOEiVwHNhPiEXeb+lJMGQbH/9
Bm2mL/1gvDYA3KxeFZbTTyNwEiGkZyPFLvwZ4hpapk8AvhFdEu/60sMZWsTRlSgx
H7CJIWp6MSs4e2ErCXbhjjucu3eJo1lFTm/bGVBosixPjjSZ720=
=VB+5
-----END PGP SIGNATURE-----

--bhhiv6s43avuu3l7--
