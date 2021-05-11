Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87339C433B4
	for <linux-tegra@archiver.kernel.org>; Tue, 11 May 2021 10:19:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5206F610C9
	for <linux-tegra@archiver.kernel.org>; Tue, 11 May 2021 10:19:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231245AbhEKKUe (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 11 May 2021 06:20:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:55750 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231177AbhEKKUc (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 11 May 2021 06:20:32 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7457961925;
        Tue, 11 May 2021 10:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620728366;
        bh=NTwAcLgZ6eAgQNE6hZCQNTDUa/YbVo8WCz2+w2cDnok=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=dDpv3wHiq3IIJ39YHH96Nt1yqogu/e/kvaj5IpOBEGRTPNErZG3XwMMIEO5OgKiaW
         PV4I517Z7rGmUR2+zv03L22VfeuYWKra2V1OUryRi0uX8jXqLVRHoIFaaGJMARyfxI
         jdTM0escxYVPBQ4f4KR74SUwWciprmDIpUeCic70+bWLhpSATW+rIM8wWWAoU5OOaq
         njkoURQkqRe2a2l+wIDZZtn9F/9kZ+7qu3E4utwnQz8bUyiTt3ZsaHCA6USpIn/6ot
         0EIf4w8NLpX6+Ov6kiG6AYx1RMNk8vMYl+RaEUnh/1e/9bJco/Jf+oAEVKsYDXECgR
         WWRNSSKw7XRLg==
Date:   Tue, 11 May 2021 11:18:46 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Nikola =?utf-8?Q?Milosavljevi=C4=87?= <mnidza@outlook.com>,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v1 1/2] regulator: core: Add regulator_sync_voltage_rdev()
Message-ID: <20210511101845.GF4496@sirena.org.uk>
References: <20210510220526.11113-1-digetx@gmail.com>
 <20210510220526.11113-2-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="yRA+Bmk8aPhU85Qt"
Content-Disposition: inline
In-Reply-To: <20210510220526.11113-2-digetx@gmail.com>
X-Cookie: Beam me up, Scotty!
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--yRA+Bmk8aPhU85Qt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 11, 2021 at 01:05:25AM +0300, Dmitry Osipenko wrote:
> Some NVIDIA Tegra devices use a CPU soft-reset method for the reboot and
> in this case we need to restore the coupled voltages to the state that is
> suitable for hardware during boot. Add new regulator_sync_voltage_rdev()
> helper which is needed by regulator drivers in order to sync voltage of
> a coupled regulators.

Acked-by: Mark Brown <broonie@kernel.org>

--yRA+Bmk8aPhU85Qt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmCaWgUACgkQJNaLcl1U
h9AjCQf8CTR7ZaDymPWRiXN3bB/jhrg5pAdFABzE7UrLDtrbqA0QlHeKIlMI2Poy
oUqXGJ2W4zg5Owqr06dHJYl14Sgbx6XCyXHNiyKs2g8Y/7XB10f2LzxBTMVMXdRx
ZA4xi0LMPsD0WM2Gxkg49vZqeauLD2NewZ1f0Lijv95Z40fOn0nRgtvxuJn6vzTd
4J52qbzgnRDS+K8Yg+3I9agI7K7QTsNa4NwlX380Tnl8OcZq2rUEA1tvwkReGoxE
rzZz6YVCvPvAJClSyCYHLAG/jJT8kTJ4e+eavlrhajs8pgxruou8bNpy6F63EgTX
LlInIZMARxI2qQQ1J6qVQLvVSoDeDQ==
=4SZk
-----END PGP SIGNATURE-----

--yRA+Bmk8aPhU85Qt--
