Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B812C4338F
	for <linux-tegra@archiver.kernel.org>; Mon, 16 Aug 2021 18:39:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 74B3C60F14
	for <linux-tegra@archiver.kernel.org>; Mon, 16 Aug 2021 18:39:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230253AbhHPSkB (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 16 Aug 2021 14:40:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:50574 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230137AbhHPSkB (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 16 Aug 2021 14:40:01 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id A6F0760F22;
        Mon, 16 Aug 2021 18:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1629139169;
        bh=zxs7PfDCzOg5/JKaFuj1ZRG3AUP94enAwR2htcd+f3M=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=J/m4g2KcCGRuaPCzT4cJm8n8B2i7bDPFRLkN5v14dCq8JZs8fMZRV4ZgCvaeD4QUH
         ItI0vGPuAeIrPEI1PWlF4YY3+4BQUufG9Hry9UbIi9zLW0Gx8KMhGi9YiZrtg1JyHW
         BIymJ6PvjRJgX14Ye868QzaV3b0jGet8tYHCqCL7sObzEbeXalELIS0VuV9ckIpGoH
         FBS0/8VufzaZHf7wF8pHKGKiQQWIgOzy5jvySlJIe72+gsMSJ8bOd7HbAKTe4Agq98
         9s8MyH6K13kgNJfPuQgYuWnA3ka4x6KFRJ+0875qxcItLnm+1UwQrWIUJySQfaqFg2
         88PMFB6s2qIFw==
Date:   Mon, 16 Aug 2021 19:39:06 +0100
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
Message-ID: <20210816183906.GC4253@sirena.org.uk>
References: <cover.1628971397.git.aakashhemadri123@gmail.com>
 <e568d621c9c05ee23732a6a6f9e3606a780b1707.1628971397.git.aakashhemadri123@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="hHWLQfXTYDoKhP50"
Content-Disposition: inline
In-Reply-To: <e568d621c9c05ee23732a6a6f9e3606a780b1707.1628971397.git.aakashhemadri123@gmail.com>
X-Cookie: Allow 6 to 8 weeks for delivery.
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--hHWLQfXTYDoKhP50
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Aug 15, 2021 at 01:42:18AM +0530, Aakash Hemadri wrote:

> -	match = of_match_device(tegra30_ahub_of_match, &pdev->dev);
> +	match = of_device_get_match_data(&pdev->dev);
>  	if (!match)

Thierry, are you sure about your review here?  As others have been
pointing out of_device_get_match_data() returns match->data while
of_match_device() returns the device.

--hHWLQfXTYDoKhP50
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmEasMoACgkQJNaLcl1U
h9C+Iwf+J9Ygbk55AEmLiBKbA3H+0cbaMUPZPYozas8BV793kLwX6y7eYrFg+CVj
6vDpzijY3mrdK6fVhJMjwsu/MzEel6qoLiB0EZF21JSUgMdrkCJ/lImAXyD8rh66
IC9pQo2mnorWs8lEG3QJmnFOY7dH6YGBRwLk/kyffQHkHGzz0D/+kFLBi3Fuy7kP
d3kBV91h3c11wiRzBe2dPC5/xyO+Gp9nFtLu6OoLCO32YssTPu32x9YUxRXWWsmf
vEB1G8GNRt66HYr9D0V9LPOjlPGIJLs6Q+F2MRyBPbyzesDGKOzG81mGjPPGfnvU
pUEDPwZlEw+VtfUzcVZIMhAmrKU29A==
=//If
-----END PGP SIGNATURE-----

--hHWLQfXTYDoKhP50--
