Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A8012063FA;
	Tue,  8 Apr 2025 05:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744091030; cv=none; b=QW6nKXywgxV9KwcBIKNIKjDPE0Ao69pn+5pIsQPuiRI8YXERDbxWab2JcFfkijtybUeFllPoL/DWLeSs6NVOcdm4PoNklw6FGQQ3Pxz5iNDeP900z4h5X1DCBT0h1LGmxAN3t3aCeitbaYFc4ZXFkKh3QRk2m9GHEToRSaKSnZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744091030; c=relaxed/simple;
	bh=sCHT8GHC31TuiceCAaOvubizgy6yRJ5sEi7ftPp0xPQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fKbqIennghA6HsrNVQVQKpy4+JPrDx0mKR8uzfp3IH5JZOJgydNoz990kZleBDWL4b4OhielS5ST2EaioAOq3bSYRni6i43mTGhuQCtGbgnXwqm9JMtJLTIqFvSGYFK5XT3zg4e/672Gj7SXYfbfuqRNo3D7QZAKlXCjtOAzPsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jFDLXr2J; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jFDLXr2J"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43cfba466b2so50486185e9.3;
        Mon, 07 Apr 2025 22:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744091027; x=1744695827; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kAuwdSEHLwB691PFl03qxzJ1K9Zrc8A7QXS5gXOWExk=;
        b=jFDLXr2JTcGrwXknM7GoG5IwPaQ7P2uxXIAQl55ZKvoCEE8Vp1Ompr7tjtWqvyDT/N
         y8MPaGwHwpGvCRqxRUH0CQ7GLJtbwktK6GQR+N1TnBimOSko0zBiPBLw4ZZDSy6E6fuQ
         FZu6vnCMY+pfaICNZilFn1rAyHLA9LxwW6A11/uj7Wf3Xpv8/2P1aBqdYGiarlg+8+R4
         wcpADjO/BQvwFXQWT0q2CPc6PJWLaOlEoDSvUUNZSocyVu05Rz9V85qspZKdlWdLuy/i
         uaVaXhdeJFtSFMYqgOtjYhmquEJ0J2mIpxfqI5v5J8zxbUibEd3N4w/ICOFLH8HOufrb
         73fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744091027; x=1744695827;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kAuwdSEHLwB691PFl03qxzJ1K9Zrc8A7QXS5gXOWExk=;
        b=KUGaZmjmoLLnaajoIncWrHfObgnJMLw+T0so1BLWRaC1sgv6LSmt+ax1x6aBy7/8gh
         /lZXw0121sqoczsq4DEmUHojs1Lld/TvOdE0V7qGvJ6uJxqtjS5aeYd6JB42V+GAbQif
         zxDo4i29Q3YUKnwkPkZKLGZ0Cvz+qYJhCFfKmzqd0tpsSFwd9c6TkO62uIGjP3StYDqp
         wM5zvogAUFS9CpoyDqPCwjIRlKQq3061kyFuoMSqWhGgAtfnRAtuUGjy2tWmxSmy0vGP
         fCxNqv7FMTODQ9nCL+B5ZMqTFg3uZ1Yp6CqTEvx5FS9d3AWrVUi4nDwWUboJq0xjDBqI
         oVMQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQiX7ym7NXnoziQaUucLcjAZEb63+k2aWRTDjzhj3+GFcQZhoCNhFkxAIbEdPzEf5QOXPbZNzfTtf+@vger.kernel.org, AJvYcCUU+oHjtbuQfiLMt8O/JDYSxCgOWYeDLXH/pVWHKSSkVNeIvi8VV31ALvbZdZ/L0GTvbnxocub+adFy@vger.kernel.org, AJvYcCWyOXK1Ojlzq60QU8STDToOu3lB+UzFELOb2sxsOaYSsqPHu61ZvGPA9+3QXQVFCiQ6x8gjd34YhZI1P/8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyubvdR9rLV78Tl/u4qXRKY+/d55LXO4jc+OysnqJZneNh3pSyA
	M/iZy2JEVL7UlhcDri8LdmZLGtsci4UUm+VajTUUkxjzRlACdpPEwAIngXchoI0Ik/ZmTB4dZqz
	91DgIqI0dbgzbIbsKbg3ieYbdHcM=
X-Gm-Gg: ASbGncv7D4FEk9rLGF+nmy8ghjP3RDUiDeezX+VL6oDLTElzjRx4SmQP37FgAhKnLeV
	Q48sB9XN/C3ru1bYejfiM9HsdoDFw1fdbSiPVEHTJZWT4daESCzp0VM/KTYlAUbZZJMa/xTbb5l
	tjV6MBKjwP+DSpHxqjg+uA8/1pRqQ=
X-Google-Smtp-Source: AGHT+IGsPU4TjoAJ3iqho3vhlE0M3rrsyKyjPDbuj1pIel6bfcogzkpm7d9GOd0CHj1Cgh8n5qjmdFjPyPiZ7ndgLYk=
X-Received: by 2002:a5d:6d88:0:b0:39c:3122:ad0c with SMTP id
 ffacd0b85a97d-39cb36b2a5fmr14601478f8f.11.1744091027563; Mon, 07 Apr 2025
 22:43:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250225143501.68966-1-clamor95@gmail.com>
In-Reply-To: <20250225143501.68966-1-clamor95@gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 8 Apr 2025 08:43:35 +0300
X-Gm-Features: ATxdqUFmqygoZjQ1jPRy8xHAhI0P-Gqy0pNvzclHkp020md1cOggnjWtfe0KuS4
Message-ID: <CAPVz0n29m5CrKMW_j8Q0Zz2pCBdYLmMn-3waSZx7ooJZG6ZTOQ@mail.gmail.com>
Subject: Re: [PATCH v1 0/9] Tegra114: implement EMC support
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Svyatoslav Ryhel <clamor95@gmail.com>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
	Georgi Djakov <djakov@kernel.org>, Dmitry Osipenko <digetx@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=B2=D1=82, 25 =D0=BB=D1=8E=D1=82. 2025=E2=80=AF=D1=80. =D0=BE 16:35 Svya=
toslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Add support for External Memory Controller found in Tegra 4 SoC along
> with adjustments required for it to work properly.
>
> Tested on ASUS TF701T (T40X) and Nvidia Tegratab (T40S). Both work fine.
>
> Svyatoslav Ryhel (9):
>   ARM: tegra: Add ACTMON support on Tegra114
>   dt-bindings: memory: Document Tegra114 Memory Controller
>   drivers: memory: tegra: implement EMEM regs and ICC ops for T114
>   dt-bindings: memory: tegra114: Add memory client IDs
>   clk: tegra114: remove emc to mc clock mux
>   dt-bindings: memory: Document Tegra114 External Memory Controller
>   memory: tegra: Add Tegra114 EMC driver
>   ARM: tegra: Add External Memory Controller node on Tegra114
>   ARM: tegra: Add EMC OPP and ICC properties to Tegra114 EMC and ACTMON
>     device-tree nodes
>
>  .../nvidia,tegra114-emc.yaml                  |  431 +++++
>  .../nvidia,tegra114-mc.yaml                   |  154 ++
>  .../dts/nvidia/tegra114-peripherals-opp.dtsi  |  151 ++
>  arch/arm/boot/dts/nvidia/tegra114.dtsi        |   32 +
>  drivers/clk/tegra/clk-tegra114.c              |   48 +-
>  drivers/memory/tegra/Kconfig                  |   12 +
>  drivers/memory/tegra/Makefile                 |    1 +
>  drivers/memory/tegra/tegra114-emc.c           | 1487 +++++++++++++++++
>  drivers/memory/tegra/tegra114.c               |  193 +++
>  include/dt-bindings/memory/tegra114-mc.h      |   67 +
>  10 files changed, 2561 insertions(+), 15 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/memory-controllers/=
nvidia,tegra114-emc.yaml
>  create mode 100644 Documentation/devicetree/bindings/memory-controllers/=
nvidia,tegra114-mc.yaml
>  create mode 100644 arch/arm/boot/dts/nvidia/tegra114-peripherals-opp.dts=
i
>  create mode 100644 drivers/memory/tegra/tegra114-emc.c
>
> --
> 2.43.0
>

These patches had no activity/feedback from tegra maintainers for a
while, so, in case they got lost in the depths of email box, this is a
friendly reminder that they are still relevant and I would like them
to move on.

Best regards,
Svyatoslav R.
