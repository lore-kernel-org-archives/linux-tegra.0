Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85919EB64D9
	for <linux-tegra@archiver.kernel.org>; Thu,  6 Jul 2023 13:29:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231756AbjGFN3h (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 6 Jul 2023 09:29:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230321AbjGFN3g (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 6 Jul 2023 09:29:36 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9918DF0;
        Thu,  6 Jul 2023 06:29:35 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-3fba8e2aa52so7647965e9.1;
        Thu, 06 Jul 2023 06:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688650174; x=1691242174;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DfqVNOsXFHg24u0IbHIIIa58/2lUxYQ3oboNQqt8RqE=;
        b=CMjX97ArRcijp+VNCuq4nLh/Hz2Smwhc9ZfhT6/AULZAklt4iZjDTnqA1YYE2Mq9SK
         Tm1+/rsobnEJXNJcFQvgpi5dJpSxTIUbm8GFoUXbQnk9cTGGWIlLZ+Vh6btEfpAAN+El
         aG9yLXd/8yHB8AVrQeCS2TIagtqSRAzeReFQTHi9srechocBVUdgQvpE+Kj+pTWWHoP4
         KA5PqE8IMg6aGjKWV2Wte7I5VY2riU+luqKCqSpdnemFi6DE2hFlhuQWXc9+8BIcsTbc
         H1GDM27lfejQMDVLc/YQpLkAA5Ku6XYePt7+y6kJyeRtiClEo2Cu6BgtcNqRby30pZ69
         bDRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688650174; x=1691242174;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DfqVNOsXFHg24u0IbHIIIa58/2lUxYQ3oboNQqt8RqE=;
        b=OH8FKbnT5Zc2k9HAIyxmRCBUOnBdh/cfCiVVXexKc49dk2Mzo8BFPERgh0+Qpp3OlK
         uACQiRXR6BybMALQ3OIBO3Q67AJuReblODZKryoti6NpANSpyJ8sWa2T4xqUBahIFskT
         ar7kDNBf0iDmrxZL82j6GL6iUCdNFEj8/tB25IuljYuSCkGISNuj3XJ6xMB5KaADngX8
         0G42c8sdt7TQmZWSYK2KF2ccXlJ1ihf7hT8k0QOApKrCk5Ukaali9jt7QIzxgsgXUZlQ
         F3bQZUvJHiHr7xXjv56qDdrYeiYaf8ktUTHunZpTodPHEzVAVnHR/ZClBhx1YBLkz7z2
         boCg==
X-Gm-Message-State: ABy/qLYNnU/sp/wFWKRZqDBAfakC1sDu2JDvRwNFb+mSvp909iCBnaYe
        cxIyDevlFXpz+diDES2Jb4Q=
X-Google-Smtp-Source: APBJJlF4T3MpVr+Pq3vlCFeHQ/C/St7vORHswJwg0iK2DEFP2HfGn3PmtYpI/uBtbBxtk4EUMt2ThQ==
X-Received: by 2002:a05:600c:2299:b0:3fa:1af8:6ebf with SMTP id 25-20020a05600c229900b003fa1af86ebfmr1432600wmf.0.1688650173874;
        Thu, 06 Jul 2023 06:29:33 -0700 (PDT)
Received: from orome (p200300e41f4b7100f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4b:7100:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id p13-20020a05600c204d00b003f605566610sm5169409wmg.13.2023.07.06.06.29.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jul 2023 06:29:33 -0700 (PDT)
Date:   Thu, 6 Jul 2023 15:29:31 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Rob Herring <robh@kernel.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: cpu: Document NVIDIA Tegra186 CCPLEX cluster
Message-ID: <ZKbBu0Zi2g8l0ga-@orome>
References: <20230705152825.2514544-1-thierry.reding@gmail.com>
 <20230705204401.GA1864555-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="VMy2yE+d7nJhnMSy"
Content-Disposition: inline
In-Reply-To: <20230705204401.GA1864555-robh@kernel.org>
User-Agent: Mutt/2.2.10 (2023-03-25)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--VMy2yE+d7nJhnMSy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 05, 2023 at 02:44:01PM -0600, Rob Herring wrote:
> On Wed, Jul 05, 2023 at 05:28:25PM +0200, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > Add device tree bindings for the CCPLEX cluster found on NVIDIA Tegra186
> > SoCs.
> >=20
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> >  .../cpu/nvidia,tegra186-ccplex-cluster.yaml   | 37 +++++++++++++++++++
> >  1 file changed, 37 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/cpu/nvidia,tegra1=
86-ccplex-cluster.yaml
> >=20
> > diff --git a/Documentation/devicetree/bindings/cpu/nvidia,tegra186-ccpl=
ex-cluster.yaml b/Documentation/devicetree/bindings/cpu/nvidia,tegra186-ccp=
lex-cluster.yaml
> > new file mode 100644
> > index 000000000000..4275ff16e8e3
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/cpu/nvidia,tegra186-ccplex-clus=
ter.yaml
> > @@ -0,0 +1,37 @@
> > +# SPDX-License-Identifier: (GPL-2.0+ OR BSD-2-Clause)
>=20
> Not GPL-2.0-only for some reason? Otherwise,

No particular reason. I'll change it to GPL-2.0-only OR BSD-2-Clause.

> Reviewed-by: Rob Herring <robh@kernel.org>

Thanks,
Thierry

--VMy2yE+d7nJhnMSy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmSmwbsACgkQ3SOs138+
s6HL2RAAgEubtNZQfXHmb07Zb7IFl9XYxnDULT5+IwY+z2lEPMim94zu6owSdU9Z
SV5xZE3lupqyeKyNsTvkjANqUx0d5Wsu9nlOzUTUnG6awCIALocTVAPMCffG6nPJ
0ZVoXcruk2SNkbu50ekZuIYAq4SLodEJmpIgsjLAelUS5gYglaEAc/DBxdiP6jxj
Bb1I0HoXTYuADPvkcUXn/A1ucaIUgW9JU8BuYgQJcn2r+3h0CYtCVrtulQ71+nO2
DQxPhL3DWqCAn9hzZT459j48KurwEvkQdIhpQmKCzBKRGwuCQ0iElkOWQceC4dlN
g1oHCIg9doLV0gNJNEXK7w1/YXqN/t9usjzec54AWLiJCzhUWJI+9CHKAifk3VRW
qSKKNZztvXt8VIh6K27bVXCSqTXsqHQXd4/q+0p2MmiH0Qrja6OaudsVXODUT3+x
fGvqNcCc3KJRkM0zskMGNRzEDv9fxNr7jCIbj8RsOplIvBP0RjHpKzwuXuuoGud4
n0xsSzPqzaAkyjRKx5K27Vz+QywNsYn6ITmFFrbrxrYiPwhoDeC1AcrGRREaHZl5
sWODAIgctAkjdSDnzjK0r4LVCOcwOken+1Lu8ZdaePRtvRweLJXZ46S2zuc6Wiq2
tUjhkPDu9VfGOWPS4GSOF5WxUTFEvrg2wPo1GJTaTI/UGvw+6ko=
=y4Vm
-----END PGP SIGNATURE-----

--VMy2yE+d7nJhnMSy--
