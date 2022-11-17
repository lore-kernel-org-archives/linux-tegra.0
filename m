Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26746C433FE
	for <linux-tegra@archiver.kernel.org>; Thu, 17 Nov 2022 17:39:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240254AbiKQRjj (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 17 Nov 2022 12:39:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234969AbiKQRjS (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 17 Nov 2022 12:39:18 -0500
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 922D81EC69;
        Thu, 17 Nov 2022 09:39:15 -0800 (PST)
Received: by mail-ej1-x630.google.com with SMTP id k2so6947961ejr.2;
        Thu, 17 Nov 2022 09:39:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XzW5a+qyS3pII/Y84E6OMyCxXa5W5k1vCu/c53UlqCg=;
        b=p1Hf/qoo+vBPK7V3PvN5MqXkS+vQS16sSNJP5yH/aCdGdhJPJwp4Mqd2y/23cKEj+6
         B3Pub7IONK3Y231bjpce3brbGpRKouoNqd2n/8RogKGdZkych7VlOkNiHCiJw2hTZKEv
         io6ttXGOTHItx7vBGj4cCUDcrEUlNYKj5RarAuWei9RcugpHeR8DwBXcOqmo0Sq4RkhR
         6YqpAJxXLUdEdDq7FHo9GNeiRYkHMTG17ZQna2vup7IopHCWtIY100VEoT+nMQ19pVaT
         2allkNZmi+H9mzzWNjqRM3HOfRWsUkhkptuhj+FlYx5+ROZItwiTwNZHtmE4fljjhqk1
         2oGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XzW5a+qyS3pII/Y84E6OMyCxXa5W5k1vCu/c53UlqCg=;
        b=nii4xEmW6pKHcM5unAgVM+GmtfuMmiTnuvVYHUqayeEJJEF8/NKhM4myxcUx+GEfxf
         q0quy7DphZ8EHhdX+SgkknDjV5ftgmH174A94/+fS8EBZyLMiVHcBoJsqZBVq/XH4HOM
         dHEUfoHrys/WuAMuzqOJ9YWOr2wr6oBScBpzcBx8t6UVGzRG/7mVFzkCr8VcvaoSzC8K
         +xBLH1zF+zmIxkBhntS/m/Z0jmMfan5tEzY95HbFxCtMfh0KYBryjxcDQHXvm4u+QHkV
         3qHd1874uWwFIpXKsRMm3BHux70IbyUMruxWR+L1092HLtt6B8i13IQc1SraxD5AHwKV
         3EOg==
X-Gm-Message-State: ANoB5plJQuhZ2Jhg6MpIbOz6OUAEro2pfpH6Pk8cSGYVrMB8H+y6N/w4
        GNNUaNJu6uEDqnwtDll67VE=
X-Google-Smtp-Source: AA0mqf7bJLFcDbFlaTdoKU0uNVYRcS/e64hoE4NZJOa/VG7qQrBQVet3EsFiDJodsrmVvu9UII5Dnw==
X-Received: by 2002:a17:907:8b06:b0:7ae:ccf3:7bf0 with SMTP id sz6-20020a1709078b0600b007aeccf37bf0mr428591ejc.243.1668706753885;
        Thu, 17 Nov 2022 09:39:13 -0800 (PST)
Received: from orome (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id u8-20020a1709067d0800b0077a201f6d1esm632546ejo.87.2022.11.17.09.39.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Nov 2022 09:39:13 -0800 (PST)
Date:   Thu, 17 Nov 2022 18:39:11 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Rob Herring <robh@kernel.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: clock: tegra124-dfll: Convert to
 json-schema
Message-ID: <Y3ZxvwlSUdGxNAlE@orome>
References: <20221111152843.627286-1-thierry.reding@gmail.com>
 <20221115014341.GA3956095-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="cShrDqJy1BIc/rmm"
Content-Disposition: inline
In-Reply-To: <20221115014341.GA3956095-robh@kernel.org>
User-Agent: Mutt/2.2.8 (2022-11-05)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--cShrDqJy1BIc/rmm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 14, 2022 at 07:43:41PM -0600, Rob Herring wrote:
> On Fri, Nov 11, 2022 at 04:28:42PM +0100, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > Convert the Tegra124 (and later) DFLL bindings from the free-form text
> > format to json-schema.
> >=20
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> >  .../bindings/clock/nvidia,tegra124-dfll.txt   | 155 ----------
> >  .../bindings/clock/nvidia,tegra124-dfll.yaml  | 277 ++++++++++++++++++
> >  2 files changed, 277 insertions(+), 155 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/clock/nvidia,tegr=
a124-dfll.txt
> >  create mode 100644 Documentation/devicetree/bindings/clock/nvidia,tegr=
a124-dfll.yaml
>=20
> Looks fine, but you either have to convert the pinctrl binding first or=
=20
> drop it from the example.

You recently reviewed the pinctrl bindings and so the plan was to take
both this conversion and the pinctrl bindings through the Tegra tree so
that the dependency could be resolved there. But if you prefer I can
also just drop the pinctrl bits from the example here. It doesn't really
add anything useful.

Thierry

--cShrDqJy1BIc/rmm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmN2cbwACgkQ3SOs138+
s6HAeBAAmmYV1tdhLoVNhIox8B3pNUluZYCiES0o2QXJha2VZbbyU078Zemo05QL
+icAhNLzwl1pm7bkwTfT/EhEPeBeB/9vcc2hvuC5bF6d72ivpzQ8bmmvZJQQy/Ex
ueBruKxKQ5CLjwIIvjkhMcTvynQdFvzuJlVLIJt7QaGkoAkdwpH1BF79ZOmZN+T3
y2nzSP8SXtxOVALhCZeCQYdWN9PIowPTqIKeaCb5WUFdPEYwuptjcAYxpmg+9Vqa
UYaeDaWPjykpXGHYjBSXb62JOMnRJwnIfuRKMgy6YAXnFPs82durqKMxuyEOz5XD
rrdfBI6C9Yk3C+0ficnqdhhybbfkC34D4sVK0zOwUpdiqvQT0wCFmDxXgjXlg/xC
Xcpyb0ShJi3fwezwqu0hE3A0MkNCIdPF6EEztMdOXsxQQIs4oisGe1N9zHGfZbVP
1lKoXQLdEJGOux1YmtoORQM6VXU8bV64uQtOhrQlliPJCem2yAAI6JwrlV6MP+Ug
qM6mB0hRhkiI4fx9RJw1ClkmIuXRX3noimgDUxlGtUfSdwt1HlqcQ8a2/xS+GjWV
r58aNyy5ofhMRw1C/TKHyHKwydpdGz7WMSI67C9r5A4BHCP5sQlCfGpJ9qHAZC+z
K6M4Thedh/5oeXVgro/zYZDZyTTfvManqZ3A2zjpvn/Zt8pHJVs=
=4XpO
-----END PGP SIGNATURE-----

--cShrDqJy1BIc/rmm--
