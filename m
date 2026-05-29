Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 558033D2FFB
	for <linux-tegra@vger.kernel.org>; Fri, 29 May 2026 12:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780057841; cv=none; b=tXESQ1TKHTP4TEL3kiyMRvnmChEmI07WPkEIzyzze4cyQKd1hFjgnwx+wEaC1FprtJspUOalMwV5xDvcW6cmbGLBiGyGnLaXegXdkrmwPPS+zckv7/kD/2hI1XgoUA1oX4BV4NslKUKU00F3oaGhsa5D9R8EFejzQ3sSN0SnW3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780057841; c=relaxed/simple;
	bh=DyC2Vib28wfmR0aQeTVBW3Gj7i6krsTikQR4U1MQqJI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GxxKTS25GLU6WKqsmbjPEtA0ooMwafOm1KZyuGxIq/qLv+sY+ReKptNPXT9I9ZxzJfxmRhubXTxkGYE+4MUeMHX1zeG0Ai3sNIceh4FDjfMY9mO8ohMSE53AYkRr4nDIYMoJXw4IdHiEWVhSQMUrO829Io5mLT+MUuIAOF3dFwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X6baG0qQ; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X6baG0qQ"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5a40502e63bso14059002e87.0
        for <linux-tegra@vger.kernel.org>; Fri, 29 May 2026 05:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780057839; x=1780662639; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RKvGtal20Qw6UoC2q1rlPNZH8iLMvVd+YalFphindlw=;
        b=X6baG0qQ9+5iikH9EaVYaZCeBrJCQI34VNxMX87h8Hh1Hw5okcU3PG1Oy/aTHbMXBL
         WIRLQtp7FxOp7D6dGcVsFixs/AWj8sfLm3GbVa+1mjNXyoBeRNSCnrQIHTM8gnTq9tog
         RKjrw0jgDAHcMx2ujuWy1gQrkzdVNpUDsNCXbd/nJa8y098VGSLW7meTTsmP614l9JCN
         w6CpXsVULvL1ri/KrBfbTd0Wdu0k8eTwZEawxLDTlioIacXqHjuwqD7tbnu4AU9Q675Z
         D198VlXIc8Cp67lDMhL4Y3AHhBrP7ZzknJb1qpzIsqQqNq/fhDACqDxKlxi/12H4Se+L
         nmlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780057839; x=1780662639;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RKvGtal20Qw6UoC2q1rlPNZH8iLMvVd+YalFphindlw=;
        b=UKm2eFanacN/swSiFskcfblkECRiLDK49dPUGB4M+PUT0L1WeLz2bV/PXlTFQIIDs2
         BAm4epJLkxL0Hmty9gwA4WoBPuLTJGUD2tVFTSr2aedSgkE8Z8nUkdvg+FQ7nwgQuK+b
         5X/UlCytF76j1cVPC77A5HQfv7gHBxE0encpVf8K3ilht/MerqdME0zYjg3SkiMM6PLp
         nwKlLqbnnEWkHZA8o8FW0V6AR6IuX2AFE4T21o+YkT1usjOI3DbAHB+zPjyx+0yI9Fo/
         MZ9Xy6PD3xnvtu5Yk3PzpDwkRheNFsxEK6fcRZxEBFzcW2oNsODuLW1ZJVof3yLQA3ab
         oHPw==
X-Forwarded-Encrypted: i=1; AFNElJ/4N3k8Zn7JzU4OewvOVB2gRX/QtyieuuuC3H1LgtTTYyUXKcwu4pxvFE+Z8/fsdlJGiPO8jkA+zkRrag==@vger.kernel.org
X-Gm-Message-State: AOJu0YyqAPpQQBddf8O957N8wLXu8MbWBzBscupAes9Kg1nJVGKpvQWo
	Y0R5gA41zVXV9DlxB1TYV8tEaHd1yDnkcLzkMCKBgCOxuq800A1l8jkf
X-Gm-Gg: Acq92OGNzZZgVsTenSGOC1cPqrbhkRsWTnXolPKFXlJ4b4oWEdCuLvjhbKNUpPnGqMJ
	DkeLmzYCKZqK9kYcfJ87lE9TcR8p8nfzBRp1Dxwhe4ejMRikJxgbUcRZvmG5pihhwnZ3hPWa22O
	zASaivFaH51SlAVvh4PW3bedTwGFCLTZEvsomBhxgni4miuNsR14E8vYg2s+Aes1nM1mbLZJAi/
	SgLzJjcGj1RXEVnx+RHuRPyPUPDvLT1rog4V1iD8j6yNeMbEy0zfNRwlkODWqIFl+zjjlgk6Eue
	v0PbsmLk92pXGPzodImbHPBNIBDYz0JcvdxSBEVSu077g1aJKEeYdIkyS4aGPttX+S9PDMYMvl9
	TgME9KioLhQWLCjJIca9l4AVwimx6m/8/yyqZ8NgcaTZkLl2u7qbAmbhD97mFgD8Dxs7KDCcCNh
	Xfbw4Bjg/eIXtUs4kd8ghYJxpgw7CfhjWBAYrf7PXet7PNS59V2GXtmEbNEX5Ub1BPzUULa3GO1
	CYJgO9THqYCZcltY77WN8SB/2d01V5p8B0=
X-Received: by 2002:a05:6512:3407:b0:5a8:847a:decd with SMTP id 2adb3069b0e04-5aa5942c555mr888849e87.6.1780057838196;
        Fri, 29 May 2026 05:30:38 -0700 (PDT)
Received: from orome (p200300e41f1bda00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1b:da00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa5b00a5f4sm260919e87.0.2026.05.29.05.30.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 05:30:35 -0700 (PDT)
Date: Fri, 29 May 2026 14:30:33 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Thierry Reding <thierry.reding@kernel.org>, 
	Mikko Perttunen <mperttunen@nvidia.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/2 RESEND] gpu/drm: tegra: add DSI support for
 Tegra20/Tegra30
Message-ID: <ahmG1x5GtztLg-CP@orome>
References: <20260511074538.24563-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ugsdrugixr4n33iu"
Content-Disposition: inline
In-Reply-To: <20260511074538.24563-1-clamor95@gmail.com>


--ugsdrugixr4n33iu
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 0/2 RESEND] gpu/drm: tegra: add DSI support for
 Tegra20/Tegra30
MIME-Version: 1.0

On Mon, May 11, 2026 at 10:45:35AM +0300, Svyatoslav Ryhel wrote:
> Tegra20/Tegra30 DSI is quite similar to Tegra114+ apart MIPI calibration
> logic and clocks. With a few minor tweaks, existing tegra DSI driver
> should work on Tegra20/Tegra30 devices just fine. Tested on
> Motorola Atrix 4G (T20) and ASUS VivoTab RT TF600T (T30).
>=20
> This patchset depends on Tegra20/Tegra30 CSI bringup since both share
> MIPI calibration logic. Ideally these patches should be picked after
> CSI bringup but they will not break anything even if picked before
> CSI patches.
>=20
> ---
> Changes in v2:
> - removed all MIPI calibration, it is handled within CSI bringup
> - added per-soc structures into of_match
> - added fix for hang caused by register access with uninited hw
>=20
> Changes in v3:
> - switched from version DSI to boolean flags
> - added comment regarding Tegra30 clock configuration
> - commits were picked:
>   "clk: tegra20: reparent dsi clock to pll_d_out0"
>   "ARM: tegra: adjust DSI nodes for Tegra20/Tegra30"
> - commit adapted to recent DSI changes:
>   "gpu/drm: tegra: dsi: move prepare function at the top of encoder
>     enable" > "gpu/drm: tegra: dsi: re-add clear enable register if
>     DSI was powered by bootloader"
>=20
> Changes in v4:
> - switched to device_get_match_data and added check
> - added comment regarding Tegra124+ quirk
> - adjusted commit titles and message formatting
> ---
>=20
> Svyatoslav Ryhel (2):
>   drm/tegra: dsi: add support for Tegra20/Tegra30
>   drm/tegra: dsi: re-add clear enable register if DSI was powered by
>     bootloader
>=20
>  drivers/gpu/drm/tegra/drm.c |   2 +
>  drivers/gpu/drm/tegra/dsi.c | 126 +++++++++++++++++++++++++++---------
>  drivers/gpu/drm/tegra/dsi.h |  10 +++
>  3 files changed, 107 insertions(+), 31 deletions(-)

Applied, thanks.

Thierry

--ugsdrugixr4n33iu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmoZhuUACgkQ3SOs138+
s6ED7A//cJerqjiX8am4Jd3tndfUpExblFmlthrQAelKsGPTaEcB7tFzABRj1vIy
u1EXMrk4xBMmPw/VNY4HG5hK/mnGzmcUD1HO52X/dKCAVWbbSO3NJ5exA2+Qrag/
8qRP+YHS57dJEtO6yb04+rejedAd0QHIr0/Oim3qmthtBFzDb7+f2YqXTNtOhLBL
SFLVvaYTUNTdgaHQCOVkU/GCbpag+ylV6jG5+mSpfgXUirbeqhvgP0y4+zJubUzC
W6mZ8zRGG3nkC9clSNlyqP/4eUfATiwLR1AtCrCkfTcArNynT6Nf2m26MZbnhp6/
3spmOYASeH1YvLX/s0G4wNIpIbmwm5Nql4EgFUOGUIZrCDmTJORAEFcrTyj02fjp
U6U+IhOkMj9185wDPPoQOGCqg6KtdN+ZhQcKeVXJEbHWqrN6Ad7DyzVylwuep3A5
R3KdsdUKHBSeIygIsW1I87Q2Vx32HYUg/9oHk2zbrAWY+OdrSgaxhijD7rTHakTG
ryDYHHuC/mZSY4QGF63m4zKRQjpBecb/zZm8/dAt3A/CTAtWCVJarPcp7gRB974I
Gb1IRoNUPbEZ4/vIJY1YpDGpcalb/vp3hC1pI4zwRHJ+Acpxdhx7sov9sm53/DM/
BaBTswD1Ef7cjSCKYE1h7/QaimAi34oGDw3Jjt/w4GAksFXgYUY=
=ZtnO
-----END PGP SIGNATURE-----

--ugsdrugixr4n33iu--
