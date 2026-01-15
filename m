Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B2EA313547
	for <linux-tegra@vger.kernel.org>; Thu, 15 Jan 2026 07:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768463360; cv=none; b=uYGdg7L9OxKxBcOHEOofhaM5z2zM0by7hSrwvJgm20qJWZJlKGMWTCfnX+KF+SIELUv1DEmu/ywHmg0PvFVYkEYWmY0M0yXgXa0wsJ1obvR8lwumYz2yoEhd7OCSvQlj0zTsJ/b7c1ovPfK6HFi7e/UVWz8RXCD/26qJRxk6Uvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768463360; c=relaxed/simple;
	bh=hd2VPdvp8ufnz+pdMsSef2AaJOW+FtodIDjMjm5/IIo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o94wDbv/HIqCjCn1F9WeR+LdRoCfCQOcnccYYg3qsFqLR/4/lk7q4Z52FaF5TLRmBaoK2/9xkKz6HfSl6XFvVYRrvYgbRl0iGl4r2mmjrajx8Hlh+eTfN4z4nb3DISajgXviDvOkV4DaSur5sLRBNAtnxqptCWa67RIOxai+VUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gl6CBYMT; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gl6CBYMT"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-430f5ecaa08so278404f8f.3
        for <linux-tegra@vger.kernel.org>; Wed, 14 Jan 2026 23:49:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768463357; x=1769068157; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GtxAoaTpJU6r++xlIpmAaAG/bZOXfH9n2gzVC3kL6Pc=;
        b=gl6CBYMThWlrGXrBHxb6WypqpxguzhCqzgyIzVnlZJgA6szY65qhsBNCDDXxInjbjM
         VdQaXk297mclLMv4QCGucjiYsxKfT4jx9ivQLEvUcY+UAcgb3NHzVOfj6EBSWOEtQiMA
         WAzT//jdZ4+fdgpnVSG05P2vEXhZYWTiqtXjxh5NwmlAgBB7/Hbc+ShTsDII5H/0QA1B
         N7Kwit/JHlMPdpcB2KNLuQusF8mya4mkAMtWcE+P8IHSgKFZC0AbWoameqm2wWXtOOZr
         ctzBItgDCyRjiaIXFGQxUz6Jbt2c7vnNmoOT8EccvIpAv6yp+iP8RocmAThw+hp98vEC
         JCEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768463357; x=1769068157;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GtxAoaTpJU6r++xlIpmAaAG/bZOXfH9n2gzVC3kL6Pc=;
        b=Ys+kFAqS5oXxJ51iJwoXkL7Q5R8v/FZDBVfPzxPXmRwW7Noe1GVDB3JJvv2VZQVunB
         EwmREf8SlXy+nSJx7vYSq/JooLUnV1u26X1AiSx0cuAPc4SKEK7R5Gvc5VxcAfRelSSB
         i930J879X/meuh+BQ7wOoXWgthzTzIim8+XDeL7cJmvqXWTWFY/2EhDGsIRbzurap/aA
         CbMgEPCYt6zEIK7zGqF2dIRirdhKE7teZdnIn5s95DzsF2JmYrRbgGMtnTV5h0NVEWVL
         fp86uovmwnA+2+zletLIKIPmihiW4wl/w3p339iHaeAfqs5D/4rHfXo3PPkTeMFFxhzR
         onEQ==
X-Forwarded-Encrypted: i=1; AJvYcCX/0ISq1NLAfZlS7U+3lXxKkL0D2QADU1Jm4K6pA66gY/Dy7wy7I/H7X/zPNM7gkwAiouZisvSiL+SE3g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyqkfWi8QSz03kU72XvuoSkgu/D4uHjQYkD2QDAXm5+yVHpHcZu
	3h6UKDGMmpMrd8jv5YxxHv2n5Dco/SbZ/LylvLDt6tZFrEmuvunmWkiQk/FRMHa/Y2qaIPAuU4o
	LmjJWIiZTFGwM5TgBMFZldgCsZATowqU=
X-Gm-Gg: AY/fxX6WMg0PbkVCutknxkxpCQdUUdIGUrQ4keztAVVTzdw+bPYMhrfc8hmmip+ZoCm
	VpEuMJdOcbS7T0aJqcdkvydscPizmnS55Z+K0+aqsnALuxei1LKd018Bun5CxRe0J0ERzIouV18
	5NlLNeYRsSnBFJlBe8a79NMnB31H6EvWOQbrpBq00r7hxu35eSXqsMWc8GD0wKBuCOV72hrKz0q
	k+zsyi5kmQyYsPp8qjHj8VBt/lqauOt+ahwZe61wApciZRcoloWnJhXa5Ktm2qJ8VvSy1If
X-Received: by 2002:a5d:5d86:0:b0:432:8504:b8a9 with SMTP id
 ffacd0b85a97d-4342c571e43mr6373650f8f.62.1768463356624; Wed, 14 Jan 2026
 23:49:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251204061703.5579-1-clamor95@gmail.com> <20251204061703.5579-3-clamor95@gmail.com>
 <7012249.lOV4Wx5bFT@senjougahara>
In-Reply-To: <7012249.lOV4Wx5bFT@senjougahara>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Thu, 15 Jan 2026 09:49:05 +0200
X-Gm-Features: AZwV_Qi0zcbXk0tsiK_qJ_9rRb1cx2nEQ98pWwmRVMmkpOG8O8-PqPUPy2GYvG0
Message-ID: <CAPVz0n3JEHtUOq4qaZbqPu97NXdYxx_=5im4rxoEWi8EbKmKEw@mail.gmail.com>
Subject: Re: [PATCH v2 2/4 RESEND] gpu/drm: tegra: dsi: move prepare function
 to the top of encoder enable
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Thierry Reding <treding@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Dmitry Osipenko <digetx@gmail.com>, Charan Pedumuru <charan.pedumuru@gmail.com>, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=87=D1=82, 15 =D1=81=D1=96=D1=87. 2026=E2=80=AF=D1=80. =D0=BE 07:54 Mikk=
o Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Thursday, December 4, 2025 3:17=E2=80=AFPM Svyatoslav Ryhel wrote:
> > The tegra_dsi_prepare function performs hardware setup and should be
> > called before any register readings or there will be a risk of device
> > hangup on register access. To avoid this situation, tegra_dsi_prepare m=
ust
> > be called at the beginning of tegra_dsi_encoder_enable.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  drivers/gpu/drm/tegra/dsi.c | 12 ++++++------
> >  1 file changed, 6 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/tegra/dsi.c b/drivers/gpu/drm/tegra/dsi.c
> > index 278bf2c85524..8e80c7efe8b4 100644
> > --- a/drivers/gpu/drm/tegra/dsi.c
> > +++ b/drivers/gpu/drm/tegra/dsi.c
> > @@ -914,6 +914,12 @@ static void tegra_dsi_encoder_enable(struct drm_en=
coder *encoder)
> >       u32 value;
> >       int err;
> >
> > +     err =3D tegra_dsi_prepare(dsi);
> > +     if (err < 0) {
> > +             dev_err(dsi->dev, "failed to prepare: %d\n", err);
> > +             return;
> > +     }
> > +
> >       /* If the bootloader enabled DSI it needs to be disabled
> >        * in order for the panel initialization commands to be
> >        * properly sent.
> > @@ -923,12 +929,6 @@ static void tegra_dsi_encoder_enable(struct drm_en=
coder *encoder)
> >       if (value & DSI_POWER_CONTROL_ENABLE)
> >               tegra_dsi_disable(dsi);
> >
> > -     err =3D tegra_dsi_prepare(dsi);
> > -     if (err < 0) {
> > -             dev_err(dsi->dev, "failed to prepare: %d\n", err);
> > -             return;
> > -     }
> > -
> >       state =3D tegra_dsi_get_state(dsi);
> >
> >       tegra_dsi_set_timeout(dsi, state->bclk, state->vrefresh);
> >
>
> The section of code before the tegra_dsi_prepare call was removed in 'Rev=
ert "drm/tegra: dsi: Clear enable register if powered by bootloader"', so t=
his patch should no longer be necessary.
>
> Mikko
>

You are correct. I have found this when rebasing onto v6.18 which was
much later then this series was resent. Obviously, this patch would be
dropped on the next resend/v3. Sorry for inconvenience.

>
>
