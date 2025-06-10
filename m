Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09C25231825;
	Tue, 10 Jun 2025 19:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749584768; cv=none; b=gL3ci17nmSRzXMz48jKgEyT+qFCAEcXiUM3qLSGmqZxUPJDFo4lYCBWjTN0mHZNoyn0FvVOtcMrkNSL0dRerqjliH/DfMZ9SHeipLGJz1Xg8gPcwyARLLxeXENPku4y5abo2YhtHfhImR0wNKs1BMNgobgsZf46HulAH8FPIHZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749584768; c=relaxed/simple;
	bh=MlhC2eUR9T5ZDy8Hq9UXIQDmxXquLUCFYProdGdTwmY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JsKOuyMHOQ1z68Fqe8H4kL/7cYd/yoHAzxi1HdGm4bXgH6tMo3nkMr40Sqn1kZc61agDEfAXJDhSXipQGi9VbKr+KDGhLnoJvUxUH5KkVKsRB5J+8rdgMuBhFDIUr+igQ4oaQlbcHqJPBoRN5hGNhLIK7VGggd6W2fLTGhJ7ST8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=btmddYSJ; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="btmddYSJ"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-55394ee39dfso206970e87.1;
        Tue, 10 Jun 2025 12:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749584765; x=1750189565; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h7d2zwV13mZwbJfRsYCYVB+Fv52C8hnCVNOVCOsCM0s=;
        b=btmddYSJUF3qjXOtGY08lkMoKk++ulffpHkBhsFuvoKloHnEa+a3zgRJ4Wmxkxq5kM
         EqavzsV0lGZu82I3yf7IO24+CxqjTNcLgzco8Kp1kOdfaLEsh0l/1U+xuqVtIOMuZg7H
         i5utMBCQiHExsuIqdRbSZ4JKxeaNEggVmYfANGMd82IzX9C6NWgYbmq/VRdMtr05pPiu
         NGLXTyFKA66dgO4BTS3DxlYENpZa0SdaueX2Mnn077T117XqA5NquBtaiSTDFNDz40Qx
         VyNKhg2fShmWipxnSsO6j2r2SNIOtCNXm69vQbG3BoQ42DtC8MprxShdO/i4GaI6F5Wq
         9WSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749584765; x=1750189565;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h7d2zwV13mZwbJfRsYCYVB+Fv52C8hnCVNOVCOsCM0s=;
        b=GsjTE/tXM+k3UWtiq2390vojLFqEqfEit9UuZ7JO5aphtZDHkOxwC3VIGIgzKsi0xu
         SrDMRg8aXfN1JVD3aDYVFUTUYNZHfAOX75NOx6Qj9rG6wkr54gYhrzXyuEQFmL8cVKd8
         gLboxqxLsyv4gQVRHtLdUupDKk6Lvvl/u8C/Bq2/mfQIJSfztHd7ihvz5htPyuace7ro
         Xo2r6KiQITGwcel1zJ4JEFMYpqs9hlx4sAy9oGjRESvkG1KFqmtsbAak1wbsAAxqbg8n
         pxbWhjo6LnKtEMQclHRamnznw17eWrrERwL2DcWmoitgKrlpLn0VLb4mKqnzS6iWssTz
         y9yg==
X-Forwarded-Encrypted: i=1; AJvYcCU0IS7YWwAeBgd6h77v/r8KWptaQY499qvXO20cuSy88z6FdTsMki3pdz/i/3GmkjAPpx+X29mbLAbvpFQw@vger.kernel.org, AJvYcCVlMSssGLk99f0XePkPVIr3XCRr7G3El0blXr1l5hQ1JgZcN/AoE3muCpFAoAsoiiFdj98g54kAKXh2@vger.kernel.org, AJvYcCX/lwo3NVk7QYppnQBMm9zan95ftzR3IMT8yivMJEehScFruvoInNqTUQFGMU77sqHbCxPDyaLWdylrUqA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxWlVN82UbnvtqObStVhypUTYx3w3ZWnKerYYTiEg8OtCA000BM
	MgU7xFO/wgBaTFsAC+nR+GJr2QBM1euP74Fk7OPntPgCNCdTdQT7rRm4BWQp0tljUsACshuwqAe
	9G1VasR/6yBCt1PmCjBbAZQrElnqqtKc=
X-Gm-Gg: ASbGnctDA1FPkw4o/KwDI1+Px5CeVo7G4/ycmJj9nEKOzni7pChIwspCKl/ZS1X0RIR
	il5bI7+wVONJJ4HR+SxB/sKzbHqFeQ1bA15/Aw32TEPlPD/MgurrO/nzjjgneT1p8poKWxZPFcF
	9+TwHQ5UC1V8ayucPbWdZcymIzAdCV2S20DjDxx9vLuEY=
X-Google-Smtp-Source: AGHT+IG93WnlUmn0s43lKmno1qOb+bY4OJMGNUjKkCwZDPSYuZq8K1jeQQtHlWJ7Ili3COajdeiCZTLO7bMiTAr744I=
X-Received: by 2002:a05:6512:3da6:b0:551:eb1b:f41d with SMTP id
 2adb3069b0e04-5539c63ab46mr184493e87.27.1749584764753; Tue, 10 Jun 2025
 12:46:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250608-p3452-v1-0-4c2c1d7e4310@gmail.com> <CALHNRZ_Zo6w2KgRTEPcJuZi93bOqQD4Spzr4+YfqnxJZVnUPsw@mail.gmail.com>
 <tx7zodgijgip7jhaxookffpa6g6wdnbbl75mz46aff5ch524iv@ky3ltt35amon>
In-Reply-To: <tx7zodgijgip7jhaxookffpa6g6wdnbbl75mz46aff5ch524iv@ky3ltt35amon>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Tue, 10 Jun 2025 14:45:53 -0500
X-Gm-Features: AX0GCFsRCa07gfZ5viXJlY85atjYkd6SCdNePBbBa11S2Ng8UXGJD2PD6UOcKfo
Message-ID: <CALHNRZ9Opg92SfMWHAJjDBwwnYG1BwW2qhscok=Sm+GacG1W9g@mail.gmail.com>
Subject: Re: [PATCH RFC 0/2] arm64: tegra: Add NVIDIA Jetson Nano 2GB
 Developer Kit support
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 10, 2025 at 4:15=E2=80=AFAM Thierry Reding <thierry.reding@gmai=
l.com> wrote:
>
> On Sun, Jun 08, 2025 at 11:25:53PM -0500, Aaron Kling wrote:
> > On Sun, Jun 8, 2025 at 11:24=E2=80=AFPM Aaron Kling via B4 Relay
> > <devnull+webgeek1234.gmail.com@kernel.org> wrote:
> > >
> > > Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> > > ---
> > > Aaron Kling (2):
> > >       dt-bindings: arm: tegra: Document Jetson Nano Devkits
> > >       arm64: tegra: Add NVIDIA Jetson Nano 2GB Developer Kit support
> > >
> > >  Documentation/devicetree/bindings/arm/tegra.yaml   |  5 +++
> > >  arch/arm64/boot/dts/nvidia/Makefile                |  2 +
> > >  arch/arm64/boot/dts/nvidia/tegra210-p3541-0000.dts | 43 ++++++++++++=
++++++++++
> > >  3 files changed, 50 insertions(+)
> > > ---
> > > base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
> > > change-id: 20250513-p3452-059708ca9993
> > >
> > > Best regards,
> > > --
> > > Aaron Kling <webgeek1234@gmail.com>
> >
> > This is sent as an RFC, because it doesn't fully work. In my tests,
> > this boots and everything I can see works, except for hdmi. The
> > hotplug detect pin never changes, regardless of hdmi plug state. This
> > works as expected on the downstream 4.9 kernel. Based on the
> > downstream kernel dt for p3541, it's almost identical to p3540, and
> > I've mirrored those differences in this series. Things like the hpd
> > pin are the same. I'm failing to see why hpd would work on p3450, but
> > not on p3541, when using the same boot stack. Does anyone know why
> > this doesn't work?
>
> My recollection is that the HPD pin essentially loops back the +5V pin,
> so that would be my prime suspect. Other than that I suppose it could be
> a pinmux issue where HPD is muxed as something else.

This got me looking at which regulators got removed from the power
tree in my changes and it looks like the 3v3 usb hub one is the
operable difference. If I do the following in the new p3541 dts, hpd
works. This supply is not used downstream in p3541 for usb and is
instead replaced with a 5v0 regulator tied to gpio pi2. While looking
into this, I see that I got the usb power tree mapping wrong in v1 and
am fixing for v2.

+       /* This supply is associated with hdmi hotplug and needs to remain =
on */
+       regulator-vdd-hub-3v3 {
+               regulator-always-on;
+       };

This seems like a kludge, though. The implication is that whatever
gpio pa6 is wired to for p3541 is related to hpd somehow. I'm not sure
if the rail / wiring is different from p3450. Seems like it would have
to be. Any thoughts on this, Thierry? Maybe a better way to map the
dependency?

Sincerely,
Aaron
