Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64581EB64DC
	for <linux-tegra@archiver.kernel.org>; Fri, 14 Jul 2023 15:12:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235725AbjGNPMW (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 14 Jul 2023 11:12:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234930AbjGNPMV (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 14 Jul 2023 11:12:21 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2CB92715;
        Fri, 14 Jul 2023 08:12:19 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-314172bb818so2058086f8f.1;
        Fri, 14 Jul 2023 08:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689347538; x=1691939538;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YemdjRn27suAOVJjvdM0QqZXigCE1VyZ3bUcYyzsv74=;
        b=fP540VEPkHChpy9IaBZiVmLhSLqgfQ2x4mCHsNTaHjjvXQF8rLPVblGXvdDDZ5kYVS
         UdmzJEXbQ7zzkTSx/lGVTB0LVaWc3rUET90akLKi0QPcDtsIElv+XkEdbqDDoiWuvU1w
         DHceyo1p1oDYJq4h0qqINyTT6d8tK/jMNU4qukFt+KQQgXK//rllJ2Iw4JER8jnaDKFc
         RCb3Ik+GJOlsys65XYgCt6WeD8WwcPqeNb8dl54EPI5k7gHwHYBKiYDYxPNCz2RDXyEn
         cc110sU5j3TObLS0oZJx0NlZHIaYSOsLZfm5X6pzClsyns8bHOErWCwTPAmxwPfrbQJx
         XiDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689347538; x=1691939538;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YemdjRn27suAOVJjvdM0QqZXigCE1VyZ3bUcYyzsv74=;
        b=W2Rl7+tWgqm7KWRCXUmFHtXTkQyX+l4OY22IsmWnovQZd6CdhGP96GaDNmqHcknaOs
         nDoKZXaNK+mab3SF5te+KXl42QEp7DEYkFyLIco1Heyz5Sia1/cAwnU0bQ8UITdlIJO5
         pRJdQiFTKsEej/HOHIRgY5T4UyeXrmkhRZGmUpHEXTPDkPVq1knRSLBNbXdJyk27ZMb3
         Ymy5weGjrxQ3sT4ZJfPAuQmIMEY8jifHFQfpkERfqIC6ANsgIabivp403ynk5nQ5HQcb
         mhZJQ6G0SXMJtxxFnk1usqUr0SkAcIMyQlicAKyNoN6Ohk5cBMRfUXOel9xztiX+LfGp
         /mpA==
X-Gm-Message-State: ABy/qLbbolr5JYuGkYPW64eNovoxY+AurSOidha1tdpDt/3W01YtRVRL
        7mUXVnIgEMWd25hOvNTvf9I=
X-Google-Smtp-Source: APBJJlF0f8LrTVPFiMop4JQtczvQPP/gttmFG7dUpJOP0dJnzD4nqQGp/5seQv/KuF0/EndyQSdAXA==
X-Received: by 2002:a5d:53d2:0:b0:30f:ce4f:5675 with SMTP id a18-20020a5d53d2000000b0030fce4f5675mr5052109wrw.59.1689347538168;
        Fri, 14 Jul 2023 08:12:18 -0700 (PDT)
Received: from orome (p200300e41f4b7100f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4b:7100:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ss25-20020a170907039900b0098921e1b064sm5487329ejb.181.2023.07.14.08.12.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jul 2023 08:12:17 -0700 (PDT)
Date:   Fri, 14 Jul 2023 17:12:16 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Rob Herring <robh@kernel.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH 5/7] dt-bindings: arm: tegra: pmc: Restructure pad
 configuration node schema
Message-ID: <ZLFl0LgbmV7Snhyp@orome>
References: <20230707131711.2997956-1-thierry.reding@gmail.com>
 <20230707131711.2997956-5-thierry.reding@gmail.com>
 <20230707223503.GA1087110-robh@kernel.org>
 <ZKwOYYWTM3PoXfMc@orome>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="p/OdnSRSn+bFUUQq"
Content-Disposition: inline
In-Reply-To: <ZKwOYYWTM3PoXfMc@orome>
User-Agent: Mutt/2.2.10 (2023-03-25)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--p/OdnSRSn+bFUUQq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 10, 2023 at 03:57:53PM +0200, Thierry Reding wrote:
> On Fri, Jul 07, 2023 at 04:35:03PM -0600, Rob Herring wrote:
> > On Fri, Jul 07, 2023 at 03:17:09PM +0200, Thierry Reding wrote:
> > > From: Thierry Reding <treding@nvidia.com>
> > >=20
> > > The pad configuration node schema in its current form can accidentally
> > > match other properties as well. Restructure the schema to better match
> > > how the device trees are using these.
> > >=20
> > > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > > ---
> > >  .../arm/tegra/nvidia,tegra20-pmc.yaml         | 181 ++++++++++++----=
--
> > >  1 file changed, 120 insertions(+), 61 deletions(-)
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra=
20-pmc.yaml b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pm=
c.yaml
> > > index 82070d47ac7c..271aa8f80a65 100644
> > > --- a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.=
yaml
> > > +++ b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.=
yaml
> > > @@ -245,69 +245,82 @@ properties:
> > >            - resets
> > >            - '#power-domain-cells'
> > > =20
> > > -patternProperties:
> > > -  "^[a-f0-9]+-[a-f0-9]+$":
> > > +  pinmux:
> > >      type: object
> > > -    description:
> > > -      This is a Pad configuration node. On Tegra SOCs a pad is a set=
 of
> > > -      pins which are configured as a group. The pin grouping is a fi=
xed
> > > -      attribute of the hardware. The PMC can be used to set pad powe=
r state
> > > -      and signaling voltage. A pad can be either in active or power =
down mode.
> > > -      The support for power state and signaling voltage configuratio=
n varies
> > > -      depending on the pad in question. 3.3V and 1.8V signaling volt=
ages
> > > -      are supported on pins where software controllable signaling vo=
ltage
> > > -      switching is available.
> > > -
> > > -      The pad configuration state nodes are placed under the pmc nod=
e and they
> > > -      are referred to by the pinctrl client properties. For more inf=
ormation
> > > -      see Documentation/devicetree/bindings/pinctrl/pinctrl-bindings=
=2Etxt.
> > > -      The pad name should be used as the value of the pins property =
in pin
> > > -      configuration nodes.
> > > -
> > > -      The following pads are present on Tegra124 and Tegra132
> > > -      audio, bb, cam, comp, csia, csb, cse, dsi, dsib, dsic, dsid, h=
dmi, hsic,
> > > -      hv, lvds, mipi-bias, nand, pex-bias, pex-clk1, pex-clk2, pex-c=
ntrl,
> > > -      sdmmc1, sdmmc3, sdmmc4, sys_ddc, uart, usb0, usb1, usb2, usb_b=
ias.
> > > -
> > > -      The following pads are present on Tegra210
> > > -      audio, audio-hv, cam, csia, csib, csic, csid, csie, csif, dbg,
> > > -      debug-nonao, dmic, dp, dsi, dsib, dsic, dsid, emmc, emmc2, gpi=
o, hdmi,
> > > -      hsic, lvds, mipi-bias, pex-bias, pex-clk1, pex-clk2, pex-cntrl=
, sdmmc1,
> > > -      sdmmc3, spi, spi-hv, uart, usb0, usb1, usb2, usb3, usb-bias.
> > > -
> > >      properties:
> > > -      pins:
> > > -        $ref: /schemas/types.yaml#/definitions/string
> > > -        description: Must contain name of the pad(s) to be configure=
d.
> > > -
> > > -      low-power-enable:
> > > -        $ref: /schemas/types.yaml#/definitions/flag
> > > -        description: Configure the pad into power down mode.
> > > -
> > > -      low-power-disable:
> > > -        $ref: /schemas/types.yaml#/definitions/flag
> > > -        description: Configure the pad into active mode.
> > > -
> > > -      power-source:
> > > -        $ref: /schemas/types.yaml#/definitions/uint32
> > > -        description:
> > > -          Must contain either TEGRA_IO_PAD_VOLTAGE_1V8 or
> > > -          TEGRA_IO_PAD_VOLTAGE_3V3 to select between signaling volta=
ges.
> > > -          The values are defined in
> > > -          include/dt-bindings/pinctrl/pinctrl-tegra-io-pad.h.
> > > -          Power state can be configured on all Tegra124 and Tegra132
> > > -          pads. None of the Tegra124 or Tegra132 pads support signal=
ing
> > > -          voltage switching.
> > > -          All of the listed Tegra210 pads except pex-cntrl support p=
ower
> > > -          state configuration. Signaling voltage switching is suppor=
ted
> > > -          on below Tegra210 pads.
> > > -          audio, audio-hv, cam, dbg, dmic, gpio, pex-cntrl, sdmmc1,
> > > -          sdmmc3, spi, spi-hv, and uart.
> > > -
> > > -    required:
> > > -      - pins
> > > -
> > > -    additionalProperties: false
> > > +      status: true
> >=20
> > If you need this, that's a bug in dtschema.
>=20
> Looks like I don't need it here...
>=20
> >=20
> > > +
> > > +    additionalProperties:
> > > +      type: object
> > > +      description: |
> > > +        This is a pad configuration node. On Tegra SoCs a pad is a s=
et of pins
> > > +        which are configured as a group. The pin grouping is a fixed=
 attribute
> > > +        of the hardware. The PMC can be used to set pad power state =
and
> > > +        signaling voltage. A pad can be either in active or power do=
wn mode.
> > > +        The support for power state and signaling voltage configurat=
ion varies
> > > +        depending on the pad in question. 3.3V and 1.8V signaling vo=
ltages are
> > > +        supported on pins where software controllable signaling volt=
age
> > > +        switching is available.
> > > +
> > > +        The pad configuration state nodes are placed under the pmc n=
ode and
> > > +        they are referred to by the pinctrl client properties. For m=
ore
> > > +        information see:
> > > +
> > > +          Documentation/devicetree/bindings/pinctrl/pinctrl-bindings=
=2Etxt
> > > +
> > > +        The pad name should be used as the value of the pins propert=
y in pin
> > > +        configuration nodes.
> > > +
> > > +        The following pads are present on Tegra124 and Tegra132:
> > > +
> > > +          audio, bb, cam, comp, csia, csb, cse, dsi, dsib, dsic, dsi=
d, hdmi,
> > > +          hsic, hv, lvds, mipi-bias, nand, pex-bias, pex-clk1, pex-c=
lk2,
> > > +          pex-cntrl, sdmmc1, sdmmc3, sdmmc4, sys_ddc, uart, usb0, us=
b1, usb2,
> > > +          usb_bias
> > > +
> > > +        The following pads are present on Tegra210:
> > > +
> > > +          audio, audio-hv, cam, csia, csib, csic, csid, csie, csif, =
dbg,
> > > +          debug-nonao, dmic, dp, dsi, dsib, dsic, dsid, emmc, emmc2,=
 gpio,
> > > +          hdmi, hsic, lvds, mipi-bias, pex-bias, pex-clk1, pex-clk2,=
 pex-cntrl,
> > > +          sdmmc1, sdmmc3, spi, spi-hv, uart, usb0, usb1, usb2, usb3,=
 usb-bias
> > > +      additionalProperties: false
> > > +      properties:
> > > +        pins:
> > > +          $ref: /schemas/types.yaml#/definitions/string-array
> > > +          description: Must contain name of the pad(s) to be configu=
red.
> > > +
> > > +        low-power-enable:
> > > +          $ref: /schemas/types.yaml#/definitions/flag
> > > +          description: Configure the pad into power down mode.
> > > +
> > > +        low-power-disable:
> > > +          $ref: /schemas/types.yaml#/definitions/flag
> > > +          description: Configure the pad into active mode.
> > > +
> > > +        power-source:
> > > +          $ref: /schemas/types.yaml#/definitions/uint32
> > > +          description: |
> > > +            Must contain either TEGRA_IO_PAD_VOLTAGE_1V8 or
> > > +            TEGRA_IO_PAD_VOLTAGE_3V3 to select between signaling vol=
tages. The
> > > +            values are defined in:
> > > +
> > > +              include/dt-bindings/pinctrl/pinctrl-tegra-io-pad.h
> > > +
> > > +            Power state can be configured on all Tegra124 and Tegra1=
32 pads.
> > > +            None of the Tegra124 or Tegra132 pads support signaling =
voltage
> > > +            switching. All of the listed Tegra210 pads except pex-cn=
trl support
> > > +            power state configuration. Signaling voltage switching i=
s supported
> > > +            on the following Tegra210 pads:
> > > +
> > > +              audio, audio-hv, cam, dbg, dmic, gpio, pex-cntrl, sdmm=
c1, sdmmc3,
> > > +              spi, spi-hv, uart
> > > +
> > > +        phandle:
> > > +          $ref: /schemas/types.yaml#/definitions/uint32
> >=20
> > ditto
>=20
> ... and not this either. Might be some leftovers from testing with
> earlier versions of dtschema. I've dropped them now.

[Quoting the above in full for reference]

Scratch that. This isn't triggered by the example, but I do see a
warning when trying to validate DTS files that have pad configuration
nodes that are referenced by phandle. You can see this in various board
DTS files derived from tegra210.dtsi.

One slight improvement to this might be to do:

	phandle: true

instead. However, given that this is completely standard, maybe that's
not what we want.

Any idea what might be causing this to be required? We do have
additionalProperties: false, but I thought the likes of phandle, status,
etc. were exempt from that.

> > > +      required:
> > > +        - pins
> > > =20
> > >  required:
> > >    - compatible
> > > @@ -316,6 +329,52 @@ required:
> > >    - clocks
> > >    - '#clock-cells'
> > > =20
> > > +allOf:
> > > +  - if:
> > > +      properties:
> > > +        compatible:
> > > +          contains:
> > > +            const: nvidia,tegra124-pmc
> > > +    then:
> > > +      properties:
> > > +        pinmux:
> > > +          properties:
> > > +            status: true
>=20
> However I do get complaints if I drop this one:
>=20
> 	Documentation/devicetree/bindings/soc/tegra/nvidia,tegra20-pmc.yaml: all=
Of:0:then:properties:pinmux: 'anyOf' conditional failed, one must be fixed:
> 		'type' is a required property
> 		'properties' is a required property
> 		'patternProperties' is a required property
> 		hint: 'additionalProperties' depends on 'properties' or 'patternPropert=
ies'
> 		from schema $id: http://devicetree.org/meta-schemas/core.yaml#
> 	Documentation/devicetree/bindings/soc/tegra/nvidia,tegra20-pmc.yaml: all=
Of:1:then:properties:pinmux: 'anyOf' conditional failed, one must be fixed:
> 		'type' is a required property
> 		'properties' is a required property
> 		'patternProperties' is a required property
> 		hint: 'additionalProperties' depends on 'properties' or 'patternPropert=
ies'
> 		from schema $id: http://devicetree.org/meta-schemas/core.yaml#
>=20
> Would you consider that a bug in dtschema as well that I should try to
> fix or is that expected?

I guess this is a special case in a way because typically we would use
patternProperties for this. However, there really aren't any rules as to
what's valid here as a name or not. We could of course make something up
but this is description that most closely reflects reality.

Thierry

--p/OdnSRSn+bFUUQq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmSxZc0ACgkQ3SOs138+
s6EOKQ/+IBUwVBeQ8jJ29LwKi5o1Tfj8oxFXKoa//OhwfXAZfJ7WEDHGNor1GWyh
JA56t0ltOe6pDw3IXQKvPBmFhczc3NekOihuAvGU2HNggq2i0gHf5D3tHWAHgVuq
OpoYgptci31X0ZnIrlBNCoHf9J/G229z7eyd/ucyksil9vPf7FZUdIl38FVYivFF
iShXKiKdBMoyQ4oPLTffPpABOYlNcsTGeqLdM/kObKxWtgMNU3bHF4eicICC8Qkj
iqWsnoBjMY4hBvKbhl9JbU/uuIjRwcmowkkS0VX4RyjPCl9GSAog6p+48exLqyGb
h9UvGjoif8juIEaefned4H8nWFVFi+vYcLtcOr96woVKtdaem3n5askJ8KPpG4t7
tTxtdyTuVpC7tO00XBtlOwR6fZE50ZLlN1wqROI9/uBARuCHxSMss6d9R6aeUNyg
CLMtdceEzoNaxTMOVAs0TW1eJ2Gqau8Ay8KRgZXwZdUoVaAsgMsWt699KXKLjLmA
AHZFvIg5U2p+fap5iL51FZHbh28ISbWDt2/F3VHv57VTfkk5gNLFHopYDKfDsnNI
yuP3PZBUkLqXq1vcVqqRGjo4+4N7hZOCJjtRtc5DgoD8GUTjAE8Fj5otuGk+yFAI
me2e2r4xJrkPfJEJCsoOdtqJ1KsiViSC1oc4H4b9i1LVEKwwz8s=
=ieGg
-----END PGP SIGNATURE-----

--p/OdnSRSn+bFUUQq--
