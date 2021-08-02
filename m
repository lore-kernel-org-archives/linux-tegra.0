Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0BA9C4338F
	for <linux-tegra@archiver.kernel.org>; Mon,  2 Aug 2021 14:34:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8235E60EE8
	for <linux-tegra@archiver.kernel.org>; Mon,  2 Aug 2021 14:34:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233925AbhHBOeo (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 2 Aug 2021 10:34:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234400AbhHBOei (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 2 Aug 2021 10:34:38 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C4A5C06175F;
        Mon,  2 Aug 2021 07:34:29 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id j2so21682706wrx.9;
        Mon, 02 Aug 2021 07:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=JG8ecXhoC8Ej/py6hyvwqWnXQNEv8TbQr/VbiNiY5Vs=;
        b=ZFyb3P85dZM/QXDL+mEHAN26/1R1zJUOx3eL/vqP+UTSS5rgUj+vkXhPXnCWAvN668
         Ip7WF2p3OAt6Xm8NGNI03XsHD9oan571fJ3/NkNdqYcRNwqd05CVIUi/Esq+MqEHy9J5
         WAIgWeSTD/m39ltM/Y5OJQEVaGhvt7nBw72cBFmqzF+N4bQes5UV4wV/84Cscgm7+4XN
         IeQ/OD9ZcRzt3CgRVRaq05+LZJxZYiV+5Di9SftK9eFtmu/c/TY+QT00ox+Mjm7D36d9
         AHi3X3Wy+fgkJLwDpXz/w3fg75vCKNr43sZIHpCgokqoXUX/AynzblhuXT/arwFKy5Z2
         ivsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=JG8ecXhoC8Ej/py6hyvwqWnXQNEv8TbQr/VbiNiY5Vs=;
        b=R4zXuOPmjIPiTQEaj6Rer3e1wm7SdJaBcOGBsOxDBymRlGlMdM71GefWaPNGLASpgJ
         8KpXoi+w8dSc6FQjC1oEHPJGKnvOo/0GoKfiXmWqsUfw42vAu12RfpvqpXMQ5cVt2G0Z
         1i37bzr3ZX4vQIieWaur73YxgI85u699DbhE0EODzbII2KV8koQMDHFH6LkUlYo3UwR0
         ZxFVkzE6T3CNbRAM6vaK+aID5WHB2VetMeXMDSb05MEni5FsTcSyw9KLhuieM9syJMlP
         BKa87mywU8M40HRR6tSfc0GjOGCahOxvcLWG4jeV9V+fztl1pfv9dVRkyg3ilVgL3ygm
         o4ow==
X-Gm-Message-State: AOAM531A81AaQeTL1UyYG/thzZyHpiOwANfX5GiCwMd+gBT361PaAkzA
        GHmbJXGcTlLM79H1VV5SvUw=
X-Google-Smtp-Source: ABdhPJzn4tAn4treh3aVKHh6Tm4Nuw3ZkV2gD3VoI7ADP7Kd/tFKLW9aa2wO3iqTJX4uRIB+Eksoig==
X-Received: by 2002:a05:6000:1366:: with SMTP id q6mr17641077wrz.60.1627914867426;
        Mon, 02 Aug 2021 07:34:27 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id g11sm4659348wrd.97.2021.08.02.07.34.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Aug 2021 07:34:26 -0700 (PDT)
Date:   Mon, 2 Aug 2021 16:36:44 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc:     Thierry Reding <treding@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Arnd Bergmann <arnd@kernel.org>,
        Mark Brown <broonie@kernel.org>, soc@kernel.org,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v2] soc/tegra: Make regulator couplers depend on
 CONFIG_REGULATOR
Message-ID: <YQgC/POOrX4t9hUN@orome.fritz.box>
References: <20210721232616.1935-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="/M3eTd4X7b+v6KJy"
Content-Disposition: inline
In-Reply-To: <20210721232616.1935-1-digetx@gmail.com>
User-Agent: Mutt/2.1.1 (e2a89abc) (2021-07-12)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--/M3eTd4X7b+v6KJy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 22, 2021 at 02:26:16AM +0300, Dmitry Osipenko wrote:
> The regulator coupler drivers now use regulator-driver API function that
> isn't available during compile-testing. Make regulator coupler drivers
> dependent on CONFIG_REGULATOR in Kconfig.
>=20
> Fixes: 03978d42ed0d ("soc/tegra: regulators: Bump voltages on system rebo=
ot")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>=20
> Changelog:
>=20
> v2: - No changes. Re-sending to Arnd Bergmann and soc@kernel.org.
>=20
>  drivers/soc/tegra/Kconfig | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

Seeing that Arnd hasn't picked this up yet, I've now applied it to the
Tegra tree and plan to send out a PR for v5.14 later this week.

Thierry

--/M3eTd4X7b+v6KJy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmEIAmoACgkQ3SOs138+
s6EwYw/8C93PUwLlmRxlWx4ljKaUh0VrMk7Vtj/Csbd9n9qHn552gJ/iYQFJQUQP
jlOk6UQx/7Ydov0fYLbfaIVCvyO3/BzZCbR2hxjTua/DwyTnVDWW1LzHjK8UWnxF
OXr9gsg7M95UZCQiRkXIyIa/Vw2/N71uPJEsGrULKAvYkPppjig57IcHUt/kgNuo
BVe4XtCLocyb5dRqDISC/lzuraJN7+3HijN2A0bDuFylqr8pkVIl4umcDbPtpiab
Kg1rlLhkJgyEiEhkH3mpWaDaY6ngV88eBvbjNa8K/NemFtj+EaNFwMu9lCKQ2dZR
uXW5GVSW7Dn9O1mJf4tWzhlY+8IQyy79iaoRLh5koTbjtIx2drmfyEvKq064mgeJ
zCvfm2rV/OiE46NWRVyoyA3vuaFBnIB9OwqNPv3jsabp2AYBtFVyvjoxQN7M09WK
z5mG0WxKC7WbrBQyAZXttUEba3TYCP5VEg4+MNZwkQWnHeeXuG6eAywPLQ9pjPBz
Jq8+DRG/gSw9DlHTVvdnC9fBy07JJQoUC4/jrIyLwXsRM12UZCEsG4ZOvPmOOxKy
eW59yz7DE5pFGNswbVVUm3Rl+NX9uOBfV5h+vpkYGjqBHzmKw5Gjl/kmAIQtScYG
hmePRpO9EuEka0n2FfAKHP4rL3KNtkx4agaDiV5mwgATYyUzitU=
=DsWr
-----END PGP SIGNATURE-----

--/M3eTd4X7b+v6KJy--
