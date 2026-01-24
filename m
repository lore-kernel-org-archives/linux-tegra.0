Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38D1B237A4F
	for <linux-tegra@vger.kernel.org>; Sat, 24 Jan 2026 20:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769286005; cv=pass; b=F25p3OoJfrTN8OlxdeNvQhk+knfWyZFKwT0u8E6J1ngiZmRTiUTkEwp08BilbGtf5uN6P0CUuWnMPIsDaaBCBqtCxCXELCAhqf4dA3azBlSojLj1hWt32xvr+EcMGAmgzhX2eSwazUbrFZQEm15vfdzOAtcLqszIEFRe8weTmb0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769286005; c=relaxed/simple;
	bh=zbChyElac1UwgTP0SJZj1q6AbqL+QWSoCe8JC/abZcQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TRJ6amtYexhuKp3NAnJCJS7RJ0suX61fXyGU/PRHgV+7zp+l5rPpcB6h55h2e+QL5LAaQqvdzc3GKEcMWr8VnA3PFAmuVN/1EAGXWbW8d0fX/PysPashFgHinVFK3lEvKtR2tBDNYa4p/MqGBtd/HHiGyiDB4/bs6XTgMQJEphQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y4Q94oLU; arc=pass smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y4Q94oLU"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-42fbc305882so1968116f8f.0
        for <linux-tegra@vger.kernel.org>; Sat, 24 Jan 2026 12:20:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769286003; cv=none;
        d=google.com; s=arc-20240605;
        b=A/bjZqpoUzsqLNbULwLn/FOzAnsih1XOhF1wDbCQCLMH21pDpPizI6TrW5B278ObHL
         3nu+Juy50DWlKOyLgpvg6mr8Fv4V2P205XoXKnGfMmzqQKylhcJrtTEceFXRu9SBsiLx
         u31aZ4RCyju6d8kAXZGZR9aGpcEEI/ossWArB2nVgBBn5vkQEIRS6iWT2bOtSkMX/mwJ
         fkDm8WMZlVjZomFxI/JoccI3rZZbqaWmpCJH/zgsIiV1MEXuSlaqzNQsVR/moCasSByj
         JYLHa5EgKeQ7Rm/c4eqSjfyEB+sQiCI86OE4qePxG4d+upTDyf/1swfI43OggEO9izX9
         VHwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5IvQvVO47AehbyLG9Cg7wRdRPasY+7er+DvV1ut13R4=;
        fh=O+NqqHKOKQvYmCa/OD3Am0N2K+aVHucCdqPvyYvftq4=;
        b=TI/k134OH6ZJ5HeTpVbOsLujxtoQogOUpKAs10cjerPn7PT4nEUXzNKhMLsppFujEu
         nOQhUzGRn9svQVxknao5kSmgcn8BJKAKAgQSySFZ1yna8GJ2LCfJp+WfSIk87Esa1p29
         Y9cNxzAqic5SvFmUcDHrBsQY9IkBos6raqg3ab45+MVlHQypx1EnGrrTy3AaG0DMUtFN
         JLoeDxKqa/vKPWnHjozb3x6zwxJa+lpykJszkIm5xs7uiJl4YnJMwN78MyKQB2FGN1gk
         HKheR3L5J2V4QNtHVkhSRvwsMTN47H2I7lRAJgcjjgCqEnGW0PouHSCGOvsFTwpldb+2
         oeiw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769286003; x=1769890803; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5IvQvVO47AehbyLG9Cg7wRdRPasY+7er+DvV1ut13R4=;
        b=Y4Q94oLUupXmlLchLUI7rcyaX/eHch73XeNMif5OHqYgMjCyzUzQ4zwvoRRdsEKHkc
         I17sFJgX3F9urlyFfXZfA7DcHGT5TEiu4zyIJDmqWrnOawbv9/HIvy0OWjeROFD7BH7h
         Y0MpPSqP3HNkYPP5vc1eeljfq6bgJNOy9W3OpkwLTibM/H10BFpK34uOZ5z25X0Nye1Q
         vuny9yj2AH3KGteVRbIY5iyLedvFODpw4pMshIjUyzKULqJOeYfsIIf24ygZ5NkBnToo
         uKe7Ib3J9HUNhRBKRJx4GdnAbgFK2rcLLTLM/3Kj1v7FUKpLnzHRXrfl+klA/3z6Q+7E
         5+Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769286003; x=1769890803;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5IvQvVO47AehbyLG9Cg7wRdRPasY+7er+DvV1ut13R4=;
        b=jyTk5xNWWeaG6itShs6g7llDyqJk2nKve3vtZHfJv0W2uGlyHju3UY/NN65O3B3MxV
         /lkUtzhCj/ZANR6co5Ad6Yhvwlow0YyKMdIW67f4dnLfBk/AbPeJqAdYyybbHwXiqyMi
         tnEyvjvVGBq3XO6AOjHjNaag12H/1ZNaH8n2r417D1RUr1QyLedyfg4vYXK4rE82ZcCl
         y5tASbrgK/5jh2erBM34BEL1rJwMzQtPs3YHMHntaPCgYPzVGN3sHiMQICI+YwoMostc
         E0q20PXzAeIW6Zca7jz3URhIKM3v7ldaqz0p54izmB0YURAqQyZas3vKROMXRX1WUXLA
         QPvg==
X-Forwarded-Encrypted: i=1; AJvYcCUefpgXIoCdLGJosDcpKGLXU1u0gwSzeOxpMxRf5mJDZWN2fAW8f2Ri/PMAeznorO/agzpLh8yvQDlJcg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwnvNSsZW07poK039fyIAU9MFKJ/YCTnzJ/CYD5JA6EWUcbgQfc
	aXxWq7t8FnFEoR91qXrcbUeOlI7E/6JK8XGabfOz5MKjjZDRzrRQqgQXaoUrExgiI+UTX5rzPZK
	dCNGZ0/wpOlS+C5gagrErNkzZaMTSmb8=
X-Gm-Gg: AZuq6aIStseRA8UoAGYETa8mzye9Onkq053VsKqwDgw3GBQkS2nLKyMvUyTJ6yUMIjb
	wmzuLslSBD5uDnZLIBHPqPx02aZyUBW+wsNbngRqugoppG+iubJoSkru+mQYMZT4kxga3HrnyyW
	o+mIUhbl9QM58D7mFCTOmvTDh5tmcbFsN8Kz/iwEtyDYLhIN0mO7/orrtFnOVM5IvvUqv1I082W
	N4Jnc/Av/5at8zjAzCEt3Zbp66aN09IbWd732iG6iqlkBPMFkO3rSCnW99CuYQ+kyr9KyuZ
X-Received: by 2002:a05:6000:288e:b0:431:752:672b with SMTP id
 ffacd0b85a97d-435b159556dmr11734663f8f.14.1769286002389; Sat, 24 Jan 2026
 12:20:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251204061703.5579-1-clamor95@gmail.com> <20251204061703.5579-3-clamor95@gmail.com>
 <7012249.lOV4Wx5bFT@senjougahara> <CAPVz0n3JEHtUOq4qaZbqPu97NXdYxx_=5im4rxoEWi8EbKmKEw@mail.gmail.com>
In-Reply-To: <CAPVz0n3JEHtUOq4qaZbqPu97NXdYxx_=5im4rxoEWi8EbKmKEw@mail.gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Sat, 24 Jan 2026 22:19:51 +0200
X-Gm-Features: AZwV_QiGF7B_Re4bWRTdgXNS-XzkdDJdBkm2AnW07YovL950WfU-W10tVO3KO9M
Message-ID: <CAPVz0n2PZRSLyKNBAA+nfH66ujbvmQVQbG=6Ai_5sBe3U_dyPg@mail.gmail.com>
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

=D1=87=D1=82, 15 =D1=81=D1=96=D1=87. 2026=E2=80=AF=D1=80. =D0=BE 09:49 Svya=
toslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> =D1=87=D1=82, 15 =D1=81=D1=96=D1=87. 2026=E2=80=AF=D1=80. =D0=BE 07:54 Mi=
kko Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
> >
> > On Thursday, December 4, 2025 3:17=E2=80=AFPM Svyatoslav Ryhel wrote:
> > > The tegra_dsi_prepare function performs hardware setup and should be
> > > called before any register readings or there will be a risk of device
> > > hangup on register access. To avoid this situation, tegra_dsi_prepare=
 must
> > > be called at the beginning of tegra_dsi_encoder_enable.
> > >
> > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > ---
> > >  drivers/gpu/drm/tegra/dsi.c | 12 ++++++------
> > >  1 file changed, 6 insertions(+), 6 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/tegra/dsi.c b/drivers/gpu/drm/tegra/dsi.=
c
> > > index 278bf2c85524..8e80c7efe8b4 100644
> > > --- a/drivers/gpu/drm/tegra/dsi.c
> > > +++ b/drivers/gpu/drm/tegra/dsi.c
> > > @@ -914,6 +914,12 @@ static void tegra_dsi_encoder_enable(struct drm_=
encoder *encoder)
> > >       u32 value;
> > >       int err;
> > >
> > > +     err =3D tegra_dsi_prepare(dsi);
> > > +     if (err < 0) {
> > > +             dev_err(dsi->dev, "failed to prepare: %d\n", err);
> > > +             return;
> > > +     }
> > > +
> > >       /* If the bootloader enabled DSI it needs to be disabled
> > >        * in order for the panel initialization commands to be
> > >        * properly sent.
> > > @@ -923,12 +929,6 @@ static void tegra_dsi_encoder_enable(struct drm_=
encoder *encoder)
> > >       if (value & DSI_POWER_CONTROL_ENABLE)
> > >               tegra_dsi_disable(dsi);
> > >
> > > -     err =3D tegra_dsi_prepare(dsi);
> > > -     if (err < 0) {
> > > -             dev_err(dsi->dev, "failed to prepare: %d\n", err);
> > > -             return;
> > > -     }
> > > -
> > >       state =3D tegra_dsi_get_state(dsi);
> > >
> > >       tegra_dsi_set_timeout(dsi, state->bclk, state->vrefresh);
> > >
> >
> > The section of code before the tegra_dsi_prepare call was removed in 'R=
evert "drm/tegra: dsi: Clear enable register if powered by bootloader"', so=
 this patch should no longer be necessary.
> >
> > Mikko
> >
>
> You are correct. I have found this when rebasing onto v6.18 which was
> much later then this series was resent. Obviously, this patch would be
> dropped on the next resend/v3. Sorry for inconvenience.
>

Actually, "Revert "drm/tegra: dsi: Clear enable register if powered by
bootloader"" causes a  regression for me (DSI on Tegra20 device,
Motorola Atrix 4G). DSI initiated by bootloader will be stuck if not
disabled pre reconfiguration, Dmitry was right by bringing that
change, but he did not take into account that if DSI is accessed from
cold state (not configured by bootloader), device will hang. This
patch addresses this behavior of Dmitry's patch and prevents
regression introduced by reverting it.

> >
> >
