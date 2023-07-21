Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA5BAEB64DC
	for <linux-tegra@archiver.kernel.org>; Fri, 21 Jul 2023 12:56:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229708AbjGUM4f (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 21 Jul 2023 08:56:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229681AbjGUM4e (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 21 Jul 2023 08:56:34 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FEBB10D2
        for <linux-tegra@vger.kernel.org>; Fri, 21 Jul 2023 05:56:33 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-991c786369cso299237766b.1
        for <linux-tegra@vger.kernel.org>; Fri, 21 Jul 2023 05:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689944191; x=1690548991;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pV//3a53pXbcLX5hjSf0zdNBLVMsBKyWclJB7FhFeEs=;
        b=OWTPoqmzptvReNSnsPYUNtP6w1E6S6ieHy2Oz1h1r2ySeezWSpd0pzeIJC31/jNTYq
         pw8nPva/j+duPpT1YpNsfdkizQn1EbMPfUOkMqVm5XUHmFbt49b39elA4cv4jBZim4+T
         0vYbYP7kyN943wmVWE3dvCBpTPattVhGZUWgYKH0D7GSooCXHTW011BezaRoQNfAnYCE
         xMDQ/SSBRhaFI8vDaYl9c38qTokDXdZFLis34+m1dztJuBUyDk9wfmRq/ISlhX4YF+V0
         E8zyZWl5TZBdKlGUTqr4Ov3hT4PfVmENzoReRxtlyRzGWV+h1WY1nqYyGmq/b+3ThtDF
         z1eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689944191; x=1690548991;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pV//3a53pXbcLX5hjSf0zdNBLVMsBKyWclJB7FhFeEs=;
        b=DQnc/9i4UcjMslnNpDtZk2eLBz9oqbtUhDIQCPymsfuQONy3AouiYzA9e+zH56NJyy
         qi2NkvUGVlkhgyYZrqs6NHUuo/PhuUKkpcP/nXBwH7DqRK+nuwNLvp7vlTtsq6YZUzuS
         +oweoeUgG1Hm/LUL7g4lptib7MqONooIcm1aMfoN8UUrXoivVRPlW4CefNZz3qsutXXv
         hTAFLe0slzJF4fmNi15bGIl5tCJoo7tg8RUSObiSnIhp6J/gDUtSK8ij41AoBMAGNsCG
         TnWSp4MOPE9/mn7OTnaxqY+AXKWoMeuEFplJBbbjzkYg1+PuvOw9cRxFYhvleUBxfCPh
         8JAw==
X-Gm-Message-State: ABy/qLb6b8UuVhL6fN2Bcwl8EiQ08g1l/3rMK2StWjfks1nje1SIRz7r
        L3pecZxlVuM+MRZ7IZhjdksGxsCgv3c=
X-Google-Smtp-Source: APBJJlFjJsePS+dysQCZlT7XY7mOOad30ul06lqb/YXm26xlUgBbF2HoOrD23ol5CCA4LLYwXFAQ6w==
X-Received: by 2002:a17:906:53cd:b0:992:4250:545b with SMTP id p13-20020a17090653cd00b009924250545bmr1582238ejo.47.1689944191362;
        Fri, 21 Jul 2023 05:56:31 -0700 (PDT)
Received: from orome (p200300e41f1bd600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1b:d600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id p18-20020a1709061b5200b0099236e3f270sm2153740ejg.58.2023.07.21.05.56.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jul 2023 05:56:30 -0700 (PDT)
Date:   Fri, 21 Jul 2023 14:56:29 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Yi-Wei Wang <yiweiw@nvidia.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH] arm64: tegra: Add =?utf-8?Q?35?= =?utf-8?B?wrBD?= trip
 point for Jetson Orin NX/Nano
Message-ID: <ZLqAfb0uTycy3vVd@orome>
References: <20230717163037.1033429-1-thierry.reding@gmail.com>
 <DM6PR12MB5698F386CB76C29D3EE24D24B438A@DM6PR12MB5698.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="qC+ipCQaaRlrAsL6"
Content-Disposition: inline
In-Reply-To: <DM6PR12MB5698F386CB76C29D3EE24D24B438A@DM6PR12MB5698.namprd12.prod.outlook.com>
User-Agent: Mutt/2.2.10 (2023-03-25)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--qC+ipCQaaRlrAsL6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 18, 2023 at 04:26:10AM +0000, Yi-Wei Wang wrote:
> Hi Thierry,
>=20
> The patch looks good to me.

I've turned that into a Reviewed-by. Please see the kernel documentation
here (Documentation/process/submitting-patches.rst) for how to use
these. In a nutshell: if you respond with a Reviewed-by: line, several
of the tools that maintainers use can pick that up automatically during
patch application and simplify that task.

Also, don't top-post. The above document also goes into the details
about how to properly reply.

Thierry

--qC+ipCQaaRlrAsL6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmS6gH0ACgkQ3SOs138+
s6FuAQ/+JwMYF4L5Tx8x7TuQwYkWjsvCiRT7+r2jmX4GjeSw4CAKuXahDvdkQsFj
TKLZdXhW9YHwdZTbvHJGKaV5qunAHYU09j/pRkqlyhbbrczm+jPLK9HkWZdfpWzX
TzDZI6GpkRCxwFEGY6MeLERrK50jJUOu8/zfNJccQ5TOn6oRX4HChg3FJB91hO6n
KZj4cg1K2WGxGR0e1hmhU+7davBSrKG3qwHiD8koHLpxHGXosLf/MQEs3gazhshy
5ijNihlPFySkz8VHT23LFbOm//+4kA9C+sNdx+Y0e+i+jSwwgtkQNKf8Ob+2uQFh
QFo+n1owUi89o2DHxiY8Jd3i2bAx4GD6lAx2KXZlxMuQEUBYNUvTWf94tdaJep9m
eOqLBM8s9lSv5ee1cCkHKdNMxbTVQO2w/rTxjsCfWHQPhYJ2EYun/w6J6kctfJdI
KdUKg/ICYIzdEc1Z0qnkdHIBIUw6O+TMJRsucuJWy8wB55w20aZ44TquTR8tcFq4
+v4s09yJox2atCXi+jHqeUkOq4QpCfmyEVjJArthG+hO2Z6n1N/KGR/ZBbocZvxA
1Kf02LLPJWqqKe8DMKYKAGXJkG5ZI8ebBTsrJGS74lymUTxVEsqcvpZozl677f98
PeZws7YUjcl4J1+oycvund+cWmUH+mVWpW/QVzV0zFZu8dc6yDY=
=3LqQ
-----END PGP SIGNATURE-----

--qC+ipCQaaRlrAsL6--
