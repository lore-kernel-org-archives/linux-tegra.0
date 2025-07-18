Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DC3D29824E;
	Fri, 18 Jul 2025 09:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752830782; cv=none; b=FKG2mMO0Zp3meWVigMbcNEo1p9cVniNbq5bQc/3m4MrJiB1rGiJwVfnQrKD/u0fX3yi6vBxMN45wb0F0GBhkA041lgCyaAS0OUVA8kelri7KKSS3Js6QwkQXrKL6VF0Qw7O2A2lcv7eqyN/E+Tr6JgGt1RLqejlxPumlpnR5SGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752830782; c=relaxed/simple;
	bh=fuvT3v3Xzq0r7FVfwU3PziQOx7mb046oNzfhheqrsHU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gBZ/m2TcbJRD2T0BR0VZrfV1POWaE8oWCI5/r/0U6lIiPc4I0ZzEEHrh/jwff/tA2ECuagJ+W01myE5iKGNZPEu3k3NkTlP8huXliwqMu/jHe9/9baexkQlA9TiYFEVvNqjJxYRqSXbjnh8iu8oosaGwfXwAO4gZlHdzbuLOLsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CVwtCmkb; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CVwtCmkb"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3a6e2d85705so916340f8f.0;
        Fri, 18 Jul 2025 02:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752830778; x=1753435578; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YgExZNhP/TQ7TZbqz2PLAB+ZQROoSd4CHB0RnRy8pHo=;
        b=CVwtCmkb27Rfm1uab7y37Y5gZalhcnUNOcvUZgMUAuKc5EZA2xchunlF7lz3rVMGAJ
         oVrkshVTYwxthIy3UkOPQxKYP2WTko02xjeHgNMUAL374zWaoDn/t9jU6D/oC/TGaMn+
         YhMzvGKFoxotX7Bzl6dAJCV2MaG+44PdrHz2iGwOgLsGk8hDO9bHhR6pUx1H/+noiXyf
         Y5UNyL2AgvWKaMhKHVuTDVqtP+yWZN/kL416FPngMx9Zm9c2pRbHtCBi4Paq23yinITX
         sziKMm6O/hZe/8Nu96RTil0CazoU37X7wqnyXRecWso4hnjWd0OermEsESTLTYYmLAdO
         jHxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752830778; x=1753435578;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YgExZNhP/TQ7TZbqz2PLAB+ZQROoSd4CHB0RnRy8pHo=;
        b=iof8/WBIDhN0kVjDrtbkQ1GdbjGAdkkHEPDMoCruM0wiOvwnGPofOa+hOg+6/By5Ab
         UZyWrZGfIDwZYEpTw7B/PnG0vDoze6UL6MgwSSn4ANsE7vhZVdnyua1IStErouzv1BbJ
         /f/fHEoV7eIPNNmeHmUclPAapKQN2yePW17ujof6GedgPrkU92J3rpaLK3aOcPaXNpvm
         kGbH5qUyVD4ofrBALlChdWX+zFrHxlorjW3uIrpSwE00WKG5j/EXrQXeClugmaMK7PA8
         bBTda+1MaQcBW7tu4kPdsMZuzGAfsHecrS/WDXWYYxQLZvO5puOCFP08elE9EqZUbJT3
         rAFw==
X-Forwarded-Encrypted: i=1; AJvYcCUNWgm7eBPjGXSk+smHyEMAW5yRq28h2IZTirSsUqLxzLHgRD9ZINwrAlEkuS8Y5OOyD03M4p6WV8pH@vger.kernel.org, AJvYcCWDcx48WH/TakvvqrEx3VSIdRyDlcB+Ms2YZkG3a0LCi8Z+yGc2zr1RU4iVtwFH9A1qulEKZThCnZOZ@vger.kernel.org, AJvYcCWzyFdx/VYXstZIC88RDIhCGmtSuRR5zO3iX+krxGXW8T9mWa7JUtIuHtrjGcq2QaMZcPCaSb7ccmo0IWJl@vger.kernel.org, AJvYcCXAXa/JBqU6O7cCBXQk53/tDfmJIo0HPz37lFcfdHlJ+QXl3fjs0M/DTvpWTdVm3sCnIWoY01ppZokIIlU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1f2tYm6CvTerCDfNwfkAx/AWB+jj98yCihLvyvtkfrUibyud7
	SOlpWhebrrbRimv3INp/7iJWmwgxK0z7/mu76+YVm0apa/yz3MImrYqhxszi/WJQpgX6gBxKkT7
	Pha+TshizRAXbKBhVzYJPa73b8BFtOilbmw==
X-Gm-Gg: ASbGncuYkg0v/sMNCegzt75xGclqlS/REmniFZqMVDq7JMrhM2wd9kACCpQGeRvo+t3
	RKOz+8OjCT1EmKoqSerzRY446QjLumEaZMLyIMxPAAUdRFPrqnzYecQptTgWTAudfj9yRF61ELy
	f7fDXWJtSl0LilXWHpfSahRCtVF0RptEAZyk8hyfn0ZeMscCe7zZluMgXPFA6ue4eXZu9koIUPp
	li/EvXWiTQ4k2I9EJg=
X-Google-Smtp-Source: AGHT+IE0CZJqfMmd1YFPzJ7hCnSvHejeMeUg8VdqfZngXzMLICt2zU9gwaqmpvwTh2mK2YmmXBgGxVRTXD7xj0ov0CE=
X-Received: by 2002:a05:6000:4305:b0:3a4:d0dc:184d with SMTP id
 ffacd0b85a97d-3b60dd95c4dmr8894808f8f.27.1752830778095; Fri, 18 Jul 2025
 02:26:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250717142139.57621-1-clamor95@gmail.com> <4191623.PYKUYFuaPT@senjougahara>
 <CAPVz0n3W1yhrOsiYmYecxtPeYdZiK2_UY7vVc2tiYbYwfWPp7g@mail.gmail.com> <26197475.6Emhk5qWAg@senjougahara>
In-Reply-To: <26197475.6Emhk5qWAg@senjougahara>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Fri, 18 Jul 2025 12:26:06 +0300
X-Gm-Features: Ac12FXyATAxMwj6Lv9_7Hfs3i1vL0RU41Y-t1rhajaPZ2VFDLW-nCMuPkMpGoxs
Message-ID: <CAPVz0n1f=bAHqZiF3yMGS2T5Bg6C=CbJbLCGQMGfiAqK1YVzFg@mail.gmail.com>
Subject: Re: [PATCH v1 5/5] ARM: tegra: add MIPI calibration binding for Tegra20/Tegra30
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Thierry Reding <treding@nvidia.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Dmitry Osipenko <digetx@gmail.com>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D1=82, 18 =D0=BB=D0=B8=D0=BF. 2025=E2=80=AF=D1=80. =D0=BE 12:22 Mikk=
o Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Friday, July 18, 2025 6:15=E2=80=AFPM Svyatoslav Ryhel wrote:
> > =D0=BF=D1=82, 18 =D0=BB=D0=B8=D0=BF. 2025=E2=80=AF=D1=80. =D0=BE 12:01 =
Mikko Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
> > > On Thursday, July 17, 2025 11:21=E2=80=AFPM Svyatoslav Ryhel wrote:
> > > > Add MIPI calibration device node for Tegra20 and Tegra30.
> > > >
> > > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > > ---
> > > >
> > > >  arch/arm/boot/dts/nvidia/tegra20.dtsi | 14 ++++++++++++++
> > > >  arch/arm/boot/dts/nvidia/tegra30.dtsi | 18 ++++++++++++++++++
> > > >  2 files changed, 32 insertions(+)
> > > >
> > > > diff --git a/arch/arm/boot/dts/nvidia/tegra20.dtsi
> > > > b/arch/arm/boot/dts/nvidia/tegra20.dtsi index 92d422f83ea4..5212610=
45cc8
> > > > 100644
> > > > --- a/arch/arm/boot/dts/nvidia/tegra20.dtsi
> > > > +++ b/arch/arm/boot/dts/nvidia/tegra20.dtsi
> > > > @@ -74,6 +74,16 @@ vi@54080000 {
> > > >
> > > >                       status =3D "disabled";
> > > >
> > > >               };
> > > >
> > > > +             /* DSI MIPI calibration logic is a part of VI/CSI */
> > > > +             mipi: mipi@54080220 {
> > > > +                     compatible =3D "nvidia,tegra20-mipi";
> > > > +                     reg =3D <0x54080220 0x100>;
> > > > +                     clocks =3D <&tegra_car TEGRA20_CLK_VI>,
> > > > +                              <&tegra_car TEGRA20_CLK_CSI>;
> > > > +                     clock-names =3D "vi", "csi";
> > > > +                     #nvidia,mipi-calibrate-cells =3D <1>;
> > > > +             };
> > > > +
> > >
> > > As you say in the comment, MIPI calibration on Tegra20/30 is part of
> > > VI/CSI. We can't add a "mipi" device here since such a device doesn't
> > > exist in the hardware hierarchy. We already have the VI device in the
> > > device tree, so we need to use that.
> >
> > I understand your point, but embedding MIPI calibration logic into
> > VI/CSI driver will bring up another lever of unnecessary complexity
> > and excessive coding. While approach I have proposed preserves
> > separation between CSI and DSI and reuses already existing MIPI
> > calibration framework.
>
> We can consider different driver architectures to simplify things, but th=
e
> device tree has to conform to hardware. The host1x bus has no 'mipi' devi=
ce on
> it so we can't put one in the device tree.
>

I assume then placing mipi node as CSI or VI child would resolve your conce=
rn?

> >
> > > A driver for tegra20-vi already exists in
> > > staging/drivers/media/tegra-video. We should aim not to break it. Per=
haps
> > > bring it out of staging? (At least partially, but then why not the wh=
ole
> > > thing.)
> >
> > It does not break VI/CSI, I have a WIP CSI implementation for
> > Tegra20/Tegra30 which I hope to submit soon.
>
> We have to use the tegra20-vi node as that matches hardware, and each nod=
e can
> only be probed to one device, hence the issue.
>
> Great to see a CSI driver!
>
> Mikko
>
> >
> > > Thanks,
> > > Mikko
>
>
>
>
