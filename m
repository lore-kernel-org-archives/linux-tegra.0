Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B6B3C433E6
	for <linux-tegra@archiver.kernel.org>; Thu, 11 Feb 2021 13:05:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5928D64EAA
	for <linux-tegra@archiver.kernel.org>; Thu, 11 Feb 2021 13:05:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231858AbhBKNF3 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 11 Feb 2021 08:05:29 -0500
Received: from mail.kernel.org ([198.145.29.99]:58640 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230450AbhBKNCW (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 11 Feb 2021 08:02:22 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id F35A564E2E;
        Thu, 11 Feb 2021 13:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1613048471;
        bh=WnyGBvukUkLqPxdNkfpak87sM7oXRCrIkT9BS5tTt3I=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=dMLfKjEpazSyrsLUGmSOTD7Y6xG8Xx9++lGFL0JkZwLMAskDhuywP1IXGdhMo/edT
         TMJ4qR1p2L/bUB7vBJXB9dx6d6PYvcuoEA5/cKpD3v56/X1tLgr+xjov/1izDzungN
         yNL7TVil1i82hO8iam3C01PT+NhGhvQ3w8mSB9KQaifMdEzvtvPQUeW98kXLmwMEdk
         mLmAZ6jsTym8ilmR7UdjATvdtxcZLTCyoPYjaOetv/RncW+gU+o3dxaIxsi3HJE6WP
         JWm8QEseg0zhLYK5toOUR07c72i+Jv1PflXK42A6DADuo7laMpCvF6VlGi7V1mbqtQ
         2phajwNgHslOw==
Date:   Thu, 11 Feb 2021 13:00:18 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Sameer Pujar <spujar@nvidia.com>
Cc:     robh@kernel.org, thierry.reding@gmail.com, jonathanh@nvidia.com,
        kuninori.morimoto.gx@renesas.com, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, sharadg@nvidia.com
Subject: Re: [PATCH 2/3] Revert "ASoC: audio-graph-card: Add clocks property
 to endpoint node"
Message-ID: <20210211130018.GB5217@sirena.org.uk>
References: <1612939421-19900-1-git-send-email-spujar@nvidia.com>
 <1612939421-19900-3-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="24zk1gE8NUlDmwG9"
Content-Disposition: inline
In-Reply-To: <1612939421-19900-3-git-send-email-spujar@nvidia.com>
X-Cookie: Do not pick the flowers.
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--24zk1gE8NUlDmwG9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 10, 2021 at 12:13:40PM +0530, Sameer Pujar wrote:
> An endpoint is not a device and it is recommended to use clocks property
> in the device node. Hence reverting the original change.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--24zk1gE8NUlDmwG9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmAlKmEACgkQJNaLcl1U
h9AqpggAgl/pYTDMcCSFre1v3IzW62gDhJyT5/i75NSiBoD9gGhTSyWoEguV0Iy3
CR8KieeeZYDCNBlnXqFh7el6vB7flEfJZrJLcOFxIcOfios3ijLes48HFcQlkIEx
/Iqz9w76tw6tEj5ZXqD+D7SecR/E94+Wun2AbxbtY4gDizqGCxGJGgCLoQ3NklGL
6KSCuOsX/njb9vvBfl1Kk2U7IdMc0EuRdAobYB0hWKKri8m0RGmVxWGVXb/3yec7
KAShGbuZfcnmIWi9SycNi7uoq5KIwOQql5A9FkgQ1cp/8nUz1NCKc1bQlp6noLOM
iiD03c83baYnzjduuuDbuKRsL3b9hQ==
=K+NY
-----END PGP SIGNATURE-----

--24zk1gE8NUlDmwG9--
