Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2743B3AE6F4
	for <linux-tegra@vger.kernel.org>; Fri, 20 Mar 2026 13:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774012000; cv=none; b=DsciCjf8lRWH5PPrtpwD4lWeGNdLrmAF5bq9+vB1zWlF2xJZZHc3JlDQHMtlOxRD5GOqcEqUvPdn14G4iHYRhIV6Tceu9+2H1ZLHeXvsqq3YoHQnH/0RJZEuiBlSl+OLp+LgKOsoJxeU+GZQag2E5Iaque4ODxxy2JR2/ct7baQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774012000; c=relaxed/simple;
	bh=ohF9aj/ivf8FP5hU7Mx9A4FMUlEZTjOdQAIqZR4Tcf4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y3dn/d09RGvPkFUhentFuTUbZxmDJSfFNGR308ivPExZ3fIp9LIklgvyiMWa3870dGN1VSaMMOLEHCY59r+NLRS3b3pyYYDSHs8u1tzTdVarqBkB+czdjUu/QnZXsVEpKpqWJyfkIDW0Aem68LfnQK8HwC7gvLHimsN9LPoZz/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a48zzDes; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a48zzDes"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC5CAC2BCB2
	for <linux-tegra@vger.kernel.org>; Fri, 20 Mar 2026 13:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774012000;
	bh=ohF9aj/ivf8FP5hU7Mx9A4FMUlEZTjOdQAIqZR4Tcf4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=a48zzDesiWeA5MeHUVbwZmaN9Rqhunya+ApNTXZ5ckZR+Ire7m3LKH/bsVYdocdr4
	 Tff6aZSbsQa6s0IHfcJgzvv3MwpO1lEb51sskCkdJ5YnnzS8+Pfdj5iRvKj3vol6r6
	 PHVcKAM9bV4WpanynbWkfTAhNqfrr8+WXLc/p2E6n4A/dcL0c/cUu2Pd4LcxYf4SSC
	 D0mOK3hDALVBa9sav0rNru9o1tMY0h355vmSFJ3pz+v/4pEABU8xRoU4D7HZEvu79C
	 gjPoUoI0JI8PrQzVPzHSrIkoU048Zjr4M4xQdobTpY6B3A3ayd4xMepSPC7ny0z/PA
	 LN3v5obbqddfQ==
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-668abc98923so1096428a12.3
        for <linux-tegra@vger.kernel.org>; Fri, 20 Mar 2026 06:06:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXDR5Ko0GG6io6gGTzhJU2W4ggMnXct+xAVGY4lYAhrdYAseD3SNoWAlftyazrtQ7aAZG7WA0pgvVWBVw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzWyOYyJnw1QdllRQx6K9KixqTOb19clggc8DpSXpP30Yf6h3DL
	pSWptAFwsnGCv+HpQV96TkeCKxPwdwpg5IiLRVmoNqckknLGePNcSEdgisKmBMQ68YVX/a4BYhv
	Onw+aUOwVmq8tO1rbvpIVrPbTzglPQA==
X-Received: by 2002:a05:6402:510a:b0:668:599e:1038 with SMTP id
 4fb4d7f45d1cf-668c90fa1d6mr2450159a12.3.1774011998290; Fri, 20 Mar 2026
 06:06:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260319160110.2131954-1-thierry.reding@kernel.org>
 <20260319160110.2131954-4-thierry.reding@kernel.org> <CAL_Jsq+smyMYE_oexRc9wEJgMxdUxSwg7p8Bex8q6J6PrwZZ+Q@mail.gmail.com>
 <ab0U5bfZ2hwp-GST@orome>
In-Reply-To: <ab0U5bfZ2hwp-GST@orome>
From: Rob Herring <robh@kernel.org>
Date: Fri, 20 Mar 2026 08:06:26 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJuoOiBGKW=H=u9AQ=XgY+-iXS+UP7iEw5z6p57Yk_AVw@mail.gmail.com>
X-Gm-Features: AaiRm52tHBx-J7zXWNYPLeZXnVQ_VCNCLwgZfhjsAdP857lNCkM_8--t64jKBsE
Message-ID: <CAL_JsqJuoOiBGKW=H=u9AQ=XgY+-iXS+UP7iEw5z6p57Yk_AVw@mail.gmail.com>
Subject: Re: [PATCH 3/5] dt-bindings: pci: Document the NVIDIA Tegra264 PCIe controller
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jon Hunter <jonathanh@nvidia.com>, linux-pci@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 20, 2026 at 4:39=E2=80=AFAM Thierry Reding
<thierry.reding@kernel.org> wrote:
>
> On Thu, Mar 19, 2026 at 04:26:31PM -0500, Rob Herring wrote:
> > On Thu, Mar 19, 2026 at 11:01=E2=80=AFAM Thierry Reding
> > <thierry.reding@kernel.org> wrote:
> > >
> > > From: Thierry Reding <treding@nvidia.com>
> > >
> > > The six PCIe controllers found on Tegra264 are of two types: one is u=
sed
> > > for the internal GPU and therefore is not connected to a UPHY and the
> > > remaining five controllers are typically routed to a PCI slot and hav=
e
> > > additional controls for the physical link.
> > >
> > > While these controllers can be switched into endpoint mode, this bind=
ing
> > > describes the root complex mode only.
> > >
> > > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > > ---
> > >  .../bindings/pci/nvidia,tegra264-pcie.yaml    | 92 +++++++++++++++++=
++
> > >  1 file changed, 92 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/pci/nvidia,tegr=
a264-pcie.yaml
> > >
> > > diff --git a/Documentation/devicetree/bindings/pci/nvidia,tegra264-pc=
ie.yaml b/Documentation/devicetree/bindings/pci/nvidia,tegra264-pcie.yaml
> > > new file mode 100644
> > > index 000000000000..56d69de2788b
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/pci/nvidia,tegra264-pcie.yaml
> > > @@ -0,0 +1,92 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/pci/nvidia,tegra264-pcie.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: NVIDIA Tegra264 PCIe controller
> > > +
> > > +maintainers:
> > > +  - Thierry Reding <thierry.reding@gmail.com>
> > > +  - Jon Hunter <jonathanh@nvidia.com>
> > > +
> > > +properties:
> > > +  compatible:
> > > +    const: nvidia,tegra264-pcie
> > > +
> > > +  reg:
> > > +    minItems: 4
> > > +    maxItems: 5
> > > +
> > > +  reg-names:
> > > +    minItems: 4
> > > +    maxItems: 5
> > > +
> > > +  interrupts:
> > > +    minItems: 1
> > > +    maxItems: 4
> > > +
> > > +  dma-coherent: true
> > > +
> > > +  nvidia,bpmp:
> > > +    $ref: /schemas/types.yaml#/definitions/phandle-array
> > > +    description: |
> > > +      Must contain a pair of phandle (to the BPMP controller node) a=
nd
> > > +      controller ID. The following are the controller IDs for each c=
ontroller:
> > > +
> > > +      0: C0
> > > +      1: C1
> > > +      2: C2
> > > +      3: C3
> > > +      4: C4
> > > +      5: C5
> > > +    items:
> > > +      - items:
> > > +          - description: phandle to the BPMP controller node
> > > +          - description: PCIe controller ID
> > > +            maximum: 5
> > > +
> > > +unevaluatedProperties: false
> > > +
> > > +required:
> > > +  - interrupt-map
> > > +  - interrupt-map-mask
> > > +  - iommu-map
> > > +  - msi-map
> > > +  - nvidia,bpmp
> > > +
> > > +allOf:
> > > +  - $ref: /schemas/pci/pci-host-bridge.yaml#
> > > +  - oneOf:
> > > +    - description: C0 controller (no UPHY)
> > > +      properties:
> > > +        reg:
> > > +          items:
> > > +            - description: application layer registers
> > > +            - description: transaction layer registers
> > > +            - description: privileged transaction layer registers
> > > +            - description: ECAM-compatible configuration space
> > > +
> > > +        reg-names:
> > > +          items:
> > > +            - const: xal
> > > +            - const: xtl
> > > +            - const: xtl-pri
> > > +            - const: ecam
> > > +
> > > +    - description: C1-C5 controllers (with UPHY)
> > > +      properties:
> > > +        reg:
> > > +          items:
> > > +            - description: application layer registers
> > > +            - description: transaction layer registers
> > > +            - description: privileged transaction layer registers
> > > +            - description: data link/physical layer registers
> > > +            - description: ECAM-compatible configuration space
> > > +
> > > +      items:
> > > +        - const: xal
> > > +        - const: xtl
> > > +        - const: xtl-pri
> > > +        - const: xpl
> >
> > Put this entry last since it is the optional one. Then you can move
> > all of this to the top-level and get rid of the duplication.
>
> I understand this concern and was actually on the fence about this
> myself. The reason why I ultimately went with this variant is for two
> reasons:
>
>   1. XPL does not exist for controller 0, the variant above makes that
>      very explicit. It explicitly documents that controller 0 is used
>      for internal purposes and cannot be connected to an external port
>      like the other five controllers.

That doesn't really matter to the schema because it can never check
that unless you have 2 different compatibles (and you shouldn't).

>   2. The ECAM region is part of a memory region specifically reserved
>      for configuration space, whereas all of the other regions are
>      from the controller's MMIO region. I find the DT hard to read if
>      the two are interleaved.

I was also going to suggest putting ECAM first just to align with the
generic host binding. That would make it slightly easier to rewrite
the node if you decided to make it a firmware initialized controller.

But if you really want it all as-is, fine.

Rob
