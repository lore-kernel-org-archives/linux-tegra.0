Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CCD6ECAAD3
	for <linux-tegra@archiver.kernel.org>; Thu, 15 Sep 2022 10:27:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229554AbiIOK1c (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 15 Sep 2022 06:27:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229458AbiIOK1b (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 15 Sep 2022 06:27:31 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59DA39837F;
        Thu, 15 Sep 2022 03:27:30 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id c11so30118900wrp.11;
        Thu, 15 Sep 2022 03:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date;
        bh=pqMDBU7yH/U+sBeUUMCs4CqMuFQSfejygTXmWsycrl0=;
        b=SF++0naCEZpYnQwlsg0ufyj25lXtHTQngtphcyJOkFYTyo/0ZKY/3+Ig7CMybpXvtd
         H5o60nKc6ZSCURsxfVZYckMRqMnAw5F1CzodLibwjSMKziLY2jo6TV5mn3Hqw53zx3gr
         OE1EemAGy9JfgXTZyT8ZDI9mz8b0/iJH0743QQ04+YL6/4LTZH/1JMYJsilbyfuFgxSu
         4PQ5xk5ElX55QR0UCwK6r/zizmDMMe7kazJeWOgsIdvfWZKVvH2DtBXRsinrwkwBQELB
         G5qFEvCvIto73U1TPUU9DJz66amMxYJGyCxeU+fljen9XJWUs9jyZhT/1AkR4wBihcbu
         IYeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date;
        bh=pqMDBU7yH/U+sBeUUMCs4CqMuFQSfejygTXmWsycrl0=;
        b=wSEQ0bxKGLTstPEK2aJfgmAWd/bWpsIHfePaB7h4B5o2TKvxKC5qOyR3n4LfK3MaJk
         y72BjTGeyIGn04+SupfFUIr8tPCh7B39AwuccuLoFHQEA1UFmY4Zi2GSY+HteTDbMVw6
         WBL7ieuct4FZ2c6cX0uKs0s/W/Ay5Mx8mrO4/1N31oIhWDX94ANTpd8fy30w5qbOhKVA
         +qRTCIFRKeifKTWZVWQ4RdrZ7afp2j/BHbCCWlEQB0E1NPZpm5ktxQhGyi48vnuxOxbc
         HVKDzMWeZR5STAbYews0gaNa4kpvJTfoLEOcfETlLXJaFXagtrLmUjAoV7943JVgJniW
         Qfhg==
X-Gm-Message-State: ACgBeo2wGN0ohVOR6hUZ9Tuouc6Vv/OmcyG8amkJLGiYHSLTQ84zPqPw
        8ZHynB0hq4jw74EOUGyFVlZu7ynFg/s=
X-Google-Smtp-Source: AA6agR5rUQBRcYO26R6EeevOp/NefVoQLA7Wx2OAJdTFOt/yrtqPi+OFiuEdgHm+6y4GGhmgOFYJmA==
X-Received: by 2002:a05:6000:2c9:b0:22a:c481:20b with SMTP id o9-20020a05600002c900b0022ac481020bmr6054123wry.7.1663237648626;
        Thu, 15 Sep 2022 03:27:28 -0700 (PDT)
Received: from orome (p200300e41f12c800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f12:c800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id k1-20020a056000004100b00228de58ae2bsm2206822wrx.12.2022.09.15.03.27.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Sep 2022 03:27:27 -0700 (PDT)
Date:   Thu, 15 Sep 2022 12:27:26 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Cc:     krzysztof.kozlowski+dt@linaro.org, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 0/2] arm64: dts: tegra: smaug: Add Wi-Fi and BT DT nodes
Message-ID: <YyL+DmHdJBdoy5KU@orome>
References: <20220914111221.862929-1-diogo.ivo@tecnico.ulisboa.pt>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="6y91c4p9jNMuq7DK"
Content-Disposition: inline
In-Reply-To: <20220914111221.862929-1-diogo.ivo@tecnico.ulisboa.pt>
User-Agent: Mutt/2.2.7 (2022-08-07)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--6y91c4p9jNMuq7DK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 14, 2022 at 12:12:19PM +0100, Diogo Ivo wrote:
> Hello,
>=20
> These patches add DT nodes separately for the BRCM4354 Wi-FI + BT combo
> module in the Pixel C, and have both been tested on it.
>=20
> Thanks!
>=20
> Diogo Ivo (2):
>   arm64: dts: tegra: smaug: Add Bluetooth node
>   arm64: dts: tegra: smaug: Add Wi-Fi node
>=20
>  arch/arm64/boot/dts/nvidia/tegra210-smaug.dts | 36 +++++++++++++++++++
>  1 file changed, 36 insertions(+)

Both patches applied, thanks!

Given that this is a rather old device that we rarely see third party
contributions for, would you mind sharing some details on your setup?
Are you running any of the after market OSes on this?

Thierry

--6y91c4p9jNMuq7DK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmMi/g0ACgkQ3SOs138+
s6E7aQ/+MmvNInAPg/rb6Dp+BQGFCa7zlHZBgQn2DoYkg9G6nkkDe6uMfYtGTbN6
TYf9ydIg90HJB93n0at7E6BzyzGzcYZZG9ngjN+U3ZRheij75kHfv2HTmh1JaHWH
POQOQhR0LW4CzZamFZNfj098eCNE16HyM98/BuuQn3tbcd3oWe6+pv+zMHRpS9AJ
2QftKhu6p9k4k6uUEVjQBtiHRb1b7TDBh4W2qxgJXyaigQ+mf2A9V3gj0IVQ3gSi
6ze5dZZYXoDgDcSDaj5T8a0eDx94//V/LeLGgdxYDfBVXHxernkLI3NnhVrLnqXx
WKvGlOr+2hljdwZqvRCTEFtIHC73eBpKlpcK1YL7pPFJFHnYLRvyYa8cwWnKZPJI
lXvArJ24YOQVqF5pwksexbaF4i37Jmtelbb2CcZ2iLrPMtYY1huVxUum6gnX8DNL
tygiUqlH7P/87kn28hBGF17CfO8MapAah8KIbtvoONTuL7b7gjz19mD0HOJ0HWbd
Hq0DROaeR4sBFvlYmbQG8xy/piOToKxsukXowWtuKTCmGnFiJi9AhhdQrzgqyRbv
JoKGXBC4IYWyVTsqrYqXPkb4Ogj1oz5UrXBn/VdM2fhJjVi3IyEWVljeV4cLmb8S
Kj/etcTxLiJE88tVYFlI4ITTB/c7WEgufzPxie6QAEkMcFcgRC0=
=f4EQ
-----END PGP SIGNATURE-----

--6y91c4p9jNMuq7DK--
