Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ED8831D722;
	Thu, 11 Sep 2025 16:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757606433; cv=none; b=jwVPkzzSC7MegLlBtX2FcpyiqlW/Dm4yVXLj3fINDykxocM9sm68eoJv33t5Wox3j4mo8iftOD7ZZh9kxvPQb7P4Sc6FL0USFHaobbNLzvafqyQTSdvHHcsr57WaeN35GO6f/g0hdJ4j6syFMXe5v6lAqlErZsg5i483Sn5bLuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757606433; c=relaxed/simple;
	bh=GE0xcxm4c2iY0e8q2XTeX+zYsDTrE+bg4a5A1tk7/vg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dGgSSm8AVtIFZOzjN+KY+f23qoht2e6KarnLYK+GcuHikNR3jBkWBznVGIOP4oMFavqcMnIIX8ekBfbQw5njj8E/wdz9JvicqxKzqVL4Rf3J8sgBZwWBSF+YjdRLVCRncJkwNf57EYiXGOwEN9nz4GQeIHKgKqmCj9QOHA3JF8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ay2mMBBP; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ay2mMBBP"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3c68ac7e18aso665752f8f.2;
        Thu, 11 Sep 2025 09:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757606429; x=1758211229; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Yw1pbGwnPzhlpLPQ0ur7N3j93CRnmPtC1nCr4I/6flc=;
        b=ay2mMBBPa73kZY5m6IniiixZVGwf2uHeJWg/Q823tnAalWfFdjUX1r7zlq8v6oCRS8
         u5g8sBhkm2qMii3W/jm89Mqp7fim+i3fBiB/uB/Q8I0rMhj6+9eiTq8szXyvFYGcBhE3
         Zeu+bVY9CkZV8ka4I4NB7THFItlTSxT7nS8hKtPKETkYzPgfkP13SbIjIn3gBK349IbD
         08zoWxCOijIZIXKo059jl1TeG5YlErkc7lYUsuTdidu0h94ymNI2wX10FCMzTdXJsDxH
         FFCvexkGb6KM25Y0mqPbMHJYmqywmk6MoTZsJm3X2cYXejpopHy4AyawAxvjd3jx3Mki
         BAQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757606430; x=1758211230;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yw1pbGwnPzhlpLPQ0ur7N3j93CRnmPtC1nCr4I/6flc=;
        b=aXqIjXsGPJpcogdzuWb4FNygq8mvXVxOp4EVvUMrgtnteBjXUezYt608jb9y75wbJ2
         YunPpPOKj1hx9I2pZB1CSRpO+/KPkr9yOQhRnnLBnserAZU1l/bVu+kjjxz5HGjFcIMO
         sVYxy3pNDgkYhKjr9Db1qMjb1Jg5p2URKCKwAF7DDBQWNsVFyMuKxQgPoM6XvxJqSe8Z
         atOUnIW4Z0RV9bl2tNsBalFDzhHiZWDIgSJLGTj70qG6UP+kbNwJnzPqL+20lAIp0NhZ
         fKl4kF6gpB/NzlMWrYKIsKUnObRdooDuV4qp93ZcCa5+H64wLeGFlSflkeUGUq29Ab9A
         4TZA==
X-Forwarded-Encrypted: i=1; AJvYcCUVpz0ynJwvjjSW2UQNmVliRVudZyqKoxh8HYI9USk5h8xbCL4DF6ufDAzRIp5OUUGZvyUSofjUQirSqQk=@vger.kernel.org, AJvYcCVJlAljEHQ1FHhMidIlX7FdL8xiVszvwYmKFE9JRp/N1UF167GqPRrR9JNvTDNhl0ybE9K+tOoKVdyxs8GB@vger.kernel.org, AJvYcCWL95zWeQc3+bgP1aUlCRAApqF6qVstlBXj6XGnyZA1LFLb74rJk1pAzd8FgpJCtbWdJDCaXRy9KYPX@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5eoRiEUYhO8lFCoULOKT1gZSQBnmMtN7i4uSlvTSMB2tE0oPM
	1wtHa1g0dbuLEFHjXSsh5SVnWUSzvk0CZweWgbS00wgoInTEpS/KuTEtA8RNCA==
X-Gm-Gg: ASbGnctvw7Opuf0osuwUKLkSl4bafW6ILvYl9SF4xUJfNNCgkZfOc4Efo5h7hI0Dspz
	sosHdf+YniuMfCjzw0mFFXMlmk5Jfiaj2K08iYpCNWh0zjZtgKEKZLca4CrLhmkrSrCbCN/NVcE
	VMXxoFVe75+Vi2Ojkevmsq1D3ctCjxmaXr+DHXq0SQt2v3HfFh1AxKzqIVEWFnsWsSsq6jovATO
	0zEpsOfjT6aHAPQ/W3nfiOC+9ak7DWDQuMBVICjFkWqdAXS+c+j0xwcjLyzKAJU8csTwCeiwWTB
	1tlzRuyvajQB92eb3D3g1v8A1ka2zXGqdbDDCmq0x1/6pj193g5i4e0AVQcJ55+Q7wb0qfkg+QL
	cVJJLxT8ExT0QHFUnHGP/09M730HjZzmLEkyznddetV5Mb1CeMKTUidOha7rESAHFB63vrsxR37
	Nz58w5cLfNvR3XKrUjtpJvvbottmS/ew==
X-Google-Smtp-Source: AGHT+IE4FyMH+lPLjJdLSD2D7MlTZ856s4BURksHTllKCni2L9sAI9mHlulu3BwY6zUtLp9HvYR0/w==
X-Received: by 2002:adf:ef08:0:b0:3e7:5fce:4788 with SMTP id ffacd0b85a97d-3e75fce489fmr2359327f8f.10.1757606429369;
        Thu, 11 Sep 2025 09:00:29 -0700 (PDT)
Received: from orome (p200300e41f1c4d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1c:4d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e0372bbd3sm27830415e9.10.2025.09.11.09.00.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 09:00:28 -0700 (PDT)
Date: Thu, 11 Sep 2025 18:00:26 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <treding@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Ion Agorria <ion@agorria.com>, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/2] ARM: tegra: add device-tree for Xiaomi Mi Pad
 (A0101)
Message-ID: <2tmlhaymx73frvv3qv7qvaagzwvh3cepringiyvhsmqrdgfy5i@fvspt74y6nj7>
References: <20250909074958.92704-1-clamor95@gmail.com>
 <20250909074958.92704-3-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="aldenwximqaufmm3"
Content-Disposition: inline
In-Reply-To: <20250909074958.92704-3-clamor95@gmail.com>


--aldenwximqaufmm3
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v1 2/2] ARM: tegra: add device-tree for Xiaomi Mi Pad
 (A0101)
MIME-Version: 1.0

On Tue, Sep 09, 2025 at 10:49:58AM +0300, Svyatoslav Ryhel wrote:
[...]
> diff --git a/arch/arm/boot/dts/nvidia/tegra124-xiaomi-mocha.dts b/arch/arm/boot/dts/nvidia/tegra124-xiaomi-mocha.dts
[...]
> +	host1x@50000000 {
> +		dsia: dsi@54300000 {
> +			status = "okay";
> +
> +			avdd-dsi-csi-supply = <&avdd_dsi_csi>;
> +			nvidia,ganged-mode = <&dsib>;
> +
> +			panel@0 {
> +				compatible = "sharp,lq079l1sx01";
> +				reg = <0>;

Looks like there are no bindings for this panel and I don't see any
patches anywhere that add them. Am I looking in the wrong places?

Thierry

--aldenwximqaufmm3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmjC8hkACgkQ3SOs138+
s6GQkg//fg2ezajsxhrYNBgzzBWPE4ciQl6ByB86MJ/Ekj1RF9X3y0n7k8esbTb9
bUNtsPIXmVc5gNSharst/8YiVjBZ1l1T/g2WgSIWdoT0qatLQaTQjvFB2vNKWAnk
fFbXKJg88ZFAy8KE9CaHbdodUy3GtiWzflY/hN+wrrHhCINAO7UwDls4T4uB5DMS
UWXFerQ14jQP+llMah5gs80ycmQwbRwtz130sYrCcs3JTsn+dOeZPU/Y3CimsgIr
9oi6iBe3C9FJU6Gn+jHXShJLR0qD5EwKM0MuEIB3ZOpOKwU40EkEhjY0h/IgWiq5
jrQdsG29i7j5bcf+rTxRt2z3PmXpfhtUbIXJeaBiaT6wEf8afzCtMCcDe8YP3FYJ
yc+FHPB7XH9wIWxbH6wagdTWvsz2SkXSAaziCcH+MTX4M8JbjVS/wU8T3Ma0NkFV
g3tHYgix0EdLgbrBe1obbn04XAoiFit+tZGGDtBsyQyH/P/b/R6iZ71dBuBIXgxz
h6emUSxMcMi/owzGej8FPGvI5+MDl9qgu9YHO0vE6lBQm3f5VS09ASd7SipSkgyX
XbzX5x4Uazr4MZFmE59WiWXi3uZ7amxcgYEVTguhn+z2n4qsneWygzWuC1IdME4/
xr0NL1BKc8j25XtjeayTUXLFGdv7fjp4u3niUUAHUAwj2i9JFS0=
=tBkQ
-----END PGP SIGNATURE-----

--aldenwximqaufmm3--
