Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C228422AE75;
	Fri, 21 Mar 2025 16:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742573381; cv=none; b=Ly8HmMKXu90TBVSTw74fobiKMZOl3Ol0bYKTRvddsbqCLj1GpUnUC4q0QZL3ven2IGGKFvS+7/QufJp+pPets6ioVrhHVcM5lgrzO7yauS/eas8/2Gj6DUyCdW7LxXUhixuAalcZK9r3JTwFbPdZx+oAeMo9i2Tq3tXHVrSGXqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742573381; c=relaxed/simple;
	bh=1VaOuoOhYijhYTcQw/ZRhfDMSAApKQ3nl4+hvS74df8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k1umSVo8lLh0rSP6aJqD4lRpelOs85K9UnxDI/LONqgkLQjQfl1wGPslN9jIQRtw8N5PnQo7InC9zuUxGIinDbNYeXYRkaGlO2Ov1CYzfsCIjp3rwtG7I+II8Re1dgyfs/L+8TrDGwYFUHGkdjb+IVnjWhRawg7wAureNu5DYXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jijuq1Q7; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jijuq1Q7"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-391342fc1f6so1785179f8f.1;
        Fri, 21 Mar 2025 09:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742573378; x=1743178178; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VAtDXuv00FJL6H2z5EyTsQFuP2X8JyjbeBLvJuXRPek=;
        b=Jijuq1Q7laR5eBP4j28IsKW2J7IBOMw+qVD466/2lzQFmAc50A/Kk6/91aQs2N5owH
         ZdxPa3bgz6Ru/beNfNgLs9P8piuloixS0Ktw54UZ1KBvZGHJzfHt+Ukqn1jLE0AjA83R
         CD6ca0OQSF1tDvVi95Wss6+EWIxFQdbJE9KI4JGm6mEdhVWGOpK0D5dHJiXjCWn4eVMU
         uQDSNak3SPGrSeYKfGxZLWmLl4qvrIMLI9QKEm55lUi21V4v4A7MOu9M8JgvxC3RLIvL
         mZbSRGNzCjqZY4omsC8n6gY+mIVRp4uQnYY2NmqQye5LsbGsv9xea46mpVxLN6nZirN1
         2l3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742573378; x=1743178178;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VAtDXuv00FJL6H2z5EyTsQFuP2X8JyjbeBLvJuXRPek=;
        b=ainUWalF8MQBgHkTFS5tw/fCxdzxVY5BtxxRxDE6113yzsL35tOLmk6nzcZVdd5Gt6
         uOBIp6MrHghyc6lPIUxY8HCSHPf6EsZGxLgsGJb7G1uwoRtIS89gulvB312Lb6kfEK9V
         Q7wpvSzS13s72WXC2yWrKeZbwNJdofmI1AQfMGVExKtcxa2ggKCorhKJ6KDI5HA9hJPH
         47X+leZ3XiVuEFqQCMH3plPK1oBb2WXYJ3Fic/JOFgFj0SGyFnRhbAUTMelzZnnG+ZPn
         ypwkIH5nzx4UPJ42gOIen8/9WsEigA4caYHseD/u3bIqxUCBcTi6Nb/xlMon16ZzlJtp
         IDjg==
X-Forwarded-Encrypted: i=1; AJvYcCV0UTZ7Aj3of8h9x50ZgGQYcQLqi4O4Rd3nZZP2rNlr9rN970PflRfggOIQdCZNAhFEEnSrGbT7FJEmTuTZ@vger.kernel.org, AJvYcCWUPWIW4cJhW2zx3W7sZQJog2JKnJu25PZkN+l513O5HOIIAnjVX3uvCuHiESGqoVnbR9fdVbl2YypuxcU=@vger.kernel.org, AJvYcCXv8Ua9HcmSyMCZj8B5eywbodd/Skv5QB+bOQN1r8RnS/fHnMIfzuglbbk9YhtH8a/3StbugUcHJPso@vger.kernel.org
X-Gm-Message-State: AOJu0YxOPH0X+nn/yZD7+7PJdPSEO2CceWSvQEu24efIr/FwAOu2L2zG
	7L6jQgCR+o6bvLe12CQgxvj1RqUa0RWo7t+iV+q9onyxYuL6ET66wqEAp1v/Od5HuZDHLzLbpcz
	nHZNfba5JHltGFjAR9tqC7/R1aiE=
X-Gm-Gg: ASbGncve0On4js0wzK4kgo/qBBoWbrv7rv6gKrj4eU7KTyDroJuQR7L5y/tU5l7qEpK
	2If6kxw3+0UcyYyQZYeCH6UfXGp7xsVJGSqiOyMX9TbbksCByLegMoIMYnLSssotQ/QcKWsews+
	f2mnOie1Pp8Kcw/2aoNp5s53C6e9c=
X-Google-Smtp-Source: AGHT+IE7phRxo/1r1s7So72vTf29tFBGnfITiYorTw1lW7wohPzyuKR1ovdP28tj9e33TKhL7EzBbvxG7kRXaUOitvA=
X-Received: by 2002:a5d:6c64:0:b0:390:f9f9:3e9c with SMTP id
 ffacd0b85a97d-3997f910184mr4224499f8f.25.1742573377733; Fri, 21 Mar 2025
 09:09:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250314074557.16367-1-clamor95@gmail.com> <20250314074557.16367-2-clamor95@gmail.com>
 <20250321160234.GA3372208-robh@kernel.org>
In-Reply-To: <20250321160234.GA3372208-robh@kernel.org>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Fri, 21 Mar 2025 18:09:25 +0200
X-Gm-Features: AQ5f1JpFIu9BG_I-CucbrXq2ID2HNe5PlDJqGdmun0hBV_tME1fx2r3fb4S-qfk
Message-ID: <CAPVz0n3tY8sTvWD-QPA+_FJWnwbSeHXLJYTrk1pJzpy1enMexg@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: display: tegra: document EPP, ISP,
 MPE and TSEC for Tegra114 and Tegra124
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <treding@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D1=82, 21 =D0=B1=D0=B5=D1=80. 2025=E2=80=AF=D1=80. =D0=BE 18:02 Rob =
Herring <robh@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Fri, Mar 14, 2025 at 09:45:55AM +0200, Svyatoslav Ryhel wrote:
> > The current EPP, ISP and MPE schemas are largely compatible with Tegra1=
14
> > and Tegra124, requiring only minor adjustments. Additionally, the TSEC
> > schema for the Security engine, which is available from Tegra114 onward=
s,
> > is included.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  .../display/tegra/nvidia,tegra114-tsec.yaml   | 66 +++++++++++++++++++
> >  .../display/tegra/nvidia,tegra20-epp.yaml     | 14 ++--
> >  .../display/tegra/nvidia,tegra20-isp.yaml     | 14 ++--
> >  .../display/tegra/nvidia,tegra20-mpe.yaml     | 18 +++--
> >  4 files changed, 99 insertions(+), 13 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/display/tegra/nvi=
dia,tegra114-tsec.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,teg=
ra114-tsec.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,te=
gra114-tsec.yaml
> > new file mode 100644
> > index 000000000000..c66ac6a6538e
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra114-t=
sec.yaml
> > @@ -0,0 +1,66 @@
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
> > +
> > +      - items:
> > +          - const: nvidia,tegra132-tsec
> > +          - const: nvidia,tegra124-tsec
>
> nvidia,tegra210-tsec appears to be about the same, already in use, and
> undocumented, so please add it to this binding.
>

Sure

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
> > +
> > +additionalProperties: false
>
> required properties?
>

I will see what I can do about this.

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
