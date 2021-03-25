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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 969A8C433DB
	for <linux-tegra@archiver.kernel.org>; Thu, 25 Mar 2021 14:40:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 583B661A25
	for <linux-tegra@archiver.kernel.org>; Thu, 25 Mar 2021 14:40:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230093AbhCYOkY (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 25 Mar 2021 10:40:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231246AbhCYOkW (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 25 Mar 2021 10:40:22 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBAE7C06174A;
        Thu, 25 Mar 2021 07:40:21 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id v4so2497774wrp.13;
        Thu, 25 Mar 2021 07:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=d4SXoCFaRwfku1HZAOhY5k7o7qUMDQfRCF1hZrVX1yA=;
        b=RxpxOTULvQZl5ZGB4eYoAyD87llGy4bB280aQLIPyBanM8byKD7s7m993gBswCSEtf
         vUeiHdErW+DZlO+gRODlpNUudKRtSrZzfRmlU9UpxhjZa13T5hqQDkrQnJvt95oNlsRn
         7fmO+yGfIYPB9oWX5ptWys7cF6wNt+fx3PU6cV0qdy8FSNKXP2YPzTmKSGroTJxy8ggT
         id+x+dIC+1H2eyK5Iq5M9nJ1N4DtVR+dVZJTXSxHXsqwxoqypN+3C60n6Luz1gPIQXbq
         Cg9/wkc0FPKaIj/3VCEPhASkYCC2vjgWEthoKrNdmYdF9Ef79robdxrsr3LTUqfDxITd
         RLYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=d4SXoCFaRwfku1HZAOhY5k7o7qUMDQfRCF1hZrVX1yA=;
        b=GHMiPfphlN4Y7Xa9WAYn0URYuu94Sn0WqQQWUr95qaVqIfBsuWBdBrlwjujVgh6eUL
         fVSfsoGpEeu7SZATmI/bMYSW5tJLiA5VOZO4Ay/dR4hr2A5/4PuheSqNKPyylYbdFvmp
         mbMDpG6rVEzti1SVSIcqYgxMo/RHJZ7BqsHTMZXcTo9Z4BBL/w7EgKVyCkksF3XOQw3b
         XsUOmDBN9nkYaH35KTHRqRZN7vXhLPdG1/dQQJR+CvL3GzLgIQ6LAky5af77LKgI7CJ/
         yJYucVoEzCrHzFogkEIxjv2Ej3WGiJtWjV0BiWuFcdDkWNvjqfB/3WPJDiH4MQszWsZ4
         6L9Q==
X-Gm-Message-State: AOAM533kq1FUvvpbxgvOC8Q+U+PCZ3wy4VOQaJDLXlxbCrbpgIWCSZ38
        UdVdo0Jks5P4mvv+1oS09ai88eMpqDg=
X-Google-Smtp-Source: ABdhPJzjrg5aaNDSLJRvu8wdjR1qhLcSZz0rxVD0Y2jrm2csYQ7va+FfVX8HppJjNQT1Tb6FJVSgtg==
X-Received: by 2002:a5d:4ecf:: with SMTP id s15mr9584444wrv.222.1616683220636;
        Thu, 25 Mar 2021 07:40:20 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id q9sm7849015wrp.79.2021.03.25.07.40.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Mar 2021 07:40:19 -0700 (PDT)
Date:   Thu, 25 Mar 2021 15:40:41 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Peter Geis <pgwipeout@gmail.com>,
        Matt Merhar <mattmerhar@protonmail.com>,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 4/5] soc/tegra: pmc: Print out domain name when reset
 fails to acquire
Message-ID: <YFyg6Vm/Go6Oxrhm@orome.fritz.box>
References: <20210302122502.20874-1-digetx@gmail.com>
 <20210302122502.20874-5-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="y7nQWHb1M6J+/GhM"
Content-Disposition: inline
In-Reply-To: <20210302122502.20874-5-digetx@gmail.com>
User-Agent: Mutt/2.0.6 (98f8cb83) (2021-03-06)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--y7nQWHb1M6J+/GhM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 02, 2021 at 03:25:01PM +0300, Dmitry Osipenko wrote:
> Print out domain name when reset fails to acquire for debugging purposes
> and to make formatting of GENPD errors consistent in the driver.
>=20
> Tested-by: Peter Geis <pgwipeout@gmail.com> # Ouya T30
> Tested-by: Nicolas Chauvet <kwizart@gmail.com> # PAZ00 T20 and TK1 T124
> Tested-by: Matt Merhar <mattmerhar@protonmail.com> # Ouya T30
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/soc/tegra/pmc.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Applied, thanks.

Thierry

--y7nQWHb1M6J+/GhM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmBcoOkACgkQ3SOs138+
s6EK9A//ZjqZmyNMeR5Q5lwX/TGF9ectYvaqE7/Xfgap1rSBgc8CTk9Z3VT7svMa
YxgKAR1SrvzLhW4vCLWaL+T7H2+921GOXf/koX83F+iGjWvZ0JYXVw7NMgkIhW2j
LQLP4dujtOfLBkfjmKOly8XHPgOwdgtAOxJGK121XBCDvLAz1fgk2JOTC6fW4tZF
MQ+gDPrsRWJWNODAKbq3ozv6OPa/qUQVNxz4Ynga3FXa/iuO3n3jdNjdgPmz1NFr
+FavgqKldRheGgggGWXQcF+34XhDFI+Rxt0VMunuzyehEoq/LslAQr5HmSwrIwM6
evdhEBvFqczdW305jT2P7ldT93+Rysdsugy+fnVsqDSXcnu1ZoePCJQmWW9Ru2S/
w7wCrLCeWPURLvXxLSeCxycM/UeGUw06J8FYGk53PSNOnICcDRhYtfHHyOTozRRm
cF8/Uxdx+szr2jdWQbiB3saNbs5eOgj6v7zfbUVkHvQvRuBsP5cw7yPuojof0wEa
hfNoeBWMc3XctvUJJm3lh/04uMgBtjwsOMoOOCehR7zsw0Uf7n+HKRD5cLsk8Ue1
eyceUuoeZM35mRcVRArFnq5cc9QFpiOddFg+9RlNAeckX/AxruZLY8gLnKCnbLV5
ydpZb9HuE/2SnVV+hRC15Y43tfViTt2isRq5roAGfAUf0V/XE74=
=lklP
-----END PGP SIGNATURE-----

--y7nQWHb1M6J+/GhM--
