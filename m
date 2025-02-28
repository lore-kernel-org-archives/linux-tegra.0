Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EFDA1EF381;
	Fri, 28 Feb 2025 16:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740761204; cv=none; b=QIkApe7c5E8bwB6YkPv6OjDoiHHE01quspijq4lHBfKcxLY5sfSBlOffI2TaqKo3P1qk03vbykjeuyU5eCaraFE7hdSLt3TzXQ+kMyydtZ/q+xib8BwCPMWq69H3YZIV/uZsyGSsD96piEtSLZR8hTMTl/pb3vG8zcjDxf3CJCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740761204; c=relaxed/simple;
	bh=nvUfiWsd8nbrMykoM7e9GFXW4WS769a83atMPxoEsy8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XgPUfYwgX58WfolsSu6KnI2HipVk752FTHPrqC0T8KWqx/T3PTlEyM9w3eTztKqpksR/4NWQEq4+XBmFdi0/VTbEzjQ5ZD9oKq8AtQn0XiAyqacKSWYL6EjJy90In9RIQNyu5kEc/+I390o7Q0Exc5tAnVkzjk+cG1tgfCyEnnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PkJ5DZhP; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PkJ5DZhP"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-390df0138beso1342579f8f.0;
        Fri, 28 Feb 2025 08:46:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740761201; x=1741366001; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bIuiU4XrhfkhWXOTfdn2ANWaE+TYEkq8GIKO0W429gE=;
        b=PkJ5DZhPM0ZE3hb9JettQZ09nCGLlSJIwarcCorgv5EBjsxn3XRAMi4v/3HxZyx3ee
         FkHWo0nOEr/4t7APrGcT1xT1VAsXMe8jIIIcHadrUGCbTedeBNpC/RKMtP1CwuSL4NGr
         cabXLlaIdXRYLthhT+CjDwUe64MPDY8jG5yRGRh/XltfTpv38OVIcBjUQ2ELJJ8+eFeN
         anaFtB9pXGbUb8fQE/TVsqPi9dwGjpCWQiGiMfYrVDAeVoaLAhr/eB4XO7Tqkf1gCcqq
         cjBKiz4K/+05voWSU090HO8xZssLjkFdpblEHfl2e3TKeM/nuAW363z9Pqlyg/mydAPo
         NI9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740761201; x=1741366001;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bIuiU4XrhfkhWXOTfdn2ANWaE+TYEkq8GIKO0W429gE=;
        b=G/2MMtMkqnvdM8ungtZFd29wsg8wb4A9Y5eIKTCAoMeNMWB8LOKcLixt6cSU3SFABL
         pCoH7CD7+oSc6lqkIb5WfN32O0sy7wwqCZZVKkqGYSOAJdjjkCDeF0taut6ITCjkEklW
         rz5oZpfq3a+B8t0vbRLbQAn+YPnJi5jaIlzOhbiV9wrnHl+2ZeA2aZXmt1Edk7qlWqPE
         p3GL1UIHSKGRkTBkUMw+LvD/KlLDpBZrwbCJtgMuvmTrbCnT2gTo6PfI8Lld7DzeQT0J
         H9A2zD+AEllCp3zwU9ZeuPUY+kOydWNgg19yMtDjcpLbEHptYPEkXO9Jku4VbEOZvD0d
         gPvQ==
X-Forwarded-Encrypted: i=1; AJvYcCWxD/4GonmrPVq/gi6RTv7jzJKrYy+QZeWP8FCThi8KcWl4kD3uP7PELHof+cvK6TNRR1kIVXGnuzexkUc=@vger.kernel.org, AJvYcCXIwVbRgbmKp2R9yGSHHLJKBu+EnA959zlcwe228w8V1NOKa3ocAQXxzhJY4gZ20YXs73MhV2t16vOyO34=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8enlLr+U3yXEzhs5TcA6w+bg1zoy8qref87Sg24u6hKpEeKBl
	G/I92o5HV1hDzNJX20q0Ud6swKP8AvSF6mRsIGr0U+fSLeV4Hfa+
X-Gm-Gg: ASbGncuqmjisJR3K41bDL4uGHBHLtEKhH/Ebza5iiEvAyUllGeIkyztb0WN+O0PbDW+
	HGZh+sjZ7drS6SVTF0CeIgb7cs1NEYEXNajoBkPRD+KJT7Yxu5GNuQHB6Vl8xPuoJxP5xNMoe/r
	Glc0GvHXHNLyLLDPpvoWkZr9VvJ+Ew/intWNdHd34RgeaKce0D5LLXMRwsqQ6qju19fSISe0D1s
	5rZzNrHA6N78/8mGXeGHhY3KBYvhuPkPQprXjJlzHMR35FaYE0D0dGVBFeXc1VojuXmUnNaCMn3
	SBpCRPFovIEqvHlonjCNh84GenC6dWEJvYdj/OHoWvgqCjBdJ72PzINgzZi8EBCtKYpfE2FgxpY
	asFtdoufpuBBq
X-Google-Smtp-Source: AGHT+IER1+rSFFUu3fp8H0Ep8h3KR4BZHOPdnn2CHy633ABSD7noywrDfjqO6v6gIHCs9lWQwwrr3Q==
X-Received: by 2002:a05:6000:42c9:b0:38f:43c8:f765 with SMTP id ffacd0b85a97d-390ec7d2e69mr2382920f8f.26.1740761201038;
        Fri, 28 Feb 2025 08:46:41 -0800 (PST)
Received: from orome (p200300e41f187700f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f18:7700:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e485d785sm5717708f8f.83.2025.02.28.08.46.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 08:46:39 -0800 (PST)
Date: Fri, 28 Feb 2025 17:46:37 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: linux@treblig.org
Cc: mperttunen@nvidia.com, linux-tegra@vger.kernel.org, airlied@gmail.com, 
	simona@ffwll.ch, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpu: host1x: Remove unused host1x_debug_dump_syncpts
Message-ID: <vukpbuvuyfljqtexnimsrfozt64pfrjc33a4ojb7lht7fke45a@g4afdjrz6u52>
References: <20241215214750.448209-1-linux@treblig.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ff7apm55vn4rtl67"
Content-Disposition: inline
In-Reply-To: <20241215214750.448209-1-linux@treblig.org>


--ff7apm55vn4rtl67
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] gpu: host1x: Remove unused host1x_debug_dump_syncpts
MIME-Version: 1.0

On Sun, Dec 15, 2024 at 09:47:50PM +0000, linux@treblig.org wrote:
> From: "Dr. David Alan Gilbert" <linux@treblig.org>
>=20
> host1x_debug_dump_syncpts() has been unused since
> commit f0fb260a0cdb ("gpu: host1x: Implement syncpoint wait using DMA
> fences")
>=20
> Remove it.
>=20
> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
> ---
>  drivers/gpu/host1x/debug.c | 9 ---------
>  drivers/gpu/host1x/debug.h | 1 -
>  2 files changed, 10 deletions(-)

Applied to drm-misc-next, thanks.

Thierry

--ff7apm55vn4rtl67
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmfB6G0ACgkQ3SOs138+
s6EUBBAAgLDSAD8aYvQjGaTHJQTUm8gK7TeixY0nqbT9LFALAgJU1wA3DvmRvfIt
vzHyaekT29Okc3NKZSu7YOCkn/JjwDDJXEcOphZ4HZG4PLk+SPXYNdqOIFShLdNe
ikZLlAytLGgoxw7yBNzm/8p1xdLCSREKuXgkYY0q7FyCyRwA3r8iNJZoHTEB4TmY
nVrE51yJDvZZIOGGA/YUcAcnMEArYlmUm9uZnb2hK8UUOzCWYwllMHS7ZCb1IrQ+
k8Td/dD/IWowQVu0MEExSj/5hepdf0wn5FB5ooy+FXaJFvn6Nag4E1JtsDuxRZcL
UiVfP7+RYC2w4DuqRU7bv2K/+ac7twINlGEK/j4qTi3HJ2wFKvaCpCHCV2vGzfpj
BNDhrEby/eUuJurYZ9ySmE+yhJFcA6Yp0spzaNwa0bzRN4ivyQvaKh7mnQkpxbhg
WXvEPRnf/F/Y2u2aPstbCjAeQK/DVTNhmSl8j3KIn6LVWm1/dncZvNkUjL2orxdn
fg1f4sa7pbsV07DunFwCQNNLe6PXSeMyIA2mSbKoSYt2BqCw9sQDFMUbH90qCYiB
6qblTxCNFyUL4G5GM8pvaKJfTTr0Uik3+wXCFjYE2O4KYuUP3plBzgmpZqnSIdLb
ysAGN03PV5Dc2y91Fd1xNlYB0VqxK1KN4N5CMKK3oITMSdjR8lQ=
=cUVd
-----END PGP SIGNATURE-----

--ff7apm55vn4rtl67--
