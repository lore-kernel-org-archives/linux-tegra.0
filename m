Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0FDC3630A4
	for <linux-tegra@vger.kernel.org>; Tue, 24 Mar 2026 11:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774351950; cv=pass; b=G+JkTODAVf14OZP7IHc36j2hc2hsTevfBT6nsDt8ifqwQ8JnMj88YV4Pvy2PzkImsJStiKk7jqBvkgo9A3dQ4rH5o5IKOwGmNCNZIzZckJkwaWTZsQ0+4YSd0sUtWy8uUH55HcL3lQXeYTcyaVf9o4fhME8CIouErdZQ4iF7eqI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774351950; c=relaxed/simple;
	bh=qLShsNI6mVqRpZTuxMK+g+KwL5k+5Z6GCAiInlXnQpc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UMcOpurKYoD+Qgo3XUrKNAcl5T3Z5t/H+a/yo+KxxxnuuyG45T5kklFwxte9pyJNrrOvAZK5n66cCPGlO7IrYDH4mSTBreX3Y0F/22bf5ZeP7APmQiXnl/+khgQigHgDaTYogLvKauOweX6+gg9mLwqcWWUQMC2l05rJG5b3E1U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pFxnl7Ph; arc=pass smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pFxnl7Ph"
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-7d8b2703f37so982896a34.1
        for <linux-tegra@vger.kernel.org>; Tue, 24 Mar 2026 04:32:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774351947; cv=none;
        d=google.com; s=arc-20240605;
        b=YWwunmfFjagYpPZglcjgaICsScRVwbA9F2TCbqP4tFdFct6a5RgJd3CCi7gvoApFNz
         VgcZlVVoqO+CkEYcSBoz0jOjrG2YdtooZo5lagzCCV42yqkyWHBQTUn99YbyDdPhzsX0
         hXSQyXsK37c0qa/An5YTh3RDnPt3wsQgsNcz/fK3lA3OpNI+hNjXPeoUry+3paxQImxf
         NFl2vTrOZRN8VHXyv9horeAYY+FrqiylbwVKRhBo4KAu29Ae99/EJli14++DVxFAIcEM
         Qad8AJkBuJempAwsW8laSEgF0vbqpIsYVCbW/hOO+zTZh6lPUijjFPDDjoPUyxZuYkqk
         K3RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yVSnLOLPNgWCO/SPhHrJ/D7uJiT7UP/EKi5q6a/l/GE=;
        fh=w17Kc6Ey3BpvYBZwTFJQo5UwgQpNfqMaUQYFocX6LzQ=;
        b=FbzrPanSVO6H+zMUVenHTV6OvSJPwDwuWOIaLZ/RnCIuOF4MAEt1NmCezp27x3ET3W
         jv9rUhvlcgXBDGpWUWUe/SQXR4x+WBPfkIh/4RHKBCLtxRR/RpoO5L151zHeA+hYW/yQ
         wDT1aHlpkQa0t/9MGGLMpUEiDO7czzHV7yw4cJNiQWVH4vegBJNHP0ltC8DqyDT1/uYc
         bKvMLW/Kq6VvUET306JWIYVnLi68fzoun8rsvpaKeXyxhqjtBJ0u3u/CxZjpe63CmDEV
         kk6UmooBWAssipkmhzRNkh5zTr371g5oeaE1U1gX3yfPmIzHFxudJYHkKFlRmjUH/v4F
         TRng==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774351947; x=1774956747; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yVSnLOLPNgWCO/SPhHrJ/D7uJiT7UP/EKi5q6a/l/GE=;
        b=pFxnl7PhBTHYKA/hoH6BaoJgb9/4JdQMCHVaEPixMm2EbhGliCfkxTTU/f84J8jihl
         /GpKQvWpEQmdsLX2cQeHVeB/VgYaOE0waI2KfKe6nn6pxbYF/7ecMCmPhswoLKjY/FW6
         paN1LS4r3r5laXfnpErQztUpUClyW2o59C9hFZNIEPAT6fhSrhYddHxeoBKfg/RadlaA
         yoc6C3tPtM/7g7gmPHgXbhKf00STA3ZlzsQWuPQgBJBsrXT2/kUb1o3cHa/L9Kkqw/Sh
         cF+4sT16H6ZhkQBl/3QRwec3B1HPnKv7VsFcJrEuvQI/5pbh/nup7IclJYzeN1qrZj92
         BCRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774351947; x=1774956747;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yVSnLOLPNgWCO/SPhHrJ/D7uJiT7UP/EKi5q6a/l/GE=;
        b=PVC85cd3e4UVDFReLFXd8UI9RX6iiDZOqbVe764wygg3rnR1wFIY3JQrbGEr/zNxgR
         97ufgMw3o2tfB8IUpkKWVDFzAQpoLYT4OIPwKuhymGwb5XlqHa7gmssDFPkFDRv4RZa7
         7Mea14YdcNpur3OIBPqDxPvSluKoj4+6rhFTW1UAYkQVryN/o7dQHFh0Iiy0CD6rNxde
         iyv6IyXFlm3bUMJvz0p0x4nZq7phOxXqK/XgXt43Jac4kBnUXepNea1gb+ET9CspPtyw
         Bdka4uJQbwI4cTNkoIJTWUPjG5OrL7qPUWcdMSR35db80086/YYpxTK35NpfzlgxFq3N
         ofTw==
X-Forwarded-Encrypted: i=1; AJvYcCWwrffRQFhmuv/Kc18OeREqmR+CLtUaxvAwbpMe2nzEpvZ/ubgK/ben1ku5bDNCuYMM4DaEv/P2AjlhFQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy92iQvcs3tdvHyBS6ALyXLo0bgxBWvnYpdbEBSXkzHM7cQDN1a
	hZKgJ+d4rt6GS0oqOCexm1QD8Hhi3hPnxztrmnOliUtoXvp37dP1cU1OcY2vc6ydI7LTOhySA8J
	lXtQC4xfT7dK2SVS0W3j2lOtRJWw9cD4=
X-Gm-Gg: ATEYQzwFbHM29LomfpnLXGdLcoVVl+xM/htyV/s8J9Ih60z0196te6lBKyS8VjFWgZJ
	vSx+j6nfDQ5ZgqwafNeGY/9hxZz3y/TfDIQ8q8jZKoSOm42WUM5Ig7mCRfsGLEVok//5OjQIOKT
	9C6hgntdM1AiThV2wlRL+9HndT+Ai0c2EglWli0mdx1bIck53QjPpf+DvrzzaqseylYNWb88V4O
	nVC9KHux9jfCU1hBN51/KAZ5Y5XstsWYShHIsod/uQDK+kxGwaXb4tfWo776uOS4LjUmJ2AnCVh
	Yu2m
X-Received: by 2002:a05:6820:200a:b0:67d:f874:1866 with SMTP id
 006d021491bc7-67df87419bamr1274829eaf.16.1774351947517; Tue, 24 Mar 2026
 04:32:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260323130804.67936-1-kwizart@gmail.com> <10027014.CDJkKcVGEf@senjougahara>
In-Reply-To: <10027014.CDJkKcVGEf@senjougahara>
From: Nicolas Chauvet <kwizart@gmail.com>
Date: Tue, 24 Mar 2026 12:32:15 +0100
X-Gm-Features: AaiRm536vyfxom9LC2ri2lsSZY9KW1BiWjGrDGG21AHchK0UaVn06qPjQktVZG8
Message-ID: <CABr+WT=2diQid2T+xAscJoxjycHBEg_zxy5Ye12rdxBV7C0z=g@mail.gmail.com>
Subject: Re: [PATCH] [RFC] drm/tegra: fixup primary/overlay format for tegra210
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mar. 24 mars 2026 =C3=A0 08:05, Mikko Perttunen <mperttunen@nvidia.com> =
a =C3=A9crit :
>
> On Monday, March 23, 2026 10:07=E2=80=AFPM Nicolas Chauvet wrote:
> > The primary_format and overlay_format were picked from earlier tegra114
> > generation instead of using the previous tegra124 format leading to
> > missing format.
> >
> > This patch is RFC because while it's unlikely that format availability
> > have skipped to earlier tegra210 soc generation I haven't confirmed
> > any runtime error nor experienced any regression by the lack of
> > availability of theses format.
> >
> > Signed-off-by: Nicolas Chauvet <kwizart@gmail.com>
> > ---
> >  drivers/gpu/drm/tegra/dc.c | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
> > index 06370b7e0e56..d5896f12f25f 100644
> > --- a/drivers/gpu/drm/tegra/dc.c
> > +++ b/drivers/gpu/drm/tegra/dc.c
> > @@ -2942,10 +2942,10 @@ static const struct tegra_dc_soc_info
> > tegra210_dc_soc_info =3D { .has_powergate =3D true,
> >       .coupled_pm =3D false,
> >       .has_nvdisplay =3D false,
> > -     .num_primary_formats =3D ARRAY_SIZE(tegra114_primary_formats),
> > -     .primary_formats =3D tegra114_primary_formats,
> > -     .num_overlay_formats =3D ARRAY_SIZE(tegra114_overlay_formats),
> > -     .overlay_formats =3D tegra114_overlay_formats,
> > +     .num_primary_formats =3D ARRAY_SIZE(tegra124_primary_formats),
> > +     .primary_formats =3D tegra124_primary_formats,
> > +     .num_overlay_formats =3D ARRAY_SIZE(tegra124_overlay_formats),
> > +     .overlay_formats =3D tegra124_overlay_formats,
> >       .modifiers =3D tegra124_modifiers,
> >       .has_win_a_without_filters =3D false,
> >       .has_win_b_vfilter_mem_client =3D false,
> > --
> > 2.53.0
>
> Looking at the TRMs, I think indeed Tegra210 also supports the
> DRM_FORMAT_RGBX8888/DRM_FORMAT_BGRX8888 formats, so this patch should be
> correct. Functionality-wise, the formats aren't handled currently in plan=
e.c,
> so I don't think there's any change in functionality.
>
> These formats require enabling byteswap -- so do RGBA8888/BGRA8888, but
> plane.c doesn't currently do that, so I wonder if these formats are just =
not
> working right now.

Thanks for the review,

For info, I've spotted this when trying to understand a graphic
regression in mesa starting with mesa-25.2
https://gitlab.freedesktop.org/mesa/mesa/-/issues/14640

That was initially an issue with mutter been way less efficient than
weston for some reason (with earlier mesa-25.1)
https://gitlab.gnome.org/GNOME/mutter/-/issues/4501

I expect something related to how some formats are selected/advertised...
