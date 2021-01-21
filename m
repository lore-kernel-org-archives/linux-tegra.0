Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86CDDC4332E
	for <linux-tegra@archiver.kernel.org>; Thu, 21 Jan 2021 19:18:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 57C2F23A03
	for <linux-tegra@archiver.kernel.org>; Thu, 21 Jan 2021 19:18:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727019AbhAUTQ4 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 21 Jan 2021 14:16:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727145AbhAUTOy (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 21 Jan 2021 14:14:54 -0500
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADD59C061793;
        Thu, 21 Jan 2021 11:00:37 -0800 (PST)
Received: by mail-wm1-x32b.google.com with SMTP id v184so2432105wma.1;
        Thu, 21 Jan 2021 11:00:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=K17Qb/xqJhqemGjS6kTuTL7FFWSJ4l9BP89RSwHWF5E=;
        b=ZScCF4q9ohNh1JUkk8uuqWZ8Rq8ZDBqMV4uqim51MRtN3L7wr3V5GXWe1UNAYrx2NG
         iWmT1UHRYeligQF9mMqPe9M53d9xPFG+//3VSwFpP4c2jf02Tv0o2JT7Z77Ob6k/ykDl
         /heJDcYuDSC6yzwfzCc1eVsvo5h1hSd/2Un1NJqGuFWtatvhU+lFIBXs7Ulcn0JXeX//
         9I2T7wSnyah9yUWZ2VAynfXdFz7BuCXj4C3O6T68Imgxg+RsTItetkWotjLgDXLVdm2z
         vFrD41N369dEkQA3Yr+piTujNErzQyvocyaqaaEF8aNpbkhXT4+uKZUGT9ZnHBVTXFOQ
         MRYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=K17Qb/xqJhqemGjS6kTuTL7FFWSJ4l9BP89RSwHWF5E=;
        b=jYv93uVUG/y3eXH7ekRhiA0vtJudxGRRqFkNaoJanzATpgIYPpigVOmujRhI0DYuEk
         FSuXpD+S9HwEK3SqBiCuYipHiaOruQoB2zuZmKCkfVNaQQod1CLm/SXHDX/Bx1hxzJg1
         x7/3VenQPu9sdVdBucixdU0kk6fsG3w4n48tGdW7HJwiAWMd7RnBqM8HZm739bYXbF1N
         2RAacJxNX8oEnnR9gX15wGh92H/JND+8f3XATg3ps3NTEYjQRIJnrD32GKn3RWVo5NPZ
         gICLcfg84i0UUucBulOaWOPwKiBo1wvmbspeBiwbVPMnS3Mk57ClUNWni+PyXRrCxj8H
         +zcg==
X-Gm-Message-State: AOAM530C9HLOf6luCp0Ob9B5vu5AbKVa1I7vW/lc2Z0JPdEgjrfR9b75
        OefuWbarNE5BrWTjRv7nht4=
X-Google-Smtp-Source: ABdhPJyJGoMAuEiKqmzk71DvSTnpg4Ui3V10hF5b8vzzCod0tNFv3UIb4yOZgcvqdflnJZPOlpC9wg==
X-Received: by 2002:a05:600c:21d8:: with SMTP id x24mr699705wmj.27.1611255636500;
        Thu, 21 Jan 2021 11:00:36 -0800 (PST)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id p9sm8673767wrj.11.2021.01.21.11.00.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jan 2021 11:00:35 -0800 (PST)
Date:   Thu, 21 Jan 2021 20:00:34 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Sameer Pujar <spujar@nvidia.com>
Cc:     broonie@kernel.org, robh+dt@kernel.org, jonathanh@nvidia.com,
        kuninori.morimoto.gx@renesas.com, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, sharadg@nvidia.com
Subject: Re: [RESEND PATCH v6 6/6] arm64: tegra: Audio graph sound card for
 Jetson Nano and TX1
Message-ID: <YAnPUsg7cNJQKqfO@ulmo>
References: <1611048496-24650-1-git-send-email-spujar@nvidia.com>
 <1611048496-24650-7-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="51vTQSaQmQ9+ueZw"
Content-Disposition: inline
In-Reply-To: <1611048496-24650-7-git-send-email-spujar@nvidia.com>
User-Agent: Mutt/2.0.4 (26f41dd1) (2020-12-30)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--51vTQSaQmQ9+ueZw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 19, 2021 at 02:58:16PM +0530, Sameer Pujar wrote:
> Enable support for audio-graph based sound card on Jetson-Nano and
> Jetson-TX1. Depending on the platform, required I/O interfaces are
> enabled.
>=20
>  * Jetson-Nano: Enable I2S3, I2S4, DMIC1 and DMIC2.
>  * Jetson-TX1: Enable all I2S and DMIC interfaces.
>=20
> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
> Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
> ---
>  arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts | 262 +++++++++++++++=
++++++
>  arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts | 146 ++++++++++++
>  2 files changed, 408 insertions(+)

Applied, thanks.

Thierry

--51vTQSaQmQ9+ueZw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmAJz1IACgkQ3SOs138+
s6GsMRAAsajRy5WFgKN+ktn2lL5UogXSyqcI2/4odHZspdTjh48LGWAWZZ2BkJO3
0FBPJmcg9irGgzc1L0mKH2SKLbs0owGIh24jpuf51T3SAzygOXh/K6wIy/mMBz1F
ViRWHtM866kzXyAizKanXmXnVP75VyquwO6TNgMhsldEm0CqjA2kcsWZZ+KCFsc3
mlMFUfGgzxjScgjhVXTrSBa8jx5FmaFEIRMwFRfuU1eZxV4oVWocWPS4fM7nkFNg
1FEvwGr3MZGmR4VZ8VUUyoiCHIIXD0A+o1X2+2iLpau9bgh9LASrj7mWHA62eRWa
ji18iCYrdsv3+ac82Yhbnot+0mCMajIlP8qL75HPpjSavjIiAOaJ2ifYdWmzNbcd
Ep/Ot1GkXnyMhSZwL8vp6TOvDq8uoLDwdMjNilA8BXwDq8V7QZvz5fVT9EV7oPY1
Q7eoiypjrsfmDbw1niP9uNKcCIDh1Boj9FqxKi9Unq/blcbKqXbo8zb/ANGAwIau
Ds8bpCy4zQOFCXnmDw1BReWQbryUZp4TsSQ18gskEIo4U8/Tg2JDJzqJbmN6LuQ1
Y4VzhHq0JBzr5oBlTJU1f7d+v3Bcfxtwm8LMYrUqQYkEZidO+794fC6077Dai/r8
KcDiIFitTxSTqogQLN45ISY/a3MtNGRhDLBZcf6Sdd6yoJa+IfQ=
=ceXN
-----END PGP SIGNATURE-----

--51vTQSaQmQ9+ueZw--
