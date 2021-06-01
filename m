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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B794C4708F
	for <linux-tegra@archiver.kernel.org>; Tue,  1 Jun 2021 15:06:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5AD5461375
	for <linux-tegra@archiver.kernel.org>; Tue,  1 Jun 2021 15:06:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234043AbhFAPHm (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 1 Jun 2021 11:07:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233797AbhFAPHl (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 1 Jun 2021 11:07:41 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D00EC061574
        for <linux-tegra@vger.kernel.org>; Tue,  1 Jun 2021 08:06:00 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id c5so3531482wrq.9
        for <linux-tegra@vger.kernel.org>; Tue, 01 Jun 2021 08:06:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=e8xNYfe1zvtxiEZOy0BS7QSXRXa9395+SNgTrtCae2I=;
        b=A3HWMKedUGBthqZfR1Thq0fPPAnr6/eTpJ9DEqgeK4MvJOUyrZJltfMtbKhpl4q6CU
         jEEcowG/3euqe1N1EbBBHkeSfCi86e3zsVAEBq6MNjdRFLhtSQJ9kpjxd2ALHJ1rKJsY
         hIx55QtIRku4x3s9VLKPHA7jEDtWyWs/6if96wE89mAbSiL+X7ErewmsHliHx6lm/dRe
         cQNxALuYzJccUma9uI5bt/wJSCv4I6imkU1alg2pX+v9YOQ4gkBfQS31b19Z4Spbw+01
         8yIg2KzYinqmGLoTqy83mIxd6uer5WoFpgEYmMolAcIQNPVVf/DjfEsuDFi51rgzQe0B
         Wdtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=e8xNYfe1zvtxiEZOy0BS7QSXRXa9395+SNgTrtCae2I=;
        b=Y6umKXr8+6nyy5OW7jPuX5ZGUmH16RYGKJJun7b/y2yLKXwBcy7VwvYnVV1Ca9YqPG
         ZhoPHBL95esoQGcUp/kl2GonKO6MrLe/rBDJjOPpLi0h4IJICbPXDubgq4/MbMqyR6PG
         hXKmoBNWTYqQVzWWLCi7KE8nzjmUWe1TsIk+y5L7fGvtjFdO1n3CIOgdJS5sxZ26uYkR
         UM9cThrAv/ZErimKsJYqaGtnVzRqYzJoUwF3s7iFVkiTUxf+iTXqOO8wpi4gtYyNgzaF
         pb3UT/j0dT2p+Zwu3E4nf9dojeTASDIs0q5MJOdBIAfQSn9e5n2r6ONryl7z5QS3z+Iy
         O9Hw==
X-Gm-Message-State: AOAM530CXchLIe6OMZ8gVIH3YMp+IEUw4wvE3irrCUmCIlu1IPUxc2a9
        /DrdvJV+MIbIInLHxwK6UoQ=
X-Google-Smtp-Source: ABdhPJynJhoGzcpgW41VVSF02TpW8SbAaJL1SqmyAr+/C2NfAPihcPMiW5wcy1EJ8RvHcPVTNJqfcA==
X-Received: by 2002:adf:f642:: with SMTP id x2mr27814406wrp.323.1622559958954;
        Tue, 01 Jun 2021 08:05:58 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id a16sm3380834wrw.62.2021.06.01.08.05.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jun 2021 08:05:57 -0700 (PDT)
Date:   Tue, 1 Jun 2021 17:07:33 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Zhen Lei <thunder.leizhen@huawei.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Timo Alho <talho@nvidia.com>,
        linux-tegra <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH 1/1] firmware: tegra: Fix error return code in
 tegra210_bpmp_init()
Message-ID: <YLZNNS1sPl9qbJVD@orome.fritz.box>
References: <20210513132646.6488-1-thunder.leizhen@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ygv5veh6S+Cfn5/o"
Content-Disposition: inline
In-Reply-To: <20210513132646.6488-1-thunder.leizhen@huawei.com>
User-Agent: Mutt/2.0.6 (98f8cb83) (2021-03-06)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--ygv5veh6S+Cfn5/o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 13, 2021 at 09:26:46PM +0800, Zhen Lei wrote:
> When call irq_get_irq_data() to get the IRQ's irq_data failed, an
> appropriate error code -ENOENT should be returned. However, we directly
> return 'err', which records the IRQ number instead of the error code.
>=20
> Fixes: 139251fc2208 ("firmware: tegra: add bpmp driver for Tegra210")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
> ---
>  drivers/firmware/tegra/bpmp-tegra210.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

Thierry

--ygv5veh6S+Cfn5/o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmC2TTUACgkQ3SOs138+
s6FbgA//bfh7mn3MPY3zPgUhvGoKMzg2HZOSYk23j5GURDnE2twcpNw20bRwg1S0
cNbavlX265iT/t1PKCbssdgFJ+xu7wyCJO5OnG8HpOttglcy6rPoTkikiEw8idR1
iyWczYf9BzaBZJqHRnas4eekyfa0dtB5b2veqfY0Zy7fm+2cNRYC2zLs77FXAvVC
WR/dQOXXjV/wMPcZoUd1p9CUw30AUQW+uT5MdWKaa6m1LA3CpDD5n6Grbf6gHird
ff65tzQItiqXyVnbEXcIu5+X512W9roEIq0eNCQ+vcKj8K+Pk7gSWNVH3L2MeCDw
W7YHYZ/MZ+oU3ORlAWLQJAP5Ecramvmw//loeC2Tl6G2De3RV2qtnlMSbFUW7hvl
mCaJBdZNVpacgESXayPzLGTXXc4NOZtYb6kmCC4sZ4m03CHSI6jilPWuJ5Yk3zLk
UvKG93FkNsHHN4ibBAq3DZyE0c4GHtJ4DBm3KBKlhG2TNC6rI8klxC+OcDBkKoaj
JPkLLFt07U0H+mSQucCgx7nwHurHUJ7SePiIQto1TVoqia32TPaL1ksVBuffkRp1
9e3ebeyBGlGPxygD3d9e1Mep8GKvBf2YYzxB3PHsXyhSvTVfilDZI7ItUasqzdo5
xsd6od933k+UQpYEjn3UQs+VYo8BxSPQwgPBTsDpTS2p3qBbyR8=
=gc9i
-----END PGP SIGNATURE-----

--ygv5veh6S+Cfn5/o--
