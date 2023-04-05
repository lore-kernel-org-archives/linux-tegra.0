Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51F38C7619A
	for <linux-tegra@archiver.kernel.org>; Wed,  5 Apr 2023 12:05:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230012AbjDEMFq (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 5 Apr 2023 08:05:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230520AbjDEMFp (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 5 Apr 2023 08:05:45 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AA0440E0
        for <linux-tegra@vger.kernel.org>; Wed,  5 Apr 2023 05:05:44 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id p34so20740039wms.3
        for <linux-tegra@vger.kernel.org>; Wed, 05 Apr 2023 05:05:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680696342;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U7o16sV0+j5SKfvLRCYs9MgIMFY2vBEusoWoaW5wCYk=;
        b=m3hk2npbzksJ4HoJXV7pSeO3qV+eA53TVobT2V4rqEKp2hgMSs0VpwMZBz6ywOZGm8
         gGaqCui39/OpX2BAy8OgrvhgsFnJCKGFgjnrVvZtkjyQpx4W9WpiHuVREBM+k4lv2RVw
         vLWIrbORH7x8KUjLWZWuJ5SsRaviK2t8D1DB3aytqFyyQOIkCKItCDUkAYZDN4ONdEzX
         o3tkTz9SGTWmwZcj8TlBhMRSAx6NWL18ZgNT949tu/5ua2A9ET2uMABwWOAvH+xi1dTQ
         ZzhNjyXAbfhBDzIbDWNZIjG+7TziTYAH1LEj0lJYVxkbar3os6ZXdhFnv4XVLNgFtTdx
         QyGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680696342;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U7o16sV0+j5SKfvLRCYs9MgIMFY2vBEusoWoaW5wCYk=;
        b=azAKTb7FYgJWPfdpImSiXFWhZY/9YLPMX1YVcU+3rROtKU1NNM/BoktbWsFYH5+zqI
         t4QKA4Buetah/4iPvAGbYR87ezEHV1Grg1uQiI/HJ2vlKUYzYMorPyohdrfUcCoDEPkv
         ZjqzdBXYPPsM9Z2TfTRr0mwm3pR7FVUiSEk/Rf8vr91Rd17yS7B1+BjY8ux8shW1gSZf
         KG2Ejlvom1j9013i7Avrt81I24eS6JIe8VGVS652H8QCnlPnzRLN1T7NAD+v3QImBxbu
         wAE2pz1iktcUg3SvtciOp3n/Nx0uyZUQeAFrS//+/WrqIwKTDZwBM4g0axoUu4wYvcwn
         paHA==
X-Gm-Message-State: AAQBX9dxfa3+wiUnyb22N67EUBWGo1rOyAeJqIhGipcmaSE+nsoNFdXZ
        lHjd6Cgdqi/IsLkgP3z5/as=
X-Google-Smtp-Source: AKy350YTdy7hUQ1TPqWHpvoq3Ro5lACy0nAxkomCc0u0QUnfb+mCqH+CmwWOWIfJ/09NhZStV/8fHA==
X-Received: by 2002:a05:600c:aca:b0:3ee:97c:58f4 with SMTP id c10-20020a05600c0aca00b003ee097c58f4mr1634685wmr.12.1680696342296;
        Wed, 05 Apr 2023 05:05:42 -0700 (PDT)
Received: from orome (p200300e41f1c0800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1c:800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id h9-20020a1ccc09000000b003ed1ff06faasm2011985wmb.19.2023.04.05.05.05.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Apr 2023 05:05:41 -0700 (PDT)
Date:   Wed, 5 Apr 2023 14:05:40 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Christian =?utf-8?B?S8O2bmln?= <ckoenig.leichtzumerken@gmail.com>
Cc:     treding@nvidia.com, linux-tegra@vger.kernel.org
Subject: Re: [PATCH] drm/tegra: fix another missing include
Message-ID: <ZC1kFMgpXlqVErTi@orome>
References: <20230405114443.113834-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="xCbwhukvcwOElukt"
Content-Disposition: inline
In-Reply-To: <20230405114443.113834-1-christian.koenig@amd.com>
User-Agent: Mutt/2.2.10 (2023-03-25)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--xCbwhukvcwOElukt
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 05, 2023 at 01:44:43PM +0200, Christian K=C3=B6nig wrote:
> Since tegra now compile tests on other platforms the kernel test robot
> started to complain that this here is not pulled in under all
> conditions.
>=20
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> Reported-by: kernel test robot <lkp@intel.com>
> Link: https://lore.kernel.org/oe-kbuild-all/202304050946.yGGTKkcr-lkp@int=
el.com/
> ---
>  drivers/gpu/drm/tegra/fb.c | 1 +
>  1 file changed, 1 insertion(+)

I had meant to bring this up in response to the other patch that you had
sent but then forgot. One of the sanity scripts I run complains that you
have different email addresses in the author and Signed-off-by: fields.
I already fixed that up for the original patch (I used the Signed-off-by
email for the author as well). Let me know if that's not how you want to
handle this.

May also be worth fixing up your setup so it doesn't generate these
conflicting entries.

Thierry

--xCbwhukvcwOElukt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmQtZBEACgkQ3SOs138+
s6HVVQ//TJOlfkMYC0+ZrAhlUZ44/P1UhOuSeks1hix7qN42HCMBfswHnMOFR4EG
gcAKxqEPhvZ0JBlMGFbj1DO4Q216VkuU21YLak5hUgKkTXH6TgFKtNlpnBgE8XlJ
wRj4oRddrZuBEApdYvVTdsUkloxxZfjn0dHKRfysl6TitE9rl/JHLQzC2QxLhpSD
DUxd2VLxOVtGX5lviBV9W0Ni7JpRqST8pVhEONwLhQPi011DN8AYUMIKay3Mzh77
4ox4cYRJLCeBLGy9UpxaycZ77UcbsbIUkXIQyFQnRSj4A1fa30R/A2EHi/YnEX+b
Ba7a+HEW3hnGWRNvYpsXFU//RFgBAMwPIyvL4nas3QgI/oESOdd9CLD4j9AEZP2A
FqPBPfFxFRpggZFYU35pfWAcprBXj7zHGxrAIRhgDKjj7LruWfSjepCuyHJkhCyK
YZaXojU41iaOD2Ije8jF0U7Nau3dVdnEUN68ikbImiqNID/ArjHww9VaE/3gWJ27
Q+GsfS4acp8DPwDlf87e1kKbS7tLT4Z9AqC9YV6ttvhJc/auOp4WGvSY71dFJlOV
j9C0nAQQ1AQ87XYOrMOaEDoB0vdRmDyZoGQOMN3jeZgdMb51sKdMTowtrZMxVCws
2T3ehr7inUZL73DFG8G5ExnEWnmsQDCEo4520IP2QTYjvDk0NpU=
=6JfS
-----END PGP SIGNATURE-----

--xCbwhukvcwOElukt--
