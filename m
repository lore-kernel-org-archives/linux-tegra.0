Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC196C433E0
	for <linux-tegra@archiver.kernel.org>; Fri, 15 Jan 2021 15:38:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 76F2723888
	for <linux-tegra@archiver.kernel.org>; Fri, 15 Jan 2021 15:38:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727357AbhAOPio (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 15 Jan 2021 10:38:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727198AbhAOPin (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 15 Jan 2021 10:38:43 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7514FC061757;
        Fri, 15 Jan 2021 07:38:03 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id m187so1492930wme.2;
        Fri, 15 Jan 2021 07:38:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=5b7DPgSBw+PLnFB212Irl5YVoOfLu+csPTf9O74uU/M=;
        b=EPKVdwJuGj1VbFdUBazgO69B0h7687NLe68MSO6ZUmJ2AUPqvk2UvJR/8aym7qx+Xq
         QNvWPyBXd1Yr1p8sxrFBgyNoxOM+5/+b2Cr479WsrGlmTGbw5otUGgrF5OMOqFSYZvo3
         HpXjNryDtPgEqSTw4ImcUvbKzPTXYr3yyttmn2Alag5pMWJ6J1BH7RKEynSal+p0NlbY
         91wH+/7nM4mbn2CxxLBWZxtzfNBESM0oW4QfM9TEbzPzGFnRvH0X2ojoLrow021mM10V
         YQ2RQi55F4+Fhnf0efMGlxs6yk3Cchyq3O/DcwLHS6+4ohLtIQGFbQNw2+gMD16aflFv
         G66A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=5b7DPgSBw+PLnFB212Irl5YVoOfLu+csPTf9O74uU/M=;
        b=hELvjfxEw0bzrIn4gxruoOt8CGUtgCZns0FHR5KwNV4ESLjnG2LXgD+m6qt5/KGUU0
         F4MLTg8LnR+ApujYKKVoMIWetZc0lIO0ydcGoC6yXO6v+8RyjfM5F5AwXKJ4XmgjAoWF
         knu5NtZYGAZ2R3B0woekZsFGkH70i97N4QWS8swxliOBCakNwRl+Cwdigi3Wti4fQqz7
         oCSlv7efm01OQUdpx6oJqM+3CVt8bTDnNXLqLURuX6icbPHXIBvDFBsFAgCT7gFZt9jU
         laHmxg9GQwlpj14FJh7gJwQyVmrKi19CEmDOKn5ePa5JSNJ8vIr+I9bRO9EVHS211iwc
         qJBA==
X-Gm-Message-State: AOAM533OlhRmu6j6Oupjq1nCocAs1mRtnhqXOYxUGZQccTjdcfu00MIe
        5LnK5TUPWEXoB5pdmVarukQ=
X-Google-Smtp-Source: ABdhPJxWwidm1sFec4GvA6yW6u8YSo5YyUE8W3w2dV2S30E8EVsCGAfkW69GmHs8RCQNFbbiO9kx7Q==
X-Received: by 2002:a1c:4d12:: with SMTP id o18mr9502162wmh.114.1610725082263;
        Fri, 15 Jan 2021 07:38:02 -0800 (PST)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id s24sm8499895wmh.22.2021.01.15.07.38.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Jan 2021 07:38:00 -0800 (PST)
Date:   Fri, 15 Jan 2021 16:37:59 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Sameer Pujar <spujar@nvidia.com>,
        Peter Geis <pgwipeout@gmail.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Takashi Iwai <tiwai@suse.com>,
        Jaroslav Kysela <perex@perex.cz>, alsa-devel@alsa-project.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 3/5] ASoC: tegra: ahub: Use
 of_reset_control_array_get_exclusive()
Message-ID: <YAG211gFXExjp7Zh@ulmo>
References: <20210112125834.21545-1-digetx@gmail.com>
 <20210112125834.21545-4-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="6qgUbVpa47g3Oipy"
Content-Disposition: inline
In-Reply-To: <20210112125834.21545-4-digetx@gmail.com>
User-Agent: Mutt/2.0.4 (26f41dd1) (2020-12-30)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--6qgUbVpa47g3Oipy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 12, 2021 at 03:58:32PM +0300, Dmitry Osipenko wrote:
> Some of resets are erroneously missed in the configlink_mods[], like APBIF
> for example. Use of_reset_control_array_get_exclusive() which requests all
> the resets. The problem was hidden by the clk driver which implicitly
> de-asserts the missing resets.
>=20
> Tested-by: Peter Geis <pgwipeout@gmail.com>
> Tested-by: Nicolas Chauvet <kwizart@gmail.com>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  sound/soc/tegra/tegra30_ahub.c | 66 +++++-----------------------------
>  sound/soc/tegra/tegra30_ahub.h |  1 -
>  2 files changed, 9 insertions(+), 58 deletions(-)

Doing it this way is slightly suboptimal because now we don't actually
have a way of checking that the DT has all the necessary resets listed.

Can we not just make the list complete instead to keep the checks in
place? That should be a much smaller patch, too.

Thierry

--6qgUbVpa47g3Oipy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmABttcACgkQ3SOs138+
s6FOVQ/7BeBBehhdaXuUwv219Wjebbw/decMS8FGhASCSSzdze7p8hQxkCpiVr0T
MPH1HJnwZQqBZUjQciF+Kp3/hycuFo8PO2zvvITuiO1eUIGMX3RKgket4TITv4I8
EAIkPYFRxcTjj7Tzc2mzD/f06OkxeMqsInlhXP8rNkswDnpOi8rSK13Cd2reVrh3
MKnc9gtV9pj4qi6r+epzFZNKP5+hAYRtCiC/Z7EnNfCAwWPmS1ApeZEPk36cwifY
6/PxzhGtsSvWqnPcjfV+6SzlZvNtwcOg0nYC3+VvTq1bxHdfdR3dvdRmWGy8vGQc
pb2T+TdnAVwFsYovqzNaPjM9iM5s6plj4saCGat5DLJprjvxAiTnKdMeckhT57pL
Li4rAOp3ZsW09VxD59PNZHkG7ERRv3gBfOEggxtxU4B+aijVgkhPq4kAaXjXMSSu
tP+Ss/y6vSQnP40HeHfysjrGZqtPfmvnrFo3jYz3HTZE1k6p4vc3Pv1EbYQAswhC
/gReNDddh5cxPYHSYP9Q1f98e33Ix+lEUFENZgVx8hmxE4ofxNAHx16t7K7CeV5F
eDS0UOtCreFMcYp0Fb1j+LM1gS6xrGhJaIu/REIdftamhF97Ch0GTURwhJhRKVKi
ef+PQEbSzK5gUb1KccngSAENnPKKahyhnxYLJfHyBvvs9LAYuB8=
=yHt+
-----END PGP SIGNATURE-----

--6qgUbVpa47g3Oipy--
