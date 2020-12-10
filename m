Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A146C4361B
	for <linux-tegra@archiver.kernel.org>; Thu, 10 Dec 2020 08:03:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 37DA623D4D
	for <linux-tegra@archiver.kernel.org>; Thu, 10 Dec 2020 08:03:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733285AbgLJIDp (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 10 Dec 2020 03:03:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726090AbgLJIDp (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 10 Dec 2020 03:03:45 -0500
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47CFEC0613D6;
        Thu, 10 Dec 2020 00:03:05 -0800 (PST)
Received: by mail-ej1-x644.google.com with SMTP id ce23so6005472ejb.8;
        Thu, 10 Dec 2020 00:03:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=eqp0TLP9fmB78aq35gkfoouvh12/fek+jUNn7x07RNA=;
        b=jXuvABbfFu4UY72m6shzEm8K96p9T5JXJJWyJvgzK2nY9VFwTuQGq70DZYvMo6OAd+
         YsifTTmFXqvOUkywIAh4zJt0hjXeJ80bfwIn5wIfLqFu38TBtJb4cDjxgxdsp3xrBzyE
         O+c1EcWRi27edoBpGuyD2VuBsQZjiWxD40PF9hCTjPITXfB5EkXTjpm2SoIeimdmnAEU
         DZ1QgEN+tLL4O75AerJo3dOyJ+1K6u81e7HgpGF5DokuhgKIX99qD7Hz2zRb+JrYqOCU
         odG5IptaSrd7TilK0AJmzVdJbLcVM4Qqyaq9oyqJG6BlxeNHNF05ufwdwaUYLE7yRN+Z
         umoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=eqp0TLP9fmB78aq35gkfoouvh12/fek+jUNn7x07RNA=;
        b=Z0bIz+GmDy1EmdM7CQ4hXjyz4OwBaQNGV/ogJarmoq0OHFXGRHcBJw35gTmVxfvLz1
         ePZq//RfHnje2+kg8enIEUaLznpqratWwuu5XQ8vb1f0FFT4JY2Hc3rKTsHwUh5r4oRK
         H7vlxxY6+wzZddprITD5+3ANsEia8dwNj9cnK6rzLIY5FSbeMFGsyuq5xSLpLzVFLIQC
         6MO9WdoEZ80lHCzOsWRvpXjTTHAp3lmsf4C//pWBOMfAQvq+oKQVKnvelwanEj4Jue01
         /UpVXBRBERPnVyDvkBNd1lKCx69ibZEFUox+BCwpJMhLQxtR751iyABKSBpnIhjNIOBk
         WMKg==
X-Gm-Message-State: AOAM531eWRtMUZAATE72xKgB7XPmCrJyAl2T2gydExMN1jvTYe2L/YAG
        ajoYy/rC3aS05DpV6m/eJi4=
X-Google-Smtp-Source: ABdhPJyJMGMuAQ+RkNWIMzk8Hn6V4DD/qJslO9XjE+ULkx8sg3gfG9J02N7++0NwOTpYX4PJ6G/N+Q==
X-Received: by 2002:a17:906:af83:: with SMTP id mj3mr5167823ejb.243.1607587384082;
        Thu, 10 Dec 2020 00:03:04 -0800 (PST)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id l14sm4117956edq.35.2020.12.10.00.03.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Dec 2020 00:03:02 -0800 (PST)
Date:   Thu, 10 Dec 2020 09:03:00 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Dmitry Osipenko <digetx@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] clk: tegra: Fix duplicated SE clock entry
Message-ID: <X9HWNLZKVRUJja9G@ulmo>
References: <20201025224212.7790-1-digetx@gmail.com>
 <160756363099.1580929.2375956922093495697@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="czOzzkDnph9irEDt"
Content-Disposition: inline
In-Reply-To: <160756363099.1580929.2375956922093495697@swboyd.mtv.corp.google.com>
User-Agent: Mutt/2.0.2 (d9268908) (2020-11-20)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--czOzzkDnph9irEDt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 09, 2020 at 05:27:10PM -0800, Stephen Boyd wrote:
> Quoting Dmitry Osipenko (2020-10-25 15:42:12)
> > The periph_clks[] array contains duplicated entry for Security Engine
> > clock which was meant to be defined for T210, but it wasn't added
> > properly. This patch corrects the T210 SE entry and fixes the following
> > error message on T114/T124: "Tegra clk 127: register failed with -17".
> >=20
> > Fixes: dc37fec48314 ("clk: tegra: periph: Add new periph clks and muxes=
 for Tegra210")
> > Tested-by Nicolas Chauvet <kwizart@gmail.com>
> > Reported-by Nicolas Chauvet <kwizart@gmail.com>
> > Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> > ---
>=20
> Looks correct. Should I pick this up Thierry?

Yes, please. Thanks for catching this, it had slipped through my filter.

Thierry

--czOzzkDnph9irEDt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl/R1jQACgkQ3SOs138+
s6EsGRAArVVvCcIg28g8uSHCsL/3LI+HZzLD19+M1TQS9YU1DDUk9M9lbs+Ehyyl
AcwMOHGIYTKG2+efOFMVq31IOidY9L7s8mWWkzUn2qwoyuRHlbVMNyvcLpJi3E1/
gOoppZ0ASfqxIKrXrh7MGfolWrm53EV42b1nFzAWj2rWkITLaKjCjhO8kU16JDyj
Dtdcf0xZhW6SQqUAnCiq0926pAEsF8+kJTVMGYepVgteeyz10+LZ1HVNyohMxuiO
PfAmjP4TI4aQ/ZxjUsFJvzbngmrCwmMIml/WGaGeBn67nHixovVaZCkynNWl6MM0
8clPQ6wFoiHmMEJ3wdvCI1zeSLpiXdbtGNHDnW9uwilbZ3XU/cj7ibhR9yaIuHT5
l/pcG1TrI+gQEUr9J9eq8uFTQRmQNjd7Nq+mzPIqyTFeYOp26XUZ2eUyq8zgnnYz
eDqAWaUjGMWrq+49/jxOc8YU25qOYKl43OpnjECMWiYrKeAG38wTKdZgLOMb2/kS
7fhjg2obFJZnulqp/7taYzvLaDHGLpvVpfp0goXq2/0MQ/NctgM/MqkhBlEL5pTe
YU7bb6js0+L1K/tGTZDIYX1spzypHudn+wys5Ymi27JTShhvL2aZfn5Capmb5Sui
ONBsnLj184nByfkXjwszd4kK97O89FeayvTuIsU653aXifh0uHM=
=nkgJ
-----END PGP SIGNATURE-----

--czOzzkDnph9irEDt--
