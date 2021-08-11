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
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB6AAC4338F
	for <linux-tegra@archiver.kernel.org>; Wed, 11 Aug 2021 10:08:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 929C4601FD
	for <linux-tegra@archiver.kernel.org>; Wed, 11 Aug 2021 10:08:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237019AbhHKKI2 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 11 Aug 2021 06:08:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237000AbhHKKIV (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 11 Aug 2021 06:08:21 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3432C0613D3;
        Wed, 11 Aug 2021 03:07:44 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id k29so2243257wrd.7;
        Wed, 11 Aug 2021 03:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=S4hqVy65+RqdfbEZFzhI05OrdFqRKRNyS+UZZ1UKMEg=;
        b=DSk7KF/Hl604HiNkXJunPo3CQy2Q1GXLXmaxkFOpFpfyogVuakMRIJkzTx7wNzEXQi
         tuWqU9R2dmjFKEvtpmLNk7IcEqribvixcmM3zyL5GztluQpAsAmMWeatkJX+Q7Dp6dIw
         w0BdI/9xWYSiKsKF+9UFifL9dB/7s6yvf7sYoFDZeRvzGs5VsAbkR0KeGd9FjOsdDokZ
         RAnpSqUOL6eKnsD0qwr5VXSW17TuehdizEsm+fIHYFT9QVN8fJ/3kZXzMo2z1U03JVJy
         vAWZQA3g4eIKfDRGkX4e9A6GaelxqWN9VxDgZihRRvWRlDkkek35kHMYynbLIpeb6kaU
         CrKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=S4hqVy65+RqdfbEZFzhI05OrdFqRKRNyS+UZZ1UKMEg=;
        b=KuXpkjhHQpxFT49Q0EfIH8eVJ7yKvwCJt3R570R1ESWK8mAC35/e3DvQEp21QZPbV1
         UepmeTEK5zYUx1bVUcZUJtl85A/wHE6EJAdBnU247AwDWOkuJuqUhr+QPQC7OdKZkQJp
         8Q+88h/Mq6giprYoNBiRNC07DSFiGWwNDskecvMJp0r8Sr2pIlFACM0Qt4zXrDmZKeXy
         o+BWIwlQ8TDFWJvhiwtEaq4RYNlikNnMeNS+npEhrM2ahZ+QucXJ7+ePVmdVBw+77Uwz
         5wEbuJtZN507YZ7Gk470ZINPftOGxl3xmp8RwLS2wOLb0KH7+x4c9Zm6vk7kI1U7T8h+
         bINQ==
X-Gm-Message-State: AOAM531MoacFkvy9zWHeMpwxmcIQFPXdRqIow3sHgjs+wIGyZgdjivNO
        HI3u7Psh7g4rjlEiTxndcyo=
X-Google-Smtp-Source: ABdhPJwwUVKorzNJ9hasthKW2Q2CRca/WuAZIJBYk/7Bwo1tYUVM9Jyi0oOZpUPOAyxVUUtWTJrCxw==
X-Received: by 2002:a5d:51cd:: with SMTP id n13mr34902882wrv.185.1628676463339;
        Wed, 11 Aug 2021 03:07:43 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id u6sm11570356wrp.83.2021.08.11.03.07.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Aug 2021 03:07:42 -0700 (PDT)
Date:   Wed, 11 Aug 2021 12:10:07 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v1 1/1] arm64: tegra194: p2888: Correct interrupt trigger
 type of temperature sensor
Message-ID: <YROh/29zpIVH9AkL@orome.fritz.box>
References: <20210711234939.28103-1-digetx@gmail.com>
 <20210711234939.28103-2-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="x2Da+L5daCTg3cgs"
Content-Disposition: inline
In-Reply-To: <20210711234939.28103-2-digetx@gmail.com>
User-Agent: Mutt/2.1.1 (e2a89abc) (2021-07-12)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--x2Da+L5daCTg3cgs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 12, 2021 at 02:49:39AM +0300, Dmitry Osipenko wrote:
> The LM90 temperature sensor should use edge-triggered interrupt because
> LM90 hardware doesn't deassert interrupt line until temperature is back
> to normal state, which results in interrupt storm. Correct the interrupt
> trigger type.
>=20
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

Thierry

--x2Da+L5daCTg3cgs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmETof8ACgkQ3SOs138+
s6FiBQ/+OxPxWNCs+D7wXQH4ICkuZ3JEOHMQvs2A58mATxCL3poGIdFx+1u9AWJg
3EEg8EGkuBDJhlRoYqyJhej52+xH9Zs5XAhn1aeemSr2gerwVPn2GURgvfFUH5by
9roYnl80UDhzEY0tfxblnYxgI8vtM0HWwbo2PLEDuKoFi7Xil/AgGUBOYiYD22cc
Qvn5AI0gv5+Kj1aosjaE1Pg1KBsB8IiEpI7hrAmWDIFEjjBR8xXkbZ5lHSpWeTA5
edWTYKAn+nS45DNUj3AL8paV6wtqZ+8xuCMD00TWUjIInsg8Z/w0lxzutv/mrYjS
oLHWLYESlIY77SngrAUrzZMs9SJXM54YMkFHHCbY9puub9m8+dHTpn6Df8bGR135
/Iz2TkcdcQ7QLrJY9zvueUjmAWpNddYhosjDM8YuD1rGVYTbq7AC9cOgRsj35nHi
VBKUwfIIEh1iDMpIL8cPJP8IpBnOV6OeawE0tnuX9A7+cbbwkghX7jHP65y2oDVo
reNb0CnJR8uEBqfXdtFZbyLh9QV7dbh9rfVMQRFi8Q2MlXET46Q8N4wVlrKG7i5X
g02icVutpOVCDoc+6ugLuUUclukNC0Q0wFGikkcbMyH2pFWpOIN1ZLJ//3/oJBdD
4pUGCtQSemZo86rdQy6O45SdlwWhgtTz7KFGCXmJmK7jCbs/lD8=
=WzH2
-----END PGP SIGNATURE-----

--x2Da+L5daCTg3cgs--
