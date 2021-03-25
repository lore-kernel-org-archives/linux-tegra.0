Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96C71C433C1
	for <linux-tegra@archiver.kernel.org>; Thu, 25 Mar 2021 15:53:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7247A61A1F
	for <linux-tegra@archiver.kernel.org>; Thu, 25 Mar 2021 15:53:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229576AbhCYPwf (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 25 Mar 2021 11:52:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229728AbhCYPwD (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 25 Mar 2021 11:52:03 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4877AC06174A
        for <linux-tegra@vger.kernel.org>; Thu, 25 Mar 2021 08:52:03 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id f22-20020a7bc8d60000b029010c024a1407so3384103wml.2
        for <linux-tegra@vger.kernel.org>; Thu, 25 Mar 2021 08:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=HtoKdQXjuNRr5RVF7BAAsqXcllsDQnD0BM3AUVSmNYI=;
        b=OjMXjNBk7/2AVcS/w5jmMrtwkuY26EkeNO1UxFvzkucjJZprdOilTedbyOOjrDpKti
         Hn5U866NKLvKZrJDqRzuucfj33lsBc6VrgWlbujLL4Bm0++h4HEA+bvXOgqhMy7O4D9V
         W0HpwXUu6e0mQWVccrOkxFkNwu47QfuIplt05o7fK+QG6+fBoMAmP7uAOJTlhqtFyJOE
         G4+E5cucvaftrId5FqDq7e2G3Wu+eWPOVBoI4ZvwO22LMuezYRifJzYRY1spaoL7ia73
         ImFuwgSVeW8wAEwbMMAxlZTpfykGColacXKFaHdCHwvR+FTEDPI4OJ5OfDW6DdU8kZmm
         64Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=HtoKdQXjuNRr5RVF7BAAsqXcllsDQnD0BM3AUVSmNYI=;
        b=gpxUNKHQuYh16uZPQJCW2JU0+QZDWics2hLOKe8Yk8UHbfZWgF6Cd15iapqsqHSoeN
         yFeVTni/bmEHJtgglx5S8hea4IcG0I+oXBWcdh8uqJaPOkbgzrcQZBnEcQK75zEjpNcR
         RFubTtnvakbBpz5yFbw0aUxAJ3NOvtD3KjVYv+BNcBTS0PmeqnaxjKfGEGdt2vsm9k2M
         S5O7TQE5fYGARUzrLQV9bhG+I6xmSH5XanezrcJpvpkPfoE1Xk9p8vT3b2SpxBxkSB6F
         wiyiEAHmHh4gGjfrIIGSyvG4EgHhN6KsmY57+SRmwKzneLLV5y1SAsF8utJ1p1y7yUhj
         r1HA==
X-Gm-Message-State: AOAM5323hwLIjPIjJsuLF+def/HxorGoLeTRx0KQP5pRNmkGfBVrik7K
        F0uADaXr6bYoHIMiHxjsoSdpc8b5Gwc=
X-Google-Smtp-Source: ABdhPJxLVYcJ9/0x+rt83xfSIG1ko3R60i1XKxD3ztgT9Tn2IYeL/mo64eQoF4Q5wVEef4WoT+smaQ==
X-Received: by 2002:a05:600c:19cf:: with SMTP id u15mr8434268wmq.7.1616687521899;
        Thu, 25 Mar 2021 08:52:01 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id l15sm8058477wru.38.2021.03.25.08.51.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Mar 2021 08:52:00 -0700 (PDT)
Date:   Thu, 25 Mar 2021 16:52:22 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        iommu@lists.linux-foundation.org,
        Jon Hunter <jonathanh@nvidia.com>,
        Nicolin Chen <nicolinc@nvidia.com>,
        linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/9] memory: tegra: Move internal data structures into
 separate header
Message-ID: <YFyxtq6cwIJNr/Y5@orome.fritz.box>
References: <20210325130332.778208-1-thierry.reding@gmail.com>
 <20210325130332.778208-2-thierry.reding@gmail.com>
 <ca70b07a-608a-51b3-3c30-ff04bdf8bcc0@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="3koIXHrG9oTo3ihE"
Content-Disposition: inline
In-Reply-To: <ca70b07a-608a-51b3-3c30-ff04bdf8bcc0@gmail.com>
User-Agent: Mutt/2.0.6 (98f8cb83) (2021-03-06)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--3koIXHrG9oTo3ihE
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 25, 2021 at 06:12:51PM +0300, Dmitry Osipenko wrote:
> 25.03.2021 16:03, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > From Tegra20 through Tegra210, either the GART or SMMU drivers need
> > access to the internals of the memory controller driver because they are
> > tightly coupled (in fact, the GART and SMMU are part of the memory
> > controller). On later chips, a separate hardware block implements the
> > SMMU functionality, so this is no longer needed. However, we still want
> > to reuse some of the existing infrastructure on later chips, so split
> > the memory controller internals into a separate header file to avoid
> > conflicts with the implementation on newer chips.
> >=20
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> >  drivers/iommu/tegra-gart.c      |  2 +-
> >  drivers/iommu/tegra-smmu.c      |  2 +-
> >  drivers/memory/tegra/mc.h       |  2 +-
> >  drivers/memory/tegra/tegra186.c | 12 ++++---
> >  include/soc/tegra/mc-internal.h | 62 +++++++++++++++++++++++++++++++++
> >  include/soc/tegra/mc.h          | 50 --------------------------
> >  6 files changed, 72 insertions(+), 58 deletions(-)
> >  create mode 100644 include/soc/tegra/mc-internal.h
>=20
> What about to make T186 to re-use the existing tegra_mc struct? Seems
> there is nothing special in that struct which doesn't fit for the newer
> SoCs. Please notice that both SMMU and GART are already optional and all
> the SoC differences are specified within the tegra_mc_soc. It looks to
> me that this could be a much nicer and cleaner variant.

The problem is that much of the interesting bits in tegra_mc_soc are
basically incompatible between the two. For instance the tegra_mc_client
and tegra186_mc_client structures, while they have the same purpose,
have completely different content. I didn't see a way to unify that
without overly complicating things by making half of the fields
basically optional on one or the other SoC generation.

Maybe one option would be to split tegra_mc into a tegra_mc_common and
then derive tegra_mc and tegra186_mc from that. That way we could share
the common bits while still letting the chip-specific differences be
handled separately.

Thierry

--3koIXHrG9oTo3ihE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmBcsbMACgkQ3SOs138+
s6HQIg//We9S3OSADP9jVLY5xm506ojbPSA2QxJNei0ivAFx1Esq65AjrCjQHenz
l6cf9L64Ffe+qZuCdGY0JUx2zWFdL2AyygpYn5QNKQB6whHvQ5utJCf/EyOQ5x2U
JRBQ8kJsFLTNI/svznbjkHuqrT6cqpf0A2yElVtKcrZB/tqaJ8HPoqfbJnYK/tLV
A/+e1oRPT0p24ifaui1V4I47Mxp5BYi8YkygqN00Ag8gpiUSfGIV2n/kuXTIvS5l
N4Vl4Y6aCz2IQnUAy7D1x1WzjQI3fRN1MeosWZp0og0QK6AalUl1FHy07Qs0O9g6
DJvTz01U4YTgnAWk6I5KlK97vEajg6ZV8o/P1CTMgkTs22yMge4RfSjkgZU4xzeT
d9mGJxZrNvNyVeb/ppFXNxVRcV8BG6/HuTOiVMxlyOUG62sXjiuh6wvCBJ57uNwA
voi5uqnf/rUy9E9L9Kv9IVzEscymBK3+xkkbu4oAoWLX7RkxGx5pk2FB5LFVJkIh
TmmQFBut+lKRE/CjohwY6kUKFhJHv0wGUfxRcDkdEe8aNt1XmBDEySozoq2z4/4m
JuhjLEOh2y+34fPhXaoClB8t0U0U6ULn0j9M9sQTG6Yk2G4/ui9KHFbZBTrx2hnz
7DRonhuWR/amM3jN9XS6HVBB//ebz2yP5WvQCrV1a5Zssq+dA5k=
=PluH
-----END PGP SIGNATURE-----

--3koIXHrG9oTo3ihE--
