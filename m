Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFF76C433E0
	for <linux-tegra@archiver.kernel.org>; Wed, 10 Mar 2021 16:54:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 82C9164FC8
	for <linux-tegra@archiver.kernel.org>; Wed, 10 Mar 2021 16:54:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232330AbhCJQyT (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 10 Mar 2021 11:54:19 -0500
Received: from mail.kernel.org ([198.145.29.99]:41144 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231961AbhCJQxs (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 10 Mar 2021 11:53:48 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 31E9E64FC3;
        Wed, 10 Mar 2021 16:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615395227;
        bh=LYXEORDDED5ZeFnxA4L4WxHD6s/2iGI2G6icdNZdVKE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ExcjjneF5YUIT7jt4pCyRE7YRNmLVaS/WtF+1RblQWLBGcLMt77NpHs1IC4FbZGZO
         pAvQNLl2SWkih9aGm9vgHhXZppe48rHYejLqckbItCfYzW19x70WX+onP4OyN+o5jx
         rpWRjP8bVkfnTxe241uEFB9R1xj43z8Z2IfFoif9BtS3i0lnoll2jHUfLt6I5R6r3E
         upWZf7APTTSjNJUcuMmLYxq3gt2D/cRw3PJt/9MiSp+TF7743ar1d9snVg9zC6IgAp
         L6PslnyJHs4TbZwu0/W+RskT/G/gKx/YTXX6FGG17mvnMfKRbUXVDVqOxNbIpE0yxQ
         70sZz0VNGDu1g==
Date:   Wed, 10 Mar 2021 16:52:35 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc:     Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org,
        Kai Vehmanen <kai.vehmanen@linux.intel.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
        Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
        linux-tegra@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>,
        Bard liao <yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH V2] ASoC: soc-core: Prevent warning if no DMI table is
 present
Message-ID: <20210310165235.GD28564@sirena.org.uk>
References: <20210303115526.419458-1-jonathanh@nvidia.com>
 <91480f92-a3f5-e71f-acdc-ea74488ab0a1@linux.intel.com>
 <20210310133534.GD4746@sirena.org.uk>
 <6a2352e6-f2b7-def1-de58-52fbeb7846e5@linux.intel.com>
 <20210310161814.GA28564@sirena.org.uk>
 <s5hzgzbvube.wl-tiwai@suse.de>
 <9b073d01-f2fe-a99b-e53c-4a0b3f95ca05@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="k4f25fnPtRuIRUb3"
Content-Disposition: inline
In-Reply-To: <9b073d01-f2fe-a99b-e53c-4a0b3f95ca05@linux.intel.com>
X-Cookie: Yow!  Are we laid back yet?
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--k4f25fnPtRuIRUb3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 10, 2021 at 10:41:18AM -0600, Pierre-Louis Bossart wrote:

> would this work?

> if (!IS_ENABLED(CONFIG_DMI))
>     return 0;

Build time dependencies aren't going to help anything, arm64 (and to my
understanding some future x86 systems, LynxPoint IIRC) supports both DT
and ACPI and so you have kernels built with support for both.

--k4f25fnPtRuIRUb3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmBI+VIACgkQJNaLcl1U
h9ADMQf8DUyuTKKeAuKGArtFT2ZzFUBtLWTtT/SYCk1lUWjYDuu/cWrjsKxXPb+4
38AzlvGlZp+/xcNRgfBWe3RdDSQGjp3gzYQky42fW3wo/60nabfEEz1FlEIqUQKI
jXwyDky/dB/E6AHqwUxzGlCQdcF1Ue25iXGJo9pkAfSDUi6xi5Tzytxfx4hJUzQb
ALZU7oUw4iRizAKO8ttEYhO86zE9tuztKdQ5vJn/IcLeWp8NZ3B6h5UM6ReMkm5K
Hrwoi+HnRcWTPH9uX/p5Q/z19J4XthpAVhJQXMbKq+smwble0KKeXTSUhjp9Ql5m
SfCET1DfQtXVxR+PUwStE18DDAtmRQ==
=9tca
-----END PGP SIGNATURE-----

--k4f25fnPtRuIRUb3--
