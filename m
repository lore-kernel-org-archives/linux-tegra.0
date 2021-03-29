Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF0ECC433E0
	for <linux-tegra@archiver.kernel.org>; Mon, 29 Mar 2021 07:15:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BB44E61919
	for <linux-tegra@archiver.kernel.org>; Mon, 29 Mar 2021 07:15:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229706AbhC2HOn (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 29 Mar 2021 03:14:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229483AbhC2HOM (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 29 Mar 2021 03:14:12 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79C0CC061574;
        Mon, 29 Mar 2021 00:14:12 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id bf3so13037591edb.6;
        Mon, 29 Mar 2021 00:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=DNyW7G1yT2hTo5u6qo+I50JVd8C42OgcsWqOflCzXh8=;
        b=O1Lhqri/67H3A4ntvRGIydscVPwxr/qAV5aGyhnIbjAHlV+nk7mWe6nHtno/pegeZf
         SM++FZT5GqiihoyqQcOac3ePKzKfmpCeSGM8moJG2g3Mq5AF9yvvt6v9HVLf0O11tUKf
         biwf750LE+xhmiOFBed+kOsBYKW8Nr0Hv1l/+B9uWaWFc4vu5w4iOg1udlS6rG1dTMQq
         fiL//aT9e/bxD0IXQoHzmR25OsMyjTFdgAWmrt6jF15IXHmi+kLfV5EH7Y+AFcGJDHnH
         cgJpOrHj5HjHWNyE+WyWzuhwnbXl3J+qKRhguHEvI5eKtdfvxYnKsdPLaEP13R0hqZr5
         RR8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=DNyW7G1yT2hTo5u6qo+I50JVd8C42OgcsWqOflCzXh8=;
        b=guTktg3X6JkzT+FTXt6YqlSqOB6yE18IhjV90q6omXyjqUZNeGI6b7zBjBJbU/VNhi
         v5n8iX3FW22TNSNU2yfwrUOyG84rGlS4KPowPgS0vszIpIIjXNHifiuzrPRyyvv58ZQU
         we/u/aFneMc53VXa6bBjnXtRS/kdE7rtg+YGFHwBLbeT6blXTwVxTDvag4+TL9n7qgBB
         M0bv3WtSQHtlYgtCpd3XzACt9mIAui8pauAoVX1UylNo00wf59NumNU8Gud37odmEgtn
         CbfBqu5oUaDrB6StCFMw5hB15nDQGIar2upbVU1AKrc9TVQOBel1+Jn5ZkZX9SuM44EP
         lC8Q==
X-Gm-Message-State: AOAM531W3OEX05sgB7jnXDLQQ+0bGcCS8ftWPF9rVxlmKYoHHPduV/o+
        Hm8iIJtNUT27SCicyBpf0Y5mC8J6FdE=
X-Google-Smtp-Source: ABdhPJwVwW5cVDZlYzF9U4PsBjpggA44GaTXotCE7zMC/gqmx+8jDQerBxH6zaPOFWzoUAR1vbWcKA==
X-Received: by 2002:aa7:cb4d:: with SMTP id w13mr27168220edt.249.1617002051233;
        Mon, 29 Mar 2021 00:14:11 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id a9sm8475486edt.82.2021.03.29.00.14.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Mar 2021 00:14:09 -0700 (PDT)
Date:   Mon, 29 Mar 2021 09:14:35 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc:     alsa-devel@alsa-project.org, tiwai@suse.de, broonie@kernel.org,
        linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH 12/17] ASoC: tegra: tegra20_das: clarify expression
Message-ID: <YGF+W2Uum+pHkH6F@orome.fritz.box>
References: <20210326215927.936377-1-pierre-louis.bossart@linux.intel.com>
 <20210326215927.936377-13-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="u16SdL02k7B5NOWk"
Content-Disposition: inline
In-Reply-To: <20210326215927.936377-13-pierre-louis.bossart@linux.intel.com>
User-Agent: Mutt/2.0.6 (98f8cb83) (2021-03-06)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--u16SdL02k7B5NOWk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 26, 2021 at 04:59:22PM -0500, Pierre-Louis Bossart wrote:
> cppcheck warning:
>=20
> sound/soc/tegra/tegra20_das.c:64:60: style: Boolean result is used in
> bitwise operation. Clarify expression with
> parentheses. [clarifyCondition]
>  reg =3D otherdap << TEGRA20_DAS_DAP_CTRL_SEL_DAP_CTRL_SEL_P |
>                                                            ^
> sound/soc/tegra/tegra20_das.c:65:61: style: Boolean result is used in
> bitwise operation. Clarify expression with
> parentheses. [clarifyCondition]
>=20
>   !!sdata2rx << TEGRA20_DAS_DAP_CTRL_SEL_DAP_SDATA2_TX_RX_P |
>                                                             ^
> sound/soc/tegra/tegra20_das.c:66:61: style: Boolean result is used in
> bitwise operation. Clarify expression with
> parentheses. [clarifyCondition]
>   !!sdata1rx << TEGRA20_DAS_DAP_CTRL_SEL_DAP_SDATA1_TX_RX_P |
>                                                             ^
>=20
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> ---
>  sound/soc/tegra/tegra20_das.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--u16SdL02k7B5NOWk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmBhflsACgkQ3SOs138+
s6GRWw//bi/X8imkX0asE+iIbIjEB/8g0DDtXmC2e58GwHBjtrzNy5YnJGEvD3MX
KDFYn0bSoGKTy+g4SQe86WyPY4m45WEjWJipDG7Y84HxlQrpZfBfLgTYoT6LxLBc
vFoNwz7POLiegrL7xrPXyd1ut6JIm294V5rAO10lDX5o/nW7xXfI0ocV5FE/rcJh
YUSg1l2ITZ7E9pdV3kpaBvfqPUR6jpmHnGWNG7G47tmp0fyjNMIRi6zplq2OGz0j
rXYVU8w1/BxFM4LtCAmo1Fb0Wv9SwZm6u7t4TH5YWChPrRqe72BsI8JXiBGljCf/
dKWANs50A1tg/V8A+cQUycQ/UfSnH82GR0NjxoMyvNTLzlRklQHrYu37T9Umhy8h
ER7k0MT5833AKFCGFn/WN444JgDkop0jl77WICZITHuDXUDf58VY1vi3lBYWRNcO
XNwx/keXxo9NxR7dogIGSDKXtLhgv0REHKRw0Svfic7aRJGHzETUANbMU3CRfv4y
KsLm8JFQ5lnLkxPNYIrwrR2cfmKcTGXs+7JWAulUaZpasekEdguPwwTy4gKmmcz6
VyMv0w/ZcjV7dlnY5EAR/WqRxNBUUiTQ2vvHAfOXa51DuCkdhCqSwiTdKHBaTXZ+
qo8j1m0qkmaptH2mzNpvSxplcomiqVfVKogkp0d57frRFWsqeFk=
=sfBK
-----END PGP SIGNATURE-----

--u16SdL02k7B5NOWk--
