Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C070D257854;
	Mon, 18 Aug 2025 18:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755543418; cv=none; b=ulzlwc0Y5L9gDHAcGmlwfZiI/9zCzojco1QLdSVX1XjuKGEZBxBfvdhjQq7HKI6HeVf7ioW104+pKgmxcYsjdJuUfgOJSx1K0ESkuwjP0p9S8Cc30gv5QNUwFcriNeWh2hr54rhjXumE4+tlOLCwq7Wpw4nE/AL76AjjI0fV1mU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755543418; c=relaxed/simple;
	bh=cW6Zw4X6l/8LtzSm0XuIo7DagtVAErRt/WZ2KMJ9BoA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C853F+zRZKR8O3tSXA9zo4BqVlnoYIDqm/emND90Oq/TgVWvAN9sfZLZU/Re2cuNeuOxf3nSN9Gcr63hj5MWtNe70BDyuLjP/RhfMAtiqelQHolmFcGBm+IDyVHSMcW5VCrKDsMY608cVwuVbTMYh69YYRCn7FvxF2uNU6Ykp6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IdJwzWuo; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IdJwzWuo"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-333e7517adcso49462301fa.1;
        Mon, 18 Aug 2025 11:56:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755543415; x=1756148215; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HDBB8ZTTu16kBJ12UfAqyQDqCQPi74zEgHxFOpa7z7s=;
        b=IdJwzWuobAhli6LIjE8P7WwKYJ3KCLOiwbFRAM71xkzRMGDkLfB+L2VfjgHEaeN9yZ
         eSg1xM2cEHDUZtF/jI+PWA+JC92ch+bT8NDi4iQNs7GGojZS/2sJA6J28eJrfk1T46kh
         t3yxocXavLAnJgGMnB1TpKXPyLoqkVsqqbWYnsVmotHzBP8Z2ARKqag0tA/hVPtGJPXA
         C6pbr+ePo09XzsPeIw7h+QpZQZe4Gvcb9Qz9wcWxkhlfsHnFxlctD0rzg9V3inJ8IWzJ
         DOYsKIJM1lGhac1wvAlA418v4d6J603oSwjTV8+4og14RMAPdZWRbU6VAZrsZ7lz8qE2
         VD7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755543415; x=1756148215;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HDBB8ZTTu16kBJ12UfAqyQDqCQPi74zEgHxFOpa7z7s=;
        b=whj0U9bD0KaxeQYTVkHFeOd/T08nEOtYNfaUCmv3w16r35LdCV0XBN9EHiGr3Rfk4x
         7TPBD6fDpjfMZnP3ajxR9uAPKdd1zjI+19qMyhdsaJZYnIGyxpZ9BDFG/RMbamdJzNWn
         7QwKXmAYKlyBw86hvkWFwjkLsEhQ0GrPaPHrrSYXgjQpVyCG+1mKj6Ew+m+r+9xgB4RS
         U7zMFDPbQ2nGJICzx6sNVgC2vIoGXuq55I97bv0+s8klVwMKkrZsMAHSSSpfYHwFkwm4
         L9GVwaXi8U2xrs3beOTDKsf+uNXVGt+mOJkti7gHvPOpK64ra1ey8PUAaaWNgNJtwK0X
         ywDQ==
X-Forwarded-Encrypted: i=1; AJvYcCU5zHDZPFC7/1g23KEZW7qcK3GonAjqiDjBv8ASZAnzXP4FDMlhmeYjcf6Sbv4ee6Nizz0Q7ODEymzdddBb@vger.kernel.org, AJvYcCUZbYG4HNTE5GWOoUGdPx8ORzVrrfEtKQJQYzCFt3kqQq/EJMzHtCgTLtpEkHdzwwE6oFp4yq92FbWANr8=@vger.kernel.org, AJvYcCWMRvSyQapwK2rLXwbixTFvV3sYpnOVIcN75iQV2vXpYufI2D4KjNxXE05ty4tK3s3u8cHBDdL1j2Ti@vger.kernel.org
X-Gm-Message-State: AOJu0YzoRjfdE+F12OtRj1MWqKA4tlqWa/XfJ9qSFC/wMNi76WRTu3k4
	sKvHSV70U4jHXsjahTrMgnQM83SuRbCx26o5jCc0lawpNot1cKEpq+5jwJVsyXcLys9oR0ls9CY
	/w4tTP0FL0L23Ko3K67RRAqQk8U1pqjEfgZnu
X-Gm-Gg: ASbGncv1al/rBJuTb+UFwYLR+m0/c75PWEh26kD+U7TiTDG0cC9VRJ2VUpR51LAyW1q
	ryK8CA48WFyJOrHN6QaT5lWJMyLIFKGkBeRFKRITWoRNnoRvJOO78H1D9jX426KofoZ2xswe+Br
	ZqgMupTV5y4QGrM/dWTyzyNcBO1ks46lzLXo8QKoVOLm0IlgUtepmSDPOfuUoQlQPPnGQ0DNYxZ
	SQg5rdPRDbtdGJMCw==
X-Google-Smtp-Source: AGHT+IGLpwruHH1jFqPtCTgTST4GSi1QWs0KmUfeU010gjKHdHCYYcHRxDOhtE/4BKTUsTrlBPwKO5g7s6nZcyt64Xg=
X-Received: by 2002:a2e:be21:0:b0:32b:a9a4:cd58 with SMTP id
 38308e7fff4ca-3352ddd4b5dmr1697761fa.15.1755543414532; Mon, 18 Aug 2025
 11:56:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250513-tx2nx-role-switch-v1-1-d92ea1870ea5@gmail.com>
 <CALHNRZ8H66g98ThQKZJAT2UohVNtt6OS=rKd5wtcT1YwBLURqA@mail.gmail.com>
 <CALHNRZ84+KGwioU=7ZOL=O39cR_VSRJBaV42MsA4fymXNJC6+g@mail.gmail.com>
 <CALHNRZ9zfjV-ZttJd_ydgEaWk7XB+3YPfKGuYXLBL9qA8Exv0g@mail.gmail.com>
 <CALHNRZ-HTFz38xZFsbpG6C3r_xDQTLNOZWPX21TzNPaLyxf6Xw@mail.gmail.com> <xmirimw2guubgrf6umt4qiknpyjaepkrx4oggcmaffoyd5sli2@kzewnjv3bkjf>
In-Reply-To: <xmirimw2guubgrf6umt4qiknpyjaepkrx4oggcmaffoyd5sli2@kzewnjv3bkjf>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Mon, 18 Aug 2025 13:56:42 -0500
X-Gm-Features: Ac12FXzctcgTCF1B-HAlLK99s32lr_bBmhmmmU7bUtTEBs9HP1D4InDwm7lzs-I
Message-ID: <CALHNRZ9uJ9g6BGhUmBaaMM3DhQDh7mTtqKKr0A98X-5V4ompEg@mail.gmail.com>
Subject: Re: [PATCH] arm64: tegra: Remove otg id gpio from Jetson TX2 NX
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 1, 2025 at 4:43=E2=80=AFAM Thierry Reding <thierry.reding@gmail=
.com> wrote:
>
> On Thu, Jul 31, 2025 at 04:36:17PM -0500, Aaron Kling wrote:
> > On Mon, Jul 14, 2025 at 12:35=E2=80=AFAM Aaron Kling <webgeek1234@gmail=
.com> wrote:
> > >
> > > On Mon, Jun 30, 2025 at 2:27=E2=80=AFPM Aaron Kling <webgeek1234@gmai=
l.com> wrote:
> > > >
> > > > On Wed, May 28, 2025 at 12:42=E2=80=AFPM Aaron Kling <webgeek1234@g=
mail.com> wrote:
> > > > >
> > > > > On Tue, May 13, 2025 at 4:10=E2=80=AFPM Aaron Kling via B4 Relay
> > > > > <devnull+webgeek1234.gmail.com@kernel.org> wrote:
> > > > > >
> > > > > > From: Aaron Kling <webgeek1234@gmail.com>
> > > > > >
> > > > > > The p3509 carrier board does not connect the id gpio. Prior to =
this, the
> > > > > > gpio role switch driver could not detect the mode of the otg po=
rt.
> > > > > >
> > > > > > Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> > > > > > ---
> > > > > >  arch/arm64/boot/dts/nvidia/tegra186-p3509-0000+p3636-0001.dts =
| 1 -
> > > > > >  1 file changed, 1 deletion(-)
> > > > > >
> > > > > > diff --git a/arch/arm64/boot/dts/nvidia/tegra186-p3509-0000+p36=
36-0001.dts b/arch/arm64/boot/dts/nvidia/tegra186-p3509-0000+p3636-0001.dts
> > > > > > index 26f71651933d1d8ef32bbd1645cac1820bd2e104..81f204e456409df=
355bbcb691ef99b0d0c9d504e 100644
> > > > > > --- a/arch/arm64/boot/dts/nvidia/tegra186-p3509-0000+p3636-0001=
.dts
> > > > > > +++ b/arch/arm64/boot/dts/nvidia/tegra186-p3509-0000+p3636-0001=
.dts
> > > > > > @@ -669,7 +669,6 @@ connector {
> > > > > >                                         vbus-gpios =3D <&gpio
> > > > > >                                                       TEGRA186_=
MAIN_GPIO(L, 4)
> > > > > >                                                       GPIO_ACTI=
VE_LOW>;
> > > > > > -                                       id-gpios =3D <&pmic 0 G=
PIO_ACTIVE_HIGH>;
> > > > > >                                 };
> > > > > >                         };
> > > > > >
> > > > > >
> > > > > > ---
> > > > > > base-commit: 405e6c37c89ef0df2bfc7a988820a3df22dacb1b
> > > > > > change-id: 20250513-tx2nx-role-switch-37ec55d25189
> > > > > >
> > > > > > Best regards,
> > > > > > --
> > > > > > Aaron Kling <webgeek1234@gmail.com>
> > > > > >
> > > > > >
> > > > >
> > > > > Friendly reminder about this patch.
> > > >
> > > > Re-reminder about this patch.
> > >
> > > Yet another reminder about this patch. It's been over two months
> > > without a response and many other patches have been pulled in the
> > > meantime.
> >
> > Reminder yet again about this patch. It's now been two and a half
> > months without even an acknowledgement from the maintainers.
> >
> > This one is getting annoying. What does it take to get a response from
> > the tegra subsystem maintainers? Does time have to be pre-allocated by
> > the company to look at patches that aren't from @nvidia.com's? Are
> > there certain times during a development cycle? When responses happen,
> > it seems like there's a lot of activity. But then everything goes
> > silent again for months. I've not seen any pattern to it so far and
> > it's becoming extremely frustrating.
>
> Just people being busy. Nothing more, nothing less. I'll pick this up
> once the merge window closes.

If I understand correctly, the merge window closed on August 10th. And
I still haven't seen any movement on open patches. If everything
unrelated is on hold until after Tegra264 launch or something like
that, it would be nice to at least set that expectation instead of
everything being held arbitrarily in suspense.

Aaron
