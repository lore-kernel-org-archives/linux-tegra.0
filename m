Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 557151F237A
	for <linux-tegra@vger.kernel.org>; Tue, 30 Sep 2025 14:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759243045; cv=none; b=oNnJ/CU9FAYD+MMiA62+ABTlDmlj+yIaqXjrQ3H0YMk9bg4YSwnwpIDFcDBIyPkCOuc63YPbsktqEPoZo8bTTnDl/SaApi6LNpEs4qlcwabl1+1m2ZGckD9CWzg6C5gL7CZqBurtlpn9FLfmAHbYTTM+4mtvMKBMVLGB4u0N0BE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759243045; c=relaxed/simple;
	bh=tv8tP3CbvwVbP03SYbdUFItd/4hYvZNZmJe7AJScMmk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F+CkRzEl+VIAhp1hZzMT0dEY3ddmYFVoY6voUQrEabZKQM3CX94uRMU9h9tzErTdJ4jl2W0kZTWgIt+BR9xcqVXQNVrymbktuDe/9TqfVhPPY2xYqgrrQQTtdK5Z+x3SJt+6tETR81KbE4ISygJ+iiV83BIXOGSqPVT03pbEPOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ispdYJ8v; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ispdYJ8v"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04F27C4AF0B
	for <linux-tegra@vger.kernel.org>; Tue, 30 Sep 2025 14:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759243045;
	bh=tv8tP3CbvwVbP03SYbdUFItd/4hYvZNZmJe7AJScMmk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ispdYJ8vdVZXbkBVyhOSQaOGiikySRLfMNskFg2jlCrmWA1VdG1IeuG/BRbSZDXle
	 WSISY7nbKNL2L9xWve9b0l77/91Pdod2UwOzp4yc+gz5YRywP0BD9kd0j/zPWmEwwM
	 Bz4CxqheU5E+xsqSV8T7W84vsvhnDzjQLu82Lxn5HADJKwYrsXDYHnGJOjuqt/e/j3
	 w+1mN6nTdTdyq+PRmxL/wxkNDvcSbXSVDInMPvFTA+bjLFk8edfabiwyklzQO60xyS
	 aSdLml0y6rn7pwRqdQeNu+4Xk8tZ0eWLVtWHWsLL26u3cHso3WQILgXxeVNgQOO2yS
	 qEomdo++8sP7Q==
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6364eb29e74so4110100a12.0
        for <linux-tegra@vger.kernel.org>; Tue, 30 Sep 2025 07:37:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWJkAu4bsScl20DR5YNBMA/UHaK2YdE2d3knTJYd14pSFB2MfP+fuH3iTTNuIMJI+dJ8LEdyBKXgMfLPQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwJsGZBLFHFWuTkQ2FoCPlFarlQiTozMEFFyATnUdOQ0laeCR6e
	8V3oZ1QKqB7OznEBxYijJH9ey8JCQIg0PNIUDkqF2k3BKhT4lbBzZYRWF2MMrM2yitWUocqNryf
	tHQ5xKvyFsKbK1wWXVC8wh+nUMu2l4g==
X-Google-Smtp-Source: AGHT+IGgfxlodiz/IYQsAOQn6MLDa6csKlZJbZKJV75KAR1g4FNwPa42/5n0tcTx0LqLcbqk236kB6rAIkWIDfZAheg=
X-Received: by 2002:a17:907:d19:b0:b46:31be:e8fe with SMTP id
 a640c23a62f3a-b4631ce4b96mr125333766b.11.1759243043364; Tue, 30 Sep 2025
 07:37:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250926072905.126737-1-linux.amoon@gmail.com>
 <20250926072905.126737-2-linux.amoon@gmail.com> <CAL_JsqJr+h7pTvbRR=7eB4ognK70D1pgNXEORGXo=ndND=pMjw@mail.gmail.com>
 <CANAwSgT3jo35xBvkH4GmQcZuZH=D+SRKJ6e9fSBRz45zwuCmYw@mail.gmail.com>
 <CAL_JsqLsEDFv4T1ZMmjaoFfs7WNAjVvOk9o1eTXL2EeGF8uuDA@mail.gmail.com> <CANAwSgTuX3t2-SNPe4OAzGuDpL5RotxX8t+Zx+gcwFKdj3ZEng@mail.gmail.com>
In-Reply-To: <CANAwSgTuX3t2-SNPe4OAzGuDpL5RotxX8t+Zx+gcwFKdj3ZEng@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 30 Sep 2025 09:37:11 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKBhzPwxYguy+N=eddG2nwB54dzw307A6KT5NJpRSh-Mg@mail.gmail.com>
X-Gm-Features: AS18NWCO_YKNXT00tTFZtChritiXVTRzlLdNG8gyHODI9fKqf3yCIJP6TlxUrps
Message-ID: <CAL_JsqKBhzPwxYguy+N=eddG2nwB54dzw307A6KT5NJpRSh-Mg@mail.gmail.com>
Subject: Re: [PATCH v1 1/5] dt-bindings: PCI: Convert the existing
 nvidia,tegra-pcie.txt bindings documentation into a YAML schema
To: Anand Moon <linux.amoon@gmail.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	"open list:PCI NATIVE HOST BRIDGE AND ENDPOINT DRIVERS" <linux-pci@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 29, 2025 at 10:25=E2=80=AFAM Anand Moon <linux.amoon@gmail.com>=
 wrote:
>
> Hi Rob
>
> On Mon, 29 Sept 2025 at 19:19, Rob Herring <robh@kernel.org> wrote:
> >
> > On Mon, Sep 29, 2025 at 2:40=E2=80=AFAM Anand Moon <linux.amoon@gmail.c=
om> wrote:
> > >
> > > Hi Rob,
> > >
> > > Thanks for your review comments
> > >
> > > On Fri, 26 Sept 2025 at 19:26, Rob Herring <robh@kernel.org> wrote:
> > > >
> > > > On Fri, Sep 26, 2025 at 2:29=E2=80=AFAM Anand Moon <linux.amoon@gma=
il.com> wrote:
> > > > >
> > > > > Convert the legacy text-based binding documentation for
> > > > > nvidia,tegra-pcie into a nvidia,tegra-pcie.yaml YAML schema, foll=
owing
> > > >
> > > > s/YAML/DT/
> > > >
> > > Ok,
> > > > > the Devicetree Schema format. This improves validation coverage a=
nd enables
> > > > > dtbs_check compliance for Tegra PCIe nodes.
> > > >
> > > > Your subject needs some work too. 'existing' and 'bindings
> > > > documentation' are redundant.
> > > >
> > > Here is the simplified version
> > >
> > > dt-bindings: PCI: Convert the nvidia,tegra-pcie bindings documentatio=
n
> > > into a YAML schema
> >
> > Still doesn't fit on one line and you say bindings twice:
> >
> > dt-bindings: PCI: Convert nvidia,tegra-pcie to DT schema
> >
> Ok
> > >
> > > Convert the existing text-based DT bindings documentation for the
> > > NVIDIA Tegra PCIe host controller to a YAML schema format.
> >
> > s/YAML/DT/
> >
> > Lots of things are YAML. Only one thing is DT schema.
> Ok, understood.
> >
> > >
> > > > >
> > > > > Cc: Jon Hunter <jonathanh@nvidia.com>
> > > > > Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> > > > > ---
> > > > > v1: new patch in this series.
> > > > > ---
> > > > >  .../bindings/pci/nvidia,tegra-pcie.yaml       | 651 ++++++++++++=
+++++
> > > > >  .../bindings/pci/nvidia,tegra20-pcie.txt      | 670 ------------=
------
> > > > >  2 files changed, 651 insertions(+), 670 deletions(-)
> > > > >  create mode 100644 Documentation/devicetree/bindings/pci/nvidia,=
tegra-pcie.yaml
> > > > >  delete mode 100644 Documentation/devicetree/bindings/pci/nvidia,=
tegra20-pcie.txt
> > > > >
> > > > > diff --git a/Documentation/devicetree/bindings/pci/nvidia,tegra-p=
cie.yaml b/Documentation/devicetree/bindings/pci/nvidia,tegra-pcie.yaml
> > > > > new file mode 100644
> > > > > index 000000000000..dd8cba125b53
> > > > > --- /dev/null
> > > > > +++ b/Documentation/devicetree/bindings/pci/nvidia,tegra-pcie.yam=
l
> > > > > @@ -0,0 +1,651 @@
> > > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > > +%YAML 1.2
> > > > > +---
> > > > > +$id: http://devicetree.org/schemas/pci/nvidia,tegra-pcie.yaml#
> > > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > > +
> > > > > +title: NVIDIA Tegra PCIe Controller
> > > > > +
> > > > > +maintainers:
> > > > > +  - Thierry Reding <thierry.reding@gmail.com>
> > > > > +  - Jon Hunter <jonathanh@nvidia.com>
> > > > > +
> > > > > +description: |
> > > >
> > > > Don't need '|'.
> > > >
> > > Ok
> > > > > +  PCIe controller found on NVIDIA Tegra SoCs including Tgra20, T=
egra30,
> > > > > +  Tegra124, Tegra210, and Tegra186. Supports multiple root ports=
 and
> > > > > +  platform-specific clock, reset, and power supply configuration=
s.
> > > >
> > > > I would suggest not listing every SoC here unless the list is not g=
oing to grow.
> > > >
> > > Here is the short format.
> > >   PCIe controller found on NVIDIA Tegra SoCs which supports multiple
> > >   root ports and platform-specific clock, reset, and power supply
> > >   configurations.
> > > Ok
> > > > > +
> > > > > +properties:
> > > > > +  compatible:
> > > > > +    oneOf:
> > > >
> > > > Only 1 entry here, don't need 'oneOf'.
> > >
> > > I am observing the following warning if I remove this.
> > >
> > >  make ARCH=3Darm64 -j$(nproc) dt_binding_check
> > > DT_SCHEMA_FILES=3DDocumentation/devicetree/bindings/pci/nvidia,tegra-=
pcie.yaml
> > >   CHKDT   ./Documentation/devicetree/bindings
> > > /media/nvme0/mainline/linux-tegra-6.y-devel/Documentation/devicetree/=
bindings/pci/nvidia,tegra-pcie.yaml:
> > > properties:compatible: [{'items': [{'enum': ['nvidia,tegra20-pcie',
> > > 'nvidia,tegra30-pcie', 'nvidia,tegra124-pcie', 'nvidia,tegra210-pcie'=
,
> > > 'nvidia,tegra186-pcie']}]}] is not of type 'object', 'boolean'
> >
> > Because you made 'compatible' a list rather than a schema/map/dict.
> > IOW, You need to remove the '-' as well.
> >
> Ok fixed.
> >
> > > > > +  nvidia,num-lanes:
> > > > > +    description: Number of PCIe lanes used
> > > > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > >
> > > > The examples show this in child nodes.
> > > yes it patternProperties example I missed this.
> > >
> > > patternProperties:
> > >   "^pci@[0-9a-f]+$":
> > >     type: object
> > >
> > >     properties:
> > >       reg:
> > >         maxItems: 1
> > >
> > >       nvidia,num-lanes:
> > >         description: Number of PCIe lanes used
> > >         $ref: /schemas/types.yaml#/definitions/uint32
> > >         minimum: 1
> > >
> > >     unevaluatedProperties: false
> >
> > What about all the other properties in the child nodes? You need a
> > $ref to pci-pci-bridge.yaml as well.
> Thanks for the input.
>
> patternProperties:
>   "^pci@[0-9a-f]+$":
>     type: object
>     allOf:
>       - $ref: /schemas/pci/pci-host-bridge.yaml#

That's not the one you need. Read my reply again.

>       - properties:

properties doesn't need to go under allOf. Actually, don't need allOf
here at all.

>           reg:
>             maxItems: 1

>           "#address-cells":
>             const: 3
>           "#size-cells":
>             const: 2

These 2 are already defined in the referenced schema.

>           nvidia,num-lanes:
>             description: Number of PCIe lanes used
>             $ref: /schemas/types.yaml#/definitions/uint32
>             minimum: 1

I assume there's a maximum <=3D16?

blank line here and between all DT properties.

>         required:
>           - "#address-cells"
>           - "#size-cells"

These 2 are already required in the referenced schema.

>           - nvidia,num-lanes
>     unevaluatedProperties: false
>
> > Rob
>
> Thanks
> -Anand
>
