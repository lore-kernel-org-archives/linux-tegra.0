Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A8A417A2F8
	for <linux-tegra@vger.kernel.org>; Wed, 26 Mar 2025 09:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742980146; cv=none; b=Ese/NqFwsbEIr97w39lGAyejjCgbeLV1d2hnP5vuVAKN575t43hnWrkRatTnApD8VVFfwCh+V8mFnK3szTaDhI67LYKfCrFcXm6St3IOST8ZhCmkeJpbY+DQULu8/2/2Iw+Ouklql1oTUQiNbngYBPTwaxDPO880FNR9W6gxwDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742980146; c=relaxed/simple;
	bh=iyXMi6oBTLDvy9aUdNS3eE+LZyuLKsMTqtaOeBV5QPs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=onyhfWOh+ATl9uJGge9CkkDEBD6hOlcgC7bbROe6cdsA1RjF3k0nZIfGaBFIsYCinVXGmGESjeBHrsfWA0vQLw3J8cmyYj0cuhcFz80hozfLC/70AILQ42DD4ctDyCzx6Ipj2K/FMrrz30O94/Cth3zGxOqPx2EsIvl1dQy+urE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=uhu/tHoo; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="uhu/tHoo"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-30c091b54aaso65556731fa.3
        for <linux-tegra@vger.kernel.org>; Wed, 26 Mar 2025 02:09:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1742980142; x=1743584942; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oUZngTTEzguKiucAB//HYWOGFVEX9dZzFTDX1IRyF68=;
        b=uhu/tHoo+JtNdeXk9CQ2Y99zjr9w8V2CFkvX4+nV+lywMVqwIU1mXmhSuzk5FfRq6q
         YlSqA4Dt0ydW8FTlR5/1AaWFBksjQ2dCpyPDpdnp5/RrhSLvc0mrttgHa9k2Rn+H7t0k
         Da7/r86AexyzXPji0P8eQPA25YyGzNpv3DPgEdE2RO/jGhnpoxkyGuoFNiVSsSJGsAgX
         EWhZSHiyTtlejU3/mzlmAHuNvjzntSJjxpexRh3L0lOqTT7vAPAC72OmXHOWCIcjbcTG
         DNK8G2tVtX5+BhzENikNSie/uGSRG0MGCQ+PcIEceWDWt9mi/D9R+NRpcEQTA1ZfhaiX
         IoWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742980142; x=1743584942;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oUZngTTEzguKiucAB//HYWOGFVEX9dZzFTDX1IRyF68=;
        b=A+KCoFztUFzjNrpk8iJXvGkDMgeSaQSpdjMwKYau49LuPSyXFHGDYATtlASiq3xl2V
         v2Qk/71UZIcjUisWI9RXWVcyIu8hLd+Ahd+8Jemn41ks3g3A0BMU4VSYtfn/7ea+Esey
         HiSo3JxsScKz2ryfq1yYdj7yejaHkqG1xuMoMxoCjKt8paijex9RYTDFr77DG6bDxRUB
         +Q8vehAWprtf4gzQFPDmsjyZHLnwHJKhPaRDbLrSyrF8hzrnNeefnLzCtFb2TLUYc8Qo
         vbVh6kYB8/3S55mqCR/36sfmUbvkBJlwOobWinX0mB2id0NQhfglr9dIwpZFpmaVyyv/
         4hfg==
X-Forwarded-Encrypted: i=1; AJvYcCXyrgVDKJAdl9jbuFy8Js9LtevBt8ka8l3KlYNG6njJCBVxfLYfCDLG0RMNQ01cLDnUt8zgizAUwbOyvw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0yD4V8DH8+stP4mSVplGv2AR/S584cIlPxu1Lu0qw4LkyUwfH
	XUnr0DFbYTdOo06G53cZu2naUBGU+Ean+lerhYLfh8DUjchHO1GvbxDRB6CtJpDK48FK2p+ij3L
	di5aqjXVZnFmvUaol8Fcp73WpjQt8Shzojw1qOw==
X-Gm-Gg: ASbGnctTrBxa8wqU6nzFb7TjlYKxfHtAKdF4GfgVCpRgLRc+HWBaeExSP+gETtsUjuB
	XnlBDAawloyWWm/Nr5zJrjrRIldmFiZb3T58cAJGZ0HBvS4zbuGaRHVT7wFMw0hc2lXY7Tqqa1R
	vl1v2AKwegR1+Rtk9faU/K+Elr2tOhdGB2nOGAEnhu7BsNV+RGlq4Y5yYk/g==
X-Google-Smtp-Source: AGHT+IEbF509AwwvF9uBzm/NQEb5CElWoFhmCLujCLM8AfO9baXd1EsZbD77B4ufLQManBlNueN8EKZ9MbxuVPXXcBg=
X-Received: by 2002:a05:6512:1149:b0:549:7c13:e895 with SMTP id
 2adb3069b0e04-54ad650075bmr6781599e87.47.1742980142162; Wed, 26 Mar 2025
 02:09:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250326063214.50577-1-kanie@linux.alibaba.com>
In-Reply-To: <20250326063214.50577-1-kanie@linux.alibaba.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 26 Mar 2025 10:08:50 +0100
X-Gm-Features: AQ5f1JoCNnYkGIC4tglRhBZLc89xzcfRbive5WlMNXNsvF3qnSYnwZ1en9jcvv0
Message-ID: <CAMRc=MfNhDLV4GSmA4gNZLv3Lu=Wjh_=J1L=DCo8FPUMDVz_JA@mail.gmail.com>
Subject: Re: [PATCH] gpio: tegra186: fix resource handling in ACPI probe path
To: Guixin Liu <kanie@linux.alibaba.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, linux-gpio@vger.kernel.org, 
	linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 26, 2025 at 7:32=E2=80=AFAM Guixin Liu <kanie@linux.alibaba.com=
> wrote:
>
> When the Tegra186 GPIO controller is probed through ACPI matching,
> the driver emits two error messages during probing:
>   "tegra186-gpio NVDA0508:00: invalid resource (null)"
>   "tegra186-gpio NVDA0508:00: invalid resource (null)"
>
> Fix this by getting resource first and then do the ioremap.
>
> Signed-off-by: Guixin Liu <kanie@linux.alibaba.com>
> ---

Please add Cc: stable and Fixes: tags.

Bart
