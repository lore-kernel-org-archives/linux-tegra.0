Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1E742472A8
	for <linux-tegra@vger.kernel.org>; Tue, 30 Sep 2025 16:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759249969; cv=none; b=YOB4lKCw7v9ZMwKksSNYKMqIKaqUsZ9J0UqnKbGZfMeeKxQCu3liGAoZk6uZ5sW/ml3D5tgJOWFuYaswO+9moq2z6HR+pOEUBxXci9srwXjWBf6eUs9i+PviGPzJ7YxlqKBgaecJFfJytjoEQdZsQTtVhkHsVco3JToqPMzLElM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759249969; c=relaxed/simple;
	bh=oGF9yTei1g4gjv/QnS3yVyRP9PJi1rFlCgAm1v7R6Zo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Aouhp9S/4Uj/G+EYopTXAR3dNSmu+BfW37zOYYTUdtDVm3a9kyT9av0sxoMCPGA1BWdWQVB84Z+UmGRoyeh6aAuxeKcMCnO5/n1GvaTAd8pz8pvkCZ82+dFi4K6nI3AppPaOGA9gQFPd7nXYkd8kJYscTi2q8hW962nknh2+rGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G7TMdf3c; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G7TMdf3c"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6364eb29e74so4394696a12.0
        for <linux-tegra@vger.kernel.org>; Tue, 30 Sep 2025 09:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759249966; x=1759854766; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ywr/T8H21r9AOyqjIoUOVLC27W+yILSMEGkAVkNfxfs=;
        b=G7TMdf3cbEgC8ruzjQ/JedFDAGQBz35rZtqyh5LkKc7R6XvJOSjv/SM2wBW68YceZY
         S3NC0IMiV3uWjR5j3McYbz49lEMMfl14gYl/F9Co7IW5p08jZZDq0MxPIrFkrUOSlxoT
         k6pR0Sn7/9PWhkY40lt9KnJa74j6sAv4GHNHqiFE7Fz25Aff2wOvm6VWBhmCBRbs8C1a
         3f0t9nE5Xx7B27qVGXyzx2LtkrHA8HlRFWgO+nU/F0Bt9Y0WH8cwkYVQJipQAn3uEW8T
         LyXY8b5e325zk4Ox3mLdnQjyEPLoWxJTrSY5GQMx39t2vj6UmjedDvc+Ty4fI+/V66uH
         B1kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759249966; x=1759854766;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ywr/T8H21r9AOyqjIoUOVLC27W+yILSMEGkAVkNfxfs=;
        b=epUoZHOIRy4aLjER9v/g2Myh5NSGtCXCqcqD8s9aGputVekSoVTfpn6hOje0CW0nvA
         st6ZQd4A6vKMyRdoVakqhyt7DCAibnglw4xmWNp4B+4TiSxkbWDfZDQT13qFCFpiCJ7e
         iIoVr53RRyH4+bEWeAh22CgR4m1sxXoCI3Kh2F52CTx7a96Xh91HRZrH7XRW999+r2jC
         6OSGujIZ6KAaeZEiX/CHdRPbBULDkYk38F28qcaQa2R1nTc2cjod3HIJpYlyjfqhsDCE
         UTAqMlFPw0h04NHtSC+5r9aYGJSKUdaEpjhWM7lBHcNAwU4ys1GPzQbztOz1Vno7vyia
         8kcQ==
X-Forwarded-Encrypted: i=1; AJvYcCWGq1UEHGN/yMpXWUuIZKTk28Y/Pw35kOa2ooGQl5Z2+FXkH2075/TWGLKqJ0/DGu68PrJxnnOiXeZR0w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxtEwY/TxtTd4VPghSgClHykNGrwGW0YRs4EFKiDnO9zwFP19u5
	3NzjzvFtg18MG4kJ6GjPa/ee7+dGejCcJKrmkNm5HrzVJYdsxBxrtPKsIei0D1D4hQdVoWAJc6l
	LQ8UgAAD7KXG/IfBxFDrYdFs+d4a2YSfzlXbs9IE=
X-Gm-Gg: ASbGncv8EcgAdSIx3CZJmJrO64aKGECLvA/pFxFpIiIZsvnmPXq+f0sPJshJ6mq0K8J
	/MC5peDNIzM9vu+bamWsAYMWRRj0DsOl8Lq3wR+2dQZikUYO2sPujypFzzdvW9TzBo78RoDCPsC
	ItM9t/e6/3b5miHEgcH2TdcJ7C0WvmKoJ7B9iUsvyA7d+7ecP4wQkh0P7PN+GdvzDYYgDGM+ub7
	8ewCJOFEQBPqc1S8dId/yqeEUlw7Q==
X-Google-Smtp-Source: AGHT+IEJHPU/9y3qBt/SABv++MOXGcN86o3VBfE4lwa8ckg4ceTKcaWY4Edg+8QEKEvz47kn06lNSjx+U7OGCjruhFQ=
X-Received: by 2002:a05:6402:51c6:b0:634:ba7e:f6c8 with SMTP id
 4fb4d7f45d1cf-63678d17922mr511880a12.34.1759249965859; Tue, 30 Sep 2025
 09:32:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250926072905.126737-1-linux.amoon@gmail.com>
 <20250926072905.126737-2-linux.amoon@gmail.com> <CAL_JsqJr+h7pTvbRR=7eB4ognK70D1pgNXEORGXo=ndND=pMjw@mail.gmail.com>
 <CANAwSgT3jo35xBvkH4GmQcZuZH=D+SRKJ6e9fSBRz45zwuCmYw@mail.gmail.com>
 <CAL_JsqLsEDFv4T1ZMmjaoFfs7WNAjVvOk9o1eTXL2EeGF8uuDA@mail.gmail.com>
 <CANAwSgTuX3t2-SNPe4OAzGuDpL5RotxX8t+Zx+gcwFKdj3ZEng@mail.gmail.com> <CAL_JsqKBhzPwxYguy+N=eddG2nwB54dzw307A6KT5NJpRSh-Mg@mail.gmail.com>
In-Reply-To: <CAL_JsqKBhzPwxYguy+N=eddG2nwB54dzw307A6KT5NJpRSh-Mg@mail.gmail.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Tue, 30 Sep 2025 22:02:28 +0530
X-Gm-Features: AS18NWDpwy8wPfpGXTgiB-hfuQbqsocd9S2KZlBOjIaIkDW6NFhuEmGm8l9CeiA
Message-ID: <CANAwSgTKFSf-EUGSpErdS1Y93AwunFOK7omH4T+gE_z2XttVtw@mail.gmail.com>
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

On Tue, 30 Sept 2025 at 20:07, Rob Herring <robh@kernel.org> wrote:
>
> On Mon, Sep 29, 2025 at 10:25=E2=80=AFAM Anand Moon <linux.amoon@gmail.co=
m> wrote:
> >
> > Hi Rob
> >
> > On Mon, 29 Sept 2025 at 19:19, Rob Herring <robh@kernel.org> wrote:
> > >
> > > On Mon, Sep 29, 2025 at 2:40=E2=80=AFAM Anand Moon <linux.amoon@gmail=
.com> wrote:
> > > >
> > > > Hi Rob,
> > > >
> > > > Thanks for your review comments
> > > >
> > > > On Fri, 26 Sept 2025 at 19:26, Rob Herring <robh@kernel.org> wrote:
> > > > >
> > > > > On Fri, Sep 26, 2025 at 2:29=E2=80=AFAM Anand Moon <linux.amoon@g=
mail.com> wrote:
> > > > > >
> > > > > > Convert the legacy text-based binding documentation for
> > > > > > nvidia,tegra-pcie into a nvidia,tegra-pcie.yaml YAML schema, fo=
llowing
> > > > >
> > > > > s/YAML/DT/
> > > > >
> > > > Ok,
> > > > > > the Devicetree Schema format. This improves validation coverage=
 and enables
> > > > > > dtbs_check compliance for Tegra PCIe nodes.
> > > > >
> > > > > Your subject needs some work too. 'existing' and 'bindings
> > > > > documentation' are redundant.
> > > > >
> > > > Here is the simplified version
> > > >
> > > > dt-bindings: PCI: Convert the nvidia,tegra-pcie bindings documentat=
ion
> > > > into a YAML schema
> > >
> > > Still doesn't fit on one line and you say bindings twice:
> > >
> > > dt-bindings: PCI: Convert nvidia,tegra-pcie to DT schema
> > >
> > Ok
> > > >
> > > > Convert the existing text-based DT bindings documentation for the
> > > > NVIDIA Tegra PCIe host controller to a YAML schema format.
> > >
> > > s/YAML/DT/
> > >
> > > Lots of things are YAML. Only one thing is DT schema.
> > Ok, understood.
> > >
> > > >
> > > > > >
> > > > > > Cc: Jon Hunter <jonathanh@nvidia.com>
> > > > > > Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> > > > > > ---
> > > > > > v1: new patch in this series.
> > > > > > ---
> > > > > >  .../bindings/pci/nvidia,tegra-pcie.yaml       | 651 ++++++++++=
+++++++
> > > > > >  .../bindings/pci/nvidia,tegra20-pcie.txt      | 670 ----------=
--------
> > > > > >  2 files changed, 651 insertions(+), 670 deletions(-)
> > > > > >  create mode 100644 Documentation/devicetree/bindings/pci/nvidi=
a,tegra-pcie.yaml
> > > > > >  delete mode 100644 Documentation/devicetree/bindings/pci/nvidi=
a,tegra20-pcie.txt
> > > > > >
> > > > > > diff --git a/Documentation/devicetree/bindings/pci/nvidia,tegra=
-pcie.yaml b/Documentation/devicetree/bindings/pci/nvidia,tegra-pcie.yaml
> > > > > > new file mode 100644
> > > > > > index 000000000000..dd8cba125b53
> > > > > > --- /dev/null
> > > > > > +++ b/Documentation/devicetree/bindings/pci/nvidia,tegra-pcie.y=
aml
> > > > > > @@ -0,0 +1,651 @@
> > > > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > > > +%YAML 1.2
> > > > > > +---
> > > > > > +$id: http://devicetree.org/schemas/pci/nvidia,tegra-pcie.yaml#
> > > > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > > > +
> > > > > > +title: NVIDIA Tegra PCIe Controller
> > > > > > +
> > > > > > +maintainers:
> > > > > > +  - Thierry Reding <thierry.reding@gmail.com>
> > > > > > +  - Jon Hunter <jonathanh@nvidia.com>
> > > > > > +
> > > > > > +description: |
> > > > >
> > > > > Don't need '|'.
> > > > >
> > > > Ok
> > > > > > +  PCIe controller found on NVIDIA Tegra SoCs including Tgra20,=
 Tegra30,
> > > > > > +  Tegra124, Tegra210, and Tegra186. Supports multiple root por=
ts and
> > > > > > +  platform-specific clock, reset, and power supply configurati=
ons.
> > > > >
> > > > > I would suggest not listing every SoC here unless the list is not=
 going to grow.
> > > > >
> > > > Here is the short format.
> > > >   PCIe controller found on NVIDIA Tegra SoCs which supports multipl=
e
> > > >   root ports and platform-specific clock, reset, and power supply
> > > >   configurations.
> > > > Ok
> > > > > > +
> > > > > > +properties:
> > > > > > +  compatible:
> > > > > > +    oneOf:
> > > > >
> > > > > Only 1 entry here, don't need 'oneOf'.
> > > >
> > > > I am observing the following warning if I remove this.
> > > >
> > > >  make ARCH=3Darm64 -j$(nproc) dt_binding_check
> > > > DT_SCHEMA_FILES=3DDocumentation/devicetree/bindings/pci/nvidia,tegr=
a-pcie.yaml
> > > >   CHKDT   ./Documentation/devicetree/bindings
> > > > /media/nvme0/mainline/linux-tegra-6.y-devel/Documentation/devicetre=
e/bindings/pci/nvidia,tegra-pcie.yaml:
> > > > properties:compatible: [{'items': [{'enum': ['nvidia,tegra20-pcie',
> > > > 'nvidia,tegra30-pcie', 'nvidia,tegra124-pcie', 'nvidia,tegra210-pci=
e',
> > > > 'nvidia,tegra186-pcie']}]}] is not of type 'object', 'boolean'
> > >
> > > Because you made 'compatible' a list rather than a schema/map/dict.
> > > IOW, You need to remove the '-' as well.
> > >
> > Ok fixed.
> > >
> > > > > > +  nvidia,num-lanes:
> > > > > > +    description: Number of PCIe lanes used
> > > > > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > > >
> > > > > The examples show this in child nodes.
> > > > yes it patternProperties example I missed this.
> > > >
> > > > patternProperties:
> > > >   "^pci@[0-9a-f]+$":
> > > >     type: object
> > > >
> > > >     properties:
> > > >       reg:
> > > >         maxItems: 1
> > > >
> > > >       nvidia,num-lanes:
> > > >         description: Number of PCIe lanes used
> > > >         $ref: /schemas/types.yaml#/definitions/uint32
> > > >         minimum: 1
> > > >
> > > >     unevaluatedProperties: false
> > >
> > > What about all the other properties in the child nodes? You need a
> > > $ref to pci-pci-bridge.yaml as well.
> > Thanks for the input.
> >
> > patternProperties:
> >   "^pci@[0-9a-f]+$":
> >     type: object
> >     allOf:
> >       - $ref: /schemas/pci/pci-host-bridge.yaml#
>
> That's not the one you need. Read my reply again.
>
I'm sorry, I missed pci-pci-bridge.yaml
> >       - properties:
>
> properties doesn't need to go under allOf. Actually, don't need allOf
> here at all.
>
> >           reg:
> >             maxItems: 1
>
> >           "#address-cells":
> >             const: 3
> >           "#size-cells":
> >             const: 2
>
> These 2 are already defined in the referenced schema.
Earlier, I had tried to search for these reference schemas,
but I could not find them.
>
> >           nvidia,num-lanes:
> >             description: Number of PCIe lanes used
> >             $ref: /schemas/types.yaml#/definitions/uint32
> >             minimum: 1
>
> I assume there's a maximum <=3D16?
I will check and update
>
> blank line here and between all DT properties.
>
> >         required:
> >           - "#address-cells"
> >           - "#size-cells"
>
> These 2 are already required in the referenced schema.
Ok dropped
>
> >           - nvidia,num-lanes
> >     unevaluatedProperties: false
> >
> > > Rob
Thanks
-Anand
