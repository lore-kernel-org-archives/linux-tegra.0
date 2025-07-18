Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87004298CD7;
	Fri, 18 Jul 2025 09:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752830379; cv=none; b=S6sk5LquW9XF5B/iU7FHxyoLCKIWMfgK2iBu3L2a1bPwgWShVYJs+4dJeTPiT4jfTVZF3ztMapuOVeyZhkwzVcMFwldsru3KBov5h8RyGknqdvewhwL2wx+lAMgaVXiAtzNxQwNJ8mEb6EuH0KHx6f5KKCj7jko48kSPjZyMwoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752830379; c=relaxed/simple;
	bh=1vtCOtG0pwhTlbRz3AbiPSzpt2yIpDsGDLLhuXGZXvw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HfqdFCwMoNdbdgBfCxwUekZLmwFhN0I35j/9B1iHnT7N68D0xilIlMxgdqrMVZDx7+3X6u7hFbgoqhhVSP+JQgVAFW7RUc99NBkov+B5cI2Z/Q0JpsYqdWQdo2ySVkdko1E5GpknjTvF/7cqmlXzXl2ofXCy2jxe15Si6WkiYhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jL84nbZd; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jL84nbZd"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4561ca74829so21165495e9.0;
        Fri, 18 Jul 2025 02:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752830376; x=1753435176; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F9624kxdlf6YfwvmNaKwA8YxPHmSVKpCcbiEww8Vk3E=;
        b=jL84nbZdojr8Db/iSYxDQ0ZSfXUO8pzPbQp3cWPmTYyNUZl24pXLWOtKWx2ai+/1cr
         6i1MUnhxQUNxR9/gOGjj297cP9Uw82Yxr51dFOvSAdS//5TK7J4+BZSiCesn2vnE0X01
         1eI43AuMopRFNElLiOPw6WA1TS1b7Tan1M3geyAl7eoDNeS34VcBZr++Oa/AycaQGo8m
         MJ1qVjzgUyc4Mz2sSiVutAueE8ifcDRmeyfl5W5EFAhOtw/XddPZ5gUzGB8kkg8PFNtY
         +QA0D2Q7GffgyvVSGNf3kGbyzZGUmADLEd3/JRRWRMf9thjh693CK83gEZ/9B/elExxg
         G3rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752830376; x=1753435176;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F9624kxdlf6YfwvmNaKwA8YxPHmSVKpCcbiEww8Vk3E=;
        b=FhHtUdi3jiYd04E1o3pTV7mwjzXCUoiMSF9jBB5wy0H2FNhKZWz5IZF90UO1qupEMh
         ves65BVjk00s7vhFOI1yb0m8DG/msr1/4Y31zSnQfR+uPAdauBhkwhhIaOuIPIZgbqGP
         6bDX1R2fbjUEoTV3uNP4C65Wr0Yxnupjz795hVz5pozt34DNRnOE5oponv42qJL2yvug
         8sylyCjcQvBbb+73a1b2ntgEN6eb+JLsTHHZVjo/468m7rsHRkJzAQ+F/fBEBFExKJbZ
         uP3g4ztmJB7c1GxOt2+osp1+dMEPe9O/huGL4MolKUJRZl//YbDKWSczoG1ryVExQtbx
         0Twg==
X-Forwarded-Encrypted: i=1; AJvYcCUa3Voeyi1bPHjzqtuP4Y8Rx/ftSqI5mykMMh2QmDvv4srVEl3Ps5fFlUXafezNXZolsIqTd4DRt8ePqzj7@vger.kernel.org, AJvYcCV4Hky2wdmzAYgB9wkw258UIEtDERtXz2xYVeBL46AGG0HQUWbQYyhQRr1l59SzkFUPqzoR+7BG9BMb@vger.kernel.org, AJvYcCVI1h3Ny9bPWubIx1a+mzwasGQ83Am535DwxzUQuBxunJm6zvIsDUOjNRZo2n7oTgZ3xUyFv5AXrO4R@vger.kernel.org, AJvYcCW1Rma3SR96D3rJ0XypBWCu+EnM6D+MVgG51G0H0JKLDweWcmc0B0fJkvfzJbUCEhh3ErnfqrmEY/q3arE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyW+a2cXA3v3lHURwBJH+dEpz46t9pxI8G9NGyr7jkafYzIE63j
	kWTxDq7JroXLS9URiBvauWR3TSe/hu/Iu+zISfmaMxe7IFMjAQoeNlQ1uKONJ7sgb2GRy5P5xW6
	Hsg7mAirNzATqsLOgeFFBPw03X/BB66o=
X-Gm-Gg: ASbGncusnelbDMdQUH+n8yDlaMICtEpwOGf3rxog7i93zCQXtocTqhlYNTYzEHcbvqT
	cQJyRP/SeojRGKHdnQWhA1gpXFkNkdQgVsCqL2zicYlsYGovOzxyiFcZaImRsS3sCLdLrvA1w3E
	GoW5v2vjWxynK6DrrK4al9CmOszuV7IJHfrKKNPqtRuV5NhyrI9TO32t27vmJSn8BdElfa4k0ia
	nBe4BgS
X-Google-Smtp-Source: AGHT+IFXFUxkSHC0x5yD9GpDrGnP0Vkk/6Hcqaopw6DVq8kJphRsVttXTBgES6eJ3vh7JXBvsfZ8EFDzCZr6pelsBmI=
X-Received: by 2002:a05:600c:4f4f:b0:456:2cd9:fc41 with SMTP id
 5b1f17b1804b1-4562e3b9937mr83880645e9.20.1752830375388; Fri, 18 Jul 2025
 02:19:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250717142139.57621-1-clamor95@gmail.com> <20250717142139.57621-5-clamor95@gmail.com>
 <10778402.NyiUUSuA9g@senjougahara>
In-Reply-To: <10778402.NyiUUSuA9g@senjougahara>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Fri, 18 Jul 2025 12:19:24 +0300
X-Gm-Features: Ac12FXzJO2FaPvG3kozLgWWtNWGcHAVWJUosR9Xg-jWP9kyKhG0okiB-C1KmNR4
Message-ID: <CAPVz0n1u3=UcYvbZEfC59kMLD647pJKKiOQ308oQ9qde4vQcyQ@mail.gmail.com>
Subject: Re: [PATCH v1 4/5] gpu/drm: tegra: dsi: add support for Tegra20/Tegra30
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Thierry Reding <treding@nvidia.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, 
	Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Dmitry Osipenko <digetx@gmail.com>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D1=82, 18 =D0=BB=D0=B8=D0=BF. 2025=E2=80=AF=D1=80. =D0=BE 12:15 Mikk=
o Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Thursday, July 17, 2025 11:21=E2=80=AFPM Svyatoslav Ryhel wrote:
> > Tegra20/Tegra30 are fully compatible with existing tegra DSI driver apa=
rt
>
> 'apart from'
>
> > clock configuration and MIPI calibration which are addressed by this pa=
tch.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  drivers/gpu/drm/tegra/drm.c |  2 ++
> >  drivers/gpu/drm/tegra/dsi.c | 69 ++++++++++++++++++++++---------------
> >  drivers/gpu/drm/tegra/dsi.h | 10 ++++++
> >  3 files changed, 54 insertions(+), 27 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
> > index 4596073fe28f..5d64cd57e764 100644
> > --- a/drivers/gpu/drm/tegra/drm.c
> > +++ b/drivers/gpu/drm/tegra/drm.c
> > @@ -1359,10 +1359,12 @@ static SIMPLE_DEV_PM_OPS(host1x_drm_pm_ops,
> > host1x_drm_suspend,
> >
> >  static const struct of_device_id host1x_drm_subdevs[] =3D {
> >       { .compatible =3D "nvidia,tegra20-dc", },
> > +     { .compatible =3D "nvidia,tegra20-dsi", },
> >       { .compatible =3D "nvidia,tegra20-hdmi", },
> >       { .compatible =3D "nvidia,tegra20-gr2d", },
> >       { .compatible =3D "nvidia,tegra20-gr3d", },
> >       { .compatible =3D "nvidia,tegra30-dc", },
> > +     { .compatible =3D "nvidia,tegra30-dsi", },
> >       { .compatible =3D "nvidia,tegra30-hdmi", },
> >       { .compatible =3D "nvidia,tegra30-gr2d", },
> >       { .compatible =3D "nvidia,tegra30-gr3d", },
> > diff --git a/drivers/gpu/drm/tegra/dsi.c b/drivers/gpu/drm/tegra/dsi.c
> > index 3f91a24ebef2..85bcb8bee1ae 100644
> > --- a/drivers/gpu/drm/tegra/dsi.c
> > +++ b/drivers/gpu/drm/tegra/dsi.c
> > @@ -662,39 +662,48 @@ static int tegra_dsi_pad_enable(struct tegra_dsi =
*dsi)
> > {
> >       u32 value;
> >
> > -     value =3D DSI_PAD_CONTROL_VS1_PULLDN(0) | DSI_PAD_CONTROL_VS1_PDI=
O(0);
> > -     tegra_dsi_writel(dsi, value, DSI_PAD_CONTROL_0);
> > +     /* Tegra20/30 uses DSIv0 while Tegra114+ uses DSIv1 */
> > +     if (of_device_is_compatible(dsi->dev->of_node, "nvidia,tegra20-ds=
i")
> ||
> > +         of_device_is_compatible(dsi->dev->of_node, "nvidia,tegra30-ds=
i"))
>
> You need to add "soc data" structures to the of_match table instead of
> checking for compatible string in the code itself.
>

I assumed that introducing "soc data" for 2 occurrences would be excessive.

> Thanks,
> Mikko
>
>
>
>
