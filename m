Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FA2D2DAFCA;
	Mon, 11 Aug 2025 08:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754899298; cv=none; b=OfUiCVGK87qgfi4jRMZmN4SmG4OkMWte5xI2rMYCOVrzQysmIcyDGDPbkeF5Ed6ISGJ13ox3sUTUtOUk2gYb4//E/rhb5IHbonN/01WB/+L3RMpkSgx2PLpvrFOS6yEpASu+7ecF7cC0R5U2EhzkGF3yYo+pIifB2gmyrSumquE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754899298; c=relaxed/simple;
	bh=rxSd+igw1hFmEH0b4q+spgORyQ5kh2vPRXo324E70Uw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EOetaIoqbp8eqBxcU7Z11BDgv0ggSk3nO82VDJW5Hq7s6kPGv5cke2eqfCUmVhcazpftr662HjQvxl8a4fRBrd1a0UoPw5F+kRONAPzdjm73NvvGgx+O5eUM5yUtSiSJZtjXgIFoFWTdcx20BAnZ+jXZj4RG9NG9BV+adqwYmDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i4qTbBJE; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i4qTbBJE"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3b78bca0890so1934346f8f.3;
        Mon, 11 Aug 2025 01:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754899281; x=1755504081; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2vjNsRDkSxarcXLpyoABzWvXNZGHjIzTMGpE9iHGJi8=;
        b=i4qTbBJE27k46wFMJEjyKeH2+4gedDEmCYkVBBT8LNIzfguddJsW8vsZLZgN8Ym969
         uTfjviSql9vd2yyCUXXgEZbMa/DDdutd/Zfh/Z6OCPBnJW2VZ0MkYl3smT2LJnc7ogGP
         I4k09RjLHLcurNJZ5LtpmODHQF+TvzgxzV8Zqgkp6GJMpmdSEqBVsSid4TANZl3gFBlX
         tt/PXeBoqhvkFRkAAJkBye7yKeLdCE6MAjPsTsDuR2NOdBlowovjyCteAzzGwl1bE6uF
         X0lqAYm58G95ruzX2MPH2BdT4UwtnlVnZMBgVKlkuYpHX05oGtsYC8hYjk7d+HQtDXmN
         Io6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754899281; x=1755504081;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2vjNsRDkSxarcXLpyoABzWvXNZGHjIzTMGpE9iHGJi8=;
        b=QIR+cYnfMCj+4+cSRw6mPOHzRR0QrR9kJ39MnNGur1YtrSTP3NUaEHqTY9sCh+amXl
         EC6o+/NcSvcG2PN9IYj0u9jQ1KsLtt70xitzvb3nlIfMv5RokqZN30MlZR7f02baJeFE
         u3vOQL1wRA8SbzWIWNU3yw3a1R+CHcoyMIzo44hsHCXZDMkCdvkuPdEUuQQCYedbHDRm
         ibJAUCMKre5AKTCwCISYy/4vpFmqIbaOdYdpByS5YZWdAtcvVDDI1joBVyX9lENP4Hwz
         fW5YUkThzy8VA79P1MTIUIPzPN1G9sAR8OfSvxgaaKcBfLPKJAk/sgX+pndbeoQ9Zpj/
         YE7A==
X-Forwarded-Encrypted: i=1; AJvYcCU/Zi3c3GJy/N1gt8lM7migrhbnv4xgFYsbtWPaDo0/Hp+l3JG+qq7zoJQZcyooWP2CGvKw9FzsVelLVHKC@vger.kernel.org, AJvYcCVmnDO+mx+EBHvJMSC2LidFgzI7c+Qd+DUj+Dl/m6l0WOo+SprMWYJmJxd6m9FFzv6pjkHitwsWC8K7oAk=@vger.kernel.org, AJvYcCWlAutrMThURcZ6hmE626iKK8AB8TIXMyWOLyYf3696tZTTcZSaSD4xVK4LiY9OGAZPdYVfiRrrbIXr@vger.kernel.org
X-Gm-Message-State: AOJu0YzI6/yXF9KJe+IMZUqC7jC2iY82XBr0H5puc2RjCHuYnyh1TLRS
	UopyBJHlKdvwblV/5TndCz3eDRZuqXKcUDby/G2xussXp2ugljNEq9+oRswZikkMboseGFyKf3F
	5BIU4rA1RtUQaFQ3kpNSn27UnBt+ImUg=
X-Gm-Gg: ASbGncuHoKkzkuI4PY582/o5U1/cTJpMPWiI2Btb3vHRsUIbyyi9owNLWAC9aBws4TU
	+qNU1Uki7P43PZEzD63LHhwMhb9BcmiUyuaHGEqQ7pXMJ4H1OZ8zs1VY4tVPY2tvGa437WyOaaT
	QPxjXyHnpLGfS24ZqyuAD7nQRStgaKgGVQ/8hOA9oDjFwWhI1c2I892Flb7K5M1uUQM0JwJzYOl
	/cxQd+W
X-Google-Smtp-Source: AGHT+IGOLz0iBe7zlzJlq6wq+0qNMoTmtvpaXsLumipQC5TBWXKtqBORFtOGgovzRrE8OidC33+GQTHncMY6E9uU2aQ=
X-Received: by 2002:a05:6000:2011:b0:3a5:1cc5:aa6f with SMTP id
 ffacd0b85a97d-3b900b4dbdemr8535598f8f.34.1754899280400; Mon, 11 Aug 2025
 01:01:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250504092324.10802-1-clamor95@gmail.com> <20250504092324.10802-2-clamor95@gmail.com>
 <20250512162439.GA3441216-robh@kernel.org>
In-Reply-To: <20250512162439.GA3441216-robh@kernel.org>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 11 Aug 2025 11:01:09 +0300
X-Gm-Features: Ac12FXzqFbBYuwRGDqU-GBNMIudNzmVjDHn0gbdLx5TdM9JQj0sBE4cNIQMP1ug
Message-ID: <CAPVz0n0j-pMRgP0Kgfq=hHDQRRqF0Jvq_XqwTtnKo1hAUr4cHw@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: display: tegra: document EPP, ISP,
 MPE and TSEC for Tegra114+
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <treding@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D0=BD, 12 =D1=82=D1=80=D0=B0=D0=B2. 2025=E2=80=AF=D1=80. =D0=BE 19:2=
4 Rob Herring <robh@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Sun, May 04, 2025 at 12:23:22PM +0300, Svyatoslav Ryhel wrote:
> > The current EPP, ISP and MPE schemas are largely compatible with Tegra1=
14+,
> > requiring only minor adjustments. Additionally, the TSEC schema for the
> > Security engine, which is available from Tegra114 onwards, is included.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  .../display/tegra/nvidia,tegra114-tsec.yaml   | 79 +++++++++++++++++++
> >  .../display/tegra/nvidia,tegra20-epp.yaml     | 14 +++-
> >  .../display/tegra/nvidia,tegra20-isp.yaml     | 15 +++-
> >  .../display/tegra/nvidia,tegra20-mpe.yaml     | 18 +++--
> >  4 files changed, 113 insertions(+), 13 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/display/tegra/nvi=
dia,tegra114-tsec.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,teg=
ra114-tsec.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,te=
gra114-tsec.yaml
> > new file mode 100644
> > index 000000000000..ed0a5a8a091b
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra114-t=
sec.yaml
> > @@ -0,0 +1,79 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/display/tegra/nvidia,tegra114-tsec.=
yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: NVIDIA Tegra Security co-processor
> > +
> > +maintainers:
> > +  - Svyatoslav Ryhel <clamor95@gmail.com>
> > +  - Thierry Reding <thierry.reding@gmail.com>
> > +
> > +description: Tegra Security co-processor, an embedded security process=
or used
> > +  mainly to manage the HDCP encryption and keys on the HDMI link.
> > +
> > +properties:
> > +  compatible:
> > +    oneOf:
> > +      - enum:
> > +          - nvidia,tegra114-tsec
> > +          - nvidia,tegra124-tsec
> > +          - nvidia,tegra210-tsec
> > +
> > +      - items:
> > +          - const: nvidia,tegra132-tsec
> > +          - const: nvidia,tegra124-tsec
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    maxItems: 1
> > +
> > +  clock-names:
> > +    items:
> > +      - const: tsec
>
> Drop -names properties if there is only 1.

This is added to cover existing binding in tegra210 tree

> > +
> > +  resets:
> > +    maxItems: 1
> > +
> > +  reset-names:
> > +    items:
> > +      - const: tsec
> > +
> > +  iommus:
> > +    maxItems: 1
> > +
> > +  operating-points-v2: true
> > +
> > +  power-domains:
> > +    items:
> > +      - description: phandle to the core power domain
>
> Instead, just 'maxItems: 1'.
>
> > +
> > +additionalProperties: false
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +  - clocks
> > +  - resets
> > +  - reset-names
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/tegra114-car.h>
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +
> > +    tsec@54500000 {
> > +        compatible =3D "nvidia,tegra114-tsec";
> > +        reg =3D <0x54500000 0x00040000>;
> > +        interrupts =3D <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH>;
> > +        clocks =3D <&tegra_car TEGRA114_CLK_TSEC>;
> > +        resets =3D <&tegra_car TEGRA114_CLK_TSEC>;
> > +        reset-names =3D "tsec";
> > +    };
