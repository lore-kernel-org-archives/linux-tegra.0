Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE98D3DFC70
	for <linux-tegra@vger.kernel.org>; Fri, 15 May 2026 07:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778830627; cv=pass; b=j+nLPtJrsCD6Cbg0cRpkpHcyqBzTDOR2TFRB/F9g+EF5LEQIvcOlM4Bc6Ho5C+OBTeR3BkCPDrbUxjXGDFedmkzWnCzWQhqJgX4GO6IeMVGvhb2dqEF4VNPhe63sVC5okRgcX+Ipsm3ugBwac05/KrQlHIqXaUUXw1qsy8CVHzw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778830627; c=relaxed/simple;
	bh=v9Wn1R9NxB8uD0AzvrpO9w4i+cfd6RbJfWSmMML/eas=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R3yhpMSkGryksvSQ85kGThdXBNXbmuIF/AFsfNqM6dvuYvALuNy+HvTNnEFVvCGzuJpC2A8OQyaFVA5/L64GI54IfnHxvlu9E4DQn/jmWlxWREubz7wWfwtvwWHFQ8waQwdixgfn4V8jgkCoPz6CBN5nB034LiHLxAgiTFMdh8U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bCGmKyQY; arc=pass smtp.client-ip=74.125.82.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bCGmKyQY"
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1309f4ee97fso11199610c88.1
        for <linux-tegra@vger.kernel.org>; Fri, 15 May 2026 00:37:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778830625; cv=none;
        d=google.com; s=arc-20240605;
        b=BD+OK6WqO1+ijM6vgjLYxgjEX0Et5HpLDCxk23304QQuDotu7ysix/dwpZ5rshHzEV
         pW2WdOyQIdAZ2rEcXzcKM4Bd3M79SHc/GSXRYmlk6gxAavEk1yjuY49Sxyy78rlZYP1K
         UjbU4akg8iwfZgdbledNw+3xVzxLrxM40RFQqVWvwcPjMeBhnRl0XzXr3ns3anxHuSIe
         JEeMlnlnnfeypd6SZ4wsuCiaL0Sq07aSinsaN7VJm7jBJ7peb/EdGhmhzMwYzFKVB9Ds
         vZgEiQznvtRfLHKwrw1PtoaChjfZczVkj5mpPNDP2u9Rp3CwGquuZgW3t65/1m1V+lcB
         ceZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NGjsU1/O6Qd2VzZsEHIRxKkGqBUr56OKbf0ka9VzVNg=;
        fh=RMoTG2fwNrfBE2+GoldCeNpoOfpRAHqAc4+0FYQbmpQ=;
        b=OGn2LI4YZ6ZrmWqtXoL/o81flBlERiLvB5F9EVcUKK7QQ6LyZM5G+3lz8MCkr2tCyK
         RRBB2H9rs/pi/qwuRJHyYFmu6zCxuRBSyac9xKheob5ME0d2ov+gyNqduoSW1vSmXgYj
         y/X/LLHENBiDNZewBrXvkNySdHdJD3yGFv+XVSVLwTzXwqfk6RhZQCvr1ZDGt6bpTntq
         n0r71OqEeIRC9+jj8N4IKSnCQdpA/fOwnex258CRNVWhU0qsYm1fzYnzyQDkpAy2sSgJ
         NUY3qXFb6LxXwj9TryJVIlEj1XTgWQA8AnsqRb7W8iNxVA34SfZZ5UtamI6j1dIocFbB
         wuVQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778830625; x=1779435425; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NGjsU1/O6Qd2VzZsEHIRxKkGqBUr56OKbf0ka9VzVNg=;
        b=bCGmKyQYwZXdoaTXH0vzh7q+BBGhBso84NFO6X9z/MqzFpPzsKH9ZxVgMlMhT7ih68
         XWuTE0WM7ru111g+wW3WHxJDZ+9zzsga009AXktAGg5wfmzuIxC4kaR9XvAOdcLu3bx5
         Z0fAGTyejVFi88gSzwv4Bh9rCHRJhA73jxZQBkH23aPJcjw0kMNzfmjNRAt5g67/rjTz
         Xp9mB4/UZbWTXQzrkJ5NTNJVUaflC8VRFcOoLyF5AEEpufm/dbjp3KdzFbCrfn++2Pbw
         RQ0brLr/W/FqkzoLb/hlheUSczvA5T3ehKQt+CjTcRiAH2RqNWxGl++m1O6ym2hTzWqw
         mk/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778830625; x=1779435425;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NGjsU1/O6Qd2VzZsEHIRxKkGqBUr56OKbf0ka9VzVNg=;
        b=g+1wWD+9fbZDk47jBMiMspmh9YkoNkvkh+6OSXS/JP1bZHkTtSpv7WdSGiR7Nu8GB9
         YuINQBz7irjwKfA7wg4MrWyZ99SOnK1WWjWd93qmTDuD1pgSFZ0HISLGu2XlxFTBTIug
         8l7vkOWbvEP3lAZaIRX/Zom1Rbepgci+Nle1EeY07+bPlx/IRTJUuTBIUgqtjV/aZdwn
         FN7CGg4vcMv1MLEeQ19pi5QPmKVI+f6+ARpKE3CB0vtqzBtRW7SjmeJ+s1xlfrRM0D6P
         6BIHPlWEg9k+AUTSQzzqkyL6B1vtThe24AhHrWkKB+B3eefdZnqx6NCjK74/cikSakBv
         0L4w==
X-Forwarded-Encrypted: i=1; AFNElJ+PC066mSveISefCzAHaMxoHMDBU+sF51pcpfVWCmkLSU0LYTHasVU1m+4d7O92JW67Bn2xtC94hPsEHQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyFEkIdC57kKrfq+I0+THe05zPi569uJogyVAjAI+lYctvLvNhf
	qhnRi4yoPTP9KrjXYsjd5uHfnpfy5/30aK9f8F8TmeqPujiz98lwAboYY4YWLOkoH5bSE8PZwtS
	yYg9mo/+fD9hb1VW+4fWKguhmlH6Jwk0=
X-Gm-Gg: Acq92OG7IVqqOYqosn/YvaGMhAaSKzi9dZNJ5s/gKj+LwBNjucPz7D6mGJYiXbUApdE
	3/GrbYt8bscXseOpCcASxI+7EGq5sd/fUzOB3Ud/8bxXI/TIOKpssoPYhuK66PULGJncrhTwkFA
	KgQJ8TnmEd5jXynq4KirTkDOqFm2pp5Kh90NHTw/bW6Yx12lRUnOdy22mBxgsE+awkMYbulQv1P
	Vvbk9wwwjFak5MvcQJ6/ZC7F+tr3OFfF6ALsiWWtRqUJu4Y+QfQbxr2CEGTaLCD5hD5iAFisQJi
	Puyuaqpl
X-Received: by 2002:a05:7300:b10b:b0:2f3:986d:2d01 with SMTP id
 5a478bee46e88-3039868d07fmr1247518eec.19.1778830624718; Fri, 15 May 2026
 00:37:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260503163842.213489-1-clamor95@gmail.com> <20260503163842.213489-3-clamor95@gmail.com>
 <CAPVz0n1N4YHDPW=gsUZWZmRZbt8xQB1V8JWn6cyM75fo7H020w@mail.gmail.com> <yUGHnUTQTKW8E9_u4r6I9Q@nvidia.com>
In-Reply-To: <yUGHnUTQTKW8E9_u4r6I9Q@nvidia.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Fri, 15 May 2026 10:36:52 +0300
X-Gm-Features: AVHnY4JzXMAApBNZ5wqO34OO89oihr8_LAAIa35jMjef7VdzRh3okcZk_JAMTcI
Message-ID: <CAPVz0n2vZ7p_7C6zsau0600JQM08Zyo3x09h=it6Z+=mXV5FMw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] drm/tegra: gr2d/gr3d: Contain PM in the gr*d_probe/gr*d_remove
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Ion Agorria <ion@agorria.com>, 
	Thierry Reding <thierry.reding@kernel.org>, dri-devel@lists.freedesktop.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=87=D1=82, 14 =D1=82=D1=80=D0=B0=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 07:0=
7 Mikko Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Monday, May 4, 2026 3:36=E2=80=AFAM Svyatoslav Ryhel wrote:
> > =D0=BD=D0=B4, 3 =D1=82=D1=80=D0=B0=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 1=
9:38 Svyatoslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
> > >
> > > From: Ion Agorria <ion@agorria.com>
> > >
> > > The current power management configuration causes GR2G/GR3D to malfun=
ction
> > > after resume. Reconfigure all PM actions to be handled within the GR*=
D
> > > probe and remove operations to address this.
> > >
> > > Fixes: 62fa0a985e2c ("drm/tegra: Enable runtime PM during probe")
> > > Acked-by: Mikko Perttunen <mperttunen@nvidia.com>
> > > Signed-off-by: Ion Agorria <ion@agorria.com>
> > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > ---
> > >  drivers/gpu/drm/tegra/gr2d.c | 11 ++++-------
> > >  drivers/gpu/drm/tegra/gr3d.c | 11 ++++-------
> > >  2 files changed, 8 insertions(+), 14 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/tegra/gr2d.c b/drivers/gpu/drm/tegra/gr2=
d.c
> > > index e4148b034af7..ffcd076b5831 100644
> > > --- a/drivers/gpu/drm/tegra/gr2d.c
> > > +++ b/drivers/gpu/drm/tegra/gr2d.c
> > > @@ -100,9 +100,6 @@ static int gr2d_exit(struct host1x_client *client=
)
> > >         if (err < 0)
> > >                 return err;
> > >
> > > -       pm_runtime_dont_use_autosuspend(client->dev);
> > > -       pm_runtime_force_suspend(client->dev);
> > > -
> > >         host1x_client_iommu_detach(client);
> > >         host1x_syncpt_put(client->syncpts[0]);
> > >         host1x_channel_put(gr2d->channel);
> > > @@ -286,6 +283,10 @@ static int gr2d_probe(struct platform_device *pd=
ev)
> > >                 return err;
> > >         }
> > >
> > > +       pm_runtime_enable(dev);
> > > +       pm_runtime_use_autosuspend(dev);
> > > +       pm_runtime_set_autosuspend_delay(dev, 500);
> > > +
> >
> > Hello Mikko!
>
> Hello!
>
> >
> > I have used same setup as in VIC. May you please take a look to sashiko=
's check
> > https://sashiko.dev/#/patchset/20260502124055.22475-1-clamor95%40gmail.=
com
> >
> > I do agree with statement that pm_runtime_enable should be before
> > host1x_client_register since this same approach is widely used in the
> > media subsystem too.
>
> Yep, I agree as well.
>
> >
> > But I am more interested in your thoughts regarding sashiko's
> > gr2d_exit situation reasoning.
>
> It sounds accurate to me, there is probably a real issue. I expect
> there to be in general some driver unbind related issues, since it
> (particularly when the device is in use) isn't really being tested.
>
> FWIW, in an ideal world, it would probably make more sense to do the
> IOMMU handling on the platform device side, since the device's memory
> accesses are not related to host1x. But we can't really do that right
> now.
>
> For the time being, I don't think fixing this is particularly critical
> since other things will go wrong as well if root causes .exit to happen
> while the engine is executing. I can't say offhand what the proper full
> solution would be.
>

Thank you for sharing your thoughts on this topic. I will adjust
accordingly in v3

> Thanks
> Mikko
>
> >
> > Thank you!
> >
> > >         return 0;
> > >  }
> > >
> > > @@ -367,10 +368,6 @@ static int __maybe_unused gr2d_runtime_resume(st=
ruct device *dev)
> > >                 goto disable_clk;
> > >         }
> > >
> > > -       pm_runtime_enable(dev);
> > > -       pm_runtime_use_autosuspend(dev);
> > > -       pm_runtime_set_autosuspend_delay(dev, 500);
> > > -
> > >         return 0;
> > >
> > >  disable_clk:
> > > diff --git a/drivers/gpu/drm/tegra/gr3d.c b/drivers/gpu/drm/tegra/gr3=
d.c
> > > index 47b0c6c56bfd..cd5554e2117f 100644
> > > --- a/drivers/gpu/drm/tegra/gr3d.c
> > > +++ b/drivers/gpu/drm/tegra/gr3d.c
> > > @@ -109,9 +109,6 @@ static int gr3d_exit(struct host1x_client *client=
)
> > >         if (err < 0)
> > >                 return err;
> > >
> > > -       pm_runtime_dont_use_autosuspend(client->dev);
> > > -       pm_runtime_force_suspend(client->dev);
> > > -
> > >         host1x_client_iommu_detach(client);
> > >         host1x_syncpt_put(client->syncpts[0]);
> > >         host1x_channel_put(gr3d->channel);
> > > @@ -517,6 +514,10 @@ static int gr3d_probe(struct platform_device *pd=
ev)
> > >                 return err;
> > >         }
> > >
> > > +       pm_runtime_enable(&pdev->dev);
> > > +       pm_runtime_use_autosuspend(&pdev->dev);
> > > +       pm_runtime_set_autosuspend_delay(&pdev->dev, 500);
> > > +
> > >         return 0;
> > >  }
> > >
> > > @@ -578,10 +579,6 @@ static int __maybe_unused gr3d_runtime_resume(st=
ruct device *dev)
> > >                 goto disable_clk;
> > >         }
> > >
> > > -       pm_runtime_enable(dev);
> > > -       pm_runtime_use_autosuspend(dev);
> > > -       pm_runtime_set_autosuspend_delay(dev, 500);
> > > -
> > >         return 0;
> > >
> > >  disable_clk:
> > > --
> > > 2.51.0
> > >
>
>
>
>
