Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E03B1F92E
	for <linux-tegra@vger.kernel.org>; Tue,  7 Oct 2025 05:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759814005; cv=none; b=uS+4LxuiAfu8Z1or6Dvu2+SJ+511Af2kD3+fg+hLGXyONgy2oekc+Vw1jiqvvS6uSZR06SHXV3ue7FXP0vxhoRYxXBfPRQtBj09f/1QOfko+iP84kF8SGfTWD2x6+RGEZ9saTDlCxEMOZymeA+PYSxgPAIkATrZ6IPzPGruonzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759814005; c=relaxed/simple;
	bh=L5xoEIflpBS7wooM7axyy2VDNqgfrX6E93X+/MuiZN0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h3FFUWkCY5BVIy7A3ukGVSUTWziiHOi+pDnWNLgvFrUr1mUge+dmIXxWFkmajKhQf7uswkJmu7zj0cEY6o2mAs52IZRLHIc/4IDZgyhe8jcuuT6YYEdCBeye9rZmEIBV3op3A5SfCR1+3PWabOcDBAEhFdnI55ig1g3F1xtU/Vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MLGgC25Z; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MLGgC25Z"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3fc36b99e92so4735825f8f.0
        for <linux-tegra@vger.kernel.org>; Mon, 06 Oct 2025 22:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759814001; x=1760418801; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1pS3XDiQK8f8eyTQX//zdVzSc4GWTW1yqVKROF9NUcQ=;
        b=MLGgC25ZXEXd9ObP61oNddbu5h/EVLR3ENPvBTbnxgpZJS685STfaphC6v5CRZl7Bx
         z/qNT8m8A3XqZK9EpDa7BfvtnTl6LKZtDIc3oiz204PzJyoYJik8fVcAk2hgbuRR4HNx
         MFJhJdFNUgnqXkBGMu5Lw8gwMcKDS9Cy67ujiNhYdmaDEFbdH/Z7M6hNSIlq/0g1sYe+
         caVLBQrr6T+kUQE9mCk6MzyopBB9gUvDqDq1EoW4jCQxsOlm3WiCgEm3GPXuuJ7KnvIA
         j2jdArDXBsTqUGYHXerFaryUyu1K7FpZ/w6UFT8ffbYRIa/aw//ICsE64kXkMv29iYXE
         lsuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759814001; x=1760418801;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1pS3XDiQK8f8eyTQX//zdVzSc4GWTW1yqVKROF9NUcQ=;
        b=Ye35U8jtWOB1N3Dr7PqX5NE2ppPrbHegyg3c3RhCnAypNKa250oPhNrkdHrDUCAkRj
         Ddc9AvhfCQAQzd8Pc/7XJGUipMHXGkHG3pO4fFi8tizRteesTadcXUD54RHlY0NNM6jp
         Y8y5QqXBgvUBa7Iksip+tfM8ifVkazYV9sNabusH4LpxGPBQpbBkW9JV2bOoispR8Zza
         0jwgzNSFirhUogUso+u7Hm293OV1hddvTdQsg3ErVFkAk816bhTDV1SiLgWWXvF7ac8A
         lzMgtXFXUTgRjjgAJp2IGp9TRzNEGPSlUvN+XQS2xLz/GlaDYh1hyFyW6BIRpVSSqhgt
         9ssw==
X-Forwarded-Encrypted: i=1; AJvYcCXGC1yFiq2yAt5+YKvWEc5UG59J2/hTqv64PpdG3baWXU/oWujrEa5ybfK6TpnOxiVZLeujI6y6aUX1zQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0AC51zqiH9M+JsWXTVJlH8JkSD1ESnEa7FvpanlLuhy0USf7u
	MlTq82FP8ZA0mF+bJGIokXDuKR2CcgoM2sJYHGTTtbSBFd6JekFXafyLC8vrmB0py2v8RrZBdzh
	2QyCdNRVLD5CymwmEoU1DdstcdD2PmRI=
X-Gm-Gg: ASbGncsPWJZKfR0Rh/P59fzEzw3tYkn9maA1hAd2p4FZLmGpxYsnw/0girPrCvXCyfv
	1iZK04zK/X9KjpCX2pnYJWaj031qP5gANUkYOs28w5934hiQKNzAgRtMxCR56jVDNGXg/AAl3vM
	Pi3tILyU3hWwFos1YYZSQih2InkalR3VJJdcFuZKuh1UlVflpFnv/sV7GaVh6ByyqDqPFIY8yPN
	zRdWim8NC4Pjnw4c1AHEqKnvMGk6Mz+
X-Google-Smtp-Source: AGHT+IGV0xtcmM1zsg2OwGtKvJdRiIXrdxpv8K4QHttJAzVgt0D6HfXUccFjYZoOM3q6VTY6zRPYzZjolHquEvhvO7E=
X-Received: by 2002:a05:6000:26d1:b0:3ec:db87:ff53 with SMTP id
 ffacd0b85a97d-425829bf154mr1325418f8f.12.1759814001232; Mon, 06 Oct 2025
 22:13:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250925151648.79510-1-clamor95@gmail.com> <20250925151648.79510-21-clamor95@gmail.com>
 <20251002015244.GA2836647-robh@kernel.org> <CAPVz0n1By+akzp0t+GfF9nRzZ27NwYEikXxQ+=M=W2NEGpLNFw@mail.gmail.com>
 <20251006203148.GA523657-robh@kernel.org>
In-Reply-To: <20251006203148.GA523657-robh@kernel.org>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 7 Oct 2025 08:13:10 +0300
X-Gm-Features: AS18NWDkvx6agTucL7VNWr7MeuduCABFIlrIhwhvyaKckkFjZfLI9EvskSqNc_g
Message-ID: <CAPVz0n3CZTa8eV=gsJdpQ=yQ9sFbVd_vHAEpESP=Y6pE1=cLUw@mail.gmail.com>
Subject: Re: [PATCH v3 20/22] dt-bindings: display: tegra: document Tegra20
 and Tegra30 CSI
To: Rob Herring <robh@kernel.org>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Sowjanya Komatineni <skomatineni@nvidia.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Mikko Perttunen <mperttunen@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	=?UTF-8?Q?Jonas_Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>, 
	Dmitry Osipenko <digetx@gmail.com>, Charan Pedumuru <charan.pedumuru@gmail.com>, 
	Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>, Aaron Kling <webgeek1234@gmail.com>, 
	Arnd Bergmann <arnd@arndb.de>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D0=BD, 6 =D0=B6=D0=BE=D0=B2=D1=82. 2025=E2=80=AF=D1=80. =D0=BE 23:31=
 Rob Herring <robh@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Thu, Oct 02, 2025 at 08:14:22AM +0300, Svyatoslav Ryhel wrote:
> > =D1=87=D1=82, 2 =D0=B6=D0=BE=D0=B2=D1=82. 2025=E2=80=AF=D1=80. =D0=BE 0=
4:52 Rob Herring <robh@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
> > >
> > > On Thu, Sep 25, 2025 at 06:16:46PM +0300, Svyatoslav Ryhel wrote:
> > > > Document CSI HW block found in Tegra20 and Tegra30 SoC.
> > > >
> > > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > > ---
> > > >  .../display/tegra/nvidia,tegra20-csi.yaml     | 135 ++++++++++++++=
++++
> > > >  1 file changed, 135 insertions(+)
> > > >  create mode 100644 Documentation/devicetree/bindings/display/tegra=
/nvidia,tegra20-csi.yaml
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia=
,tegra20-csi.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,=
tegra20-csi.yaml
> > > > new file mode 100644
> > > > index 000000000000..817b3097846b
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra2=
0-csi.yaml
> > > > @@ -0,0 +1,135 @@
> > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > +%YAML 1.2
> > > > +---
> > > > +$id: http://devicetree.org/schemas/display/tegra/nvidia,tegra20-cs=
i.yaml#
> > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > +
> > > > +title: NVIDIA Tegra20 CSI controller
> > > > +
> > > > +maintainers:
> > > > +  - Svyatoslav Ryhel <clamor95@gmail.com>
> > > > +
> > > > +properties:
> > > > +  compatible:
> > > > +    enum:
> > > > +      - nvidia,tegra20-csi
> > > > +      - nvidia,tegra30-csi
> > > > +
> > > > +  reg:
> > > > +    maxItems: 1
> > > > +
> > > > +  clocks: true
> > > > +  clock-names: true
> > > > +
> > > > +  avdd-dsi-csi-supply:
> > > > +    description: DSI/CSI power supply. Must supply 1.2 V.
> > > > +
> > > > +  power-domains:
> > > > +    maxItems: 1
> > > > +
> > > > +  "#nvidia,mipi-calibrate-cells":
> > > > +    description:
> > > > +      The number of cells in a MIPI calibration specifier. Should =
be 1.
> > > > +      The single cell specifies an id of the pad that need to be
> > > > +      calibrated for a given device. Valid pad ids for receiver wo=
uld be
> > > > +      0 for CSI-A; 1 for CSI-B; 2 for DSI-A and 3 for DSI-B.
> > > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > > +    const: 1
> > >
> > > Sorry I didn't bring this up before, but is this ever not 1? If it is
> > > fixed, then you don't really need the property. I prefer it just be
> > > fixed rather than getting a bunch of vendor specific #foo-cells.
> > >
> >
> > This is not an introduction of property, such property already exists
> > in Documentation/devicetree/bindings/display/tegra/nvidia,tegra114-mipi=
.yaml
> > and is used in multiple device trees. As I have told before, in case
> > of Tegra30 and Tegra20 CSI block combines mipi calibration function
> > and CSI function, in Tegra114+ mipi calibration got a dedicated
> > hardware block which is already supported. This property here is used
> > to align with mipi-calibration logic used by Tegra114+
>
> Okay.
>
> You will have to continue to tell me again if my past questions are not
> addressed in the commit message. A review only last week was 100+
> patches ago. Don't expect I'll remember nor go re-read prior versions.
>

That is not a problem, I did not meant to offend you. I will add info
into commit message.

> Ideally, we don't define the type of a property more than once. So this
> should really first be moved to its own shared schema that's referenced
> here and in the original user. Then it is perfectly clear reading the
> patches that this is not a new property.
>

I am not sure that creating a dedicated shared schema for a single
properly which is used by 2 schemas worth it, though, if it is
preferred, may the refactoring be done in followups later?

> Rob
