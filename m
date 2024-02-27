Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FF1C13B28B
	for <linux-tegra@vger.kernel.org>; Tue, 27 Feb 2024 13:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709039974; cv=none; b=OvQhlXVCAFl6VmDjczS+JrHPF/ZE7SywpWdTN3can51yv7x3WY54wjlndp1cbdMPea0RLT80JU0SU7/xOFmkqt3yp+xJXKSIz0vjIgVNtLvRye40bLWriFOjslzJUMu2DEl41/cFN2X42wsJ1KM1Bj1KW2sM0Z3lc2UrT3I5+Ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709039974; c=relaxed/simple;
	bh=Hi7nlCHNz3RxAz29xfwgOX7uHlYIPKBl6xTpl5nROnc=;
	h=Content-Type:Mime-Version:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=lqeF3d8ZKF8U5IGxvhaKw9nmIrkdkInvPNpXTguZXMF/va5fUemP5BtN0mTGPj/xS5Ozebv2ZvJouAR/CF0EIVN4ij3Dut9r1FagrvZ68Mx9XJg/NAhWkvApKSIRK7HSH0+8n0jPW+fsg5slBkty19BuCTv3FcHaweCK4dSh41E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TwqHLARH; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TwqHLARH"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-565a3910f86so4544153a12.3
        for <linux-tegra@vger.kernel.org>; Tue, 27 Feb 2024 05:19:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709039971; x=1709644771; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+sVEWnHCtjfx1pduFCApW3G/u4C393hL6iFNK9oD5AM=;
        b=TwqHLARHcEWbavhmsYGItVHuKR1G5XgImQFh9X93bHlc+CZ/a0QalHJiE6fzXKoQye
         PkkAw5dJcTLmJHUb08Hs7DWzAtLpgJsb2+fleqdJLGEYfAVCSESrfOAhU+VxebPbKYnS
         U2HTMYi73BklvF4dv6Wqe9PLUGAm/bJXkNifWBKqUxUa2DnKZ79AdaFDPev5La8rJqHh
         Aa4bt55lXP9dyDRifLI4wXA36ySmTm/o052g+0ie2VEWRK9LVn1eo7JRMW92BiL7TMti
         XZxjLPt+uY2teGxBPDnWTGie6ScaLus613wl/5CQcsq/+fFyZ5/WetRF5eQDOXfLbNKm
         XN2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709039971; x=1709644771;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+sVEWnHCtjfx1pduFCApW3G/u4C393hL6iFNK9oD5AM=;
        b=rcOy4EHm00tU8Xhv8fEQPn4CnPOP1libXdscQTp4j2hhbjPkzOgde3rqpP+UfkxR++
         m3FEPIIwbULJOmFm2eXWGWoPPWmZwJmU9EpPJeR5ASK8uyIWxNpGQTpNLTrhyE3R9Pzn
         sc29RbZL2LRihKQlWfgPsr1Eowz0BkRDMhk6eKEiqXc9JtmipGl+Rt2iqCjqZC5YhKOv
         bhCpdcBtIfsipI5fBc1ZPmTQpCW+MFtZhscmXrCJxmKaK+Vx4YftVhG4fzXJqEkz8GGG
         c4yHkB3n/tTNoJKYVzAmB30e9qO1ywNtUT+v5vcYjDb9Fys4glzwgBrO/dXbyIXguYHQ
         4xQQ==
X-Forwarded-Encrypted: i=1; AJvYcCV9MFob+FJVIv487sbpWMmmI9nORAEMVCj3t/zFj6QkDs/oJI5PidJDIf4b5tM8oZ/UCaetwrkpnbn++go8F4k0+IEzzwmFVeFYJYs=
X-Gm-Message-State: AOJu0YyLYvpOMv9pqJycCkiz9bnk884OMKt7d9xvTq63n5ZnRVAMpjj1
	lgs1iqi8yoTiDuKbfeyN/XS3H/uZdNL8WeptmSReHwuI0wq/QhnS
X-Google-Smtp-Source: AGHT+IG2KIGf2F5Kr6AZj3iQCE3Cyo78/KJKKN6Yl8bLrEHIRGCG9zdhpJ4y5EtqjSwGhVBc6CmUFw==
X-Received: by 2002:a05:6402:1646:b0:566:2ee3:4993 with SMTP id s6-20020a056402164600b005662ee34993mr1499869edx.26.1709039970865;
        Tue, 27 Feb 2024 05:19:30 -0800 (PST)
Received: from localhost (p200300e41f222300f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f22:2300:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id n4-20020a509344000000b00565a9c11987sm791962eda.76.2024.02.27.05.19.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Feb 2024 05:19:30 -0800 (PST)
Content-Type: multipart/signed;
 boundary=4204c71fdc6aae8d369f5c112ca50bae35e50ea7afdce5785f0b598d6323;
 micalg=pgp-sha256; protocol="application/pgp-signature"
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Date: Tue, 27 Feb 2024 14:19:29 +0100
Message-Id: <CZFW3VGPIM2S.17UDYEGTTEXBL@gmail.com>
Cc: "Jon Hunter" <jonathanh@nvidia.com>, <linux-tegra@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [GIT PULL] arm64: tegra: Device tree fixes for v6.8
From: "Thierry Reding" <thierry.reding@gmail.com>
To: "Thierry Reding" <thierry.reding@gmail.com>, <arm@kernel.org>,
 <soc@kernel.org>
X-Mailer: aerc 0.16.0-1-0-g560d6168f0ed-dirty
References: <20240226144536.1525704-1-thierry.reding@gmail.com>
In-Reply-To: <20240226144536.1525704-1-thierry.reding@gmail.com>

--4204c71fdc6aae8d369f5c112ca50bae35e50ea7afdce5785f0b598d6323
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Mon Feb 26, 2024 at 3:45 PM CET, Thierry Reding wrote:
> Hi ARM SoC maintainers,
>
> The following changes since commit 841c35169323cd833294798e58b9bf63fa4fa1=
de:
>
>   Linux 6.8-rc4 (2024-02-11 12:18:13 -0800)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegr=
a-for-6.8-arm64-dt
>
> for you to fetch changes up to ff6bd76f4d997642ef390bffe42e93d6f7be87d3:
>
>   arm64: tegra: Fix Tegra234 MGBE power-domains (2024-02-22 17:58:59 +010=
0)
>
> Thanks,
> Thierry
>
> ----------------------------------------------------------------
> arm64: tegra: Device tree fixes for v6.8
>
> This contains two fixes to make the MGBE Ethernet devices found on
> Tegra234 work properly.
>
> ----------------------------------------------------------------
> Jon Hunter (1):
>       arm64: tegra: Fix Tegra234 MGBE power-domains
>
> Thierry Reding (1):
>       arm64: tegra: Set the correct PHY mode for MGBE
>
>  arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts | 2 +-
>  arch/arm64/boot/dts/nvidia/tegra234.dtsi                      | 6 +++---
>  2 files changed, 4 insertions(+), 4 deletions(-)

Sorry guys, I didn't spot this on the list and thought I hadn't sent
this out so I sent it a second time. Please ignore this, it's the exact
same PR as the one from last week.

Thierry

--4204c71fdc6aae8d369f5c112ca50bae35e50ea7afdce5785f0b598d6323
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmXd4WIACgkQ3SOs138+
s6FqkQ/7BSvxk6B7SGLvYEO4J19S+kyW0VABxRDERWP8QXQ+8ep9F9G9qGlSBprG
itDRAfo3kn1ALOCBATDF2C786D2at6HWYg25LJn9uxaZS4avW3xQlEiux6AVFbiT
13IOEh+OwKm8ooXZgnqnDgNeTdgdJYL1VPr589qQvYb1WBHU745IQeieeT17wYz7
TE3QWBNu8yjiBOCDBXFNrQvR3nFgAQqqImb46R7rVfjL1YYDiZxlTxol2nGZQZiZ
PJZM4ifCet5kv1ZqkWhsYi7Ga2R5qQX+W60imfIK0sobLeD1cpVEQmhmwZrFf/D0
x11d/Dn2+5leMzdsKtIvR3P/5vLAFwQNc3NGxMulpBnVyHW2BUwYaX7X1elesztY
FHZdLgRFPN8MQvWvbOsn9twtrr/jsmrtCgXBGkUMLx1Eun6bugVivCIzT6tJ9100
Xn5oMQC3H6bisrews0xx3RFnkCCcCGxb/hwFfm3uiikwBO7AnoHlFnNyvNFf+jBi
wMky2btSWGA2DAjAgQ2IMIHQLSrpI7IL6ilyTdw8nWvJWh5XtNEA8KOaHaxoyRCT
lnQ5wZT+PwaCEyPHaa7v1bkgkVVU+dYycziXZBEKjRNPQW0xa/m83wGkFEeIvZBG
wJXeJAEk5JyQlU55ip7dJ2jkLavJRYzoilD0vOfumgzm8qs5SdU=
=XMA/
-----END PGP SIGNATURE-----

--4204c71fdc6aae8d369f5c112ca50bae35e50ea7afdce5785f0b598d6323--
