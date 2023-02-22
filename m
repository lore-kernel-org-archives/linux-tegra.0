Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B117C6379F
	for <linux-tegra@archiver.kernel.org>; Wed, 22 Feb 2023 12:21:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231770AbjBVMV5 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 22 Feb 2023 07:21:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231845AbjBVMV4 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 22 Feb 2023 07:21:56 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C492D3A87F;
        Wed, 22 Feb 2023 04:21:29 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C00166137C;
        Wed, 22 Feb 2023 12:20:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19015C433EF;
        Wed, 22 Feb 2023 12:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1677068403;
        bh=2+2TJkgRXCmNd9+5BaM+df/ooQPJG0ZkV7NMD1G8dmY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=q9cCrINsvRaurAABclGE1tp4NHVQiZKQmnFVGFXzs7GRUOv4LR2rs3J21i3NnFOXj
         HDolACx62fgYzSX+zwTvOgzKKTdtVdC8T3zVqy/vNvu3fUQrp2dL8hEHY8csajFLUD
         SSmlAsORmsbLTqwQhSRLEo2XHwP/EzjK2UdbKVVbqGXCDKsee2j6yOqHRBn3hYsOJJ
         Cl6xTNCVMKwA7tZzoHHB6RDvTl0bjDtXJ2SZ39uBN2608NDicfNJ5rXpr0kFt3/4Bi
         eud9XIpiy/p3K/PUua7FRqgIgEfGTV90bLaEnAepkgFnmD5xOdIIUd+32leCBYWHjc
         kVmXw7zlsCyKg==
Date:   Wed, 22 Feb 2023 12:19:56 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Svyatoslav Ryhel <clamor95@gmail.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Maxim Schwalm <maxim.schwalm@gmail.com>,
        Dmitry Osipenko <digetx@gmail.com>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
        linux-tegra@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v1 09/10] staging: dsp: add support for Fortemedia FM34NE
 DSP
Message-ID: <Y/YIbHkKFcn+q7WN@sirena.org.uk>
References: <20230221183211.21964-1-clamor95@gmail.com>
 <20230221183211.21964-10-clamor95@gmail.com>
 <Y/UbMH5tXDgsvSbD@kroah.com>
 <CAPVz0n2-giCF9Z9fMimTFQnGk73HAdfU4SitGn58iZapLjeuTQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="1XiSMiZ0uGxQUzWO"
Content-Disposition: inline
In-Reply-To: <CAPVz0n2-giCF9Z9fMimTFQnGk73HAdfU4SitGn58iZapLjeuTQ@mail.gmail.com>
X-Cookie: My LESLIE GORE record is BROKEN ...
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--1XiSMiZ0uGxQUzWO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 22, 2023 at 10:19:47AM +0200, Svyatoslav Ryhel wrote:

> Because this driver sets up fm34 and switches it to bypass mode allowing
> sound to work on the device. There is no dsp framework in kernel which could
> be called to operate dsp from the actual sound codec. (If there is, I
> would be glad

> if you show me). Fm34 must be active only on DMIC use, all other cases require
> it to be in bypass.

Sure there is, like I said in my other reply it looks like an aux
device.

--1XiSMiZ0uGxQUzWO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmP2CGwACgkQJNaLcl1U
h9AXbgf+KDsG9jPazXe6+tb8ukkM1X7V3ZrGq0fbURStkTR6kLCBEGGhTvyq0YCT
TtplQaXCon/i1wXlJuarC0gkQPxthZ2BkchS1qYUpVKGAWUCvB3mkbGLBL8F21gO
VotkLaRgdg1JwIdPMMhCg+Sjm3r43pjQykfH37T5yNR93s2rkUZxstGE8rTGUcxc
GSLHMLNq5btjF5GJMo4DY6oQG96hOwRurB0UyV3N6ju1RPYYyzxZGdIt0ucWtoXA
AKkXkz1B3VSaGa0sdrl32PPEKbcn1eWlkmeaOpYIcbzxMh3re6NyAiQDFDjYfqxu
lp/aY0N3/DiFvIXWhVN5RCWt1zfESQ==
=a0mP
-----END PGP SIGNATURE-----

--1XiSMiZ0uGxQUzWO--
