Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4863BC433FE
	for <linux-tegra@archiver.kernel.org>; Wed, 23 Nov 2022 11:36:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236402AbiKWLg1 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 23 Nov 2022 06:36:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234901AbiKWLg0 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 23 Nov 2022 06:36:26 -0500
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4817488FB9
        for <linux-tegra@vger.kernel.org>; Wed, 23 Nov 2022 03:36:25 -0800 (PST)
Received: by mail-ed1-x52a.google.com with SMTP id l11so24432331edb.4
        for <linux-tegra@vger.kernel.org>; Wed, 23 Nov 2022 03:36:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nN5Y28hwuIHnQP6o6fKt5abNwq79w5LvuYTtcDqJUxg=;
        b=ZUOIL24dRn3hKqwG1VbEpCobqa57ticgVX7m9yHTobiSWT+rEqQMPut1hMN1tGv8vy
         5P2/Yy+i6betIfOSd+B+K/kKWVeP76ho/eWPJJi0XgMy/jkgwvO7oXY8mMvioQDtXT0w
         YQd4cOrbtSuBblS5gh+vbrxzYWHj+XJVjnEP+kdKDKVjbjkmcRb9vA1liprwUwesYC6X
         qB40wJODhZZ1V6+U+yhRXkDsR6w0ccuol/o2TMHmU83cdOvHabi97uiPmEl1oIrpKE/n
         bFCc8/tmNdnkIuy16zi5KTzGN9trzXxy4nN3WYfQWl4nxDA3kacFLqrm6RARctGn6W07
         YTwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nN5Y28hwuIHnQP6o6fKt5abNwq79w5LvuYTtcDqJUxg=;
        b=XntNNhuT76MvFyOhu5d7eGobonyj/og1+JWBbRrep4fhPESk0aoRH+cIxh0gP9hxv3
         xMQQBsluv3D5YDNNgQSEgx4fiuvQlyYgMF2XtXmL02t+SsirkXXr5XFXQJwAi2ik4nlC
         KeG+xtEc7fOSmv86pdMqCks1x49ZKur6+czQTNx6xcKh9rYd+M7cPjOnj1/efmeYlXSI
         ynd4PVW5STu8XUvFSpnoveUUQkfDS7eWgfASW2cgz8d0MNQdPTUo0Q+PXeTFfzba+BVk
         zxUbR6RzBCb/MN0QOcw34iBh54rtP5PDNhaMkTA2/htlce24DtBJRQBTwudZlJ2ZIYXm
         p3/g==
X-Gm-Message-State: ANoB5pnR96ZBvotkM/4eCl3u6psysr4qEITHOO+zw3rnrmUlD4qRgnH4
        P3uVDvK1FekwVHghayAEOr0=
X-Google-Smtp-Source: AA0mqf43O86hs1uWhRNM7rSw9FfdU3qH0rO7MPgsa4YBIUPvKy7+jBf49I5+GglHQ/JGuwUH0F1OBw==
X-Received: by 2002:a05:6402:1f14:b0:461:c7ef:b09e with SMTP id b20-20020a0564021f1400b00461c7efb09emr11690588edb.58.1669203383813;
        Wed, 23 Nov 2022 03:36:23 -0800 (PST)
Received: from orome (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id v19-20020aa7dbd3000000b0045b910b0542sm7447341edt.15.2022.11.23.03.36.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Nov 2022 03:36:23 -0800 (PST)
Date:   Wed, 23 Nov 2022 12:36:21 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     arm@kernel.org, soc@kernel.org, Jon Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL v2 7/7] arm64: tegra: Device tree changes for v6.2-rc1
Message-ID: <Y34FtfuIgHV9F6wS@orome>
References: <20221121171239.2041835-1-thierry.reding@gmail.com>
 <20221121171239.2041835-7-thierry.reding@gmail.com>
 <4994fbb1-72d2-4d21-bfb9-c1eefd9815fe@app.fastmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="LNf7FqSdmFZ7VxOi"
Content-Disposition: inline
In-Reply-To: <4994fbb1-72d2-4d21-bfb9-c1eefd9815fe@app.fastmail.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--LNf7FqSdmFZ7VxOi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 22, 2022 at 11:09:43PM +0100, Arnd Bergmann wrote:
> On Mon, Nov 21, 2022, at 18:12, Thierry Reding wrote:
> >
> > Jon Hunter (6):
> >       arm64: tegra: Update console for Jetson Xavier and Orin
>=20
> While this change is clearly correct, I think it would be even
> better to completely drop the chosen/bootargs property completely
> here. The bootargs are meant to come from the bootloader anyway,
> and the console=3D argument is already implicitly set through the
> chosen/stdout-path property.

This is more of a safety net we've used in the past to make sure we can
run even if the bootloader doesn't add these. I also know that Jon was
running into some issues if these were not specified.

Jon, can we add a TODO item that we go over some of these and verify
which ones we need and which ones we don't. If we need them it might be
worth looking into why that is and if there isn't a better way to fix
this.

Thierry

--LNf7FqSdmFZ7VxOi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmN+BbUACgkQ3SOs138+
s6FoOQ/7Bb2tJv+uqz159LOLmAwBLGQ8zNMEbujovZ+oHOQJBkhZ8SAlYrE7zwrI
o4bJcNZaheybkg1SDJ4FolFg8f1cRBMq1JKEbdK1T0YLQeIyYMm/dsYaCyruWhWF
UriIPTQ85LMB5BdHz2l0T8W//Jj/Uhp2JoyJkNtkWb15eweuBuM6R+5x3jP9CU1J
Az5qLCEbJGV0iWyHrqHyScnSMFdJusYB4Px9LMGsDsz+6MQV3wHzcqHlJ9u6t/fv
rwVT7Td6KB6Kjka1xhiGcNSTWDEMxrG8XyKcu0hLXf6XtZHyVnlra2Zd1trexr8I
AjLOllN4r3z7nkjY74BXu0UOXgIFgG0AxLND+nH8WgDd0qZW6vnqy8dQkSUqji7b
M4zfDYt6I1jbbzXSXzgUlw2YcLggIhXOi/Dte0Tmw0bXtCNE5zQLdAiWSuQ5pFo0
+5zULsmvI7btNgnoggyAb6WnujD9mRCI+HFwQNVeQVm3wMXRnlAViapsQd6E4gFL
3XQtiF08DJN8dI+hOnOqLzktxmEuJSV6KW2UkyJgBA27+knA8kzXhIojYhQvKYPl
4Xm+QbX8D0hqqebteloeP6spRbqbnmu9MMuLoUs1SlNxfuu4rCw6VITpaPmDlIMi
8BnCqJpQUAPfu2szycxncdOBL9nQbfsY6ZberVJA0A6mYj9Rw8M=
=loUI
-----END PGP SIGNATURE-----

--LNf7FqSdmFZ7VxOi--
