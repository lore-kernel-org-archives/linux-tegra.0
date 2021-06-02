Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66AB6C47083
	for <linux-tegra@archiver.kernel.org>; Wed,  2 Jun 2021 08:28:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 43EE3613C1
	for <linux-tegra@archiver.kernel.org>; Wed,  2 Jun 2021 08:28:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232568AbhFBI3w (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 2 Jun 2021 04:29:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232553AbhFBI3u (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 2 Jun 2021 04:29:50 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70040C061574
        for <linux-tegra@vger.kernel.org>; Wed,  2 Jun 2021 01:28:07 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id i13so1882468edb.9
        for <linux-tegra@vger.kernel.org>; Wed, 02 Jun 2021 01:28:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=45eyaUuq070Qm8KUrdnCL3IClcvuGZiTBr0GJUm0Ru4=;
        b=lR/KQHc78tJiS/7k5TvoVEs7lmb/5ouri46EwN5K5uNT0OdKLHnTV+6syyntzQcOxL
         Dvbpeg65Jszr9JSk9+wHpEPDsYAErit9FOIt2z3dS2fTFjP63POQCs94iYRcYlwEt33/
         yfQs3dMCTHt26QOpelz+k4qx4HUmoaQFRq6dR7IVRXJCXY81iIKjUj4x9qo6IyuOvDAD
         6DAwgGW40PqBWMO41XvTw3jPd6Bp55DBRbjX1bXDeqkzHsLPeHchGRqDQNGGkvN7jdYf
         rGq/m2WLKoDefW4UCHKKWLCEILAxPO8h7ZEhbqshR819Zv+3YZx9gwZdYCjN2XwcpfX7
         CQFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=45eyaUuq070Qm8KUrdnCL3IClcvuGZiTBr0GJUm0Ru4=;
        b=HxacrVLKiekfcMgrZ7Hiw/Q07cl6VAO3SQ49FwNXMsiCa0lvfslN9fcnbWDe+NYGge
         1qe/tE7Pb4wqy/delbsBBsgRyCKk/1fi/KOs2mS1KwGNldA2M7nZiak4ADUFWhaGPnTa
         ECJZm6jOF3pSmlSMIpo0egk4SG/4q0BKsoNEL/Fha5L3VN+Bh1nj+70LLKAtcSYarqaa
         XEmHzxinC1N1bicQNMfKW4StXrgCWmSPH7mGuy2PDA2Zj3qLkNfIuIyBcp5U9D4R/TSA
         h+wPaHWt12DKtGwRUGUD+YFOrsMIFDQPqqhxuvHcZqMNUFDJ8/jRIZs+ixEalMe/lNZ3
         yjpw==
X-Gm-Message-State: AOAM5323nSARkT0xyqxkDhoh0g1oNPtLrVMI+A7UAQ23xDsPYxDMlTPA
        4yNQ6dpB+QLOnyv81edVEMs=
X-Google-Smtp-Source: ABdhPJwdtyejFQy3Y9L4Q5+0ntRtP74rCV7jZWl4a6dtSme0gUTjRr4Dd0gRvEin1wolcYe87mLazQ==
X-Received: by 2002:a50:fb8f:: with SMTP id e15mr9680727edq.46.1622622486082;
        Wed, 02 Jun 2021 01:28:06 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id l8sm803562eds.79.2021.06.02.01.28.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jun 2021 01:28:04 -0700 (PDT)
Date:   Wed, 2 Jun 2021 10:29:40 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 12/12] memory: tegra: Split Tegra194 data into
 separate file
Message-ID: <YLdBdHswB/4tN3J0@orome.fritz.box>
References: <20210601175942.1920588-1-thierry.reding@gmail.com>
 <20210601175942.1920588-13-thierry.reding@gmail.com>
 <59395d67-a4e1-5f47-2ced-e7b28ba66009@canonical.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="PNkX28FjNHr9g/KU"
Content-Disposition: inline
In-Reply-To: <59395d67-a4e1-5f47-2ced-e7b28ba66009@canonical.com>
User-Agent: Mutt/2.0.6 (98f8cb83) (2021-03-06)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--PNkX28FjNHr9g/KU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 02, 2021 at 09:53:03AM +0200, Krzysztof Kozlowski wrote:
> On 01/06/2021 19:59, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > Keep the directory structure consistent by splitting the Tegra194 data
> > into a separate file.
> >=20
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> >  drivers/memory/tegra/Makefile   |    2 +-
> >  drivers/memory/tegra/mc.h       |    5 +
> >  drivers/memory/tegra/tegra186.c | 1349 +-----------------------------
> >  drivers/memory/tegra/tegra194.c | 1353 +++++++++++++++++++++++++++++++
> >  4 files changed, 1360 insertions(+), 1349 deletions(-)
> >  create mode 100644 drivers/memory/tegra/tegra194.c
> >=20
> > diff --git a/drivers/memory/tegra/Makefile b/drivers/memory/tegra/Makef=
ile
> > index 1af0fefacdda..c992e87782d2 100644
> > --- a/drivers/memory/tegra/Makefile
> > +++ b/drivers/memory/tegra/Makefile
> > @@ -8,7 +8,7 @@ tegra-mc-$(CONFIG_ARCH_TEGRA_124_SOC) +=3D tegra124.o
> >  tegra-mc-$(CONFIG_ARCH_TEGRA_132_SOC) +=3D tegra124.o
> >  tegra-mc-$(CONFIG_ARCH_TEGRA_210_SOC) +=3D tegra210.o
> >  tegra-mc-$(CONFIG_ARCH_TEGRA_186_SOC) +=3D tegra186.o
> > -tegra-mc-$(CONFIG_ARCH_TEGRA_194_SOC) +=3D tegra186.o
> > +tegra-mc-$(CONFIG_ARCH_TEGRA_194_SOC) +=3D tegra186.o tegra194.o
> > =20
> >  obj-$(CONFIG_TEGRA_MC) +=3D tegra-mc.o
>=20
> (...)
>=20
> > diff --git a/drivers/memory/tegra/tegra194.c b/drivers/memory/tegra/teg=
ra194.c
> > new file mode 100644
> > index 000000000000..3ae6fbb76997
> > --- /dev/null
> > +++ b/drivers/memory/tegra/tegra194.c
> > @@ -0,0 +1,1353 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Copyright (C) 2017-2021 NVIDIA CORPORATION.  All rights reserved.
> > + */
> > +
> > +#include <soc/tegra/mc.h>
> > +
> > +#include <dt-bindings/memory/tegra194-mc.h>
> > +
> > +#include "mc.h"
> > +
> > +#if defined(CONFIG_ARCH_TEGRA_194_SOC)
>=20
> Do you actually need this #ifdef? This CONFIG_ARCH... symbol is already
> used in Makefile, so the unit should not be built on anything else.

This is indeed redundant now. Good catch!

Thierry

--PNkX28FjNHr9g/KU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmC3QXEACgkQ3SOs138+
s6HgzBAAuYhyY87qDuE7fscoXXthiaS1r62rQhdRaHMWbRhJ5CkxMyFIAbCWkedL
8sAQBP5CxVJEWemLIBhPwUBHZ6RJK06LULVMJZW3xlQO9baxcysU1h4bgwXWHgVc
T5HQqbl3xS0E2HgC6z1Y/6TQS4nliNiWCCh+gi/urRgDeEPzcQw1OuB7a2a1BUCw
831gJw7VeBjIEaI4tNOyLUGBVBBPoAAwLd99aIAgAirB02TPH9aCJjU0phaCOmED
ON9GlEESXeWfVaze7SJcm5kDhb/peULdHyG1VuBgcet1ygM4trPREqM6Woe9w3pN
YNmDyOZGmLDIGDjBicb8PziLp1bgYYGoUoGonKCyoBHFrEPCIvTU9jKaNUakRqS5
lzznqfkjNomVnR8zDp9hKJ+dqT2b5Pwb8x/ZVmLrlbs3wTKxT6uczALHQDWboYtf
DQoWwGNpcKy9r6Bn1i6db0Qjigt0L99p0USEu3zJlBRty5hqaDVgqRKqukkfpx4j
ihUrE0xrLopnl7RZ/peoGly9biSguldzSpWXSqeiuTNnQFyGRpf/KPPbd4xLJCKE
VtsMA4v3NO6KG1aEkTtheRgGNnZi6XSkZRWUP7rwK9vLPhU81/rg1hJSBMT+HJ5T
VfjFxzs+j/1VCngd35o1i+NMBuR+58pQke77rftSk5WzMF9iZbs=
=wPYv
-----END PGP SIGNATURE-----

--PNkX28FjNHr9g/KU--
