Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 867AB38756E
	for <linux-tegra@vger.kernel.org>; Mon,  2 Mar 2026 07:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772438238; cv=pass; b=LOxPaMjd0ZoSATGStGb4SIhp3F9J3EI78S9cfc+9sjHn4f68yZ23lrqE28Do34SNHn0BRxpi3dAy6rCiWWBy/a+U5fVtg/PKJ05EImDCdDmvK9iayWn5DO1qu03aZe2KsIbwaWdOGEmeIBlqH6niRs6BNyQqhUQ8fPMbJZbofbI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772438238; c=relaxed/simple;
	bh=6HVBtx/6SgfT5oylZJa5c7jc2ifQBtkSR9Ho9Q6kX48=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Azyqx/JkgkvGou2hlaGCiOr0gvWwMrhbyr6k0o2/S9r9UFrHd+A6OdBo5CEaF83vxWUA5To+zvAL1YEOyT3QvgBSVx/Fwq2qbGSfElHryoMD3U1Pon6az0Ept7oAdr7BeiQ9ywdOWHohZMu/J1xyNjrQ94fq4RntO2n0aEe3Pgo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nJ86MiDb; arc=pass smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nJ86MiDb"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4327790c4e9so2930139f8f.2
        for <linux-tegra@vger.kernel.org>; Sun, 01 Mar 2026 23:57:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772438235; cv=none;
        d=google.com; s=arc-20240605;
        b=keG1dKeR8/65FE41iJ8o9TrbCaiplv7cwD48cuITOWF2snqv6U0poOQ+7ZygzQCwHj
         ZmuK6DqGkhagdWOMv/e+mCfm184yRnT7GQfytXqVCE+05ON+6E+7k57Xwwv901ds+OXB
         BDirhSY+bP9S6+EXphaPpVyr8vzbp5fdIZX8Z5sGrMExuLh7vITtrDxmxXFDVIGriGvt
         qLDHr1f3yN2QNO7h0Pxz3g6xjfnxjowx0Pbc4BbNYAyZ6IcaayO2JquNx13y6lUfYVwV
         4VUVM5gEtT5IWCvdbnwArbbah8QZ5eIBs+m1eqRhTkrusxxqgHJi5CJYqj0wuRil4Gjb
         VGgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=it6CBEYGUxeKU7qPZhmd/t1y3gj2Uad+roI49skbLD4=;
        fh=hQvFhzYcIuUntiiWptZ3G5VrGeUo16P7opUJcIP8xeA=;
        b=iZglhtPoaWObE8RYUh48RNFFdigp5rXjmLGg+/FDXFK+0/waZVCjRavm4KQH5Y8Txi
         5yxPP9LCmzlUHfHR8HZxCTMPPT/gE47LyPGUlHqFBvGyZVc1/fZMvTijWeLO16zDdyjF
         GLCJwDRDMvt0s0dj19ZaxEPtKlqSbZfIhYQJ1glxAHlFZG3OyrbVZDMMoHjjZ1ekpU9y
         veXe0zzrhzxdld62r5SFyV2zfFsICJjGvZ9+ZRR/FRQLGu6s9NH8/SOLaL+K5xTAvfBL
         A4W+GnaE4mF+cEy61KB0WE7YVpw7D6jpmw4rg8w0U7TF+gG2GaliPPFzg4gOH/HaiJzB
         5Wyw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772438235; x=1773043035; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=it6CBEYGUxeKU7qPZhmd/t1y3gj2Uad+roI49skbLD4=;
        b=nJ86MiDbweEZS/+hUc8+Crcd1D7BbbSUYYYnV15qcL9RbBLwho/TwPxPyL3PvFkaQ+
         G+IJxgn6GnGgD8QdXZ1yUsLALJSJb3s7mczpiG7TJiBOA2icXr5Q1Vm/U/lTkLMNJIoc
         ZNgYHOYL2SA6r++GhQPG/5JGdodZn1U3wVcFoqp0Fm/ymwSz5AiPtyonlyIvwRRyFqgr
         eVEUM/PCXZfDZ9dgilbxC0BcUoDsb80wFkmxJK5l08Z+mPLLvw7GQwhhRLIAWulcZpcU
         zzQUgOK6OEJ43VR74DXQzZOiBESxHG38FEUGSv1Xpw/voAZurkgv6StxRFpB3XfpzE37
         SLig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772438235; x=1773043035;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=it6CBEYGUxeKU7qPZhmd/t1y3gj2Uad+roI49skbLD4=;
        b=sbAMhXPR2N2E7UD1Vwb/rCxurl7K6DHRazsBkExQPpoFD+Z7EMIn2Jn3VufM/6q8Gk
         ezF3U8WzRErjB2Q4EU8hiVIJzNC6HMasz3TRd+ufQEiRGzAf92FNx3TW44CbZRj9bkcp
         7ht0wFuVjEptU15rgOzCV5r7NrwxhVUi9U7O1BVzE3yfmpq7V5IJJIIqaisOamA8MuCB
         XccGSqqxJ3SzPHsK4TRTDQ7DkiGhULvLe+0PrhhxGRUQuu/NyCGeLZFbi6z613yTERBp
         qiIcwwliTekPGDn+5fQg0zc9fvD1O2DdIxSLRqpg/ZBN44wK/rtL4+mvTvdq0AhBfWzq
         KCLA==
X-Forwarded-Encrypted: i=1; AJvYcCW9WGM17e3+BimPz5MocHxy9I+xJavun8/aRame0qm1nmT9vkGFfJlEDNLs2U7gAm0aov0KR8Tmn27zLw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3fiXypJk/PGYN9jpLz0Pw2TVeuNCn5eM8DExhqQmWx0mejeB9
	zBxz/U6uo/xsguVNQ5RF0NQYKAcCaadKZu004AOW/jEdRMjX+AwaNnNt5P1FccqM9vFhvh7RfQO
	VOzPGPah4bpPbc7AmAol1hlv77CzYGyA=
X-Gm-Gg: ATEYQzzSTOBqqyaWglQsHDU6/SJCzeawsJtwaFhY4hrw2cxNZxH0Pup8sxYAM6qqIkb
	BdqDk04kTh+ea/wVysl8a8uiJHr3EWo4l6kLAEMk6uO42Tx5AZ6NypHwmMnLHyxwAUdlcA0NHjR
	mk9E8GwyR7Madw9i9a/j+BbiEJCXiLpdKOQxxCxaPQVzEpXelXUvbag7qDufG4CZHhEiQds4uH4
	Jc7sjcd7iXiEq5Ypx3vJhWqugPbbhO18hPwRkbwxpzdD8y3ggj5Rgp6fxAEfhjxtObPJLNAv812
	ZdmPSZLy
X-Received: by 2002:a05:6000:290b:b0:439:8f32:8668 with SMTP id
 ffacd0b85a97d-4399de3a727mr20452034f8f.58.1772438234867; Sun, 01 Mar 2026
 23:57:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260125131323.45108-1-clamor95@gmail.com>
In-Reply-To: <20260125131323.45108-1-clamor95@gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 2 Mar 2026 09:57:03 +0200
X-Gm-Features: AaiRm52QXrS_uNzAE53fZY3HX0KwqHOMM5gpUzyqiFLf5Zuznuez0suGHr74yCs
Message-ID: <CAPVz0n0k2v_4pQ-hFhah8i_0Ne6GeggLcDk7=agVyg7Wvp=cBg@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] gpu/drm: tegra: add DSI support for Tegra20/Tegra30
To: Thierry Reding <thierry.reding@gmail.com>, Mikko Perttunen <mperttunen@nvidia.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>, 
	Svyatoslav Ryhel <clamor95@gmail.com>, Thierry Reding <treding@nvidia.com>
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BD=D0=B4, 25 =D1=81=D1=96=D1=87. 2026=E2=80=AF=D1=80. =D0=BE 15:13 Svya=
toslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Tegra20/Tegra30 DSI is quite similar to Tegra114+ apart MIPI calibration
> logic and clocks. With a few minor tweaks, existing tegra DSI driver
> should work on Tegra20/Tegra30 devices just fine. Tested on
> Motorola Atrix 4G (T20) and ASUS VivoTab RT TF600T (T30).
>
> This patchset depends on Tegra20/Tegra30 CSI bringup since both share
> MIPI calibration logic. Ideally these patches should be picked after
> CSI bringup but they will not break anything even if picked before
> CSI patches.
>
> ---
> Changes in v2:
> - removed all MIPI calibration, it is handled within CSI bringup
> - added per-soc structures into of_match
> - added fix for hang caused by register access with uninited hw
>
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
> ---
>
> Svyatoslav Ryhel (2):
>   gpu/drm: tegra: dsi: add support for Tegra20/Tegra30
>   gpu/drm: tegra: dsi: re-add clear enable register if DSI was powered
>     by bootloader
>
>  drivers/gpu/drm/tegra/drm.c |   2 +
>  drivers/gpu/drm/tegra/dsi.c | 116 ++++++++++++++++++++++++++----------
>  drivers/gpu/drm/tegra/dsi.h |  10 ++++
>  3 files changed, 97 insertions(+), 31 deletions(-)
>

Hello Thierry!

May these patches be picked if everyone is fine with them? If you like
I can amend and resend them with Mikko's suggestions applied.

Best regards,
Svyatoslav R.

> --
> 2.51.0
>
