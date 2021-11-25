Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E404C433EF
	for <linux-tegra@archiver.kernel.org>; Thu, 25 Nov 2021 12:04:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238591AbhKYMH1 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 25 Nov 2021 07:07:27 -0500
Received: from mail.kernel.org ([198.145.29.99]:60782 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238867AbhKYMF1 (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 25 Nov 2021 07:05:27 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9E59260F50;
        Thu, 25 Nov 2021 12:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637841736;
        bh=BWGMZCrHH6xxi12p5oO7mIRasp8rFf7thNKaWsGdakg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WinQ1hlBhbKrnSPiGWFGvYPT0LPQ2KOzqOipkUVzFhHPQeyzv/vkK68EtinskPqYD
         D3IOPvpUWgeTTnc2L5pVOxlDnd2BhvPi3jK62FDoZN2wxtFEgi2O8+bAJRt80zCtSX
         O2mdYW0u/S4sY8MpxlSHNKaliK+VixWhizpl2jt5yMoGGp1IuOo1r5Ep5u+qZ4Agzt
         IA0LO+jRra170vOR3QP9m7Z3dF8ENPEIvmt2WXiRh1/rLrBMtq4DG5Qcgo2YGiyQpA
         va2PFUpABj6D0ftdKmvAi7HvwwVsZ+tObZg15Ez2ue0V9oNg/sSS71x+q0s9zGYiSZ
         xOVXNjK79SIHQ==
Date:   Thu, 25 Nov 2021 12:02:10 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Takashi Iwai <tiwai@suse.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Agneli <poczt@protonmail.ch>, Rob Herring <robh+dt@kernel.org>,
        linux-tegra@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v1 07/20] ASoC: tegra20: spdif: Set FIFO trigger level
Message-ID: <YZ97Qo500CrSmhXu@sirena.org.uk>
References: <20211124220057.15763-1-digetx@gmail.com>
 <20211124220057.15763-8-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="9M5ShoIPHrxjoCgm"
Content-Disposition: inline
In-Reply-To: <20211124220057.15763-8-digetx@gmail.com>
X-Cookie: This bag is recyclable.
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--9M5ShoIPHrxjoCgm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 25, 2021 at 01:00:44AM +0300, Dmitry Osipenko wrote:
> Program FIFO trigger level properly to fix x4 accelerated playback.

Fixes like this should really go before any new stuff so they can be
sent as fixes and backported.

--9M5ShoIPHrxjoCgm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmGfe0EACgkQJNaLcl1U
h9CjcAgAg9IvrDEWAOwL3WYl7S3HkK2dMw76b1z6wB1iQW4pAmj8r+/wVBjfQ0Qf
xQl5b/a4Bho/sLhKkSo3zeR6gM0V9cxM5xqGeMi4faGNYPNVQyhqzMkAs8SCSj81
GWJ1S1xThLnY/VHcScXLXxh1bCz5KxCMg9AI1SxDnWvXbMd+MnGtJMa3cEE68Gls
jWUBtNNNBiC0GWl3kdlardl/0sfvH9w1kDYDNmd1ZBx3yNOO8rWKQPnS94NJaRSP
xcYyoDZZQueifuXSiKWDQLbqLQgiXXOGS1EEr9QGefjpZq95WutVv+gMQGHM1lQ8
9CR+Aau1jB2PG1PDq5c0jL7/58QcQw==
=kuKW
-----END PGP SIGNATURE-----

--9M5ShoIPHrxjoCgm--
