Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FA79213E89;
	Thu, 31 Jul 2025 21:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753998025; cv=none; b=n3WSHXW1G3gbFp4HOcG+vYLRg1DMKSZCJ8x2S9PzIZVFpTsi7F9mtNY4EZrrfcNafQwkyxMpk/w+rneYgkvThChllzbcmR4lZrG8vj9zCYWGAYLzN46BDecGDozFXKInsgJoaHgcV5NKw8ItkD9IEol53AZheUJmy4vUrhQ/zxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753998025; c=relaxed/simple;
	bh=g9C7f4/NamjEq9bbxW2RtwQtfUwkLaMh38JA8Z+lWME=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qbOW472wwcdXRy0EJgBdCPnFCG7CMZsIbBq1wYNmgxkI/NsUgoWF8K9BGpR5dRC8ZjlEKjfQajtcKkvGijCMl6ksSm4cNxKAlr72cu4+wT9RMl+dIbff5hRLcIe+A0eWnNj2Y7Z2VWmL0G7aiu/d4Dddemn85kr7ni/uqhJXMBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OHx4qHE1; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OHx4qHE1"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3322fef6d72so7547851fa.0;
        Thu, 31 Jul 2025 14:40:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753998021; x=1754602821; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8QtGhZs2srmlQhaTfv88KdFGJoQGcdL3FTrplLzIh9o=;
        b=OHx4qHE1Ff9+JIEI5MmjvSH6JjZCGeYO2sIF87s8E4LKaxjtPff2FDs2bbjpbf7TmQ
         eht5bZI8NIiQoEjKq46BjY6Pw+Qn0f1qk4CGvRxA1UYn4lp72Y71dCwLFWc7IDeyLQK+
         gZHgKTMl05dpYobDHP5SCJkWC6JqTVLsnCmzZ4eLOUMtXKWdrGJ8yoKYlZODWGlf2F9Y
         xFAGnH6p+SG6Zxe/lN1jlw21jYU/n3vPgH6iRJrYxBGSSvjvXc/vQcDECMRrAOSIfUlw
         mDLlGYoLzytMAOIlKfB5WYCTfsVX6dcunI+N35ggILnSwvz3Fy8mX3tUhLkdZzCyYkBq
         2JOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753998021; x=1754602821;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8QtGhZs2srmlQhaTfv88KdFGJoQGcdL3FTrplLzIh9o=;
        b=dpLljWi/Rv+gQHzW3BE47dnP8wouh3xAC/W3IYpGs1JCyPD+jhpC50VWndLzz7QxNK
         8JVpePgBYxQHc4A0TcG1YbbeW2I3xpccKMeyGAjOksso0HDKbQbq2tRz9cTZQo8XaUTr
         stkhdas8M8fa/lSZoc+9608gYpcbehNUOLtRXRSOu28sscVn6dOWDWFTDeYqtgKQoDck
         gIZl/eyTP++sxFLj+vxPyGL48YoWg9L1DTqbWEQeqJYZIGjSzTbHH4xDgPcTCWbjruxN
         Bm7TgSNlq2tsr76s+VnQ4o9ji2z8GBhEx6N6PHaw2/4QWKXkZkYZmBvZD08HmVt8vmID
         00Gg==
X-Forwarded-Encrypted: i=1; AJvYcCU9zER31d/kaUoAylPNHsePw5qhU5/ZtZQVPDkR7NaSNG8V6jlIHCAHPRCaft0IsfYueG+1fk3BHDM/DdSd@vger.kernel.org, AJvYcCWkirMhJP7vPuCVn1mZuvHO8vKNX+heVBA3jdp7030yConPEUHibRbXTR+AZXIB3xktycPP6MsoOn1w@vger.kernel.org, AJvYcCXzflG9/elwcOQOVKklOTFuCaoTurc6xfZmZTLTaCWXwzp46KG0WQVWHqqfm+RSChfsIslBjeYJcCNTsjw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9VfTV7xpKlvnxJHTTaahH7tEokGk7k7IPgxwdoigy9pPn+g68
	x6LVQy6YD6tm3YC7OeFxLWVEKtldQ/OHt0k0qzKRWsdgOq/i+0ytnsIgclWGejK+532ESY62EyA
	k+svZWiAzuLwrN/bG+1Ifrk/IyhjQ/VCnIgHoTt8=
X-Gm-Gg: ASbGnctLtC2F0cuTGmtrsGJSYJr+cICPh39ySdiEDAy8yiVBl20B5AX6DHCZuVMBrNr
	X4BoADrlh8W0TKYPpUW8Lq1x9jkvP5e/ZAOaX9YEIMldustN72xa+t8hIE2oSL9sgPvNGwgUyxH
	Nv4xBeRUNpUzD6tG2VSibvbBUNz9F4SZ1xzYRzTpYrdjrxNbG/MUgAA4CxGqOW0o2pPLuhvm5H8
	0sAY4Q=
X-Google-Smtp-Source: AGHT+IElN+FIpsd2J0WRiDT4CWwAotPcep9zR7TyWwQz36spG9/MrdE91/BSM58CI35VCr+PcKXhAcaNn7z8pOYaM78=
X-Received: by 2002:a05:6512:15a3:b0:553:263d:ab90 with SMTP id
 2adb3069b0e04-55b7c0041f2mr2769883e87.18.1753998021253; Thu, 31 Jul 2025
 14:40:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250526-p3450-otg-v1-1-acb80ca2dc63@gmail.com> <CALHNRZ-pE4EA=x-7LuJev60=aOwGt2eDf9mGVHWJ8SPGisBchg@mail.gmail.com>
In-Reply-To: <CALHNRZ-pE4EA=x-7LuJev60=aOwGt2eDf9mGVHWJ8SPGisBchg@mail.gmail.com>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Thu, 31 Jul 2025 16:40:05 -0500
X-Gm-Features: Ac12FXw56s_NT2GacikX5J5EJ6FNZ9rvz6qR61PvGkrAr-Xj1IEPIZhEqHbqCfQ
Message-ID: <CALHNRZ_W6gQknMr=eKEcB6-k5HBBkE6JfJ9LFntX9L+NTo5hUQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: tegra: Set usb micro-b port to otg mode on P3450
To: webgeek1234@gmail.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 30, 2025 at 2:35=E2=80=AFPM Aaron Kling <webgeek1234@gmail.com>=
 wrote:
>
> On Mon, May 26, 2025 at 8:22=E2=80=AFPM Aaron Kling via B4 Relay
> <devnull+webgeek1234.gmail.com@kernel.org> wrote:
> >
> > From: Aaron Kling <webgeek1234@gmail.com>
> >
> > The usb micro-b port on p3450 is capable of otg and doesn't need
> > hardcoded to peripheral. No other supported tegra device is set up like
> > this, so align for consistency.
> >
> > Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> > ---
> >  arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts b/arch/=
arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
> > index 0ecdd7243b2eb1abba9adbe9a404b226c29b85ef..019484a271c396edc30200e=
8592c713455a8e1a4 100644
> > --- a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
> > +++ b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
> > @@ -514,7 +514,7 @@ pcie-6 {
> >                 ports {
> >                         usb2-0 {
> >                                 status =3D "okay";
> > -                               mode =3D "peripheral";
> > +                               mode =3D "otg";
> >                                 usb-role-switch;
> >
> >                                 vbus-supply =3D <&vdd_5v0_usb>;
> >
> > ---
> > base-commit: 405e6c37c89ef0df2bfc7a988820a3df22dacb1b
> > change-id: 20250513-p3450-otg-b947f31843d8
> >
> > Best regards,
> > --
> > Aaron Kling <webgeek1234@gmail.com>
>
> Friendly reminder about this patch.

Re-reminder about this patch.

Aaron
