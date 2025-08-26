Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BCB62E92D2;
	Tue, 26 Aug 2025 05:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756186918; cv=none; b=W9/q/Z/Mf5/KoS/ZnUi5YcH03lrLZvV8nfYOFCaUdfdKLZ9fiP0ZwUcqSPStBBA6RtuRPrI/oIgjf+XHKmpXNr4pftr2Z892GA2aQm1qrW86axGSE9uSzTTeef92xs5HFw8xHAtlNtRnp1IGg4MOtQKu1HzzsqacfDQNXQjdBKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756186918; c=relaxed/simple;
	bh=7CZQK0OhTPWu25G/n+is5oRUnMiCQ4DJlTJ1AWkOOgA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FD1P3s38eC5oK1zmmZlE8nrt1sKjNxD7JUGiAuPSq/ZbJqPvVW0Xaz6Wex4Q8Kt2JqT7D1E0eHRlbAxQVNxUOrYl2ZyVYpokYKYAoVD4KEkH3gwDlYPZSQccCI7NixlGbgJ7cLrYch85a4W6XLYVkMdq29uLmZs087UXxm8uCgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=icPcIFC2; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="icPcIFC2"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3c7ba6c2b2cso1526045f8f.1;
        Mon, 25 Aug 2025 22:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756186915; x=1756791715; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wd/hiGRxfWUQsWMLX8JbWdmT+RKOZ30S6OnyNYYjTSU=;
        b=icPcIFC2zYTr3ilyp19af7WxLxgFUlb7W8nYV7nChkO2RTgrvXlJWTZqgR8b+Jhe+T
         pdzvly31S917+rMhMqjeXvjzO2cRUaFbCz7+tWaIx3XLJKg9roWjblaoOPz0rKEQjjQ0
         U013cxj57Luh2DqxZrjkOX0U98SxM0HyOYkq+V3E7j5WO8VYd43EMZY1WUOPUerTW/xs
         qrOvQhcDUo86Pn8ZNXLV8qxgxGYyjZjcr6RInwIuOjSKulRaElZVfhrDpdsJN9MYVe+4
         H1377FOpz1WFWxAXKFesg8mTq5mMHCtW8cdI2AuON+w38qL/s8xsAPWFXueQkoUgaqoP
         V0+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756186915; x=1756791715;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wd/hiGRxfWUQsWMLX8JbWdmT+RKOZ30S6OnyNYYjTSU=;
        b=IvSIxA+NdXyQwrOjYjDXB3YS4J8g5zAVPsmW3BYZTy+YkzJzuWC5qrYSFVJQ78i4zo
         aEUufv8i/GHtjyr1JvH2KasUYI29VcyONxkTNMdFgFe1sYb8qBogBiGd2MnaFv4uAE6y
         pyf2I65irhuWzIUSwl24itVes1rL91BzhhGkBDl3nyJ8DjlG2l6AH63Hn6UwLer/tVpl
         +HX1Xtt7oCYth2EwBGRYkj6D5PCf44XDDWMGbYPFpeaUddf0o0lInLPIVus0+oGl7MSR
         6n1/ct/wGJhdfq9acS95BC/Q9xJy0a87KTfQWy0BEuEz2ioFhSJWjyCzzIH9QAqpBbmK
         SBqg==
X-Forwarded-Encrypted: i=1; AJvYcCVZbFOQZUsqS2B39I9xkyWqSRqrO2Z3G2e6KKHYyLmLVu6Se4cl1Zial2txKX5zr3kmIs+czW+Ei3Nm+ps=@vger.kernel.org, AJvYcCVr/Gh0YuxQqmEla6PqDXywGfHLSGFYppnrC2NBWSDDXxb/gRX0CsMq6R36ZPOdWnZx2WrXDlSriPdl@vger.kernel.org, AJvYcCW39gucCb7WHBHb8MONoJZAO1wyLqx0u5qz8OwA0Vbm9QhoQwD+lTAD8W+AUzVVwLfPp6YBSjU/OSyZoQ9R@vger.kernel.org, AJvYcCWytezItqKW3B4d9u6f+hMlNfAWswBIQHqhYTiYOfBT/Vg8stBhDe0YEEyxRuY4dJU/+7Mlba97ZefX@vger.kernel.org
X-Gm-Message-State: AOJu0YxxWHh7xjwGHV12lCN+8231TF5fkWoD44Xk0bLT++P6poIFF8xy
	qD7kGM5KXpJYBJqZRnTDWS+a0Jyi00BuaOuQPOuUxFYoniXuKv7tV/pXp1dN1R+tnqSZB7ic6SB
	L5AuuBF7T/cFpiliDDbW6CAHHLNHZDM4=
X-Gm-Gg: ASbGnctkARR45luUYX8DW+j1QDN4mR923UV5fpAHpPbTc7cWMtF/7vc0d150JOoGct5
	kWQ59fzBRfX3VehQG9Zox6nLR6sAUOJ2xd6JdKPsDm3TpLohd2BgMbLs5cZjwLNSw+3PxY5wouj
	fZwrR2hi2VeJK9z/nVMN/KrBlxVon5TR+iPb1YccUggIS+iFLVxVFHBvsIZ2gqiJV4pGrHMHDRi
	riDUsXE
X-Google-Smtp-Source: AGHT+IEkM4RwYqEvA/hG/RxFQ8N27QzXQ6DziZUl4OvCrRc/cJHm+C0S4Hk08X5WmoWHKTrs1M0szyknfFnAQcYqAbE=
X-Received: by 2002:a05:6000:288a:b0:3a0:b84d:60cc with SMTP id
 ffacd0b85a97d-3c5da64aa1cmr11072966f8f.2.1756186915123; Mon, 25 Aug 2025
 22:41:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250820151323.167772-1-clamor95@gmail.com> <20250820151323.167772-3-clamor95@gmail.com>
 <20250822145934.GA3791610-robh@kernel.org>
In-Reply-To: <20250822145934.GA3791610-robh@kernel.org>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 26 Aug 2025 08:41:43 +0300
X-Gm-Features: Ac12FXxeGFQ3wFfnMz4v1bcWV1wGXde1A43jWb3Y1BFQnrTgy5kauxxXGov9JTI
Message-ID: <CAPVz0n3OhVuK6Fkk9S+cZ6ZrswZu=sRwW4Jd5YEgcAgK7-nDeQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/9] dt-bindings: memory: Document Tegra114 Memory Controller
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <treding@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, 
	Mikko Perttunen <mperttunen@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
	Dmitry Osipenko <digetx@gmail.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D1=82, 22 =D1=81=D0=B5=D1=80=D0=BF. 2025=E2=80=AF=D1=80. =D0=BE 17:5=
9 Rob Herring <robh@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Wed, Aug 20, 2025 at 06:13:16PM +0300, Svyatoslav Ryhel wrote:
> > Add Tegra114 suffort into existing Tegra124 MC schema with the most not=
able
> > difference in the amount of EMEM timings.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  .../nvidia,tegra124-mc.yaml                   | 106 +++++++++++++-----
> >  1 file changed, 80 insertions(+), 26 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/memory-controllers/nvidi=
a,tegra124-mc.yaml b/Documentation/devicetree/bindings/memory-controllers/n=
vidia,tegra124-mc.yaml
> > index 7b18b4d11e0a..e2568040213d 100644
> > --- a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra=
124-mc.yaml
> > +++ b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra=
124-mc.yaml
> > @@ -19,7 +19,9 @@ description: |
> >
> >  properties:
> >    compatible:
> > -    const: nvidia,tegra124-mc
> > +    enum:
> > +      - nvidia,tegra114-mc
> > +      - nvidia,tegra124-mc
> >
> >    reg:
> >      maxItems: 1
> > @@ -62,31 +64,7 @@ patternProperties:
> >              minimum: 1000000
> >              maximum: 1066000000
> >
> > -          nvidia,emem-configuration:
> > -            $ref: /schemas/types.yaml#/definitions/uint32-array
>
> The type should stay here. It is not conditional.
>

/linux/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra124=
-mc.yaml:
patternProperties:^emc-timings-[0-9]+$:patternProperties:^timing-[0-9]+$:pr=
operties:nvidia,emem-configuration:
'anyOf' conditional failed, one must be fixed:
'description' is a dependency of '$ref'
'/schemas/types.yaml#/definitions/uint32-array' does not match
'^#/(definitions|\\$defs)/'
hint: A vendor property can have a $ref to a a $defs schema
hint: Vendor specific properties must have a type and description
unless they have a defined, common suffix.
from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml#

Description is conditional. How to address this?

> > -            description: |
> > -              Values to be written to the EMEM register block. See sec=
tion
> > -              "15.6.1 MC Registers" in the TRM.
> > -            items:
> > -              - description: MC_EMEM_ARB_CFG
> > -              - description: MC_EMEM_ARB_OUTSTANDING_REQ
> > -              - description: MC_EMEM_ARB_TIMING_RCD
> > -              - description: MC_EMEM_ARB_TIMING_RP
> > -              - description: MC_EMEM_ARB_TIMING_RC
> > -              - description: MC_EMEM_ARB_TIMING_RAS
> > -              - description: MC_EMEM_ARB_TIMING_FAW
> > -              - description: MC_EMEM_ARB_TIMING_RRD
> > -              - description: MC_EMEM_ARB_TIMING_RAP2PRE
> > -              - description: MC_EMEM_ARB_TIMING_WAP2PRE
> > -              - description: MC_EMEM_ARB_TIMING_R2R
> > -              - description: MC_EMEM_ARB_TIMING_W2W
> > -              - description: MC_EMEM_ARB_TIMING_R2W
> > -              - description: MC_EMEM_ARB_TIMING_W2R
> > -              - description: MC_EMEM_ARB_DA_TURNS
> > -              - description: MC_EMEM_ARB_DA_COVERS
> > -              - description: MC_EMEM_ARB_MISC0
> > -              - description: MC_EMEM_ARB_MISC1
> > -              - description: MC_EMEM_ARB_RING1_THROTTLE
> > +          nvidia,emem-configuration: true
> >
> >          required:
> >            - clock-frequency
> > @@ -109,6 +87,82 @@ required:
> >    - "#iommu-cells"
> >    - "#interconnect-cells"
> >
> > +allOf:
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - nvidia,tegra114-mc
> > +    then:
> > +      patternProperties:
> > +        "^emc-timings-[0-9]+$":
> > +          patternProperties:
> > +            "^timing-[0-9]+$":
> > +              properties:
> > +                nvidia,emem-configuration:
> > +                  $ref: /schemas/types.yaml#/definitions/uint32-array
> > +                  description: |
>
> Drop '|'.
>
> > +                    Values to be written to the EMEM register block. S=
ee section
> > +                    "20.11.1 MC Registers" in the TRM.
> > +                  items:
> > +                    - description: MC_EMEM_ARB_CFG
> > +                    - description: MC_EMEM_ARB_OUTSTANDING_REQ
> > +                    - description: MC_EMEM_ARB_TIMING_RCD
> > +                    - description: MC_EMEM_ARB_TIMING_RP
> > +                    - description: MC_EMEM_ARB_TIMING_RC
> > +                    - description: MC_EMEM_ARB_TIMING_RAS
> > +                    - description: MC_EMEM_ARB_TIMING_FAW
> > +                    - description: MC_EMEM_ARB_TIMING_RRD
> > +                    - description: MC_EMEM_ARB_TIMING_RAP2PRE
> > +                    - description: MC_EMEM_ARB_TIMING_WAP2PRE
> > +                    - description: MC_EMEM_ARB_TIMING_R2R
> > +                    - description: MC_EMEM_ARB_TIMING_W2W
> > +                    - description: MC_EMEM_ARB_TIMING_R2W
> > +                    - description: MC_EMEM_ARB_TIMING_W2R
> > +                    - description: MC_EMEM_ARB_DA_TURNS
> > +                    - description: MC_EMEM_ARB_DA_COVERS
> > +                    - description: MC_EMEM_ARB_MISC0
> > +                    - description: MC_EMEM_ARB_RING1_THROTTLE
> > +
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - nvidia,tegra124-mc
> > +    then:
> > +      patternProperties:
> > +        "^emc-timings-[0-9]+$":
> > +          patternProperties:
> > +            "^timing-[0-9]+$":
> > +              properties:
> > +                nvidia,emem-configuration:
> > +                  $ref: /schemas/types.yaml#/definitions/uint32-array
> > +                  description: |
> > +                    Values to be written to the EMEM register block. S=
ee section
> > +                    "15.6.1 MC Registers" in the TRM.
> > +                  items:
> > +                    - description: MC_EMEM_ARB_CFG
> > +                    - description: MC_EMEM_ARB_OUTSTANDING_REQ
> > +                    - description: MC_EMEM_ARB_TIMING_RCD
> > +                    - description: MC_EMEM_ARB_TIMING_RP
> > +                    - description: MC_EMEM_ARB_TIMING_RC
> > +                    - description: MC_EMEM_ARB_TIMING_RAS
> > +                    - description: MC_EMEM_ARB_TIMING_FAW
> > +                    - description: MC_EMEM_ARB_TIMING_RRD
> > +                    - description: MC_EMEM_ARB_TIMING_RAP2PRE
> > +                    - description: MC_EMEM_ARB_TIMING_WAP2PRE
> > +                    - description: MC_EMEM_ARB_TIMING_R2R
> > +                    - description: MC_EMEM_ARB_TIMING_W2W
> > +                    - description: MC_EMEM_ARB_TIMING_R2W
> > +                    - description: MC_EMEM_ARB_TIMING_W2R
> > +                    - description: MC_EMEM_ARB_DA_TURNS
> > +                    - description: MC_EMEM_ARB_DA_COVERS
> > +                    - description: MC_EMEM_ARB_MISC0
> > +                    - description: MC_EMEM_ARB_MISC1
> > +                    - description: MC_EMEM_ARB_RING1_THROTTLE
>
> I imagine every SoC is going to be slightly different. I really don't
> care to know what are all the magic registers in the list, so I would
> just drop all this and just document the length. Just treat it as opaque
> data like calibration data we have in other bindings.
>
> Rob
