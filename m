Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D7E1C47082
	for <linux-tegra@archiver.kernel.org>; Tue,  8 Jun 2021 14:37:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 51AF361042
	for <linux-tegra@archiver.kernel.org>; Tue,  8 Jun 2021 14:37:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233506AbhFHOjN (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 8 Jun 2021 10:39:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233288AbhFHOjC (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 8 Jun 2021 10:39:02 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D524C061574;
        Tue,  8 Jun 2021 07:37:09 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id e11so11650292wrg.3;
        Tue, 08 Jun 2021 07:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=7Ue9KAC7qJaW16JeKkEn8iGR0sqX5WDTSVD1v13dL3I=;
        b=Ukj+KDqPTO+UJF/BEvU3KpfMksSB2pQeL/ie4KKl0GFxijjAY4WcmnEWRNTrNrLOaR
         2DHrxG3hpElAs9tZkRP0/ODEDEiC6gBkFv1fpWSr0VMyY7wW+JPwAEbQgknDjgG5FmEo
         C2wvMPYo0K8Hdm4wtWOlJdLDWExLKL+oPLeJuNCXcgWheReYp+hJQ3Gk/cpnchtoXzMC
         MSJWVzuoQc288K3blzLLEYrZvkWVx/tozHUzTKd1zNF1LEZVXU3AhdpyoECle1vQ9J4I
         DDzvd9CzYYUTtfAgl0L3+b5AR0owWjNGEWOzjTWwVPHec8hl8BwT/qF2uxq6svFYXSI9
         Z3Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=7Ue9KAC7qJaW16JeKkEn8iGR0sqX5WDTSVD1v13dL3I=;
        b=SFjFNZFiVrpqwenjvAKGX7UYwvnLExM7KirqKYJx0Ii45b0uuKrSiWAI4gfqOS9SQN
         6nF5+iKy16kpqdKv3BJ8Uryd1A0de1YRFLF8BwC2xdWmfXyTONdR91ycHBi8WHde/77b
         ZMvX8Okvy5PVlQ+10w/UkTYMTkJOOelFn0Ro34xwhBq5nl+0lJ5SS1vufB/f5eaGGTDB
         kQV6YR20/a2Ka3ybeNJfYHcRaeNZww98VXe76Bs/Mp3LXTbY4wPL2NntasUlXcoUSCjw
         TXSahPbIpI+LHUxo8RsRToprP+qyiwfJbdfxDwJOhYVFHLUt1EAG1AuqvQ1HyEwcQZer
         FdDQ==
X-Gm-Message-State: AOAM532jL7FGiFO9GWFjZwL7d3E+x7SAHdfZnylsWtKgHgYw9ooADppd
        Ev1zMNiX97PpB8fs2LRogKE=
X-Google-Smtp-Source: ABdhPJyNHULCu3Cz5QZT9AskYvCL9LY9HsQM39c8QCo5M9iEBotkmmSMw3983N23quI52NayDR2YUA==
X-Received: by 2002:a5d:5987:: with SMTP id n7mr22858341wri.293.1623163027746;
        Tue, 08 Jun 2021 07:37:07 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id p5sm21015798wrd.25.2021.06.08.07.37.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jun 2021 07:37:06 -0700 (PDT)
Date:   Tue, 8 Jun 2021 16:38:48 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Will Deacon <will@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
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
Message-ID: <YL+A+MPjjaa3nSwq@orome.fritz.box>
References: <20210607084910.21024-1-krzysztof.kozlowski@canonical.com>
 <20210608120128.GB10174@willie-the-truck>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="f7Os7LJ667BkQ0FG"
Content-Disposition: inline
In-Reply-To: <20210608120128.GB10174@willie-the-truck>
User-Agent: Mutt/2.0.6 (98f8cb83) (2021-03-06)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--f7Os7LJ667BkQ0FG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 08, 2021 at 01:01:29PM +0100, Will Deacon wrote:
> Hi Krzysztof, Thierry,
>=20
> On Mon, Jun 07, 2021 at 10:49:10AM +0200, Krzysztof Kozlowski wrote:
> > Hi Thierry and Will,
> >=20
> > This is the pull for you to base further SMMU aptches (prevent early SM=
MU
> > faults).
>=20
> This is a tonne of code for me to pull into the SMMU tree given that I on=
ly
> want one patch!
>=20
> Thierry, if I just stick:
>=20
> https://lore.kernel.org/r/20210603164632.1000458-4-thierry.reding@gmail.c=
om
>=20
> on its own branch, can you stitch together whatever you need?

I'm not sure I understand what you're proposing. For reference, here's
the set of patches that I sent out:

  1. memory: tegra: Implement SID override programming
  2. dt-bindings: arm-smmu: Add Tegra186 compatible string
  3. iommu/arm-smmu: Implement ->probe_finalize()
  4. iommu/arm-smmu: tegra: Detect number of instances at runtime
  5. iommu/arm-smmu: tegra: Implement SID override programming
  6. iommu/arm-smmu: Use Tegra implementation on Tegra186
  7. arm64: tegra: Use correct compatible string for Tegra186 SMMU
  8. arm64: tegra: Hook up memory controller to SMMU on Tegra186
  9. arm64: tegra: Enable SMMU support on Tegra194

Krzysztof already picked up patch 1 and I was assuming that you'd pick
up 2-6 because they are to the ARM SMMU driver. However, if you're
primarily interested in just patch 3, which is more "core" ARM SMMU than
the rest, which are Tegra-specific, then I suppose what we could do is
for you to give an Acked-by on the rest (2, 4-6) and then Krzysztof or I
can pick them up and take them via ARM SoC, based on the stable branch
=66rom your tree that only has patch 3.

Patch 6 touches arm-smmu-impl.c, though it's a two-line change that
touches only the Tegra-specific matching bit in arm_smmu_impl_init(), so
the likelihood of that conflicting with anything else is fairly small.

Is that what you were proposing?

Thierry

--f7Os7LJ667BkQ0FG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmC/gPUACgkQ3SOs138+
s6Gn5Q//XR1WBSTbtSwOrKQWuPDV7tOFjf6dfJEWfhiXlkB+CMwEWcejemQGS1He
S9BFx8JjoV2ILf/+qWqgdtP8M8+mMLoIfhPqrfoV0bHI1leo15FN3+NbbveW6lHo
7T7ZN6GC7AYC5OyQcQ4tF3GecV4U/d8sNUk/LPgLsR8ZLZTFm3ffemOkSC+pYPn9
PtsN2+mpA+Nz8vIhKdA7pnFWb8ctXMndexyeY+Us669c1uKPvAqsK2Y87hl2EU81
HYYVh/5VDp7VGgSMZG2mMiMTFnAKD2pKGTa+W2SqM958xjy7H0I8Fo/nifKOxc89
mWdC56GwCPMjtJgXFtleInwK1gv0Vu6YuhH63XTcT5pjClgDaiYsiYdDU9kkzmeL
qq6QdC0BrzEzeOByhzL5loeRoRja1xQxjBDXcE2zHpSqaXU+pQfAKELDfu1uYCKV
3AUTN6HrUk+btr/7sSPHstUZqsTX6/VuMggMhnJQy25rFejJb0MWoe+C8U1MCtFh
Ab6Nrp6mbJvf2YgMKLrwn1WbmVXd4pUxI7pMwoPRnfjdWJc1C95d8/wIHCsgI+KH
aWasonEd33phX1sPzS0CucADcNfY4PaIkpbW+aM0w3qHdTmS05avnaU/5w2aRpZe
3C5wVdVJffpcBjokYeVnVDm33uORvTdnFZeE7WvcVEUynZl84A4=
=dmMX
-----END PGP SIGNATURE-----

--f7Os7LJ667BkQ0FG--
