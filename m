Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6048C4338F
	for <linux-tegra@archiver.kernel.org>; Tue, 17 Aug 2021 13:52:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 813D460F5E
	for <linux-tegra@archiver.kernel.org>; Tue, 17 Aug 2021 13:52:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235092AbhHQNw6 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 17 Aug 2021 09:52:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233288AbhHQNw6 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 17 Aug 2021 09:52:58 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D7DDC061764;
        Tue, 17 Aug 2021 06:52:25 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id f9-20020a05600c1549b029025b0f5d8c6cso1972405wmg.4;
        Tue, 17 Aug 2021 06:52:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=DdliCquo+PE2UHrK1S/P5dg8iEQs9vB2EdH9vP1ZGv0=;
        b=ukAXUhMaFl3HyZReRiZG7YY3vvR3EZ42C2YpaD3yySq3MxnsezMQG3JPJ0iHUZwmg7
         zYHZ7lxkodtLymgxdBDss+TZXGoHScQSmEe9DWPX10Q/rLbv5blkxly2VwWYfyd0OVk3
         fShUeNF60iMwIYHIK0dhx9nWwR/50u9gt+1Z/PkHPdYdD3gOPKqMV3psHcWJA6UjezHH
         g2FgR6kPgFmhRKZa/SGebZ1Ai13YsILs3eku3KAmbPFjWEK9Dgf7T8Z62kbj78R/axAx
         WAevZ6At2ZvD0tC/GwMsWCTT1e/T0UrujmuGwSYoQhr50h38ftK4UNDAOVpttvqdOobB
         dIuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=DdliCquo+PE2UHrK1S/P5dg8iEQs9vB2EdH9vP1ZGv0=;
        b=FdWNlwk93PZMHdifb9IfWyk0P/OTGwV8sEIP7gHtxxbO9lXQrqCnmez8sa3oZkAiTJ
         n0OBcrhdF3fGblfoKWdQP0neKeJplekzTamDxfYr9H/QoAzR9XStP0ncLX1QjAZj26iY
         S0DFLOOUDRMNZsCIPjQd6fyxQIAB35dfjkcR4g+BZbszOcEEAoYNy1Y2/LBPZg4XP+wU
         Y6VzIphGmx5dCrIzosxk3DpP8P5OHqepZwdXFLuM00irM6P2A4/4uWd5JsnM4yPa+9vx
         oq2WZdUNELCE3F+S7A3KmYyjk/k7fulJdTxBdhplNZ+qT14zL4abj2cqEq5dv3BPhGrQ
         vSVA==
X-Gm-Message-State: AOAM530cTfZFZ44l23zM5TmajPO5IS+jdbKENGduYRtZlkGBlBPUDwET
        9r8vNsnJe3qPBMwZSxpuYHE=
X-Google-Smtp-Source: ABdhPJzSoYy1CvXrWjNtJerwsnCHpFwWy9LB94jG+Yj4qymzX0l0atghK6Evm1aCKOuTAVSYWb2BlQ==
X-Received: by 2002:a1c:e90a:: with SMTP id q10mr3563409wmc.39.1629208343855;
        Tue, 17 Aug 2021 06:52:23 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id s1sm2118598wmh.46.2021.08.17.06.52.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Aug 2021 06:52:22 -0700 (PDT)
Date:   Tue, 17 Aug 2021 15:52:21 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Mark Brown <broonie@kernel.org>, Bjorn Helgaas <bjorn@helgaas.com>
Cc:     Aakash Hemadri <aakashhemadri123@gmail.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Takashi Iwai <tiwai@suse.com>,
        Jawoslav Kysela <perex@perex.cz>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH 1/2] ASoC: tegra30: ahub: Use of_device_get_match_data
Message-ID: <YRu/FeYK7MkHzfvY@orome.fritz.box>
References: <cover.1628971397.git.aakashhemadri123@gmail.com>
 <e568d621c9c05ee23732a6a6f9e3606a780b1707.1628971397.git.aakashhemadri123@gmail.com>
 <20210816183906.GC4253@sirena.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="TERzZgiTczMyTKLC"
Content-Disposition: inline
In-Reply-To: <20210816183906.GC4253@sirena.org.uk>
User-Agent: Mutt/2.1.1 (e2a89abc) (2021-07-12)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--TERzZgiTczMyTKLC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 16, 2021 at 07:39:06PM +0100, Mark Brown wrote:
> On Sun, Aug 15, 2021 at 01:42:18AM +0530, Aakash Hemadri wrote:
>=20
> > -	match =3D of_match_device(tegra30_ahub_of_match, &pdev->dev);
> > +	match =3D of_device_get_match_data(&pdev->dev);
> >  	if (!match)
>=20
> Thierry, are you sure about your review here?  As others have been
> pointing out of_device_get_match_data() returns match->data while
> of_match_device() returns the device.

Ugh... good catch. I (naively) assumed this was a mechanical conversion
like one of the many others that have been making the rounds and
evidently wasn't paying enough attention.

Thanks for spotting this, Bjorn!

Thierry

--TERzZgiTczMyTKLC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmEbvxMACgkQ3SOs138+
s6Fuzw/+ONJup0AlXmkavB3mY/7ctPZCTYOEX1havOtaM0M7MC4gnILVLS15E5YQ
VkfyauVywsYJZ58EigjcET0aWWyP1moX//MXamjC/QMbJYBbFHydpdSsTVdvXjpX
j96kJMOQZ9ZIswQuZTNTU/ZkJltfjwLUT5ckt7jbc2PYMf/QqELtRAYEvbIG61oB
/vngvh5S5RoCQCv+kyGLZDSvgpDay2H6Ko5Xs/2uBDtiZPo+OvH+NwzNRjpd4X8l
4VuOhc6mE2796HjZ4+JG7xJ1R4mvZsNB6/HTFeiGMQhzJciB+MZhWcnGKev1WZb/
P8n9sQzppOd9X8BtusuIKxsV/JIqmOfeRWNE2ARTkKS3UcJEduiARFb+5XO0MUxc
xEGblAUU4dPztRK60nd/sHh2y/rbb2ChNs75WI9rTkI2o29js2yKCvdF7S2SPbGi
p2yDgvJGzQRQyCz71wU2oLOE2rFv7QPLUjj8tMj08ZOyjD36UTXWXn7Av8csIWQe
yvu8r/Upi1IRJAXtxKn/A4oCdEYy2ktBq54QCx16vJfTx1P6YBOKW2M2HcYEBjB1
6ilCGVVhd1XTLH/4A31gBXVtL4Wgx9gP9SbsXR1I6VFlwv0k2RZzsxc2v69hqJLm
OGKwxyBUZZ4yOy7/9oxHB5vvVW94r0pGaU9Rxj38pjfMTRq7pWg=
=CZLq
-----END PGP SIGNATURE-----

--TERzZgiTczMyTKLC--
