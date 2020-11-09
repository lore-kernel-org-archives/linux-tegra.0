Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3E8EC2D0A3
	for <linux-tegra@archiver.kernel.org>; Mon,  9 Nov 2020 20:31:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 763DB206E3
	for <linux-tegra@archiver.kernel.org>; Mon,  9 Nov 2020 20:31:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="wh5VIjuF"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729499AbgKIUbK (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 9 Nov 2020 15:31:10 -0500
Received: from mail.kernel.org ([198.145.29.99]:53334 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726952AbgKIUbJ (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 9 Nov 2020 15:31:09 -0500
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D842020665;
        Mon,  9 Nov 2020 20:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604953869;
        bh=WpFd5x2PVkqV7vYXRYyparKv1eINTXPsG4jy37yaFpU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=wh5VIjuF6TiKs5MpLhMrI7Wkt6O7vubtpQcIHxDWBDsNKlWG6fBJiVjXVmmgNXlmd
         pWyhgaW201K03LR2NjrIk6vOgP1ul1WtBkQ+fu3A5VYq7MWAVRyX8AR+OMoB1Fe6ul
         JNwhioj4AOMKoI2Rfd6w1jcRz+Ox8gLaAnBRw4QY=
Date:   Mon, 9 Nov 2020 20:30:55 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Sameer Pujar <spujar@nvidia.com>
Cc:     lgirdwood@gmail.com, kuninori.morimoto.gx@renesas.com,
        pierre-louis.bossart@linux.intel.com, perex@perex.cz,
        tiwai@suse.com, thierry.reding@gmail.com, jonathanh@nvidia.com,
        alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, sharadg@nvidia.com
Subject: Re: [PATCH v5 0/7] Audio Graph Updates
Message-ID: <20201109203055.GN6380@sirena.org.uk>
References: <1604329814-24779-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="VnOTrGv5LmZxna7m"
Content-Disposition: inline
In-Reply-To: <1604329814-24779-1-git-send-email-spujar@nvidia.com>
X-Cookie: This fortune is false.
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--VnOTrGv5LmZxna7m
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 02, 2020 at 08:40:07PM +0530, Sameer Pujar wrote:
> This series is a prepraration for using generic graph driver for Tegra210
> audio. Tegra audio graph series will be sent in a separate series because
> it has some dependency over other series for documentation work. This
> series can focus on the generic ASoC driver updates. Below are the summary
> of changes done.

Morimoto-san, are you OK with these?

--VnOTrGv5LmZxna7m
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl+ppv4ACgkQJNaLcl1U
h9C7igf/ehUdhv8FtDIM9U/QT/43VbP+1JshhwP6YHiYh2LU7owvxb5luCEdePnf
GdsbHaQR1BNNk3Yh7xOoBUQumC00jJ8kFojRMDWyPnrAvLyhrL64vlJrcaXfGEJ8
RwKJrfgPlsKLuVHTMYhGAVX7i3aNMjzvhgw0QrDAy94YSbuf9Fo5YwEWGdhj1V/h
GOFhPE8TTWeCvFAlF2ByWIdpJXV2pyu46KAAXwhTHkbAY/4xQjUF6KbJN1GsYXMZ
XlIQeiGpIO1sdyr6HJTpgDH6CtPWR4i6Ayk9zrIm/7u783ja9WcKtO3vZcm1TeeX
rcYhN/zsPUPkOdPzbqLFU31oCmiHWA==
=6ntz
-----END PGP SIGNATURE-----

--VnOTrGv5LmZxna7m--
