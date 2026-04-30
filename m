Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0AFC346AC3
	for <linux-tegra@vger.kernel.org>; Thu, 30 Apr 2026 09:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777540212; cv=pass; b=sDnxujO/O/d0LvVDwAIfB1BAMl/lUk5VZqPk4YCHTSt/iIgtmUT72lofSQHI2PKkC0+R6EY6CPuSvLnbYuz6Jtg0h7Rnha5XWizoRZH10PGObOFQ8DkXNq8EofNKeCtlEBCNS1i06ZnvAJ9UyiWJEE7ZKfEIsseAz0ztUVOJlqU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777540212; c=relaxed/simple;
	bh=YAIuhcF+H7kfNG3j2tbQ/OMQAUa1gSJ4rfyK6EkXFKI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MNT/ZuEjfJeXl5LvPre9n1QJiE/igWocmXhTX1lRB3pw1inVOkA37An19jOqaHAkyXEa2q2bGN+/EtB5r/iX9Ey/6opseD+NeroBiUQG0lxKm56zra3CiUGxVia3c9faTsTmzdM3jFAWENcX+BrEGbSGH+tilAqv2U3EFypTQQc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jD7PJ5c0; arc=pass smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jD7PJ5c0"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-43d75312379so1091469f8f.1
        for <linux-tegra@vger.kernel.org>; Thu, 30 Apr 2026 02:10:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777540209; cv=none;
        d=google.com; s=arc-20240605;
        b=BILtrZahf2Ia5n5ANdkwayyZwZaxHu9UE8hJ8+vbnMYtpfOy5SlaVdt93wHzq3HSUs
         Tgixu58E7F/boPtXDotff4f2x5751RNjldkIIG1Im8tZ6iiBmRz+J2aQGtgar6Hf+eVp
         kmGNdvPz9J2jxKVNlHdL3eu5R3KZGtkeRinQG5UglUa4npxbIjGYeOzvmGH8Ufm7F1Um
         AMa4lDbVdaDYjOONv6CknyILSR0etbhW2zXZBYt/2CC5r2QhHW7WYM2Yv6YWXkz68nAC
         mVf313TGuML5wtZ8SI89FVQENDq/fxmFfC9JDIE0OE/hOBZe9Z3z6OZ8EeZKiDlnj51M
         +8rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uNayLLCXFFg34wv8nX5d4Vm4GrWa+HjlsC1+5DIJvb4=;
        fh=/4wm6AT5e/COE7QcsDZsIS8dzQExXSPgoQZlxmQ/GjM=;
        b=CzZq9ebWl/KJzi4WZAqmbFqU0chTiqV4VvTye6T8VFmLTXvUV/ucj7VOmZblHCSC7o
         rJ2piS8c1rumYmqYum1Rbcalvw+e8vfw0SuvK2mxxGcKB9mc+zGo5m1EUFqvf3QiywNq
         1ldey+3YZyjsyEH4eqFPxrkTTz58djp68zLO5bfLLZtVCyk+r4qwbBEgo33rTDTM8PzW
         paF+sE51j5/v+o3F6OTjTFSQ4Zz5jpqukgAB8B8Lgpt5EYVdPhRVIT9ZcOiXXvpqBc1r
         2Yg/Qujq5z6/2ZDzAoBYQ8mafVkb1oomKmj+83mWwU07GUKbmBh/XvPEreZ8dUJGVBoe
         uRig==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777540209; x=1778145009; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uNayLLCXFFg34wv8nX5d4Vm4GrWa+HjlsC1+5DIJvb4=;
        b=jD7PJ5c0WjV4M+BZy6d4iEHsFG7QdpJ+zeTIInx4bLsxuyI1ZcA3UA+jVrs+voDyxo
         +Wk8hQUE1sfhZg6P4CSZJQ7FGjoGTsiz/6q0QgPMG3Ze1xi8ybnm4aVjJc6mcOfYVBz1
         NXZBTk6eSUlrYucrx5RWw3aswDQPiy22a+dokBfxFUP4t4QUNsCciz3cMAdZqMpO5bte
         meNY2Psx8NIhISne5yU1Fu3JfyREHKrlzZc9bEoeelbnnft+NwEbBgC3I5DnbQ1bXdqH
         41UphdcYx/Lx4vhuosZg/EMdA26qc4ryQeLPkUgMWqlyUomPxai5KYisvrJwhpQ/KjQ3
         jZ3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777540209; x=1778145009;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uNayLLCXFFg34wv8nX5d4Vm4GrWa+HjlsC1+5DIJvb4=;
        b=mkKeTy2c+4TzbH6VLR2quGIny6LzuPGUIMgEobpKrYiMKuMPzTIWN+Qo1P+zq2N27V
         mfK0A8GmyozcUKXMyrF0XOqAZBnjvxwvQ/fS4hhprSb6NH5Zhd0oJnVRZoXqUtsLYPwI
         2/RXRmd4Q/TDjCG49ElM9tOsXJ/p2Wqv2UKSkdP0h/EmU4A4s+FbMcAcZa0IfBmoqwyU
         nGTXymoZAomjkihVNLc+aJye7ulhWhHxIOAJZx/3MamuzhBc/RKLGG6V+8InL/xZzKUZ
         A+oZhhqO+mK2a4aYmFMlvUlB4SeAKgONVl7ZwRKDVJvlQYkpKEL57dMuK8Y5Z6X0d83t
         Y6ug==
X-Forwarded-Encrypted: i=1; AFNElJ/e1gK61tTgVy9czVb9PrtBKEMCpTg90ye6/IZ8u6SMEmyPz1t8SxOvO8l6V/VbQNw9uDBazb3os563mQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzohzN5cIA3U9a4IfKceHzNEd3yr8XH3M2jD5xiiV3LWQEVNDDI
	6DqpXe+oOe8XtO/FDfbhPG7Ql7VZNcXpdb2hk8iInBzjEN1sH3Dmsogdy2MQ0x75xPw7XRfKd9Q
	Ju0NaxTqxlgtkIf59pB8bR4cSbxaVAR8=
X-Gm-Gg: AeBDies08lzfHfI4J5iQMOf/N4QEns568edTDGt/6Ntd+eZixdKMB9EBPyFQoteKLsb
	DBRI6YSYeFtVKASdhrySjgN9dLuZ+WQY9B1MBptVs03j2BBMbaoZhx0+0uk9zRY+uARzKZyl+DS
	r4Vt6hQcZ4cmXdTUyZVSNik+RrBT5AYUpiXt+TFvZPsdK+gfx2qD1C7yBYHvm1jmCusUR+Elfl1
	dTocfsp5U9CwrCe2S/aRREeM7pKeK7ntgVNSXIWx+eD7ST1vPr1nz5LWgVyh/z4iwDIIhpQS8H2
	+HpCdTX23yYTY2NRIc4=
X-Received: by 2002:a05:600c:a412:b0:48a:65ab:8059 with SMTP id
 5b1f17b1804b1-48a8607972amr22587615e9.13.1777540208950; Thu, 30 Apr 2026
 02:10:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260427075856.85208-1-clamor95@gmail.com> <SGKRjIZyS4mU2gPAiUbKJg@nvidia.com>
 <CAPVz0n16zCgCZwPXWMPg=KiYLwc3beBzVqYVB96in7zn0Wkxqw@mail.gmail.com> <soBCUeXPQ72A3pDzGjjMng@nvidia.com>
In-Reply-To: <soBCUeXPQ72A3pDzGjjMng@nvidia.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Thu, 30 Apr 2026 12:09:57 +0300
X-Gm-Features: AVHnY4Je3sxCo-rN1StvJwz9cYuHqAYEyt3eRd6sgOWUegGJDGG9BA1xaOhYGlA
Message-ID: <CAPVz0n24mV5z_gqBtG9SXAvbu8EbAmNwrMEEa6XbGz_pUb4SVA@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] drm/tegra: gr2d/gr3d: Move pm_runtime_enable to gr*d_probe
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: Thierry Reding <thierry.reding@kernel.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Jonathan Hunter <jonathanh@nvidia.com>, Ion Agorria <ion@agorria.com>, 
	dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=87=D1=82, 30 =D0=BA=D0=B2=D1=96=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 11:3=
8 Mikko Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Thursday, April 30, 2026 5:04=E2=80=AFPM Svyatoslav Ryhel wrote:
> > =D1=87=D1=82, 30 =D0=BA=D0=B2=D1=96=D1=82. 2026=E2=80=AF=D1=80. =D0=BE =
09:23 Mikko Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
> > >
> > > On Tuesday, April 28, 2026 1:57=E2=80=AFPM Svyatoslav Ryhel wrote:
> > > > =D0=B2=D1=82, 28 =D0=BA=D0=B2=D1=96=D1=82. 2026=E2=80=AF=D1=80. =D0=
=BE 04:53 Mikko Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
> > > > >
> > > > > On Monday, April 27, 2026 4:58=E2=80=AFPM Svyatoslav Ryhel wrote:
> > > > > > From: Ion Agorria <ion@agorria.com>
> > > > > >
> > > > > > The gr*d_remove() has pm_runtime_disable, this indicates it sho=
uld be
> > > > > > paired with pm_runtime_enable in the probe instead of being ins=
ide
> > > > > > gr*d_runtime_resume().
> > > > > >
> > > > > > Signed-off-by: Ion Agorria <ion@agorria.com>
> > > > > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > > > > ---
> > > > > >  drivers/gpu/drm/tegra/gr2d.c | 8 ++++----
> > > > > >  drivers/gpu/drm/tegra/gr3d.c | 8 ++++----
> > > > > >  2 files changed, 8 insertions(+), 8 deletions(-)
> > > > > >
> > > > > > diff --git a/drivers/gpu/drm/tegra/gr2d.c b/drivers/gpu/drm/teg=
ra/gr2d.c
> > > > > > index 21f4dd0fa6af..71f092d59d65 100644
> > > > > > --- a/drivers/gpu/drm/tegra/gr2d.c
> > > > > > +++ b/drivers/gpu/drm/tegra/gr2d.c
> > > > > > @@ -286,6 +286,10 @@ static int gr2d_probe(struct platform_devi=
ce *pdev)
> > > > > >       for (i =3D 0; i < ARRAY_SIZE(gr2d_addr_regs); i++)
> > > > > >               set_bit(gr2d_addr_regs[i], gr2d->addr_regs);
> > > > > >
> > > > > > +     pm_runtime_enable(dev);
> > > > > > +     pm_runtime_use_autosuspend(dev);
> > > > > > +     pm_runtime_set_autosuspend_delay(dev, 500);
> > > > > > +
> > > > > >       return 0;
> > > > > >  }
> > > > > >
> > > > > > @@ -367,10 +371,6 @@ static int __maybe_unused gr2d_runtime_res=
ume(struct device *dev)
> > > > > >               goto disable_clk;
> > > > > >       }
> > > > > >
> > > > > > -     pm_runtime_enable(dev);
> > > > > > -     pm_runtime_use_autosuspend(dev);
> > > > > > -     pm_runtime_set_autosuspend_delay(dev, 500);
> > > > > > -
> > > > > >       return 0;
> > > > > >
> > > > > >  disable_clk:
> > > > > > diff --git a/drivers/gpu/drm/tegra/gr3d.c b/drivers/gpu/drm/teg=
ra/gr3d.c
> > > > > > index 42e9656ab80c..33e88ca4d4c5 100644
> > > > > > --- a/drivers/gpu/drm/tegra/gr3d.c
> > > > > > +++ b/drivers/gpu/drm/tegra/gr3d.c
> > > > > > @@ -517,6 +517,10 @@ static int gr3d_probe(struct platform_devi=
ce *pdev)
> > > > > >       for (i =3D 0; i < ARRAY_SIZE(gr3d_addr_regs); i++)
> > > > > >               set_bit(gr3d_addr_regs[i], gr3d->addr_regs);
> > > > > >
> > > > > > +     pm_runtime_enable(&pdev->dev);
> > > > > > +     pm_runtime_use_autosuspend(&pdev->dev);
> > > > > > +     pm_runtime_set_autosuspend_delay(&pdev->dev, 500);
> > > > > > +
> > > > > >       return 0;
> > > > > >  }
> > > > > >
> > > > > > @@ -578,10 +582,6 @@ static int __maybe_unused gr3d_runtime_res=
ume(struct device *dev)
> > > > > >               goto disable_clk;
> > > > > >       }
> > > > > >
> > > > > > -     pm_runtime_enable(dev);
> > > > > > -     pm_runtime_use_autosuspend(dev);
> > > > > > -     pm_runtime_set_autosuspend_delay(dev, 500);
> > > > > > -
> > > > > >       return 0;
> > > > > >
> > > > > >  disable_clk:
> > > > > > --
> > > > > > 2.51.0
> > > > > >
> > > > > >
> > > > >
> > > > > Oof, looks like I had managed to really bungle this with my earli=
er
> > > > > patch. Thanks for fixing it!
> > > > >
> > > >
> > > > Hello Mikko!
> > > >
> > > > Thank you for taking time and looking into this patch. Don't be so
> > > > harsh to yourself, PM is easy to mess and hard to set properly. Thi=
s
> > > > patch does fix gr*d access but it does not resolve the issue itself=
.
> > > > PM should be set in the init/exit rather then probe/remove. I have =
v2
> > > > which fixes this and one more minor issue and I will send them late=
r
> > > > on.
> > >
> > > Thanks! Why do you think it's necessary to enable runtime PM in init?
> > > If you look at the commit I referenced below (in 'Fixes'), we've had
> > > some issues in the past with doing pm_runtime_enable outside of probe=
,
> > > where the engine's power domain would be left enabled even when it is
> > > idle.
> > >
> > > gr2d/gr3d I suppose wouldn't be in practice affected by that issue
> > > though given they aren't in their own power domains.
> >
> > WDYM, gr2d and gr3d have their own power domains.
>
> Ah, my bad, didn't look far enough in the device tree.
>
> >
> > If the master device is unbound and rebound, gr2d_init() will run again=
, but
> > pm configuration is only located in this probe function which will not
> > run again, while pm disable are both in exit and remove. This results
> > in pm issue we are observing.
> >
> > Solution would be either do everyting in probe/remove, or init/exit.
> > Probe/remove will lead to domain being turned on even if engines are
> > idle. Init/exit seems to me more suitable and we have tasted this
> > configuration for a quite while in the grate DRM version.
>
> Yes, we should only do it in one place. Where are you observing the
> domain being turned on when idle?
>
> Genpd turns on the domain before probe is called, and it should turn
> it off again after probe if probe had enabled runtime PM and the usage
> count is zero. That's what we have currently for the newer engines like
> VIC and it's working.
>
> We used to have it in init/exit, but then we were seeing the domain
> sometimes being left on at boot, which makes some sense since as probe
> didn't enable runtime PM, genpd would leave the domain powered after
> probe. The domain would then also never get powered off when init
> enabled runtime PM. I assume the reason this only happened sometimes
> was that it was dependent on if the init function or the genpd
> post-probe code ran first.
>
> Based on that we should have the runtime PM handling in probe/remove,
> to ensure genpd turns off the domain after probe when there are no
> users.
>
> Mikko
>

Thank you for an explanation, I will adjust v2 accordingly (configure
PM in probe/remove).

> >
> > Best regards,
> > Svyatoslav R.
> >
> > >
> > > Cheers
> > > Mikko
> > >
> > > >
> > > > So for now this patch should not be picked.
> > > >
> > > > Best regards,
> > > > Svyatoslav R.
> > > >
> > > > > FWIW, I've been working on adding some nightly testing for Host1x=
/
> > > > > TegraDRM, so hopefully we'll be able to catch such things easier
> > > > > in the future.
> > > > >
> > > > > Fixes: 62fa0a985e2c ("drm/tegra: Enable runtime PM during probe")
> > > > > Acked-by: Mikko Perttunen <mperttunen@nvidia.com>
> > > > >
> > > > >
> > > > >
> > >
> > >
> > >
> > >
>
>
>
>
