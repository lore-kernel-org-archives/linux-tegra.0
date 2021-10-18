Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FA61C433EF
	for <linux-tegra@archiver.kernel.org>; Mon, 18 Oct 2021 14:17:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1305A60ED5
	for <linux-tegra@archiver.kernel.org>; Mon, 18 Oct 2021 14:17:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231982AbhJROT3 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 18 Oct 2021 10:19:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232046AbhJROTY (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 18 Oct 2021 10:19:24 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22A38C061771;
        Mon, 18 Oct 2021 07:06:26 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id y3so41804973wrl.1;
        Mon, 18 Oct 2021 07:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ctO4zq8IpgYTVh72xzk49ULxst8DyrJanX/KNIyApso=;
        b=hX1AyJeT1N3FIefr7T2nh7wiUp3BCiHO8A6cawxFS17fnt6IUGFNq5vSsV+gghucwl
         +5pUm+9r32DOcvm25mTN61/3PSdADo2QPkuqdfwdYNqJlk12J6EyJD/6UIGBHmPnYNSH
         VFU1pmVV7uyGgKfMjElIMGknUqWkJdCE5BrKjE4u+Sn73nFYHV6eKo4njYrdRGeVT7CU
         KqBaS4RYlp1UvEtdmjCoeNI7zqeNAJNf79vuhL96T4gPZ4U148CZqnFxKfzlSUzfxpmC
         kViwnwvvKu3AS4tCR6pPROzzaK9RZrznyOe6Z+n+PYnES9aZTgT8pR+KUpoPThVNMptw
         WmBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ctO4zq8IpgYTVh72xzk49ULxst8DyrJanX/KNIyApso=;
        b=sT/NXDaaTcL2wdqxzRza6ivpaSAdMXcUwxF1XAsL9hr1I7n0n9coXcULNhmC+dA1ki
         T1X5HmFW+vhcSSBtioHJvg/qVNqa2KhLogoPDUBkvT+eHUXOlFt2x6c3VUAgQ/t9A65G
         net4S45zGtuHvWv6IlEQPIkesUPvbI7DHvNtwOyNvtKntvo+tbfdUwxyH4FxV4mc9tzz
         Id9V7vYADuhlU6UECUAz25xZhXofDZNcrx87dZJHeGAyvBRaP1jIsCgo/XTp6wXxCn7K
         1L84l18zUkXBy/pJjGXRCkT+Nm1hBhN34HsrfnmvSlKo3bLNC/nlQs+IOdUbtgJGVnPp
         Hpvw==
X-Gm-Message-State: AOAM531wH1r0GL7koUqhfk3B7PL2NPqnLjmTD9Gu3+K1jOzutHhpVsyK
        kK6hb3GQd7Pzflz/1ATAQDk=
X-Google-Smtp-Source: ABdhPJzzpP9Fn0rtRda1JhGlAPlfwa2XUJKIzjIzxbcMGSV2EZC5m0LzPqXgNPD466hRMQxe6d/I7w==
X-Received: by 2002:adf:ba87:: with SMTP id p7mr9642381wrg.282.1634565984751;
        Mon, 18 Oct 2021 07:06:24 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id r128sm12122508wma.44.2021.10.18.07.06.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Oct 2021 07:06:24 -0700 (PDT)
Date:   Mon, 18 Oct 2021 16:06:23 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     cgel.zte@gmail.com
Cc:     jonathanh@nvidia.com, arnd@arndb.de, lv.ruyi@zte.com.cn,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        Zeal Robot <zealci@zte.com.cn>
Subject: Re: [PATCH V1] firmware: tegra: fix error application of sizeof to
 pointer
Message-ID: <YW1/X73f99H6g5sY@orome.fritz.box>
References: <20211009085900.509697-1-lv.ruyi@zte.com.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="9EZvROls9+qhIkmG"
Content-Disposition: inline
In-Reply-To: <20211009085900.509697-1-lv.ruyi@zte.com.cn>
User-Agent: Mutt/2.1.3 (987dde4c) (2021-09-10)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--9EZvROls9+qhIkmG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 09, 2021 at 08:59:00AM +0000, cgel.zte@gmail.com wrote:
> From: Lv Ruyi <lv.ruyi@zte.com.cn>
>=20
> Application of sizeof to pointer yields the number of bytes of the pointe=
r,
> but it should use the length of buffer in the code.
>=20
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: Lv Ruyi <lv.ruyi@zte.com.cn>
> ---
>  drivers/firmware/tegra/bpmp-debugfs.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

Applied, thanks.

Thierry

--9EZvROls9+qhIkmG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmFtf14ACgkQ3SOs138+
s6H5ug/9FLj5zhORL6+b+QtAk9HD10Jn8WWme8mWgqSWf+IsMVDVY1+LAN2cmQIh
/Es1ztKAMAFwhhAG2+CO1YETaXsNQ5HkNLdQ7B5qOQ9a9NqxVmqpGCmPp4roPuR7
4kjaIFA/2RwaOoFpZB3+kq6mQ24UYVpfTy4OnBo1K2z/nZFBCevvUOHjnffwUnPn
efNauvv9zwdVZdMfOn4wdNl5tBQMR6Wqe8BJkIdbTBJ0425h9aursjBY/Fmufxjt
FrLNpumxOpZwxa3xqwEWyR3uGQa+NTORASSOKCwSUDw1SL3CE/2yEYL3XljYGC5A
TbjvqAMTIVxlfJPq+iVcj+AItzmLrzJ+5BuOnDHj6cyZ3QMe5mTkLgGFgDb/hlMA
pkDn39nXUPm9BXtC8Sqc/XQMskYp1K9jsl07XE0clefRIBEPHeefiuPCGUlkn3e3
kMcEZ4bk9FSrsHD2Wia9J0K7mbmRAfFx5+crxhm4SYUnd+w3cYhIkC2PYCU0DqOf
QR4e9HHOh4Ywo9+BpEmywlm1MNr7ww60rwXE6n70oBiRBlHujmtl9ahMc3akbe9D
s3/ppPm0enKBhc3JBPA43XryURSmArJ/Qx/XXoa5usANKD++bilbKBwShsxa1ADk
7hERG1AFrjvAUjTbfz6/pReU05axtEMLKuiWV9xo8sikzKedDFI=
=xxjN
-----END PGP SIGNATURE-----

--9EZvROls9+qhIkmG--
