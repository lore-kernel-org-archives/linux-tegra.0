Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B8DFC433F5
	for <linux-tegra@archiver.kernel.org>; Mon,  8 Nov 2021 16:16:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E68BA61361
	for <linux-tegra@archiver.kernel.org>; Mon,  8 Nov 2021 16:16:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239155AbhKHQSx (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 8 Nov 2021 11:18:53 -0500
Received: from mail.kernel.org ([198.145.29.99]:58658 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236829AbhKHQSx (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 8 Nov 2021 11:18:53 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 91AAF61360;
        Mon,  8 Nov 2021 16:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636388168;
        bh=ZViGquAcSREf+WCVyvRS1/EQ7NWLBVKUIUxVQpvu/Vk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qDbi4k8q9+LR+6Xqi95afw3Ov2XCJtgQsoPXbqWGwgqOO6qNkaFhBAl0mvjhMmCUc
         BIcFHDyB5TiDpg1vGgCQ7hfumwZCLduUiFoBOWwJa67ftfBNYrveblFgfDRkuqVWrj
         o9qJQiXy4gqxwoCDF2AQUvtXpeVlQTJbSP3ychXOQeQg/YhtD6Irk2DGPcvxh6j9OB
         HsZ+l8XDu+dG9hs7vV6m0+3RpxH36DzeEMzxZk6F3krj5wp77OKAHG6pvchC+qywhv
         W6ESPfwY1BKiFDk8KzELS3xm/wqc+0iyR6Ey3SWiPKPOx492ubZEYx41nQZCbBprrD
         Y0L0GtuSI1aBQ==
Date:   Mon, 8 Nov 2021 16:16:03 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Sameer Pujar <spujar@nvidia.com>
Cc:     Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.de>,
        lgirdwood@gmail.com, tiwai@suse.com, thierry.reding@gmail.com,
        jonathanh@nvidia.com, alsa-devel@alsa-project.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 01/10] ASoC: tegra: Fix kcontrol put callback in ADMAIF
Message-ID: <YYlNQya+YVg1JCRq@sirena.org.uk>
References: <1635947547-24391-1-git-send-email-spujar@nvidia.com>
 <1635947547-24391-2-git-send-email-spujar@nvidia.com>
 <s5ha6ilmiiv.wl-tiwai@suse.de>
 <0e2d89ca-84e3-9427-5ce1-c0224d4db089@perex.cz>
 <d27bf513-6f16-5ad6-59cb-79fad5cc951c@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="hSCBKJ2X0AP7XGaR"
Content-Disposition: inline
In-Reply-To: <d27bf513-6f16-5ad6-59cb-79fad5cc951c@nvidia.com>
X-Cookie: Kleeneness is next to Godelness.
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--hSCBKJ2X0AP7XGaR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 08, 2021 at 09:33:25PM +0530, Sameer Pujar wrote:

> With separate callbacks, the string checks can be removed. However for most
> of the controls, the common part is minimal. So there would be multiple
> independent small functions depending on the number of controls and the
> local variables are duplicated that many times. Would there be any concern
> on the space these local variables take? One pair of callbacks for a control
> may look like this.

...

> Looks like having separate callbacks make it look more cleaner. If this
> appears fine, I can send next revision.

Looks fine.  It'll result in more code but hopefully they should be
smaller, especially if you're using substrings rather than the full
control name to identify the control and we need to store all them
separately to the copy used to identify the control to userspace (I
didn't go check).

--hSCBKJ2X0AP7XGaR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmGJTUIACgkQJNaLcl1U
h9A7OAf/crR93uqsfMvOX0QdbKKWE3VrliVv3O3XEdi19d7/wUTGNbdqm0547n4L
oyi9HGmFL/pXYpGncL5V+UIqWRftYJ9oy2GIYxRe/eH6RFGM0vthFI+Z8ZJw3D+i
Rtx7WX9gFANilArMSXwILu4K8CsAeoDF8Tibjh4K1+k5IcO2tNcTnSNA5xlT7OVc
uzpDDAe9c6c1X0mP2D42MoHJ4RtEcKvue0GxpN+/PKkCAgmpGMsQb+RQ25n9npHv
8w7lMDaddhi2MQMuBPYDmAHboFkhsCVyVJFKJOPgMzF55SC17iDFHW6QyxT4FimW
0p60A9ZtmDNkiKXjOo2tj3JEpqQmgw==
=Xs1h
-----END PGP SIGNATURE-----

--hSCBKJ2X0AP7XGaR--
