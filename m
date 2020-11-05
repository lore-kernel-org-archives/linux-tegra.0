Return-Path: <SRS0=4JQ8=EL=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71A0AC55179
	for <linux-tegra@archiver.kernel.org>; Thu,  5 Nov 2020 16:45:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 16E1320936
	for <linux-tegra@archiver.kernel.org>; Thu,  5 Nov 2020 16:45:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="vHRqOwZo"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731120AbgKEQpn (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 5 Nov 2020 11:45:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730504AbgKEQpm (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 5 Nov 2020 11:45:42 -0500
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A73B5C0613D2;
        Thu,  5 Nov 2020 08:45:42 -0800 (PST)
Received: by mail-ed1-x542.google.com with SMTP id k9so2240185edo.5;
        Thu, 05 Nov 2020 08:45:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=CoyVEhjU5+i65+RM5MA24dlJcWVZipl6JTaDi+RPIjA=;
        b=vHRqOwZoIMPJEdRIUfEm6A0SNzm3v9aEoMVU+lR1YRJ4VECDuDCgesjtek6nQefppP
         FB7eujDcSbEtiHnoeOFRpm38qCaffocq5PLTEA+Z1wxqLwhWRnA78MPE+s7+SxFcgkV8
         3CpJI+DeQmwMsERvjUaQIJsom24qXiikOBPkdQi2/FuwFQoltsKGzAwA1PSV2Ai7onxs
         oVqb7reyJCENcsWymvdE+dj0XxgN2bDckqMaT7dxIwGyrWt4Xum875h8J5X1vKHsSLCy
         tG5pJX2y95SyxWwJYP/EC6WZhZmUq8wAvO0aT0TO1C1eKLJv63HGrcytU8NCLNLlEeXP
         qoSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=CoyVEhjU5+i65+RM5MA24dlJcWVZipl6JTaDi+RPIjA=;
        b=mkaZErdiaEi9fMhb8L0lqGKSgormnFs9UgKokM5Oq2AL/VDxYs/plkragSdUTwR1u/
         venCE/ibBDHy/5NBqT2E9lJ2fhmK9+bFkNHDSSUaqS1OTDMjnQLMVFLJrLYRykf3RY1A
         GKe7D0tDY3oVC4UbJe35FPwzHeKW18LRcguEWgGTZ08CrsOJBDNKoO/O3dy4JthxFI3L
         RSWViFkvvF9nit+YTOL/Akr+gleCtufxo0BXhMaT5Kw5CAkF2UD9o5uZDOq8pissJ6vr
         bP0F2+y9QxSQeiIOYUefGIbe7B1s/Uwt4rB81IsIgohtFYqHUEmV91WJhF2VhBd1w5IJ
         7+lQ==
X-Gm-Message-State: AOAM532ItvzhLKmLZPckcS3jG62MRoaeveM4pXhbIhIn2SFM8nOdIi3A
        eowB4+YUednye2i6we3l6UM=
X-Google-Smtp-Source: ABdhPJyDxW7zujCRtV06rwzU0KrdHIuYIJHTTT6PD5zogl77WrCXNxfQoknZW9WEzB9+NEBaak27wQ==
X-Received: by 2002:a50:950e:: with SMTP id u14mr3469247eda.260.1604594741362;
        Thu, 05 Nov 2020 08:45:41 -0800 (PST)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id bt16sm1279390ejb.89.2020.11.05.08.45.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2020 08:45:40 -0800 (PST)
Date:   Thu, 5 Nov 2020 17:45:38 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH 01/19] gpu: host1x: bus: Add missing description for
 'driver'
Message-ID: <20201105164538.GE485884@ulmo>
References: <20201105144517.1826692-1-lee.jones@linaro.org>
 <20201105144517.1826692-2-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="a+b56+3nqLzpiR9O"
Content-Disposition: inline
In-Reply-To: <20201105144517.1826692-2-lee.jones@linaro.org>
User-Agent: Mutt/1.14.7 (2020-08-29)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--a+b56+3nqLzpiR9O
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 05, 2020 at 02:44:59PM +0000, Lee Jones wrote:
> Fixes the following W=3D1 kernel build warning(s):
>=20
>  drivers/gpu/host1x/bus.c:40: warning: Function parameter or member 'driv=
er' not described in 'host1x_subdev_add'
>=20
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-tegra@vger.kernel.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>  drivers/gpu/host1x/bus.c | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Thierry Reding <treding@nvidia.com>

--a+b56+3nqLzpiR9O
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl+kLDIACgkQ3SOs138+
s6FfwhAAs7WZQaGt1M9Mff4+rE8bZScWqbl3tzYINl6Z6D0Ghn9KEbM7mKpZBdTv
iRGkVIKdoSoLZukDA36rYSs5ModiN1tEGtD5XcDEe9tR6JzHbk8L9pE+F9R3Q0LH
c8DuKIXbXg8jkpvpvN864xOOIGjWPyNYnQa0DG7cq8KNSz6Uk9VOifD2Qngflrt4
LPZmHQr6hIyU1ULy0P/8Q2fF7fNoUcK5S5TtjpQRmBi7Rjyf5lEiBslQcvoltbJE
fS85N0+feF+Uv051TNeBf/B5XUaZ70aCBZui9nk09V68t8GywYWUpyLeQ4vV0NGi
XewL8VRfbpouUSVVPOBi6xTr7knXeFjqQc6uRFtwSMRefn2xPG1yt90/RWVhd29t
npT1GrWHVbAIsSflOs41ao8Un+PnzRlefNMX0NlKsuEdvKrv68FwPd7JOEkxvsGA
52oRD8BQQddLoeeJ+iDpKL8ZhVOi3zaw6WxrpNskn9pazDTZImHGP+Q14eLdsNWB
FQDGdvGsGBJ1/qeA6Ar8cgJvQwjTcVUmrgP0J38/RWfTjeyWrphOT5/PqGhKmSCP
ME7mQznU6rFsZvOCIzCNTRAoM/tRyuLMnHiKywaKsOFw1sVrvDvDiq1/w/WGxuUK
1hUN6UEDTbRHeqdlT/PVnqJVaAMDDDki1fBkDWTgL6K8Bcivwgc=
=sOvt
-----END PGP SIGNATURE-----

--a+b56+3nqLzpiR9O--
