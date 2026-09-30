Received: from mail-dy2-f42.google.com (mail-dy2-f42.google.com [74.125.229.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4B883D954F
	for <linux-tegra@vger.kernel.org>; Wed, 30 Sep 2026 09:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790761954; cv=pass; b=hmQakC25y6ObCPp9xGV8NarD8A5wCX9aDbi2LnJNhy0aCU8v6IVZnjftOVV+4P08Vjxp5tt3oopAnMefac2jo3j3Vld3oQ/GibkoWPiQAO+cqbsaRkhfXiKH1b1gl4fiO9Zz3+t+do12V7wH6eWp2yMN8IAKYIHThfr8U46DGgA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790761954; c=relaxed/simple;
	bh=bjD/Y05Lpd5GylJNzOLs802z3oVBzEjhypxLuBXLRos=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xgjv5YqvmvZVGri0b+8dbB0CrgP2RpgRNh/inxbwQ7vwF6HAu4IxeHG9WcyqQTU72mxet8PeHDfS3TT6K0HnqmwEiazdw85Qgzj/n5W/6N4pjfI+EkriHKVcVlhkIn+ur4kXCiCpieCTaPLUZo/JVGJCfq6x4WgCq/R9Syk2J1M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=URJwwz3Q; arc=pass smtp.client-ip=74.125.229.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="URJwwz3Q"
Received: by mail-dy2-f42.google.com with SMTP id 5a478bee46e88-3411e0ace58so6533151eec.0
        for <linux-tegra@vger.kernel.org>; Wed, 30 Sep 2026 02:52:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790761950; cv=none;
        d=google.com; s=arc-20260327;
        b=Bb+Eux60wbP5AfPQH56cNfplq+GOggnYr5NHT9PyJzCfj0pRtDVXk6TnuN64LduPgo
         ErM5X6Yj6JAKMb0xa3RAaTAEjB9t/trh/f85FjMTQmEc/QqWEoWDHUkYLIXla86jSL5J
         0QCTGjo4pHDh/smriDxrpGhkk5iIE0PznRCVb/Mkgalw0kvlI114tJE/HSZwPyfZztIF
         PCtbtAJCvCLtavQBAwyiNfhoOK+q33O4K4+vmDY4Jsy18GIXSSh35LRA/qtT0Dz/dZjU
         zeprtVqRv6wqi3n7DYbxADxOAP5Ddjo+gsLxw/CmgvpYzO/d29xDY7rQFU+CkosQsV+H
         Vr2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PRT+bVkpUAp+N5S99zEO9+WtEZoje0u1sUGfRr0LWg4=;
        fh=zF8GIiJtEnH1B/P/pQsBzA3P6WHGDjBe7s/Lx7INIcQ=;
        b=eYmAPGAjcKzS+M9kElWwIGQoIOEmFMgI6x5hhwRiArAU2krIoK87/LYlP2G+g6AjxP
         +A8e5iS8CUReqlmJLo9f0ZFEcg21LQpITNuLaAgUaOglFS+MjK2wwPBKWE4PqiWLpyJ1
         0EUgDyyzY1QExMV5550nz5mz0m1yKlKqkF41e+jY07TDMUbcmIgxFyldCmExlui6knV/
         3Qb2Zn2P3LG019i/SEXDbRvkWsry+NsIbqkLb9NAMeKhFbM/5mugEZoP9ZqUnH6o2bus
         1J+zu+HWhHE9gdv6Fp2yeXvEiWYi5zwM2icZBpXJ2XGru73FAmKv2L13OtU9KnLmG1xl
         rFew==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790761950; x=1791366750; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PRT+bVkpUAp+N5S99zEO9+WtEZoje0u1sUGfRr0LWg4=;
        b=URJwwz3Q5weOK8SyIeMRj5F6yJ9v6l6sXJ9AbEhqyfRMLLcEgG/y0ajmZtJelRTAgY
         tpIHSS/f7fHcbTiCmSMJpRDVXhxlwk2Nz4zkVvQtPUXAbhYzzR9mxKnrFAKqxXAI8XvH
         sNZtB4MbFXRo5nmUKBRar6YsUmjYMFmpTs5nL5m4UXzF8NjeaixLrY50K481otxFBPUy
         OGTrrWcTvatQ78993Scd09nN3nsBqIgFhQnJ90OFlfvPUgNuyanY/OaDmWsp2FcnAnF1
         Qtb56g8dBAza1X7uoXnI676Do76lJ0DRXrX1TFtWdS4HV1/+27LWpLQZi1O7sURziALW
         NwFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790761950; x=1791366750;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PRT+bVkpUAp+N5S99zEO9+WtEZoje0u1sUGfRr0LWg4=;
        b=Shh9mQ/nemB/GU/89d7eOt3p9AdFKRN0RIb4321AU1EKrHDRZGTwEEfHGxARBFjz6i
         pyY1e61Zp+6eiG2u960CYxuQIVbTnN9Pe9ry0cejY1J6ymxFfZtnTsuPPodmnUAhKEA3
         prCNbsQXPEp7dWJtL+ypBsfl5Nwni+k2mfItqnkHQq/d5CgruvUVPQfUY2Tybel82F5c
         iqWyMot/hxUheC40ZhQl+SinccJTEvmWiZE1OcuYyngU6PdDoHsNsxiWWMs+vudAZYhD
         IgAANSfCL/tD+97eWQtoGEPq1L91Za3Awx+1cW9/+IbXwYI8LN9mtulxXtGilODOim/F
         mD6g==
X-Forwarded-Encrypted: i=1; AKwUvBxuPFsJNmHUWAwzMvfWyCl4wEz0l+Lgyf2GHbS/PebkCcOpxHIM7vEV1mac0xx41+96WsOie3Cbziw8Gg==@vger.kernel.org
X-Gm-Message-State: AFuF++mmnbpLprM1ciizpzWbV0zpXvJ4UscI8IWeH+TxGeM5m08pefEq
	thlENMbbwb0enrBc7/rOmTO+0Ba+oMZQC/X9Nok1mBC5mpSnGLVQjCy09IW7ER7ZMeQseVvqhEp
	YtpiYlsZvGVCR6354JzWS5FDEvRWAQhQ=
X-Gm-Gg: AYBFou3IbQSBtdDaPHxhbK2llUHrRhBvTm+KJupZkQwpWdVh3j7xAtUL6RroiUk/Ibg
	AKtLZRlm0X8p9x5V6aKfipMUjNUwQL2b6d2qzM4Hv58Oc+HNFFk4TKPkifx1SjNOKmr56iQnh9F
	38V1D97Obd4dC6XehiQvyQt9m+bQvhYqqiMA5PYK1cieZcBme8E5peuUZxLlQ1XeHg9V1NjcON+
	/kYkPBZkFPbQNnV2+2CN0ZryAfGqD8ILnPneIovoZwlBe9HYUgah+8vLUrdJluW10pSGmTAfYXg
	NCxvuEvpVO2E/AE5gMfmzTHCcaEeEz1VqxCcKwO2GL/Gr78/aooZmqNfeBrz6PQo56fMWWXpRqf
	EZv/56hHTG5u/
X-Received: by 2002:a05:7301:2624:b0:342:d7a0:2f40 with SMTP id
 5a478bee46e88-34cdbbd634cmr1436523eec.7.1790761949877; Wed, 30 Sep 2026
 02:52:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260930070535.47130-1-clamor95@gmail.com> <20260930070535.47130-4-clamor95@gmail.com>
 <UJZ22UtaS1GSRPlyAst1og@nvidia.com>
In-Reply-To: <UJZ22UtaS1GSRPlyAst1og@nvidia.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 30 Sep 2026 12:52:18 +0300
X-Gm-Features: AclHuK_PjMkrSZpZDbHZxmDO9H7m9qGOop4eAvIoUg-ZusCaq49UWziUnYzuIM8
Message-ID: <CAPVz0n2F8LBqFs2bJERmgvdNYgtt1OEVtK3++CP9y0gxW7gCGA@mail.gmail.com>
Subject: Re: [PATCH v1 3/6] dt-bindings: display: tegra: Document 8-bit CPU
 parallel interface
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=81=D1=80, 30 =D0=B2=D0=B5=D1=80. 2026=E2=80=AF=D1=80. =D0=BE 12:19 Mikk=
o Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Wednesday, September 30, 2026 4:05=E2=80=AFPM Svyatoslav Ryhel wrote:
> > Document 8-bit CPU parallel MIPI DBI Type B interface provided by
> > Tegra20/30 SoCs display controller.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  .../display/tegra/nvidia,tegra-8bit-cpu.yaml  | 138 ++++++++++++++++++
> >  1 file changed, 138 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/display/tegra/nvi=
dia,tegra-8bit-cpu.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,teg=
ra-8bit-cpu.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,t=
egra-8bit-cpu.yaml
> > new file mode 100644
> > index 0000000000000..f0dab608b2936
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra-8bit=
-cpu.yaml
> > @@ -0,0 +1,138 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/display/tegra/nvidia,tegra-8bit-cpu=
.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Nvidia Tegra DC based MIPI DBI Type B bridge
> > +
> > +maintainers:
> > +  - Svyatoslav Ryhel <clamor95@gmail.com>
> > +
> > +description: The display controller in Tegra20/30 SoCs features an
> > +  8-bit SPI interface that closely resembles the MIPI DBI Type B
> > +  protocol and is referred to as '8-bit CPU'. Each display controller
> > +  provides two such interfaces, which can be used to send MIPI DCS
> > +  commands to initialize and control the panel while image data is
> > +  transmitted via 16/18/24-line RGB.
> > +
> > +properties:
> > +  compatible:
> > +    const: nvidia,tegra-8bit-cpu
> > +
> > +  dc-gpios:
> > +    description: Data/command selection pin.
> > +    maxItems: 1
> > +
> > +  rw-gpios:
> > +    description: Read/write pin.
> > +    maxItems: 1
> > +
> > +  cs-gpios:
> > +    description: Chip select pin.
> > +    maxItems: 1
> > +
> > +  data-gpios:
> > +    description: Specifies a set of 8 gpio pins used to transfer data.
> > +    minItems: 8
> > +    maxItems: 8
>
> Based on my admittedly brief research, according to the TRM the display
> controller can drive all of these pins - of which there are two fixed
> sets as you mention - directly. So we'd need to describe which interface
> the display is connected to in DT, but not any GPIOs (which they really
> aren't).
>

I am perfectly fine to not expose any gpios in the binding, if this is
preferred. Only question, which method of interface checking would be
preferred. I assume if primary then nothing, if secondary - boolean
prop "nvidia,secondary"? Feel free to share your vision.

> > +
> > +  nvidia,init-sequence:
> > +    $ref: /schemas/types.yaml#/definitions/uint32-array
> > +    description: Device specific set of values used in DC DISP_SPI_INI=
T_SEQ
> > +      registers.
> > +    minItems: 4
> > +    maxItems: 4
>
> And AIUI this is panel-specific DBI commands the display controller will
> transmit. So ideally the display driver should receive this data from
> the panel driver.
>

This is not panel driver data, but it is panel or maybe even more
interface itself specific. TRM has no clear method of generation of
this seq I am aware of. Maybe I have missed smth. These 4 entries
co-respond to DC_DISP_SPI_INIT_SEQ_DATA_A_0,
DC_DISP_SPI_INIT_SEQ_DATA_B_0, DC_DISP_SPI_INIT_SEQ_DATA_C_0 and
DC_DISP_SPI_INIT_SEQ_DATA_D_0 registers of DC. Maybe you have some
info to shed some light onto method of generation of this seq. Then it
could be simply removed from binding and calculated internally. Thank
you!

> Thank you
> Mikko
>
