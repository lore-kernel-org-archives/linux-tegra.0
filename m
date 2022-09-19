Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4420DECAAD3
	for <linux-tegra@archiver.kernel.org>; Mon, 19 Sep 2022 12:45:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230030AbiISMpf (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 19 Sep 2022 08:45:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230022AbiISMpe (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 19 Sep 2022 08:45:34 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 330E32A71E
        for <linux-tegra@vger.kernel.org>; Mon, 19 Sep 2022 05:45:33 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id b24so3800053ljk.6
        for <linux-tegra@vger.kernel.org>; Mon, 19 Sep 2022 05:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date;
        bh=VB/tVzHx542NdE3ovrJj8GJ9yV2C5QxKRxxJJKr/wSE=;
        b=GoYjKqW3LPVGsXOfI/pUio6P+JIU59CD2pCLwS0W/FYBLM4baxXIWRolx7Hf0v3fX9
         7cxpCfsNZHiN6bYGddf69RqPFbeX9blHPO/7EFHSoQ58mw2wqVkGOLCk9M2AK2V6D7UX
         tanohUtKfPf2YkMHb6JwyvIq1V/3irJakXKnKfqSMCmCF3k0ittPhw6Pj6r1VhOF5Bss
         YjB7iqteRd9ZRTJm33AlL9uXa4jlLo+5YlkVnLXOdDqS/9FnhOD/xZDdNQw0lTOTHHMy
         UHcDtH/TyybnUBdAUjrZj3Y7s974VSxZwl1tmm38/vEgjkbQUmU61DmkapT5y3TIa0uN
         3laA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date;
        bh=VB/tVzHx542NdE3ovrJj8GJ9yV2C5QxKRxxJJKr/wSE=;
        b=VP4RB54pPXJNal/fj5wDuUVBQiLfjuOE+YF/P4DFGzuk1P3YAAIVpTCbMsvSIJGtqq
         Rqt2tVu1vOEXsM0nBTK2Ti5xE/AWfkRSFw7FXjho4OZh7dR2xoTUb+AsynJf7t1VddOv
         l1ATeMfF7sPJW4AeoY0l0VfngKF/MuQQEPNsx0eIkVqE9O0eLreKrzONOVjeuHiE2kzT
         TF1WaurRLTYneLW15lZ51IaFvmFIMizlCAC+EYpP2n073dXRE5QkGUli56MdxylVLw5G
         hMqTXfcS16eNtS8Aa1zpp7w/UXh7MywaFslxy9+bxW+qYC57Lt1OFwzc+I/OFzl+mZ6r
         tylA==
X-Gm-Message-State: ACrzQf3w5xXe2MWBlGLLnC2tyF8iEdVpDBLenGh/PyiJf65VP1L1/oDn
        tdptzsVN+0us9FkN+bXabZA0ji52uKc=
X-Google-Smtp-Source: AMsMyM5wfRfBX8RJJJ4jc6VSq6B8O2bNXn+F/CoNUP75MHpKmg7g7AxB1hzpFAm5Y2hZjlXe5J6ujg==
X-Received: by 2002:a05:651c:1950:b0:26c:5110:6f6a with SMTP id bs16-20020a05651c195000b0026c51106f6amr1100090ljb.108.1663591531279;
        Mon, 19 Sep 2022 05:45:31 -0700 (PDT)
Received: from orome (p200300e41f12c800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f12:c800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id bi39-20020a05651c232700b0026c02fde0b7sm4433366ljb.81.2022.09.19.05.45.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Sep 2022 05:45:29 -0700 (PDT)
Date:   Mon, 19 Sep 2022 14:45:27 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     arm@kernel.org, soc@kernel.org
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL 1/6] soc/tegra: Changes for v6.1-rc1
Message-ID: <YyhkZ39WytIrb9xV@orome>
References: <20220916101957.1635854-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="WXth3SsAYqAP0GMR"
Content-Disposition: inline
In-Reply-To: <20220916101957.1635854-1-thierry.reding@gmail.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--WXth3SsAYqAP0GMR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 16, 2022 at 12:19:52PM +0200, Thierry Reding wrote:
> Hi ARM SoC maintainers,
>=20
> The following changes since commit 568035b01cfb107af8d2e4bd2fb9aea22cf5b8=
68:
>=20
>   Linux 6.0-rc1 (2022-08-14 15:50:18 -0700)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegr=
a-for-6.1-soc
>=20
> for you to fetch changes up to 74f7f183d81c26a53c2b1708364069d391b1b4d6:
>=20
>   soc/tegra: pmc: Check device node status property (2022-09-15 14:10:49 =
+0200)
>=20
> Thanks,
> Thierry
>=20
> ----------------------------------------------------------------
> soc/tegra: Changes for v6.1-rc1
>=20
> This contains an assortment of small fixes and cleanups. One new feature
> is introduced in the form of simple wake events which are needed to wake
> the system from sleep on USB port events.
>=20
> ----------------------------------------------------------------
> Christophe JAILLET (1):
>       soc/tegra: pmc: Use devm_clk_get_optional()
>=20
> Dmitry Osipenko (1):
>       soc/tegra: fuse: Drop Kconfig dependency on TEGRA20_APB_DMA

Hi Arnd, Olof,

you may want to hold off on applying this one for now. Stephen noticed a
missing Signed-off-by in the above patch. I've fixed that up and will
send an updated PR shortly.

Thierry

--WXth3SsAYqAP0GMR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmMoZGUACgkQ3SOs138+
s6HQzRAAk9ZNzBTUnytI7VE4yoheMriXpv6/0DTrBCtodUhOakkrBH1+/P756FPZ
2TpMt0htESSmzh9Ni0vkfMRUc0qnEUpJaTdSAY95hon/9+iBpV+xAvMASIuYgPkE
l9NGoL5JcL2Xe0aF1wI62vm5iWa+f8D5HKUU+qjOFJXOIiaYMM/fNZBCdIFpYc15
8+7DcXSJ43ubtms+Cni98X9zdNUgcdgNHcpMR4K5B9BE9kksjNqBpzsnYmddEOcw
4JJOdyV/BijCNpqgcH+1zFR2ibRU/INFWBKOwVRWXTX+3+5I/K1Pes25WhNBgAWB
412T4XS2yRdiUSR+o4hWbzY7JBy1Ce1nhYrt89HYSlqIn35QX4MrDHVsenNso6Fu
wHfeBgfgXCnFgxPFBqjKicyRAxQWMwqYOZPuiIwCsBzz5egFPdnm6af4rdS2bz8Q
2o3SsULL4TUHOZnD0L69jiU+zFBLgVxDpfomkDxp06mQdWTYedXjZO54Llxj2k32
NfK4rYvICWGO9tLtgsUbXwWVBO3RYHHs0VuDF8BLE35kAeFrD9njsUbtoI9JMN6l
LHyB1oT4y+jHC2BQiRqBysP8m5EyT7N+dEFh3KeJMnRWnwZA+m9zFZBQ4xDaETtX
h7IozxqvKtqONkjyyjT90oMs+WXcd7IT5EiCADbCcoVT4Itpl7s=
=oA05
-----END PGP SIGNATURE-----

--WXth3SsAYqAP0GMR--
