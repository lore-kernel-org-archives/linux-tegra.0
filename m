Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EABBC433C1
	for <linux-tegra@archiver.kernel.org>; Tue, 23 Mar 2021 16:59:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E6278619B4
	for <linux-tegra@archiver.kernel.org>; Tue, 23 Mar 2021 16:59:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233343AbhCWQ7C (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 23 Mar 2021 12:59:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233337AbhCWQ66 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 23 Mar 2021 12:58:58 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD0F6C061574
        for <linux-tegra@vger.kernel.org>; Tue, 23 Mar 2021 09:58:57 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id e14so10057698ejz.11
        for <linux-tegra@vger.kernel.org>; Tue, 23 Mar 2021 09:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=K8L3H/vAHTL3d60mdwS7q9gMIZNzPk9+XxjVTdimH1A=;
        b=keRDSq/wMC3PsDbyWWw3r/QpXWbtgGuSup7MR1ShEOngseb3aIG5pW576ETx4KlHGj
         VOMZJxpf3yFm57OIpK8DSSQBvK99vyZXyGcQ7221xBFWnW55j67b4Q0IJ2YlKdlu7AmZ
         DV22+KyoS1bREu3b8SqfwdSx7r/6OuNvALYN9yGA4+m8xWU6I6nFHOBMOolLFDxp+p7s
         KyFsgt+/wUFkdiKm1P7VBkf4mWN4N4UszjGVajPGx+CUJXfSVQnzn7ndnL+G0cvxYktA
         wKdqtB5K0Cd3X7yrAhABsGgQe6Ox16+cIMFoIdU/onD7Iyx8ciYn/i8/OlFcuKdWAzWw
         Ch6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=K8L3H/vAHTL3d60mdwS7q9gMIZNzPk9+XxjVTdimH1A=;
        b=a1qgZ/A+Uj/1F/Zwyj/5GMhMK6/Un8kgUHpnZGK541sLQJumthf23wV/ZdQ8eAgZ3+
         oAtMIsyynJ91oF8ubOAekyKJNc4oRTiQh+upRH0sSuYoRoDhbP4HX0wuacStHiPmyAkN
         93y4SrjwoiNf2SehI7aeGVi/XHZTwAOCqpb6Y318T0QhH0mp4ySVKZ2BZIb/m/VBZTMl
         EJtXo+IdDG/pdYkb7ZJdnzOjJXSeZySVFddc16sz2JMnjobP9nvEJhPnPM0jZEWuvJoX
         Xn6qXQcVyQd6pEyB394XU4ov19jTnpFAQD1jxc+hkTlthrgviX+HV9hGCZRq3PuwDJH6
         v7kw==
X-Gm-Message-State: AOAM53037ilSPyE8kuLfyNGj9MfYYPT1jveuOtg2fa+GcKSrtxvh9VeJ
        C9uVgMG/9tQicQtYONIlaYk=
X-Google-Smtp-Source: ABdhPJye6ayGRoSPhvIEgccHD345JkHxw/pxhWtCr+vHoywFF9DPsS2o3GvQKbDOZt69uK7GBqlZRA==
X-Received: by 2002:a17:906:53d7:: with SMTP id p23mr5928477ejo.140.1616518736691;
        Tue, 23 Mar 2021 09:58:56 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id si7sm11573652ejb.84.2021.03.23.09.58.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Mar 2021 09:58:55 -0700 (PDT)
Date:   Tue, 23 Mar 2021 17:59:16 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Mikko Perttunen <cyndis@kapsi.fi>,
        Mikko Perttunen <mperttunen@nvidia.com>, jonathanh@nvidia.com,
        airlied@linux.ie, daniel@ffwll.ch, linux-tegra@vger.kernel.org,
        dri-devel@lists.freedesktop.org, talho@nvidia.com,
        bhuntsman@nvidia.com
Subject: Re: [PATCH v5 19/21] drm/tegra: Implement new UAPI
Message-ID: <YFoeZGptRcu6sism@orome.fritz.box>
References: <20210111130019.3515669-1-mperttunen@nvidia.com>
 <20210111130019.3515669-20-mperttunen@nvidia.com>
 <YFnsQNiLg/5I/qKA@orome.fritz.box>
 <494e3858-5b29-0b44-f2eb-7a7cc16ff325@kapsi.fi>
 <2c557b45-f78c-5f49-7f9f-e84edacd4a08@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="WbMVpstfb2Nz7baa"
Content-Disposition: inline
In-Reply-To: <2c557b45-f78c-5f49-7f9f-e84edacd4a08@gmail.com>
User-Agent: Mutt/2.0.6 (98f8cb83) (2021-03-06)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--WbMVpstfb2Nz7baa
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 23, 2021 at 06:00:34PM +0300, Dmitry Osipenko wrote:
> 23.03.2021 17:43, Mikko Perttunen =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >>
> >> FWIW, I would've been fine with stashing all of this into drm.c as well
> >> since the rest of the UAPI is in that already. The churn in this patch
> >> is reasonably small, but it would've been even less if this was just a=
ll
> >> in drm.c.
> >=20
> > I think we shouldn't have the uapi in drm.c -- it just makes the file a
> > bit of a dumping ground. I think drm.c should have the code that relates
> > to initialization and initial registration with DRM.
>=20
> +1 drm.c is already very unmanageable / difficult to follow, it
> absolutely must be split up.

I guess this comes down to personal preference. I don't find it
difficult to navigate large files. On the contrary, I find it much more
challenging to navigate a code base spread over lots and lots of files.
I don't feel strongly about moving this code into a separate file,
though, but let's maybe compromise and leave it at that. No need to
split this out into 5 (or whatever it was) different tiny files that
the end result of this series seems to yield.

Thierry

--WbMVpstfb2Nz7baa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmBaHmQACgkQ3SOs138+
s6GLIQ/9E/66+bzKnF4xwqrC2Zve84Kgk623+q9adwsGhabCie9AVHQ1LM2Zg7RK
CbHQKFEK0zGjlGjIcRO9nb9AYOMPhmi6lDVeP4ROUqNIF5mQlc5TK4BzC7RNF3yw
uGnDuV3epV1xbC/lV9v6S66jRtlUwG01vSXZVx6VkqGEWHO0P17MKFnznhLBKC+m
2ygBG5jqzE+EeNufCDpMtBoRbKl2IkMACEAtw5XIvARS1t3HB2KkWBrmoIQEOfnI
AeW3CiwiF8VWoV3wsUp47CHaoXJsXG8llUxTNg6/5+jL4Jxt1LmkgQmh74k2enfa
xW+m0BwkuY+ResziT+s3TbOE21H9PonAea0xUbApnOwi84+xNAqxKGUpp4/KksXX
cfApwWR/uA2mVgPV0Yoj+cc2ols1kPkqOOj6idvYjKi5P51XHMEx14wYskoMSYZQ
/UwWo4UoOFO7LOjrXcGhYxi5UxXhWGYgZ4a4FTSoCfp0MAiSd+T+k5sGRNRYXoHK
BXF1r6BAujcDQzHn/gz5JKCIt6E4XWCEdeTkLRo7VJp2mQsJqOgkN9zqVi6yS312
ZDfa8XDVrXGiPxTCWlxL/2srS/+1b5UIb4qoEKYlRW0cJVe9THWYmYvUrNE4gzcz
sXOF2bXNS3oH6W049oFeOg3Ix3tld8cP/xL0PIx2M2LOG6YaChE=
=GtwR
-----END PGP SIGNATURE-----

--WbMVpstfb2Nz7baa--
