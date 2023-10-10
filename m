Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AA53CD8CA5
	for <linux-tegra@archiver.kernel.org>; Tue, 10 Oct 2023 15:33:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232740AbjJJPdK (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 10 Oct 2023 11:33:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230448AbjJJPdJ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 10 Oct 2023 11:33:09 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDCAB97
        for <linux-tegra@vger.kernel.org>; Tue, 10 Oct 2023 08:33:07 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-99c1c66876aso1053610366b.2
        for <linux-tegra@vger.kernel.org>; Tue, 10 Oct 2023 08:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696951986; x=1697556786; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uA30MYl9QHPBHFzDvcPwyw2o41gOUerdhZVk4I6+4pw=;
        b=D1X3PsAGnlSGmAEggOpa9rwY6n7sj6LejPU5HceWggn1d48HHdZtW1XRxWPfPMezan
         g0TOE2jlHiML8vQUwajmRlbB+7wZWPog1f3ROWdnPzNi/UWUYym6yFv1OO+chM8tskxC
         M66p6QowUEVo3mcKsf5SGXwkaGvlm89iz+w+h4coyrs5xdu6CTmXsuQjJNorzaOG59n6
         TzDDr/pTrvQ7oxaaXqFrHSx/adm8y8HqKAI7dYLxYpC51IDQgA1zRlH3ZUsGTZom3lf1
         c/MU6JWHS/tsNgGgdKQrB4biWP4mG1N1HM3oyFqiKkgxL0PQ6eCrV0kqt1ynxDQ4UahA
         BHxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696951986; x=1697556786;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uA30MYl9QHPBHFzDvcPwyw2o41gOUerdhZVk4I6+4pw=;
        b=K4YcEkm9eSa+70JOjVpZ4ge49ID3nMpj5JMXOdYstro4Zn1hFzvy9LdVRkX5d6AUvV
         Z98cbGFdxBmHItNTHvMLAyrQFOZ40UMq2s3R2VAPQq4RDFAJrwqtiUaRXa/GPh444II3
         EC+uu9XOqp6GRoHmXH7mYazmDpuPaWw9wxaMP3P4N0SIXNgjmr9J/6LbmbMVItdTxadk
         8fx5Cp9ZZKv2Izd5qh7CrLNLTJmddDMk3Srn4EMALg1cwdxQY2x90yHun8D3crWPmf8Z
         jIH6uDVaBSwCQckpqx/ibb9DIQRTBmSwmnFurmN3ANI27meKELp5abSlQw3TQprGR+B6
         EuJQ==
X-Gm-Message-State: AOJu0YzMQOANyP7M9pa0OAnhAQMgPXujr79fjKFJMwQn4truxNx/VVyl
        c57wtEfG+WbJM3dqe8+dSzk=
X-Google-Smtp-Source: AGHT+IFdHuk7XbZCiSFl/ZQnmMM5FBKExgsZqn43R/kXm7e2RMTM9Xy02X8OMD7DuvpntTVJu5svYA==
X-Received: by 2002:a17:907:770c:b0:9b9:eb30:b5ea with SMTP id kw12-20020a170907770c00b009b9eb30b5eamr14797437ejc.31.1696951985967;
        Tue, 10 Oct 2023 08:33:05 -0700 (PDT)
Received: from orome.fritz.box (p200300e41f3f4900f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f3f:4900:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id p26-20020a1709060dda00b0098921e1b064sm8611133eji.181.2023.10.10.08.33.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 08:33:05 -0700 (PDT)
Date:   Tue, 10 Oct 2023 17:33:03 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Yue Haibing <yuehaibing@huawei.com>
Cc:     mperttunen@nvidia.com, airlied@gmail.com, daniel@ffwll.ch,
        jonathanh@nvidia.com, tzimmermann@suse.de,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH -next] drm/tegra: Remove two unused function declarations
Message-ID: <ZSVur4CNQD3woL0o@orome.fritz.box>
References: <20230809030226.3412-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="g8HowzIengH1BfT5"
Content-Disposition: inline
In-Reply-To: <20230809030226.3412-1-yuehaibing@huawei.com>
User-Agent: Mutt/2.2.12 (2023-09-09)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--g8HowzIengH1BfT5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 09, 2023 at 11:02:26AM +0800, Yue Haibing wrote:
> Commit 776dc3840367 ("drm/tegra: Move subdevice infrastructure to host1x")
> removed the implementation but not the declaration.
>=20
> Signed-off-by: Yue Haibing <yuehaibing@huawei.com>
> ---
>  drivers/gpu/drm/tegra/drm.h | 3 ---
>  1 file changed, 3 deletions(-)

Applied, thanks.

Thierry

--g8HowzIengH1BfT5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmUlbq8ACgkQ3SOs138+
s6GTsBAAvV1qiOB/3BT01lO45vvHM0fJ41zlyp8bXQhNreL832hpVqmrSpotDNU7
ScPX8DteFgnRjvfa+oSbHs6Y4khC1FrdNSwqdcSG6LfltGFBMVDnhrEPmWmHX+pR
rGhd5MwCtg93BHAcYmuahwyTIj15INWAagxSs4JZ6MsUQRsTDDGdwm90v0gWMqmW
kNLeV2eMeKiQ7GLWpke3iXEXF+hM5x5CVcZadtJngNa7gdDCMak1OrSrt1OhKwnr
gDjY1cyusBKdgBE5+gCK9hZcf3vgCt84B6Ly4FNdah5kXZrwgzi4/2EBFDpZy3FU
d+iLrc0ykdAl7OMdXai1r9O6vvu4MQlt6q9WKJbrf0EUVTpA2SGdXGeII1mSMHnb
rXo2U7JwnkN3TTaYaGd/04ugxTAi0z+ec7M4AF4fQdyoE648Iz7VZ6KO3yYWV+Jk
h93AhLrbB1MXu5NTqrh3C0pe0fBjXYd4LLZCG4N9+cbCGFPWhmUm52n2vR+l5RxG
lXIcuwjr7tghwlnU9t4+TD8IfeNOl6a+YZJMsy9suZjBxbH4guPqvgoQkrSgVbUP
GkhTXEBG9mKqfcKWaexmkWBRBDdFD/DyW4yfOJtoM9uKrzGKsR5U5ZXXhjiQQU5I
Aiw4sbt7KIGvlRlAcBiwkck/7AbD8ZbiExFrt82RKZJGqB3IEd0=
=j69Z
-----END PGP SIGNATURE-----

--g8HowzIengH1BfT5--
