Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5181FC433E0
	for <linux-tegra@archiver.kernel.org>; Wed, 10 Mar 2021 16:20:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2244364FBB
	for <linux-tegra@archiver.kernel.org>; Wed, 10 Mar 2021 16:20:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229790AbhCJQTh (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 10 Mar 2021 11:19:37 -0500
Received: from mail.kernel.org ([198.145.29.99]:33052 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231689AbhCJQT0 (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 10 Mar 2021 11:19:26 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id B5A8064F48;
        Wed, 10 Mar 2021 16:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615393166;
        bh=MCWK3psBoFJjHRqBJ+BedqL5qFZKfMgJ4Ewfdui52Zc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Bc5Xz9h+ogOU8ASFdBZtnp/oUe5ileBhVfke4EZwuA7xIvdEL1W3CdyPMN7VMCgIm
         rhf6ObUazMXHgBD4ajr7AqAg59utJkaC7ZZLG3ayyPmmb4f5ikY/kc6m+oblLKv4aY
         QLhxNCLK7GzUNZHKW+SCfvonn3Cx647m802WOgysmdvmSaYFsuvdQZ15Q0KGI1O216
         lROvKd0A/YCVXAXidaurZyIBviX9seeaayhSrWALtU/nosjx7B7LrV4gy2lKDC4yur
         1Y8DH+ocAFJlMSoHsTccj4MjyOXVZtCj/aI/gpuFuSLuZMGiD7yEe90bK+IFxuRCkL
         zONdGlD/k8RAA==
Date:   Wed, 10 Mar 2021 16:18:14 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc:     alsa-devel@alsa-project.org,
        Kai Vehmanen <kai.vehmanen@linux.intel.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
        Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
        linux-tegra@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>,
        Bard liao <yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH V2] ASoC: soc-core: Prevent warning if no DMI table is
 present
Message-ID: <20210310161814.GA28564@sirena.org.uk>
References: <20210303115526.419458-1-jonathanh@nvidia.com>
 <91480f92-a3f5-e71f-acdc-ea74488ab0a1@linux.intel.com>
 <20210310133534.GD4746@sirena.org.uk>
 <6a2352e6-f2b7-def1-de58-52fbeb7846e5@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="3V7upXqbjpZ4EhLz"
Content-Disposition: inline
In-Reply-To: <6a2352e6-f2b7-def1-de58-52fbeb7846e5@linux.intel.com>
X-Cookie: Yow!  Are we laid back yet?
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--3V7upXqbjpZ4EhLz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 10, 2021 at 09:44:07AM -0600, Pierre-Louis Bossart wrote:
> On 3/10/21 7:35 AM, Mark Brown wrote:

> > Just change it to a system level check for ACPI, checking for OF would
> > leave problems for board files or any other alternative firmware
> > interfaces.

> did you mean if (!IS_ENABLED(CONFIG_ACPI)) ?

Is there a runtime check?

--3V7upXqbjpZ4EhLz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmBI8UUACgkQJNaLcl1U
h9Bivgf+IeTLhrstnhmT7rt/Qmp3ovzK4sWPOWgMutpLjVu+cVAbSHdOUD0xZyiO
ndVV3pbv9yDWUwTMQt/uVqVUIk6KjsWueG5XaEQN7MMOlW2WGm/T5LiGnIhujn5A
uvBuEvVjQmoZMjyaA/5SAM2cXC2xENfDw7E/seJstkqW2Z+RK/7SstbfFuH5DsgD
cgEZ+LSfY2pE0jtjwY4X+eaZSpWbTiuHyjmtcEcpMTYJXp9sUWERss9+Zbkwld2y
Xf6ysrSvDpYf4ZmckSBjyrXAOEOGSUZXaxnL6Qls0GKlvNQlDVTnFs6WCpSN2hLE
GKMpzfSl0Kp4LLahAhGKU2aSuCsBlA==
=8ZmB
-----END PGP SIGNATURE-----

--3V7upXqbjpZ4EhLz--
