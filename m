Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DA86C433EF
	for <linux-tegra@archiver.kernel.org>; Wed,  8 Dec 2021 14:43:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235334AbhLHOqs (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 8 Dec 2021 09:46:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232999AbhLHOqr (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 8 Dec 2021 09:46:47 -0500
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2D54C061746;
        Wed,  8 Dec 2021 06:43:15 -0800 (PST)
Received: by mail-wm1-x32b.google.com with SMTP id p27-20020a05600c1d9b00b0033bf8532855so1929822wms.3;
        Wed, 08 Dec 2021 06:43:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=gkckMTiZfRwVNN4itkbvhr/VyfBzxnDGQ/5xxIOPdP8=;
        b=jwHiPKQtQZ2UJMeEteCcSTn1pH8heQ7r4zZDRd+DA0hbuMlvQa0OPs1SNFyNMEyPNj
         8fzfdfsQD0zGipjDUaBJCxoHgHBFIezBuGd0v+RwoyXOvpRvEeSseDNbH0p9kHyYK2/h
         cqjAjTDg1jWeZpB5WO3rlJ6CWg9mTnByDDzAI+cuU/A2JbGBO9tdfJiBaAhz+ZofAy6n
         BByH0tY54Ao+itOckYdsWmSkdpWgaxSh42f8POO/wqQbJWx4lovIz6h4NF3IyAs11HFp
         Q4Vg27HOcR29r6mthZlfHOIUZliGAmvzYKQUMpDStpo/Rl2yIAfDzQ3W0hh7ejGm36At
         HKhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=gkckMTiZfRwVNN4itkbvhr/VyfBzxnDGQ/5xxIOPdP8=;
        b=37Pcagpa4ZxBtwKyeWlQQXW6B7/Tus7n48Y3dev8nhiicjr91QN6MjzeAkkdqmsKgG
         XpHl0gzqnCgFVpqq7u9lkxyzcEiCX8gJsGIUya0veo7IwwYFf7aopx2mzyGX1JfL+x34
         AveEijTswkpREstENsVuX32rLz3p3dNt8ubqDOVNKzuhwndmSNqlLDMuHzIAg9ThSzdk
         TZPqTtvPWlzWcAq9NsysnpLT7gMENNaQTEqAu2AvQEAAEWFvW/tBV6iMWnyZuj7gvOnK
         irPt/F2Rd31GcsZvGJ0Jti1jZLNtlAuIN4L5+kOlcNZrhVAMGxI5F+koEE8kOfkW1GfC
         ATyw==
X-Gm-Message-State: AOAM530jwWbroFIs8WbFRtH82T7P0JDVd7bZz2JNNN0u0PllIjaFsfch
        9e/CruNZB3JlNUZxdYemxD0=
X-Google-Smtp-Source: ABdhPJz7/W5CBLFVMWOOtUxYXPDa6nVfnt98Y0vRzXNYiq3jlJc65jPiIT+FJ5Bdr9F/LXZCqLBTdg==
X-Received: by 2002:a7b:c94e:: with SMTP id i14mr16559721wml.85.1638974594333;
        Wed, 08 Dec 2021 06:43:14 -0800 (PST)
Received: from orome ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id f7sm3651944wri.74.2021.12.08.06.43.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Dec 2021 06:43:13 -0800 (PST)
Date:   Wed, 8 Dec 2021 15:43:10 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH v3] dt-bindings: i2c: tegra-bpmp: Convert to json-schema
Message-ID: <YbDEfhIp5FCTZ8rS@orome>
References: <20211208143306.534700-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="6v150EU9JdEI1kSj"
Content-Disposition: inline
In-Reply-To: <20211208143306.534700-1-thierry.reding@gmail.com>
User-Agent: Mutt/2.1.3 (987dde4c) (2021-09-10)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--6v150EU9JdEI1kSj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 08, 2021 at 03:33:06PM +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
>=20
> Convert the NVIDIA Tegra186 (and later) BPMP I2C bindings from the
> free-form text format to json-schema.
>=20
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
> Changes in v3:
> - include i2c-controller.yaml and use unevaluatedProperties: false
>=20
> Changes in v2:
> - add missing additionalProperties: false
>=20
>  .../bindings/i2c/nvidia,tegra186-bpmp-i2c.txt | 42 -----------------
>  .../i2c/nvidia,tegra186-bpmp-i2c.yaml         | 45 +++++++++++++++++++
>  2 files changed, 45 insertions(+), 42 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/i2c/nvidia,tegra186=
-bpmp-i2c.txt
>  create mode 100644 Documentation/devicetree/bindings/i2c/nvidia,tegra186=
-bpmp-i2c.yaml

Rob, for context, I've split this one out of the 16-patch series since
you had reviewed the other 15 already. This is the updated version that
came out of the discussion we had regarding unevaluatedProperties not
working correctly because of additionalProperties: true.

Thierry

--6v150EU9JdEI1kSj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmGwxH4ACgkQ3SOs138+
s6GPJA//SMiwEDapgISMALUXnq/+FRmIHvDGIzzKCYG5+zAcX8pQ7kS2zGmfJlXp
a011IkNqJoDai1DvSQihlygX3V4LE3Fgg+uh4m3hFyTIk+L7KWdfc5JqriVBXWSK
slUp7ct0dTp0jqu8bjDhhF3Jj6slIg2AMKJWUBXLO/H/9maTsnj/68sgfIr/5RV9
MPYGn74mVp2sVuTK0Kx5qZlI2cQrVoIhtbMC9JXfWnWFPrHKwgbx02uT160ChY5V
b7VhC3kdy25ePdEuhCPjv5eSVrNGHyKOgbd7CGnKQfSmHzbFtC4gIBC99MPWb4Pc
YayaEyMepdejMK/u2d3mGaDY0TQYU+O002t8HyZTTwUjXRFMTDvW6gT2uQXzDoUJ
4oN81QycQXk8hMCYuUh4auebWxupNrj4X/Y8b7E2kgENtQnqh5JLTvUH5DT8ZYwR
hc7mY2W8jsmChuAPkwMRDQ83BtxL9pCJtq7h7fKcb9wkIAaM5Fg2434LTYGhpBNK
AqQYrXk1NFi4cRL23qjqqCHf7XnBgpUGKGHfrDA3CoE+gL5ZrGvZidpqrT42TaNe
Nn/3rsRgvv0ycSy55f8YEOqKzL3fodXIJhHsBynPTuPoOhXZSB36b9CByjStdhrH
+VmRry0Cm00+zLuqVr/LjNOy+WbQzkb/nHyj+NAbB/e35pLM5Wk=
=zZyG
-----END PGP SIGNATURE-----

--6v150EU9JdEI1kSj--
