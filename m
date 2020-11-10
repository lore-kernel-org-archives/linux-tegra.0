Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13D57C388F7
	for <linux-tegra@archiver.kernel.org>; Tue, 10 Nov 2020 17:40:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9863620781
	for <linux-tegra@archiver.kernel.org>; Tue, 10 Nov 2020 17:40:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WBlBITAJ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729980AbgKJRkB (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 10 Nov 2020 12:40:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726179AbgKJRkA (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 10 Nov 2020 12:40:00 -0500
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FE76C0613CF
        for <linux-tegra@vger.kernel.org>; Tue, 10 Nov 2020 09:40:00 -0800 (PST)
Received: by mail-wm1-x343.google.com with SMTP id p19so2479019wmg.0
        for <linux-tegra@vger.kernel.org>; Tue, 10 Nov 2020 09:40:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=AOGcPID+Yebyl4fgGXyna38EtVydK1CNIaPj0KzoARU=;
        b=WBlBITAJCb9Sfn7EsbQ64kdixmtTWXXUVBp7u7u7iYOXeTZi6zysw0yb5aniPgHb7A
         EeROJOzOXePMaJbsjb6W7WokET/DqIEKu0w9ylWTozLa1It6+QwXg+BpUA+PmkjcGp5m
         Qk1MjuBgLTuCKdJU+rQPv4K/1QSH0Ydah6b5q0HXW+jyiHdS+ZIUWoD0vc8T1tgW1jQA
         IUi/3FR6iQjK99UUP4O4E55BSBXU7AKBIM1XwdzV3ctiKLMnWToD0UWiXSrbfWfW5oj8
         lyboesf2rYhvSnVCBDrXCijGvSoN7/iqycISFam7EIk/dMYWb4MJkiAskyM3PhYvj904
         v+zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=AOGcPID+Yebyl4fgGXyna38EtVydK1CNIaPj0KzoARU=;
        b=MMPJbbhNSNLz0zDDRJOAJUF15PG+K79JKMGzuGeMLO4YaTLbg9+udag8+4SZdDRgng
         1UhnVFnzeOLERi/iV21R/tM9Wul21g7Dc/HgOg3m4kdGfLXh6XwdfQCWgueUe+OxLGDQ
         N7hdF9Wn93cOgbj+phUlpebIs2cnaMh5mszotMMnkZ2vLS8f4NJH5alF7dTh21Xd/hhe
         5BgqSjM0dW9OvE/24NEicCsValjEaDZ/+rm0tADNO3vr7nIBGcVtfTUqgeVYEhpf+YGL
         5zQG6Ux7loMuPefU7bd6g85U/RhwfVGuMF9AfL92MpFU7PUrJqsD/1JvnnlVSGpE+G+f
         vsFA==
X-Gm-Message-State: AOAM533A19H9JXuqbmhcZ4hrib6mGyZYOYj4bWaSSJ2MhAULjVYDgTP2
        3P9JkEVKkAD8sRuVAAHYo74=
X-Google-Smtp-Source: ABdhPJxxr0Qy5/6UDtv3YpAEcs9fMZM5aJf6t/rhu78691g1cWEEk3H5v0W7r41DPBg6Djm3yoevZA==
X-Received: by 2002:a1c:4ca:: with SMTP id 193mr177752wme.137.1605029999335;
        Tue, 10 Nov 2020 09:39:59 -0800 (PST)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id x7sm17951355wrt.78.2020.11.10.09.39.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2020 09:39:58 -0800 (PST)
Date:   Tue, 10 Nov 2020 18:39:56 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dipen Patel <dipenp@nvidia.com>
Cc:     robh+dt@kernel.org, jonathanh@nvidia.com, mperttunen@nvidia.com,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH v2] arm64: tegra: Wrong hsp_aon reg property size
Message-ID: <20201110173956.GD2297135@ulmo>
References: <20200912022645.7338-1-dipenp@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="SO98HVl1bnMOfKZd"
Content-Disposition: inline
In-Reply-To: <20200912022645.7338-1-dipenp@nvidia.com>
User-Agent: Mutt/1.14.7 (2020-08-29)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--SO98HVl1bnMOfKZd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 11, 2020 at 07:26:45PM -0700, Dipen Patel wrote:
> The hsp_aon node reg property size 0xa0000 will overlap with other
> resources. This patch fixes that wrong value with correct size 0x90000.
>=20
> Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
> Signed-off-by: Dipen Patel <dipenp@nvidia.com>
> Fixes: a38570c22e9d ("arm64: tegra: Add nodes for TCU on Tegra194")
> ---
> Changes in v2:
>   - Remove the space between Fixes and Signed-off-by tags
>=20
>  arch/arm64/boot/dts/nvidia/tegra194.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

Thierry

--SO98HVl1bnMOfKZd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl+q0GwACgkQ3SOs138+
s6EVmw//dgyFvoD/umxDnXRSBf4YNBtqaF8GVhO596Uc1BJj7CCEqFAlUmF4FOXn
yq4a83zraaoyeSgw7PwOYP6K/zbQm1iFjUyI7GKkbzsqa6GfyFg5UN2Uidl7Xa+W
E65gK82VIALv5OaHzxlHv6EwdJTY26viMixfBlqlz+LuKYpzqKBKoizIbhau9w6H
e0BdlSEnZydy6S5XglJWfLhseXdSCTnE2zv58frc9E+aZVbgdOTUD5bXyfVqeMn5
HM9KwBsm8yBu4yswFILQdaF9MBEjfXI43Cc8IIC9Ujpfh5LduYaFqqrUSDRDHjB1
8/HmRVYvrJPhTxP1KbnrRdDTCIR/rVRMDWALRLSACChv6rRnnQxkqjLngHifqP5E
s6Ppz9LOG+U9t8OM3SgU6Hfbl4ahDqgaDqT3a6UZw3obVtpaR4orsw5QxRMt4gsU
/7mBxcy2B56WNGVMMxQA5PsJg9dbS5QCKyuL1VfO9CFga6TMCMzUfsPMk+LU88oI
ZjmtDPEAVU5Lm3kPtqlMWFi9lPIFZzJLvjs6D6/hSvmhgb2UIhpU+e3qYsIpCdT6
xBAf25MHhIQisnH/Coofv+kQ7bjGf5qzMrQRgSunxgXFslev+J1uqbwpTDhvAwSd
BwrFPE8nKLgN7wwDypk30Sn4tX3cn2zK5q+sSCZ2fu+Pv8m4COg=
=RJCd
-----END PGP SIGNATURE-----

--SO98HVl1bnMOfKZd--
