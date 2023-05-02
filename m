Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7ADAC77B7E
	for <linux-tegra@archiver.kernel.org>; Tue,  2 May 2023 11:39:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233706AbjEBLjX (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 2 May 2023 07:39:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229449AbjEBLjW (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 2 May 2023 07:39:22 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCC2A40C2;
        Tue,  2 May 2023 04:39:20 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-95369921f8eso597482566b.0;
        Tue, 02 May 2023 04:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683027559; x=1685619559;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8hxFXAeh0M+K5ue6l/DqCQ1Rj5Mr/Ew4CJWroQZ6ihE=;
        b=KiryPcHRMCUXDIDZ/axQu45l57IUlVSyooxI18JBew618NdT4eKo2gTImC8ubMdcxu
         6ZYGFjI6qZfOSET6lO5LReHy3wlhv0eBcKheeDaXnR51Sr1T7aZApoyAzSmaI0ASWRYM
         VhHTTrG1K5Cp0YxjxRUD+Tro23sP+a+8DvPAMVUkSRU9Vvi50yUp6FRrBgTwmTaGTDS7
         uOcPab4S8K1oYBatLgeG5BjWRB8wh+0050mFKrhR5Yd5dGOZL/YNvM1xiWrBUXsg5OWy
         u7CfY5jsbhYIFe4tnyTiZ2o6VAJ8rFffT2wuqC3fVEfOVh2fkfMYCv2sBMmZeFKobKmJ
         4+vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683027559; x=1685619559;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8hxFXAeh0M+K5ue6l/DqCQ1Rj5Mr/Ew4CJWroQZ6ihE=;
        b=gUYNTBi6Dhua/8+pScwxmm35XFLAyl/X40cpxtPmYfjefo5ZpLxtV54Mdjbw6YA6Ni
         Vc3WSvm4KNREFT5B9VZoFG3I3bgMvafsLDJRVMnVcIdfq2E88mQbKQfgmahvVPmc2H2n
         cxt0PZ6b0yEsu6n6zoQ0CsBcwp9+LrXcPdhxcL+ZHGu9OT2zC/C7FV/AQJ1zJ0x3sKTM
         sCeSVas37emxe07HTpVGUm+L6U8/kXhw/PhNIcMHyYwA14tii++r+xoLH+NKlgz6pivl
         7PyuF4+tYzA1RgRbxgJ51pKu2I1ZPlAwVJuYepbvYard+LG5xRPVGwgtyUDACL//PNYg
         ieoA==
X-Gm-Message-State: AC+VfDzVKDoRqB3tLH0F0bbLSiT0FbNLYZa93e9pTp0KBEkLanxIMvWB
        3vS7OepUgE94tra1ELgFrwS2duSAhbY=
X-Google-Smtp-Source: ACHHUZ6wErybHN/7Zl6ZBmsUgvQM3bpJrAihL5xvF0sZotHTWxSUDPzcCmzcZkDXxEXkmEQRNXmLhg==
X-Received: by 2002:a17:907:1b1c:b0:962:9ffa:be22 with SMTP id mp28-20020a1709071b1c00b009629ffabe22mr1949520ejc.7.1683027558946;
        Tue, 02 May 2023 04:39:18 -0700 (PDT)
Received: from orome (p200300e41f053a00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f05:3a00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id cw22-20020a170906479600b0095f06c0247asm8567216ejc.209.2023.05.02.04.39.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 May 2023 04:39:18 -0700 (PDT)
Date:   Tue, 2 May 2023 13:39:16 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Shubhi Garg <shgarg@nvidia.com>
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        jonathanh@nvidia.com, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: tegra: Document compatible for IGX
Message-ID: <ZFD2ZPZdY-Lo_2Ox@orome>
References: <20230502105437.769350-1-shgarg@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="rUU0TFKneO9EUwyZ"
Content-Disposition: inline
In-Reply-To: <20230502105437.769350-1-shgarg@nvidia.com>
User-Agent: Mutt/2.2.10 (2023-03-25)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--rUU0TFKneO9EUwyZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 02, 2023 at 10:54:36AM +0000, Shubhi Garg wrote:
> Document the compatible strings used for Nvidia IGX Orin Development
> kit which uses P3701 SKU8 and P3740 carrier board.
>=20
> Signed-off-by: Shubhi Garg <shgarg@nvidia.com>
> ---
>  Documentation/devicetree/bindings/arm/tegra.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/arm/tegra.yaml b/Documenta=
tion/devicetree/bindings/arm/tegra.yaml
> index 0df41f5b7e2a..6a5e303fba08 100644
> --- a/Documentation/devicetree/bindings/arm/tegra.yaml
> +++ b/Documentation/devicetree/bindings/arm/tegra.yaml
> @@ -176,5 +176,11 @@ properties:
>            - const: nvidia,p3768-0000+p3767-0000
>            - const: nvidia,p3767-0000
>            - const: nvidia,tegra234
> +      - description: NVIDIA IGX Orin Development Kit
> +        items:
> +          - const: nvidia,p3740-0002+p3701-0008
> +          - const: nvidia,p3740-0002

We don't usually list the carrier board here. The reasoning is that we
first list the most specific combination (carrier + module) that the
device tree describes, then the module (which theoretically the same
device tree should also be able to run on) and finally the SoC. The OS
wouldn't know what to do with just the SoC, but we list it to make it
clear what SoC family this is.

The carrier board, on the other hand, is not something that the OS can
run on standalone because it doesn't have a CPU, so we omit that from
the list of compatible strings.

Thierry

--rUU0TFKneO9EUwyZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmRQ9mIACgkQ3SOs138+
s6Gl0g//VwDrZHVFrTOuJzYxZ4NgoI8oN4XwujP969mrR5xnUhkq1ZQR12RDgANI
R6AJ/Gsz9vBxeX0S3Ioubmk/XdYlfb3oe4jR5N73OPfdagSgq3dmwA43tt1Z9RKz
iI+V9xRre9c+atZ51N1GKBb5Gh/U6kpSV4dfmUSvdVhuTnCyo8+AHWK/xG8IASwD
8dL9jxIyjl74sgK35yZ3jKQ3tDe8g2wcRwD4NseMuL1RX12EWyYRf8QZYFI/3x1P
Yw6WHC7plI5Zavk+4sy3bZ1za1cVSvPqwzzO07u2FhyYHXe3DbkCGcKunICTIyjW
MIFMoJbaELNjFhOlc5e1rq8sK4cTC+fEGaLCb74U++p8EfLk5gebS4WsHxCOUIVo
ImgrLQ3pNLpAB2+vHBYeWxhLwsJtYJgl3aah9O2AhHbnnOTJH8h5vmbRLWF09myQ
wJS6SfOcKV04p8B+FKODeEQvlKji0zg96fHSLfE5mThCmfs8Xbs6qpKGySV6dFVy
mQfa9KAyN1aXLmHepfK3nZ/pHZm3Rj5sd/r0ytH2k124nMXBsNB2koV39TIqkq6g
tuOIZCtfRPcESR3FSAtojv90YJD0oRSOhCsW06w9Jp2/+RSXOnA2Q6xBiCfePVrn
AloO11yEbqcN8/qmRpzu3xEgiVytAGZK8qexpzCRFhP1aJ7HiKQ=
=CyFg
-----END PGP SIGNATURE-----

--rUU0TFKneO9EUwyZ--
