Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DD81C433DB
	for <linux-tegra@archiver.kernel.org>; Fri, 15 Jan 2021 15:39:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 57A1723884
	for <linux-tegra@archiver.kernel.org>; Fri, 15 Jan 2021 15:39:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729039AbhAOPjd (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 15 Jan 2021 10:39:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728879AbhAOPjd (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 15 Jan 2021 10:39:33 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22CCDC061793;
        Fri, 15 Jan 2021 07:38:53 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id v15so6050842wrx.4;
        Fri, 15 Jan 2021 07:38:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=/h5xi6JSFXxPDZmDPtNhEjnaFAoil7BDNGSWIjoSRoM=;
        b=pJXdW7QQ6kBYF8E6jkwXjiwlpczTZMomcQ04mL60/18nqX0w5xWqKp0y6vjSsf20Wa
         xIbJL8iFtWzN05rRIHBoqsUZ8faOtY+UUk6ef57PkuhmAmQvUBpbpa6t4sNYSM+nm6UL
         Bb0O35QKgdIRGM0sjLb1wvxX3ELDT9vR51+63asVN2h2Ojv6GrKx9OXJyh7j75DhPBoY
         2msMADcTGzf2fE0cIf8OckmCkLb+lMzG/QazjBxBNEYaJ3diYS5lTDUBesZLjUICo2X2
         SpsRbYzCEVkFIWnvecE03UmhAIVnys86m9JAcE6ZGHa5zL/uFiIlXXne/9IdRTHhTnCv
         4BKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=/h5xi6JSFXxPDZmDPtNhEjnaFAoil7BDNGSWIjoSRoM=;
        b=surN2dPvWGjxrCPmdycJfWDlAWrT2tIjq9ervgr3aoV3yQWEVhyiZn5JUBqfBBHvxF
         vThnIo9gstNI6PagrlAEFOFnmsAsLKOp8n3HhhgdmjC2/Vvqi1yz1WBqGWVmHSehnSJu
         HwYbBzsZEpzEIOc0QtBd3TrqPQezaGRXOO8ZYVhFFlBMP3XIeoV4ULoWJhjP9Z7Kaxl4
         SZnIikBw526owmr8umuqjoh3u8OrMntWy+cYm1+OmWdpXeN4f90cN3NQzeRDR4pgoC9F
         spMPTc7EwihAtZhJ/EmUYgG09qSQf3Usg7JTjAHrt/9qaTfjBPoTPiHQVDyl6P9SASLh
         x8rw==
X-Gm-Message-State: AOAM531wWzYU26EWQVhbIzTERW96YZ6gKPrVHHsJn1mRXc8kuoTRaZkN
        q4b82tZIY+ZBKL4ehBNPLME=
X-Google-Smtp-Source: ABdhPJyr5c/xCE7surzCbS9UR0ERv60lBS3fVhlOpAAjR/c6cgAhH+Fx7zLb4Yl0IABW5O9RArCdXQ==
X-Received: by 2002:adf:e9d0:: with SMTP id l16mr13063091wrn.376.1610725131875;
        Fri, 15 Jan 2021 07:38:51 -0800 (PST)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id a17sm15069939wrs.20.2021.01.15.07.38.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Jan 2021 07:38:50 -0800 (PST)
Date:   Fri, 15 Jan 2021 16:38:49 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Sameer Pujar <spujar@nvidia.com>,
        Peter Geis <pgwipeout@gmail.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Takashi Iwai <tiwai@suse.com>,
        Jaroslav Kysela <perex@perex.cz>, alsa-devel@alsa-project.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 4/5] ASoC: tegra: ahub: Use clk_bulk helpers
Message-ID: <YAG3CeBI5h5VKqQL@ulmo>
References: <20210112125834.21545-1-digetx@gmail.com>
 <20210112125834.21545-5-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="pLk3yZKzSBt2opqn"
Content-Disposition: inline
In-Reply-To: <20210112125834.21545-5-digetx@gmail.com>
User-Agent: Mutt/2.0.4 (26f41dd1) (2020-12-30)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--pLk3yZKzSBt2opqn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 12, 2021 at 03:58:33PM +0300, Dmitry Osipenko wrote:
> Use clk_bulk helpers to make code cleaner.
>=20
> Tested-by: Peter Geis <pgwipeout@gmail.com>
> Tested-by: Nicolas Chauvet <kwizart@gmail.com>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  sound/soc/tegra/tegra30_ahub.c | 30 +++++++-----------------------
>  sound/soc/tegra/tegra30_ahub.h |  4 ++--
>  2 files changed, 9 insertions(+), 25 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--pLk3yZKzSBt2opqn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmABtwkACgkQ3SOs138+
s6F3FA/9HwpxJ6Gd0bLJNkzt97n9mABHQPT74u3ZzTK3+ubXqhb2oKBavGzauqv2
TvkFVI4DevDVhC7Hx6DxSFXcqdScwUk25FPcnsQD7TztY/kHu99NnnZ2gd5xfmoh
SgdxLNi70d/9t+6p96iTsVxURF3i7YxwtISUmxKnIPdShFJSRMaYu5ci+0vnobS0
3RffcDPumaDF+kWY2ZRv8QNqAYpfXhl5z31GlWfcohS0G5QsEGmwK+leu9s62WXU
DiNxytgaVMH2wnMTUxT0rdhfRlWN+alY9Aac9EMwVlAvlSP6KZTuk8kOtHgVwQXK
ujJWO2n4UWRRyk7cm/euk+eyAtmcd1MM7CzRwWM8ezXZEi1qBsQqNH+zw7z3ZJTT
dUMWDGWUIDCyTJoNZIOg+vJt/p1FXRsA5oeTlVqx5jrSOO1FAcuDdOu68jeoiTVU
9Rtbh/gc0MpZEzQ6OUcQEfR1g3A/ojud4dkpVvpvrNTL/t09BpOxZAN5+QrmOXm3
9WO5BCGAZoEp8trnBTYO9DTrelcp0r8iDpXjyhgSlXkQNFgY4j+pEfaBglTqr6zI
LfQ0reT+3OuhxCgADYjRow9NSb0xc+a0pCYogu46O9mkk+gDsGE0IplviMqdo9LN
QsYAK4mE2LFFqArbiJA9DvcuFs89Ma8CdQ4HBonIi+zpDVzX4JY=
=MMnc
-----END PGP SIGNATURE-----

--pLk3yZKzSBt2opqn--
