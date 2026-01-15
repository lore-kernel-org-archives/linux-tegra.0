Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1736932E13B
	for <linux-tegra@vger.kernel.org>; Thu, 15 Jan 2026 07:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768462212; cv=none; b=psunRVE9sjC+q1RU68feIxVRcI9HnKtqZ3/e0LiB3cLzZtHW278oTBNpm2J5p9S8CafJ4LWR+H1Oheg4Dg+5i4xFbNf1j9pYD0r77QEvtwk+1O/rokBiRwH5sKAbkDyOOqbysXtQEnCEV6mw+kcXZ0g/bbqq32HJheff+F9DOaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768462212; c=relaxed/simple;
	bh=Nw+ajbHOfkQr3gM8ILrPWwhguXHGg7EvBWRu6gX5SkM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EKLq616CV/Ugw3mmiR2/JACz8OXdk319PgJ6n3H669qnm/g3+azsZezOqBIrmNb550A9ZHBU0zR7/0lm9Tv8y+ffyOqZDiX/sifmM0xL1iHxYd38dj76NXBW0i6q8MwD5gLsD0nFKqpQ+T+Z8Iqo/Im7Q6+xCYI2tlMtoerLG8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dXWUGLhv; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dXWUGLhv"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-430f2ee2f00so289632f8f.3
        for <linux-tegra@vger.kernel.org>; Wed, 14 Jan 2026 23:30:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768462209; x=1769067009; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SLFgkknC2AdJRw5yZa4R2LGRFg1LDifmm6eP5yD+R4I=;
        b=dXWUGLhvMcXzAbN60VsHwWVYX+AfDhYeMHd4v8F54ungWhWCloOqJJeTGtdGGItfKT
         m4P6POabipG9avRDx8A+QIY5NdNhv03xXMRaZWzh+1hxPAYJNodrnryRaf5KvSGieLV+
         ddiKi+xSY8u6ctLU9TrCxAnZjjTEcd+E7fW9D2/AISa/MmWkmYDHv2FNi79GU80bm5HU
         nj1hKKshEWvYbnyujEPed8pJPn7CjwynmYf1Z+oS2tSAKDM3NGQjCd3l2v7y/h0+ybPB
         w3UDMM3zav47+PDF5NqTJ9APHhDB+LiLprPVBLQ6CfqErgiOWNSZv6cu/iVRvboRPCMA
         MWMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768462209; x=1769067009;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SLFgkknC2AdJRw5yZa4R2LGRFg1LDifmm6eP5yD+R4I=;
        b=HxS/vJUVE90adhs/tN9R4wyflAK8SH09j5gb83mLHpT+Kh2eeASgE0X3EJiNnE4cop
         uunYHRJiXjkFpkF3svL0Pe93SAerTQ0iUy0UqXZXirj32fqPptMoSaoeyMcgXqO3Fr51
         6PHn+7MFVtWBBN4vHlofYDFWzknO9uzcxK1kmmti2eamMf5Fot6kZivt98EnkkF079I7
         ajQupQys12sy5sg1jm4vrTpn3SN8+KRBZJ1/YGJhYATPQRMzAeEVRexz4eUzGXDIGIPg
         pKYgtAyOcDqlrbRMdgaNvmhrBAJxYuOg7KOmJKcxrG0dh+w9plVo0W86WafDbOVGwDZD
         PovA==
X-Forwarded-Encrypted: i=1; AJvYcCVMzjiUg/40ZamMjOLD6MaO1n9NRhEuA8wTbkmWPHDePZu5T+qgUb8vTSds1XJWe21heMHBThQH3CPiUQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzTNYKiyP5edlnnp1ctud59SwMznpxUDadvFocK8otltLR48MV6
	JjsypzYn1VWdhMOPezyeK8L7PkHGLwbJZohwTj+2+IhOcYA86Cjb/HJDQg25SGZ3NoQ0y8rJEje
	vS0XOcZITK7FJohrTsQ5xZHEByeLSWYg=
X-Gm-Gg: AY/fxX73KFElPehidAWKNl7AJrPrCKDtEo7kBi1hOipVTNtmzM4yFHOM4RPoU9kS9tS
	Z4a8lZMG3E7WclKL/uLbkXqCYGajJ0kDx6lNvAgEd7sj8qN1Wcz0edbvKob3w++SPfXG8NgEW3X
	dioUMtzlQEmP0w7yLJgaTsrFXfMGXNfZDn/uus7hClOiB0R8Dw1bfGx01uTUE+YZ3KiaRKyyuIa
	4Uqq1PJ3rtYaApGmTJlUjwgi5SjCXTGWYEjiZhkdEI0eOqhF+YhAbvt25b3wHTQfl7bixRh
X-Received: by 2002:a05:6000:4301:b0:431:864:d4a9 with SMTP id
 ffacd0b85a97d-4342c3ed5cemr5803879f8f.8.1768462209134; Wed, 14 Jan 2026
 23:30:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251204061436.5401-1-clamor95@gmail.com> <4706491.kQq0lBPeGt@senjougahara>
In-Reply-To: <4706491.kQq0lBPeGt@senjougahara>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Thu, 15 Jan 2026 09:29:57 +0200
X-Gm-Features: AZwV_QgFceOIXDqRscxFY9mK9hyVQDnnrFDFPm2hILKsJwk2miJfkqseLCRuwSU
Message-ID: <CAPVz0n2pxCe1=rGcX5SE3ypJyPCAacvuguHuNupeDnfeNBLphw@mail.gmail.com>
Subject: Re: [PATCH v1 0/2 RESEND] tegra: dsi: improvements for video mode
 ganged panels
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Thierry Reding <treding@nvidia.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Jonathan Hunter <jonathanh@nvidia.com>, dri-devel@lists.freedesktop.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=87=D1=82, 15 =D1=81=D1=96=D1=87. 2026=E2=80=AF=D1=80. =D0=BE 09:09 Mikk=
o Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Thursday, December 4, 2025 3:14=E2=80=AFPM Svyatoslav Ryhel wrote:
> > Expand SOL delay and packet parameters calculations to include video mo=
de
> > ganged panels. At the moment only command mode ganged panels are suppor=
ted.
> >
> > Svyatoslav Ryhel (2):
> >   gpu/drm: tegra: dsi: make SOL delay calculation mode independent
> >   gpu/drm: tegra: dsi: calculate packet parameters for video mode
> >
> >  drivers/gpu/drm/tegra/dsi.c | 54 ++++++++++++++++++-------------------
> >  1 file changed, 27 insertions(+), 27 deletions(-)
> >
> >
>
> I can see this series has been merged.
>
> Mikko
>

I wasn't notified that this series was accepted, thank you for letting me k=
now.
