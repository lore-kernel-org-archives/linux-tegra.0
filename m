Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 561863E0087
	for <linux-tegra@vger.kernel.org>; Fri, 29 May 2026 12:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780058102; cv=none; b=N0g/Htq+QAi8w6XQIuqverzeKFHWdt4Jso0bAZSoCLKFmXODvLf1pPJljADdCio9VUFEwT5lCEBfjOQqHgkm/7eW+SxNWDskHWAANN/S2VBDYfNnNiIfeh2VS08CXlKweftDMY2wLRJRdzvawcaYDhyK2qulavb2EIIUtCWQi38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780058102; c=relaxed/simple;
	bh=GA+kBUW/Cr1ZHWEJugbTRCXlV4P+UmR4u8NB1OHCaE8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WLijspocWB31ZA/C/RHahVjFMQ71LdDwkEPBRReeKL7J0ttooVVJIvq8Nn1hQc5VT6niKhKbDx2S7yX4qT1+5IZBq+LwBwnpr34OomnKBPACjUZQAqDZZiskkFOxx3o5E/xIvNh6MwPX7nwBoSg/dIFWBeq4pKQVk2PRXOu2Noc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VcctTj4P; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VcctTj4P"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-39378db197aso136990131fa.3
        for <linux-tegra@vger.kernel.org>; Fri, 29 May 2026 05:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780058096; x=1780662896; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+tSYiCRzDYf6k94bRhgjnN1Iaa8vLJO9NXwq2giecxs=;
        b=VcctTj4P8sA+dqsidHS65x6g/2TniUfZA3DCxiAga7g21FygMBPgspQ/SKhF2188vB
         4tv7hNbyDMIEX+XLUjfqUAiT7FsDdM/mJjAFl+2mB1BSG3Y3lfo7qTi4jzqplkoaRDla
         2iibwTlf+S6MCoNLmVsG1fabu1KH6z8/uJsbM6V/jDzyjg/SG/Zn0+hYwn28JrSKpsr7
         /We8s55bNqEmVTkcTva1H2jsH46x2H94nWIK1y0zkV+SZayNN7SvnOjsu6b0OTtW8EYE
         HVh5Xj1YfTrXvDUhrpwzuATlQIUoC9mFrOSQMKLGSTrWMrWhuseetB9fcl+apJbIQLCW
         kWYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780058096; x=1780662896;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+tSYiCRzDYf6k94bRhgjnN1Iaa8vLJO9NXwq2giecxs=;
        b=T7d4k3uiG4SUetAySmz8Ywlbm0pw1WjzJmNI1jN49gk/xBKLcc2Z3958W3U6HcZo3Z
         9SgnGubsgo23yFKM4YaZ+ODjCuHAq+LDt/VQHj1IHX8iTmqn8tABVZgxnsxlNa1Xwbx0
         abbYs2dh9jCHRo2jP6kVode/rIeBv6F2BbXcXSwe8zBJAbnYPfQe1+cYTD3Ri/6cgWh4
         z6sqot8kuDoFbucZYpmirskfrwPuGgimS5KVzbUcjVD83Wt5WURAT41CwMrAhoHZTsoZ
         gf7gkBbNfeuy/W85mDDEzQKtXhtQMixE5ebPheRbGUQzodrar6o31fZXQ93RDUaWzjrQ
         caMg==
X-Forwarded-Encrypted: i=1; AFNElJ9EedEfULFp0lBtGgne02TQpfzndUozQh9P+89gEolDGIjGnkrBMue8owXvTBTpLbP5pPONKNVOJATxrw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwltS/n7JPbNlqf0Mum3Goe7SN0dKEpc6/Jmn6WcAh2BNsoinqQ
	+Qjq39KFpialCx0EsSxoTUXxFuDCQzT8oxIi8i0RJeQ5weLvV0dBbVk+
X-Gm-Gg: Acq92OEjHPtH25f81HaObWIgz8QDv2g53PjJbKm4adfeArkPM5AREeiP6oPED+Bo5Rn
	vxGAwx7bU+lNZYYYAuDffUimHr1Ki73RSQcDT8oFD1xOHa+I6Q2GIoQ4LRHpUUrG964Z14tcJ2t
	sv2BXY+hGbyW6dCyr+E1rH6SfyC7KFRhWTq+FDycIWYzw+q+oElN14VlPOhdaguYITdVynM19ye
	2qAfw9l3/NlvaOrmIPuPjjLEOTy1SINz39yrlibygkcGRO5XHnmYBxTCGIN0p8w2aoIz6rFeUat
	KNrBa6IG1oHHyZsKTkXMw4C0GVBm5M3Trqu1830rqYVjuj52bVn6Lfe35IFWz3AyuxQubprhzu6
	KgBBx5a5tuTKJQ1dB7THosBe6ZbwM0e5a6MdEkKG0IllKNxBVgK5Vv3vDAZy9a/stQnnPWnS7xr
	F/7oWzxbF70S10D5Q9k1SCie9RGSR0wIOQtpqxjZXjgmOezs+gaYk1eZbcTfjUE4mPS50DpjaqJ
	5rJw6e4XpnBOvkVROoYAYHH
X-Received: by 2002:a05:6512:4027:b0:5a8:e437:7dfd with SMTP id 2adb3069b0e04-5aa59494b28mr758281e87.25.1780058096105;
        Fri, 29 May 2026 05:34:56 -0700 (PDT)
Received: from orome (p200300e41f1bda00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1b:da00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa5b0726fesm252615e87.26.2026.05.29.05.34.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 05:34:54 -0700 (PDT)
Date: Fri, 29 May 2026 14:34:51 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: webgeek1234@gmail.com
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] arm64: tegra: Enable mmu on Tegra194 display
 controllers
Message-ID: <ahmHzIDrB-0Mm5vx@orome>
References: <20251101-tegra194-dc-mmu-v1-0-8401c45d8f13@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pis65osexskejliq"
Content-Disposition: inline
In-Reply-To: <20251101-tegra194-dc-mmu-v1-0-8401c45d8f13@gmail.com>


--pis65osexskejliq
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 0/2] arm64: tegra: Enable mmu on Tegra194 display
 controllers
MIME-Version: 1.0

On Sat, Nov 01, 2025 at 06:01:09PM -0500, Aaron Kling via B4 Relay wrote:
> This involves reverting a commit that explicitly disabled the associated
> smmu, then wiring that to unit to the display controllers.
>=20
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---
> Aaron Kling (2):
>       Revert "arm64: tegra: Disable ISO SMMU for Tegra194"
>       arm64: tegra: Enable mmu on Tegra194 display controllers
>=20
>  arch/arm64/boot/dts/nvidia/tegra194.dtsi | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> ---
> base-commit: dcb6fa37fd7bc9c3d2b066329b0d27dedf8becaa
> change-id: 20251101-tegra194-dc-mmu-ce925cf3d4cf
>=20
> Best regards,
> --=20
> Aaron Kling <webgeek1234@gmail.com>

Applied, though I did tweak the commit messages a little bit.

Thanks,
Thierry

--pis65osexskejliq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmoZh+sACgkQ3SOs138+
s6FmxBAAiBanb8M9UlD9B7ydRWET4B/u0xVciaErCm3IhJJfkvkxcm4Npg0J3wQg
6Kd8Hz8e0WtnTZ7cyjqFu9702BRCCfPdKWoT42g2eIpylhD+2PeT4tEWoa/jYGau
YFtulASI2KEBM2Xc9vSyMyloaVhX1udvmHgC9bIOO0kBrjGyDHD0uyz3vhEJE2rT
Fq2W0/48H4emS+7LWf6kiaMuJyYsZhCH84B5IubP/T3+lv86Csx2L7rCMel/tWsX
JXjtHekOWYfclMu97y7GBmHgmXkGHpBSB4XzGeMFBmZTqBw86rSGcEExD0pa6Wtc
hWFnF5d/B2m4iUNMauxA+V8f+egngz2E0MgT1SlBPJ6/cMKZdYEpcI6Vc1a6e0Qp
09B8pVHswY81MMeQ1g6NM7AeeuJq7v/ogYMncaVb0KBJXfGQpglywbiHwe2k222C
eiUytUXKqHXis9kZmjVSjt+O63WCVJZt+M9FK7OjnpGZvs9FTDv6jzIIWnH2h48t
tektIL+86C1BKXkfn8SwQMlhZin7olv6dvmFWCw4m77j1ARa+1mkKFVTvvg3/t93
1qLN7xx/YW6czW2NpkX1XzHVQrtM7ohVVynrJL9biMAQqfQbGePAlUS+zTydEd3O
ad5Svl+W1WqziGdUQx10gLkLkPRWnFD3o8ER7lRHJRPIvBXzB6A=
=D+gF
-----END PGP SIGNATURE-----

--pis65osexskejliq--
