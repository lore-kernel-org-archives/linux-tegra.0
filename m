Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAE20C47094
	for <linux-tegra@archiver.kernel.org>; Thu, 10 Jun 2021 09:17:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9512961407
	for <linux-tegra@archiver.kernel.org>; Thu, 10 Jun 2021 09:17:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229993AbhFJJTg (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 10 Jun 2021 05:19:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229990AbhFJJTe (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 10 Jun 2021 05:19:34 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55638C061574;
        Thu, 10 Jun 2021 02:17:25 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id m18so1426678wrv.2;
        Thu, 10 Jun 2021 02:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=lufrtSYaRB+3cU25JjfQ213i4rIMewljTlWV6qMFCfU=;
        b=OfUdSJkaR48ZzMbKamaCpBecfRh/Ga7yYmiWthlZkjbRD2aBAsms4czdHt0TeYv14s
         gfEl53pzpd2J0B7NlM1RnZc0iENloEpbv9IXOBmMTJ3b4d4LjI+mcXJbUNGsckCtlNtz
         w7tDV32ehthcXQRyNSqbTDDwcbPO0nV3y2V57Qom5op6xzhPIOiQJVIJ54hkYns38aTL
         9epRtsCLy5qMyBpvMBv18xMcZvm/Q6COwzdr0ZxD+J8BbPGzWtp/X9bV1kUpiY+vPdbP
         ugkz7as3b1trF3cEiUxBP8Bh+PiBOTOupB/UI6IHha6W/S2giYgnZtGBPlvCFerb7+/a
         ffxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=lufrtSYaRB+3cU25JjfQ213i4rIMewljTlWV6qMFCfU=;
        b=Zide5TFQd4u6K6yJd64S5JVkyVvFuQOeW7LCeiHmDBNJvvGagettw133SaQnXkwaCb
         og8FzN+8bCg1pwQBFV0m39aOzyiegZ9aM/gmnpAfvLEjEy5lF4CvcxraAKoU2eRYF1PF
         KE0JX7UC01F+4ofT2hI69wj//NbFKvg3xzOETt0RN+JRONHL9zxxA8KC8ZP45voSGiDG
         A8rI1VBVZHsDr3TsYG2votTNRYkgAKyrqBYiToDipGR6Rj2rB27tSUmXqcZbFn1tewry
         ADQvnMSgIy5+F+Vcc8m37Z4GzDy0MyQ77vLYj7EBT1gz0h3xAsBgWQyXRHOkchJ0igDT
         zv6w==
X-Gm-Message-State: AOAM532EjUqEOYGXcaB5CCswyLJXs1ztVlYaxXYTyJZq537IncR74age
        RGYIBOI2DdWdnVpkvnXO/uo=
X-Google-Smtp-Source: ABdhPJyW5m2MHrnAF1Ii+EvXADbLuM7bYTX9Cc1kCfjq7UI7PxLu4x3Bw7uYywoxvxiaKBPgYspf6A==
X-Received: by 2002:a5d:564a:: with SMTP id j10mr4235390wrw.171.1623316643906;
        Thu, 10 Jun 2021 02:17:23 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id t1sm2710631wrx.28.2021.06.10.02.17.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jun 2021 02:17:22 -0700 (PDT)
Date:   Thu, 10 Jun 2021 11:19:05 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Will Deacon <will@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
List-Id: <soc.lore.kernel.org>
Cc:     Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        arm@kernel.org, soc@kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        Nicolin Chen <nicolinc@nvidia.com>,
        Krishna Reddy <vdumpa@nvidia.com>, linux-tegra@vger.kernel.org,
        iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org,
        Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [GIT PULL] memory: Tegra memory controller for v5.14
Message-ID: <YMHZCaRiQNQCSsVr@orome.fritz.box>
References: <20210607084910.21024-1-krzysztof.kozlowski@canonical.com>
 <20210608120128.GB10174@willie-the-truck>
 <YL+A+MPjjaa3nSwq@orome.fritz.box>
 <20210608164851.GB10994@willie-the-truck>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="jVj7juWizf7nxW9D"
Content-Disposition: inline
In-Reply-To: <20210608164851.GB10994@willie-the-truck>
User-Agent: Mutt/2.0.6 (98f8cb83) (2021-03-06)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--jVj7juWizf7nxW9D
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 08, 2021 at 05:48:51PM +0100, Will Deacon wrote:
> On Tue, Jun 08, 2021 at 04:38:48PM +0200, Thierry Reding wrote:
> > On Tue, Jun 08, 2021 at 01:01:29PM +0100, Will Deacon wrote:
> > > On Mon, Jun 07, 2021 at 10:49:10AM +0200, Krzysztof Kozlowski wrote:
> > > > This is the pull for you to base further SMMU aptches (prevent earl=
y SMMU
> > > > faults).
> > >=20
> > > This is a tonne of code for me to pull into the SMMU tree given that =
I only
> > > want one patch!
> > >=20
> > > Thierry, if I just stick:
> > >=20
> > > https://lore.kernel.org/r/20210603164632.1000458-4-thierry.reding@gma=
il.com
> > >=20
> > > on its own branch, can you stitch together whatever you need?
> >=20
> > I'm not sure I understand what you're proposing. For reference, here's
> > the set of patches that I sent out:
> >=20
> >   1. memory: tegra: Implement SID override programming
> >   2. dt-bindings: arm-smmu: Add Tegra186 compatible string
> >   3. iommu/arm-smmu: Implement ->probe_finalize()
> >   4. iommu/arm-smmu: tegra: Detect number of instances at runtime
> >   5. iommu/arm-smmu: tegra: Implement SID override programming
> >   6. iommu/arm-smmu: Use Tegra implementation on Tegra186
> >   7. arm64: tegra: Use correct compatible string for Tegra186 SMMU
> >   8. arm64: tegra: Hook up memory controller to SMMU on Tegra186
> >   9. arm64: tegra: Enable SMMU support on Tegra194
> >=20
> > Krzysztof already picked up patch 1 and I was assuming that you'd pick
> > up 2-6 because they are to the ARM SMMU driver. However, if you're
> > primarily interested in just patch 3, which is more "core" ARM SMMU than
> > the rest, which are Tegra-specific, then I suppose what we could do is
> > for you to give an Acked-by on the rest (2, 4-6) and then Krzysztof or I
> > can pick them up and take them via ARM SoC, based on the stable branch
> > from your tree that only has patch 3.
>=20
> I think you previously said that patch 5 depends on patch 1, so I can't
> take 2-6 without also pulling in the memory controller queue.
>=20
> > Patch 6 touches arm-smmu-impl.c, though it's a two-line change that
> > touches only the Tegra-specific matching bit in arm_smmu_impl_init(), so
> > the likelihood of that conflicting with anything else is fairly small.
> >=20
> > Is that what you were proposing?
>=20
> I can queue as much or as little of 2-6 as you like, but I would like to
> avoid pulling in the memory controller queue into the arm smmu tree. But
> yes, whichever of those I take, I can put them on a separate branch so
> that you're not blocked for the later patches.
>=20
> You have a better handle on the dependencies, so please tell me what works
> for you. I just want to make sure that at least patch 3 lands in my tree,
> so we don't get late conflicts with other driver changes.

Yes, if you could pick up patch 3 and send out a link with the stable
branch, I think Krzysztof or I could pull in that branch and pick up the
remaining patches. It'd be good if you could also ack the remaining SMMU
patches so that ARM SoC knows that they've been sanctioned.

Krzysztof: would you be okay with picking up patches 2 and 4-6 on top of
your memory branch for v5.14?

Thierry

--jVj7juWizf7nxW9D
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmDB2QcACgkQ3SOs138+
s6EnLA//ZgBQdPoxTa9Yc7sswfHwAYyKCWSKQcgTH84rrCOszXWcAZORrfyMA4/d
3OuzF8mlebPISC4OJoo3k9/EfITpQWbqFZSYQN03cqVDys/Kb+3woqyUvgrqmFUl
rxrITRTsCOakoo3/OGgAtC0r3P+btzdZco6pqrsTr4PwQe1oUC+179jq6R536pVO
n+liywt2NNxpGX1lI9rCpePyB777kLZZHI0oJO2HOtwLS/Z3TWLau3cRH1JSY7uy
GpCUzS87izn2OPo65VOQDIHIDA67M6UiqesYQCOic0AY4fo4hvTIQ7DIdFMQYh0t
Q2DUAr53VrV7m7DY313Xbo+ZGeq+c+ZQKn4JZ2KIOGDtucts8WpkEfmbJ2q7sUH7
JnIBMeUs1k5v52eW8/GfZT6reyEcNzYCT/C1w2cSRwB/bCTc7j1+O4Iarc45mJgP
pXFEsSZErCFLh0TBirnzJEqJ7eUyldWgSUy2jHndovEsS/hYJIuoKt6vILDlb4tn
9KrMopwWp4gKN6fZwZZIV2dOgx07jzsVXpBjVjtnafnqad4IanU1RobRKOikiNkX
xi97rLtRq5dB5oI1CTe3yHGUAz/A6gKyYtd3oQPP1hyeXglMAkThHJUBHTBlEAYy
3GeB7oBGK6Cn/ZmG4qWFvsW82bxW9mjFzwOxW4zmSuLxPCFveG0=
=Jpm0
-----END PGP SIGNATURE-----

--jVj7juWizf7nxW9D--
