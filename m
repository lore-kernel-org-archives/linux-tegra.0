Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 801A7C4338F
	for <linux-tegra@archiver.kernel.org>; Mon, 16 Aug 2021 19:50:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6161060F55
	for <linux-tegra@archiver.kernel.org>; Mon, 16 Aug 2021 19:50:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231143AbhHPTuc (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 16 Aug 2021 15:50:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:43970 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231328AbhHPTu2 (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 16 Aug 2021 15:50:28 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6AF9260F4B;
        Mon, 16 Aug 2021 19:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1629143396;
        bh=CXis/bLdJRagXths2UirWKpEOJvLoH555N5N/vRF1Lc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=obB85TFbyXkO09lmk8jBjXqGvOX4FMtvwUbKgPOSdWCyok9wNXm6TbPU4D7f+wVUn
         RkcKY7s6dNR4oYJteih7wKu9lwQuCn3TOJ5i5lvSw+jJWBBvRoWTwWh1PXwh0SZG9Z
         stuLfA3oL52++Urj0xi4NRcoq4A3Rg4OgLIzND4NaTfIdycSBVGlccuRBPKdg8U8k4
         9k517Y5UaV5Xnp7kt4zPvXpDut42GaRomTfeDgMj+ReLeekAPK6je2ZLyGCgEyoU10
         tK7KYj+wixt4JteSl7UygrhN3gdY5ug2ZQ+pCArPPpa1Z/lprgq1qw19lLW3NyT2rV
         AsUZKqGd7E7WA==
Date:   Mon, 16 Aug 2021 20:49:34 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Aakash Hemadri <aakashhemadri123@gmail.com>
Cc:     Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
        Jawoslav Kysela <perex@perex.cz>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shuah Khan <skhan@linuxfoundation.org>,
        Bjorn Helgaas <bjorn@helgaas.com>
Subject: Re: [PATCH 1/2] ASoC: tegra30: ahub: Use of_device_get_match_data
Message-ID: <20210816194934.GD4253@sirena.org.uk>
References: <cover.1628971397.git.aakashhemadri123@gmail.com>
 <e568d621c9c05ee23732a6a6f9e3606a780b1707.1628971397.git.aakashhemadri123@gmail.com>
 <20210816183906.GC4253@sirena.org.uk>
 <20210816194621.mrudqykxvkbt3a2w@xps.yggdrasil>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ZmUaFz6apKcXQszQ"
Content-Disposition: inline
In-Reply-To: <20210816194621.mrudqykxvkbt3a2w@xps.yggdrasil>
X-Cookie: Allow 6 to 8 weeks for delivery.
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--ZmUaFz6apKcXQszQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 17, 2021 at 01:16:21AM +0530, Aakash Hemadri wrote:
> On 21/08/16 07:39PM, Mark Brown wrote:

> > Thierry, are you sure about your review here?  As others have been
> > pointing out of_device_get_match_data() returns match->data while
> > of_match_device() returns the device.

> Sorry for the confusion, and the glaring mistake.
> Will fix and send v2.

Since I applied the patches please send an incremental fix on top of
what's been applied rather than a v2.

--ZmUaFz6apKcXQszQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmEawU4ACgkQJNaLcl1U
h9CXuwf+OBGMX8GLE249lvMUXgZkRMEjs9nIi42wzOcnwaLRMAMaBkIvAUHulfYL
TM277DlFjKtwdAh/oGeC9OMPPsq3dwxeGCe1CvJxwOxt2CtEVs3XHuljeylxR+0A
OxSnMqseEhvXbQI08QAqn9nQvzYOwaMgCxJEKSVl8Euy61Mzv0l4mi27Ynk4Xld4
4rhZ0E+MWcQG/6oAUcmNiEJ9SDcQloVHD6VbmBZ3zsMfavSsnv8QO1I6TY5HZq56
HOoJDODMhYiArCzj3Szpv+8XQUh7OrfcZjNds6SO9B9EEcxNtTllCpgpHXRs3GbU
WezDQX8TTXAPo6/Lg7dkRmHYLNlhHQ==
=BD+A
-----END PGP SIGNATURE-----

--ZmUaFz6apKcXQszQ--
