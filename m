Return-Path: <SRS0=0tg+=DF=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74FF7C4727C
	for <linux-tegra@archiver.kernel.org>; Mon, 28 Sep 2020 13:42:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 304C023444
	for <linux-tegra@archiver.kernel.org>; Mon, 28 Sep 2020 13:42:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kDi0BWxH"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726344AbgI1Nmt (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 28 Sep 2020 09:42:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726325AbgI1Nmt (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 28 Sep 2020 09:42:49 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BDFFC061755;
        Mon, 28 Sep 2020 06:42:49 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id m6so1433783wrn.0;
        Mon, 28 Sep 2020 06:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=WVwdUfyjMEoCtuOhheTQ9oRiRarpPNDUuV3BfILNxJ8=;
        b=kDi0BWxHW6BtOj7bB4YVgWfNm4uGCHxZjrleQIFZtDEZ6/3XNTd70U/2xYLD0xvsBI
         s1Kg2h6ubhSO5fk9TSHxE7Q8XQ5LOVP2wV/nkjGpcYhuWMnrUAuiZEuc5PSexGn1V/xJ
         XWxHRMgcx6wYNI4Y9A7MUP3n2bYSPthjjUjIrXBVIAS90OldpcWTDsu95iLuRNwpXK7d
         YU0NKj2T7Xt4a6KhpoanPgaFcwV0x8PBftEU3Bq7fJM98Zu3DhQKWjsJ73cj5zUrYU81
         /WN1oh6JWcYWE7U6hsywxAv0DX/W62kcaIpl4UrRDlx1JGuqIwmg58FSAmW22cJqzhU0
         9udQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=WVwdUfyjMEoCtuOhheTQ9oRiRarpPNDUuV3BfILNxJ8=;
        b=bnFN/quBAu8Al0lgdIK3B990Xjqe/O82SKb6TO0P/JEI+0+hIoNFC0Nn/fGQQZn8a7
         nydYXUr2aDK7YD4pAv7icXB9CpcnGme3KJBHOdo9PO3AO6A60q9u+gvAb58zpxtgTTeu
         ScvyS8XKmUzAIWUYoY7DiQ+KED+TgLF+NOQBHIhXbubie1m+DtPmBXQUuTaouoi0PM+h
         gXZoicG4Zwf+KIPCME9kKZlepeJRLIHW47XMHweoz8xVAXm+bRvqPAMrKBZuyKCKHmue
         0+wxnqDkRZaiMc/Lb+Cj7Y5M7+wmL4X/sAbUBaDogM1bwjCMCrMu3ZDPkLDd7MNAlyyU
         HK2g==
X-Gm-Message-State: AOAM530UagE92MZfK0O6eF/L+i9NTAMjPEljSPdy+VBpOu9l5IsjncZH
        l6ckmhBSJC8Ip5p737wuA6ZI0pjVeiU=
X-Google-Smtp-Source: ABdhPJyM9lyBNEicuYe1j+vM1mQpQcI0inyyCPoZ/POUXKl7FVC80MEMnrStswwD3Eq+LWXzqxbj5w==
X-Received: by 2002:adf:a3d4:: with SMTP id m20mr1949028wrb.29.1601300568063;
        Mon, 28 Sep 2020 06:42:48 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id a15sm1565621wrn.3.2020.09.28.06.42.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2020 06:42:47 -0700 (PDT)
Date:   Mon, 28 Sep 2020 15:42:44 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     JC Kuo <jckuo@nvidia.com>
Cc:     gregkh@linuxfoundation.org, robh@kernel.org, jonathanh@nvidia.com,
        kishon@ti.com, linux-tegra@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, nkristam@nvidia.com
Subject: Re: [PATCH v3 11/15] phy: tegra: xusb: Tegra210 host mode VBUS
 control
Message-ID: <20200928134244.GL3065790@ulmo>
References: <20200909081041.3190157-1-jckuo@nvidia.com>
 <20200909081041.3190157-12-jckuo@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="Swj79WlilW4BQYVz"
Content-Disposition: inline
In-Reply-To: <20200909081041.3190157-12-jckuo@nvidia.com>
User-Agent: Mutt/1.14.7 (2020-08-29)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--Swj79WlilW4BQYVz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 09, 2020 at 04:10:37PM +0800, JC Kuo wrote:
> To support XUSB host controller ELPG, this commit moves VBUS control
> .phy_power_on()/.phy_power_off() to .phy_init()/.phy_exit().
> When XUSB host controller enters ELPG, host driver invokes
> .phy_power_off(), VBUS should remain ON so that USB devices will not
> disconnect. VBUS can be turned OFF when host driver invokes
> .phy_exit() which indicates disabling a USB port.
>=20
> Signed-off-by: JC Kuo <jckuo@nvidia.com>
> ---
> v3:
>    new, was a part of "phy: tegra: xusb: Add wake/sleepwalk for Tegra210"
>=20
>  drivers/phy/tegra/xusb-tegra210.c | 52 ++++++++++++++++++++++++-------
>  1 file changed, 40 insertions(+), 12 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--Swj79WlilW4BQYVz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl9x6FQACgkQ3SOs138+
s6G92hAApMHDpezGgXdXh/OWS2HGj7CokE31XJ/Jr6PUdq5XOJtv7eyyF3TuiRmx
mWCGxdxGu0lXayJXGta/LylRwlxD3uzOEQkBeRU11EmoUu08XDlFclLoBC8w+hro
R/3/4Mc9vwrz9nYSwdF9G34XZVKSvVrCxQQRIXm9tVK0aMv/rl6BqHffPd/YwgeZ
Z0DDadkgJZ5wyERDK8pxxto5DzdYCzC/iR5Kr31PXt5zGXshONGPAxmJlLScqsuo
/ulKH7Ts/LqIdkEo/Lpes6z1r7lOlQ3dvNhj62pFcLgnQJCNoIuWVBjpvt+8OfCz
Usw9IE2gh8YKHBTSRDP41RjtgoXALYdQCjPxFILob+TrTE8/lMs9ItZZLl4Yy0MA
9akzpif3DLcdM/bY7R7T80xlgHoAf6Y4L5t5cs4hL9hFfbH9db7c6qK057Geyyxb
ULNQFPMkuYxY4SYudyKU9gyipOV8WxGGXWhTaSmI6lcrFJLvMDbEmSyyQlGPoiOb
zvSrz7b9V/tiATiRF7xg+Aim+9JzR4gPSYhcuzl4aMTgKwzG8JroTISVL5kNr2SQ
du8mFNnedIr++ymT6BrSH734H0RTDTlb8wN83yM/PW99lJwXN2QmRHltj3ug5ydg
uIPhnK2b9V2M9gufaFq+kOuBfgC/pEdZqUiKUY2VEgw+2j+FcqY=
=MNU9
-----END PGP SIGNATURE-----

--Swj79WlilW4BQYVz--
