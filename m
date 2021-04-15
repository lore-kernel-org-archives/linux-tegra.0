Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C39DC433B4
	for <linux-tegra@archiver.kernel.org>; Thu, 15 Apr 2021 18:31:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 60E8F60E09
	for <linux-tegra@archiver.kernel.org>; Thu, 15 Apr 2021 18:31:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233551AbhDOSb6 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 15 Apr 2021 14:31:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:41806 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233052AbhDOSb6 (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 15 Apr 2021 14:31:58 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id CE3396105A;
        Thu, 15 Apr 2021 18:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618511495;
        bh=uoR+Kr+blFzetHXbngHy4mfmiD/fgYrOO+y1Xqt+C/0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hhKTV7U0LomOG/BNi9C8cyHsqB1Uhayg8oXAXCsm769dhNfWkikq4igKpepvKzqAI
         feajl99wBZc+euoKIQ11dl3RY/9mAbW7nZ5Ykmu6nld3KMhbtLu4m8IAjl/1d4JlEQ
         oBjq8mwxQMNhSZlNl770Uiy055aAPHRfrhnjEWue7tjhv27pAgkdFyCbCBlccdJNN1
         y7XDWg6Lfk288excqaHEHGa2vgCMqYOoO+0k1oXql6aH7OWltiNScRAnkluOeuJztR
         blBog1m3z22qOIcRZTXDGlhrV7CAGnb0VrIdl5Ecg+arlwCCj1Rg8BMnNzMXU/HLcU
         RoavfCIwh8yng==
Date:   Thu, 15 Apr 2021 19:31:12 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Linux-ALSA <alsa-devel@alsa-project.org>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 01/14] ASoC: simple-card-utils: enable flexible
 CPU/Codec/Platform
Message-ID: <20210415183112.GK5514@sirena.org.uk>
References: <87wntmod33.wl-kuninori.morimoto.gx@renesas.com>
 <87v996od2c.wl-kuninori.morimoto.gx@renesas.com>
 <YHh/Y5fXMxm91Ha3@orome.fritz.box>
 <20210415181450.GJ5514@sirena.org.uk>
 <YHiFEUUfsn3ni/Uo@orome.fritz.box>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="q6mBvMCt6oafMx9a"
Content-Disposition: inline
In-Reply-To: <YHiFEUUfsn3ni/Uo@orome.fritz.box>
X-Cookie: VMS must die!
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--q6mBvMCt6oafMx9a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 15, 2021 at 08:25:21PM +0200, Thierry Reding wrote:

> In any case, I came up with the attached. I don't know how good it is
> because now the number of links exceeds SNDRV_MINOR_DEVICES, but perhaps
> that's just irrelevant and that constant was used merely because it was
> conveniently there.

We shouldn't actually end up creating that many devices, a lot of those
should be DPCM links which are internal only.

> The patch restores display on Jetson TX2. I can look around a bit if I
> can find where the boundary checks might be missing so that we
> gracefully fail rather than corrupting everything.

That'd be good, thanks.

--q6mBvMCt6oafMx9a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmB4hm8ACgkQJNaLcl1U
h9AqxAf/Rx7T3DVd1aIGp8MQx37ydO3ASpzgL5t616HY7NEnY6zzHfqtQdHCgJUN
if1vBGRn9v9i22AijDI6M9Y8fOpNbLQSspdcoNiT9WYMaUx0+zwrIGkA7D+FVe1I
ILiFfFKYRUfm1j2c4a2W74wURGE4JH5mZ6Gu663iaPgyvJOyaEpgrEL6FP52mPMo
s2gPeg2pePtvZG20wFT1vDoP4Rt6CtPW4UqbUOpV33YLYZZik+pbXKApObi52PYJ
5KMuBQv+lCBnpl8m50lYPpkx5IIxsSnzbW2wBY602sMQBj4suZkVZOGOhijVifLZ
crwi0g+jmvW5au6ZICqDhu7CuDQuog==
=CDdU
-----END PGP SIGNATURE-----

--q6mBvMCt6oafMx9a--
