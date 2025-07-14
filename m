Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 482A91FDA82;
	Mon, 14 Jul 2025 05:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752471428; cv=none; b=nEvfyKty0sAUtk9/5hvw1rkiR+BLmqv/B5DWs0vpwgOPi3TT7OgbsdR5xHKDaJFH5brtrkt/KvPQkvVFcNSmdVfWJ6g1C7WfUFe1EMK9wnITKD8ketBKUCNFhF4TQnxuW4RTkkPW0dcpstKBCtb+GQ2UV0j9af/HLEDBfB7MyvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752471428; c=relaxed/simple;
	bh=tc/NhtMREFxVXaPtCfojmDAvMBzvWojwpV/8eQNmpgw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DpzI4K81VNBZYoGswZ8rhrHnpOvQZbmipheA5LSORQzCL6B+ccwn9DMWyr1C4WpRQQqerOAzz+a2KH3+VSb7+Bsol2S1bbAZWa5hruG2gN2qQu9Uom3SG6I7lPjPEBHQz0GZ8C/iALeD2+KpyXOkxnM8vby0MdAlZudxzmX5Mg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dAWMrh8h; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dAWMrh8h"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-553ba7f11cbso3934326e87.1;
        Sun, 13 Jul 2025 22:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752471423; x=1753076223; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2xagdIzzGx6NuuSet54b4me2cko80bXqLwMkK0zMzLk=;
        b=dAWMrh8hVYs5cdtjRIcdntxFU8sSG0UmW2wjMo2joL/r0gUk7wy49rSHQT29Z1YRyM
         HtO9nepQ7t8r3DXI64iaUhGYFHoulwgCBrxMXt5jggS3wMwvuQ+HzQY+Xh/58WEQxb2u
         SdaKnCqhvDgI3JgucLb7WBwZtSHAbTKoYOJujrbPnk5E9fVzBXZdwuKiWDqu8+DnKNDq
         i+EeqR5VtXhfQ06KJIKhO/sKLtkgjdqao+YCC+rKff2c8NPvimDjVfGlHoqQbWnblrBu
         tiw+GLq9L0Bk6Z7TOG3F4LsChEcmaMKr8onpBF2s5K4gtIwkrMViRW58MkPSyexsTiMh
         kF2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752471423; x=1753076223;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2xagdIzzGx6NuuSet54b4me2cko80bXqLwMkK0zMzLk=;
        b=anJevQSmqThMDgDvOBfLZZB8rtacMo/w5+PBHbRLfWV8tIun3WE6LtIsx3+lckawsy
         ooFZd0Lm0O83osNr/uHdXaQ3Y9ige5XZmu1slKzmoXaAEh9t9sa5VMtA9QNGBWExDk9l
         aoUa6oZRnnigCg3JyHZoJflUwPpWIpvZ8v0seEpRFJ1HAuqf+nMGNNM1MZYZUQzZjOHk
         +Rykyn1EXK0b3OckwDRGs5UTE6Xz6Go6vBgxEs7QAHUy+C2UYsk/FJaNRoFQ+ZmL+qdd
         Km7bgGAxBfZS6NnsaxVMpB6HvaehwO/n0Pr7ISMTcFUvMTWHAdQrxGFHvpInkVwvS/Kl
         MeSw==
X-Forwarded-Encrypted: i=1; AJvYcCX6sbnWy84P2FLuBEdpnuKh0kWN84A0kA8L+P3pAhU8mFNHBU13usPuSyG4/UU20M88h6HjOq3IFEwB@vger.kernel.org, AJvYcCXPHz7QymNSaFBcdhGVOM2Zj6oECutjzaLy8zLBxwLGTSE5gc+d5BbN/YCUcoQWV2Wz9oYp+0S13HuVlnM=@vger.kernel.org, AJvYcCXYxcDukiF39HwuzmnCfWg39kXKxXCiKXEOJXUVwwWLppsvSCa0Gb7IEtL+aUPw1lsLQ5a40eCF0+Gf62kR@vger.kernel.org
X-Gm-Message-State: AOJu0YxtcZdyBGTMLueZsUKkruFigwsum5rGsWSq4WgBt7+hAxMQPZTy
	LtvrbR7RwgCXOW6emETbYJCFkWKBbdKgm6c+Lsvz7GLGyU078lxQrp2S9SFvKR+BdgB+a4Dd/G2
	SWqSPonM69EKlhbKZpDjf1jSjYjrtQsQ=
X-Gm-Gg: ASbGncu+oAm2kUh50EYn2uDvZMTuUcuyLYgMoE4Ij0TMTv0rxjsIH/KKyjK5dCmzhV9
	jCg8zRSXmSQyzvf0VhFP9PrPmtA/CUlRwCJcJSn9FrnQaHyobsWCGSd3NZC1M/mkw6q3GH55TeN
	TauvWCxhctdErHDuwsqHzqR5V0VDCMgC18XieOJWZOrPF6BOXZZvkvdOYgT2SnjTY85rfAIHmlK
	A2nqwk=
X-Google-Smtp-Source: AGHT+IGT8vhhzvx2cXbAU4QZYDjTD9k2ie2m0pUaWgI9ZnO1SJd9b2fyH0yLJ7qcoWp4tt/Muba3v/xPP7IzzK2uPtA=
X-Received: by 2002:a05:6512:3984:b0:553:2cc1:2bba with SMTP id
 2adb3069b0e04-55a04608d6amr3479279e87.31.1752471423106; Sun, 13 Jul 2025
 22:37:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250611-p3452-v2-0-fd2679706c63@gmail.com> <CALHNRZ9tjJo3LRmpaGsEsf2=Him0O2J-ZaJf4UZ8bcbz1119BQ@mail.gmail.com>
In-Reply-To: <CALHNRZ9tjJo3LRmpaGsEsf2=Him0O2J-ZaJf4UZ8bcbz1119BQ@mail.gmail.com>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Mon, 14 Jul 2025 00:36:51 -0500
X-Gm-Features: Ac12FXwZv433YhDKlU9lVbj--nIsj8zVqrPutzSOZ78w5bGvNK75fV_b5-3tS4U
Message-ID: <CALHNRZ-mUb1Yv6WTeq50ddBS209uWUkv2ivdEMqfBBUtw+SU2Q@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] arm64: tegra: Add NVIDIA Jetson Nano 2GB Developer
 Kit support
To: webgeek1234@gmail.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 30, 2025 at 2:37=E2=80=AFPM Aaron Kling <webgeek1234@gmail.com>=
 wrote:
>
> On Wed, Jun 11, 2025 at 1:53=E2=80=AFPM Aaron Kling via B4 Relay
> <devnull+webgeek1234.gmail.com@kernel.org> wrote:
> >
> > Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> > ---
> > Changes in v2:
> > - Fix usb power supply to align with downstream power tree
> > - Control vdd_hdmi with gpio pa6 and delete unused vdd_hub_3v3 to avoid
> >   conflicts
> > - Link to v1: https://lore.kernel.org/r/20250608-p3452-v1-0-4c2c1d7e431=
0@gmail.com
> >
> > ---
> > Aaron Kling (2):
> >       dt-bindings: arm: tegra: Document Jetson Nano Devkits
> >       arm64: tegra: Add NVIDIA Jetson Nano 2GB Developer Kit support
> >
> >  Documentation/devicetree/bindings/arm/tegra.yaml   |  5 ++
> >  arch/arm64/boot/dts/nvidia/Makefile                |  2 +
> >  arch/arm64/boot/dts/nvidia/tegra210-p3541-0000.dts | 59 ++++++++++++++=
++++++++
> >  3 files changed, 66 insertions(+)
> > ---
> > base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
> > change-id: 20250513-p3452-059708ca9993
> >
> > Best regards,
> > --
> > Aaron Kling <webgeek1234@gmail.com>
>
> Friendly reminder about this series.

Re-reminder about this series.

Aaron
