Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFD92C433DB
	for <linux-tegra@archiver.kernel.org>; Wed, 17 Mar 2021 17:55:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6697664F10
	for <linux-tegra@archiver.kernel.org>; Wed, 17 Mar 2021 17:55:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232861AbhCQRyk (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 17 Mar 2021 13:54:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:39192 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232852AbhCQRyi (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 17 Mar 2021 13:54:38 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id B063864F0F;
        Wed, 17 Mar 2021 17:54:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616003678;
        bh=XxJeuZ+cw4amQUvKU8GjVxoePa5w1uzwY9Tpr8JD79o=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YL0xzOV44xFC6fmX7FY7A0vi5+ciK4IFMJeLPQmdiSHP4/xEGcIdycnzKKRpGVVy7
         Pp0ei3Mr4NETkYL1YooSg2Wt+hKumQDzPCZOxUJkoQvUpi91yGJu56p0+HT5uQXyWw
         E/c1RP+K6LXUiLPYFqVRmHOQYRB7YdXt0UkgCEXbm4JIfSqjY5ibFk5ZBU2DzgofyX
         uixko/CYHJC6cw0ADdrBlwYDY0gC3iT1svl4MhTUxbJlxWQ+FZ5ODXM01vE+/hxJbJ
         4T1kLzBGu07iIoezzhgUoNH5LDtPPskj3wdnn6E6jmx46ahbWnIjFL4zo7kcgkiIXX
         25P3a3M4mwjFA==
Date:   Wed, 17 Mar 2021 17:54:34 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Takashi Iwai <tiwai@suse.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Paul Fertser <fercerpav@gmail.com>,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 00/17] Fix reset controls and RPM of NVIDIA Tegra ASoC
 drivers
Message-ID: <20210317175434.GD5559@sirena.org.uk>
References: <20210314154459.15375-1-digetx@gmail.com>
 <be93d088-fefe-77f0-9b8e-9c815cc0d0f0@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="tNQTSEo8WG/FKZ8E"
Content-Disposition: inline
In-Reply-To: <be93d088-fefe-77f0-9b8e-9c815cc0d0f0@gmail.com>
X-Cookie: Please ignore previous fortune.
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--tNQTSEo8WG/FKZ8E
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 17, 2021 at 08:20:10PM +0300, Dmitry Osipenko wrote:

> Mark / Takashi, I may try to split up this series into two or three
> smaller patchsets and then the reset/ patch from Philipp Zabel could be
> merged by Philipp himself. I primarily want to have the audio resets
> fixed and the reset API extended with reset_control_bulk in 5.13 because
> this will unblock other patches. Please let me know what you prefer more.

I've actually already got this queued for application next time I apply
things, I'm guessing Phillip was intending that the reset patch go via
ASoC?

--tNQTSEo8WG/FKZ8E
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmBSQloACgkQJNaLcl1U
h9AAsgf/egRRBL2B24oNKvQ4OlsR6yr1Z1xvvwq1T2lCBKJV6kddrTOwC2ycOGJd
hupHoKwAfdG+eMlbOIyCh2/NyRK+gPuJjqhVRi0iT6ypmWFaxFVXF+2ziLaLVwmx
LV0G0ktWt/hw4o7Sai982eQJQCMkdLAMZ1/WsGup1lkyM0Gp1s8aPk+gB9WfC+18
oVMmyQAEXBK9t4xnhT2YJOiWD3QID1O79yGfio2VMSg5UydVZcYGz5Obum0DtlUU
K4tXp0NE5dmIuUzYbKTQuz6wkPDDpv7IaygJaFw0aYImj62cmWaPcE4Jeyu5+5Jv
4PglDPb4IaWxuU6VqJbxgmXV3wUkkQ==
=74VK
-----END PGP SIGNATURE-----

--tNQTSEo8WG/FKZ8E--
