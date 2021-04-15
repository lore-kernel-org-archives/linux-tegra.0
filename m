Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1579CC43462
	for <linux-tegra@archiver.kernel.org>; Thu, 15 Apr 2021 18:15:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E48BC613DB
	for <linux-tegra@archiver.kernel.org>; Thu, 15 Apr 2021 18:15:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234720AbhDOSPq (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 15 Apr 2021 14:15:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:37672 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234696AbhDOSPn (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 15 Apr 2021 14:15:43 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 917E0611CD;
        Thu, 15 Apr 2021 18:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618510513;
        bh=jOfjS+NYc4xkl9TndSm/eLJj9hRQyXa0K3+fQF1P+9c=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=q7rGZZbLOKRelQZLnxLdjK892qxcFQGxlH9dbO/nO7SQ1zqcKxeK1YDQyjKMplrU0
         K7YLDJ1IqFcpzywBSgJ/klAKjmxZFfe8lfARCGoLMKEBHwAHMfh7Qeu8kJwhrN64Vd
         NZfcNX5OmfjGbTaqg2tZl9VdMLU0bD2OWvOCoZ7n9MIbxF9w0vX5erfIOSSMoTMly+
         ODu0iP7IsMzALUVitMTBdXQmEfQDPTI1Illjo5hlw4lx3zcyjSbeaDkZ0mS/nIMcWb
         gSNHt5oj6G8ebGpxnlOvcnowSzlsmChNCjFild4buSayw8Xc9Toh2rI0Vyo9LWbxkZ
         EYzxDMMuxXNeQ==
Date:   Thu, 15 Apr 2021 19:14:50 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Linux-ALSA <alsa-devel@alsa-project.org>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 01/14] ASoC: simple-card-utils: enable flexible
 CPU/Codec/Platform
Message-ID: <20210415181450.GJ5514@sirena.org.uk>
References: <87wntmod33.wl-kuninori.morimoto.gx@renesas.com>
 <87v996od2c.wl-kuninori.morimoto.gx@renesas.com>
 <YHh/Y5fXMxm91Ha3@orome.fritz.box>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="bgQAstJ9X1Eg13Dy"
Content-Disposition: inline
In-Reply-To: <YHh/Y5fXMxm91Ha3@orome.fritz.box>
X-Cookie: VMS must die!
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--bgQAstJ9X1Eg13Dy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 15, 2021 at 08:01:07PM +0200, Thierry Reding wrote:

> This seems to break display support on a Jetson TX2 board for me, though
> I admittedly don't quite understand how it would be related to display
> at all. Reverting basically the whole series (because subsequent patches
> depend on this on) on top of next-20210415, I get working display again.

Given that we got an oops it's probably just memory corruption
somewhere.

> There's this in the log, which seems to be related:

> [   14.671377] tegra-audio-graph-card sound: too many links
> [   14.799645] tegra-audio-graph-card sound: too many links

This looks like an issue?  Or perhaps it's just DPCM triggered...

> [   15.106135] x9 : 7f7f7f7f7f7f7f7f x8 : feff303f73716e6f
> [   15.111464] x7 : 00000000ffffffff x6 : 0000314000000000
> [   15.116791] x5 : ffff0001f7091d28 x4 : ffff00008c41a010
> [   15.122109] x3 : 0000000000000000 x2 : 0000000000000010
> [   15.127439] x1 : 0000000000000000 x0 : ffff8000094614d8
> [   15.132756] Call trace:
> [   15.135201]  snd_soc_get_dai_name+0x124/0x150

Can you check where that is in the function?

--bgQAstJ9X1Eg13Dy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmB4gpkACgkQJNaLcl1U
h9Csxwf/R/2+nTEaRQSxN1we3hvnW6LrdBeeMnIPHv5EtJ06WHBMNlZWEioQfSut
vJO/plyE/iPILU0l/hdx2eCVYJC0xpXwvmai8DW1RKEj3C4ogeTr3U3WBvcMQSR7
VTZ6F5/fiXSbChaJPFfCfkpNGQoybkJjY9oHpqApIP32yl3B8jpOG16kCL7mXzq7
QHFeaZ505O5l/Qo2WyKp35rmjMGyoM1SzkSCFdOvVKCsh4GFKQMdrBPp2nyHXF8l
+25Jg957gmvuFowURCxUU05J6iWxifCrL8o1sPNpJpXDErYX/7DIS10C8CPatQBH
/ylwsIpEMGqJmR3+I0SoR+EhOz6Suw==
=+hJj
-----END PGP SIGNATURE-----

--bgQAstJ9X1Eg13Dy--
