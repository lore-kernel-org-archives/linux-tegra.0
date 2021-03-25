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
	by smtp.lore.kernel.org (Postfix) with ESMTP id A78FDC433C1
	for <linux-tegra@archiver.kernel.org>; Thu, 25 Mar 2021 14:32:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 81B9061A2A
	for <linux-tegra@archiver.kernel.org>; Thu, 25 Mar 2021 14:32:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231401AbhCYOcX (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 25 Mar 2021 10:32:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231299AbhCYOcB (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 25 Mar 2021 10:32:01 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5372FC06174A;
        Thu, 25 Mar 2021 07:32:01 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id b2-20020a7bc2420000b029010be1081172so1310850wmj.1;
        Thu, 25 Mar 2021 07:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=8X/ErCd/PUHyh7uEayt0AfWxZBWOxuGE5goHChuzl9M=;
        b=oe5h4IjS1khlBr3H69CXdHoY3Sp2GPifGMVuufqgDA5wCqFRWdvs332qj+2YH+DEY4
         /HVasUQEmhQTgFvsx5ibJ4PfnBZ9Ha+kGDeMOhu1KNWsWj8z1MOZrmoAKb/lX8AdLVZK
         Wz2mdPdPWXL/yE9FOBA8t1wUesXMJrg/RhhgHE1XFCAAcgneyuesFhXIrpJlk/fFF16S
         hStHlzjEwLGFseytjWQKrqwCk7t6Ncx1cYVCBFLGVAhfiHzQ8ww2JS9WnA1exqWjLhAG
         sOevmWxzU5qZ8xUYpqcPg37fYq/10LPioJFnUA7ytetztSJ0IMmid5IVUsm2jbtfRLd9
         efyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=8X/ErCd/PUHyh7uEayt0AfWxZBWOxuGE5goHChuzl9M=;
        b=ciqssViPVa5cB2HHMC+XDWNYZUs8e2ohXgXLk5CHZgnQx4D0Hm0TGps3hY4Q8t8maG
         XU7RI3SWHNCxlNzq5R/iORajdUGuWilfm6rzPhL5O7cL4gvrv18KpZYKdB7y9lLudkqd
         eZ1XEc5XFFtIloqVRLdjclmc7aIv2QW39FcmqVFqP7C+O4gN87NYPsipfSdZDcmaBdJa
         O/mehXwnE6oosEgkisFzWsl77yEXLrnA4wY8RQ9FPufCh6viv76wWOFXJur1IvZ/smN4
         sjOS/dvGNTiiQDpUKniGpevLGQGH9ljEcIOCahWhWxJfC8RG8YheE/Z5+mhAJSnTkc5K
         myKA==
X-Gm-Message-State: AOAM530o2dNrjca3EwG34SS6zf6AVoLAUkPkRpEQk9d+kzvA5l8vp6eR
        eehuqhekOoThAOHDckO6ihSLqnddT8o=
X-Google-Smtp-Source: ABdhPJwCP8SyVnHbVU/Xq0ABavcKyhlBcdUKDjFNpnHjTjex3u9ZXgml/hz3Y+XZ5w4ETpW2CyUtmw==
X-Received: by 2002:a1c:6305:: with SMTP id x5mr8097290wmb.156.1616682720074;
        Thu, 25 Mar 2021 07:32:00 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id c8sm8927942wrd.55.2021.03.25.07.31.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Mar 2021 07:31:59 -0700 (PDT)
Date:   Thu, 25 Mar 2021 15:32:21 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Peter Geis <pgwipeout@gmail.com>,
        Matt Merhar <mattmerhar@protonmail.com>,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/5] soc/tegra: pmc: Fix completion of power-gate
 toggling
Message-ID: <YFye9WEL489M1KOk@orome.fritz.box>
References: <20210302122502.20874-1-digetx@gmail.com>
 <20210302122502.20874-3-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="6sCD7rN+0LZ2PNul"
Content-Disposition: inline
In-Reply-To: <20210302122502.20874-3-digetx@gmail.com>
User-Agent: Mutt/2.0.6 (98f8cb83) (2021-03-06)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--6sCD7rN+0LZ2PNul
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 02, 2021 at 03:24:59PM +0300, Dmitry Osipenko wrote:
> The SW-initiated power gate toggling is dropped by PMC if there is
> contention with a HW-initiated toggling, i.e. when one of CPU cores is
> gated by cpuidle driver. Software should retry the toggling after 10
> microseconds on Tegra20/30 SoCs, hence add the retrying. On Tegra114+ the
> toggling method was changed in hardware, the TOGGLE_START bit indicates
> whether PMC is busy or could accept the command to toggle, hence handle
> that bit properly.
>=20
> The problem pops up after enabling dynamic power gating of 3d hardware,
> where 3d power domain fails to turn on/off "randomly".
>=20
> The programming sequence and quirks are documented in TRMs, but PMC
> driver obliviously re-used the Tegra20 logic for Tegra30+, which strikes
> back now. The 10 microseconds and other timeouts aren't documented in TRM,
> they are taken from downstream kernel.
>=20
> Link: https://nv-tegra.nvidia.com/gitweb/?p=3Dlinux-2.6.git;a=3Dcommit;h=
=3D311dd1c318b70e93bcefec15456a10ff2b9eb0ff
> Link: https://nv-tegra.nvidia.com/gitweb/?p=3Dlinux-3.10.git;a=3Dcommit;h=
=3D7f36693c47cb23730a6b2822e0975be65fb0c51d
> Tested-by: Peter Geis <pgwipeout@gmail.com> # Ouya T30
> Tested-by: Nicolas Chauvet <kwizart@gmail.com> # PAZ00 T20 and TK1 T124
> Tested-by: Matt Merhar <mattmerhar@protonmail.com> # Ouya T30
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/soc/tegra/pmc.c | 70 ++++++++++++++++++++++++++++++++++++++---
>  1 file changed, 65 insertions(+), 5 deletions(-)

Applied, thanks.

Thierry

--6sCD7rN+0LZ2PNul
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmBcnvQACgkQ3SOs138+
s6G5/Q/9FRt5aws4mzuM8015M9rGNntDN6xh2eUTzYsN2fQQopSFWmwCFr/3554P
S5PyV7vuNtFmI8V7VH7RAZlNC3uA1XBeav4CUTfy/UqaZwZzrnwakKQMD+93djDd
X0zZ07qzWdObTCYmQ/iZbv3kbl3F5DFg87Apv99vJMtc5SsA6n+lXhDhOHN4uqkt
+p/pcYQV2RFwXQ91mo6F8BKtqjxyuY+eL0dh1h0L888Vk0Z5vy8xd9t8gdudHZz4
eT9s4pP9sencxWq48kpR+9KzEue5oNi6c8oVazEwlz/wUeV+mjVeleuIiDE2RFoH
favsVTCFiJstqPBfxoZz/b6orcpgbukrsuALj0l6qjzJm5xparFy6Bxz/g5taRge
oGs87AKTk+4Z+AkzRRgyBKSfNzBIHPY7iVSRfJpH9iFJatQFEvk9k3KuMC6A2s+H
AR+NdEgS9Hw2I04caQo0LvzvfdkkxB2yApDssk3Sh2E4qwbVi/KQ3S4/94XIRAql
PnnUk4OLbNgkPW1QUZN9qNFNiLqyOo0ymjqbC1VHEfIfHHuc/ub/iN8hJgYLPcy3
WHD1ZrLflLl1vSx32rMpF7TxtUIiVAqgE+NpdL0tSL265xpnKHWZ0PVZTzADXw1m
mv31taCkqVXQvsLuoJyX6PKIu+W56sptWcZ7uEp64ryITgOt3p8=
=APmv
-----END PGP SIGNATURE-----

--6sCD7rN+0LZ2PNul--
