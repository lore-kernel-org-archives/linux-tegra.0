Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C3C1C388F7
	for <linux-tegra@archiver.kernel.org>; Tue, 10 Nov 2020 19:16:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D832520809
	for <linux-tegra@archiver.kernel.org>; Tue, 10 Nov 2020 19:16:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MaI/jNlW"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726984AbgKJTQR (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 10 Nov 2020 14:16:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726400AbgKJTQR (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 10 Nov 2020 14:16:17 -0500
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA839C0613D1;
        Tue, 10 Nov 2020 11:16:16 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id a65so4270999wme.1;
        Tue, 10 Nov 2020 11:16:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=xa34eP6uVHbH+gi0+6/x5teG09+nE17SF9X2Y3WmGyo=;
        b=MaI/jNlWicH8l/uFViHq6ikKHrfBk1JoyQ3XVTcQKJC9u81EBiN8HZNbrI+MboqZuC
         waM5AmHXTtT9SAOey66YUZQROyNlgI2xaLuC86daZF4TKM8EVkLRGLSlwqg5DnUnhLPp
         4L90yZYckWiW4ucyEw3ZPFK6hJLHRxLNK66hqDctCZS3dVUXslYJSIZaLeOlAW0IfSJh
         Y2RAjeZsHJNegZqI1mPWZZvalXAKiTDFaoRkdgDQ/F3AyZmWR2q9ELgoZ9FMNRkE8i2H
         Qr+GkAUUQ0oz4incdmd1GU9siNntaIAXNooCZ5He+AginFSlph6/w4AH28Y439ZV/ND2
         7XxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=xa34eP6uVHbH+gi0+6/x5teG09+nE17SF9X2Y3WmGyo=;
        b=qFoJjkqfjzcmvX3oX7nHftoggNCU46yNtlm7V3wEBS+CkTAOatWNpcW445PSNUBpMi
         FT9L6KHiNOHJ8+rnuriNO2YSVht6aEWEqGLzTw2BO9izHpw1ychEpwgcqVweY6HC9LEL
         4mrNpBzrtulnCI1TpTtfPfUrbuUXdw5dATGFPkw0q712aiKzcvfyCG79ukojO6t/4epg
         S364J6ohrUtFmzLl9xgxhVuHNp1oAT4EFUvIEnfHqo5O9r8MVrS2UeSWE1yIjfj2Tp6t
         z5kOpeR4ityDs7Xq8T6bAOwP/buSv7ZCwQ/f3w0NTpw3QmJJwCp4Qvkn6fmtPq/es9wY
         x1ug==
X-Gm-Message-State: AOAM530lyFcylNZxSX8wuhmHfQ3g0rZCjgHt6vA5JadwRMcG8/pi3+UO
        87J9Pz2ygFSgKLPWil1UiYKCy7EfBZg=
X-Google-Smtp-Source: ABdhPJyn/qUAH+2E+wGQCjyrtac5k9vK53yHufhlVxMzbvX+4RTB2hGXNMc4ymEmEHBYXgwVJBWL6g==
X-Received: by 2002:a1c:7202:: with SMTP id n2mr676061wmc.38.1605035775727;
        Tue, 10 Nov 2020 11:16:15 -0800 (PST)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id p4sm17858957wrm.51.2020.11.10.11.16.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2020 11:16:13 -0800 (PST)
Date:   Tue, 10 Nov 2020 20:16:12 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Arvind Sankar <nivedita@alum.mit.edu>,
        Arnd Bergmann <arnd@arndb.de>,
        Thierry Reding <treding@nvidia.com>,
        Timo Alho <talho@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] [v2] firmware: tegra: fix strncpy()/strncat() confusion
Message-ID: <20201110191612.GA2303484@ulmo>
References: <20201026164937.3722420-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="/04w6evG8XlLl3ft"
Content-Disposition: inline
In-Reply-To: <20201026164937.3722420-1-arnd@kernel.org>
User-Agent: Mutt/1.14.7 (2020-08-29)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--/04w6evG8XlLl3ft
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 26, 2020 at 05:49:21PM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>=20
> The way that bpmp_populate_debugfs_inband() uses strncpy()
> and strncat() makes no sense since the size argument for
> the first is insufficient to contain the trailing '/'
> and the second passes the length of the input rather than
> the output, which triggers a warning:
>=20
> In function 'strncat',
>     inlined from 'bpmp_populate_debugfs_inband' at ../drivers/firmware/te=
gra/bpmp-debugfs.c:422:4:
> include/linux/string.h:289:30: warning: '__builtin_strncat' specified bou=
nd depends on the length of the source argument [-Wstringop-overflow=3D]
>   289 | #define __underlying_strncat __builtin_strncat
>       |                              ^
> include/linux/string.h:367:10: note: in expansion of macro '__underlying_=
strncat'
>   367 |   return __underlying_strncat(p, q, count);
>       |          ^~~~~~~~~~~~~~~~~~~~
> drivers/firmware/tegra/bpmp-debugfs.c: In function 'bpmp_populate_debugfs=
_inband':
> include/linux/string.h:288:29: note: length computed here
>   288 | #define __underlying_strlen __builtin_strlen
>       |                             ^
> include/linux/string.h:321:10: note: in expansion of macro '__underlying_=
strlen'
>   321 |   return __underlying_strlen(p);
>=20
> Simplify this to use an snprintf() instead.
>=20
> Fixes: 5e37b9c137ee ("firmware: tegra: Add support for in-band debug")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> v2: Use the correct arguments for snprintf(), as pointed out by Arvind Sa=
nkar
> ---
>  drivers/firmware/tegra/bpmp-debugfs.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)

Applied, thanks.

Thierry

--/04w6evG8XlLl3ft
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl+q5voACgkQ3SOs138+
s6F/kA/9G/n73HeUjhQYS1PxKSzJnvsWnUjYOtQqX+Dq7ajfxmT+fBwqKJisBcJD
1A+VM8ciXWwu6CPqumquS/4CHB9gv4jthTkoL+GLhAxjiesRPpqzCMkkQPaRr9Sf
BAeCMmrtWet0aWSlikg7ncoHpN1f99gNsEcclrL1eUS0kak5Mmp1PPOZP6xdbRAD
caLBMF7M7azgiz8/Foacg2uXMyQSBKDexhLfcB1Ff4yAV8iLVQ2t7lyi7Rw4hpSE
9d3Cr6lx3Z7lwj76WcB5lh1PbZWLaERPcGuYGzhiP50FJVeBicl9vX5AEk4QFhi4
1xL0kcVmjcMOlZODeyPihuHc5qZwkMx6LnRKtSqiRqAj2m9lOaG5vWD2SfAqxoDi
W7HNbmVnwR8ch5mnUHjhbPYBnpH016NFZyJ9Bp5JndB8K3xevpRnK1czrTa+gVGH
dQIzMe9o7mUaGn95dhWpXARDRb+G9Myd2w9PIxL6oOFO3G7j1237oa8iYwMPsPIh
3wIOERxmc0QRD5SH8vKqXPOr9BMXONWf2LyYgb+lcEFAJEc2BMxXMcZ4tfVwEBNx
0PH0C2scwHTgGX6WXsyiDj+30Hj5SOe1XrrkupG3iaNVK4hRX3v/5VDh9wHnpBi3
9DDzDhi/vfIXQX9+7ouM8w6oVN+VTPP/uYNuX8KkyaU9f7hWQ+A=
=KrgJ
-----END PGP SIGNATURE-----

--/04w6evG8XlLl3ft--
