Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29EA02DAFBA
	for <linux-tegra@vger.kernel.org>; Mon, 20 Oct 2025 19:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760988610; cv=none; b=V+MV3jmST+06CYxqUcS4Bshm+d9UVLvGz9a3oMvCLYuqApMfZiA992WIWfT+SH1x+9HneS+BSXJX2C4KJRma9pmotePZUyQk/XlLA9PnCuQxYPqRryEeQ0SUlKW36yxRI5JPFwyzyFFVrrJskiPV/eDnHZwF928YCCwz0/QR0ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760988610; c=relaxed/simple;
	bh=9GdDL7+3mULH8MsHFnHWRsu7pRMHDK4Pcihd8YMTY1I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KQ3aE4b6EkrOj1eJyP4rFI+Eowd31ALNWHzEBBR+RsMRqzWMbuvNc+VcnFDo03Gvbhl3QAkjOiPPJseyoEVGDcZLgAK9hV+2Pk9S0Zgp9kWd3tVraIhyRYhS6az+fEFFsV2InZ/5kaYn32poZkttiZDi7zPU4jpsCNo+5CrwDww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VblrGhtG; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VblrGhtG"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-57f0aa38aadso6211543e87.2
        for <linux-tegra@vger.kernel.org>; Mon, 20 Oct 2025 12:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760988606; x=1761593406; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NFZNqT2D+DsLVgY6VgSkl2denBx7SAaoL+y9bEiDZII=;
        b=VblrGhtGbfm69ssIpjv2TWOn+ijpOO53JaiJUpKmahR5auwsbMn/07Zs4gIfq9cE9n
         3Gorffv94xvKmBvC0pcwPN26rJJHDZ+VHC33+NVztcH558wuPA+xFXC5HNO+QZy7b6Op
         g4clcf0spNrzrHe4tZLhJaoelyUCL/sHOkOAvts1chcLZAiKLBynq87IzBNxP3Y7N9xl
         jts4h6IXuLKZiqJGj/939urWXzsXhgMYL8ON90xZRfquCDd7TddzOAWe0tcHTPjqM0S/
         4+yRLRxmGFvN5uM8fKz12BzhNTVjK24ksa5zvazSrMaeNfCYZIq82C9Hx5McaBHXrMLO
         wjTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760988606; x=1761593406;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NFZNqT2D+DsLVgY6VgSkl2denBx7SAaoL+y9bEiDZII=;
        b=ttFIDGQUuvmk/FJDuZx/p9jGPHxVc1EAq5Ut95OQOIjWj1slq53ZXQMRxtLglPSkhV
         XAbXTa7dHFBIViHVhp0eRYP2uy9u3lIyEvnigGtY6z6xa/UvBZ2FYve2xEXQPDz8C0oN
         CKKcgO6TA5HmhRBViX3lUWtzQIUGn+2DEpXTdFEVZK3c6cdQFdATgy6i/HfBZ5yjQ5u5
         Y5qQXeVKXGkZac72B1wALmJzHcBeS+BgjlO8BTBehaMDzD5enzX7lPa7fzH+rd4GR5ye
         cVdzpdge0CmRrm0utKQVsmgEezBZI2AV0wXi8Xn+x5/k4gnp+52aAVhiNnSYc5N0PhpQ
         Yltw==
X-Forwarded-Encrypted: i=1; AJvYcCWiYUmJ9hAzuEDQ14yhGjaWBtD8W8f2GdsD6F6TW1bWvXnmlTqCnCOoAWO78PS5qesnkxdeA5h6tNvfAQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxB4It9KVe0U154Vg6wsk4DOcP9TKD6xf1uWlOS5r3n9cJIZWAk
	5qATHodyWZk9p2q/BZi+2/ENxIav6CHZLD9MK3A9oDjLcmLs2H2ErpkcjFNM2ISiHs6VUh7GOWw
	TNMYgOmoSAK81HJwOB4yoKdECQmewAI0=
X-Gm-Gg: ASbGnctyUfc2yZNJ0qHsRTXOMd5m603ZUY57Aw3dbc4J4pUHuRkLvCWNAmySaCqVJ88
	Cv4BSbLUuU4/eh55M+25dtiiuhyOvPpThO2O1Aa6jkqaL4w3uepRro8iLn3g74ef4JbzQsBNMWH
	hCB+mmXZsKXmOnxCFD1tU58uFJ+OoUzyAXnhxeHv3EJR5tU7yJA0LW20o2Vuyh9sP2TEOqGZJ8k
	u2eRLwwA/H0rBhihKqP4k83tesKNulwbc7a53xNEsiyRWbFTuiwJZ7rJIoZUDJi6kFdz/X/x6bJ
	AHR/MinPOmh4oTPLeA==
X-Google-Smtp-Source: AGHT+IH8pJ/l725F7jpzit86CNm+iBx7HYI5g7kErnw7UkpgGPy+kn1LJM6uau/6mX+yCgesQsO7k/FLWd0sn0ytGhY=
X-Received: by 2002:a05:6512:682:b0:583:ac7e:4e1a with SMTP id
 2adb3069b0e04-591d8502b29mr4582945e87.23.1760988606107; Mon, 20 Oct 2025
 12:30:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250526-p3450-otg-v1-1-acb80ca2dc63@gmail.com>
 <CALHNRZ-pE4EA=x-7LuJev60=aOwGt2eDf9mGVHWJ8SPGisBchg@mail.gmail.com>
 <CALHNRZ_W6gQknMr=eKEcB6-k5HBBkE6JfJ9LFntX9L+NTo5hUQ@mail.gmail.com> <iiooyryqjbfutvyycrk4wxgkhow42bnks7ndkkqy2zujv47bly@2f3sgagl6yte>
In-Reply-To: <iiooyryqjbfutvyycrk4wxgkhow42bnks7ndkkqy2zujv47bly@2f3sgagl6yte>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Mon, 20 Oct 2025 14:29:53 -0500
X-Gm-Features: AS18NWBRKorxOsoZ_E9SDZMzdQeGC1t6Wb2mP6Y3s6-jRK4cbkxihFxXMR8bUok
Message-ID: <CALHNRZ9OTfYqKzP4Dk80q8bFY8ZWF1=bTCBPRuVNJKGNe-L=hQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: tegra: Set usb micro-b port to otg mode on P3450
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 1, 2025 at 4:41=E2=80=AFAM Thierry Reding <thierry.reding@gmail=
.com> wrote:
>
> On Thu, Jul 31, 2025 at 04:40:05PM -0500, Aaron Kling wrote:
> > On Mon, Jun 30, 2025 at 2:35=E2=80=AFPM Aaron Kling <webgeek1234@gmail.=
com> wrote:
> > >
> > > On Mon, May 26, 2025 at 8:22=E2=80=AFPM Aaron Kling via B4 Relay
> > > <devnull+webgeek1234.gmail.com@kernel.org> wrote:
> > > >
> > > > From: Aaron Kling <webgeek1234@gmail.com>
> > > >
> > > > The usb micro-b port on p3450 is capable of otg and doesn't need
> > > > hardcoded to peripheral. No other supported tegra device is set up =
like
> > > > this, so align for consistency.
> > > >
> > > > Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> > > > ---
> > > >  arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts b/a=
rch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
> > > > index 0ecdd7243b2eb1abba9adbe9a404b226c29b85ef..019484a271c396edc30=
200e8592c713455a8e1a4 100644
> > > > --- a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
> > > > +++ b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
> > > > @@ -514,7 +514,7 @@ pcie-6 {
> > > >                 ports {
> > > >                         usb2-0 {
> > > >                                 status =3D "okay";
> > > > -                               mode =3D "peripheral";
> > > > +                               mode =3D "otg";
> > > >                                 usb-role-switch;
> > > >
> > > >                                 vbus-supply =3D <&vdd_5v0_usb>;
> > > >
> > > > ---
> > > > base-commit: 405e6c37c89ef0df2bfc7a988820a3df22dacb1b
> > > > change-id: 20250513-p3450-otg-b947f31843d8
> > > >
> > > > Best regards,
> > > > --
> > > > Aaron Kling <webgeek1234@gmail.com>
> > >
> > > Friendly reminder about this patch.
> >
> > Re-reminder about this patch.
>
> Sorry for missing this earlier. We're in the middle of the merge window
> now, so I can't apply this to a tree that feeds into linux-next, but I
> will pick it up once the merge window closes.

Reminder to pick up this patch.

Aaron
