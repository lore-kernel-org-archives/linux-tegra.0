Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF65EECAAA1
	for <linux-tegra@archiver.kernel.org>; Mon, 24 Oct 2022 17:56:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232445AbiJXR4N (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 24 Oct 2022 13:56:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231331AbiJXRz5 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 24 Oct 2022 13:55:57 -0400
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 206A2BE2FE
        for <linux-tegra@vger.kernel.org>; Mon, 24 Oct 2022 09:35:15 -0700 (PDT)
Received: by mail-lf1-f50.google.com with SMTP id o12so17602282lfq.9
        for <linux-tegra@vger.kernel.org>; Mon, 24 Oct 2022 09:35:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:to:from:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iR3UfHXnsanM1f9q/rSbsmMzsT/UyuayGOc6ontvzEA=;
        b=h0M99fGfmo9HphJkonF9O94gHqQb4vj07IZGBDBRmCiaecAQxq2iKyjZ2SCBlIOCOC
         mg3Ny7SQ4qhinoyQlsSmt+CYL05AYJRMZbk7K24wp4f71VoYaLiuOYTOesVManE+EgLz
         9VdyzROZSMbIRDf8hRmQ5EdpOYkrSyhWCMsrHGdzXM8krCjkGMlJ0w3aWioHnjE8FHO1
         EozKOUPSJfNw97x/P74NZqUZELK8REv/mCij/bTxGsp0bMsr8+RxwUYv98MFgILLk96V
         6t98uDjPlbLKAfxMZjxIDlrsk/MUeadoGJHezlVjL2hA4qe3IDvoqdXKhoCvQRB6PYSr
         Y/EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iR3UfHXnsanM1f9q/rSbsmMzsT/UyuayGOc6ontvzEA=;
        b=8RbG5CYkGcPNkb7uguMIcAJUb3y08yhrM6eltyi47SbB3hRNFM6y4HAU/IGjY6gnQs
         xvsLs210Q73vTRlodhFw77gDXju6xrkOajN6gi6Lvucs9Vyh8lmEsnHV5xmGf5zXrKql
         bGsQVlNtSazFnX4p04lfnwWyiNFb63lqnjD5KqObXvyKnM0rLhQbirRfm0uHStgxSSPc
         0X/a61khvg66CQzhcpRiWU84OD0FKgGvNJe+JmkBL/T0HmKTq4QBLWoOPHxmFOuusAnL
         yLBL9liE0J16iuIYW+IJkIZTfdJE9I9bqrk+l0i5DO8mjPBV8tEuEoj2exUoe8hJCDCc
         D7Gw==
X-Gm-Message-State: ACrzQf0Kou/xKMLOERLw+1LEepu4mS8Y2JfyGon5/aockztWxfTvwbSO
        rMBr/zn4pz0hsAaVPuz3cu0bxBp9oow=
X-Google-Smtp-Source: AMsMyM7r6pB7n9rytw/CvT1aP0JJ0Cjm9z4Q9HnDgwFw3l11kdu+wc+9qLysPZikKqVQQW7AiNC1ew==
X-Received: by 2002:a50:cc07:0:b0:453:4427:a918 with SMTP id m7-20020a50cc07000000b004534427a918mr30795242edi.121.1666617538725;
        Mon, 24 Oct 2022 06:18:58 -0700 (PDT)
Received: from orome (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id e14-20020a170906314e00b0073d84a321c8sm15688033eje.166.2022.10.24.06.18.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Oct 2022 06:18:57 -0700 (PDT)
Date:   Mon, 24 Oct 2022 15:18:56 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Jon Hunter <jonathanh@nvidia.com>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        Timo Alho <talho@nvidia.com>,
        Manish Bhardwaj <mbhardwaj@nvidia.com>,
        linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/3] firmware: tegra: bpmp: Prefer u32 over uint32_t
Message-ID: <Y1aQwBEuFvWSMi88@orome>
References: <20220922134125.844730-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="zXw+nGSUHm4GLDgo"
Content-Disposition: inline
In-Reply-To: <20220922134125.844730-1-thierry.reding@gmail.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--zXw+nGSUHm4GLDgo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 22, 2022 at 03:41:23PM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
>=20
> The canonical type for 32-bit unsigned integers in the kernel is u32, so
> use that instead of uint32_t.
>=20
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/firmware/tegra/bpmp-debugfs.c | 40 +++++++++++++--------------
>  1 file changed, 20 insertions(+), 20 deletions(-)

All three patches applied.

Thierry

--zXw+nGSUHm4GLDgo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmNWkMAACgkQ3SOs138+
s6FhpA/9HTc1orCD5sOY/G50gYwIWu4fFBizznHr9Q/GbiIsqxTJrINcffKdsWPz
89MrtXXX/rS7uui3yVou9/7estvI07ZXJ7Xqk2Yqcem3g/Vb4Ypk020VukgBS5A8
frJzu7SC2L8tskfT//aThEL4ZsRSFZvgS2Z1+IDEYYdd+RlFFIYqUGfNDUsT24LS
1/lIKOUF+VRxPunQmqrYGV20PDQAx/vXDnHhXeqD0t/8fb3uKu2zSMAfOuZtA5ST
omupvJ/5x890loguMCOB5M6g5kslCK8ryhmPKHTi6jj/Qxl/eDftTmL+j5Oy6Lmo
nyA4To5abVB/9xyhc8cohY44p++oWMMcmJ4YPAM1y4Y4n35/YDEbZ5deMOaywR/u
6SlFIJ38Ca7r3ClZItZx7fCw7G8Xy7CBeXm2tMkPUKKoYnnahQ+MmytTsKPJ0+l1
b31+1cOnP+g0I+2Ck7Iq5c7HmjlKd8x/5s8LbEyAC/mvaqEtXA/0qF2YSOoB+3pv
795MyF/CvZfFkyc1sudtYCaprgzLkto4WdhmtcZ1dWfASOpEd/nksGpcWH8gurW8
GE5CULLb589FOPX786yVxSdZJmQzPbIoaH8FFvd2fhAB1BJ+ZBBI6PMnnxgi3LZq
UPCDJwYtJQScUZlv9bqqce7cJUhzU4C72BdZyhNHm8P6kiKjBBw=
=XBJC
-----END PGP SIGNATURE-----

--zXw+nGSUHm4GLDgo--
