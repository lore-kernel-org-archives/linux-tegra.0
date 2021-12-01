Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE3F6C433F5
	for <linux-tegra@archiver.kernel.org>; Wed,  1 Dec 2021 17:43:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231247AbhLARq6 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 1 Dec 2021 12:46:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351986AbhLARqG (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 1 Dec 2021 12:46:06 -0500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FDABC061574;
        Wed,  1 Dec 2021 09:42:44 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id j3so54059474wrp.1;
        Wed, 01 Dec 2021 09:42:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=/38o/AH1TKnXI0LIHzDIDc1lk5RpIUmNse8Tugy12rU=;
        b=kbUO1+WUdT0WaXw+fNVH2VL8Zaahd6KQFVPWj8Fvh6yB+bwmTjXDN9q0wK053nV/n7
         SFHmecVvWlXTdZm6xsQEMWrHzEf7FkgtHWy4ZwBA4AGVbcfbtpmBh+PhXGllrJlqIYUp
         GlibYx+fsqRMJ9gl7Qswl7nD46FvptsLgn+GtNYrnM5zoxFBZQZuwi3277h8PvRqlMV2
         EsExPT+iz8M9ObSQ8PfUJ8Lmv9VzGdkHftnwUszpzCPsiwAJk5Mk7KhJwPmntb67I1vC
         +iwLBxDjAUhwMiCr+X7AY0bx1sWO1Fd4uuMp5cwwoQujBZC7p+OEIp/fJ9OdvcHzt7dJ
         timg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=/38o/AH1TKnXI0LIHzDIDc1lk5RpIUmNse8Tugy12rU=;
        b=G0AK5JZhxELV7g6QpgzqpXb0N8sXmx3pSSIOhVePngtFZ9l/1fzNSro4Tzrqr7pwrR
         4vX6pHLImkDqJUQNw3ZLgoXVLHLgRUsq5jx21laAWHUruWnqAQ8hCdfQXE10rsDnF6HX
         01ZdMBVuuMZ0JnNkTW30r4k7KsmKdsxbyg8ShwkV20yglnYzs5WBxssPac5Budx1trrh
         4MTIrrDQ872udT8wH+Bzs1LcVUAPEz0PgcyFp0m9jjh+DJ25OwYfNsZzdJr2IHVlVzRz
         TbIRG+TTucnWK3wCS5LxNkYSnavJUpcKpeumuz3sCWlQGAgxbej7a43sLFh+J/z/4CJu
         zZSw==
X-Gm-Message-State: AOAM533jymZRMjk9A0fY7+Xh2Wh0m7XwWbhGFd/+sJvSKYl1T+zYHvhb
        WT4d2aDmsKhFR1srbhu8IjU=
X-Google-Smtp-Source: ABdhPJxrKd6ngIohAlDdQj44ZvxfSk0BTxR7bzoJyszv240mZxkYFpRbVgW/9eicDDwF7YOSHY3Mhg==
X-Received: by 2002:a5d:568c:: with SMTP id f12mr8304369wrv.240.1638380563100;
        Wed, 01 Dec 2021 09:42:43 -0800 (PST)
Received: from orome.fritz.box ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id d2sm1797119wmb.24.2021.12.01.09.42.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Dec 2021 09:42:42 -0800 (PST)
Date:   Wed, 1 Dec 2021 18:42:39 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Rob Herring <robh@kernel.org>
Cc:     Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH v2 13/16] dt-bindings: i2c: tegra-bpmp: Convert to
 json-schema
Message-ID: <Yae0DwCpFu8F/Gbw@orome.fritz.box>
References: <20211119143839.1950739-1-thierry.reding@gmail.com>
 <20211119143839.1950739-14-thierry.reding@gmail.com>
 <YaWCAGQU0sjCwz66@robh.at.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="MR/J0Ig+ucbtK1T1"
Content-Disposition: inline
In-Reply-To: <YaWCAGQU0sjCwz66@robh.at.kernel.org>
User-Agent: Mutt/2.1.3 (987dde4c) (2021-09-10)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--MR/J0Ig+ucbtK1T1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 29, 2021 at 07:44:32PM -0600, Rob Herring wrote:
> On Fri, Nov 19, 2021 at 03:38:36PM +0100, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > Convert the NVIDIA Tegra186 (and later) BPMP I2C bindings from the
> > free-form text format to json-schema.
> >=20
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> > Changes in v2:
> > - add missing additionalProperties: false
> >=20
> >  .../bindings/i2c/nvidia,tegra186-bpmp-i2c.txt | 42 -------------------
> >  .../i2c/nvidia,tegra186-bpmp-i2c.yaml         | 42 +++++++++++++++++++
> >  2 files changed, 42 insertions(+), 42 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/i2c/nvidia,tegra1=
86-bpmp-i2c.txt
> >  create mode 100644 Documentation/devicetree/bindings/i2c/nvidia,tegra1=
86-bpmp-i2c.yaml
> >=20
> > diff --git a/Documentation/devicetree/bindings/i2c/nvidia,tegra186-bpmp=
-i2c.txt b/Documentation/devicetree/bindings/i2c/nvidia,tegra186-bpmp-i2c.t=
xt
> > deleted file mode 100644
> > index ab240e10debc..000000000000
> > --- a/Documentation/devicetree/bindings/i2c/nvidia,tegra186-bpmp-i2c.txt
> > +++ /dev/null
> > @@ -1,42 +0,0 @@
> > -NVIDIA Tegra186 BPMP I2C controller
> > -
> > -In Tegra186, the BPMP (Boot and Power Management Processor) owns certa=
in HW
> > -devices, such as the I2C controller for the power management I2C bus. =
Software
> > -running on other CPUs must perform IPC to the BPMP in order to execute
> > -transactions on that I2C bus. This binding describes an I2C bus that is
> > -accessed in such a fashion.
> > -
> > -The BPMP I2C node must be located directly inside the main BPMP node. =
See
> > -../firmware/nvidia,tegra186-bpmp.txt for details of the BPMP binding.
> > -
> > -This node represents an I2C controller. See ../i2c/i2c.txt for details=
 of the
> > -core I2C binding.
> > -
> > -Required properties:
> > -- compatible:
> > -    Array of strings.
> > -    One of:
> > -    - "nvidia,tegra186-bpmp-i2c".
> > -- #address-cells: Address cells for I2C device address.
> > -    Single-cell integer.
> > -    Must be <1>.
> > -- #size-cells:
> > -    Single-cell integer.
> > -    Must be <0>.
> > -- nvidia,bpmp-bus-id:
> > -    Single-cell integer.
> > -    Indicates the I2C bus number this DT node represent, as defined by=
 the
> > -    BPMP firmware.
> > -
> > -Example:
> > -
> > -bpmp {
> > -	...
> > -
> > -	i2c {
> > -		compatible =3D "nvidia,tegra186-bpmp-i2c";
> > -		#address-cells =3D <1>;
> > -		#size-cells =3D <0>;
> > -		nvidia,bpmp-bus-id =3D <5>;
> > -	};
> > -};
> > diff --git a/Documentation/devicetree/bindings/i2c/nvidia,tegra186-bpmp=
-i2c.yaml b/Documentation/devicetree/bindings/i2c/nvidia,tegra186-bpmp-i2c.=
yaml
> > new file mode 100644
> > index 000000000000..351e12124959
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/i2c/nvidia,tegra186-bpmp-i2c.ya=
ml
> > @@ -0,0 +1,42 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/i2c/nvidia,tegra186-bpmp-i2c.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: NVIDIA Tegra186 (and later) BPMP I2C controller
> > +
> > +maintainers:
> > +  - Thierry Reding <thierry.reding@gmail.com>
> > +  - Jon Hunter <jonathanh@nvidia.com>
> > +
> > +description: |
> > +  In Tegra186 and later, the BPMP (Boot and Power Management Processor)
> > +  owns certain HW devices, such as the I2C controller for the power
> > +  management I2C bus. Software running on other CPUs must perform IPC =
to
> > +  the BPMP in order to execute transactions on that I2C bus. This
> > +  binding describes an I2C bus that is accessed in such a fashion.
> > +
> > +  The BPMP I2C node must be located directly inside the main BPMP node.
> > +  See ../firmware/nvidia,tegra186-bpmp.yaml for details of the BPMP
> > +  binding.
> > +
> > +  This node represents an I2C controller. See ../i2c/i2c.txt for detai=
ls
> > +  of the core I2C binding.
> > +
> > +properties:
> > +  compatible:
> > +    const: nvidia,tegra186-bpmp-i2c
> > +
>=20
> > +  "#address-cells":
> > +    const: 1
> > +
> > +  "#size-cells":
> > +    const: 0
>=20
> Covered by i2c-controller.yaml. Add a reference and then use=20
> unevaluatedProperties.

About that: I've recently noticed that this doesn't seem to work
properly. I'm using branch draft2020-12 from your github and my
understanding was that this should give us support for
unevaluatedProperties. And indeed, it no longer complains about
#address-cells and #size-cells if I remove them from this binding,
presumably because it gets them from i2c-controller.yaml.

However, a side-effect seems to be that now it also ignores any
properties that aren't defined anywhere. So for example if I touch
up the example in firmware/nvidia,tegra186-bpmp.yaml and add a bogus
"foo-bar =3D <0>;" property in the BPMP I2C node, then it'll blindly
accept that as valid.

The validation will flag if I set #address-cells =3D <2> in the BPMP
I2C node, so validation of the schema still seems to work, but for
some reason it won't flag any properties that haven't been specified
in the schema.

Do I misunderstand how this is supposed to work, or is there something
wrong with the current implementation of unevaluatedProperties?

Thierry

--MR/J0Ig+ucbtK1T1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmGntAwACgkQ3SOs138+
s6FV/hAAt98KlSxKNdRbP0PXz04bjfiPXr5LG2eMiEsbEfzeqZoTji0Jpve5sMs/
SxTz1zwYlQZlxqQWjV5f3h14Z2zDRxKm5iQvfZ/7fCqj+WbNkd4e4lIHrCmlGp6g
6gwwfuwTktj/pFdegQKInbZmzVSD1KCrJ8bDOxYoeMWcK60t04haBPf9tTlmeg0i
n1eBrgGHkiHMLL4w4ohC2ZyuuAFkgDMDRkrRdjZgJiPIg8h8gvOUjTZDySrWC1SQ
l/JFUR1wxVNSOjc5A9sA31jNqTLk59BNjsBPwf7nr4MAkNiwLf1Dws5RJ5WXacMe
Hgna8boxrKXPoz7wiL+ENweoECNIbL61QiGlwI725dOE/y7VuGpDTkMWg+9jMow/
7yvwsEM4NIpkfY8IGdIm0aqwNyx0ooqQvCVPfErkjsWmKy510Xlfn3NM/cZqmUr6
Cvipr7cIukmTLl1pk45h90p8fObIeAjSF6vaRvKUbOiL5PEP+oVkqtKpEiXeWfWx
LKt94Pt9PUXc0K32unF47nlkDrMzW8J/owVSEPxxHFUEHCyl7yC1nWh1UkwsxNEC
oEvIgWndq0ZtHxE0Hv0udgUnNL486cpJPzMn1OggSwIo9XXxWwxv+xHNZlFToyyg
BwSDz7KNBUZVSTmVekgCTzP6/x5nJlR1T7qqmHySBuDipR/5jDg=
=AOYp
-----END PGP SIGNATURE-----

--MR/J0Ig+ucbtK1T1--
