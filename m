Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74F58C388F7
	for <linux-tegra@archiver.kernel.org>; Tue, 10 Nov 2020 19:54:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1A7F5206E3
	for <linux-tegra@archiver.kernel.org>; Tue, 10 Nov 2020 19:54:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EILuuoyc"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726428AbgKJTyD (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 10 Nov 2020 14:54:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725862AbgKJTyD (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 10 Nov 2020 14:54:03 -0500
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DAEFCC0613D1;
        Tue, 10 Nov 2020 11:54:01 -0800 (PST)
Received: by mail-wr1-x442.google.com with SMTP id p8so13264707wrx.5;
        Tue, 10 Nov 2020 11:54:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=NsjQ2bxKep09VtBbYdsrhQsOr13lbc9Doa193zsbYv8=;
        b=EILuuoycOFbcm8lGc1d+bSvKMCtr0XnpgbcXre2zNgbj7EwEhktxbSKYgev1VCf4WH
         P0t+jZnVWRXur39ydLnJlY73UGET12+Z6hT+BwoNVg42Eg0iXjCKFnCd1guKOPDXdD+M
         1FgLcAcaGKomwRmEoi0vswxU1VXpO4liwoMw2Id1nCFqY4XazT4M2Eu2C4SOem5MWQP3
         ln7rvMmRdbyVe/S/+GoNmUqL8mxBjUIxpM1+iMpNHrAuw4oLZYEt0cDjGh0y9EFuRPqt
         fM4tE7dzYWqXTodY5lhKzbhrvDhGFew7dOC/OIK5wK8+SmELURzef21rqZoC5FSHiRWJ
         zU+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=NsjQ2bxKep09VtBbYdsrhQsOr13lbc9Doa193zsbYv8=;
        b=ULLQNDliaCXgFrpFK4qCir3LMALgQWFquD9JnXa57aXgMXA7i2y75KmhCHnib2X0Tv
         TY51ljQgnb0LMXaQXJ5etSV+nAC0wGKlE7hBZEvIem6vrQ6ZRdp0zsPLNHA+jDL4b5Ko
         KlfkmdKccIABjX9pSp1/F243Ght1K2VKffbuPaXMw70ZF2f4Jq43mNGtmhMsoK13/bP1
         WJR1GyLnczR4O90ugQ2Ru8yo64Qcex2+mTwJjMnDcFxSVZovvR9B7IMl3yHgl+jd0XSH
         FnxrjtOyBXroc1JeM/izHfQf7pcog+5vKNcJEt9ltr57M17FhSAKoJTQlqPkd8dj6aij
         B6zw==
X-Gm-Message-State: AOAM530okBCJHbBQqGSpMqPG0EHxI2PLWX3bQd+eyd8+bexwfiI7WHA/
        IwulgR4F7BvZuLEZ8vHOZv6ZiUFEk0w=
X-Google-Smtp-Source: ABdhPJxsskSfxC1zZ7ByjZlL8tFFRGikXfTIX0JDoKXekBFXlSxwZn3Fp+XlBSWVD7VdBxZ2GPd9zQ==
X-Received: by 2002:adf:efc2:: with SMTP id i2mr3484665wrp.383.1605038040688;
        Tue, 10 Nov 2020 11:54:00 -0800 (PST)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id n9sm4028867wmd.4.2020.11.10.11.53.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2020 11:53:59 -0800 (PST)
Date:   Tue, 10 Nov 2020 20:53:58 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Deepak R Varma <mh12gx2825@gmail.com>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/tegra: replace idr_init() by idr_init_base()
Message-ID: <20201110195358.GE2375022@ulmo>
References: <20201105175928.GA42488@localhost>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="J4XPiPrVK1ev6Sgr"
Content-Disposition: inline
In-Reply-To: <20201105175928.GA42488@localhost>
User-Agent: Mutt/1.14.7 (2020-08-29)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--J4XPiPrVK1ev6Sgr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 05, 2020 at 11:29:28PM +0530, Deepak R Varma wrote:
> idr_init() uses base 0 which is an invalid identifier for this driver.
> The new function idr_init_base allows IDR to set the ID lookup from
> base 1. This avoids all lookups that otherwise starts from 0 since
> 0 is always unused.
>=20
> References: commit 6ce711f27500 ("idr: Make 1-based IDRs more efficient")
>=20
> Signed-off-by: Deepak R Varma <mh12gx2825@gmail.com>
> ---
>  drivers/gpu/drm/tegra/drm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

Thierry

--J4XPiPrVK1ev6Sgr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl+q79UACgkQ3SOs138+
s6FSeA/+Iw7B6giIoQpubSiCFapmJ2adHGvhiUk8Z1Bvsk4I60f7TceVbVKJaGBO
rovc1peM2Ct9yZ1Rsp975wI73jzP3DFotX95CP/fkN89xtEj6NEwIsxc9icPDz5W
tpoz1azIGh16XPiEbPuNTLSGDcRrpBA8Kc80A/iEGyoQcjEqxHHCCd8BCW+zR60p
OZnS4kuqVZD64vVKoYWgmYYgMW2Dqq4t6ZShNr5+yZaeObxgbYnO10tyD67d9iCf
GZH6ieKkI1GOziI6GykGpmACRfVozI/YpSwSOzq1+nB+KuNJYP5puL1kY6/HGRYW
GLxhbS/iykwMq26gBOQnIIc3zvpyYaIIupFVm9lND1PH+nRZtzrnrLEFQd83mSoG
q5a+c5Qj5ka13B7sw3MjfUdOcLJqYg9trvinzW7qgyUlWMI8f+wtkKS8BKacPPBT
/vcTvQgDAdb6qE9VhQFJmULpnQ2Wzp4PGr8vdHg9msoeYWpZNbDEllpEJQAdnaCg
IP/i+TiWqnorL/s2gsN21VsV4G1mlOdD3WVG/U01+GwvkQSiBS4gfIn/mz82WE7z
8ZsQfpb36ogBtKiwvXhvl9CGYoFdzeMzKcSRqCqwNgooAtvD6tMo2gV055B2qf1F
BqR1VxxKVrn9hbQioixzn9E/zhX3ZbINEQHotsdRLPVsByVVbIQ=
=OhfJ
-----END PGP SIGNATURE-----

--J4XPiPrVK1ev6Sgr--
