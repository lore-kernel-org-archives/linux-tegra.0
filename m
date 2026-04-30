Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFFD21E1DE5
	for <linux-tegra@vger.kernel.org>; Thu, 30 Apr 2026 08:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777536289; cv=pass; b=LkD3sN9sVJGG54VeLoEX2e9fuBT4WUO/Jr6p8C7xxl8Udxn2TVl2IxpCMiyWKxcXyL/14ehKyhgfiNfSE4B8+5oiaSM3nh88K4VQzvmuhNpkw4DgXeKx9qWo3MZ0lLX4aR7jY0+/9GjIMIDyeR0R/YJi2J5O9fns0fdq+jcMHUQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777536289; c=relaxed/simple;
	bh=INJcuWEXGOjWHDT+RH1pIaFwUniIVXtLPsYxOQAyTWw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tSsIffKHzNcTzrN4w2Xb1nASQG3xh9tlCaWeoRz7fwXLpGJ0MRfTnK9jbWNeERI6D5bjaDUygRtZ7gGnmXBXkksj+jmJFaImma70okJdAh8WHYI+Y2vdwhVjmsQGavRlwiUic4bGt+xcT1Qd2urWwnj8qH0Z6W9v6zfdguzG7hA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gSHZwcPT; arc=pass smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gSHZwcPT"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4891e5b9c1fso5562325e9.2
        for <linux-tegra@vger.kernel.org>; Thu, 30 Apr 2026 01:04:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777536286; cv=none;
        d=google.com; s=arc-20240605;
        b=ZYD1xTDPKceeC7mW2iPYNzbTngOlkjwSvZmc1bxWLulYFzXcivBZvf796YOCFCNM5s
         CMEKUz6iTCW+Sc5PGgcuds5CAy0Z+CklAn/3nhSoQN8DvsCMFLyPyLE+DPTmecPSI6SC
         MO8o28pPX/NRFSO7P3jVsVMz1G55usExVUccE/IZflmYEAjulk0qHWrhXQ0tT2WiDjnb
         PBudZ+QVFZHuLnilwrAlu7XtDb8t5fxbvnwn8/oJMcivQqCQnx+2xEwUBWlqwrleAsXr
         mmgAQ9wFbqneLVuJ4DudPj2tO1AngeVRjh4JX+GkQr6fGxsZOxiTNj5t8Sa58qIQO8Zb
         WFEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aZrGBqXYPdLgNn5aQC9hh+9jzHstDAbAkt2IwwGF1kY=;
        fh=cAloTEfeMUQgg4JAtruTrqBM8HQcKQXuzprS/3xdRMk=;
        b=elsyUALEjkoAbT0QVo0aaWD46MYeVXlia3RKZEEvGVLXfhkPHZdC8oPIC+fjVYleaL
         7dVfM7MGEIqS8rmFOZlLaksKPIDjes9Ryju3jH+kas4seveONN+ypV7qCEDtCjeoRhMp
         XNY2jnTL8tTroiUfto+G9gHfdmf68SvKQIfyEUZeSZgo9De4VQShmeF+x4mt6go8tk93
         eM0qgFekEXFq6tEJf7sOoExC2m9jhOs2AG1VlpEMAflYH0HIZPmLHZbt9x8GIN0UyeHa
         GHL5XcWZecw4FYfm4ufC52Zh09YIpVhflECqJi8UEWqiPeErAcdJdDfVtPckOUmWovnY
         ZUwQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777536286; x=1778141086; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aZrGBqXYPdLgNn5aQC9hh+9jzHstDAbAkt2IwwGF1kY=;
        b=gSHZwcPTu3WGNmWP1hGARLxzEtIUL0qlKCg6t2DvCa5oajoLKzMZuehT8AxnCUEjDX
         Zab1NjGCFpoP6Oeht6AfBK0QVW0wY7C2fAuOosgSpYgX2UZ7OoLmuE+j2iRI6Fq+Ztye
         bnwLGAx/rtcfBLY928/la4+ZQJDX6jnmt4NFmWpL8qeMCMmU1OSJ/uhHDcqXxxCuqO5A
         jKKXfxerPIU0LyuP2D2jj2mSH7HCMh5ENsPYOQDVYWEMI4zd8zh5oP3mnpTTvuLAWjFq
         8EaZvtXw6es58+5b0V1D8ltinedaYf9sdW+eYjmU5v+hk/krw/gIW1FOA53Uqg8MZtoA
         rVJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777536286; x=1778141086;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aZrGBqXYPdLgNn5aQC9hh+9jzHstDAbAkt2IwwGF1kY=;
        b=GpkXtHefBk+oxP96c7CHSheoDzw8LP4XJ3ETSq9pr8gX+dpYGvJuQnN3v7sitBcR6E
         p66j8vV+iq09eW8OoY5R+B9iNgxGaq1FgOgnS1RKflsIy6+Xqraov9lwOkd4nx37ZOmA
         mw+/zJbZRMlinaJ+fIbB9LY0oIixgCzzm/VhRWwScVOsGbAbJtXTnozfm+JXurqIejvu
         q+ZFF8AERGXbjBmV209z0X4/BKJhiOdyZXd7bs+ow7ltIrfSP+/IiaR57OXrUwCUdIL7
         Dan2PYFw7DqDluZB7NF0yJzWpCR0X7eLmkXI7B0tK9xVjyMnIYNL4XkcVMPj5iKkRRjD
         KFqg==
X-Forwarded-Encrypted: i=1; AFNElJ/RXEBgdaeLBop+Kv8EA8Yce63lAw+Nh3lg54jI2uEaKY9MejeD7ZAb/lb92zyC3DHTWsXiFio2lWrwvQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzVQUFvsA3G4lYz5zc19wTuHa2ycRePjZotxjHqVs3rtpnZaVDC
	0OYiymjqUFVe6ZC6fZMAfa5wiKnku7wv5ozUnZgqPSCjKYT5gpfbgAI6RvDA2j18rfUhh12cF/R
	I2Lm8ytATv7HIiLGB9QtXZCUztzLE7uoLGIEFyK0=
X-Gm-Gg: AeBDieur14LXX3P5Gue4NTqIxxqe0F93+yLjb3bHqmLj0VAD8gNonJSuza3BCOu5ZKr
	DUKHje1FxN1EpAkRh0IXNTfQHfEREzNwm5Eb2kARRGvLZoqeI5l/SU/1quI0F3kHXWLDiisE5pC
	Ogb2+ma7IXsRELHKa2pyaTnebVAyQ4mGuR8r0WJuF3wQwEnd1AHBRE4D0RJ61ABlzSVfwkg2V6H
	KF3yDvch3zts2gBpFsPu/61O6t0rXmfxXO1oO2EAx/4Szp6ZH0LhhFsp/ooDV8d5Oqurs8+xVdE
	bFWh24e4OgBNWUu187Q=
X-Received: by 2002:a05:600c:6285:b0:488:a797:f0ac with SMTP id
 5b1f17b1804b1-48a84485623mr32551075e9.28.1777536286057; Thu, 30 Apr 2026
 01:04:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260427075856.85208-1-clamor95@gmail.com> <gUUml1BmSZiZjQ7gY5A_cg@nvidia.com>
 <CAPVz0n0q77SVN7=47fEQR9ASQUnLoEgaGh3tJihxLSe9UhrPaw@mail.gmail.com> <SGKRjIZyS4mU2gPAiUbKJg@nvidia.com>
In-Reply-To: <SGKRjIZyS4mU2gPAiUbKJg@nvidia.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Thu, 30 Apr 2026 11:04:32 +0300
X-Gm-Features: AVHnY4J3f47Ssn3vff5AA01Azy11Bi0ZSOBuJyaaCs1Zt8ajGgiFrXmKZX1YrmQ
Message-ID: <CAPVz0n16zCgCZwPXWMPg=KiYLwc3beBzVqYVB96in7zn0Wkxqw@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] drm/tegra: gr2d/gr3d: Move pm_runtime_enable to gr*d_probe
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: Thierry Reding <thierry.reding@kernel.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Jonathan Hunter <jonathanh@nvidia.com>, Ion Agorria <ion@agorria.com>, 
	dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=87=D1=82, 30 =D0=BA=D0=B2=D1=96=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 09:2=
3 Mikko Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Tuesday, April 28, 2026 1:57=E2=80=AFPM Svyatoslav Ryhel wrote:
> > =D0=B2=D1=82, 28 =D0=BA=D0=B2=D1=96=D1=82. 2026=E2=80=AF=D1=80. =D0=BE =
04:53 Mikko Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
> > >
> > > On Monday, April 27, 2026 4:58=E2=80=AFPM Svyatoslav Ryhel wrote:
> > > > From: Ion Agorria <ion@agorria.com>
> > > >
> > > > The gr*d_remove() has pm_runtime_disable, this indicates it should =
be
> > > > paired with pm_runtime_enable in the probe instead of being inside
> > > > gr*d_runtime_resume().
> > > >
> > > > Signed-off-by: Ion Agorria <ion@agorria.com>
> > > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > > ---
> > > >  drivers/gpu/drm/tegra/gr2d.c | 8 ++++----
> > > >  drivers/gpu/drm/tegra/gr3d.c | 8 ++++----
> > > >  2 files changed, 8 insertions(+), 8 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/tegra/gr2d.c b/drivers/gpu/drm/tegra/g=
r2d.c
> > > > index 21f4dd0fa6af..71f092d59d65 100644
> > > > --- a/drivers/gpu/drm/tegra/gr2d.c
> > > > +++ b/drivers/gpu/drm/tegra/gr2d.c
> > > > @@ -286,6 +286,10 @@ static int gr2d_probe(struct platform_device *=
pdev)
> > > >       for (i =3D 0; i < ARRAY_SIZE(gr2d_addr_regs); i++)
> > > >               set_bit(gr2d_addr_regs[i], gr2d->addr_regs);
> > > >
> > > > +     pm_runtime_enable(dev);
> > > > +     pm_runtime_use_autosuspend(dev);
> > > > +     pm_runtime_set_autosuspend_delay(dev, 500);
> > > > +
> > > >       return 0;
> > > >  }
> > > >
> > > > @@ -367,10 +371,6 @@ static int __maybe_unused gr2d_runtime_resume(=
struct device *dev)
> > > >               goto disable_clk;
> > > >       }
> > > >
> > > > -     pm_runtime_enable(dev);
> > > > -     pm_runtime_use_autosuspend(dev);
> > > > -     pm_runtime_set_autosuspend_delay(dev, 500);
> > > > -
> > > >       return 0;
> > > >
> > > >  disable_clk:
> > > > diff --git a/drivers/gpu/drm/tegra/gr3d.c b/drivers/gpu/drm/tegra/g=
r3d.c
> > > > index 42e9656ab80c..33e88ca4d4c5 100644
> > > > --- a/drivers/gpu/drm/tegra/gr3d.c
> > > > +++ b/drivers/gpu/drm/tegra/gr3d.c
> > > > @@ -517,6 +517,10 @@ static int gr3d_probe(struct platform_device *=
pdev)
> > > >       for (i =3D 0; i < ARRAY_SIZE(gr3d_addr_regs); i++)
> > > >               set_bit(gr3d_addr_regs[i], gr3d->addr_regs);
> > > >
> > > > +     pm_runtime_enable(&pdev->dev);
> > > > +     pm_runtime_use_autosuspend(&pdev->dev);
> > > > +     pm_runtime_set_autosuspend_delay(&pdev->dev, 500);
> > > > +
> > > >       return 0;
> > > >  }
> > > >
> > > > @@ -578,10 +582,6 @@ static int __maybe_unused gr3d_runtime_resume(=
struct device *dev)
> > > >               goto disable_clk;
> > > >       }
> > > >
> > > > -     pm_runtime_enable(dev);
> > > > -     pm_runtime_use_autosuspend(dev);
> > > > -     pm_runtime_set_autosuspend_delay(dev, 500);
> > > > -
> > > >       return 0;
> > > >
> > > >  disable_clk:
> > > > --
> > > > 2.51.0
> > > >
> > > >
> > >
> > > Oof, looks like I had managed to really bungle this with my earlier
> > > patch. Thanks for fixing it!
> > >
> >
> > Hello Mikko!
> >
> > Thank you for taking time and looking into this patch. Don't be so
> > harsh to yourself, PM is easy to mess and hard to set properly. This
> > patch does fix gr*d access but it does not resolve the issue itself.
> > PM should be set in the init/exit rather then probe/remove. I have v2
> > which fixes this and one more minor issue and I will send them later
> > on.
>
> Thanks! Why do you think it's necessary to enable runtime PM in init?
> If you look at the commit I referenced below (in 'Fixes'), we've had
> some issues in the past with doing pm_runtime_enable outside of probe,
> where the engine's power domain would be left enabled even when it is
> idle.
>
> gr2d/gr3d I suppose wouldn't be in practice affected by that issue
> though given they aren't in their own power domains.

WDYM, gr2d and gr3d have their own power domains.

If the master device is unbound and rebound, gr2d_init() will run again, bu=
t
pm configuration is only located in this probe function which will not
run again, while pm disable are both in exit and remove. This results
in pm issue we are observing.

Solution would be either do everyting in probe/remove, or init/exit.
Probe/remove will lead to domain being turned on even if engines are
idle. Init/exit seems to me more suitable and we have tasted this
configuration for a quite while in the grate DRM version.

Best regards,
Svyatoslav R.

>
> Cheers
> Mikko
>
> >
> > So for now this patch should not be picked.
> >
> > Best regards,
> > Svyatoslav R.
> >
> > > FWIW, I've been working on adding some nightly testing for Host1x/
> > > TegraDRM, so hopefully we'll be able to catch such things easier
> > > in the future.
> > >
> > > Fixes: 62fa0a985e2c ("drm/tegra: Enable runtime PM during probe")
> > > Acked-by: Mikko Perttunen <mperttunen@nvidia.com>
> > >
> > >
> > >
>
>
>
>
