Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00611C433DB
	for <linux-tegra@archiver.kernel.org>; Thu, 11 Mar 2021 16:17:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A715464F93
	for <linux-tegra@archiver.kernel.org>; Thu, 11 Mar 2021 16:17:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234366AbhCKQRQ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 11 Mar 2021 11:17:16 -0500
Received: from mail.kernel.org ([198.145.29.99]:51800 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234527AbhCKQRN (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 11 Mar 2021 11:17:13 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id DCD8464F88;
        Thu, 11 Mar 2021 16:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615479432;
        bh=tC8xQLvl0ED5iaAOUU3NWeADhke0KZJuMgdD9l7TFWA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=RyuJ62MV0j1/0koV3tq8MZh+/x1RDJHUX5qSrZ3paxvAockMHvG17rC8qJac4MdSf
         sHjsYIzxL9OLh0PxPjAaWR59N2TlKSdwzPDYcFN/PIrCOxPJ1Kg4hn4kpogdt23424
         7fYazPCBxabTn60iy1PugT4Y81/xcWpa8tySmBCpMPyACfFXtg8I9dYITP4zcgVR1v
         xCS5xx73GHuHAf8z11KTd1NiFz5+tksiIeZTJ5ce74kJntcxiJJu8LL87Jd7wMuOYK
         E1XQe3JZQXwXi6u0TyBhVZzfePlBs7lF2b2B8LZhOh43QTbgnL1VbK4fi3FFU2ApBA
         DycL7AFAZDTxQ==
Date:   Thu, 11 Mar 2021 16:15:58 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Sameer Pujar <spujar@nvidia.com>
Cc:     Michael Walle <michael@walle.cc>, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, jonathanh@nvidia.com,
        kuninori.morimoto.gx@renesas.com, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org, robh@kernel.org, sharadg@nvidia.com,
        thierry.reding@gmail.com
Subject: Re: [PATCH 1/3] ASoC: simple-card-utils: Fix device module clock
Message-ID: <20210311161558.GG4962@sirena.org.uk>
References: <1612939421-19900-2-git-send-email-spujar@nvidia.com>
 <20210309144156.18887-1-michael@walle.cc>
 <e8b80188-978c-29fa-b5d4-9788a9f2282f@nvidia.com>
 <611ed3362dee3b3b7c7a80edfe763fd0@walle.cc>
 <ca540fb6-2ea7-90b0-66ad-097e99b6e585@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="eMnpOGXCMazMAbfp"
Content-Disposition: inline
In-Reply-To: <ca540fb6-2ea7-90b0-66ad-097e99b6e585@nvidia.com>
X-Cookie: I'm rated PG-34!!
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--eMnpOGXCMazMAbfp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 10, 2021 at 08:20:28PM +0530, Sameer Pujar wrote:

> If I read this correctly below is the configuration you need,
> SoC -> MCLK(fixed rate) -> PLL(wm8904) -> PLL output (256 * fs) -> sysclk

For this device for integration with something like simple-audio-card
since there's limited flexibility within the device the simplest thing
would be to not make the internal clocking of the device visible and
just have it figure out how to use the input clock, using the MCLK
directly if possible otherwise using the FLL to generate a suitable
clock.  The trick is figuring out if it's best to vary the input clock
or to use the FLL to adapt a fixed input clock, and of course adapting
any existing users if things get changed.

--eMnpOGXCMazMAbfp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmBKQj4ACgkQJNaLcl1U
h9Bm7Qf/VJ91STTM9RrXZ6oXyjy90lybK+uguct6tIBOH/cCBlf2qGxlWOIaKw2w
ybRwqTEJm5fKKRDMqvUBk7y7O3VF9onjg5x8N/+FcbPgrK2hEuzBJQlzEn47GEpK
wangKZc80y5Sz7jPi5yK2dRyMfClSIyv78y5rFHcetDHH2+xLFz7com+SEczQeyx
gBNaIJ7xyQb6/KUQQLPO21wTy4rzFpurRatmPJTVlUM1qREmptX8SB5lRFXIb8yJ
gYp353sgoWIwm71bhZl2xtBuNyZJg7w4TnvPIaEBPi/cjaQvSUohaDJXui1tFITq
JF2ZCpVivFlMaIgQNfKfH+lSv5Feag==
=OLq0
-----END PGP SIGNATURE-----

--eMnpOGXCMazMAbfp--
