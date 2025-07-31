Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24CC12110E;
	Thu, 31 Jul 2025 21:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753997792; cv=none; b=lANo3bztOZvgaoVAXc34nms1rqWRBo9cWOZTRdaG8w1rMNW//wLLiZwzxV5uEOSClxZoOnB8hQlwZObRJDzXre9pMbhd/9XP8U1QTo9OtHLeaGUlKLNFaB7BTJ9w/pmkFbr6o+L0vUMA2Y6v1rYFOX1LyT6l4iFrWxwGUlZGQRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753997792; c=relaxed/simple;
	bh=jYZaaLLhQJOzhRa9jxsL/R+vLcUjY54sdHto+cPAk0s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lNuuaOMsu9+LcDL8N5lrw1I0MJONI4whytbcECIj25iPZRGMlscj/Fb0icTH51kz7OJLlMMCxu2Zh9cFLyKmN9KRCXKkbWnX4yZegB1NFaGw47GNm0GYcwfWhOPpkQy56EOvi7rjaAUnBLr2msFmDBfVCcveAxuQxUZ45zReIjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mke8HT1Y; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mke8HT1Y"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-553d771435fso1453444e87.3;
        Thu, 31 Jul 2025 14:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753997789; x=1754602589; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FrvaokmJFjtrt8aO0z9fEjiF8NzdgfTwRbQs48SsHeA=;
        b=Mke8HT1YuL0seKGt88eXqA7Dy4dd/iyNOoJ46U621sAggoZ2ohmbXylsVMieMVAvDw
         Qq9yX5O4cg5P8TaIMxKzhWfVLCsfVqSvuxHf2ezu6OizTbit4fNUxndSJVKbPyMFHQf+
         wwWPYqH88k9Mb80e7XQUNPJTxMDcu99wCN3aeb2sPToUftG68NyJL47XCvwXDp+A7+sP
         WqnLMNVRlOt69wCCNHfzRO0V8d46v35HbhMvwYpPOoWKtVIjMwr2wVCFvUbqCMloCyiF
         70oBQHPF6Zd3LUFxjyijLaJHK2xkXf7c7+ASxlSk/hUKk0bbq0x2NHYJofjmXKAdB97Q
         HYCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753997789; x=1754602589;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FrvaokmJFjtrt8aO0z9fEjiF8NzdgfTwRbQs48SsHeA=;
        b=lvCAUr8ERisALydjca9Y+NF7iB7JA3HnOQp2NjW/jCZSDf4q3B4kvLnSWqrvrzHnxm
         s79hiwQNIXIe+IWTj01CSLyWnzF4L++N3zpiixXYSQWefypaexnXn6OOsxQQT+HlFKzt
         JHCc7HedQ2SoTKbMDZOFjPt0iykr4reEYfJ/MeUeLPYbCHz40wf28KHc5Lr2R+opS6N+
         IArZSJvEsBlTekeV9WUYrMjBCFZfxpBA22QahmUCvz8agNEcXMjXvAIIJxDn24Wgi/cx
         2nEOoqbapna5vsvAOofNvCgqDU4+fewm9IuM1/QSlt35B7vhgXrz682w/9MQTJFLBRrI
         W96g==
X-Forwarded-Encrypted: i=1; AJvYcCVTD2+tRnJU2TbXa3rNH4dEqjvepEf5FPNu6I3zbywg7QDH3SjiYz/karieLPSKtJuQDmdRx+QjGGVJ@vger.kernel.org, AJvYcCW4zRN9nCt3wkg5k/f0dTDheVbiuq5kwj+xstlczbRD/qWlfY597U3oQK7grXy1H1bzRgEHPNXP+SFU6J0A@vger.kernel.org, AJvYcCX5ZUBUsNo53U+MShl/C9nW6cipXFk/8QV8Et9wC66FN4fCsm0Pw3h0NF3+SlTKdjgCemUGA1OAfod8qjA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyiJwFiORLMb4RK7u3J3JwkDLz4FSMOuuUpnKQ/71YbndWvLGOn
	08QWMhjp1k5YoEMCEKZYQ0tWOoRhVzjQ5qAAXTjDLaRG6TXvQG7B85Pp7DLg6tV/8fK7w6x+Mkz
	ZawYg9AI1RzLNY7AtHkGqdmbLeo0hARij4uGbxu4=
X-Gm-Gg: ASbGncvUQEphcyQLug+BDWa3qzqud7DyXEMzc1qbXs0kP3hNeMAXPYDa12ll4D/xoOR
	M0YVTNRakV2LECX3J7ug19q/YjXjw24paGRIR1s3sZ3eTXGo9GAGWDDtzHro5h7Hxc9QeiUd0rV
	U180RTMNq016NfqL7pL31osRa7pnepVxK9eTSWZKJHCQNk31ZERgJTppZkQhdEzH4Ax2L+0VdIB
	Zcl2mw=
X-Google-Smtp-Source: AGHT+IE4gWHGrDzM+gIuepWweGiJ4ZDUm9b2AlwwsTNYUCehjfNOSMm8AGQeadwx1rgMYmqvFw3rXM+c2FL3U5yCxYM=
X-Received: by 2002:a05:6512:3f22:b0:55b:8849:425d with SMTP id
 2adb3069b0e04-55b884943ddmr1512564e87.38.1753997788977; Thu, 31 Jul 2025
 14:36:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250513-tx2nx-role-switch-v1-1-d92ea1870ea5@gmail.com>
 <CALHNRZ8H66g98ThQKZJAT2UohVNtt6OS=rKd5wtcT1YwBLURqA@mail.gmail.com>
 <CALHNRZ84+KGwioU=7ZOL=O39cR_VSRJBaV42MsA4fymXNJC6+g@mail.gmail.com> <CALHNRZ9zfjV-ZttJd_ydgEaWk7XB+3YPfKGuYXLBL9qA8Exv0g@mail.gmail.com>
In-Reply-To: <CALHNRZ9zfjV-ZttJd_ydgEaWk7XB+3YPfKGuYXLBL9qA8Exv0g@mail.gmail.com>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Thu, 31 Jul 2025 16:36:17 -0500
X-Gm-Features: Ac12FXxq9I_G8y-hwyd40-4DJctpWI_xVFmG2sw5MjV0LHTMkgtYBDm4xwEJz3I
Message-ID: <CALHNRZ-HTFz38xZFsbpG6C3r_xDQTLNOZWPX21TzNPaLyxf6Xw@mail.gmail.com>
Subject: Re: [PATCH] arm64: tegra: Remove otg id gpio from Jetson TX2 NX
To: webgeek1234@gmail.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 14, 2025 at 12:35=E2=80=AFAM Aaron Kling <webgeek1234@gmail.com=
> wrote:
>
> On Mon, Jun 30, 2025 at 2:27=E2=80=AFPM Aaron Kling <webgeek1234@gmail.co=
m> wrote:
> >
> > On Wed, May 28, 2025 at 12:42=E2=80=AFPM Aaron Kling <webgeek1234@gmail=
.com> wrote:
> > >
> > > On Tue, May 13, 2025 at 4:10=E2=80=AFPM Aaron Kling via B4 Relay
> > > <devnull+webgeek1234.gmail.com@kernel.org> wrote:
> > > >
> > > > From: Aaron Kling <webgeek1234@gmail.com>
> > > >
> > > > The p3509 carrier board does not connect the id gpio. Prior to this=
, the
> > > > gpio role switch driver could not detect the mode of the otg port.
> > > >
> > > > Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> > > > ---
> > > >  arch/arm64/boot/dts/nvidia/tegra186-p3509-0000+p3636-0001.dts | 1 =
-
> > > >  1 file changed, 1 deletion(-)
> > > >
> > > > diff --git a/arch/arm64/boot/dts/nvidia/tegra186-p3509-0000+p3636-0=
001.dts b/arch/arm64/boot/dts/nvidia/tegra186-p3509-0000+p3636-0001.dts
> > > > index 26f71651933d1d8ef32bbd1645cac1820bd2e104..81f204e456409df355b=
bcb691ef99b0d0c9d504e 100644
> > > > --- a/arch/arm64/boot/dts/nvidia/tegra186-p3509-0000+p3636-0001.dts
> > > > +++ b/arch/arm64/boot/dts/nvidia/tegra186-p3509-0000+p3636-0001.dts
> > > > @@ -669,7 +669,6 @@ connector {
> > > >                                         vbus-gpios =3D <&gpio
> > > >                                                       TEGRA186_MAIN=
_GPIO(L, 4)
> > > >                                                       GPIO_ACTIVE_L=
OW>;
> > > > -                                       id-gpios =3D <&pmic 0 GPIO_=
ACTIVE_HIGH>;
> > > >                                 };
> > > >                         };
> > > >
> > > >
> > > > ---
> > > > base-commit: 405e6c37c89ef0df2bfc7a988820a3df22dacb1b
> > > > change-id: 20250513-tx2nx-role-switch-37ec55d25189
> > > >
> > > > Best regards,
> > > > --
> > > > Aaron Kling <webgeek1234@gmail.com>
> > > >
> > > >
> > >
> > > Friendly reminder about this patch.
> >
> > Re-reminder about this patch.
>
> Yet another reminder about this patch. It's been over two months
> without a response and many other patches have been pulled in the
> meantime.

Reminder yet again about this patch. It's now been two and a half
months without even an acknowledgement from the maintainers.

This one is getting annoying. What does it take to get a response from
the tegra subsystem maintainers? Does time have to be pre-allocated by
the company to look at patches that aren't from @nvidia.com's? Are
there certain times during a development cycle? When responses happen,
it seems like there's a lot of activity. But then everything goes
silent again for months. I've not seen any pattern to it so far and
it's becoming extremely frustrating.

Aaron
