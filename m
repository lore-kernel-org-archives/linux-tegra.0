Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D267EC433DB
	for <linux-tegra@archiver.kernel.org>; Tue, 19 Jan 2021 23:53:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A47BE2251D
	for <linux-tegra@archiver.kernel.org>; Tue, 19 Jan 2021 23:53:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727612AbhASXwo (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 19 Jan 2021 18:52:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406399AbhASN7H (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 19 Jan 2021 08:59:07 -0500
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com [IPv6:2607:f8b0:4864:20::72c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9CF5C061574;
        Tue, 19 Jan 2021 05:58:22 -0800 (PST)
Received: by mail-qk1-x72c.google.com with SMTP id k193so734506qke.6;
        Tue, 19 Jan 2021 05:58:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=nDg3MSaSmW/QUwXKAX2yr0bwfrbQw4H0zZIY31w5eOc=;
        b=sSVDghft1NBADOLQaX2lOFLaOd62nQL8EV93AnAGZZRJXCC8hN9TBeI3b4l9sWkrhC
         jOrREScDNjuRMZcvveZ9bMlueMIOtjKdlFDQ/dEO9cxwZrvMd043RT9oooMsTMMk1omE
         89PVo3T6EZeZ1rJ3aNox+N+Sn4QZeKIvhG+1McYAHrbYQg19SmTJ2UPuWrjxKdFd+SpN
         Av/48ruPLGktkBx3TgKIj1Zx0AzWFrz1QP1lfMpwp58oDCDaGhQTJdVxfG4E8glwyMij
         TYRpUrnbmDnJL3xt9RiWX/g7i5z2uhL27hPztNTNwqgykw9K17ZhxeVf1g23PqkBy67D
         rgtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=nDg3MSaSmW/QUwXKAX2yr0bwfrbQw4H0zZIY31w5eOc=;
        b=UMKi60hF87/eZRQrlwGYKJxZc17K1xF64oHs0dsmaqQmvrUFKafZ1ljLWQBgnAzB8e
         KHB2GuLybvhRpyH0xsI2UTXeXbSOk3VOeSCUwLo+whuh5k3IqvUiNEa/+0aDb9Wd14eN
         x4yK4h36AqtidzBeCKJs49pZcT6agO02JmxNE/gLym3/qm/0ZfMNN1wtAIyczqwaaLnm
         qjc1zkKq5jDs4t7C/B5ycdJExwVHmg7es5Y1L+yzyxQHYwAZMbCtQSe4qb7uAL8JhoY4
         lA8a0nb/IfnDP0bVQi3U1ZJpYorMr7tVLWTUqGVj2JUUzZBKCV5Qbq0k4f4XfF8GE6t/
         F6lQ==
X-Gm-Message-State: AOAM532nF74dt/2AsI1/dBhuHsWtMN/0LDRK0GutOfiGiZxq+58qHuLH
        +eLZ+OfIpijGH83YjKxQ8QM=
X-Google-Smtp-Source: ABdhPJw5PGXbl+MKF/jHXLtXqibUZ5rVpv5QXQ/JShh7xyS6czbf+H++QVNge7SewYlcohjLMv4afg==
X-Received: by 2002:a37:7003:: with SMTP id l3mr1255066qkc.467.1611064702210;
        Tue, 19 Jan 2021 05:58:22 -0800 (PST)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id x25sm12686774qkx.88.2021.01.19.05.58.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Jan 2021 05:58:20 -0800 (PST)
Date:   Tue, 19 Jan 2021 14:58:18 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     JC Kuo <jckuo@nvidia.com>
Cc:     gregkh@linuxfoundation.org, robh@kernel.org, jonathanh@nvidia.com,
        kishon@ti.com, linux-tegra@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, nkristam@nvidia.com
Subject: Re: [PATCH v6 11/15] phy: tegra: xusb: Add wake/sleepwalk for
 Tegra210
Message-ID: <YAblelq2PGXGVKOX@ulmo>
References: <20210119085546.725005-1-jckuo@nvidia.com>
 <20210119085546.725005-12-jckuo@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="y0RLxbukScfb7M8w"
Content-Disposition: inline
In-Reply-To: <20210119085546.725005-12-jckuo@nvidia.com>
User-Agent: Mutt/2.0.4 (26f41dd1) (2020-12-30)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--y0RLxbukScfb7M8w
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 19, 2021 at 04:55:42PM +0800, JC Kuo wrote:
> This commit implements Tegra210 XUSB PADCTL wake and sleepwalk
> routines. Sleepwalk logic is in PMC (always-on) hardware block.
> PMC driver provides managed access to the sleepwalk registers
> via regmap framework.
>=20
> Signed-off-by: JC Kuo <jckuo@nvidia.com>
> ---
> v6:
>    no change
> v5:
>    no change
> v4:
>    move sleepwalk/wake stubs from 'struct tegra_xusb_padctl_ops' to
>    'struct tegra_xusb_lane_ops'
>    remove a blank line=20
>    rename 'pmc_dev' with 'pdev'
>    remove 'struct device_node *np'=20
>    rename label 'no_pmc' with 'out'
>    defer .probe() if PMC driver is yet to load=20
>=20
> v3:
>    rename 'pmc_reg" with 'regmap' and move to the top of 'struct tegra210=
_xusb_padctl'
>    change return data of .phy_remote_wake_detected() to 'bool'
>    change input parameter of .phy_remote_wake_detected() to 'struct phy*'
>    remove unnecessary 'else'
>    rename 'val' with 'value'
>    rename tegra_pmc_*() with tegra210_pmc_*()
>    remove VBUS ON/OFF control change
>=20
>  drivers/phy/tegra/xusb-tegra210.c | 930 ++++++++++++++++++++++++++++++
>  1 file changed, 930 insertions(+)

Acked-by: Thierry Reding <treding@nvidia.com>

--y0RLxbukScfb7M8w
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmAG5XoACgkQ3SOs138+
s6HT9RAAmRCnT89nxyY9HXYwGFC8OvEoNVtwhcOICytkXiUpaMX3SbQMkPsrr97Z
am1qgDCs1wqYhCKJYCUtVZIA/csGepBBUIXRfBapuZcavUeZeKxLNBygnVz1mjpt
n1iBRIyECZigzrAV1mAPZnUJL0P3l0ZSk5p+NsysPkyAO7Q7w/LMZb4Jrt/X+ZZf
QyXDpKwIzGGlb7NnVtmm6Njxyyicl9UpgtzWwAyQnN3IEbcgPdjZlamYHTiwEqXH
pVvj/ObvQOnXEBoSG2l5I1BzaB3Igk2yPNDNgKU6k5EpS6nPOma3f4y4GbMi+WAp
5Yd9V43x0fhaWJY5nlkXHowQ6S7DkF8kSS3d92khyHHtGBOMohP9onpvs9pb1Tqk
fVkAUUjnYoT2U01qmd+MT3sRzgoBfOFcqOlgcIv+U8bEegFRAw0mYod9tsclprRr
kFrIS4GRHZmfimNJlsiRKZUuG3ZthSwfhTKXx0gkxtafXxJ0E0MJpVHGkH2Efvuc
5vSCqX+03Xmo/mqlRUp+ASTzKiS3fE+hJU3DIgGn5I/MJtCW6pcXFb05hFSRi3IJ
NZHL+T+P1leoDOZm/mtAukgchqZXQLi/OQMvH0gM+OPsLA19sB0In0ONyC5QGrRz
T7V4Uns1xAbq0oN0Bb4zsA30xwGsehsy2Q24+cV4LxjN8sFm2gc=
=VcYB
-----END PGP SIGNATURE-----

--y0RLxbukScfb7M8w--
