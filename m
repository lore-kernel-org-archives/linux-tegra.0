Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69D50C433EF
	for <linux-tegra@archiver.kernel.org>; Wed,  6 Oct 2021 18:13:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4135561077
	for <linux-tegra@archiver.kernel.org>; Wed,  6 Oct 2021 18:13:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229633AbhJFSPS (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 6 Oct 2021 14:15:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229564AbhJFSPS (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 6 Oct 2021 14:15:18 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18E68C061746
        for <linux-tegra@vger.kernel.org>; Wed,  6 Oct 2021 11:13:26 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id s15so11434799wrv.11
        for <linux-tegra@vger.kernel.org>; Wed, 06 Oct 2021 11:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=zaqBdVRFk+ICLZGJDbUbWQgjxwwAqzk4vL3NTySemas=;
        b=S/SNf6ozhfZjS0nwT87fktoYuEE//+CD1CYdS3F1GExXCnZ6+BhB9yS/csoAMUfbHl
         LyhZsRidH7XyI9BQg2BIxzLDe/AwpLe6WDY1YAmh8PbcHTRhvlo3pDy58A0AGFdaWn+D
         wZw1F85+lYDCU/4DJF6GRkT/aur8dX3apg1o11H8AMDlif0ldEsPenWUuZapLePdBp7Q
         woJmWwNWTEHo1im+AOqbN1Eo1wKoh+H+sjytvEVV//3mURtJSmIYi0/QGbhckYy3BtHs
         RzSkMZqP1mt89YdE8AHnJuvs4wxo0lRidplaxYzAzTz1UcsvuHXztUU5Actjtln/MBeN
         HozQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=zaqBdVRFk+ICLZGJDbUbWQgjxwwAqzk4vL3NTySemas=;
        b=zgjm2bDzIIbTgLisaGi7lXvm319j4XmeVGyRLfqAqWiGLCdYwwep9l8lfBTUSA47kq
         SNT3kF7BCQXL5AEavwTYhZcxbCsGtFUk5MAKRgNWBi2zXyovVlZue7FgEkJOvF5VXGyc
         R8NCzeVuJge35xlww/zEsl+0Ri6YLCvKWntjTtTGm0y+/6y37xetbaTL2pW6Gb3QAUpt
         RCv/IqOwNOWczDOSPTDInsBrObzBj4tTiai4JUhMwXgVKImd+Vk1362pjuqjOmmywmUV
         Y1n7hulFbXQAeRgDNKFy0lzY0NKrmYjJZJLUY4WZVIMy2Q9wBx+HoeOYR6dyMBvw1I+f
         b8rg==
X-Gm-Message-State: AOAM533kIOQ6R7zDPN7NFl4LaRi9wA9QkEThlfLkplzkCyebpgcJt5K5
        mXT01SODVpiK9Mb97qk3PHw=
X-Google-Smtp-Source: ABdhPJzAqnJ37R4h+xhj+4sIuwyqHT7YFJb+hSj2XePco2GwMbY4a/KFFpzaBzZuVzzetlZs+qlB2w==
X-Received: by 2002:a7b:cd8f:: with SMTP id y15mr11766483wmj.135.1633544004666;
        Wed, 06 Oct 2021 11:13:24 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id y5sm6665960wma.5.2021.10.06.11.13.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Oct 2021 11:13:23 -0700 (PDT)
Date:   Wed, 6 Oct 2021 20:13:22 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Maxim Schwalm <maxim.schwalm@gmail.com>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v1 2/2] drm/tegra: dc: rgb: Allow changing PLLD rate on
 Tegra30+
Message-ID: <YV3nQuo7eG6dkl0f@orome.fritz.box>
References: <20210929222805.16511-1-digetx@gmail.com>
 <20210929222805.16511-3-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="gAu/b9oEnI5JeGpS"
Content-Disposition: inline
In-Reply-To: <20210929222805.16511-3-digetx@gmail.com>
User-Agent: Mutt/2.1.3 (987dde4c) (2021-09-10)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--gAu/b9oEnI5JeGpS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 30, 2021 at 01:28:05AM +0300, Dmitry Osipenko wrote:
> Asus Transformer TF700T is a Tegra30 tablet device which uses RGB->DSI
> bridge that requires a precise clock rate in order to operate properly.
> Tegra30 has a dedicated PLL for each display controller, hence the PLL
> rate can be changed freely. Allow PLL rate changes on Tegra30+ for RGB
> output. Configure the clock rate before display controller is enabled
> since DC itself may be running off this PLL and it's not okay to change
> the rate of the active PLL that doesn't support dynamic frequency
> switching since hardware will hang.
>=20
> Tested-by: Maxim Schwalm <maxim.schwalm@gmail.com> #TF700T
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/gpu/drm/tegra/dc.c  | 27 ++++++++++++--------
>  drivers/gpu/drm/tegra/dc.h  |  1 +
>  drivers/gpu/drm/tegra/rgb.c | 49 +++++++++++++++++++++++++++++++++++--
>  3 files changed, 65 insertions(+), 12 deletions(-)

This seems overly complicated. I especially don't like the way how
clocks are looked up with clk_get_sys() and then used in the comparison.
Could this not be achieved by using assigned-clocks and friends
properties in DT?

Thierry

--gAu/b9oEnI5JeGpS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmFd50IACgkQ3SOs138+
s6EBexAAsjuDehZitsF89vukRChkgHiZBuGMHzUpBtswM122lccjEoqjDzXrwE9G
S93T4lB46cnFV4cgyjDGzameCDPSak6H7vR5bz4pNa2DI+BSv2J7BAWbHGwKgBwP
MyoRMw8cccQUHRe5kypVeGX2MDy8x8Fe7w9UEaLVVNXfxjFHzHnUC8XnuSnK7O7a
YFp/D7I2smc88FPWtZPnXbSydQKTACl9ukIEMqrdW9b/SZFHUfdFywuD44qiBgZE
VxS9924HeZVXJv6h1E+UzBVK4pAZrHfFjS2dyK10wfeMqY6H+KGqRBpGY8PprTbB
ubT9zWZv6Nb6izRdWGsqN6biKDjA1xvIHjyC6YvUk4ADWaU8YmrTn3myvRTdmbDn
dd6tmxriyUijVnU5S6FIbvL4iUKsWFJKl3X6aXSUxKnHBzSWzKwNBI/yC7mCQnK9
N3DpEOPR7+sx+dqRVPSds4MEou7kQ/2Iclo45/DKbU9GZA7JXOGxwi829It8gn9Q
xO58Kq0pyLgjvLWo/1tg4miLvg4VE6cM4iSoF6g6RV2YleA1p4vSYSr5/lS4A1/o
FB2GROurFndPKviii/YwC4XeqOMgJUaQezjdNuN99UktMTMoxAXxYSRNqtP920AR
VsWkQt3Ny3igiE77IDircdlARpGC3mQsbpT+CbvYy4xpKKyV8ig=
=cg06
-----END PGP SIGNATURE-----

--gAu/b9oEnI5JeGpS--
