Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFD25400E04
	for <linux-tegra@vger.kernel.org>; Tue, 19 May 2026 16:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779209339; cv=pass; b=Cx/UuEoykPu7VEFArzf6pftt6b6Z0A5r26glnPw63Q2II0VbtDkRC3pyTxk2OE55pi5L0s7mlrMaV8yDv3gsz0u1y2sTZ5twn3GOXFUS3S1bO86+BZH6/EATAsonPcCnwYrQZlnyBTaHW5C8qcuKl6NsjuJCzUJvsI3Wpm90RFg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779209339; c=relaxed/simple;
	bh=oH9Nrh5PMk8EWsTbmczz+vb5WQ2yNIkfnpOjRyzWjGA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z0ZM/t8VXM/2UtHxVN1q+hPKxctX2Q4oKqiWQ+rSFw8+TO38TJkwWM9qcOW+s76f7ezU1NnW05hdGrWATeAOqPzxuopwcV5dlExElPHf3Z9K4pwWMHaIiFVOnbjPABUDy78EtKYOa2VnipgwfbjANpsQmCJ5Kw87UhrfSV0YoVE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gLVtO780; arc=pass smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gLVtO780"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-393800f638bso30852991fa.1
        for <linux-tegra@vger.kernel.org>; Tue, 19 May 2026 09:48:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779209336; cv=none;
        d=google.com; s=arc-20240605;
        b=YtVuwb/RFTkvnyaIWOxQaFhHp5zHSXL/KCef5UCelWSKld/kyzDMwXxijXPIVWghGs
         pkvffXGk29pT3gDhHiQbOwbXurfsEAJDbkHIXI/iRXrrU7zOs8iilO1R2EWJLFeFp3uw
         AGVpmiQZlCkMa+mDY4Qy5pgPwV3Ep/YXrS4JEIuGNvxXQcLKg3ZNrxWq9+JvbeFKTSHr
         w4fZO6SbO6h/9iMoR/IiDWrI4Y2/i+jFJ3Leazl+j9dhuX6WJcamfENSMdPFFFrDafn0
         6Rqr3m2OiexIWQY4MUnVNHptxYuiiP+q7FbA2L73ZKlqQrinK4eChJeLp/yDsgmwIIsy
         M1DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=11HZunJH70CHsRXR3sppB58SVfwXvxQdgkcAB3E60NY=;
        fh=N4EHWu5vQVbA/hsxyxSTdMg/lut3heOKfSIqeaYG9c0=;
        b=II31sjsWvOZWvqD4bov21tYyJe2YvEvfP8lzdB4rSEX3Lik0NnyiTijL4K3shCm1F4
         BYtUW/ATPa5897MVmooAJ3GqKHvv43T9osUft4P8VerTGufUQ21CBrFd5TxF+ZskIPKM
         g4AzveEGTy/n0uI8v9CDWUj+omRwP5+tMQ6oG61ojBb/qrYU7WfkTxZEuQZ+EyWHK5Zy
         W0p0xVKuevKLY1jZ7lM5Ig9g+DrVWk4hn7JRYJzGEBlzUiGx+SbkliaYAAXRT1ozqeD5
         hdfYe52KegQR3SkKZ2HOf4ftTI/arnur+sd9qkowpbj7dHckZwlc67x5deMAJjemub2T
         k+Rw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779209336; x=1779814136; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=11HZunJH70CHsRXR3sppB58SVfwXvxQdgkcAB3E60NY=;
        b=gLVtO780K47SFspwGpqSc7Hn+QCwa47HcFq9d5Fs2eigtexzUDgZp69UV7YJpNLLmm
         4yjJKMJFBW4droeX6NihF1HnMZFhcSf8AW2S3UysJIQsIUZqTyjIqG2TqOViDSIE47nL
         y9jQbQPl6jlBE5YMZcp8BpzHuqjDCr8msZcPIdSJZWWMqtWFwSs8nmh7/hhZjQKSeclu
         LfOTEuSb5WEdb9R04BdXXdvF6CeuxqTkUvLIqS55cV8DX/7pozi32y8Uo1Spfvyy0oYr
         QMmS39yXl0xLcgb6RfajpccClgzVYEr4NFdruagWCBfaW7Ncp5mg2VKbAtQznRBI+qoV
         eI3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779209336; x=1779814136;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=11HZunJH70CHsRXR3sppB58SVfwXvxQdgkcAB3E60NY=;
        b=HArKQ4MmpmnPuBWeIDENIaGBSKRmwQYatpyr8qH2gGZhMCzdSyYX7ua95ypnNL9ty0
         /eexmRmiilPOSBjmzOcxzVEg0tjMd6oA42bRZx2fE8i3lsx3J4fwnq371VL4WIvAQ6Vd
         eORzc9kNn1K2BZnv9aIYva+6rohKQSTclQg6295fbKexqmM+btdtyZ5BGOb7P0JMI759
         AARFUnmURSCboxtpx78cXBJD7QXF5NP7NziZU8wFSmfg0MFt/B9B9A6WXgVuDo8FppuN
         wOSHHWNajiF5JU5xS0opaiJQY/5ZlEe+3p7kdjxZIXDKUguUAMhY6X0jTh1gknz6c3om
         y4WQ==
X-Forwarded-Encrypted: i=1; AFNElJ8ExKGGCwJ/ZkhfrlR6tKxr40OrX4yJ/yOoSVYBnoFdBOFIo9nRE4rx26wxQ8aClDc0/klYjryysWKnhw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzXIGUtvzffrp2FyBn87CUMM5rf5YYSkos7UK0hviGlhKsuAenl
	kw5uhlGeZO+oPIbsUwji+6gOgxLRFcAVjL0tJoxGuxsSDdsp4PM+1UjAZ3LmxnO4S2DHWnuxtcJ
	Uj0cnsxqvtG2nHPAqVvHCGAmiqA/atDw=
X-Gm-Gg: Acq92OFuURNbFqqaaaYPhLHVpI0KHvqh4o3LSp/MG8GlHcsGd71vsSP9p3j3+YTwbxX
	cNUsvHn854TwQd6bXtGSxWyGL29q0Okbc59RBi/EOgRW29ndRUDx2xd50Whtoo86OTE+NdysgZg
	ZUqMk89L4tr8wUnh8akiwUnpS4uUiDPOr/rNOCSkN9AE9fIu37AtwLEpym1ScdmsY6+OOeetN8a
	M9Q0oUABaQmgM+94qzBvW23ot1axcZNWN1ai0c7EIJBqKZH0e+kDP1vfKSC92jh/85oPxOxU9g0
	tCcTOLrGjB23+IXGR6Q6MZQGU689kLaG/4u5AUA7S0i46UfU8jEsd9qAiZwxLmvQzYzB
X-Received: by 2002:a05:651c:3252:b0:393:cdbb:2253 with SMTP id
 38308e7fff4ca-39561adf7e7mr61614631fa.5.1779209335774; Tue, 19 May 2026
 09:48:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260515-tegra194-qspi-iommu-v1-0-57dfb63cd3d6@gmail.com>
 <d10a46b8-2a01-45d8-b1a4-7d003fdb25bd@nvidia.com> <91fc534a-6529-4880-8c92-a8713118242d@nvidia.com>
In-Reply-To: <91fc534a-6529-4880-8c92-a8713118242d@nvidia.com>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Tue, 19 May 2026 11:48:44 -0500
X-Gm-Features: AVHnY4Ko7WL-VuNyAXTNlEEFJFIPxQ3R5xh1-foib4BiOS2nRxwB08ZNB4h1Wpw
Message-ID: <CALHNRZ_Ke_pC4tept4_vGOB0ArwjcaMu=mc=wJrQ0x79MKid-A@mail.gmail.com>
Subject: Re: [PATCH 0/3] arm64: tegra: Add iommu and dma properties for
 Tegra194 QSPI
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 19, 2026 at 10:50=E2=80=AFAM Jon Hunter <jonathanh@nvidia.com> =
wrote:
>
>
> On 19/05/2026 15:43, Jon Hunter wrote:
> >
> > On 15/05/2026 21:35, Aaron Kling via B4 Relay wrote:
> >> The reason for this is to properly support the spi nor chip on the
> >> Jetson Xavier NX module. Prior to this, it would time out on all
> >> transfers and sometimes even trigger a cbb fault, locking up the entir=
e
> >> unit. With this, reading and writing to the flash memory works as
> >> expected.
> >
> > What kernel's do you see this on? With the latest mainline/-next I do
> > see ...
> >
> >   tegra-qspi 3270000.spi: cannot use DMA: -19
> >   tegra-qspi 3270000.spi: falling back to PIO
> >
> > But I don't see the crash. However, on linux-6.1.y I do see the crash .=
..
> >
> >   tegra-qspi 3270000.spi: cannot use DMA: -19
> >   tegra-qspi 3270000.spi: falling back to PIO
> >   tegra-qspi 3270000.spi: transfer timeout
> >   tegra-qspi 3270000.spi: error in transfer, fifo status 0x20400006
> >   CPU:0, Error: cbb-noc@2300000, irq=3D15
> >
> > So I believe recent upstream changes in the Tegra210 QSPI driver have
> > fixed this.
> >
> > This series does fix the issue on linux-6.1.y but I believe that is
> > because this is really enabling DMA support and so PIO is still broken.
> > Ideally, PIO should work if DMA support is missing in device-tree.
> >
> > IMO this series simply enables DMA support. May be we should clarify
> > this in the commit message, but otherwise, I am fine with these changes=
.
>
> BTW, that said. This is a much simpler way to avoid the hang on earlier
> kernels. So I would be happy to get this merged and backport to stable
> as a fix. Again may be we just need to clarify this a bit more in the
> commit message.

I could update the commit message to be more like 'Enable DMA support
for Tegra194 QSPI', sure.

The primary kernel version I'm working on currently is 6.18,
specifically googles android common kernel fork of it. I also
replicated the issue on 6.12 and android-mainline which is currently
7.0-ish.

I was not normally seeing issues on boot, though I think I did hit
that a couple times when jumping around versions. Where I had trouble
was active use of the flash chip, like read/writing the slot metadata
for a/b support or writing the flash for inline bootloader updates.
The issue wasn't always triggering a cbb panic, but it was (almost?)
always timing out and failing to read or write the flash chip.

Aaron
