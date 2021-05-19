Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51EB4C433B4
	for <linux-tegra@archiver.kernel.org>; Wed, 19 May 2021 11:38:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 31D6061363
	for <linux-tegra@archiver.kernel.org>; Wed, 19 May 2021 11:38:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346065AbhESLkK (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 19 May 2021 07:40:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:57436 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238729AbhESLkK (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 19 May 2021 07:40:10 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 262B16135C;
        Wed, 19 May 2021 11:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621424330;
        bh=k/Cg9sewf2pkY+aL3nTGRGRyuIzL36As8fq/44gs3p8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qzPdydjcUfeOykNZheQQnJDPKkW9Qxg/no1An7urX76zfKoL3hh9DRo2y1vbZZSQm
         fqzsWtma40gSFTfnmxz8alZimnwP9kN9+RYVZIgnI25s2sF6wDJLmmBYPTJ+a59ELN
         +xVpqCC7jGvHwnanB4ARmxQ2Vq5ulKbYOWs6AkL9kKCH03tsU1gpfufCH9KsJVerEi
         uQ2XURB+CYswSjqZi8l13+nFykbL9i43jgwwzXFuZ8dcg5Ff9krVSGO/e7bONpvgco
         335RXegYI0aKV8LDBl551QxhLkJVo0En9XgK8qbfqAtfnJhS3whauXNqOzuHsru1+u
         ZuSQV34YzMlCQ==
Date:   Wed, 19 May 2021 12:38:05 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Jaroslav Kysela <perex@perex.cz>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Takashi Iwai <tiwai@suse.com>, Ion Agorria <ion@agorria.com>,
        Svyatoslav Ryhel <clamor95@gmail.com>,
        Frank Rowand <frowand.list@gmail.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
        Rob Herring <robh@kernel.org>
Subject: Re: Question about Tegra UCMs
Message-ID: <20210519113805.GA4224@sirena.org.uk>
References: <20210518001356.19227-1-digetx@gmail.com>
 <20210518001356.19227-3-digetx@gmail.com>
 <20210518180949.GA949047@robh.at.kernel.org>
 <20210518183455.GE4358@sirena.org.uk>
 <92cef674-c454-e08c-b44d-d8c08b1e8ccf@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="AqsLC8rIMeq19msA"
Content-Disposition: inline
In-Reply-To: <92cef674-c454-e08c-b44d-d8c08b1e8ccf@gmail.com>
X-Cookie: There's no time like the pleasant.
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--AqsLC8rIMeq19msA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 19, 2021 at 01:31:28AM +0300, Dmitry Osipenko wrote:

> Mark, could you please help me to understand the UCM naming scheme that ALSA uses..

I have no real idea, sorry.  Most of my userspace work has been with
Android which doesn't use UCM.

> IIUC, the "ucm2/Tegra/codec_name" scheme [2] that the current ALSA UCM
> uses simply doesn't work at all. Is there anything on the kernel side
> that I could change to get a working naming scheme? If yes, I may try
> to do something about it in the v2, thanks in advance.

Could you elaborate on the way in which it simply doesn't work at all?
I'd expect there to be something in there that first tries to match on
something to do with the specific hardware platform to take account of
plastics differences but that'd be a userspace change.

Please fix your mail client to word wrap within paragraphs at something
substantially less than 80 columns.  Doing this makes your messages much
easier to read and reply to.

--AqsLC8rIMeq19msA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmCk+JwACgkQJNaLcl1U
h9Dt2Af8D6yTsMzAGTj7KbTr3xEXsDs6SVhpitdY5ohrWjYu32XSNoSMCKHZhj5Z
BXK41d7eh8QTN02078sBrifJ2e5KGpw191xaDKiBDOeMF/pdX4QLMHoNqF0PGUc5
QaBvfT+ZltEUPmq1cjmCFnhXSlkYKekLXx32KIfEX/+xussTbHVqMb1TWdAwUTZx
n8pj+NvXNNpnJDozUWtNcRxykvzDqG2wzmdUygn+IEcRC/6XZYngAqDSPE+7Z+id
/Gl0FzIHhXYf5w5skQV5NhqMpaXwag613VnPwtWWNUvqgWMsP1K3pSx2aC4jSdaK
qJa1qzIIHMbq4qlkl5GMl8bba2Mp8g==
=0Y2O
-----END PGP SIGNATURE-----

--AqsLC8rIMeq19msA--
