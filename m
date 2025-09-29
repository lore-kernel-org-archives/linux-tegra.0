Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FCEF30649C
	for <linux-tegra@vger.kernel.org>; Mon, 29 Sep 2025 15:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759159537; cv=none; b=gjREexZkH14KbFhT7Fe5ew9u8zA7Q/AODIhfQmrmwhVJAaAt1fbdyOTMT+9S8OX3vH6c6ktRTg1GsvMYcZQGy25iI2TCS8k0TGtslmDsY0H3HyloDzou7I61wSjZ1it9P4dxlD7sRo5gY4bhFgZUPWJG59zqJ/NQGovMYvEFH2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759159537; c=relaxed/simple;
	bh=WqUBNIieLr+/SDUl7fJ2+wJvwBysLw779QEJCJRdSXI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=noLNiKtP5n5SQN0gQgd8MlRhXLvg9/YE3MgKxFvAPR6GtGw0G4Vp2m8S/dmDGZqjSdbV5/x2OFsCzTOvJyrr0oEtvJ1U+TSELU8jBvBqoVYytWlwhwWWF54lWXhSw8rRm7BDPqb6FDi5TYq9dYAQlCuCULDSI1l2bSpCS2fRYeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NUBt8klt; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NUBt8klt"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-62fc89cd68bso8826391a12.0
        for <linux-tegra@vger.kernel.org>; Mon, 29 Sep 2025 08:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759159534; x=1759764334; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XM7Ve+zCeQD9Us3byXLLiKeLQOT/5uriOByaGQErVyU=;
        b=NUBt8kltUqZhXyK4hJm8Cjkw+LC9UY2a0uGMWQkc2KXkIszHV3XgMds21ycusLnC0+
         S+pJ+uxDyLsadhukix2kkLod9udf8v1UYaQj4Gs3dSbMOTtBUtiBhFvfE01Y/dCAzY4i
         fZKmWpIxxFm8tDlBX3dtvLIRkZ6KlWw5R1tD92g3k3sv6qQtJwvof7bD6z486wc/VjZt
         W/gUI124PSCoVa1wMzrH6gsetOgQktN+53VCHzGJRaWsoYeEbxv+Gs4Has4jhsNSQxY7
         tjOVIurqM6YQDVvZBSYkonMI4t6SEd5S/r+Jud09VgwEd51evTV6GoIeuHw8fwKb3mDE
         bCug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759159534; x=1759764334;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XM7Ve+zCeQD9Us3byXLLiKeLQOT/5uriOByaGQErVyU=;
        b=SOPnj2hjdPHNwY43s8xhVxm6n7+yReXsQKh8rhwhZQolIP6BsGGUWlLvOoW1AuNmuW
         JMvXiRCktzcgqhAWBf4oPaw3jv+8kRVgWUsG8N9ZG1xokrlt1Fb6vzK8oVcYhrEw+P9R
         003EVTSh8RDy0ldEdZGcwOBf0CIEZI2o0bREUwtlN7DdhnlzIPGWqZgxSsOp4X5N6qR8
         vmQ5DZJIT0Hv7+HxeKoLdVkZqetUTN5DTJEN82OLXPtpdMd4EgEVfhf8cLpD6EfgdLCc
         6uM79oHEOI+vacSsRMNzzVDd8SpSC+XYFI0s4U+xJSVRhkFprarlyA9xFiuDbqa2yArx
         9DKA==
X-Forwarded-Encrypted: i=1; AJvYcCV/3EMfoXTMjRHg7LOB6bKPlAMJd0ICPzaxYn0Ekhf87f5GtrcvgSkJw6HWJ1UG2+/thROStyrrq3pl6g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxaaAnKgf1cAEYrGfnjIAObJxppoNmSxxlnWMxTf2PlYdtz2dw+
	qtS8dXmq60rxS8CWWUeIQOeukj0ZLuYl6OqzOGRd9/LcBL1MdHiNNHPw3bMjvOP5ZLTbAYPFdg7
	telZecZxbQ9SiUJO+NF3ocYh1+9IGDYQ=
X-Gm-Gg: ASbGnctiZVRXwtRM8jGlcy53KUd7nazwiVO2/yGpzRqr0BjwHImGyT41Wz5bd7YkpWE
	0XJAhzx/pyzWrW920gEhI4xeDyCP6pcCx/Rdh8KSsSNMS7TRKtID6YZaQaQTSayV/oCkiiGNCYR
	hpVLiWl8XnYNy7l+s74vqsWYKN+nueE2oNY06L2gxawmRbIyL2eqGeittBhD5Z7KoNMH+3xuYBU
	WqqRdhpdowrEEG8
X-Google-Smtp-Source: AGHT+IFwe17UC7MYtlo9fqz6j6lKTKHcT6Cp15AoADwNa8B11f2RIkJdNXpIBJu2cwq7fPZxo+aZhrIt+fOXvufaEJs=
X-Received: by 2002:a50:ec8d:0:b0:62f:64b0:9cc2 with SMTP id
 4fb4d7f45d1cf-6349fa18ec3mr13281695a12.16.1759159533363; Mon, 29 Sep 2025
 08:25:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250926072905.126737-1-linux.amoon@gmail.com>
 <20250926072905.126737-2-linux.amoon@gmail.com> <CAL_JsqJr+h7pTvbRR=7eB4ognK70D1pgNXEORGXo=ndND=pMjw@mail.gmail.com>
 <CANAwSgT3jo35xBvkH4GmQcZuZH=D+SRKJ6e9fSBRz45zwuCmYw@mail.gmail.com> <CAL_JsqLsEDFv4T1ZMmjaoFfs7WNAjVvOk9o1eTXL2EeGF8uuDA@mail.gmail.com>
In-Reply-To: <CAL_JsqLsEDFv4T1ZMmjaoFfs7WNAjVvOk9o1eTXL2EeGF8uuDA@mail.gmail.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Mon, 29 Sep 2025 20:55:15 +0530
X-Gm-Features: AS18NWCn_NJWEobZTnJPq6GUQ_ZdFFQBFLXaMyvo-IrsDPmU5O_jcKkJFA3qXlk
Message-ID: <CANAwSgTuX3t2-SNPe4OAzGuDpL5RotxX8t+Zx+gcwFKdj3ZEng@mail.gmail.com>
Subject: Re: [PATCH v1 1/5] dt-bindings: PCI: Convert the existing
 nvidia,tegra-pcie.txt bindings documentation into a YAML schema
To: Rob Herring <robh@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	"open list:PCI NATIVE HOST BRIDGE AND ENDPOINT DRIVERS" <linux-pci@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Rob

On Mon, 29 Sept 2025 at 19:19, Rob Herring <robh@kernel.org> wrote:
>
> On Mon, Sep 29, 2025 at 2:40=E2=80=AFAM Anand Moon <linux.amoon@gmail.com=
> wrote:
> >
> > Hi Rob,
> >
> > Thanks for your review comments
> >
> > On Fri, 26 Sept 2025 at 19:26, Rob Herring <robh@kernel.org> wrote:
> > >
> > > On Fri, Sep 26, 2025 at 2:29=E2=80=AFAM Anand Moon <linux.amoon@gmail=
.com> wrote:
> > > >
> > > > Convert the legacy text-based binding documentation for
> > > > nvidia,tegra-pcie into a nvidia,tegra-pcie.yaml YAML schema, follow=
ing
> > >
> > > s/YAML/DT/
> > >
> > Ok,
> > > > the Devicetree Schema format. This improves validation coverage and=
 enables
> > > > dtbs_check compliance for Tegra PCIe nodes.
> > >
> > > Your subject needs some work too. 'existing' and 'bindings
> > > documentation' are redundant.
> > >
> > Here is the simplified version
> >
> > dt-bindings: PCI: Convert the nvidia,tegra-pcie bindings documentation
> > into a YAML schema
>
> Still doesn't fit on one line and you say bindings twice:
>
> dt-bindings: PCI: Convert nvidia,tegra-pcie to DT schema
>
Ok
> >
> > Convert the existing text-based DT bindings documentation for the
> > NVIDIA Tegra PCIe host controller to a YAML schema format.
>
> s/YAML/DT/
>
> Lots of things are YAML. Only one thing is DT schema.
Ok, understood.
>
> >
> > > >
> > > > Cc: Jon Hunter <jonathanh@nvidia.com>
> > > > Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> > > > ---
> > > > v1: new patch in this series.
> > > > ---
> > > >  .../bindings/pci/nvidia,tegra-pcie.yaml       | 651 ++++++++++++++=
+++
> > > >  .../bindings/pci/nvidia,tegra20-pcie.txt      | 670 --------------=
----
> > > >  2 files changed, 651 insertions(+), 670 deletions(-)
> > > >  create mode 100644 Documentation/devicetree/bindings/pci/nvidia,te=
gra-pcie.yaml
> > > >  delete mode 100644 Documentation/devicetree/bindings/pci/nvidia,te=
gra20-pcie.txt
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/pci/nvidia,tegra-pci=
e.yaml b/Documentation/devicetree/bindings/pci/nvidia,tegra-pcie.yaml
> > > > new file mode 100644
> > > > index 000000000000..dd8cba125b53
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/pci/nvidia,tegra-pcie.yaml
> > > > @@ -0,0 +1,651 @@
> > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > +%YAML 1.2
> > > > +---
> > > > +$id: http://devicetree.org/schemas/pci/nvidia,tegra-pcie.yaml#
> > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > +
> > > > +title: NVIDIA Tegra PCIe Controller
> > > > +
> > > > +maintainers:
> > > > +  - Thierry Reding <thierry.reding@gmail.com>
> > > > +  - Jon Hunter <jonathanh@nvidia.com>
> > > > +
> > > > +description: |
> > >
> > > Don't need '|'.
> > >
> > Ok
> > > > +  PCIe controller found on NVIDIA Tegra SoCs including Tgra20, Teg=
ra30,
> > > > +  Tegra124, Tegra210, and Tegra186. Supports multiple root ports a=
nd
> > > > +  platform-specific clock, reset, and power supply configurations.
> > >
> > > I would suggest not listing every SoC here unless the list is not goi=
ng to grow.
> > >
> > Here is the short format.
> >   PCIe controller found on NVIDIA Tegra SoCs which supports multiple
> >   root ports and platform-specific clock, reset, and power supply
> >   configurations.
> > Ok
> > > > +
> > > > +properties:
> > > > +  compatible:
> > > > +    oneOf:
> > >
> > > Only 1 entry here, don't need 'oneOf'.
> >
> > I am observing the following warning if I remove this.
> >
> >  make ARCH=3Darm64 -j$(nproc) dt_binding_check
> > DT_SCHEMA_FILES=3DDocumentation/devicetree/bindings/pci/nvidia,tegra-pc=
ie.yaml
> >   CHKDT   ./Documentation/devicetree/bindings
> > /media/nvme0/mainline/linux-tegra-6.y-devel/Documentation/devicetree/bi=
ndings/pci/nvidia,tegra-pcie.yaml:
> > properties:compatible: [{'items': [{'enum': ['nvidia,tegra20-pcie',
> > 'nvidia,tegra30-pcie', 'nvidia,tegra124-pcie', 'nvidia,tegra210-pcie',
> > 'nvidia,tegra186-pcie']}]}] is not of type 'object', 'boolean'
>
> Because you made 'compatible' a list rather than a schema/map/dict.
> IOW, You need to remove the '-' as well.
>
Ok fixed.
>
> > > > +  nvidia,num-lanes:
> > > > +    description: Number of PCIe lanes used
> > > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > >
> > > The examples show this in child nodes.
> > yes it patternProperties example I missed this.
> >
> > patternProperties:
> >   "^pci@[0-9a-f]+$":
> >     type: object
> >
> >     properties:
> >       reg:
> >         maxItems: 1
> >
> >       nvidia,num-lanes:
> >         description: Number of PCIe lanes used
> >         $ref: /schemas/types.yaml#/definitions/uint32
> >         minimum: 1
> >
> >     unevaluatedProperties: false
>
> What about all the other properties in the child nodes? You need a
> $ref to pci-pci-bridge.yaml as well.
Thanks for the input.

patternProperties:
  "^pci@[0-9a-f]+$":
    type: object
    allOf:
      - $ref: /schemas/pci/pci-host-bridge.yaml#
      - properties:
          reg:
            maxItems: 1
          "#address-cells":
            const: 3
          "#size-cells":
            const: 2
          nvidia,num-lanes:
            description: Number of PCIe lanes used
            $ref: /schemas/types.yaml#/definitions/uint32
            minimum: 1
        required:
          - "#address-cells"
          - "#size-cells"
          - nvidia,num-lanes
    unevaluatedProperties: false

> Rob

Thanks
-Anand
