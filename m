Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3F0FEB64DA
	for <linux-tegra@archiver.kernel.org>; Mon, 10 Jul 2023 13:19:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231176AbjGJNTV (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 10 Jul 2023 09:19:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229843AbjGJNTU (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 10 Jul 2023 09:19:20 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32E84E7;
        Mon, 10 Jul 2023 06:19:18 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-4fba74870abso6486343e87.0;
        Mon, 10 Jul 2023 06:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688995156; x=1691587156;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6aOdGyynmWWqbqdZDqGdzAZUvPTpMmxKT3Kygw1Ysyo=;
        b=mb5ZitFud1PYcVKV1pcWoS8SyMzHfMU10IkfAwz2Zv9rYva6TmCS/SOn8dMD5Le9hA
         qQ5FlrvmisuY6n2c2Yc6ORAb6lTTKvP/4u8YxNFobotBYXnzISObtrCLhqdDirpkhqp9
         dm/bS32S7LrZz22Gmz6ZaU5Vr5VSwJTKLBiQBo1dw5FIjD9GG44qxnkpZLac1ieEegBr
         SCcOytS5CiQi0EIlArtSl0WkheYA43W42YhLrhmTQyUwwPjasb14ayBYM3iWe+1CqnSi
         3rW8taGpTH9/VRVP8U49CPPd7Mm43hW/pllboIyq10JblpPc2hSxXK/90CwHCtsamoyS
         YzFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688995156; x=1691587156;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6aOdGyynmWWqbqdZDqGdzAZUvPTpMmxKT3Kygw1Ysyo=;
        b=VE8n4aMS3VYgsok0cBiSnzgOqmb4vZ3ZdTfrai5c4k/TVoQYmhgttcqcMahAnJPhql
         WeOIFA0BDiagVSQyAuArgv2qz7+dkio43bszCdYx+8t6lowwg+v4XUKVRSD/jfHJXFHW
         RYypQexVCi2E6AVrouY8G4RMMsbpf+IqQtZlCCQN7zeDaa5lp2O7b5CEjiw5fU8ZGwPa
         gKb9WDoVRFbKFpGQHbmhdBxGKJRUzmJDTfKyhebsBpEUBszQtL9T7Vbh0NENG9L4ELwl
         OhhWek5UWtHsJCk/999NCnEda59xGQhsOeniGgpqk29SxakSlEJEqo0XM6SBhsFqGPJw
         KBhA==
X-Gm-Message-State: ABy/qLbFecZkV1p56BLofPGUAC3dNrP4ccl8EOT8VtFtbYHys5iRuuU9
        68xD6hf0sjo8wu5k8HCT4qjoKvpneOY=
X-Google-Smtp-Source: APBJJlG3YmTAj/O3aWynB75ow0CVQvSAwcU/ciEOc4M7dYaH5keI2PP4dPnXc//VdS/avio6uee3Jg==
X-Received: by 2002:a05:6512:33c9:b0:4f8:5717:e41b with SMTP id d9-20020a05651233c900b004f85717e41bmr11873692lfg.41.1688995156254;
        Mon, 10 Jul 2023 06:19:16 -0700 (PDT)
Received: from orome (p200300e41f4b7100f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4b:7100:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id a27-20020a17090640db00b00977cad140a8sm6095545ejk.218.2023.07.10.06.19.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jul 2023 06:19:15 -0700 (PDT)
Date:   Mon, 10 Jul 2023 15:19:14 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Rob Herring <robh@kernel.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH 1/7] dt-bindings: arm: tegra: pmc: Improve property
 descriptions
Message-ID: <ZKwFUupH_GZoGrKm@orome>
References: <20230707131711.2997956-1-thierry.reding@gmail.com>
 <20230707222941.GA1083838-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="eXiGa/D0/5WtLH+4"
Content-Disposition: inline
In-Reply-To: <20230707222941.GA1083838-robh@kernel.org>
User-Agent: Mutt/2.2.10 (2023-03-25)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--eXiGa/D0/5WtLH+4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 07, 2023 at 04:29:41PM -0600, Rob Herring wrote:
> On Fri, Jul 07, 2023 at 03:17:05PM +0200, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > Reformat the description of various properties to make them more
> > consistent with existing ones. Make use of json-schema's ability to
> > provide a description for individual list items to make improve the
> > documentation further.
> >=20
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> >  .../arm/tegra/nvidia,tegra20-pmc.yaml         | 215 +++++++++---------
> >  1 file changed, 104 insertions(+), 111 deletions(-)
> >=20
> > diff --git a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20=
-pmc.yaml b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.=
yaml
> > index 89191cfdf619..a90f01678775 100644
> > --- a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.ya=
ml
> > +++ b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.ya=
ml
> > @@ -21,17 +21,14 @@ properties:
> > =20
> >    reg:
> >      maxItems: 1
> > -    description:
> > -      Offset and length of the register set for the device.
> > +    description: Offset and length of the register set for the device.
>=20
> nit: I'd add this to patch 2.
>=20
> Reviewed-by: Rob Herring <robh@kernel.org>

Indeed, makes sense.

Thierry

--eXiGa/D0/5WtLH+4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmSsBVIACgkQ3SOs138+
s6HEdQ//fBEB/Z8kLh/BXlE9m1VQlC90JB5Gq14v76kNEz+eHnzia4SqpjahfBF4
4GCS1SEGvtbsK3DG1xDKODF5lYVQTiQD/fxHl7Ii+UJYEvRZRnq+kt6QEJfvaGyw
9E4tBNWcaMVTgow6hp5EBnVFRezGndPbjV939mufSNdyUmK9TwP3Pb8gaH/wUtNl
177iZxEaYydgCpxcKVbA4qgU/Kof9TT6sSMEwWt4iygwrYQKKMq0OiYHkXiUrlqS
ehRtZHsAw3lFnJyceNZ4HBQQrNZ169roR9BbCn2HHImRm7ryvzver8FXw4whr7EZ
mKVrcyEY0vh1ELakG9xKBLgAYhIuOFWrl9wqI/ntGmERgmBObJJcUufpHl9OnmA0
m1tdJ5ydckT1mzIIGevjvE3Dgz/ZRneNBJol1ilDPV2H6SFs2ntFqw/XeLyJq72l
W2gbZKGs0N+TAD20q2iEgO2nwqP7qL3t1Wbepz1UmqdtNfGl9zSvjOyx+SPrG+nP
6azI7vlUF1LOvgfffrjX+TVtFMMezOyl1wKzMOkEb8Od2M6kTdDf2NMWB5v57uCo
gK6uRg6iLdvj8gUYCtEpr2OM9swrxLy20cru43ThGgB8iGb86B28cemElZHqMuGH
11eOy0cixPOdYTsv5rnCtjwEjffqt1XiUJDX1ew0BxC2AXyAFoA=
=/ouW
-----END PGP SIGNATURE-----

--eXiGa/D0/5WtLH+4--
