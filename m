Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6CA7C433DB
	for <linux-tegra@archiver.kernel.org>; Fri, 12 Mar 2021 11:37:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 77FFF64FD6
	for <linux-tegra@archiver.kernel.org>; Fri, 12 Mar 2021 11:37:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230475AbhCLLhH (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 12 Mar 2021 06:37:07 -0500
Received: from mail.kernel.org ([198.145.29.99]:47302 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231474AbhCLLg7 (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 12 Mar 2021 06:36:59 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6223F64F6F;
        Fri, 12 Mar 2021 11:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615549018;
        bh=Y3U0bmKJUb+3XHj6p4SPQWcNUnYsIrcL8PrFDSr94oo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=d1fhTAliRK4bwizKdTteFC6Hd7b76kVDBu6CuADnw71jrWGxEGBQxnzUqPp5JYiZx
         u2QQZ6YetXpIxxMinOxrnFsYy/ZCEHoMsjhUlpV9CA4UdzaOTquwk6zp98Tto0Dn0c
         NMJ1nRdp2wy/MiyVhNee2Yt812Wfow54HMAA+YtLYhUj71aVqiIbt71FzH/PiVNbMr
         fdXgstxUouTUJV1DIdJKlQDZcof6aH05FhtVjDWhg7xywIO+9qGvVYoCc5hHY/Y1cV
         rVQiw4tpiywZL0Nds+MW6CcX6c7xYjTfO4DAPY4S6mP0UM3mgE5vCwuJi4pPqMv4gk
         gdb22glb6W4rw==
Date:   Fri, 12 Mar 2021 11:35:44 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Michael Walle <michael@walle.cc>
Cc:     Sameer Pujar <spujar@nvidia.com>, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, jonathanh@nvidia.com,
        kuninori.morimoto.gx@renesas.com, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org, robh@kernel.org, sharadg@nvidia.com,
        thierry.reding@gmail.com
Subject: Re: [PATCH 1/3] ASoC: simple-card-utils: Fix device module clock
Message-ID: <20210312113544.GB5348@sirena.org.uk>
References: <1612939421-19900-2-git-send-email-spujar@nvidia.com>
 <20210309144156.18887-1-michael@walle.cc>
 <e8b80188-978c-29fa-b5d4-9788a9f2282f@nvidia.com>
 <611ed3362dee3b3b7c7a80edfe763fd0@walle.cc>
 <ca540fb6-2ea7-90b0-66ad-097e99b6e585@nvidia.com>
 <20210311161558.GG4962@sirena.org.uk>
 <f21b87f1afb3eda54b5f00f2d1c146d3@walle.cc>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="f2QGlHpHGjS2mn6Y"
Content-Disposition: inline
In-Reply-To: <f21b87f1afb3eda54b5f00f2d1c146d3@walle.cc>
X-Cookie: Lake Erie died for your sins.
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--f2QGlHpHGjS2mn6Y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 11, 2021 at 11:11:15PM +0100, Michael Walle wrote:
> Am 2021-03-11 17:15, schrieb Mark Brown:

> > The trick is figuring out if it's best to vary the input clock
> > or to use the FLL to adapt a fixed input clock,

> For simple-audio-card you can set the "clock" property if you want
> that clock to be changed/enabled/disabled. But that doesn't seem to
> be the way to go, at least it was NAKed by Rob for the audio-graph-card.
> I don't see a way to figure out if MCLK should be controlled by
> simple-*-card without adding further properties to the device tree.

If the card has a clock API clock as sysclk then set_sysclk(() should
be configuring that clock.

--f2QGlHpHGjS2mn6Y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmBLUg8ACgkQJNaLcl1U
h9CSGwgAhrOIMEFqoBHhAxZirq3hXq7cqfPrHmJx8Y03rBpjXiY5Syx8tbIGHLHL
THMEzZwO2/QPnVG39A/KCu2fv4Pjd5EHzlV1ZurXSWFEFtXzzW06Kyx5TYq/wQch
UlYziTkkW97LkhsBGYTGLQT9lHbdkiQi2CZzv+DrfWA1ZEql2IThGI8/tHwvOiDQ
nl8Lm1QgjJ2jwiKZc2fWDoNnC6++ggNAQaCEwYyxpMSNgo55smZMTCJc7xHpU/Xp
1u1jYSrWDZwj3GwgbJKzZjFEQ1bWsWBwapjxOz1A30qo0SfCKk9N1OK3fi3DRB6m
FuL4a2mG40TQ+qsz3mx6MKAfagTMMQ==
=nIRs
-----END PGP SIGNATURE-----

--f2QGlHpHGjS2mn6Y--
