Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06EA93314B3
	for <linux-tegra@vger.kernel.org>; Fri, 14 Nov 2025 16:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763137207; cv=none; b=mf0dEH85DI8hrJNksImq3LwdtnsmJQEFLk2XVdntbDp3j77g4p0sWRmKS6PYJDaXy+XeAJh4QaaxoLedsTqaZpGceBxwFUJOm5RH/ovmJI+t+lLrX15VVxbDTUdxXHLvGYgLImddaxdgEoXTdvJe6cNHmlEPajqHn47WMW1O+zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763137207; c=relaxed/simple;
	bh=xRJZ6jMJErFW8S2M9y5t/PSV22DoGl0gLAx6CVsNYYo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ce1uVEEo1Wsj2Gjvv0+MhcMlcg0XvGEzMxjXXkcpQWMR4DL/dWO+OAAzo6yTGMfbCmHlNZnYdhhWQMo/xIv+2cjSmPI967vbX3uK6BKIG9yU92cDoDXNNxZiXJUo3mNP03y08XLSSyrftDOoRvg2rmUlh74bhkohivJSXgNfnzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YFpds4h8; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YFpds4h8"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-477770019e4so25860205e9.3
        for <linux-tegra@vger.kernel.org>; Fri, 14 Nov 2025 08:20:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763137202; x=1763742002; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xRJZ6jMJErFW8S2M9y5t/PSV22DoGl0gLAx6CVsNYYo=;
        b=YFpds4h8pBupnYguiy3IS7qOtjztnEGVPNzm92mRuLgCGW7srJTuRonsEtU5ZqVbb7
         zphSCSBMAZIvQdVH1kvSIb/QRoYy2rrQMf+RK4Et//A/gDTWqdGyQ6jB1hCcRiQ0E4jC
         6PgnCVSmzsl6oppWpsv2wKf+rccvN0kkkMStqoGU7xBVboJcu+qGhWV8xY150dGCZzcd
         WnL9dGxagx+Lh18KIRY5K571VoGNvuXCvWKG4EskE6mWKSJZBFxIVC2zCSTCjwmZe6Aw
         GTRydK6DOPdrVWk8KL3YpGt/u9RXeu9pg2BCbULeNEj6ykyjXIch1aduDFyqoQaQtVwP
         ORgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763137202; x=1763742002;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xRJZ6jMJErFW8S2M9y5t/PSV22DoGl0gLAx6CVsNYYo=;
        b=Y6tNoisYPo/AeJoEyjZE4tT8reQXDJqZvtg55H7epH11nGIGBrp6e+dwVksX3oPGdc
         9MwbEgZau+OfbF3u8EY/nOJE9tMb+6LlCb0wcqMD723ax7ihi1/RDrWGj4wH8f9aurAc
         PBE6ilfKVQlSM8EPHICrmhvgVny32JhrTC8wNLRobUkq5IMtsQmUFXVj9Szgcwnd9DfN
         lGNaJVS1ZzvVs034mZcmRLhyXi8mO7jejMHnjq71XhlyikmP2eQ9oJvUDDT2CrDLRUnr
         NGzQycwFWEV70AJ1ngQM+Q+A2Ls1qMzwx22HwRv7IZ50ntJ9xNly8M3mh3tWqK4KK1zk
         5s7w==
X-Forwarded-Encrypted: i=1; AJvYcCWIfTqpb8bIXc5qbcyIhSmzuqnSmYZXH218ZZ2cehFSLhk6iwFBFXBAIJP2jafNAPbanGjJWbikWrnL2g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwhqkUwLTIucSTvc5Wv4kXmpYEQVuZ6OzaQp+NV8ozJOGFyUECv
	Pc9QlNwj3iehFMy4L5J7cWYrDvRat3VvmFQOpcaD62qPEJdkiyqrSD8w
X-Gm-Gg: ASbGnctTo5UnwhKE9ttWvcoLUxpH60vi+kcPn9owFm5DMu3vxd2VlYSfh1yS67WBs/J
	bQ+lVAJjehqQ84p0DRPlmr89D/Nc30h9hP2q12ewhJZ1sVCvg4HKGHE8bz3wz9AtKaZ324YHg4v
	ADZuZeiW7mD93xt5bqbNYt88WLAAcSVWXq6+8vLCL8q4fedGSOCSzJYYQu+PcofnnG1F/QwCeU6
	uZHJnMcEQiWfrKl6374GzvLhTBus5/ITyDkWbE9cEKY5SrOz5woSKl7LCz7rYxdV1+/GMoUkFEu
	+XJFX9Z7BtjXXt0G6Y5lHyIHl/bOfxWg7906DLep15efrLBJEJtWquZu5xw6VcI/1Db8X2ov2L2
	ayczhUJT+TQTH0RnLh0U+a3SKpP26XaOHnc4IKHyYxFwZu+luG4kWGEKaYnMAN0rguGEO9mWGQV
	16ZqQq7VExrouF7b532KysV4qb8vN2U5M7FEWCYRC67o2WRL6xMo4N5KjsXcWqcTk=
X-Google-Smtp-Source: AGHT+IGPO1lenOchnrasSPYqiCi+e25JXRb9Bjs5hKoHDOtnL2xElnNT0QAVYLXldb/om0OlbBaofQ==
X-Received: by 2002:a05:600c:4f45:b0:45b:7d77:b592 with SMTP id 5b1f17b1804b1-4778fe49cd4mr37772865e9.12.1763137202046;
        Fri, 14 Nov 2025 08:20:02 -0800 (PST)
Received: from orome (p200300e41f274600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f27:4600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47787e43c2fsm150148825e9.6.2025.11.14.08.20.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 08:20:00 -0800 (PST)
Date: Fri, 14 Nov 2025 17:19:59 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: webgeek1234@gmail.com
Cc: Jonathan Hunter <jonathanh@nvidia.com>, Joseph Lo <josephl@nvidia.com>, 
	Stephen Boyd <sboyd@kernel.org>, Thierry Reding <treding@nvidia.com>, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] soc: tegra: fuse: speedo-tegra210: Update speedo ids
Message-ID: <holicfjdigizvt6abw5lcgs6gadzqcw2qbji2lg4ercbpi4232@btjcye2dukhk>
References: <20250923-tegra210-speedo-v4-1-c12b5400ca91@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bxg7tds4hvzsom6f"
Content-Disposition: inline
In-Reply-To: <20250923-tegra210-speedo-v4-1-c12b5400ca91@gmail.com>


--bxg7tds4hvzsom6f
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4] soc: tegra: fuse: speedo-tegra210: Update speedo ids
MIME-Version: 1.0

On Tue, Sep 23, 2025 at 11:58:05AM -0500, Aaron Kling via B4 Relay wrote:
> From: Aaron Kling <webgeek1234@gmail.com>
>=20
> Existing code only sets cpu and gpu speedo ids 0 and 1. The cpu dvfs
> code supports 11 ids and nouveau supports 5. This aligns with what the
> downstream vendor kernel supports. Align skus with the downstream list.
>=20
> The Tegra210 CVB tables were added in the first referenced fixes commit.
> Since then, all Tegra210 socs have tried to scale to 1.9 GHz, when the
> supported devkits are only supposed to scale to 1.5 or 1.7 GHZ.
> Overclocking should not be the default state.
>=20
> Fixes: 2b2dbc2f94e5 ("clk: tegra: dfll: add CVB tables for Tegra210")
> Fixes: 579db6e5d9b8 ("arm64: tegra: Enable DFLL support on Jetson Nano")
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>

Applied, thanks.

Thierry

--bxg7tds4hvzsom6f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmkXVq8ACgkQ3SOs138+
s6Hv5g//d8gDunDeSCpzsG+TurbTcz0HiKmSAEwxT7HvNJB92Yvgjxjx0WIjKc99
VKO5OuOqalDUGbLQ2vEqsWqCD4HoewMx8kdJGaxJ50+gps8Q6YuwBatpp+u9AWnp
Lx6lf8eWuLlV2kEPqDLWPol1CKo+L1/5Mju+tYS5f/11GSNVBjf2tZexEYj+92Ca
zPJoeCi62Tb07MqyKBdsd1bXg+7OTG2/McIDjIfHO3ylt8rPBAJTy7Wjf+KmkxJH
XMiHV7tLSlrwckZPxGIkyuqniz/Vlvbx0aQziIzXZpb6A5pZRHHROmhqmihFd5be
AQroZxkJV19KzL9Pf/uIoyzg/A0N0nrKCjp/4k4gYi9iNMD0M6gTtmP1OuolNlEu
3PCZrkZd6cbZXRiffNe0saW6JDrFtnU55qMIcZsgf8jxLo93/yWGV7BuG8ZvknSX
MSS9Z40Ptk4exPKJxDFrE4iNjFKO9iZxmW/cNQV0I1VzXnPWHgkkTyp+K51lv59e
EAuvhidTZPX3eWotjHTzfBRPza4c9Jx5WY4Sb7maUp0TB90T7fpHFEhsNaoy4xwZ
4qPleq5apACvZJfKLvu5bUlq2sy9gmTEvSVEXI2N8SCoNt0EVeFgAhOEEHGtRfCs
8hos2zv/Io/KJtI/uvE39NyRoBO9mBZPuaYN06LFMl6Q/MwyHWs=
=9mkj
-----END PGP SIGNATURE-----

--bxg7tds4hvzsom6f--
