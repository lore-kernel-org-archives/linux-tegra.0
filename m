Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27B85C54EBD
	for <linux-tegra@archiver.kernel.org>; Mon,  9 Jan 2023 13:23:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230487AbjAINXW (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 9 Jan 2023 08:23:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232648AbjAINXD (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 9 Jan 2023 08:23:03 -0500
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60AE130556;
        Mon,  9 Jan 2023 05:22:09 -0800 (PST)
Received: by mail-ej1-x633.google.com with SMTP id gh17so20056050ejb.6;
        Mon, 09 Jan 2023 05:22:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1MDwnDD3nW5yOt4mhzIl9JmPSktrB0k8aHrlXMshp4w=;
        b=qNh+p4+aJT/V/bX9JkQ2menGwlM8aDmRaSG0eJ4DXUVf7B4RqCijR9ikm62wSngKQ0
         /9izkkYTeGHPsNGc43MBuN8lezxP36mh7H2zEUkD5JI6mzKVtn+Vc3WZuhrJAdNrQTxZ
         tLkNLMF1vY+s3wZtBbY5qV8KkqbZVerorxFMtp2to00JLd4R5d4dEaBCRtYD0llNyHYG
         eE/S9w47aRBa4f0aWGqf9XrVdoDSN9kb88vS5socjktA4LQVmGYRzq2drJUusVkv6A4t
         2NnZT9FGL8Nonrts1AoqDbTDXIkXdBiFNIYeBI16uUa8EMfaVvpxx632cpVFA4O9jOh4
         Nvxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1MDwnDD3nW5yOt4mhzIl9JmPSktrB0k8aHrlXMshp4w=;
        b=ApLJ3dDQvCPIjpiUDf8spA2q1CBmyXv64/Jz59wi532pm6Ubo51MYomxptBk+JpSd2
         D73Z0cK1u8ktNeQV5vn9q4EQwYWopxjXS0M8A8Abtzhar8f2YtnVEfYtykfYU+wX3ibt
         D/uomIECDMtoFlHMdNGsXpfxwjT0qWqLUCtSpO3z3L9HUUNEonko47mL9vc/lWCpD2oD
         bhHOukyRhK3VRzDLFtheDfF+CLQNfqaxlJZcg8C9aZRhlCy+or+Cfhzk9ShHDiGAXuc/
         fz/pLcJ07eNtmZu/YXy3DPfRKkTTsN3kVcH3tg2eITPtoclcDM3OKKQGJJTgo+71zv8G
         qsjg==
X-Gm-Message-State: AFqh2krU8r44Zgyz2WUuxCHEKW84Om3PFD8YAhljrmgjmWEexLeCJUFe
        pJRp1zkl9SFGPnR79/f6X50=
X-Google-Smtp-Source: AMrXdXur6DUh24+lIblJ9wKODHbFGYXrXBO0qgd2qhR5MNjVlt2v1Klbk/sMWQ5hd1qLNBczv+kfCQ==
X-Received: by 2002:a17:906:b0d1:b0:82e:a57b:cc9b with SMTP id bk17-20020a170906b0d100b0082ea57bcc9bmr62114638ejb.24.1673270527777;
        Mon, 09 Jan 2023 05:22:07 -0800 (PST)
Received: from orome (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id kx1-20020a170907774100b0084d368b1628sm2645825ejc.40.2023.01.09.05.22.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jan 2023 05:22:06 -0800 (PST)
Date:   Mon, 9 Jan 2023 14:22:04 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-phy@lists.infradead.org, waynec@nvidia.com,
        Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH V5 1/6] dt-bindings: usb: Add NVIDIA Tegra234 XUSB host
 controller binding
Message-ID: <Y7wU/PnbKl1ONQOL@orome>
References: <20230106152858.49574-1-jonathanh@nvidia.com>
 <20230106152858.49574-2-jonathanh@nvidia.com>
 <b1485d8a-71ea-7b75-74ab-77eef595ae10@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="SuVUDtOGOz2zxr1+"
Content-Disposition: inline
In-Reply-To: <b1485d8a-71ea-7b75-74ab-77eef595ae10@linaro.org>
User-Agent: Mutt/2.2.9 (2022-11-12)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--SuVUDtOGOz2zxr1+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 08, 2023 at 04:21:24PM +0100, Krzysztof Kozlowski wrote:
> On 06/01/2023 16:28, Jon Hunter wrote:
> > From: Wayne Chang <waynec@nvidia.com>
> >=20
> > Add device-tree binding documentation for the XUSB host controller pres=
ent
> > on Tegra234 SoC. This controller supports the USB 3.1 specification.
> >=20
> > Signed-off-by: Wayne Chang <waynec@nvidia.com>
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> > ---
> > V4 -> V5: No changes
> > V3 -> V4: minor update to the power-domain description
> > V2 -> V3: nothing has changed
> > V1 -> V2: address the issue on phy-names property
> >=20
> >  .../bindings/usb/nvidia,tegra234-xusb.yaml    | 158 ++++++++++++++++++
> >  1 file changed, 158 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/usb/nvidia,tegra2=
34-xusb.yaml
> >=20
> > diff --git a/Documentation/devicetree/bindings/usb/nvidia,tegra234-xusb=
=2Eyaml b/Documentation/devicetree/bindings/usb/nvidia,tegra234-xusb.yaml
> > new file mode 100644
> > index 000000000000..190a23c72963
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/usb/nvidia,tegra234-xusb.yaml
> > @@ -0,0 +1,158 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/usb/nvidia,tegra234-xusb.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: NVIDIA Tegra234 xHCI controller
> > +
> > +maintainers:
> > +  - Thierry Reding <thierry.reding@gmail.com>
> > +  - Jon Hunter <jonathanh@nvidia.com>
> > +
> > +description: The Tegra xHCI controller supports both USB2 and USB3 int=
erfaces
>=20
> Line ends after "description:"
>=20
> > +  exposed by the Tegra XUSB pad controller.
> > +
> > +properties:
> > +  compatible:
> > +    const: nvidia,tegra234-xusb
> > +
> > +  reg:
> > +    items:
> > +      - description: base and length of the xHCI host registers
>=20
> Just "xHCI host registers". Same in other places.
>=20
> > +      - description: base and length of the XUSB FPCI registers
> > +      - description: base and length of the XUSB bar2 registers
> > +
> > +  reg-names:
> > +    items:
> > +      - const: hcd
> > +      - const: fpci
> > +      - const: bar2
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
> > +    maxItems: 8
> > +
> > +  phy-names:
> > +    minItems: 1
> > +    maxItems: 8
> > +    items:
> > +      enum:
> > +        - usb2-0
> > +        - usb2-1
> > +        - usb2-2
> > +        - usb2-3
> > +        - usb3-0
> > +        - usb3-1
> > +        - usb3-2
> > +        - usb3-3
>=20
> Why do you have so many optional phys? In what case you would put there
> usb2-0 and usb3-3 together? Or even 8 phys at the same time? IOW, what
> are the differences between them and why one controller would be
> connected once to usb3-2 and once to usb3-3 phy? And once to both?

This controller has up to four ports, each of which can be wired to a
USB connector. Furthermore, each port is composed of a USB3 port and a
USB2 companion port. You can technically have USB3-only ports, though
I'm not sure if that's actually supported, USB3/2 combo ports (the
typical case) and USB2-only ports.

So that's why we have four USB3 PHYs, each controlling the physical
layer of one USB3 port and four USB2 PHYs, each of which can be bound to
one of the USB3 PHYs to make a composite USB3/2 port.

Thierry

--SuVUDtOGOz2zxr1+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmO8FPwACgkQ3SOs138+
s6F3oQ//aFty4MFzKCch7MvkzZst6tOgRd5/RlX2ktzssojr4yGtCbzUgZgIh9Lq
ecII59F8dc633pEq1NLcTxb3R/HBy1NZLQw/RJ14G7/nqu3FpVN2rur4ce2SyPRx
7NbJcd0B1lhP79xclKImvtd6/Z+sHhqpwC6rSCxWI9jVNGI7fkFGXGqcpov7Mrbp
N0rgjKDY3VyTgc+4Vo3IUSYyua6NFYfKmNREpjhv0yNM+9r0LICN9r//kN/SnQVo
ovWlBbiMo182F4+VAOINEsvZc2iTclvK4kiz1t8BRwN90sCrTAlMyjVjvM3I3fLX
RPBZl9UEVRsoJ8BkvoJt7mBkskbKnp1dK2JeHGlmKqiWR5c6PRPmFqh3XlfcqzDC
slPVsbGVfqdBI5R7HPrmcs4bqIZ5WKaFEZ1UUHPFYg/x9PaRNEJmbu/GDg2O0I2N
aPT2cPasvwvMXOkwhnXOT+NJzx+I+Ciqp/mHr/QIs1qD2EGjSd708xCvVt+4EW3W
vcW7WGNuoiFN3rmGoZQxj8bm7zn4YoAXLZKghPivCl5XoPievLGGm1b/CXr/u8Df
EGA7aC/bM8iiUice5vtnfvnvWVZ5tKL1jmla+i1gfdFiN0DUF/qHwjDS3Dw9xQlk
EbpdtCDKd6vsNOV8xIvyg3edZi2cBaU0ZnRDZdNc4mq9z1I9CXc=
=5qW4
-----END PGP SIGNATURE-----

--SuVUDtOGOz2zxr1+--
