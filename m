Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BCBCC433EF
	for <linux-tegra@archiver.kernel.org>; Thu,  2 Dec 2021 17:55:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376501AbhLBR6e (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 2 Dec 2021 12:58:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376499AbhLBR6c (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 2 Dec 2021 12:58:32 -0500
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15051C061757;
        Thu,  2 Dec 2021 09:55:10 -0800 (PST)
Received: by mail-wr1-x42c.google.com with SMTP id s13so476154wrb.3;
        Thu, 02 Dec 2021 09:55:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=wgKAyiKJ2nfuDveCIUQQb63JtY9dCL63TF7/yqdYMrU=;
        b=iUUj1rGHRcD9dFr86mAbzhOw4HZTbdjcCSpVJQrcHhUscQFG15HUFbSj640hFPJnez
         4m+OGejQOaivs3Jy4D4PMoq+aZ0t9G4Ed3u2oeGHA84n26KNXTv/ZwsunyK3veL5hpIt
         X1XLUAS4e1ep6lRSz9tmTki47WtHhmFC7HGe2Gq4gJNTZ0lqedSepBJnUSkUNj7SR1Qu
         85O5YaA+bDX8YatW58uczQGOKKG5Vzvbd5QRyReFbU0Ov7h+PwIhtYOhfq8uvntJfzcH
         kYIf8ODBzg4SzIgUgv9Tw0hbMc5UCKC6gHXxOu0UTRzZ0lX2sRMPAjIYWNJEha5RCqbk
         56KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=wgKAyiKJ2nfuDveCIUQQb63JtY9dCL63TF7/yqdYMrU=;
        b=yXKPzDpOsVhv21Do440Z/xWEojeoCklSNpFcY75Qv2jgBgFJ1cHSL1ZngM1nB3Zof8
         GVROIEO68JjxJSNbKtXGGjQlLtvao+IyAplb1fFcrr4pR2uk3OOAq0+KPK8BzBWJEoj6
         eJr7QUl+iGT7eUChz+Z76uP5YaDB/xFH5kgYQzw4OZlfw45MXiDsGhXODsQ4gPlGVpY0
         sMLNjdwe4TMk98B8nn60kI9upBq16lAQHoG2/tixTSBm1ta51FyXvQr+38JZbcT7B8jc
         Oo+voq72RRlVCUXjzp9+SJUU4JBhBnCT5ktfw4Sanl/YpPk/AHvjS1/l8k9twFiZ2S1N
         BlPw==
X-Gm-Message-State: AOAM532zEHiq+wXQ5rBWbI/vw1/g/l6HRkBBeLVTIViut3QFVYJ193bG
        J+ZmA+0u2L3olbC9tf6S+1k=
X-Google-Smtp-Source: ABdhPJzxJPKyAIpzw6rE3RcgmFwnD+Jm8wNIXLR+OtFmn3Dq6UkcTgGp/E+x9sew26+DmN9DGzA8Zg==
X-Received: by 2002:a05:6000:52:: with SMTP id k18mr16404889wrx.192.1638467708485;
        Thu, 02 Dec 2021 09:55:08 -0800 (PST)
Received: from orome.fritz.box ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id t17sm2912441wmq.15.2021.12.02.09.55.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Dec 2021 09:55:07 -0800 (PST)
Date:   Thu, 2 Dec 2021 18:55:04 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Rob Herring <robh@kernel.org>
Cc:     Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH v2 13/16] dt-bindings: i2c: tegra-bpmp: Convert to
 json-schema
Message-ID: <YakIePafm3t6rJLE@orome.fritz.box>
References: <20211119143839.1950739-1-thierry.reding@gmail.com>
 <20211119143839.1950739-14-thierry.reding@gmail.com>
 <YaWCAGQU0sjCwz66@robh.at.kernel.org>
 <Yae0DwCpFu8F/Gbw@orome.fritz.box>
 <CAL_Jsq+JvZQjN3q4A3yoM+pUPHLYKtwUT=QsDq+oQ7jk8mD3CA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="uOJW5L5kVuAsz1Of"
Content-Disposition: inline
In-Reply-To: <CAL_Jsq+JvZQjN3q4A3yoM+pUPHLYKtwUT=QsDq+oQ7jk8mD3CA@mail.gmail.com>
User-Agent: Mutt/2.1.3 (987dde4c) (2021-09-10)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--uOJW5L5kVuAsz1Of
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 01, 2021 at 12:42:07PM -0600, Rob Herring wrote:
> On Wed, Dec 1, 2021 at 11:42 AM Thierry Reding <thierry.reding@gmail.com>=
 wrote:
> >
> > On Mon, Nov 29, 2021 at 07:44:32PM -0600, Rob Herring wrote:
> > > On Fri, Nov 19, 2021 at 03:38:36PM +0100, Thierry Reding wrote:
> > > > From: Thierry Reding <treding@nvidia.com>
> > > >
> > > > Convert the NVIDIA Tegra186 (and later) BPMP I2C bindings from the
> > > > free-form text format to json-schema.
> > > >
> > > > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > > > ---
> > > > Changes in v2:
> > > > - add missing additionalProperties: false
> > > >
> > > >  .../bindings/i2c/nvidia,tegra186-bpmp-i2c.txt | 42 ---------------=
----
> > > >  .../i2c/nvidia,tegra186-bpmp-i2c.yaml         | 42 +++++++++++++++=
++++
> > > >  2 files changed, 42 insertions(+), 42 deletions(-)
> > > >  delete mode 100644 Documentation/devicetree/bindings/i2c/nvidia,te=
gra186-bpmp-i2c.txt
> > > >  create mode 100644 Documentation/devicetree/bindings/i2c/nvidia,te=
gra186-bpmp-i2c.yaml
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/i2c/nvidia,tegra186-=
bpmp-i2c.txt b/Documentation/devicetree/bindings/i2c/nvidia,tegra186-bpmp-i=
2c.txt
> > > > deleted file mode 100644
> > > > index ab240e10debc..000000000000
> > > > --- a/Documentation/devicetree/bindings/i2c/nvidia,tegra186-bpmp-i2=
c.txt
> > > > +++ /dev/null
> > > > @@ -1,42 +0,0 @@
> > > > -NVIDIA Tegra186 BPMP I2C controller
> > > > -
> > > > -In Tegra186, the BPMP (Boot and Power Management Processor) owns c=
ertain HW
> > > > -devices, such as the I2C controller for the power management I2C b=
us. Software
> > > > -running on other CPUs must perform IPC to the BPMP in order to exe=
cute
> > > > -transactions on that I2C bus. This binding describes an I2C bus th=
at is
> > > > -accessed in such a fashion.
> > > > -
> > > > -The BPMP I2C node must be located directly inside the main BPMP no=
de. See
> > > > -../firmware/nvidia,tegra186-bpmp.txt for details of the BPMP bindi=
ng.
> > > > -
> > > > -This node represents an I2C controller. See ../i2c/i2c.txt for det=
ails of the
> > > > -core I2C binding.
> > > > -
> > > > -Required properties:
> > > > -- compatible:
> > > > -    Array of strings.
> > > > -    One of:
> > > > -    - "nvidia,tegra186-bpmp-i2c".
> > > > -- #address-cells: Address cells for I2C device address.
> > > > -    Single-cell integer.
> > > > -    Must be <1>.
> > > > -- #size-cells:
> > > > -    Single-cell integer.
> > > > -    Must be <0>.
> > > > -- nvidia,bpmp-bus-id:
> > > > -    Single-cell integer.
> > > > -    Indicates the I2C bus number this DT node represent, as define=
d by the
> > > > -    BPMP firmware.
> > > > -
> > > > -Example:
> > > > -
> > > > -bpmp {
> > > > -   ...
> > > > -
> > > > -   i2c {
> > > > -           compatible =3D "nvidia,tegra186-bpmp-i2c";
> > > > -           #address-cells =3D <1>;
> > > > -           #size-cells =3D <0>;
> > > > -           nvidia,bpmp-bus-id =3D <5>;
> > > > -   };
> > > > -};
> > > > diff --git a/Documentation/devicetree/bindings/i2c/nvidia,tegra186-=
bpmp-i2c.yaml b/Documentation/devicetree/bindings/i2c/nvidia,tegra186-bpmp-=
i2c.yaml
> > > > new file mode 100644
> > > > index 000000000000..351e12124959
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/i2c/nvidia,tegra186-bpmp-i2=
c.yaml
> > > > @@ -0,0 +1,42 @@
> > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > +%YAML 1.2
> > > > +---
> > > > +$id: http://devicetree.org/schemas/i2c/nvidia,tegra186-bpmp-i2c.ya=
ml#
> > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > +
> > > > +title: NVIDIA Tegra186 (and later) BPMP I2C controller
> > > > +
> > > > +maintainers:
> > > > +  - Thierry Reding <thierry.reding@gmail.com>
> > > > +  - Jon Hunter <jonathanh@nvidia.com>
> > > > +
> > > > +description: |
> > > > +  In Tegra186 and later, the BPMP (Boot and Power Management Proce=
ssor)
> > > > +  owns certain HW devices, such as the I2C controller for the power
> > > > +  management I2C bus. Software running on other CPUs must perform =
IPC to
> > > > +  the BPMP in order to execute transactions on that I2C bus. This
> > > > +  binding describes an I2C bus that is accessed in such a fashion.
> > > > +
> > > > +  The BPMP I2C node must be located directly inside the main BPMP =
node.
> > > > +  See ../firmware/nvidia,tegra186-bpmp.yaml for details of the BPMP
> > > > +  binding.
> > > > +
> > > > +  This node represents an I2C controller. See ../i2c/i2c.txt for d=
etails
> > > > +  of the core I2C binding.
> > > > +
> > > > +properties:
> > > > +  compatible:
> > > > +    const: nvidia,tegra186-bpmp-i2c
> > > > +
> > >
> > > > +  "#address-cells":
> > > > +    const: 1
> > > > +
> > > > +  "#size-cells":
> > > > +    const: 0
> > >
> > > Covered by i2c-controller.yaml. Add a reference and then use
> > > unevaluatedProperties.
> >
> > About that: I've recently noticed that this doesn't seem to work
> > properly. I'm using branch draft2020-12 from your github and my
>=20
> Use dtschema main/master branch. That branch is likely stale.

That seems to have helped somewhat. I do occasionally see warnings now
about unevaluated properties being unexpected. I can still reproduce the
issue, though, see below.

> > understanding was that this should give us support for
> > unevaluatedProperties. And indeed, it no longer complains about
> > #address-cells and #size-cells if I remove them from this binding,
> > presumably because it gets them from i2c-controller.yaml.
> >
> > However, a side-effect seems to be that now it also ignores any
> > properties that aren't defined anywhere. So for example if I touch
> > up the example in firmware/nvidia,tegra186-bpmp.yaml and add a bogus
> > "foo-bar =3D <0>;" property in the BPMP I2C node, then it'll blindly
> > accept that as valid.
>=20
> Do you have unevaluatedProperties within the i2c node? It only applies
> to 1 level, and you can't have a parent+child schema evaluated with
> another child (or parent+child) schema. This is why the graph schema
> is done the way it is and why we're splitting spi-controller.yaml
> child node schema out to spi-peripheral.yaml.

Let me give an example based on a schema that's already upstream. So
looking at this:

	Documentation/devicetree/bindings/spi/nvidia,tegra210-quad.yaml

it does include spi-controller.yaml via an allOf: [ $ref: ... ], so it
uses unevaluatedProperties to validate against any generic SPI
controller properties. For example, #address-cells and #size-cells are
validated based on the schema from spi-controller.yaml.

However, if I now apply the following patch to add an undocumented
property to the example, then validation doesn't fail as I would expect
it to.

--- >8 ---
diff --git a/Documentation/devicetree/bindings/spi/nvidia,tegra210-quad.yam=
l b/Documentation/devicetree/bindings/spi/nvidia,tegra210-quad.yaml
index 35a8045b2c70..e9342faf5194 100644
--- a/Documentation/devicetree/bindings/spi/nvidia,tegra210-quad.yaml
+++ b/Documentation/devicetree/bindings/spi/nvidia,tegra210-quad.yaml
@@ -104,6 +104,7 @@ examples:
             resets =3D <&tegra_car 211>;
             dmas =3D <&apbdma 5>, <&apbdma 5>;
             dma-names =3D "rx", "tx";
+            foo-something =3D <42>;
=20
             flash@0 {
                     compatible =3D "spi-nor";
--- >8 ---

I would expect the validation to fail for foo-something because it isn't
defined in any of the schemas.

Or is this one of the cases that you mentioned above. I must admit I did
not follow what exactly is expected to work and what isn't. The QSPI
controller example from above seems simple enough.

Thierry

--uOJW5L5kVuAsz1Of
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmGpCHUACgkQ3SOs138+
s6EN5g//ci+kNNOP378mVU1N8dDsUv0LxAKxTd80fF05q1H74a6A4iCa4Suijb1U
fc97E/OglW6hD362z68t1sQVCtVjS9NoPvkFvf33RYyoADh/7ztGEB7tHDNXZkFf
uTggakd5HcDYpuk4eqmXuAs2nR/LOjFraKly9Gg6kM/4BewYphAZJSPjbXhhfcdO
bk8pG5DQmOeELI+pPqSsOfj5Np8GL5g26chIMgvfxZGLmYlWHRrV9O+FRTLlvQt4
t+RY0lsP7mYVhG0+j8R2YIb0k2dPhIXCzFOPw4bJYE9j+avrSAgKDEoUuR3OMzxN
2X2XOvO/jSW4I34YIN4GqSAF49OuAyhw8EkTwgE38FLUMNy/Dnl1LFqQN36137VI
xaGszztNtlbqIhqzzNNMaJ/w0wGT57l/+qySfSVxagP+qzh9VwKJWSOgJOpmOrTP
fEutOLDl/j2jdJSuzMz+s0ZgFKe0NPrLB/C+azKYpwkn4wLvBPyLCwHYXIaRxZ8h
2p7TovUlX0Ij55bGHdhTdpcFRRkoO1M15EkdV1QlqXmvVKkijN0aWTVI+svAZ7JF
sS4M9bRVRilteK5JB2ouR58oOd05h3vSG6x7tVsQt7T12M7Jo+iqDpx8h1tFWW5w
7WzV4AbBpr/6jONXhP3XzTj0KSU/mCS+VPkVaTKvajoHoNRKkvg=
=cldr
-----END PGP SIGNATURE-----

--uOJW5L5kVuAsz1Of--
