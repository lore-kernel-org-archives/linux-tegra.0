Return-Path: <SRS0=Tnts=C2=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7306C43461
	for <linux-tegra@archiver.kernel.org>; Thu, 17 Sep 2020 10:18:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 638BF2087D
	for <linux-tegra@archiver.kernel.org>; Thu, 17 Sep 2020 10:18:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d4+qxcUN"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726582AbgIQKRz (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 17 Sep 2020 06:17:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726559AbgIQKRt (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 17 Sep 2020 06:17:49 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C0A0C06174A
        for <linux-tegra@vger.kernel.org>; Thu, 17 Sep 2020 03:17:48 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id w5so1432201wrp.8
        for <linux-tegra@vger.kernel.org>; Thu, 17 Sep 2020 03:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=E8LErhMOWyKqm8L4F1LpCrrPeaHmjDsVaIwsDm3sIK8=;
        b=d4+qxcUNl/gC8Heb80wv+1tVBY3IgL5sbcvZzQKIPZ32q9k6SmOIUl8omCc5d5/98f
         pPntxZ2cL7EwwjcJLobbok8FvEf0qg9sl5vw6Dq1txy0r0bWMuUX07faW4gOjGwYQMvu
         KJ45J5WRAyvOAcd7pKPs4uESNiL+VSL731lGMSp+aprGMlP4SAa7jj0oeIcMJ2/oXv9V
         xI9lZWCB/FAF5xOPLKqspRLIbu65lZlTSUPdCnS4mbYi2SA6DRwJFrzUUAcphxDu5ee6
         BaFPLSDcw38AsEuO3Fd5OggT1Cmaigo01c5/OK//cFRCbSJCy7bylzNuhwdMkX3BYMa7
         tUYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=E8LErhMOWyKqm8L4F1LpCrrPeaHmjDsVaIwsDm3sIK8=;
        b=m8gyFqgJxKFziVzCwtKNj6bAux2dpwqEd28apUFWa94fyZtOk3IJtb/XZR7dcGbWuQ
         9dM4m0CLQ65qqmkemLaTxc0aEq4AEA9DkJPD07GqceK+m2u0+eM3AcnwQMR8TZCESYHR
         GOqmOxfJWAaYzplfVSeGzKJsbir7oRjnOYlV70/ePJVfmr6SWBXFjwIczzm3iareR9HS
         0cCDcjivn6MhRtPhb/ljD9X8PBJpVHY0IDTlog2alie3VtIBRKYoeIx/fMumBCayE5uB
         lUUbLpB9o0k7rnO7BS7ez1SYI0QF3dTBF4Y7PTc5AKfrtH2xoUnQEiUG3X8ffoMwXo/D
         8ZKw==
X-Gm-Message-State: AOAM531TIVkzcDXz3MR31JBvw1kU7Se/mWK7j+1aYixGP4TOWG/4hbwj
        jISsEl4oPpVCBqpdJ9w5Gx4=
X-Google-Smtp-Source: ABdhPJz5BlDJIrqN0g5fjnZV5T6WHEwEDx4UhHysMJXoQpEpwONQIKTLrvkGxKxT10Gw+/q24Kyoiw==
X-Received: by 2002:adf:f190:: with SMTP id h16mr31823328wro.202.1600337867244;
        Thu, 17 Sep 2020 03:17:47 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id y6sm38277454wrt.80.2020.09.17.03.17.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2020 03:17:45 -0700 (PDT)
Date:   Thu, 17 Sep 2020 12:17:44 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v1 2/3] ARM: tegra: acer-a500: Add aliases for MMC
Message-ID: <20200917101744.GB3515672@ulmo>
References: <20200906190008.25247-1-digetx@gmail.com>
 <20200906190008.25247-2-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="MW5yreqqjyrRcusr"
Content-Disposition: inline
In-Reply-To: <20200906190008.25247-2-digetx@gmail.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--MW5yreqqjyrRcusr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 06, 2020 at 10:00:07PM +0300, Dmitry Osipenko wrote:
> MMC core now supports binding to a specific ID, which is very handy for
> embedded devices, like Acer A500, because MMC ID may change depending on
> kernel version or configuration which affects MMC driver probe order.
>=20
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  arch/arm/boot/dts/tegra20-acer-a500-picasso.dts | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)

Applied to for-5.9/arm/dt, but sorted these alphabetically as well.

Thanks,
Thierry

--MW5yreqqjyrRcusr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl9jN8cACgkQ3SOs138+
s6F0WRAAq2VqBUsSBooHFPBqYu61ke26lR7GTRUIDWoXCzTm+v6Bj++iQcR6n26a
VJsFFScfvXkjQonwmYy5xjH4rfKkZIfXtZwxwgGt5pR7KjM4AJOekVV8o4At5OKz
n8wxCi1GPvNTdpZrvXHsF87yRa79HWpWlvRbl0Ugz1DeUpi00azKFmB2AuwV9LxZ
PTg5Fu6NQEb5REUWy2gCYmm3dSJdVaornhmhwGLeYpi0Nkc2IVsMdeyad/0sSZRY
XYwKZbYL8ZWwRi2i4dx9Aq5IKZSpYZPSablLQInQ0KgZCLl5pRHlR4aZOSDwTMJG
lhRlvpzeetW9A5+9B6YyLzrIBlOLgbtgoOlyyBLixpsmjnpY9DZij1wYu3Z9PCd0
KgVnIUt/30rvA4GXfdZWIDyKmGzsOhEJBYTtFt0YNpu/K9iH+bSNxwSTwzKMOaIu
9xIBLC94p3pPpFkWptsG8O4elJ2EMK6Eq/LaXRAKSQd/vg+k+R3/qfrlvCPtbwlp
uoxeEl8DCc2vC0tXWB1GoLZMPdOlGiI86fUd1Rz5mL+pJOLSBCldl/YwrlhHQqZn
fwSUBY8eTaNNzy3Ih6aaazYfU7m4RL8uNp0Ztu/9pqiP6lAk4aR0Z3AHKMVTi8Ip
4auvoW60PrzdcjhxZQO8jHmVXNCiraex3fCGpeLxWCqjdJSHJGg=
=6zoS
-----END PGP SIGNATURE-----

--MW5yreqqjyrRcusr--
