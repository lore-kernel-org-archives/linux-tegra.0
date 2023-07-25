Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06577C001DF
	for <linux-tegra@archiver.kernel.org>; Tue, 25 Jul 2023 18:33:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230500AbjGYSdn (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 25 Jul 2023 14:33:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231856AbjGYSdm (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 25 Jul 2023 14:33:42 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BF7B26A8;
        Tue, 25 Jul 2023 11:33:31 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C65C761826;
        Tue, 25 Jul 2023 18:33:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35D74C433C8;
        Tue, 25 Jul 2023 18:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690310010;
        bh=wuuoFf31ww2zQBjr4cUHzfmxz/KzzocbSWsEY8B4HlA=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=B6KtCu+J585TmpQhaZxAJOyIq8CDqpUug944B4FogJwIhyIjyE6a9CYfzGxQkEKnL
         hjHqhHNFIAIqxnNBmxuNsz8UI7OX2Z3phprZylg03aSquK40nt7X6y2vINHufXXMtQ
         4txXc2FJv84nlgtm6ErrwlRwXuk3FYspsdDwtItEMJsdW+1xG4W1haZ+g9/gmbTFr5
         j5kWyDLDTxDdomutOKt7oroZQOU21sRgptIBFrlOnSBW/TCzm1Y7ffD+SKOBf1Q4AD
         iKBQzOWQjjig6+ILBKxDxENrNDEd1GtPH2KwE8z7VrXH9eKWIH3/QCc/QcmqOP4kF5
         gGFeqSK2XuFbw==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2b74310566cso86834281fa.2;
        Tue, 25 Jul 2023 11:33:30 -0700 (PDT)
X-Gm-Message-State: ABy/qLapJKPaG6PVPmb7OXH7kXge+t6epWlAAbeWuxeIzaWTNRZC7iYX
        ePfn9KPZTX8YhCaXcssTlneTiDhedNFEHWiTWA==
X-Google-Smtp-Source: APBJJlFGjdA9SMESOdO46sr2AYkgz0DTkqyJMG/qtEzVCfJIEVS4/5qff7hTH6ISuB+k2bizDeXxEPXz5BkTjgm2n+U=
X-Received: by 2002:a05:651c:14f:b0:2b6:d7d1:95c0 with SMTP id
 c15-20020a05651c014f00b002b6d7d195c0mr8603806ljd.11.1690310008111; Tue, 25
 Jul 2023 11:33:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230721135759.2994770-1-thierry.reding@gmail.com>
 <20230721135759.2994770-5-thierry.reding@gmail.com> <20230725001101.GA1125953-robh@kernel.org>
In-Reply-To: <20230725001101.GA1125953-robh@kernel.org>
From:   Rob Herring <robh@kernel.org>
Date:   Tue, 25 Jul 2023 12:33:15 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKjLDko2ei1VsS0ptcQXd9_GVdv1CgrAK9-Otthw8+fHg@mail.gmail.com>
Message-ID: <CAL_JsqKjLDko2ei1VsS0ptcQXd9_GVdv1CgrAK9-Otthw8+fHg@mail.gmail.com>
Subject: Re: [PATCH v2 5/7] dt-bindings: arm: tegra: pmc: Restructure pad
 configuration node schema
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Mon, Jul 24, 2023 at 6:11=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:
>
> On Fri, Jul 21, 2023 at 03:57:57PM +0200, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >
> > The pad configuration node schema in its current form can accidentally
> > match other properties as well. Restructure the schema to better match
> > how the device trees are using these.
> >
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> > Changes in v2:
> > - highlight quirks working around possible core schema
> > - use phandle: true instead of fully redefining it
> > - drop unneeded status property definition
> >
> >  .../arm/tegra/nvidia,tegra20-pmc.yaml         | 184 ++++++++++++------
> >  1 file changed, 122 insertions(+), 62 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20=
-pmc.yaml b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.=
yaml
> > index a336a75d8b82..0cbc16ec4267 100644
> > --- a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.ya=
ml
> > +++ b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.ya=
ml
> > @@ -244,69 +244,79 @@ properties:
> >            - resets
> >            - '#power-domain-cells'
> >
> > -patternProperties:
> > -  "^[a-f0-9]+-[a-f0-9]+$":
> > +  pinmux:
> >      type: object
> > -    description:
> > -      This is a Pad configuration node. On Tegra SOCs a pad is a set o=
f
> > -      pins which are configured as a group. The pin grouping is a fixe=
d
> > -      attribute of the hardware. The PMC can be used to set pad power =
state
> > -      and signaling voltage. A pad can be either in active or power do=
wn mode.
> > -      The support for power state and signaling voltage configuration =
varies
> > -      depending on the pad in question. 3.3V and 1.8V signaling voltag=
es
> > -      are supported on pins where software controllable signaling volt=
age
> > -      switching is available.
> > -
> > -      The pad configuration state nodes are placed under the pmc node =
and they
> > -      are referred to by the pinctrl client properties. For more infor=
mation
> > -      see Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.t=
xt.
> > -      The pad name should be used as the value of the pins property in=
 pin
> > -      configuration nodes.
> > -
> > -      The following pads are present on Tegra124 and Tegra132
> > -      audio, bb, cam, comp, csia, csb, cse, dsi, dsib, dsic, dsid, hdm=
i, hsic,
> > -      hv, lvds, mipi-bias, nand, pex-bias, pex-clk1, pex-clk2, pex-cnt=
rl,
> > -      sdmmc1, sdmmc3, sdmmc4, sys_ddc, uart, usb0, usb1, usb2, usb_bia=
s.
> > -
> > -      The following pads are present on Tegra210
> > -      audio, audio-hv, cam, csia, csib, csic, csid, csie, csif, dbg,
> > -      debug-nonao, dmic, dp, dsi, dsib, dsic, dsid, emmc, emmc2, gpio,=
 hdmi,
> > -      hsic, lvds, mipi-bias, pex-bias, pex-clk1, pex-clk2, pex-cntrl, =
sdmmc1,
> > -      sdmmc3, spi, spi-hv, uart, usb0, usb1, usb2, usb3, usb-bias.
> > -
> > -    properties:
> > -      pins:
> > -        $ref: /schemas/types.yaml#/definitions/string
> > -        description: Must contain name of the pad(s) to be configured.
> > -
> > -      low-power-enable:
> > -        $ref: /schemas/types.yaml#/definitions/flag
> > -        description: Configure the pad into power down mode.
> > -
> > -      low-power-disable:
> > -        $ref: /schemas/types.yaml#/definitions/flag
> > -        description: Configure the pad into active mode.
> > -
> > -      power-source:
> > -        $ref: /schemas/types.yaml#/definitions/uint32
> > -        description:
> > -          Must contain either TEGRA_IO_PAD_VOLTAGE_1V8 or
> > -          TEGRA_IO_PAD_VOLTAGE_3V3 to select between signaling voltage=
s.
> > -          The values are defined in
> > -          include/dt-bindings/pinctrl/pinctrl-tegra-io-pad.h.
> > -          Power state can be configured on all Tegra124 and Tegra132
> > -          pads. None of the Tegra124 or Tegra132 pads support signalin=
g
> > -          voltage switching.
> > -          All of the listed Tegra210 pads except pex-cntrl support pow=
er
> > -          state configuration. Signaling voltage switching is supporte=
d
> > -          on below Tegra210 pads.
> > -          audio, audio-hv, cam, dbg, dmic, gpio, pex-cntrl, sdmmc1,
> > -          sdmmc3, spi, spi-hv, and uart.
> > -
> > -    required:
> > -      - pins
> > -
> > -    additionalProperties: false
> > +    additionalProperties:
> > +      type: object
> > +      description: |
> > +        This is a pad configuration node. On Tegra SoCs a pad is a set=
 of pins
> > +        which are configured as a group. The pin grouping is a fixed a=
ttribute
> > +        of the hardware. The PMC can be used to set pad power state an=
d
> > +        signaling voltage. A pad can be either in active or power down=
 mode.
> > +        The support for power state and signaling voltage configuratio=
n varies
> > +        depending on the pad in question. 3.3V and 1.8V signaling volt=
ages are
> > +        supported on pins where software controllable signaling voltag=
e
> > +        switching is available.
> > +
> > +        The pad configuration state nodes are placed under the pmc nod=
e and
> > +        they are referred to by the pinctrl client properties. For mor=
e
> > +        information see:
> > +
> > +          Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.t=
xt
> > +
> > +        The pad name should be used as the value of the pins property =
in pin
> > +        configuration nodes.
> > +
> > +        The following pads are present on Tegra124 and Tegra132:
> > +
> > +          audio, bb, cam, comp, csia, csb, cse, dsi, dsib, dsic, dsid,=
 hdmi,
> > +          hsic, hv, lvds, mipi-bias, nand, pex-bias, pex-clk1, pex-clk=
2,
> > +          pex-cntrl, sdmmc1, sdmmc3, sdmmc4, sys_ddc, uart, usb0, usb1=
, usb2,
> > +          usb_bias
> > +
> > +        The following pads are present on Tegra210:
> > +
> > +          audio, audio-hv, cam, csia, csib, csic, csid, csie, csif, db=
g,
> > +          debug-nonao, dmic, dp, dsi, dsib, dsic, dsid, emmc, emmc2, g=
pio,
> > +          hdmi, hsic, lvds, mipi-bias, pex-bias, pex-clk1, pex-clk2, p=
ex-cntrl,
> > +          sdmmc1, sdmmc3, spi, spi-hv, uart, usb0, usb1, usb2, usb3, u=
sb-bias
> > +      additionalProperties: false
> > +      properties:
> > +        pins:
> > +          $ref: /schemas/types.yaml#/definitions/string-array
> > +          description: Must contain name of the pad(s) to be configure=
d.
> > +
> > +        low-power-enable:
> > +          $ref: /schemas/types.yaml#/definitions/flag
> > +          description: Configure the pad into power down mode.
> > +
> > +        low-power-disable:
> > +          $ref: /schemas/types.yaml#/definitions/flag
> > +          description: Configure the pad into active mode.
> > +
> > +        power-source:
> > +          $ref: /schemas/types.yaml#/definitions/uint32
> > +          description: |
> > +            Must contain either TEGRA_IO_PAD_VOLTAGE_1V8 or
> > +            TEGRA_IO_PAD_VOLTAGE_3V3 to select between signaling volta=
ges. The
> > +            values are defined in:
> > +
> > +              include/dt-bindings/pinctrl/pinctrl-tegra-io-pad.h
> > +
> > +            Power state can be configured on all Tegra124 and Tegra132=
 pads.
> > +            None of the Tegra124 or Tegra132 pads support signaling vo=
ltage
> > +            switching. All of the listed Tegra210 pads except pex-cntr=
l support
> > +            power state configuration. Signaling voltage switching is =
supported
> > +            on the following Tegra210 pads:
> > +
> > +              audio, audio-hv, cam, dbg, dmic, gpio, pex-cntrl, sdmmc1=
, sdmmc3,
> > +              spi, spi-hv, uart
> > +
> > +        # XXX why is this needed?
>
> It shouldn't be and is a bug. I have a fix. Will test some more and
> commit it tomorrow.
>
> > +        phandle: true
> > +
> > +      required:
> > +        - pins
> >
> >  required:
> >    - compatible
> > @@ -315,6 +325,56 @@ required:
> >    - clocks
> >    - '#clock-cells'
> >
> > +allOf:
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: nvidia,tegra124-pmc
> > +    then:
> > +      properties:
> > +        pinmux:
> > +          # XXX shouldn't be needed, but the DT validator complains ab=
out
> > +          # "additionalProperties" if "properties" doesn't exist
> > +          properties:
> > +            status: true
>
> 'type: object' should work here too. That may need the same fix as above
> though.

I fixed this in the meta-schema.

Both fixes are now in "main" branch.

Rob
