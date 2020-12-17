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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38ABBC2BB48
	for <linux-tegra@archiver.kernel.org>; Thu, 17 Dec 2020 13:43:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 072F423975
	for <linux-tegra@archiver.kernel.org>; Thu, 17 Dec 2020 13:43:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727769AbgLQNnR (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 17 Dec 2020 08:43:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727385AbgLQNnQ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 17 Dec 2020 08:43:16 -0500
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F93EC0617B0;
        Thu, 17 Dec 2020 05:42:36 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id y23so5764282wmi.1;
        Thu, 17 Dec 2020 05:42:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=y2tCpEgJ2Ia9pQf+OBM2EJwVWA5qX5ybW6vI6jPjQhk=;
        b=XdCTiZNOm3b2tQM/ZlSAS7kDh0j54pCfoyLt6DDcbbXiyKuMFRgNTJnbDB7rdvAMBb
         nKvhFSmEE/3u8E4kgRNQ2QOH9y0cQa11w4cwOudJwm4rFSVIujKJB1gLAlQSlk9koXh9
         36qPvikuOUU11GJRROBS18M1p2GO0AsVhzlI8djCxOiZhOCe5wyw643eOeD/xu9+cEBJ
         33g1S/sCZdNQBsyeqNdzBW9NVsvbXzowR0BVso+ss5h9nO3Tf/vEEAm/jn7Lxp+dqr20
         QO6NZrqz9MUBGne3slmf6G6M9qRQJzuB/dYKCOpCH9wUoLMEUbuOI1aq5WxcZ+Go5YzS
         tICg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=y2tCpEgJ2Ia9pQf+OBM2EJwVWA5qX5ybW6vI6jPjQhk=;
        b=d7uG6CfJrwBKgOuvWMhVHH43TS2dCas/0EB5G+uY8GSDRyel5vZIsk24mkMiati3PJ
         5f29MMdaBZzDSmBoPKMBM/E8yZog80RoDJ1i/rhj1uF8JVB/zXqaa9WWf6IKc9Wtqkot
         5L0UzM0TdMV8+vuzT+33Dlg13S+Gtf2mDsjFylj2qbciVduovITdPnEVQtzHfMW4NKDt
         uM2yQuN6kTsb94qNXCdSCMrCXhwOZSY7kNgrasC0Z66gw4F1dOCYN3xLX7W3K8OxO/v4
         EmPJG+9JHjih/0X1+/C2U4EjNs8LdD6Zv/Ljul1U3pJuUPY+KSQCDYtIIZu01NnK3tVt
         Mwfw==
X-Gm-Message-State: AOAM533RYDG8xNsmdTFzYXyZq1IMOhu2WFgNWqYdzOtLmP8x5ocyiiUk
        2KJYC7yAPOYTj4jCALAEW+4=
X-Google-Smtp-Source: ABdhPJxPm+GBn5fWjJyOGtY3tgDT6sYa9I9OcdztQ/jrh3DkBiGPzastgA5wrXT9vXMiDbEo22I8nw==
X-Received: by 2002:a1c:a185:: with SMTP id k127mr9089789wme.23.1608212555111;
        Thu, 17 Dec 2020 05:42:35 -0800 (PST)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id x17sm8988714wro.40.2020.12.17.05.42.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Dec 2020 05:42:33 -0800 (PST)
Date:   Thu, 17 Dec 2020 14:42:32 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Peter Chen <Peter.Chen@nxp.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Felipe Balbi <balbi@kernel.org>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Peter Geis <pgwipeout@gmail.com>,
        Ion Agorria <ion@agorria.com>, linux-tegra@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 7/8] usb: host: ehci-tegra: Remove the driver
Message-ID: <X9tgSPfFqFwEWV2m@ulmo>
References: <20201217094007.19336-1-digetx@gmail.com>
 <20201217094007.19336-8-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="YxOjwJPOhR/B4PYY"
Content-Disposition: inline
In-Reply-To: <20201217094007.19336-8-digetx@gmail.com>
User-Agent: Mutt/2.0.3 (a51f058f) (2020-12-04)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--YxOjwJPOhR/B4PYY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 17, 2020 at 12:40:06PM +0300, Dmitry Osipenko wrote:
> The ChipIdea driver now provides USB2 host mode support for NVIDIA Tegra
> SoCs. The ehci-tegra driver is obsolete now, remove it and redirect the
> older Kconfig entry to the CI driver.
>=20
> Tested-by: Matt Merhar <mattmerhar@protonmail.com>
> Tested-by: Nicolas Chauvet <kwizart@gmail.com>
> Tested-by: Peter Geis <pgwipeout@gmail.com>
> Tested-by: Ion Agorria <ion@agorria.com>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/usb/host/Kconfig      |   8 +-
>  drivers/usb/host/Makefile     |   1 -
>  drivers/usb/host/ehci-tegra.c | 604 ----------------------------------
>  3 files changed, 6 insertions(+), 607 deletions(-)
>  delete mode 100644 drivers/usb/host/ehci-tegra.c

Acked-by: Thierry Reding <treding@nvidia.com>

--YxOjwJPOhR/B4PYY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl/bYEgACgkQ3SOs138+
s6E5Tw/+KFCf97kKuL5jsfZrGId8s3jh8ukIIwP+sFa0yW/+wXqmwwbauQ9BWTWx
EP60oe7g+gykERthUaqmaKDsFVEj6VugerD5HU43NoIp2Nn2gO0ZuvmLLxWwgUkA
Be7lDuZMz+4pVJfJMJXlY/CS+NbC/zHMEyCCFgHzqY0zaR7w3MMjnmvWWf0/Y/QU
2CLsdOP44tYCawQhtOaMFjAsvBeUFuHBw+AZJ0LyoaWx3A01g5kASKfSdi0Fetn+
WrsvA4b1djJ/nrMRdgzKkxO1JoNgE99uOm2yPjuoBAkRVVNOFuTbX8d7hjBVx6qw
kljSeV9rbfyKBdI9tFlumUedkzytPF5b7YIPCBNaD61Nykw4tyHjoeVQGQrqZgTA
Kk/07emcSzAYT7bwtwoHpqI102H38KtJ89pj7unzo2Hm91FBL7s7IwS0uzYHO5hK
yuRljfwmjUyf+RHQf/SVl5GQL0LD3Y6eaNqbBUxaf/zaSOVTWPBLuCAzv5gmjKbz
ZCs88hFDmRk/gvG7zkPKBIA+LyUs1tSoLo0qnC7cg1XK9wuZgIiMMNA+9qFd0/Ph
S+blMC7m4abZ72h17Z+r8ahFj/LcEHUDuqyQr6tqiZmbia0wkg9vaqfRP1K6qcyI
cvQKUCn/QUbiqszrtKMVbHz0F71HaGjT4qKo1wXoiX6ipdzOLhc=
=+cu3
-----END PGP SIGNATURE-----

--YxOjwJPOhR/B4PYY--
