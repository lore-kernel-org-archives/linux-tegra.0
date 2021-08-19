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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46D80C4338F
	for <linux-tegra@archiver.kernel.org>; Thu, 19 Aug 2021 17:26:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2DE1C6108B
	for <linux-tegra@archiver.kernel.org>; Thu, 19 Aug 2021 17:26:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230504AbhHSR1c (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 19 Aug 2021 13:27:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229659AbhHSR1c (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 19 Aug 2021 13:27:32 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B61E5C061575;
        Thu, 19 Aug 2021 10:26:55 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id q11-20020a7bce8b0000b02902e6880d0accso7336046wmj.0;
        Thu, 19 Aug 2021 10:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=tqPjKZJYc+Rc6IoAOJPSNmiYR/t0jKijcOgUY37edWs=;
        b=UKwXjzKaoEc5/NslWFN2wPzawo7BQF8Dd1WpKvc30+hq9J3w0JBA6B3L1CBMmA2a5s
         AP2KyIImocC+zTVJzsTXtraHhAT5Zlft22JJYyOwXg0voYYI9wlzN3kDAbIdygncIbgE
         cyUnWce8byW5kP/4dygHRw/55N0UnYd7QaKpPN6+rO3xBf5WG/SrCZHmcco5CBJxhVV7
         v58bRJfdYXv2ddjPpEgz0NZtZA6SQMIYM/hASSCZt1pcNdZIIiuDE/NELQwbnT3dLWI5
         X4n1BzfV+uE1qVbmX63h2s4BtJDFEQUROcrVyCWDFFPYWv8a9Ya3ZIZyN/WetWE5etSc
         a7VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=tqPjKZJYc+Rc6IoAOJPSNmiYR/t0jKijcOgUY37edWs=;
        b=kmAfjlWZly8A1xIN0Qo7q3OAMd+Gd23pz0EVEfSb4+rSs9jioh3qPjhP5s6QSsr4l/
         0IJrgU2j6mFqwOORYKQrw3H6L6zlpU+vnr6LEzCbCExZR9o+gIDc4o61FylO8GDIXLB2
         /OX0CIVLI1JvClCnp0Qg+e/kQ7gG/C9eVla1r/ziqSlcRhA/VMiL2KvcnkJKFKZJTGjP
         wo8BIxDihr68e5iCE513zgM4yeyEFN6o3cKu7i6Nezp/llkb3FMjho1snNidh+5JvXTQ
         MvVGuYCETceCe9jBBXqycQ5DLWAra3JeVjR7plAnmS6YCQMJOvy/HfXaKoft/709dqRC
         ViqQ==
X-Gm-Message-State: AOAM531IiD8OnD82RLdE4x2sDVsU3jx/oSmspPxJXxuXcHyyEf0eSYeS
        C9hpzuXBftrXpsHivZrmldY=
X-Google-Smtp-Source: ABdhPJx/ACEOBEfmZTXAcFQSWohX6lKYmcC6JhEjsNcjX5sQ25KOGTDPXA5b26qqTG/e+l2UsDh+NQ==
X-Received: by 2002:a7b:c188:: with SMTP id y8mr14869752wmi.174.1629394014372;
        Thu, 19 Aug 2021 10:26:54 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id s141sm2968005wme.6.2021.08.19.10.26.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Aug 2021 10:26:53 -0700 (PDT)
Date:   Thu, 19 Aug 2021 19:26:52 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Colin King <colin.king@canonical.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH] memory: tegra: make the array list static const, makes
 object smaller
Message-ID: <YR6UXM7QXEBGGqLK@orome.fritz.box>
References: <20210819133155.10441-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="1FRMoKE3dAd72QSM"
Content-Disposition: inline
In-Reply-To: <20210819133155.10441-1-colin.king@canonical.com>
User-Agent: Mutt/2.1.1 (e2a89abc) (2021-07-12)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--1FRMoKE3dAd72QSM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 19, 2021 at 02:31:55PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>=20
> Don't populate the array list on the stack but instead it
> static const. Makes the object code smaller by 110 bytes:
>=20
> Before:
>    text    data     bss     dec     hex filename
>   37713   21992      64   59769    e979 .../tegra/tegra210-emc-cc-r21021.o
>=20
> After:
>    text    data     bss     dec     hex filename
>   37539   22056      64   59659    e90b .../tegra/tegra210-emc-cc-r21021.o
>=20
> (gcc version 10.3.0)
>=20
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/memory/tegra/tegra210-emc-cc-r21021.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Wow, didn't think this was going to save us 110 bytes. Nice one!

Acked-by: Thierry Reding <treding@nvidia.com>

--1FRMoKE3dAd72QSM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmEelFwACgkQ3SOs138+
s6EtiQ/+PRW3IczZwEf01/WL6npwB+KWyu6/aa59MqPgwKSgLXkAKRkHYvjzsBu3
hZZ7Qbik/IIH2SjtCy8VOYj+gV5pBfUedOLFaxxIhlWjxzE6fNtlVdixOOlSzWeS
xf7rjpWWBfMppuiRiUa7wLX0KqZls9sDQHde2GOrn0KJG7NkSCs4KnhfZ9qssInp
b8ruwvuWUD3heMJtPCSHGB18g83lZXLK42F6ENO7zJGntCta14lOrsVCFIog5CTa
29p4UKJ1z+iQKhqS0ObJjZZ3PmkIYYjiC9Dn8OJuE/t+qqWWSXuB6r/Vh7KNQt76
3Wu7Cxg5wDBC2K6esa3PWzfRCbAf+lMx65q3dwOsEbzDbGdGmL6qQlbbTQFCmBhW
66Mw7QTGV1tb/Zhie1x8DcChbjKMKfE4DGOwz7XTWa3EoSk0tptp6J6ZTZCL9YVk
i0aJbBZpgtHM90VrHLrnf1HVxMeGLgU7wCUfYt6fKU3+hvCvb6r+NDhnYmQagvoH
tEpadwAmDa0Q8x4iglqKwxA67+tDIKZ8MpMBmwv4OYJ/X3OZm3VQT83qk75qGnx6
w6GDFW83VzJAOYF1xLTBceZ/GCYO9Upvlo4n7nxs01BzT3IllQELj/VgkmC/O6sg
rD9kHMOlQJMhIx0hAbcd3LLx0b2FJk04gXgEkQhXKEVsa4so2Ko=
=uw+z
-----END PGP SIGNATURE-----

--1FRMoKE3dAd72QSM--
