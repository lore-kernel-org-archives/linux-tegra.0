Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EFD1C433DB
	for <linux-tegra@archiver.kernel.org>; Wed, 10 Mar 2021 13:38:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 544A264FEE
	for <linux-tegra@archiver.kernel.org>; Wed, 10 Mar 2021 13:38:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234983AbhCJNhe (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 10 Mar 2021 08:37:34 -0500
Received: from mail.kernel.org ([198.145.29.99]:58562 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233422AbhCJNgq (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 10 Mar 2021 08:36:46 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9AF1464FD6;
        Wed, 10 Mar 2021 13:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615383406;
        bh=/qvD9d3Yt6mfuCTPcp4UZO2U5EnDzRCNvDKcb6MmsJ4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fXkTwOG7pbmDGBbDKSu+3o811aK9eFGLJzWdPfdV7IhuvVV2m3Nk/c4z9Li2QpgZq
         JR5lFEpfU5x63QLFZC/Dg5+8+rA7Qy6i+bmi9WzXRbLRQ9uuLEpqqTPivY7IFzeayg
         mzUQ1q78M6bMSFonfRUBBV3sSsGBjGfHvBIOyAoFB/+nGnPxHilxCy4AegMTxyxkqn
         VjCUKcE1gHCAhPSvx/fugTqtMd/AwCxEl52l1MXY0/0FP1VAKrekT+ZcP+nH+lYrtB
         xdfomGcbcJbdQXlOiQDFTC2QmRVFoe6Sbf/xhWZFNbZhyi3bAQoNn8f7QcqAOFdP+8
         92FFehlbjeg4Q==
Date:   Wed, 10 Mar 2021 13:35:34 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Takashi Iwai <tiwai@suse.com>, linux-tegra@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
        Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
        Kai Vehmanen <kai.vehmanen@linux.intel.com>,
        Bard liao <yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH V2] ASoC: soc-core: Prevent warning if no DMI table is
 present
Message-ID: <20210310133534.GD4746@sirena.org.uk>
References: <20210303115526.419458-1-jonathanh@nvidia.com>
 <91480f92-a3f5-e71f-acdc-ea74488ab0a1@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="9dgjiU4MmWPVapMU"
Content-Disposition: inline
In-Reply-To: <91480f92-a3f5-e71f-acdc-ea74488ab0a1@linux.intel.com>
X-Cookie: no maintenance:
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--9dgjiU4MmWPVapMU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 09, 2021 at 01:41:45PM -0600, Pierre-Louis Bossart wrote:

> The problem is that the cards are platform devices created by the parent
> (which itself may be a PCI or ACPI device) and have nothing to do with ACPI.

> Could we flip the logic and instead explicitly detect OF devices? That
> restores functionality for us.

Just change it to a system level check for ACPI, checking for OF would
leave problems for board files or any other alternative firmware
interfaces.

--9dgjiU4MmWPVapMU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmBIyyUACgkQJNaLcl1U
h9AD0wf/Zbl1pfIcOCJxOTd8jWQgWmUT9U/NLT5bHSI+QKZCQ8TdhAJx5nbTYpsA
EIfYRfIOyNbC+orOg933wQsEzmrhboS/ZfORAvfUKtlTHA7hmWO+qIserBNczgEE
2L0pCqzopDnuD9IVNNzQr5CmEgunXIxShFGiJy2rkqHavvpZPwllhH9qpfQ3bwEO
HTFhidXy7irpPJrZq1zenN70VzExNcqMUe19mz4M4g0imcyrGmfGOqWUj9c+7ZoY
VNHHGINTIfh086c3T4PNKpK/pcmyhdsBXdJR3RewnPdMy72VzsAApz3XudGwcAqL
aH9twLn24x911JXToXymhg7uqhlwuQ==
=CPbE
-----END PGP SIGNATURE-----

--9dgjiU4MmWPVapMU--
