Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 796301C2324;
	Fri, 28 Jun 2024 15:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719588604; cv=none; b=lFJUpGkT+uRU8svkrg4EczWzjLrUtUCa4TLnCDTM4pZphLlrtiyXN3xnZrPaCaZd6igdSKcCpvoLa/hmoWez+remxzo2dYXPXR3U6MHv6roMLa7B8bCfu0akWYrn41XhVrbUFVb9fe/48zQSjPL4z65yiog1AYdVuYa2G6aOR2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719588604; c=relaxed/simple;
	bh=XYOyyCuiVe+BrAGQ2wlV9uCkd1pp6KaUyL3Z6xvX3So=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tyi0+mXDHfcnkvltBDnq5ywuATRKBe5v6iL5mMLItVMJTCIKEEjoGLeOTKKfJt2brFcaUrZEoVdEmLsvbXblk0u904638NHsC+xxll94cpjiDUWEeLcL9kM5liKVtuGsolm51ImJi/5Emjj3bli9O5AqoNnI13b3r/nSpcVOP/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R7HGFIER; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R7HGFIER"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-425680b1d3aso5217135e9.2;
        Fri, 28 Jun 2024 08:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719588601; x=1720193401; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jmpztoIUXI4UHbHgVIQQb9XtYlomCPjgZpbcA/BlK7w=;
        b=R7HGFIERja4Qz3wpTOqd/0fbs7tDHgv1rqbnWT8PyARRN8Fwqfmub90SrrwVWPXcgS
         52NOATEfhsxSQgWjOFi5BDLW5Xf1H8ZfgbYhBiVLuODx87bqUD2ObV8TDKXOMlSEyyXX
         SM1fWD/kCfYOPK/lrg5FAt8x4xEhgeX3TfAVRJ4k5AN3I0uVoLdoutzH86y6+yZvj0vm
         jRKALxic36unDMocg8IULa0ox08aVmp+qgjp4n1mTElKA2K9Sao0zgQSa9SonhVV+mf8
         HKjRtLoQhhAit6hkYjffVEMrLB9+76yYDKHc/JNw1kRqXEBriOORP6oMSDphTODs+P4I
         iSMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719588601; x=1720193401;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jmpztoIUXI4UHbHgVIQQb9XtYlomCPjgZpbcA/BlK7w=;
        b=dnk2cdv4U0evO5G+crb6morNYJgkZ3p87ZMW7yBhiXSTu9NlDH/c1m4UzJ2RwHZjUv
         aopRLPRZYmVPEddSZUajLAHisFZ8tsX+SZAtZYCOrVrO0B8Oz8h6MZj3vHDn72KUUDhD
         /8NUEXT3POG55/N9oeIhROCSRjHCisXeJg2FoblgAeJc9TMfZxZ5VjWjmsGPJPuOrfbJ
         ZuYtBXS8ANwgaENOtdk7oD1EM8P+y+5SPsHurQp6RM4Mw1wawg2Q/Qr7kp0n4CUT/ESL
         fm8HlQ3oW5bGZI3Hhh5H4o9R+3hsFyNe1lhAdbjUTFEyDQnFuzb42sweWfihQBokloIS
         xaPQ==
X-Forwarded-Encrypted: i=1; AJvYcCWI9is2CEpEURpKuCFxIimgSmwU3EA6ga45ge8T7sHaHyLjTszZwzOVMDiVy2MC/EQ7n8MTP3u6SjOt3FxwBpdfjLSTkVnMph64wPCP
X-Gm-Message-State: AOJu0YxVZ4xGHipATIieFypFpQDl/bQuZK6J0RAEY5MV/5jqoGk/4FX7
	ptaO8NAhOgxBQmKetO1BXvD+8qgCjCsc6ExaQCH1vO3mvAqT7eBH
X-Google-Smtp-Source: AGHT+IFlyBYAEs9YWht+I31yyrmHOVTJSGcgvzCcLqVTSUQei/1pxArTzN5ZiIsBY7Nd/2e6D2FtqQ==
X-Received: by 2002:a05:600c:5105:b0:425:68b0:1228 with SMTP id 5b1f17b1804b1-42568b01722mr27125525e9.35.1719588600335;
        Fri, 28 Jun 2024 08:30:00 -0700 (PDT)
Received: from orome (p200300e41f162000f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f16:2000:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4256b097b82sm41502645e9.34.2024.06.28.08.29.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 08:29:59 -0700 (PDT)
Date: Fri, 28 Jun 2024 17:29:58 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: jonathanh@nvidia.com, kkartik@nvidia.com, rdunlap@infradead.org, 
	frank.li@vivo.com, Jason Sikes <sikes@qlogo.org>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Fix warning in tegra_fuse_add_lookups
Message-ID: <xyxjlp6hb7jcwlhbm4tpmt5npx74qpuzybzakdkev6ta2nl6go@txh4ue7faenk>
References: <20240616073721.5696-1-sikes@qlogo.org>
 <171958790864.2433364.265100419611870394.b4-ty@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ibnhoa6hups3xhlf"
Content-Disposition: inline
In-Reply-To: <171958790864.2433364.265100419611870394.b4-ty@nvidia.com>


--ibnhoa6hups3xhlf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 28, 2024 at 05:18:48PM GMT, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
>=20
>=20
> On Sun, 16 Jun 2024 00:36:57 -0700, Jason Sikes wrote:
> > gcc 14.1.1 warns [-Wcalloc-transposed-args] when sizeof() is
> > used in the first, but not the second, of two size_t arguments.
> >=20
> >=20
>=20
> Applied, thanks!
>=20
> [1/1] Fix warning in tegra_fuse_add_lookups
>       commit: f56da7f4048ff41cb029a715935394f5958a825f
>=20
> Best regards,

Scratch that. Looks like gcc isn't warning correctly here.
kmemdup_array() does have "size_t element_size, size_t count", so the
existing code is correct.

Thierry

--ibnhoa6hups3xhlf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmZ+1vYACgkQ3SOs138+
s6G/SxAAkGcaLvm4Wuz2jBQmCwsaiUnw38ByVMEAKJKZ7iGVnLqsr/R6/JUh7fGB
bPv/LMmYlqSqIuCh3DwI0baF8OMQWT/prKcBPSfaLYEb4BD98W9WMUpPnaP5P65P
WTAw4eTk0Wx4tB4VmDc7me45vZkRk130QbLI80ek/GVz635oRZI9OSCzR21Ql7Mh
oEljtOAVh0bPf1mKb3c/rrPJ+jiSbjcHci7aOM1ERboqDOZPqRBVWxi6dbato7K7
h8djOhu/zi2IPzqnakMWVhf7smZGjvVACPL3xBFKfJ3w2mExy3gDbtbourPLr7ZX
rlYiomQoXWlHrnfteXiS9eifkWo8W0YinUdpW2BXjGe4HizBn1az0OVetCqc4EBJ
tlofM0h+Hi4iRNE0efBYMWaqJH5psmdKvXWw4R16lw1yqd5iohRAzQuOI/CqxL30
k+n6Jv+ncCZD3TTRECe8w6az7IjN3Y3a23iWgu9SVwpONKZPAavog/Hzt80YJQsn
cC1tjwoNOOiroAftgSHU7V1K+6+OjRrgtoxg4xhuj+FPh1oCBT/Mg/3UiZfCDok3
GT7X3JM+o0GeKPvWvRCY3FblaU1YMbklS9XsMA8cEqeiG5IBsBmtsD6j08r5dQRv
M0rMXBjLNq+LYxMDvY0z5X8ZwygyUPx3wExdwfuys9IU6jCfOAU=
=Y1Ux
-----END PGP SIGNATURE-----

--ibnhoa6hups3xhlf--
