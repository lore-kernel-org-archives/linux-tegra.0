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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EAA1C433DB
	for <linux-tegra@archiver.kernel.org>; Fri, 15 Jan 2021 16:16:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DA82A23772
	for <linux-tegra@archiver.kernel.org>; Fri, 15 Jan 2021 16:16:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725923AbhAOQQk (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 15 Jan 2021 11:16:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725818AbhAOQQj (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 15 Jan 2021 11:16:39 -0500
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 300D9C061757
        for <linux-tegra@vger.kernel.org>; Fri, 15 Jan 2021 08:16:24 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id y17so9822760wrr.10
        for <linux-tegra@vger.kernel.org>; Fri, 15 Jan 2021 08:16:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=g7JbEVsR6hed7rNs5IQiLomB3I1tp8PyB2urljaCSwE=;
        b=EsFnt9FjssJUKYVHi70fmTgHzWLbKC8a9WAzFKSxrf2NwiJGIkPhpi9cqWsMMHIB1N
         56YBnNK5YkLq02FYZvJ3naIV4nj7WkXefd7zBjzyJ6jSS/ewW7CumW7LMHddyYkwWFwm
         XHgUg2rdsLX7wWzh5HPJHQZ13FtzHuCeb1JRiE8G6bqEU2uZHonQvu8CfC6/5G5DKvU9
         rwRoTK8qFugcegCdeYpfZ/8cBNnrQeVkRNNt6AbFSTIzMYVScfb8u2yDh+0ntMe8uTxJ
         M0ebTDWVyMbjGwz/ovff8GQh+RHQGGsldgrbdgsOXMNTeEiV4aUSE/LSTns3/1DndBJj
         tmpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=g7JbEVsR6hed7rNs5IQiLomB3I1tp8PyB2urljaCSwE=;
        b=ifwynxi5oHIz1eS+6/CwMZYqBhkehRCiyNWoGq/WIy4O44Rw9NJQq2lbcvzYesNBGp
         3XdDE6yza/DcV5QqYBCOpMzlBgkH3Y6anA/G62PkmTFczMn/TPWJFZmmJkJV285CRfJq
         r5faz6lGm5Nd9Ovhy+U/EwQredzJR20pUIn42BU7F/l+UVCN6BwkAugJ3qL556n0aYff
         sv76IIWTf7DVD2cVQBRQbo+j4xQ05TU00F6/6Y5ozLr9p/gbouMZWW6WFQYLmHQ//ahl
         8c9UTVkPWeqcm9KzB1nUMl/S9+ZlUFMp6XmkFAvxsW/7Dge474n/0Flo2YJyKlYG9r5o
         c2RA==
X-Gm-Message-State: AOAM531a23KE6GFWgfUsWm6W+r0jYkopTle2JFh5h4aSs1kSWm5hic2K
        eO0kP1btQXmB5O3TfirP8uY=
X-Google-Smtp-Source: ABdhPJz9jeKybwSSqsE8URg/01ZwtZjzdv2knp6hjtYRPUNR7Rp/VuENkn+AnJYqxLoh1SkihlMmSA==
X-Received: by 2002:adf:80d0:: with SMTP id 74mr14192059wrl.110.1610727382984;
        Fri, 15 Jan 2021 08:16:22 -0800 (PST)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id p8sm16034262wru.50.2021.01.15.08.16.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Jan 2021 08:16:21 -0800 (PST)
Date:   Fri, 15 Jan 2021 17:16:20 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Mikko Perttunen <mperttunen@nvidia.com>
Cc:     jonathanh@nvidia.com, linux-tegra@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 1/2] drm/tegra: falcon: Support newer VIC firmware
Message-ID: <YAG/1MTY8BdO+Msr@ulmo>
References: <20210112113707.3837876-1-mperttunen@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="J0xAiNj7E4FsUDNa"
Content-Disposition: inline
In-Reply-To: <20210112113707.3837876-1-mperttunen@nvidia.com>
User-Agent: Mutt/2.0.4 (26f41dd1) (2020-12-30)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--J0xAiNj7E4FsUDNa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 12, 2021 at 01:37:06PM +0200, Mikko Perttunen wrote:
> Support newer VIC firmware by accepting the new magic number 0x10fe,
> loading the full code segment instead of just the first page at boot
> time, and skipping FCE setup if the firmware header indicates that
> FCE is handled internally by the firmware.
>=20
> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> ---
>  drivers/gpu/drm/tegra/falcon.c |  9 +++++----
>  drivers/gpu/drm/tegra/vic.c    | 21 +++++++++++++--------
>  2 files changed, 18 insertions(+), 12 deletions(-)

Both patches applied, thanks.

Thierry

--J0xAiNj7E4FsUDNa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmABv9IACgkQ3SOs138+
s6HRaA//flUNiwu+BTIMkgejTbqnIfXuvdwappq+ITMYLcl/WxAgr1j50JRyB+o1
oQIGSQIR4inK11HkoFI0F0hpYLVvVFkBdhUMedC4di44lSGYchMPlukwiYn5/eKG
VgI1IXKjaPbSzj0ckVETO+KROhU9O/P5lxbLWaipfjzoJ6uK7cu3dVqXGWYvJeA8
WoDBstZDAKGmp/OlNV5s/xnuwCsUjjNDW8njBiSt44saCQNzeUalZyfrdRnjLAy2
Oet87FmOCDr/+F9Q0AruFiIBHPU4Glhgy6ZaFo9SndO3G9Sr6q4tKjmEefGvMBjO
3VfNiNLe99Og4PeMG0hI33rdVlvVl7b5Npcvm3z966W7U4/ESVVmTvpromg/rFG0
QTDktpzlWJey+v3SdtbdnFSGdY2OliK84w1xGmHfPDip0u09ZV6kenKXAkjht1s+
46RHmTh3b3tme8wzcMfHXkgj0lUXxg+dzYIYgCv6iDHMQ9RUyzKTFxktAnw5lW6q
wnkADbcNZ14M81e9MCAbKH8veAQ23ilCUpEavzHu06C0fALpNOuiTrOxogOFTqCZ
nrXGMlL2GdH2Rb8icgDOywDmam+u9yoYBcRmhQv6PuPj3xwalXnYV8DIYH4kJwRv
hI2/CdZu+FW+8UzjRLP656ajTv1Mi11y3Jp+wPrCQsiVtahBMdA=
=6QL4
-----END PGP SIGNATURE-----

--J0xAiNj7E4FsUDNa--
