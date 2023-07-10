Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 403BFEB64DA
	for <linux-tegra@archiver.kernel.org>; Mon, 10 Jul 2023 13:58:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230255AbjGJN57 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 10 Jul 2023 09:57:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229823AbjGJN56 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 10 Jul 2023 09:57:58 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 029A0DF;
        Mon, 10 Jul 2023 06:57:57 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-3fc0aecf107so17032175e9.2;
        Mon, 10 Jul 2023 06:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688997475; x=1691589475;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YyelWds9qkSV46amRpfEwVbW08oi+5c7F/CoNfQrxlE=;
        b=K/B86ERryINnH1MBsbLF6tG1t1o8EMuZrTB9SN7rA5bbE6p4Lgbq+e48iWgv10Klq8
         6n4bXHZs6rfY4WMvoc+4OwG1D6XjsdGvlTbL8FXfY2WARWOgDQikrwpLeL8j36pT3sE/
         NaVFgVIXym7BtHeAEC9zC54IbPEKDizh/opXQEzl/WK7JR0XTII5VxGNNYYAY5wLq8ed
         AjoVgDR+86He33UFLZEV2cCqpnUJMaek16Duob//uCPcnIPLd94xTpShXfVMm0vdrqLX
         SeuGGVtCuMGD/2ipv1uPKifH85cdvTMX82YuaRqrQIBEAbP48IZ2955cEeC9p5rulcy1
         m0LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688997475; x=1691589475;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YyelWds9qkSV46amRpfEwVbW08oi+5c7F/CoNfQrxlE=;
        b=FGxJtS+pzILrIGB0ZbTKM62FPSMMX+njsOvNgj9n08SeK1avPN2UIMOiapy9pdXgmr
         auUB1zXXKjIyPbCASVqsklj95eYLEP+rEh4D4rHvsRdOyiAF9Vxo8dGqp3UtEF1dafZv
         HsQJzya6HXnA/LUi1DQ87WNbbDAV6lYSGq8AB4VnWB/nQj1/mRYJ7rvb1105/rPo8soP
         hqmuqbSlPu/G9BeXmYmk3+ABsvNdazuf1Hh5VlBNbhwlxRVfxXBJjbkeuqAhB+JywGXw
         3hP29vaJ1EHZJejn1ftu8uXkafg5wuNs2JMC3P288l2sEB8DYfaTUeoJqA9gEVYMwcPc
         vC0g==
X-Gm-Message-State: ABy/qLaiXKpXWzj7DCJK+FbAtxbHhKLRsoxOesWDHkPRc0DKXfQaQgK/
        1UqSVdUKm3w3rm79L2LftSo=
X-Google-Smtp-Source: APBJJlEIjGS5Fcw9aTWeb4ohn9KB/foFJbSLJaF/zlDghlCokvrKAwCJgTNBDk6a5xIqgg2IR6H7iw==
X-Received: by 2002:a5d:51cc:0:b0:314:121d:8cbf with SMTP id n12-20020a5d51cc000000b00314121d8cbfmr6621593wrv.25.1688997475165;
        Mon, 10 Jul 2023 06:57:55 -0700 (PDT)
Received: from orome (p200300e41f4b7100f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4b:7100:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id r20-20020a056402035400b0051e2549c4f9sm5880942edw.47.2023.07.10.06.57.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jul 2023 06:57:54 -0700 (PDT)
Date:   Mon, 10 Jul 2023 15:57:53 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Rob Herring <robh@kernel.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH 5/7] dt-bindings: arm: tegra: pmc: Restructure pad
 configuration node schema
Message-ID: <ZKwOYYWTM3PoXfMc@orome>
References: <20230707131711.2997956-1-thierry.reding@gmail.com>
 <20230707131711.2997956-5-thierry.reding@gmail.com>
 <20230707223503.GA1087110-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="MxNARzSc7XkZiC67"
Content-Disposition: inline
In-Reply-To: <20230707223503.GA1087110-robh@kernel.org>
User-Agent: Mutt/2.2.10 (2023-03-25)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--MxNARzSc7XkZiC67
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 07, 2023 at 04:35:03PM -0600, Rob Herring wrote:
> On Fri, Jul 07, 2023 at 03:17:09PM +0200, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > The pad configuration node schema in its current form can accidentally
> > match other properties as well. Restructure the schema to better match
> > how the device trees are using these.
> >=20
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> >  .../arm/tegra/nvidia,tegra20-pmc.yaml         | 181 ++++++++++++------
> >  1 file changed, 120 insertions(+), 61 deletions(-)
> >=20
> > diff --git a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20=
-pmc.yaml b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.=
yaml
> > index 82070d47ac7c..271aa8f80a65 100644
> > --- a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.ya=
ml
> > +++ b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.ya=
ml
> > @@ -245,69 +245,82 @@ properties:
> >            - resets
> >            - '#power-domain-cells'
> > =20
> > -patternProperties:
> > -  "^[a-f0-9]+-[a-f0-9]+$":
> > +  pinmux:
> >      type: object
> > -    description:
> > -      This is a Pad configuration node. On Tegra SOCs a pad is a set of
> > -      pins which are configured as a group. The pin grouping is a fixed
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
> >      properties:
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
> > -          pads. None of the Tegra124 or Tegra132 pads support signaling
> > -          voltage switching.
> > -          All of the listed Tegra210 pads except pex-cntrl support pow=
er
> > -          state configuration. Signaling voltage switching is supported
> > -          on below Tegra210 pads.
> > -          audio, audio-hv, cam, dbg, dmic, gpio, pex-cntrl, sdmmc1,
> > -          sdmmc3, spi, spi-hv, and uart.
> > -
> > -    required:
> > -      - pins
> > -
> > -    additionalProperties: false
> > +      status: true
>=20
> If you need this, that's a bug in dtschema.

Looks like I don't need it here...

>=20
> > +
> > +    additionalProperties:
> > +      type: object
> > +      description: |
> > +        This is a pad configuration node. On Tegra SoCs a pad is a set=
 of pins
> > +        which are configured as a group. The pin grouping is a fixed a=
ttribute
> > +        of the hardware. The PMC can be used to set pad power state and
> > +        signaling voltage. A pad can be either in active or power down=
 mode.
> > +        The support for power state and signaling voltage configuratio=
n varies
> > +        depending on the pad in question. 3.3V and 1.8V signaling volt=
ages are
> > +        supported on pins where software controllable signaling voltage
> > +        switching is available.
> > +
> > +        The pad configuration state nodes are placed under the pmc nod=
e and
> > +        they are referred to by the pinctrl client properties. For more
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
> > +        phandle:
> > +          $ref: /schemas/types.yaml#/definitions/uint32
>=20
> ditto

=2E.. and not this either. Might be some leftovers from testing with
earlier versions of dtschema. I've dropped them now.

>=20
> > +
> > +      required:
> > +        - pins
> > =20
> >  required:
> >    - compatible
> > @@ -316,6 +329,52 @@ required:
> >    - clocks
> >    - '#clock-cells'
> > =20
> > +allOf:
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: nvidia,tegra124-pmc
> > +    then:
> > +      properties:
> > +        pinmux:
> > +          properties:
> > +            status: true

However I do get complaints if I drop this one:

	Documentation/devicetree/bindings/soc/tegra/nvidia,tegra20-pmc.yaml: allOf=
:0:then:properties:pinmux: 'anyOf' conditional failed, one must be fixed:
		'type' is a required property
		'properties' is a required property
		'patternProperties' is a required property
		hint: 'additionalProperties' depends on 'properties' or 'patternPropertie=
s'
		from schema $id: http://devicetree.org/meta-schemas/core.yaml#
	Documentation/devicetree/bindings/soc/tegra/nvidia,tegra20-pmc.yaml: allOf=
:1:then:properties:pinmux: 'anyOf' conditional failed, one must be fixed:
		'type' is a required property
		'properties' is a required property
		'patternProperties' is a required property
		hint: 'additionalProperties' depends on 'properties' or 'patternPropertie=
s'
		from schema $id: http://devicetree.org/meta-schemas/core.yaml#

Would you consider that a bug in dtschema as well that I should try to
fix or is that expected?

Thanks,
Thierry

--MxNARzSc7XkZiC67
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmSsDl0ACgkQ3SOs138+
s6HkchAAvP/1i6ddgbXDsCZbe/cEiNs6Bbkf8S+y14pn/W6FJ4bIl0sIXwQ/Ee55
1E8TE8TxRKnAkgq1xx+BVRSS+mnPU3uvyma9aFqrygWo3HoCAc/DkyF89feQZhUi
J6JLb+Poh1e4n9Z6B6w9wGWDePZbvuDSA/TBJBZI/5C19MRWe4Qsri1mST1Kld6H
s+NGP2CEQaBsI8nvFy2RylvQm9jjXZZw+so21dKFQfg/X5OAbIbCuzuK30rtnmu+
vuZ6OJD9TY+Wl5UxdrHaXv9sAoPAIxTQ1N0qKBCuopJqHYK8GKuTQgh0pwo3nKLV
dexGGXJp5t3KpWi4zALbudubnIvA0A0tIBqt8BD7YK9NhBvz7yax25JQ0MCg8bjJ
5oDuT2RtYBNSmyIV8MGwslRjha3WFF+EluhHZwzqIU4mHuKd5h0vx6pOU5n7J7yQ
W8ZfPoclGVXAXGBMh4uz/xTwt05OLA86wd2kzRFE02T//WSq+a+fQKV7WiBBhQX9
6VqwfHiO3xg4H1v5uyocjTQ83kLlD6AhTpic2ZEPGBMDyBk19XJlVH2V2m1gSO4I
avXXlQYLX88J2FrbD8sJkmLw5H5KvGFL0MppQz4FpnhZLPR93k7u2kV58Rwn1anN
3GAe2xU+BJmglNrn4N/MjM0aThUKY83+XAuvNU4rnK84fDZIa80=
=FUfq
-----END PGP SIGNATURE-----

--MxNARzSc7XkZiC67--
