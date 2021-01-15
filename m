Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94F37C433E0
	for <linux-tegra@archiver.kernel.org>; Fri, 15 Jan 2021 16:19:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6B7DE2395A
	for <linux-tegra@archiver.kernel.org>; Fri, 15 Jan 2021 16:19:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728020AbhAOQTQ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 15 Jan 2021 11:19:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727679AbhAOQTP (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 15 Jan 2021 11:19:15 -0500
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EC40C061757
        for <linux-tegra@vger.kernel.org>; Fri, 15 Jan 2021 08:18:35 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id r4so8059267wmh.5
        for <linux-tegra@vger.kernel.org>; Fri, 15 Jan 2021 08:18:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=YCiDkthl4OIFxn0mzHzqR9AizFHqaokWfRlzuTBX9TI=;
        b=sQ3cNpO5YXwK4VHLZJoZzyjhtCNBqZPphdpKRuS+jSbpL9WMgVmOISpXp4XgMZbpdV
         MFpIFNCfhfiyCdQgCzqtDgHSP9j/sRBjSjL0SHVQjnbl5JnoZMXGudb3AtlQNt8r4XnJ
         o4Sy6sj63fpCahORQi/NgsaVtQkhQuWsoDXLnuITDZFtOlKJSZueU2iR7UMr9Q2SnEXF
         pTpOWZMgvt/oecW4bIKdkEx/qgOMVdUAWTCGAm5L1JgeDG+qclHaitwt0vakQlKDyjzC
         /o4wW5rW/DlzEd1Z+EhnHqdbw5nwCrKaBleIiRADUJWScra52As9aL6CXI8SBLUq4OwD
         nerg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=YCiDkthl4OIFxn0mzHzqR9AizFHqaokWfRlzuTBX9TI=;
        b=SVPTIPPRv35q7Dvn6WvJ8gQsMhycKLPbMcr3uy1ZcVRTmN8mmT7H0R+VZKAYrlMGdq
         CyXAAa0OGP28DGG4rhjt3wWhrAVOvinvKG5wIBiKHJ7kdHnhFlPIkSmbh+UBssHQQpCt
         CfB+iSju17J5MACLz+nja85AvTYQpb1vpRVBJoF2LE2IaCODG1/Zh/Ph2pQ//aR6M2aP
         6yOun7slce5LkwJpsTb/m/T+V28J2vKreaqtc6CPR5BMkZYRV2lvJR8H29JZGNey+LCW
         H0XXSbd2GRJt/0rVqS0ukDP6/5JHusjcPzj64g/waAZJR3iZ8yR2h7PTNsmRe1De/n63
         e4cw==
X-Gm-Message-State: AOAM530dui3kcHXheCJA017BQKiFpmZ9N5jUKdwsfIkd9LgREBcMx5tY
        c7aIMQylr13TceO59Ni7CgWzpziJRNk=
X-Google-Smtp-Source: ABdhPJzzC8coE3a103G+lyWv2TG0YUO3toql0/DlMZNWZflDdbjFRJ0HTdJWJsCsRTJcMCvamkt4hQ==
X-Received: by 2002:a7b:c8da:: with SMTP id f26mr9500058wml.50.1610727513875;
        Fri, 15 Jan 2021 08:18:33 -0800 (PST)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id b13sm14625594wrt.31.2021.01.15.08.18.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Jan 2021 08:18:32 -0800 (PST)
Date:   Fri, 15 Jan 2021 17:18:31 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Mikko Perttunen <cyndis@kapsi.fi>,
        Anton Bambura <jenneron@protonmail.com>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v1 1/3] drm/tegra: dc: Enable display controller driver
 for Tegra114
Message-ID: <YAHAV0ZO1ad6deVB@ulmo>
References: <20210112181421.21293-1-digetx@gmail.com>
 <20210112181421.21293-2-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="Ty3i9iS3x+Y93JVm"
Content-Disposition: inline
In-Reply-To: <20210112181421.21293-2-digetx@gmail.com>
User-Agent: Mutt/2.0.4 (26f41dd1) (2020-12-30)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--Ty3i9iS3x+Y93JVm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 12, 2021 at 09:14:19PM +0300, Dmitry Osipenko wrote:
> Display controller driver isn't listed as a DRM sub-device for Tegra114,
> thus display driver isn't loaded on Tegra114. Enable display controller
> driver for Tegra114 SoC.
>=20
> Tested-by: Anton Bambura <jenneron@protonmail.com>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/gpu/drm/tegra/drm.c | 1 +
>  1 file changed, 1 insertion(+)

Good catch! This used to be covered by an "nvidia,tegra20-dc" fallback
in the DTS, but that was removed at some point.

Applied, thanks.

Thierry

--Ty3i9iS3x+Y93JVm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmABwFcACgkQ3SOs138+
s6EZMA//eyUzW+atqGI456yWuRpLNCkvwa500E5zuhW/MDsPu1FluH29CB4mtIiX
lBWwy3Qvpim9+8EHgwPTuh2Cv8L6Q6oMRJMfH2CUn0STzkPNaPxoXXHVYfkhdCgd
wRFCMP8yt+cvnKD9rTz0fH5YDd+dM69UPSorjHKWPRxMD2Ig0f+CbHl1zORkmHkU
aN49ueeyuPmzxlOnoUIydE1iVQ8tf+TaH7oCzbczqqCbu2hkEoFWVWCy2RPjOvF0
M/H7JJMpr8zMC/WIznU9JE46Rrq2XTFNLT4E2/UNeNTCfjTSdb+z4lSI/Ek+Ttzk
SufLVsas/91QMUfDcprbkLhMqG2sg6QmKufNkGuixF4GMNQLk55AagI1L+aI/SUT
2yxabcKkUC0MYGshd94qOy6++mqVUY7R9RMIs41YxNcsLcYPC63/5fegrRRnRWWE
uBJDpd4T4xik1uiJFd3QVeqk/cogSmQDQlmAg3rJBC0iub7iuoKHypfbTfG16Tj/
cmsXMWpcI+QOrrzuL23f3VIJCLSKFi0uHcsfg4d8HKLMDSQU4ZmYCq1anRyDAGLc
y6w2tkVOW0ywEG0F9cXhszMfJQ9tuHOJw2n5RLTzi8PR0cAybbSlWhPZdyXe7lxS
1xsRedGVAcMOIsuMCha1Q5p5YR/1QMZbfYQ/PQsLzxtF35c6imY=
=IfFI
-----END PGP SIGNATURE-----

--Ty3i9iS3x+Y93JVm--
