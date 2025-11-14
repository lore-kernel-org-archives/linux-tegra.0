Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7232325721
	for <linux-tegra@vger.kernel.org>; Fri, 14 Nov 2025 14:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763131560; cv=none; b=FHSLNPXoxktbUJ8u+21Sj4t0YdeWfeNA01gfYixObUXf379TIM6qHqksCSL06AA69j6vI4XHtJZ8n4+c0Qw9tafn8CqRCMGU/EHHaT+Nd7laF6TlW4xUjTkKfpiYeCkSLdqwTB0Qsjntujbk7PWRTKKfCU5zzUYd1Yw4i+/i8Y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763131560; c=relaxed/simple;
	bh=eGQaJAhgLC/8WdyNNs7f6oRYf3M1D0ppgkOuE5t5C/U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kQnOme2Y0du3yk/VtrNmMdrbXx7U4MiQfg6kULtrr9meMcmh27hiHtUe/80v18hcMyB68Z5mHeTrYYwRhWT+hoS8SsUoh20cA5BbngKcVCEmZQtl37+8nW7MBA0BvePbeqYeLrceqqNNMZ8cu8x3uugqRKJAUmkFKHdlM7woio0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KA5+ua01; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KA5+ua01"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b735ce67d1dso214561766b.3
        for <linux-tegra@vger.kernel.org>; Fri, 14 Nov 2025 06:45:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763131557; x=1763736357; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NcqTFzdPUrrebECSTzlvrk3vTPk5gx55tgqtcHOukdI=;
        b=KA5+ua01cJQjQjsZ1UoBrtKEOu4aJhMyOPcweX6edADCVSQkHZYyrl/4H8cI0Uh+bb
         7X/CrlYPLgbMhxgdy5WYfUt9KHWnLOhjbar6y3hQugdFDnQYzry2g9S1qNC/qaXeoj2o
         UP8rxzd/bg/+msgro9hCW8hDjx7q1Ht/p65S7PIg5ZAOZ2KumibEfp32l6iP6k7LtZFD
         3LG4j32zAk9wuh86y94SqrF5QJsAnWWdfjNfFoGqh8FFbhGKAFF8AmSDVrS0KgU11OTk
         XHJJd3U+dXfo+cgi9BUBwc9oJEoQNRnBtfdv1Pxa0Wqxrjc0xr70hZJjUus77+FDlsSB
         Tv5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763131557; x=1763736357;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NcqTFzdPUrrebECSTzlvrk3vTPk5gx55tgqtcHOukdI=;
        b=aXc2wvIHK/QJib9nVdtqhjhBapyPTXA17h7heFBiVlKiV+4aZXjgQlN2kqHVbEDGRY
         NY78CTTSRe8Fk+riAebWILvffY1RvnbhReshaDKl3Yka9W+pxwlrVpBRz3sgpeqd5+1V
         4BILVMp+sRCtQWZsiaQm/Y8EWK7tqUM9DPBHlDeDjcY6KGhhkKa81XX0ny9Z8lvY33Yw
         +Mdm72+0VclK6T7si+gpeHpPe5B0K6vdSMfm+qjaQ2K5fzE/rXFG/YN3owd6vXLwtt+B
         CBjTjlpS/oeYJitYDwuJ9B+DKxpPoovd0xBMJidJ0U4d+WMpnTLRc98iCz7vyerXOc2D
         xJVw==
X-Forwarded-Encrypted: i=1; AJvYcCW9n5p0BmMzrwta/BDrc4PNYhGwrqjcXFj7Ht0i2wfQZfwZCoAX5AuHI2MET6ABef2TKpBaf+Mjf0Ulug==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4tYlnvs7Ey5QGG486oIf54ti2l+p+8npFcOmuIaaRjwF7TPAK
	d9NnfqrZvTwv/UpMBMqmXYr69tQBRG8LaeTKr4W4JORMZjxhX9OFUmLP
X-Gm-Gg: ASbGncux+yaVuOqodFbXI2ffx7q6/y6QTuwqIHK5ZTJne4TUEAhgUmN02OSGxo5fuRI
	6J76n9JAzcysBTM8Wa0MS/0cQBBOEe4s0nD20F18rzKxQywnjrTYWgAk+kw6SjxvZK6Tj3UjfkF
	FNY6n5JfxGAh7uvsuH0XzVkkqJi8Z+trUt3yL7W3hPINGyi5Fv/wH/YOcz+0CFY/MeKu8Lt+cFw
	A6WiJEVlf8qmA5/f/Pt7YSFrPe0Rurqml+dVIwzWUUryLxOZQ2+GaFDx+d2vKZZLM9NtGnCw47O
	DeA1Ek38bkhpq5+qWc/HRthAS6bT5YvF59TQdzaCIdpEc0Sm7xZC25LuKG2YbohSGngrOzjmpNQ
	/UclWtpxohVxYYi8rzTaf27NcXxFmoBbXzOM8bu/xecB5a3I0ZJQ53o6+2H2Zlw96IbrZM/qygm
	rtG8wJE/ZCGDnSS9b3+wPC3BrSW6ao5pM/DyDoF6yrEiCb3TTLIdbaiVmLZCGAAg8=
X-Google-Smtp-Source: AGHT+IEiqgysoj6mPdEkUsxYCa5ADJtuXMMmC6+1HxORZ8MAAKJwUZz6yC9o54OrnVXBiK+ukmjfzw==
X-Received: by 2002:a17:907:1b20:b0:b4e:d6e3:1670 with SMTP id a640c23a62f3a-b736780a342mr350350766b.11.1763131556912;
        Fri, 14 Nov 2025 06:45:56 -0800 (PST)
Received: from orome (p200300e41f274600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f27:4600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fa80e3fsm408901566b.2.2025.11.14.06.45.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 06:45:55 -0800 (PST)
Date: Fri, 14 Nov 2025 15:45:54 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <treding@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 4/4 RESEND] arm64: tegra210: drop redundant clock and
 reset names from TSEC node
Message-ID: <u7yzyienfouxcz6h75xfetcdsiptgeix5v4sx23i563od7zrcq@hfp2ae3fk5lt>
References: <20251016074152.8759-1-clamor95@gmail.com>
 <20251016074152.8759-5-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ywavfycjlmfz22ry"
Content-Disposition: inline
In-Reply-To: <20251016074152.8759-5-clamor95@gmail.com>


--ywavfycjlmfz22ry
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v5 4/4 RESEND] arm64: tegra210: drop redundant clock and
 reset names from TSEC node
MIME-Version: 1.0

On Thu, Oct 16, 2025 at 10:41:52AM +0300, Svyatoslav Ryhel wrote:
> Clock and reset names are not needed if node contains only one clocks and
> one reset.
>=20
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
> ---
>  arch/arm64/boot/dts/nvidia/tegra210.dtsi | 2 --
>  1 file changed, 2 deletions(-)

Applied (with slightly modified commit message), thanks.

Thierry

--ywavfycjlmfz22ry
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmkXQKEACgkQ3SOs138+
s6Em8A/+Ipde3xuVzE4XtJZYiINOPv0t1OJhnFJVyZG3fnIl60MPRbtKfNp9bwBD
kmPyMG/XLwluGueZxbq69LfqP85lVbogFcnhwccby2woXXtSvZzzaKG5t6r3Q6aa
nTm4xlsoPeh7jEAE7HEbgHH9wqtIbwMhw5SA5DhD6nocg8ggmLhVXP6cy6+k7WZo
QsZPySBmTM4GGXtau7nWXFuaoQsE2bxTBhSHw07Gyx7rKoE4L23/Cw5k5xgj3Mcn
Q9P/PVJX6fItddWPQeKVqYPyGpwTqjRxHZdu1VhioJKAozxRrFe4vQD0oqKUK8Nx
MSJNJSf1bGAWDjr/Q8aRLVqJcjBD1ClQRBJMRSNYNNLDGStf5LIXOT99LA+AbV6K
RAJ29WTX5V3LsbIxaoX8bu3pM5n2HkayLTzunw+SuNBGog7ip040t26NRxqh9nUR
ukfHVju6bFACsN24pm0VCLzhTvx440/ABY3fWSirOjQyN5yj3zL9CgR/52GIeqgS
U2pFwpt9xLA4EoDUQ7R6INyUBT503OcIUk3kP96BpFnlVgsWXitqy0UXfPbWP6sF
d4v4MJR4rkka50fQusiw0xuKgiTWx99kidJulFfJeUx1kfSi48f7uvDyDEesuy2L
pj98WV8xkNgoaS+vpcMHRUdNTjBBo8VhJ3geBaqYWsqC7wA/Xog=
=/F5w
-----END PGP SIGNATURE-----

--ywavfycjlmfz22ry--
