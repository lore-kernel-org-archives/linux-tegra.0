Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51B04C433ED
	for <linux-tegra@archiver.kernel.org>; Tue, 18 May 2021 18:35:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 32AAF61363
	for <linux-tegra@archiver.kernel.org>; Tue, 18 May 2021 18:35:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243910AbhERSg6 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 18 May 2021 14:36:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:59618 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238176AbhERSg5 (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 18 May 2021 14:36:57 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id B63286124C;
        Tue, 18 May 2021 18:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621362939;
        bh=XJyZ3btOtpI/qD2+8BYa2+IPxWF8tqgUCMjGDNYO7j0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=MlWq8wvnyveocW9is2F7cFDzcSYS+XcdcSp1EVdHkvPHgJLASrHkFjcHTM4a98BT1
         VTx6mCu4MAjLVydRigQuSEDFImYDJ5FSJ8KrA5YgYxsMJhfh26m2xZkuMlDagACX8Z
         kRaL/wRDtLw8olb4WaruUFmtK+Im4l6jzi27dx3WyvpvT8VsRe3GAEs7Sx4E6txZRa
         5h2NhaotJ6uNjxw98OmD2HBT0i2NL1QPT4ic4kxgbuID6WqYj0ODVz04s8nfEiJGS5
         NLTKAs5KKrO6EEuotfAPRSRAKuDctKdYoGI8mJEhyPCxJMQAIRnlN+SWdK322UQcMy
         NlYbKJhv94KAg==
Date:   Tue, 18 May 2021 19:34:55 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Rob Herring <robh@kernel.org>
Cc:     Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Takashi Iwai <tiwai@suse.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Ion Agorria <ion@agorria.com>,
        Svyatoslav Ryhel <clamor95@gmail.com>,
        Frank Rowand <frowand.list@gmail.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/2] ASoC: tegra: Unify ASoC machine drivers
Message-ID: <20210518183455.GE4358@sirena.org.uk>
References: <20210518001356.19227-1-digetx@gmail.com>
 <20210518001356.19227-3-digetx@gmail.com>
 <20210518180949.GA949047@robh.at.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="HnQK338I3UIa/qiP"
Content-Disposition: inline
In-Reply-To: <20210518180949.GA949047@robh.at.kernel.org>
X-Cookie: Radioactive cats have 18 half-lives.
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--HnQK338I3UIa/qiP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 18, 2021 at 01:09:49PM -0500, Rob Herring wrote:
> On Tue, May 18, 2021 at 03:13:56AM +0300, Dmitry Osipenko wrote:

> > Squash all machine drivers into a single-universal one. This reduces
> > code duplication, eases addition of a new drivers and upgrades older
> > code to a modern Linux kernel APIs.

> Nice, I never understood why each codec needed it's own machine driver=20
> (and typically in turn compatible string).

It's generally the clocking configuration, things with fancy clock trees
don't play so nicely with generic systems where we want to configure
them at runtime, or things with complex routing in the CPU where we
only recently started getting bindings that were functional enough to
use.  Tegra is fairly complex internally.

--HnQK338I3UIa/qiP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmCkCM4ACgkQJNaLcl1U
h9AZvQf9HjR/2m9uTMHCDFsce0DuGGYDqEzCiG5qOqeuuV4xjqIU+osUPQo4iKSK
kMg2Vjpq2bsjm1SWhgN34VBADGb8rrKl/yR/hGaveQ+CCJ+r3P972ODYG9eqpje+
KBaVc1sDnacC62AWm00l9ztcerToy17fTH0LXHpYYsFH57aapf/qDovV9uCn6BC2
il3CtEgBbir6jirbggzz4CORYPJGnbtxzHdW+SzrqgzS1gyAIqMzlgisNROi6UJr
F3ivHT3fjm7W7zZPSkWZVIZW0QISJe1m1e4am6L7Zn2YEIlh//xj58TbBVHaibMQ
uC+KH59xh17FYm2T4gTrsrC8ikJKpg==
=bgh3
-----END PGP SIGNATURE-----

--HnQK338I3UIa/qiP--
