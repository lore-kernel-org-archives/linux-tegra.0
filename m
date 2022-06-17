Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52B75C43334
	for <linux-tegra@archiver.kernel.org>; Fri, 17 Jun 2022 23:16:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1383543AbiFQXP5 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 17 Jun 2022 19:15:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236843AbiFQXPc (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 17 Jun 2022 19:15:32 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9892265418;
        Fri, 17 Jun 2022 16:15:31 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 51A0DB82BFD;
        Fri, 17 Jun 2022 23:15:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E501C3411D;
        Fri, 17 Jun 2022 23:15:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1655507729;
        bh=Zr7o5Ip/n+Z6hADKBqwvFtgoYqGmemiH5sEu5Gmn6Uo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=NvVeNGxSrEC2+wGfvxgrs2TZcmVlqb9wr0ncY/ByguBP1mXwzGWAVvdmf0LsH45HE
         +DVp7mKlZSLTYhJNRz702Z034GHzBrZSGhEi7q4FIV2U3kshY8BMvSYmdb+5xtENhU
         aOhuH0AzI7OYW9MXFHzcNhQl5SWvGC2m7YN5Hcv5/jzNLjMJ0DDRUzeXuagimtgw27
         awG2KiyAITkD+LLOhe4OSfaeOtFcNHjs0QgJLRrHV8Q8HLHsmCNrnwD1JswlENPK18
         gCyduAV/sX5u5WEf5PpkQChZr7H4NGUzwZ5qJlJOUrySZ3ZrXvj2TgS8eEPgjgWe94
         V6Yc55jAL7BpQ==
Date:   Sat, 18 Jun 2022 00:15:24 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Sameer Pujar <spujar@nvidia.com>
Cc:     lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
        jonathanh@nvidia.com, alsa-devel@alsa-project.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: ops: Fix multiple value control type
Message-ID: <Yq0LDPDQitt22GDk@sirena.org.uk>
References: <1655492828-5471-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="pPAHYp+62yWsAIkg"
Content-Disposition: inline
In-Reply-To: <1655492828-5471-1-git-send-email-spujar@nvidia.com>
X-Cookie: 98% lean.
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--pPAHYp+62yWsAIkg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Jun 18, 2022 at 12:37:08AM +0530, Sameer Pujar wrote:
> The commit aa2a4b897132("ASoC: ops: Fix boolean/integer detection for
> simple controls") fixes false positives with controls not ending in
> " Volume" string. But it now forces boolean type for the multi value
> controls. Fix this by adding a max check before assigning types.

Thanks but someone already sent a fix for this.

--pPAHYp+62yWsAIkg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmKtCwsACgkQJNaLcl1U
h9AzxAf/SF+Y2CEG3+wWqNxOf7VedEGHhfsNyQFyPMLv59ISuaZSpNk3P2M7VdqQ
5bXsu6P51V8UqWIk6beNVh/GBfTbOtzyWGbzNhDXD/1TUzNUgJfhOXrrNZTX9BpN
DzMsk/R1wkvbW23S27uAbgJ8FiLuo4vm7WLWNTucX5qbuG38Zpubo4yQPvTsvohz
jgegrI/x1W5kzYPxIOiKkFzewnpsFcmjepQMSrJq0bVzpSRzI3moUPgrg/tN8lli
wS41tgbu4I7kDVubBqg0oTYceaic03bTQrsnG8Ayof0SvFpStpCTHdwGh45QQWYg
pqVKaC5OXvQzKnp2QBa8Jgv15AI4BQ==
=pb6W
-----END PGP SIGNATURE-----

--pPAHYp+62yWsAIkg--
