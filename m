Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77674C433EF
	for <linux-tegra@archiver.kernel.org>; Thu, 16 Dec 2021 16:12:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231438AbhLPQMN (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 16 Dec 2021 11:12:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230255AbhLPQMM (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 16 Dec 2021 11:12:12 -0500
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A873C061574;
        Thu, 16 Dec 2021 08:12:12 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id t26so8779894wrb.4;
        Thu, 16 Dec 2021 08:12:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=0Jbu2T86Hj77iiPuDeptb5d5E0Vs1H1COLGpOMhjfR8=;
        b=GHY0h9P6LRzb+6ygzCtHy2FPKy46PfWHa6WVdgD7FUbLWHsVsVfKI8rTVfv/LJ7A+1
         aUOyBW+UWXwPwwsS2VCF5KtLmB7oc2nCOUoQdEGbfTtEPg35gBzEYFvoxhPxjLfGMHmb
         FvI0y/jopIps600yQpbxPpGZXTcK1iC1+sTpXsS2khYL5PBSg5d0cAQXXndemPUUu0+v
         O2uxG1oM8C5bIS9BNod8XlWpDBoC0UbI/XN2m4d/cCxjNaLFLpwApm/OVLZR5icx1VeW
         1Sn9Gq497YoqCELDxnVGgfH+lcu833j70PzmsgFKj4O5fhCE+80h3rQFBWijYvrP8NF1
         4HbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=0Jbu2T86Hj77iiPuDeptb5d5E0Vs1H1COLGpOMhjfR8=;
        b=xtpbUgN7rI5PFJsl2AH6OryxD7mumzun24BMlJqAQxavAKLl8M0IZH8Vm4YJ+N6++V
         q/6JhO2Guo83rsOw5kbaVGriOZlGjvOIQAoOi+obI/TpINWgWUJVrYTdSTSbNj4nXFD6
         nVqG62wpK63vE1Tp7B3dqCahWkStixbURC6G/4jtlTgj1YyEMGT2ZdWRIXRTA7JQqQA4
         pVl3qxUCWfIdOWxjCrHlqdGvDa/0ekSKtYBwtc9LRD6AFWt6NW4VTX3pnB0px/3cPUHW
         biP0ZZf4MO8s4b/oMITAY/mz5qp+FteIY6FQpOPBTgisv0TvaeUkyeEPijQYe8+GwAAQ
         RmKg==
X-Gm-Message-State: AOAM533No6taY33+arDmFMmyuM4k3wqs+zH2nTlJpmgrGgS5BhZlHFtS
        /Cpnsi0YbU+wM++soDQsrdY=
X-Google-Smtp-Source: ABdhPJwXGM0FZkbPOs9LSR4UAPbIexmy56AyfaoJzRFzQezJlMnPsrxGdnRhvJg1aCMFO1bovTkCMA==
X-Received: by 2002:adf:db04:: with SMTP id s4mr9829450wri.467.1639671130578;
        Thu, 16 Dec 2021 08:12:10 -0800 (PST)
Received: from orome ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id b10sm5456629wrg.19.2021.12.16.08.12.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Dec 2021 08:12:09 -0800 (PST)
Date:   Thu, 16 Dec 2021 17:12:06 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Rob Herring <robh@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Peter Chen <peter.chen@freescale.com>,
        Nagarjuna Kristam <nkristam@nvidia.com>,
        JC Kuo <jckuo@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: usb: chipidea: Convert to json-schema
Message-ID: <YbtlVilOGk556ynR@orome>
References: <20211209165339.614498-1-thierry.reding@gmail.com>
 <YbpBFKeuSK4v7Fdz@robh.at.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="Cg/kEI5DFPwPjmTt"
Content-Disposition: inline
In-Reply-To: <YbpBFKeuSK4v7Fdz@robh.at.kernel.org>
User-Agent: Mutt/2.1.3 (987dde4c) (2021-09-10)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--Cg/kEI5DFPwPjmTt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 15, 2021 at 01:25:08PM -0600, Rob Herring wrote:
> On Thu, Dec 09, 2021 at 05:53:36PM +0100, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > Convert the ChipIdea USB2 bindings from the free-form text format to
> > json-schema.
> >=20
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> >  .../bindings/usb/chipidea,usb2.yaml           | 310 ++++++++++++++++++
> >  .../devicetree/bindings/usb/ci-hdrc-usb2.txt  | 158 ---------
> >  2 files changed, 310 insertions(+), 158 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/usb/chipidea,usb2=
=2Eyaml
> >  delete mode 100644 Documentation/devicetree/bindings/usb/ci-hdrc-usb2.=
txt
> >=20
> > diff --git a/Documentation/devicetree/bindings/usb/chipidea,usb2.yaml b=
/Documentation/devicetree/bindings/usb/chipidea,usb2.yaml
> > new file mode 100644
> > index 000000000000..0e36259f23ba
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/usb/chipidea,usb2.yaml
> > @@ -0,0 +1,310 @@
> > +# SPDX-License-Identifier: GPL-2.0-only
> > +%YAML 1.2
> > +---
> > +$id: "http://devicetree.org/schemas/usb/chipidea,usb2.yaml#"
> > +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> > +
> > +title: USB2 ChipIdea USB controller for ci13xxx
> > +
> > +maintainers:
> > +  - Peter Chen <peter.chen@freescale.com>
>=20
> This should have a reference to usb-drd.yaml I think.
>=20
> > +
> > +properties:
> > +  compatible:
> > +    oneOf:
> > +      - enum:
> > +          - fsl,imx23-usb
> > +          - fsl,imx27-usb
> > +          - fsl,imx28-usb
> > +          - fsl,imx6q-usb
> > +          - fsl,imx6sl-usb
> > +          - fsl,imx6sx-usb
> > +          - fsl,imx6ul-usb
> > +          - fsl,imx7d-usb
> > +          - fsl,imx7ulp-usb
> > +          - lsi,zevio-usb
> > +          - qcom,ci-hdrc
> > +          - chipidea,usb2
> > +          - xlnx,zynq-usb-2.20a
> > +          - nvidia,tegra20-udc
> > +          - nvidia,tegra30-udc
> > +          - nvidia,tegra114-udc
> > +          - nvidia,tegra124-udc
> > +      - items:
> > +          - const: fsl,imx6q-usb
> > +          - const: fsl,imx27-usb
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  phy_type:
> > +    $ref: /schemas/types.yaml#/definitions/string
> > +    description: The type of the PHY connected to the core. Without th=
is property the PORTSC
> > +      register won't be touched.
> > +    enum:
> > +      - utmi
> > +      - utmi_wide
> > +      - ulpi
> > +      - serial
> > +      - hsic
> > +
> > +  dr_mode:
> > +    $ref: /schemas/types.yaml#/definitions/string
> > +    description: dual-role mode of the interface
> > +    enum:
> > +      - host
> > +      - peripheral
> > +      - otg
> > +    default:
> > +      const: otg
> > +
> > +  clocks:
> > +    items:
> > +      - description: reference to the USB clock
>=20
> From the report, i.MX needs 3 clocks.

Okay, I'll look into that.

> > +  # USB bus
> > +  "#address-cells":
> > +    const: 1
> > +
> > +  "#size-cells":
> > +    const: 0
>=20
> Covered by common schema (I think).

Yeah, so this can be both used in peripheral mode and host mode, so it
probably needs usb-hcd.yaml and usb-drd.yaml, and then #address-cells
and #size-cells will get pulled in.

>=20
> > +
> > +patternProperties:
> > +  "^pinctrl-[0-9]+$": true
> > +
> > +additionalProperties:
> > +  $ref: usb-device.yaml
>=20
> This is wrong as usb.device.yaml applies to child nodes.

Originally the idea behind this was that any additionalProperties would
have to be child nodes that represent hard-wired USB devices. Given the
above and that I'm now including usb-hcd.yaml here, this is taken care
of automatically.

Thierry

--Cg/kEI5DFPwPjmTt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmG7ZVMACgkQ3SOs138+
s6FKzA//R/GhotrWh4k00B8kO0LRpHoBfdBTGa5kdp3qpVr7VO41WrXfOHgii7Fo
BfDXJbqXlynHr8rXbA33juJdkMOOdWdYmYAdNlLRq8SKlJCk2zXFoioZtwkjc5cH
eMNzsA6B3DfI4i/QBZUshrRSWAgb1KA38uS+h5iE0tjVDmCmtYsHHnbSP2rTEXAR
n7mHxp8A8jCAiBn3tdaoNatdEs9Mq+Ef5h0y+dp0wysIqxoomE+iH41alNJjUkSu
9GLwaNR+JVvm/sk3Dc3KEctQnfAnUBM0XxfTN7Nvi2I9DpSFCgSVhAEHn0wmp1jL
KcD7T8sOn5QJn9B2pizmdVn8ASQrkjGdJ8dNA4kepQBnWMsQOr/x395qyGxlfm6c
I/leFG47ugxSzEmcwCWNLc/DvXlFNM5vWViX5MwqVRR/TjdhawwhYuD4vgF6fYNg
Spa1BkCFoHJRA6RqmyXCAcy2k1jGe4HqLlG8Ct1CA3zvP8K47tna3N7AHVFeWRb/
3l7zUtPkLlZtX+fIf0mRJaW3Xh4OPubiYAaYm9RMuUEHqH6Qt1c+0sxrMUj0njk3
Bevv4xhO0ukczBnbFIM6Ic6O2GX5m32YwIXkTO9PhaEeKLXB7YZAnbcVBdjOFiEa
R3M+s4fQ2DJF+5Izs4ezcsfWS30n8DYj5z/xh8vCENS71oM04+Y=
=/HxT
-----END PGP SIGNATURE-----

--Cg/kEI5DFPwPjmTt--
