Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2D22C6FA82
	for <linux-tegra@archiver.kernel.org>; Wed, 14 Sep 2022 16:05:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229559AbiINQFk (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 14 Sep 2022 12:05:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229632AbiINQFb (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 14 Sep 2022 12:05:31 -0400
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com [IPv6:2607:f8b0:4864:20::f32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83B0F71BFB;
        Wed, 14 Sep 2022 09:05:22 -0700 (PDT)
Received: by mail-qv1-xf32.google.com with SMTP id v15so12083721qvi.11;
        Wed, 14 Sep 2022 09:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date;
        bh=SOoPRVDf2Wqru23+CWe+xyZSfkeciLBT7O19755mw8E=;
        b=TJUgisxy1Ass//cR8NhmkOr+Wv2YCzzm1FeQ+GVowtxSU4WYaNXesAq0wW0saIo2WT
         ai9dp+tLqYFdLKBucao1TtSo8AVrC/6D2tqJtFGW+753ZiC0t5y3ms5TZxwQltx+8W3T
         ZeZGfULMY9PsdC68RViAR8PzhiVyyKv4eCxshYTMBgmnY8A5pwOpmne5XcgkWTHOe0v+
         UrllJamhc8dZpIN97ykTURsAAG3ajN4pO8eEsjgzs30smzUye1vxYxpKLwcRylbmWH1a
         qnWsrUwfVNfB+YegKzzr8SJfU9fUknbl+TrKhgWJ8ar8/l0KQNH/3C+904979STvzBzm
         vJ3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date;
        bh=SOoPRVDf2Wqru23+CWe+xyZSfkeciLBT7O19755mw8E=;
        b=a4V+juKinCC71hVdHWx/quBD3XB9UBxqTcdGfVt33QBrJYmY1VvnKtcHk6v4Mxir3k
         4gl6QX3sB8kQOu02Kjo3UDcU/0q/ta9PcNi7AIAF6X7R3bV5AvLHC2W3A4RdFGAoU91J
         7u0x1O0G5JbOUPNsLZDXA5oUowf+gMKEgjA7pkOuOmOm1CPzhZmffpM0ia9hQcIwRekM
         Lo0ShO6hf74MnYNV+M4Xfby3vZeIz4984dQgKitwHmmZrWbjQ3LQw+qzO8hErhYB6/26
         hlh4aVR601FfFVPUYJZ4N5L2ezKowRD4TLCjv1br9+xeVQjEob04Zyy14eGXOcFooRYq
         h8Hg==
X-Gm-Message-State: ACgBeo15GOwrIxEvphL97o80QoR3MxOFJXravHL3XAvS1b953oBDc+hy
        YIGOSmnroP/hWz2Dl1+eAlE=
X-Google-Smtp-Source: AA6agR7tVDqgXf+tFX8Bxz9heEKs6QvsHU0fVfTQifZS+APuoT/oGczuwlMfk6TH9MRYaQNfC0WoCQ==
X-Received: by 2002:a05:6214:2521:b0:4aa:a4db:beda with SMTP id gg1-20020a056214252100b004aaa4dbbedamr31787504qvb.104.1663171521542;
        Wed, 14 Sep 2022 09:05:21 -0700 (PDT)
Received: from orome (p200300e41f12c800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f12:c800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id bn32-20020a05620a2ae000b006b615cd8c13sm2073582qkb.106.2022.09.14.09.05.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Sep 2022 09:05:20 -0700 (PDT)
Date:   Wed, 14 Sep 2022 18:05:16 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Rob Herring <robh@kernel.org>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, Jon Hunter <jonathanh@nvidia.com>,
        Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH 2/6] dt-bindings: reserved-memory: Support framebuffer
 reserved memory
Message-ID: <YyH7vGKVLoBrBusd@orome>
References: <20220905163300.391692-1-thierry.reding@gmail.com>
 <20220905163300.391692-3-thierry.reding@gmail.com>
 <20220906142721.GA427176-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="vz1N9iQ19WQDz3ja"
Content-Disposition: inline
In-Reply-To: <20220906142721.GA427176-robh@kernel.org>
User-Agent: Mutt/2.2.7 (2022-08-07)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--vz1N9iQ19WQDz3ja
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 06, 2022 at 09:27:21AM -0500, Rob Herring wrote:
> On Mon, Sep 05, 2022 at 06:32:56PM +0200, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > Document the "framebuffer" compatible string for reserved memory nodes
> > to annotate reserved memory regions used for framebuffer carveouts.
> >=20
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> >  .../bindings/reserved-memory/framebuffer.yaml | 46 +++++++++++++++++++
> >  1 file changed, 46 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/reserved-memory/f=
ramebuffer.yaml
> >=20
> > diff --git a/Documentation/devicetree/bindings/reserved-memory/framebuf=
fer.yaml b/Documentation/devicetree/bindings/reserved-memory/framebuffer.ya=
ml
> > new file mode 100644
> > index 000000000000..80574854025d
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/reserved-memory/framebuffer.yaml
> > @@ -0,0 +1,46 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/reserved-memory/framebuffer.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: /reserved-memory framebuffer node bindings
> > +
> > +maintainers:
> > +  - devicetree-spec@vger.kernel.org
> > +
> > +allOf:
> > +  - $ref: "reserved-memory.yaml"
>=20
> Don't need quotes.
>=20
> > +
> > +properties:
> > +  compatible:
> > +    const: framebuffer
> > +    description: >
> > +      This indicates a region of memory meant to be used as a framebuf=
fer for
> > +      a set of display devices. It can be used by an operating system =
to keep
> > +      the framebuffer from being overwritten and use it as the backing=
 memory
> > +      for a display device (such as simple-framebuffer).
>=20
> I'm on the fence whether we need this. It doesn't really add anything=20
> because 'simple-framebuffer' will reference this node and you can find=20
> it that way. I guess a bootloader may not setup 'simple-framebuffer',=20
> but then it should probably not have this node either.
>=20
> On the flip side, better to have compatibles than not to identify nodes.

Yeah, I think given some of the comments that Robin Murphy had on the
iommu-addresses thread, having some compatible string to derive more
information from will be useful. I'm not sure if "framebuffer" is the
greatest choice, but it says exactly what this is, so if there are no
better suggestions, I'll stick with that.

Adding Robin in case he has anything to contribute on this side of the
discussion. In retrospect it might have been good to have more overlap
between the recipients of both series.

Thierry

>=20
> > +
> > +unevaluatedProperties: false
> > +
> > +examples:
> > +  - |
>=20
> Use '/ {' to skip the boilerplate causing the error.
>=20
> > +      chosen {
> > +        framebuffer {
> > +          compatible =3D "simple-framebuffer";
> > +          memory-region =3D <&fb>;
> > +        };
> > +      };
> > +
> > +      reserved-memory {
> > +          #address-cells =3D <1>;
> > +          #size-cells =3D <1>;
> > +          ranges;
> > +
> > +          fb: framebuffer@80000000 {
> > +              compatible =3D "framebuffer";
> > +              reg =3D <0x80000000 0x007e9000>;
> > +          };
> > +      };
> > +
> > +...
> > --=20
> > 2.37.2
> >=20
> >=20

--vz1N9iQ19WQDz3ja
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmMh+7oACgkQ3SOs138+
s6F0MRAAhE8m4MmJIOnrbVe0kXrLKVk0XeKADrZ9lN4WPHMWC9wyBJZebRPuSyr8
jzYQ5fbktFcNg06Hx2pHYOoj9izSd976mWBGP8xdlo2KGrWm1c1/xof4LG29cD3t
cnd139/2Dkq65dqTjQmp8PiHJAzhhPEwqTcy8cMhL/mmyhVeFl2MXC5jcU5ryU+/
AMMjKGpJ0wSqnC0n4DITZ0NImCq13SElE04OGAMSgT6uBgsjmcLwxvGS2a5+VgIq
MNURibL9v5VZ17/r2mCrr3ScGAtI/xM88flYi9joV8phQ4tVu4u2G0qESwoACjaG
gEdWJUceJB1pQIaZTZ5UJsvkUyRYoPhGSxAqiipmhfV9PLa/iaRs1peGGGKPGzvZ
ruh/wNRVgh9BMU7vym4foFMFb1Srcs7Z7SFowj/gxxb37r7JQ4k59NQGSj27uEw0
qbBO7YC0eGiIVKzC5UMdEOH/WtswBpX4HYGR3zDuVJn61i3HoctP+AxL3N66eMti
daMD2OVDSj2QhzOt28UxBKIRUuUFxp7puVzJxBnTgYO6enbdzADZOSypS+MqCV5l
fUuhy9JZelU8oxOBMrcdA7IJbFAKDWWQNZvcIYDVNcSmxxImlCp4WdOEKpRBGP6s
j+Xe6FA4zUNY220bnkqdrMrefNKgWgKCBNDGLARqv1yyOJRGTTY=
=GyHn
-----END PGP SIGNATURE-----

--vz1N9iQ19WQDz3ja--
