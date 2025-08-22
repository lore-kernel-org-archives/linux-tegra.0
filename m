Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04A9B3F9D2;
	Fri, 22 Aug 2025 15:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755875104; cv=none; b=IOdKr+0KCxOUT1KQFuO6eGCY85C5wEJNUpMniOq2UPtq1p8ECYUjg4o8OUHfSR29VU8HKJY5Fnrw2dBUOQvkfhjZ64Nn/xG9yzNV7Ojxisfuda7SMaXfMjphGYCyMknH56XoD4BGieI9dcub3uHOuoe6aVvuYhHt6oGjG6UgodA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755875104; c=relaxed/simple;
	bh=tGSSNSnFFWPZY21Ur0558xtTyXaUmF1cBPI/rRqOS3g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PF143m5EmJofXLhqMaWHylstSjmP1wYJkSS6Bh3Qg5f0Bc7JkKlHbP4N1TmujGLxnWsf0/fwxnKh23pHXL+yTyn5Zk8YI8pM/M5vIPH34zVgsWS27pvVOBrlWP/QEMGQr+4+sl2egOTLTRdwEGlMBuKas9jT9QhBDj42gfatjfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SO/viMQV; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SO/viMQV"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3c4368ab352so1075701f8f.1;
        Fri, 22 Aug 2025 08:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755875101; x=1756479901; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jSy3uP111tmp0BYAk5JJsg/1JnSS0DO1D4O3BOeuxDQ=;
        b=SO/viMQVv19xDwv0W+EqZLzF90zM52OAp2jz0NnZgK/4uGx+JoSxSRkeI2oYzpfGTa
         FMpNtcY4XL22tMqpwLjyjuFaf/cgaXjvsO5nr2sDNrt8sFXeioccJy7GdRKwpDLqx1mv
         ooJqhlTvHO2FS3Djbk6VAtxvwQV7S9iv3qHbhGqp+j78pnNI3xJEhjQmqu9fExDvbh7Z
         KxPMjUiPprA5+kEjY3hav2l/yJyI6KDjJkKwqISpghiPoDQBdPLuWxrR1K4PLYjvvaZs
         8Kq5O8VrujNUIeSsB3YDNjyzppNjX4WcNe/jLhQbzIHigQLv+cuc3+c3W2ZdTSZs4kM/
         Pwcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755875101; x=1756479901;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jSy3uP111tmp0BYAk5JJsg/1JnSS0DO1D4O3BOeuxDQ=;
        b=QEz5yBWUHlHMg44WbjX/UQsIdvXq+78yl+DJNTf6GNE8UVE8UJ3bBLxUh0yzCU4kR9
         T22nIJ0b1zALjPj1SUR+7gG+0YNn9Pkzu7UVwonxqJ+hRdoblW6xjusiTXrg50BYNz6w
         GKO4zPAi3lrYGANKWRmZfj517RHkgLxnRUwIZmSMRAsukiDvhR71WZjx+wgJCnGJKvfD
         es++rGkByYr3b64ayEXkxilYXOkhMEw/DDibtWQhzRSk18CGzYg5q3uk3ZKElkWNYuAv
         mbDXg5qYEKjNovgBEHUuIpdbHFJCsHPbbEVqP8B9AxBhUlz4dJY44m95T4nbwkEF5ZKe
         tYDg==
X-Forwarded-Encrypted: i=1; AJvYcCUoGoZtwXOOqkmJ6E/D+2e1QiQhU702xZCredeqnGjy7DVUKagKlNwucrZu3vXNu5Ro4t8pkwb6iTnpVAw=@vger.kernel.org, AJvYcCVR0hnUM4DGAJzV+YcO/b1g3q+tsLhlfYeximFVUvyPnl58nzsz2frPpcWbIgBN+8Af838ty8RsFRAYWccy@vger.kernel.org, AJvYcCW6N2l4lwrTDmn7TP1D3eRMPj3iyiqWDEc97Izi4SENk4xsYosR3YcBX8F2YEOERtG50U7e3PykvkHl@vger.kernel.org, AJvYcCWP9g5y4CM4FQdwsOzlG0lZqfzkowypNojE8h5bWmuOj5coctdwYOaOb1uHdo/B3FKnT4pBRooebOKf@vger.kernel.org
X-Gm-Message-State: AOJu0Yzf/A/ib/ZBENpGI5kF9r/YPFNmJ7u7ZAEUCGwia1CIpLSHrPAp
	8qE9hVL4wn+9SQa9dGwmBmp3glRdTLY4UqtjjfuplM4HwlrRPHtFUs3/A78Snukoss1QICQ4rDN
	RkyXR1PbxWPX47G2DY3hwKSUM/mT+pRM=
X-Gm-Gg: ASbGnctZ1yXh8Ok8GvLcLW1mUCB0K947/0wTUkERcdZijRxdfSVTvfBK3rOcfAfvlBx
	nmSIu+dq4fVjf4oTEgIDeyiGgXGgEvXfgkxKXjM7yeMgwJNBBkyE8qa4xFKpZHM7Ro9u//deAJ4
	CyacJlZsMZr0rSF+iUs5bjy/zIclxcV6KBvwfUiNIqzPZW6mxn9UOEiGSVifLgg23lPadKwUR9o
	31lmkQV
X-Google-Smtp-Source: AGHT+IHdbJCM1JrU9aZhUhCW3G/ZDFnrficgj+epThhDt8C/ZyJfJc4LFShS/wBERzgRCfTyJaZymDF2pTWqYPZCvmI=
X-Received: by 2002:a05:6000:310d:b0:3c3:d82c:2295 with SMTP id
 ffacd0b85a97d-3c5dad0fdbamr2848028f8f.24.1755875101014; Fri, 22 Aug 2025
 08:05:01 -0700 (PDT)
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
Date: Fri, 22 Aug 2025 18:04:49 +0300
X-Gm-Features: Ac12FXypG4PfqbTzwK4muiuwuwQ2NYN0lKk_T4ivOXsgmwVEHmwuJibOvc-hr2M
Message-ID: <CAPVz0n3ysZA2ku4PzcwVTyuii_ORe=3qkD1z+iYAmVYFhZuUCA@mail.gmail.com>
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

I though about length but not only names, amount of registers,
unfortunately, changes as well.

> Rob
