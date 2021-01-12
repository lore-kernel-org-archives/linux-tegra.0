Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9652C4332D
	for <linux-tegra@archiver.kernel.org>; Tue, 12 Jan 2021 13:01:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B98282311A
	for <linux-tegra@archiver.kernel.org>; Tue, 12 Jan 2021 13:01:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726929AbhALNBX (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 12 Jan 2021 08:01:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726780AbhALNBW (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 12 Jan 2021 08:01:22 -0500
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com [IPv6:2607:f8b0:4864:20::d29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DC42C061575;
        Tue, 12 Jan 2021 05:00:42 -0800 (PST)
Received: by mail-io1-xd29.google.com with SMTP id d9so3724169iob.6;
        Tue, 12 Jan 2021 05:00:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Bl6G1rAuVb/adOj0Od9vL1lMatTSfI2ajKlBHjpw74Y=;
        b=i4/OO+X/N2LqDVoD/jUzcozf+EvAiReaJZr5ICPWBOpNFleYALweAck7rcfG2NxIs7
         2englFESSMpZ6PFu5aS2ADPGCn9ndkqC8dfrKUr88qZiJeES4MV7s8SLpdpmdETnP5IR
         6YjpCWXl6mUWgBTQvI6VaPMGu040n2dZ9BgLjPTCVENHAAPvj3dEB4dVK9ChWO2wgndx
         Pc1rx8lUB/BM1pock/z3EdMURVFH149yiBw+IBpq41j5KSTSG64dTDb01Tt58/GYAOBO
         FdhNgiQsazyihjhW/rlAlWuo1ExObV54m6S2E2AMdVRvjM+e0llFMreb77i85dAL4CYs
         SbGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Bl6G1rAuVb/adOj0Od9vL1lMatTSfI2ajKlBHjpw74Y=;
        b=OB3gkmrY9TlCxbiueVOB7ZBXKcmC0PZIoFfpbjBh8COu82s81q4yCWYc5LZPZusURI
         qkv33kkG8zk6K1WN7X30K9/xsHgsO8mf7WRgsNC9vQJWAdch6p4Dp+YFne6ZIIWvF8an
         kfcd+9CAi0EJUp7g8RKzyumGJRDavyRMoZFpZqoGT8F70YktZAmPXN6hx+WVNNxCNA/e
         k2cZOp5kpJDhxgBXf7Brwuva+W+YyqVzIXO0eI01JOS9IqRS31zw62/6HNCSUNt9wwiM
         WGqzqnsdpXcT02aJqxFehUKk1WnAcx9j3amwB+0ftYHFh/pY4SLtQFPdHA2azA8YhWPo
         9dhg==
X-Gm-Message-State: AOAM531PrwNuOYSknLKCVlU43c2s/gi6tALoUBm4heBuD8Zaw9iyJkuQ
        Pyd8I2eomzFZfj9hJTwMMMI=
X-Google-Smtp-Source: ABdhPJx2M5LbtmFtPAAXjJ5AseYWFasODAQS6NYgRqyuHb72NP/iLxCMNlDew00AMwFldJQUdkJ6zA==
X-Received: by 2002:a92:c104:: with SMTP id p4mr3814264ile.228.1610456441534;
        Tue, 12 Jan 2021 05:00:41 -0800 (PST)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id j12sm2801519ili.48.2021.01.12.05.00.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jan 2021 05:00:40 -0800 (PST)
Date:   Tue, 12 Jan 2021 14:00:37 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Takashi Iwai <tiwai@suse.de>
Cc:     Peter Geis <pgwipeout@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Sameer Pujar <spujar@nvidia.com>,
        Mohan Kumar <mkumard@nvidia.com>, linux-clk@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        alsa-devel@alsa-project.org
Subject: Re: [PATCH v2 0/2] fix tegra-hda on tegra30 devices
Message-ID: <X/2ddbamUzXECZDT@ulmo>
References: <20210108135913.2421585-1-pgwipeout@gmail.com>
 <s5hv9c2sgxd.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="drqTfn9TqBQMdij7"
Content-Disposition: inline
In-Reply-To: <s5hv9c2sgxd.wl-tiwai@suse.de>
User-Agent: Mutt/2.0.3 (a51f058f) (2020-12-04)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--drqTfn9TqBQMdij7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 12, 2021 at 09:22:38AM +0100, Takashi Iwai wrote:
> On Fri, 08 Jan 2021 14:59:11 +0100,
> Peter Geis wrote:
> >=20
> > The following patches fix tegra-hda on legacy tegra devices.
> > Two issues were discovered preventing tegra-hda from functioning:
> > -The hda clocks on tegra30 were assigned to clk_m and running at too low
> > of a rate to function.
> > -The tegra-hda encounters an input/output error when opening a stream.
> >=20
> > Since the only mainline device that used tegra-hda until recently was t=
he
> > t124, it is unknown exactly when this was broken. Fortunately a recent
> > patch was submitted that fixed the issue only on t194 devices. We can
> > apply it to the tegra30-hda device to resolve the issue across the boar=
d.
> > Note that downstream devices used the spdif device instead of hda for h=
dmi
> > audio. The spdif device lacks a driver on mainline.
> >=20
> > -Checkpatch seems to have issues finding [1], but git show has no issue.
> > [1] commit 60019d8c650d ("ALSA: hda/tegra: workaround playback failure =
on
> > Tegra194")
> >=20
> > Changelog:
> >=20
> > v2:
> > -Added ack and reviewed-by from Jon
> > -Updated fix to apply to tegra30-hda vice universally (Thanks Jon)
> > -Updated commit to include comments from hardware team (Thanks Sameer)
> > -Cleaned up commit messages
> >=20
> > Peter Geis (2):
> >   clk: tegra30: Add hda clock default rates to clock driver
> >   ALSA: hda/tegra: fix tegra-hda on tegra30 soc
>=20
> Shall I apply both patches via sound git tree?
>=20
> Or, if you want to take through clk tree, let me know.  In that case,
> feel free to take my ack:
> Acked-by: Takashi Iwai <tiwai@suse.de>

There doesn't seem to be a build-time (or even runtime) dependency
between the two patches and they fix two independent issues, so they
could also go in separately.

I'm fine either way. From a Tegra perspective, the Tegra30 clock driver
is very low activity, so I don't expect any conflicts with between this
and some other patches that might go in through the clock tree.

Thierry

--drqTfn9TqBQMdij7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl/9nXUACgkQ3SOs138+
s6GqTg/+OADUywchD2A60VkcQ2urUoARq6t0hydg25Ly37rjRWhl92PWQ9V3YULd
HZAA38q+/PzszkSs0ivCRKPV9QPz/YjOjpJgR3XX0GSOCxXMzxcni4GKQ5p06BsG
hCadEe1K+YXSznQn1hX6hjuuPWjSs2ZijMM/yTILil0fAd5P4LTxkbuGgxwFPXPf
/g2j/KY1IYwPotwYuOdn9eakJJaHTZJAV3pO6eDiJ+WYC4u0tPZLiCtozSSPxCAF
IZJZuBzFiMgurxjTMIlQW82Mn0R7Bpr9ERlAGIVGaPMKOugajQV/lg9223SHPlei
4tnGIU6Ven7HhFQYWxvzV32GFiuNorsSDMbCAqObPglo30Qt0jSW+DDEn9ymb9rg
owNjg8+7+uckLTRggIWoMv5eG2gh+inGOE31uNx5umn0U72JVAqjjM2YgCA5+nB4
G8lHQXFsEM4phFj+SwH1mT1u8xBeEQ5FB++hHZGX6Q3UQe4XN8w2JRAwroGRsupS
oan0d5kY0aSxzRxqXRbAFFt6SmkV+1vH1Qt0NrjAji9k9jEw/8kHcgeEEG52mHZe
c4ykdSeLwM40vCLLjAH5frO0mCGwy87y7epP8fq9t2mAFhnE6te1JZZh2d66mH7k
y3qIffocs2VEyxyMnK+EPceKMMDCg09LerCkt7ON2gde9ymVANk=
=csJX
-----END PGP SIGNATURE-----

--drqTfn9TqBQMdij7--
