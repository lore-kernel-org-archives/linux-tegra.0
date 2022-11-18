Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 115AFC4332F
	for <linux-tegra@archiver.kernel.org>; Fri, 18 Nov 2022 12:25:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241447AbiKRMZI (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 18 Nov 2022 07:25:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229753AbiKRMZH (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 18 Nov 2022 07:25:07 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CE0B970A2;
        Fri, 18 Nov 2022 04:25:05 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id l14so9069693wrw.2;
        Fri, 18 Nov 2022 04:25:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j8jWAZeT/8tQ+7MZHeSCpUFaWXiIrHUABkIoYNkKj2s=;
        b=hdHitXL4yKKPBVo43O3M6muLDkkBGcVb2g9sA6IiaLhMeUqklBiDt9LVLoE6PtCAiu
         vztyWZLhIrPIWbE8AdwRzOr+EviXevlqDXxNNRqEv1ZlLfRUG3lR1CuCmIkCudC2lpPu
         F7uCwSivjdOgDpF5VRfqwEiS38m/ypk4hZEK0edkY73aXj1DboZW3w0pkJoPrA9N90Gk
         mn4ypyyvNueaz2j3qtajdAujHn7bCa0yDJa70GMfAldhkfVXWo2OLzuWPHqmvTrvyk9M
         ul8UXOZkN3aGbuvM9s77KRCC2eax0ra1uNpJuGuVOK1kje4MWsCGS1WCslMXrD6sBa3Y
         hnLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j8jWAZeT/8tQ+7MZHeSCpUFaWXiIrHUABkIoYNkKj2s=;
        b=VHkyxNcjpHLpeEFeenthq3sc7Q7rTtYYalnErvS48Dk9PW9EbYaEJAix9A5OyPLx7v
         t4cJjoOs/FvFNe1cqEBBFuY9FnZJZax5BAYIL3toguxjihW9KiqklR8tQE19IIo0T4HQ
         5WDh5IyWhO2niMyT0qN+SCsBAbEOcsYKx241dRduYTZqqW2zg73O8ri/w/5V5WEMulHt
         OQ7T1j1CBTNe6xn8Ui8tZmWDIVe4r5FEThtO+AD0TY2XHrKfrpI4qzkrclis86Zj0qIP
         jnxrmIv0+onPFbKo7m0bFxs1xR6BBqSGnWsOTckwz3H/iEmswk5+iQ5YZJk8+jGycmDA
         7DOA==
X-Gm-Message-State: ANoB5pmzNVzYKdcnrqZw1TDvkAFulbk8it8ns+5OC4TsRvcRp8N3W90G
        UzYWovOg2Yk6fTq+CbqrQ10=
X-Google-Smtp-Source: AA0mqf5Jr1KgblCkqspA/8a28qtmiNPa/PqAblZ8N5/JB8wLk16DG1XFBVSuYKJTnNvb1K/hZw38WA==
X-Received: by 2002:a5d:4c42:0:b0:236:6f90:3e55 with SMTP id n2-20020a5d4c42000000b002366f903e55mr4196168wrt.374.1668774303668;
        Fri, 18 Nov 2022 04:25:03 -0800 (PST)
Received: from orome (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id a8-20020adffb88000000b002383fc96509sm3442198wrr.47.2022.11.18.04.25.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Nov 2022 04:25:02 -0800 (PST)
Date:   Fri, 18 Nov 2022 13:25:00 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Rob Herring <robh@kernel.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Wayne Chang <waynec@nvidia.com>, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: usb: tegra-xusb: Convert to json-schema
Message-ID: <Y3d5nKMGu5BqzJQC@orome>
References: <20221103144200.1479640-1-thierry.reding@gmail.com>
 <20221107195221.GA1462892-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="+jaOzxE3K2SX1/b0"
Content-Disposition: inline
In-Reply-To: <20221107195221.GA1462892-robh@kernel.org>
User-Agent: Mutt/2.2.8 (2022-11-05)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--+jaOzxE3K2SX1/b0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 07, 2022 at 01:52:21PM -0600, Rob Herring wrote:
> On Thu, Nov 03, 2022 at 03:42:00PM +0100, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > Convert the Tegra XUSB controller bindings from the free-form text
> > format to json-schema.
> >=20
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> > Wayne, going forward it might make sense for you to pick this up into
> > your Tegra234 series and add the Tegra234 bindings on top of this.
> >=20
> > Changes in v2:
> > - use minItems/maxItems/items instead of contains/anyOf for phy-names
> > - add missing compatible string to USB device example
> > - drop unneeded phys property description
> > - drop unneeded USB bus properties
> > - add reference to usb-xhci.yaml
> >=20
> >  .../bindings/usb/nvidia,tegra124-xusb.txt     | 132 -----------
> >  .../bindings/usb/nvidia,tegra124-xusb.yaml    | 202 +++++++++++++++++
> >  .../bindings/usb/nvidia,tegra186-xusb.yaml    | 181 +++++++++++++++
> >  .../bindings/usb/nvidia,tegra194-xusb.yaml    | 187 ++++++++++++++++
> >  .../bindings/usb/nvidia,tegra210-xusb.yaml    | 207 ++++++++++++++++++
> >  5 files changed, 777 insertions(+), 132 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/usb/nvidia,tegra1=
24-xusb.txt
> >  create mode 100644 Documentation/devicetree/bindings/usb/nvidia,tegra1=
24-xusb.yaml
> >  create mode 100644 Documentation/devicetree/bindings/usb/nvidia,tegra1=
86-xusb.yaml
> >  create mode 100644 Documentation/devicetree/bindings/usb/nvidia,tegra1=
94-xusb.yaml
> >  create mode 100644 Documentation/devicetree/bindings/usb/nvidia,tegra2=
10-xusb.yaml
> >=20
> > diff --git a/Documentation/devicetree/bindings/usb/nvidia,tegra124-xusb=
=2Etxt b/Documentation/devicetree/bindings/usb/nvidia,tegra124-xusb.txt
> > deleted file mode 100644
> > index 5bfcc0b4d6b9..000000000000
> > --- a/Documentation/devicetree/bindings/usb/nvidia,tegra124-xusb.txt
> > +++ /dev/null
> > @@ -1,132 +0,0 @@
> > -NVIDIA Tegra xHCI controller
> > -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> > -
> > -The Tegra xHCI controller supports both USB2 and USB3 interfaces expos=
ed by
> > -the Tegra XUSB pad controller.
> > -
> > -Required properties:
> > ---------------------
> > -- compatible: Must be:
> > -  - Tegra124: "nvidia,tegra124-xusb"
> > -  - Tegra132: "nvidia,tegra132-xusb", "nvidia,tegra124-xusb"
> > -  - Tegra210: "nvidia,tegra210-xusb"
> > -  - Tegra186: "nvidia,tegra186-xusb"
> > -- reg: Must contain the base and length of the xHCI host registers, XU=
SB FPCI
> > -  registers and XUSB IPFS registers.
> > -- reg-names: Must contain the following entries:
> > -  - "hcd"
> > -  - "fpci"
> > -  - "ipfs"
> > -- interrupts: Must contain the xHCI host interrupt and the mailbox int=
errupt.
> > -- clocks: Must contain an entry for each entry in clock-names.
> > -  See ../clock/clock-bindings.txt for details.
> > -- clock-names: Must include the following entries:
> > -   - xusb_host
> > -   - xusb_host_src
> > -   - xusb_falcon_src
> > -   - xusb_ss
> > -   - xusb_ss_src
> > -   - xusb_ss_div2
> > -   - xusb_hs_src
> > -   - xusb_fs_src
> > -   - pll_u_480m
> > -   - clk_m
> > -   - pll_e
> > -- resets: Must contain an entry for each entry in reset-names.
> > -  See ../reset/reset.txt for details.
> > -- reset-names: Must include the following entries:
> > -  - xusb_host
> > -  - xusb_ss
> > -  - xusb_src
> > -  Note that xusb_src is the shared reset for xusb_{ss,hs,fs,falcon,hos=
t}_src.
> > -- nvidia,xusb-padctl: phandle to the XUSB pad controller that is used =
to
> > -  configure the USB pads used by the XHCI controller
> > -
> > -For Tegra124 and Tegra132:
> > -- avddio-pex-supply: PCIe/USB3 analog logic power supply. Must supply =
1.05 V.
> > -- dvddio-pex-supply: PCIe/USB3 digital logic power supply. Must supply=
 1.05 V.
> > -- avdd-usb-supply: USB controller power supply. Must supply 3.3 V.
> > -- avdd-pll-utmip-supply: UTMI PLL power supply. Must supply 1.8 V.
> > -- avdd-pll-erefe-supply: PLLE reference PLL power supply. Must supply =
1.05 V.
> > -- avdd-usb-ss-pll-supply: PCIe/USB3 PLL power supply. Must supply 1.05=
 V.
> > -- hvdd-usb-ss-supply: High-voltage PCIe/USB3 power supply. Must supply=
 3.3 V.
> > -- hvdd-usb-ss-pll-e-supply: High-voltage PLLE power supply. Must suppl=
y 3.3 V.
> > -
> > -For Tegra210:
> > -- dvddio-pex-supply: PCIe/USB3 analog logic power supply. Must supply =
1.05 V.
> > -- hvddio-pex-supply: High-voltage PCIe/USB3 power supply. Must supply =
1.8 V.
> > -- avdd-usb-supply: USB controller power supply. Must supply 3.3 V.
> > -- avdd-pll-utmip-supply: UTMI PLL power supply. Must supply 1.8 V.
> > -- avdd-pll-uerefe-supply: PLLE reference PLL power supply. Must supply=
 1.05 V.
> > -- dvdd-pex-pll-supply: PCIe/USB3 PLL power supply. Must supply 1.05 V.
> > -- hvdd-pex-pll-e-supply: High-voltage PLLE power supply. Must supply 1=
=2E8 V.
> > -
> > -For Tegra210 and Tegra186:
> > -- power-domains: A list of PM domain specifiers that reference each po=
wer-domain
> > -  used by the xHCI controller. This list must comprise of a specifier =
for the
> > -  XUSBA and XUSBC power-domains. See ../power/power_domain.txt and
> > -  ../arm/tegra/nvidia,tegra20-pmc.txt for details.
> > -- power-domain-names: A list of names that represent each of the speci=
fiers in
> > -  the 'power-domains' property. Must include 'xusb_ss' and 'xusb_host'=
 which
> > -  represent the power-domains XUSBA and XUSBC, respectively. See
> > -  ../power/power_domain.txt for details.
> > -
> > -Optional properties:
> > ---------------------
> > -- phys: Must contain an entry for each entry in phy-names.
> > -  See ../phy/phy-bindings.txt for details.
> > -- phy-names: Should include an entry for each PHY used by the controll=
er. The
> > -  following PHYs are available:
> > -  - Tegra124: usb2-0, usb2-1, usb2-2, hsic-0, hsic-1, usb3-0, usb3-1
> > -  - Tegra132: usb2-0, usb2-1, usb2-2, hsic-0, hsic-1, usb3-0, usb3-1
> > -  - Tegra210: usb2-0, usb2-1, usb2-2, usb2-3, hsic-0, usb3-0, usb3-1, =
usb3-2,
> > -              usb3-3
> > -  - Tegra186: usb2-0, usb2-1, usb2-2, hsic-0, usb3-0, usb3-1, usb3-2
> > -
> > -Example:
> > ---------
> > -
> > -	usb@0,70090000 {
> > -		compatible =3D "nvidia,tegra124-xusb";
> > -		reg =3D <0x0 0x70090000 0x0 0x8000>,
> > -		      <0x0 0x70098000 0x0 0x1000>,
> > -		      <0x0 0x70099000 0x0 0x1000>;
> > -		reg-names =3D "hcd", "fpci", "ipfs";
> > -
> > -		interrupts =3D <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>,
> > -			     <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>;
> > -
> > -		clocks =3D <&tegra_car TEGRA124_CLK_XUSB_HOST>,
> > -			 <&tegra_car TEGRA124_CLK_XUSB_HOST_SRC>,
> > -			 <&tegra_car TEGRA124_CLK_XUSB_FALCON_SRC>,
> > -			 <&tegra_car TEGRA124_CLK_XUSB_SS>,
> > -			 <&tegra_car TEGRA124_CLK_XUSB_SS_DIV2>,
> > -			 <&tegra_car TEGRA124_CLK_XUSB_SS_SRC>,
> > -			 <&tegra_car TEGRA124_CLK_XUSB_HS_SRC>,
> > -			 <&tegra_car TEGRA124_CLK_XUSB_FS_SRC>,
> > -			 <&tegra_car TEGRA124_CLK_PLL_U_480M>,
> > -			 <&tegra_car TEGRA124_CLK_CLK_M>,
> > -			 <&tegra_car TEGRA124_CLK_PLL_E>;
> > -		clock-names =3D "xusb_host", "xusb_host_src", "xusb_falcon_src",
> > -			      "xusb_ss", "xusb_ss_div2", "xusb_ss_src",
> > -			      "xusb_hs_src", "xusb_fs_src", "pll_u_480m",
> > -			      "clk_m", "pll_e";
> > -		resets =3D <&tegra_car 89>, <&tegra_car 156>, <&tegra_car 143>;
> > -		reset-names =3D "xusb_host", "xusb_ss", "xusb_src";
> > -
> > -		nvidia,xusb-padctl =3D <&padctl>;
> > -
> > -		phys =3D <&{/padctl@0,7009f000/pads/usb2/lanes/usb2-1}>, /* mini-PCI=
e USB */
> > -		       <&{/padctl@0,7009f000/pads/usb2/lanes/usb2-2}>, /* USB A */
> > -		       <&{/padctl@0,7009f000/pads/pcie/lanes/pcie-0}>; /* USB A */
> > -		phy-names =3D "usb2-1", "usb2-2", "usb3-0";
> > -
> > -		avddio-pex-supply =3D <&vdd_1v05_run>;
> > -		dvddio-pex-supply =3D <&vdd_1v05_run>;
> > -		avdd-usb-supply =3D <&vdd_3v3_lp0>;
> > -		avdd-pll-utmip-supply =3D <&vddio_1v8>;
> > -		avdd-pll-erefe-supply =3D <&avdd_1v05_run>;
> > -		avdd-usb-ss-pll-supply =3D <&vdd_1v05_run>;
> > -		hvdd-usb-ss-supply =3D <&vdd_3v3_lp0>;
> > -		hvdd-usb-ss-pll-e-supply =3D <&vdd_3v3_lp0>;
> > -	};
> > diff --git a/Documentation/devicetree/bindings/usb/nvidia,tegra124-xusb=
=2Eyaml b/Documentation/devicetree/bindings/usb/nvidia,tegra124-xusb.yaml
> > new file mode 100644
> > index 000000000000..4a6616bf9bab
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/usb/nvidia,tegra124-xusb.yaml
> > @@ -0,0 +1,202 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/usb/nvidia,tegra124-xusb.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: NVIDIA Tegra124 xHCI controller
> > +
> > +maintainers:
> > +  - Thierry Reding <thierry.reding@gmail.com>
> > +  - Jon Hunter <jonathanh@nvidia.com>
> > +
> > +description: The Tegra xHCI controller supports both USB2 and USB3 int=
erfaces
> > +  exposed by the Tegra XUSB pad controller.
> > +
> > +properties:
> > +  # required
> > +  compatible:
> > +    oneOf:
> > +      - description: NVIDIA Tegra124
> > +        const: nvidia,tegra124-xusb
> > +
> > +      - description: NVIDIA Tegra132
> > +        items:
> > +          - const: nvidia,tegra132-xusb
> > +          - const: nvidia,tegra124-xusb
> > +
> > +  reg:
> > +    items:
> > +      - description: base and length of the xHCI host registers
> > +      - description: base and length of the XUSB FPCI registers
> > +      - description: base and length of the XUSB IPFS registers
> > +
> > +  reg-names:
> > +    items:
> > +      - const: hcd
> > +      - const: fpci
> > +      - const: ipfs
> > +
> > +  interrupts:
> > +    items:
> > +      - description: xHCI host interrupt
> > +      - description: mailbox interrupt
> > +
> > +  clocks:
> > +    items:
> > +      - description: XUSB host clock
> > +      - description: XUSB host source clock
> > +      - description: XUSB Falcon source clock
> > +      - description: XUSB SuperSpeed clock
> > +      - description: XUSB SuperSpeed clock divider
> > +      - description: XUSB SuperSpeed source clock
> > +      - description: XUSB HighSpeed clock source
> > +      - description: XUSB FullSpeed clock source
> > +      - description: USB PLL
> > +      - description: reference clock
> > +      - description: I/O PLL
> > +
> > +  clock-names:
> > +    items:
> > +      - const: xusb_host
> > +      - const: xusb_host_src
> > +      - const: xusb_falcon_src
> > +      - const: xusb_ss
> > +      - const: xusb_ss_div2
> > +      - const: xusb_ss_src
> > +      - const: xusb_hs_src
> > +      - const: xusb_fs_src
> > +      - const: pll_u_480m
> > +      - const: clk_m
> > +      - const: pll_e
> > +
> > +  resets:
> > +    items:
> > +      - description: reset for the XUSB host controller
> > +      - description: reset for the SuperSpeed logic
> > +      - description: shared reset for xusb_{ss,hs,fs,falcon,host}_src.
> > +
> > +  reset-names:
> > +    items:
> > +      - const: xusb_host
> > +      - const: xusb_ss
> > +      - const: xusb_src
> > +
> > +  nvidia,xusb-padctl:
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +    description: phandle to the XUSB pad controller that is used to co=
nfigure
> > +      the USB pads used by the XHCI controller
> > +
> > +  # optional
> > +  phys:
> > +    minItems: 1
> > +    maxItems: 7
> > +
> > +  phy-names:
> > +    minItems: 1
> > +    maxItems: 7
> > +    items:
> > +      enum:
> > +        - usb2-0
> > +        - usb2-1
> > +        - usb2-2
> > +        - hsic-0
> > +        - hsic-1
> > +        - usb3-0
> > +        - usb3-1
> > +
> > +  avddio-pex-supply:
> > +    description: PCIe/USB3 analog logic power supply. Must supply 1.05=
 V.
> > +
> > +  dvddio-pex-supply:
> > +    description: PCIe/USB3 digital logic power supply. Must supply 1.0=
5 V.
> > +
> > +  avdd-usb-supply:
> > +    description: USB controller power supply. Must supply 3.3 V.
> > +
> > +  avdd-pll-utmip-supply:
> > +    description: UTMI PLL power supply. Must supply 1.8 V.
> > +
> > +  avdd-pll-erefe-supply:
> > +    description: PLLE reference PLL power supply. Must supply 1.05 V.
> > +
> > +  avdd-usb-ss-pll-supply:
> > +    description: PCIe/USB3 PLL power supply. Must supply 1.05 V.
> > +
> > +  hvdd-usb-ss-supply:
> > +    description: High-voltage PCIe/USB3 power supply. Must supply 3.3 =
V.
> > +
> > +  hvdd-usb-ss-pll-e-supply:
> > +    description: High-voltage PLLE power supply. Must supply 3.3 V.
> > +
> > +allOf:
> > +  - $ref: usb-xhci.yaml
> > +
> > +unevaluatedProperties: false
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - reg-names
> > +  - interrupts
> > +  - clocks
> > +  - clock-names
> > +  - resets
> > +  - reset-names
> > +  - nvidia,xusb-padctl
> > +  - phys
> > +  - phy-names
> > +  - avddio-pex-supply
> > +  - dvddio-pex-supply
> > +  - avdd-usb-supply
> > +  - hvdd-usb-ss-supply
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/tegra124-car.h>
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +
> > +    usb@70090000 {
> > +        compatible =3D "nvidia,tegra124-xusb";
> > +        reg =3D <0x70090000 0x8000>,
> > +              <0x70098000 0x1000>,
> > +              <0x70099000 0x1000>;
> > +        reg-names =3D "hcd", "fpci", "ipfs";
> > +
> > +        interrupts =3D <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>,
> > +                     <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>;
> > +
> > +        clocks =3D <&tegra_car TEGRA124_CLK_XUSB_HOST>,
> > +                 <&tegra_car TEGRA124_CLK_XUSB_HOST_SRC>,
> > +                 <&tegra_car TEGRA124_CLK_XUSB_FALCON_SRC>,
> > +                 <&tegra_car TEGRA124_CLK_XUSB_SS>,
> > +                 <&tegra_car TEGRA124_CLK_XUSB_SS_DIV2>,
> > +                 <&tegra_car TEGRA124_CLK_XUSB_SS_SRC>,
> > +                 <&tegra_car TEGRA124_CLK_XUSB_HS_SRC>,
> > +                 <&tegra_car TEGRA124_CLK_XUSB_FS_SRC>,
> > +                 <&tegra_car TEGRA124_CLK_PLL_U_480M>,
> > +                 <&tegra_car TEGRA124_CLK_CLK_M>,
> > +                 <&tegra_car TEGRA124_CLK_PLL_E>;
> > +        clock-names =3D "xusb_host", "xusb_host_src", "xusb_falcon_src=
",
> > +                      "xusb_ss", "xusb_ss_div2", "xusb_ss_src",
> > +                      "xusb_hs_src", "xusb_fs_src", "pll_u_480m",
> > +                      "clk_m", "pll_e";
> > +        resets =3D <&tegra_car 89>, <&tegra_car 156>, <&tegra_car 143>;
> > +        reset-names =3D "xusb_host", "xusb_ss", "xusb_src";
> > +
> > +        nvidia,xusb-padctl =3D <&padctl>;
> > +
> > +        phys =3D <&{/padctl@0,7009f000/pads/usb2/lanes/usb2-1}>, /* mi=
ni-PCIe USB */
> > +               <&{/padctl@0,7009f000/pads/usb2/lanes/usb2-2}>, /* USB =
A */
> > +               <&{/padctl@0,7009f000/pads/pcie/lanes/pcie-0}>; /* USB =
A */
> > +        phy-names =3D "usb2-1", "usb2-2", "usb3-0";
> > +
> > +        avddio-pex-supply =3D <&vdd_1v05_run>;
> > +        dvddio-pex-supply =3D <&vdd_1v05_run>;
> > +        avdd-usb-supply =3D <&vdd_3v3_lp0>;
> > +        avdd-pll-utmip-supply =3D <&vddio_1v8>;
> > +        avdd-pll-erefe-supply =3D <&avdd_1v05_run>;
> > +        avdd-usb-ss-pll-supply =3D <&vdd_1v05_run>;
> > +        hvdd-usb-ss-supply =3D <&vdd_3v3_lp0>;
> > +        hvdd-usb-ss-pll-e-supply =3D <&vdd_3v3_lp0>;
> > +    };
> > diff --git a/Documentation/devicetree/bindings/usb/nvidia,tegra186-xusb=
=2Eyaml b/Documentation/devicetree/bindings/usb/nvidia,tegra186-xusb.yaml
> > new file mode 100644
> > index 000000000000..7126d137133a
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/usb/nvidia,tegra186-xusb.yaml
> > @@ -0,0 +1,181 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/usb/nvidia,tegra186-xusb.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: NVIDIA Tegra186 xHCI controller
> > +
> > +maintainers:
> > +  - Thierry Reding <thierry.reding@gmail.com>
> > +  - Jon Hunter <jonathanh@nvidia.com>
> > +
> > +description: The Tegra xHCI controller supports both USB2 and USB3 int=
erfaces
> > +  exposed by the Tegra XUSB pad controller.
> > +
> > +properties:
> > +  compatible:
> > +    const: nvidia,tegra186-xusb
> > +
> > +  reg:
> > +    items:
> > +      - description: base and length of the xHCI host registers
> > +      - description: base and length of the XUSB FPCI registers
> > +
> > +  reg-names:
> > +    items:
> > +      - const: hcd
> > +      - const: fpci
> > +
> > +  interrupts:
> > +    items:
> > +      - description: xHCI host interrupt
> > +      - description: mailbox interrupt
> > +
> > +  clocks:
> > +    items:
> > +      - description: XUSB host clock
> > +      - description: XUSB Falcon source clock
> > +      - description: XUSB SuperSpeed clock
> > +      - description: XUSB SuperSpeed source clock
> > +      - description: XUSB HighSpeed clock source
> > +      - description: XUSB FullSpeed clock source
> > +      - description: USB PLL
> > +      - description: reference clock
> > +      - description: I/O PLL
> > +
> > +  clock-names:
> > +    items:
> > +      - const: xusb_host
> > +      - const: xusb_falcon_src
> > +      - const: xusb_ss
> > +      - const: xusb_ss_src
> > +      - const: xusb_hs_src
> > +      - const: xusb_fs_src
> > +      - const: pll_u_480m
> > +      - const: clk_m
> > +      - const: pll_e
> > +
> > +  interconnects:
> > +    items:
> > +      - description: read client
> > +      - description: write client
> > +
> > +  interconnect-names:
> > +    items:
> > +      - const: dma-mem # read
> > +      - const: write
> > +
> > +  iommus:
> > +    maxItems: 1
> > +
> > +  nvidia,xusb-padctl:
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +    description: phandle to the XUSB pad controller that is used to co=
nfigure
> > +      the USB pads used by the XHCI controller
> > +
> > +  phys:
> > +    minItems: 1
> > +    maxItems: 7
> > +
> > +  phy-names:
> > +    minItems: 1
> > +    maxItems: 7
> > +    items:
> > +      enum:
> > +        - usb2-0
> > +        - usb2-1
> > +        - usb2-2
> > +        - hsic-0
> > +        - usb3-0
> > +        - usb3-1
> > +        - usb3-2
> > +
> > +  power-domains:
> > +    description: A list of PM domain specifiers that reference each po=
wer-
> > +      domain used by the xHCI controller. This list must comprise of a
> > +      specifier for the XUSBA and XUSBC power-domains.
> > +
> > +      See ../power/power_domain.txt and ../arm/tegra/nvidia,tegra20-pm=
c.txt
> > +      for details.
>=20
> Drop description.
>=20
> > +    items:
> > +      - description: XUSBC power domain
> > +      - description: XUSBA power domain
> > +
> > +  power-domain-names:
> > +    description: A list of names that represent each of the specifiers=
 in the
> > +      'power-domains' property. See ../power/power_domain.txt for deta=
ils.
>=20
> ditto
>=20
> And the same elsewhere.

All of these descriptions are now dropped.

>=20
> > +    items:
> > +      - const: xusb_host
> > +      - const: xusb_ss
>=20
> host/XUSBC and ss/XUSBA don't really correlate. It's all supposed to be=
=20
> named relative to the device rather than top-level/source/provider.=20
> You're stuck with the host/ss names, so maybe improve the descriptions.
>=20
> With those fixes,
>=20
> Reviewed-by: Rob Herring <robh@kernel.org>

I've updated the descriptions to clarify that XUSBC is for host and USB
2.0 while XUSBA is for SuperSpeed.

I've picked this up into the Tegra tree with the above modifications.

Thanks,
Thierry

--+jaOzxE3K2SX1/b0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmN3eZwACgkQ3SOs138+
s6EeiQ/+LJ8dCU8YGAK+0shtcgPqX1PenK0Xk1eLpHlUJplGw5ph/Y8mOFnwyLm7
aIcFvUGoKP03TJkqy2uRKn2jx3ttF5DQCpanlSENJVvJdXvvQPhbSb6VuBaIYTIq
nRRBBAIqv3N1VhtCrmdJOVJ8HL+5b9wgg5xQ0NEReq9eCaVqFa6jRKee1xVph+hH
71qYTA6wlLCwOiQllSoRQtYCWft7TPU5qIcLkTjk+amC0eHJjnKkrZUKA1JT1yXy
nEgxWVcYY7SB6rf60AgWTDS+KfTr6JDHm0oQCERIRQpO3KIRqPp3q0NqdPZfU15V
RYxuS1WJkvI9ajXP4/qsRUW8cpWw/dacytP6exdkSUXbnYIXUTZHGkJRHEz6A97M
4gemxzvoQ1t56EfTzr1WuIUVi3JTj/6iMFbYTYGJr5Z1sEij22scNv+plJ0WxXlm
+473PUwwLQEO2iD3vZllLMQ5cYXeTR4zo69e40ZrRLlEzqF5RtuDr4rfeoUSKOeK
qbEC3qmXXgDwgtuG1XqVIwINOdzUGrtgq8Aoc8eRTE4jJJlVB5I2wVUADKPJaw4T
EpZSawCfm0iiFUjd21rm6TZJIjbqleq0cjOEYSiB3WfuqtS/JuZTRv45HjN4llKb
vop9ZEkAmBlIZXhO3tTwE10ZQJRuh5iZz2D58o3dMd/IfrsFf3o=
=wMpM
-----END PGP SIGNATURE-----

--+jaOzxE3K2SX1/b0--
