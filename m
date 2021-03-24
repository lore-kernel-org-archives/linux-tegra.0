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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A659C433E2
	for <linux-tegra@archiver.kernel.org>; Wed, 24 Mar 2021 15:12:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 22CE261A06
	for <linux-tegra@archiver.kernel.org>; Wed, 24 Mar 2021 15:12:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236533AbhCXPMK (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 24 Mar 2021 11:12:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236389AbhCXPLj (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 24 Mar 2021 11:11:39 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B05B0C061763;
        Wed, 24 Mar 2021 08:11:38 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id n11-20020a05600c4f8bb029010e5cf86347so2873214wmq.1;
        Wed, 24 Mar 2021 08:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=z4p3vHZQ3Tj4AiX2hVTVq/N76V7KOiL8+qVlKJubE9c=;
        b=s4Ez85pGm/rHUmQoAr9UrTP8ApfIrWGS54ZFzQ1KhYOgttbhLOeO+TPmiD8HqtjaL8
         JFy7nMFBh2v88frePDCzHSQAO4iskUA9JOsu4ZwUyuAuX9MhVmft/Umvg3gw8PZVZIga
         jKFKC0nPq3GTi4ubU03TkrEo8fauQuXnxWB1QZELCfVb8x1JRBm205S2xu6NBRFt2woa
         JOCU9xsTJNtWfyIodtGdPkFDdgIaj1pECwiGFjq8n0kBFKKhFo6nl8Nhz5ZA2EjnNojS
         7s8EUTWPm9CtV0ILXlcCKguC56ftYLDD5rko6sUrDtan4aXpZX8qQcY2QIzN+u8dCjku
         K6Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=z4p3vHZQ3Tj4AiX2hVTVq/N76V7KOiL8+qVlKJubE9c=;
        b=Jn7wI6EImUE6YN4PqPVfZRWslZW2b4KRcwWOlbqAGqO1JH5EkGuA+Rk1SY4Z9Dn+3H
         qmKCkJ0PjsLusZXmqqqajTIMLLYsYQjuAI28/X1JmcBy6ICq1Ms4Sb3mFnRt0MSzmtg8
         nM8vZoP2lP0jfpwgsSZr6MP9E7XxgB88AG2c7Yfw858nysfII5ITfCTB1Y+hNyP6jhzQ
         rWE9iqkDDpIPqhfXH1rMld6BJZDIhS0UzqvjsEytoUKAT/oTnszIwEDsa6WrGoz17sim
         d666k0GAfPUNlPQ29IHX7sZgcN8xANu9fPd0psbywtsbHO0Tqco4kFUvxOIntNUoasdf
         cQ9g==
X-Gm-Message-State: AOAM532gPbx4BJMVPqY3Zk5ReRWzYkUAW+EnParIeAyX3NqPAosNTmC9
        sPYSqzLGFvhz6bfufJb/xQ8=
X-Google-Smtp-Source: ABdhPJzR3UVTi5XYV7fuz3v6FFA7k4mLWWEXv0ZSbuRcG/mvJHEtttiUUfxInTkRxT7I/49QES9XvA==
X-Received: by 2002:a05:600c:247:: with SMTP id 7mr3417562wmj.116.1616598697463;
        Wed, 24 Mar 2021 08:11:37 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id n1sm3890515wro.36.2021.03.24.08.11.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 08:11:33 -0700 (PDT)
Date:   Wed, 24 Mar 2021 16:11:54 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Peter Geis <pgwipeout@gmail.com>, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 09/14] ARM: tegra: acer-a500: Rename avdd to vdda of
 touchscreen node
Message-ID: <YFtWuoV4/Kiilbzb@orome.fritz.box>
References: <20210302121003.15058-1-digetx@gmail.com>
 <20210302121003.15058-10-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="6r+g3d7uHD8PKVGy"
Content-Disposition: inline
In-Reply-To: <20210302121003.15058-10-digetx@gmail.com>
User-Agent: Mutt/2.0.6 (98f8cb83) (2021-03-06)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--6r+g3d7uHD8PKVGy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 02, 2021 at 03:09:58PM +0300, Dmitry Osipenko wrote:
> Rename avdd supply to vdda of the touchscreen node. The old supply name
> was incorrect.
>=20
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  arch/arm/boot/dts/tegra20-acer-a500-picasso.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

This one didn't apply cleanly, but applying it manually was fine...
>=20
> diff --git a/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts b/arch/arm/b=
oot/dts/tegra20-acer-a500-picasso.dts
> index 8a98e4a9d994..d852527db707 100644
> --- a/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts
> +++ b/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts
> @@ -449,7 +449,7 @@ touchscreen@4c {
> =20
>  			reset-gpios =3D <&gpio TEGRA_GPIO(Q, 7) GPIO_ACTIVE_LOW>;
> =20
> -			avdd-supply =3D <&vdd_3v3_sys>;
> +			vdda-supply =3D <&vdd_3v3_sys>;
>  			vdd-supply  =3D <&vdd_3v3_sys>;
> =20
>  			atmel,wakeup-method =3D <ATMEL_MXT_WAKEUP_I2C_SCL>;

Looks like this line is not upstream. Did I miss a patch somewhere?

Thierry

--6r+g3d7uHD8PKVGy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmBbVroACgkQ3SOs138+
s6E0GQ//anwHjaXANQk1Vxctd19eq+qoRSe/IQvGFkdDbqDpuAGfGiB29cIcwuCy
hWlhXa3N0XvcEYNxJDQXWZxGrlLzsenRrkH+ldjlWS95UU0gRO3Hj4qtqHuvDzJf
71J+cESj9FIyn5uC/pkYp0uA/s73twRZyA+CwLodZ1WJOAe2RyYi2yHgsUjnMLsx
sSGZAUMVZ8y78BsSW9sUb1HTM7hqVzG2SaJw2H+ZnLZs344VRCV3ayLesTs5CcEH
X6WjegYetYbBNgWhhOlTORaFjBf/3HP6RHiRVpzgTH77RHFes/BYBw46bfZO52S0
+wiFkmPZQ2dCSH8uIQv9syrgagpxT6zacBVoeGFFEEyfZeul2tob7tMxkqDKJOnA
eg6gD+sY824CoewojeVDDV7Enx2lkUaPQq83Q6UQmjAnBhW0rRwbS36adZiUqnAf
PrCAn+xjwCj9fT/wMlY9jIE58g0KG1i8cTasHP9nL+7Ue39y3psD0mueapqOx3WQ
RGgUC+dfTBUTrwgCuWMjdVIfU/p/68AVPJimwlG1PVTBBbAAm9yQ6Eg+5gG26tBK
YuD43H93JroieuPUMbaAia0g5JyBTX9OIkBqP4iJ2f4Dq1x0uvt5xCkLYjMoJxtM
qw5kSIxhEw6McGe5tkcjaJh+i3o9+rTDJ8ZdAME2a9W1bXhXQA4=
=HOWm
-----END PGP SIGNATURE-----

--6r+g3d7uHD8PKVGy--
