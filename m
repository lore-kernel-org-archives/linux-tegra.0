Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8910AC433DB
	for <linux-tegra@archiver.kernel.org>; Mon, 15 Mar 2021 18:05:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5625264F37
	for <linux-tegra@archiver.kernel.org>; Mon, 15 Mar 2021 18:05:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229880AbhCOSFI (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 15 Mar 2021 14:05:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:48186 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232829AbhCOSFB (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 15 Mar 2021 14:05:01 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id C4BEA64F2A;
        Mon, 15 Mar 2021 18:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615831501;
        bh=OOnibZwVS4QXe9DaGiP/Jf/4UZuNzsZTE76LNhLdRAQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SZhjJqAbLuEQKi10OD1YOdVbpgYJYXxyQd5qRuURaH43m7HXPCr4KytneHIaFxeqh
         J7oXfTmo3WZcM0aBNrHNh6+Q7QlqZJau6LBhfthlE6IBJrWwpVm8ExdTYpJOKj3N3y
         5iD5nq3UnQwKQaH/vWV8wQ3NboVWSz+9nlx6yUrPsVkWpGEw1ueWQuUY85G5x4N8X1
         uqq1Ds4tKg2s3mF4x35/ZufjVHl8mjWLK6KiaxGC42xyuZ6k5QjpQm+2JSBFyWnvBm
         m48dGvd9aqv5z3oWztxH33cA7dHAFddzVSxOsTypGHQIHI+w0EF3Mt8GqFiZ47kCJJ
         4DnANaCS6YpgA==
Date:   Mon, 15 Mar 2021 18:03:45 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Sameer Pujar <spujar@nvidia.com>
Cc:     lgirdwood@gmail.com, oder_chiou@realtek.com, michael@walle.cc,
        jonathanh@nvidia.com, kuninori.morimoto.gx@renesas.com,
        alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org, thierry.reding@gmail.com,
        sharadg@nvidia.com
Subject: Re: [PATCH 0/2] Do not handle MCLK device clock in simple-card-utils
Message-ID: <20210315180345.GD4595@sirena.org.uk>
References: <1615829492-8972-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="OaZoDhBhXzo6bW1J"
Content-Disposition: inline
In-Reply-To: <1615829492-8972-1-git-send-email-spujar@nvidia.com>
X-Cookie: Close cover before striking.
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--OaZoDhBhXzo6bW1J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 15, 2021 at 11:01:30PM +0530, Sameer Pujar wrote:
> With commit 1e30f642cf29 ("ASoC: simple-card-utils: Fix device module clock")
> simple-card-utils can control MCLK clock for rate updates or enable/disable.
> But this is breaking some platforms where it is expected that codec drivers
> would actually handle the MCLK clock. One such example is following platform.
>   - "arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3-ads2.dts"

Thanks both Sameer and Michael for getting this resolved!

--OaZoDhBhXzo6bW1J
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmBPoYEACgkQJNaLcl1U
h9AtuAf/e1BD/13HSmTPeMLC/4qUqTdjmE9nF5bQErVZMroH4MMJ6db7mtVD7QPS
BX2kiqtlD3uhRAjsu2lOCY6ElVvXZe+16Q2d7uW/aWG3DsgxUv7DqEvkHWx2g0Kw
8iT85QMANx4OSRs1r2/Z27NhBehTqv2qJBzsfnIyv4OW1+72DVMe486OoIkVxAVY
5zDxF8BMgQJErkmCTb+u8PNmIYEZLsoSIePE1YLaXid7adRGU0u8G5B3Eg1js3du
GMGXnuLCC6S8UN7bDfH3hOYSg2+fbiGe3S6wd24O+DaOt5MOwzBmwUXpOhc/ScS8
v6mUjOyk9voBRkUPARLJDb6Kgdc1ag==
=2Y8Z
-----END PGP SIGNATURE-----

--OaZoDhBhXzo6bW1J--
