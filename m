Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A5EDC4743C
	for <linux-tegra@archiver.kernel.org>; Mon, 21 Jun 2021 16:01:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 76FEE610EA
	for <linux-tegra@archiver.kernel.org>; Mon, 21 Jun 2021 16:01:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230118AbhFUQDd (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 21 Jun 2021 12:03:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229719AbhFUQDc (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 21 Jun 2021 12:03:32 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F8A2C061574
        for <linux-tegra@vger.kernel.org>; Mon, 21 Jun 2021 09:01:17 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id f16-20020a05600c1550b02901b00c1be4abso14288870wmg.2
        for <linux-tegra@vger.kernel.org>; Mon, 21 Jun 2021 09:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ivAWWnxfgtrmvv3mt9r+kn10vF6aZeuh33extDSkaTo=;
        b=uOqWwWQ4WOIl9VuV2Y274ZVEHBTN0BdemWxxZnRE4hduwnBUSKhefHy6iBk+4Zsibt
         GDRyURS5vRNIpHQpbAGKCzVSK93YcqY9v9Z5w8BiX5SGcTNKppe8Wp9r1k2FdlIlOB6I
         2vSaJW+0KGyconEKhQBsYZtNheZfpHLphF1nLeGOhSFBYbRershc8nBGaqvuzwZRT76d
         NL/2twFjbBzLAIerHZApKmg/H7YSv/woTz6gs7E1h5pAl68osiT/Pti4kMdbcbZtl/Wd
         nE/heYSlsxk/HBUIQg0dbbJZl+XZtZvc6/86NWBi3fABFvAWVqXODwyc/yUsfwYykoN+
         T/tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ivAWWnxfgtrmvv3mt9r+kn10vF6aZeuh33extDSkaTo=;
        b=MbZRLza6hrr9x427+3NuV3gLaHyx1J9K6YsiqcNK9nmMCGBgnq/T64V7RvKXtir6D9
         MZhqcEdbuah4vR7W+jxYItutX0Xepef8xErHrVjf1/3ZkCVYZRJfw9IFCt0BN19uzaBx
         M4Sct1gqrngUQCDGao9qJ8RUtNcdrE8AEnNKLIM1zhTQCK4OUriwsoYgN/7NvVOs4VJF
         T4IZ5L0xEOEKILuglD7OR3gCz1ODnKGyL1ooAFxFH0jnpYHbPWesKy/XAQIDKzIRWnp6
         4wc5FdJiEqjPdIoaWow9/EMtzG/KfTghhgBAb4EjjRJxQhoz/UDeHumEn36WLypeKgy0
         IG2A==
X-Gm-Message-State: AOAM530mJoSZo9m6gGJ+NDU60o8dFgLl0o5EE/8o17fdTaodD9XJVqBf
        HKs4CEmVSwlhoXiBS2I5CbI=
X-Google-Smtp-Source: ABdhPJx7aPSw8G1VbByNyfHybZXWzG2tegvel5Pn2UV6Pnm1dIobwxNlOc5wlZr/ZS/3wK6c5Iaf7Q==
X-Received: by 2002:a1c:4b05:: with SMTP id y5mr4923971wma.96.1624291275970;
        Mon, 21 Jun 2021 09:01:15 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id c13sm18590628wrb.5.2021.06.21.09.01.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jun 2021 09:01:14 -0700 (PDT)
Date:   Mon, 21 Jun 2021 18:03:11 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Will Deacon <will@kernel.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Linux IOMMU <iommu@lists.linux-foundation.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Nicolin Chen <nicolinc@nvidia.com>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v3 2/9] dt-bindings: arm-smmu: Add Tegra186 compatible
 string
Message-ID: <YNC4PxIqUZb6gtZc@orome.fritz.box>
References: <20210603164632.1000458-1-thierry.reding@gmail.com>
 <20210603164632.1000458-3-thierry.reding@gmail.com>
 <CAL_JsqLDKxwANn2Pba0Db6J9337pK0dNL=bBN8ucn-k4DZ3gyg@mail.gmail.com>
 <14551e79-853d-471f-bb5e-0d2d6581a9b6@canonical.com>
 <YNCeK9cdMPf+serd@orome.fritz.box>
 <20210621155418.GA29488@willie-the-truck>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="+CwF57SIeipNOA+L"
Content-Disposition: inline
In-Reply-To: <20210621155418.GA29488@willie-the-truck>
User-Agent: Mutt/2.0.7 (481f3800) (2021-05-04)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--+CwF57SIeipNOA+L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 21, 2021 at 04:54:18PM +0100, Will Deacon wrote:
> On Mon, Jun 21, 2021 at 04:11:55PM +0200, Thierry Reding wrote:
> > On Mon, Jun 21, 2021 at 08:46:54AM +0200, Krzysztof Kozlowski wrote:
> > > On 18/06/2021 21:47, Rob Herring wrote:
> > > > On Thu, Jun 3, 2021 at 10:49 AM Thierry Reding <thierry.reding@gmai=
l.com> wrote:
> > > >> diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml=
 b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> > > >> index 9d27aa5111d4..1181b590db71 100644
> > > >> --- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> > > >> +++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> > > >> @@ -54,8 +54,14 @@ properties:
> > > >>            - const: arm,mmu-500
> > > >>        - description: NVIDIA SoCs that program two ARM MMU-500s id=
entically
> > > >>          items:
> > > >> +      - description: NVIDIA SoCs that require memory controller i=
nteraction
> > > >=20
> > > > This is not valid jsonschema:
> > > >=20
> > > > /builds/robherring/linux-dt/Documentation/devicetree/bindings/iommu=
/arm,smmu.yaml:
> > > > properties:compatible:oneOf:4:items: 'anyOf' conditional failed, one
> > > > must be fixed:
> > > > None is not of type 'object', 'boolean'
> > > > None is not of type 'array'
> > > > from schema $id: http://json-schema.org/draft-07/schema#
> > > > /builds/robherring/linux-dt/Documentation/devicetree/bindings/iommu=
/arm,smmu.yaml:
> > > > properties:compatible:oneOf:4:items: 'oneOf' conditional failed, one
> > > > must be fixed:
> > > > None is not of type 'object'
> > > > None is not of type 'array'
> > > > from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
> > > > /builds/robherring/linux-dt/Documentation/devicetree/bindings/iommu=
/arm,smmu.yaml:
> > > > properties:compatible:oneOf:4:items: 'oneOf' conditional failed, one
> > > > must be fixed:
> > > > None is not of type 'object'
> > > > None is not of type 'array'
> > > > from schema $id: http://devicetree.org/meta-schemas/string-array.ya=
ml#
> > > > /builds/robherring/linux-dt/Documentation/devicetree/bindings/iommu=
/arm,smmu.yaml:
> > > > properties:compatible:oneOf:5:items: 'oneOf' conditional failed, one
> > > > must be fixed:
> > > > [{'enum': [{'const': 'nvidia,tegra194-smmu'}, {'const':
> > > > 'nvidia,tegra186-smmu'}]}, {'const': 'nvidia,smmu-500'}] is not of
> > > > type 'object'
> > > > {'const': 'nvidia,tegra194-smmu'} is not of type 'string'
> > > > {'const': 'nvidia,tegra186-smmu'} is not of type 'string'
> > > > from schema $id: http://devicetree.org/meta-schemas/string-array.ya=
ml#
> > > >=20
> > > >=20
> > > > This was not reviewed nor tested since the DT list was not Cc'ed.
> > >=20
> > > Ugh, I see now weird empty item on a list... and not only DT list was
> > > skipped - Thierry did not Cc you either.
> >=20
> > This seemed like a too trivial addition to waste Rob's time on, so I
> > didn't add him (or the DT list for that matter) on Cc. The ARM SMMU
> > maintainers had reviewed this, which seemed like it was enough for what
> > the DT bindings change was doing.
>=20
> Hmm, I didn't review it. I find the yaml stuff unreadable so I usually
> wait for the DT folks to ack bindings changes before I queue them in the
> SMMU tree.

Alright... in the future I'll make sure to always Cc DT folks, even for
trivial stuff like this.

Thierry

--+CwF57SIeipNOA+L
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmDQuD0ACgkQ3SOs138+
s6HSvA/7BHYi/gFhpj4KkJ1anrFhbP8ExJoJGbVVjxip0aEE5drYxHHLf9eORDpC
zm5GpLFak8QUqsmQpu3uJDZV5GngAu+Py7MsD/F/sw/NV4sl/P2QaGO94sv3wxGU
8c/4lslxP+tS/1RQRM51y/UJntsHCMfjsFiGiGQX350CBzw8V8vBb1Hvl9DgUQKN
sW4t3nRr8vE3MfL+Bmd3rROk6sKo6oVpLA7txsPfCr3s4PS4bNo1jbEZBysDukSj
7HfGI+e/lbIBQuOcjWRrpTR2vu7cqYFKJgStP4oNcC/jyh2JuUVc4+3Lt8j8WsSD
DKGtySqU73ZLVhmcDi42mKQLRDnkqetdQvaDr91EVXrNhXCZpZOksY86K0C8cLt5
e+0/WTBftQTnSZE/fEOWVm4DtlxJij5HSScAeC3rXd8P+arP7rxlzRoDeospXKfz
rx0epONpi/LWuzCy8hjtU5+A9Tcl4xD31cEVXxwLMUEIdptt9jJj5/QymsLxW2OJ
noa2gxXa3OTutq7h4SJPRb1BW9kIFuC8lut7rVMnMUnSKgmtK/YbR1dHeHDMxzdR
isHDUlPNS+R/6Qh78c0FrUmySfU91YjBg5JuxY0nek+vmY5jHCZYITBItOfBPq21
30xQwGk0iFKRPoqInoz+sHsJ5+OkecFPXmjBmRBktj8DLfQoemI=
=w4gL
-----END PGP SIGNATURE-----

--+CwF57SIeipNOA+L--
