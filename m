Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58BB3C7619A
	for <linux-tegra@archiver.kernel.org>; Wed,  5 Apr 2023 12:35:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238070AbjDEMfI (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 5 Apr 2023 08:35:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238013AbjDEMfH (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 5 Apr 2023 08:35:07 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA90C2D44
        for <linux-tegra@vger.kernel.org>; Wed,  5 Apr 2023 05:35:06 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-50240a3b7fcso456995a12.0
        for <linux-tegra@vger.kernel.org>; Wed, 05 Apr 2023 05:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680698105;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YRM/+pc2nO1q6Jga5X1hQSURjAjoUaU8M+SqQ5FggLc=;
        b=A3IVo0PqVhq+hqOI4tbGH/qx/tCQuY7qkzgf6/fRs2yEaZlc5ZRYGzMEKfJcvt04H0
         88KCvjUCwinReyiKf+JqpowrribFz2cCr7QOdrom8N02ok+GKtXxQ3JgmDKOxyNBTM/q
         dVw1oCbnNU/UHnFG31gRInY34RG2YX405OWZPujYtxZWirkeKEwoJvjJmduiiZ/w/E+M
         dV3uUEY9fGd9vV0mnZdVQDPnxccjlKB/yIoB+646aHz7CPLZO/9o4vy3fnCnebd+eQK7
         VnbSFZaH61tAaCP0AKHPnD4cv8j1TiLy7fJvkMtdQbtQtjyGbM17hCrI6i5cqNnNdKYU
         LfTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680698105;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YRM/+pc2nO1q6Jga5X1hQSURjAjoUaU8M+SqQ5FggLc=;
        b=a8VruxrtKUG5S6qasIi1XjTgSqUnpspESQl/VVnq3YSwu1jWDenPDDpPxXGhYA39uA
         SXTY1qJCd0UsQ3FYY1nitTfEhj5dytPxKxNevAPCOQ1S6bznN3PtC83xmWMxNROXA0qe
         1IXDJVLZpaVMvpArUGsq3XNhsjIEZ1gKlVWXoLAl0kK6QHHhwHEfjsQCCRt+KCqAnYv8
         r9lW+eVJvjrxTNaeERzV37FG66Ue4JXb5dry2viT18I7DhvXYUGpyFK0US/cH0HvT3Xg
         Xk0wDizBNMKGPWgHQnwm6KB2fDbgaLQHJtemDjibmHtH4qICq33eeLKK16W+uoBS8ikD
         P9IA==
X-Gm-Message-State: AAQBX9dCydxGYyFH66T4znLMPlCYii9x4ix8FzuB/X2Pk7/TDteXKYc9
        R1wnlKwLRnGce49dF4/cYCK9mqeiG9I=
X-Google-Smtp-Source: AKy350YUL6HI954E4Sejz144D52JLeq9Ld/3AiqAkuyzclQV2Yq2UsE+RwQGYiXMMd9sysdeNcTkLw==
X-Received: by 2002:aa7:d851:0:b0:4fb:999:e052 with SMTP id f17-20020aa7d851000000b004fb0999e052mr1563927eds.33.1680698105245;
        Wed, 05 Apr 2023 05:35:05 -0700 (PDT)
Received: from orome (p200300e41f1c0800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1c:800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id q6-20020a056402518600b005028c376d50sm5966542edd.71.2023.04.05.05.35.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Apr 2023 05:35:04 -0700 (PDT)
Date:   Wed, 5 Apr 2023 14:35:03 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Gaosheng Cui <cuigaosheng1@huawei.com>
Cc:     jckuo@nvidia.com, vkoul@kernel.org, kishon@kernel.org,
        jonathanh@nvidia.com, linux-phy@lists.infradead.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH] phy: tegra: xusb: Add missing tegra_xusb_port_unregister
 for usb2_port and ulpi_port
Message-ID: <ZC1q99h32vJQGjGj@orome>
References: <20221129111634.1547747-1-cuigaosheng1@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="IsQQKijO0D7xuQDr"
Content-Disposition: inline
In-Reply-To: <20221129111634.1547747-1-cuigaosheng1@huawei.com>
User-Agent: Mutt/2.2.10 (2023-03-25)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--IsQQKijO0D7xuQDr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 29, 2022 at 07:16:34PM +0800, Gaosheng Cui wrote:
> The tegra_xusb_port_unregister should be called when usb2_port
> and ulpi_port map fails in tegra_xusb_add_usb2_port() or in
> tegra_xusb_add_ulpi_port(), fix it.
>=20
> Fixes: 53d2a715c240 ("phy: Add Tegra XUSB pad controller support")
> Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
> ---
>  drivers/phy/tegra/xusb.c | 2 ++
>  1 file changed, 2 insertions(+)

Looks like this fell through the cracks. Looks correct, though, so:

Acked-by: Thierry Reding <treding@nvidia.com>

--IsQQKijO0D7xuQDr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmQtavcACgkQ3SOs138+
s6GADA/9E/ig3I4NxB9UbEkNuheP8RN8u6/SxspQn/t1uaHTRzGGmwT2KylLmfxQ
0ewLnFh8d4O7F8dmNlr0R6EQNjJSdiFZWIjycqUsjLQ94SbvZY8lU6gOHqpUFUFz
lcNclx96UtQw/Q77+xuNujW+BsGpJCQ5CjTocDztoDhkZal+qn7hwWN2HVF08Dhl
p4YZJEYnXc3a7tiyeMuqTixLWuwsbjLyIl3FJ23mRLQyfAH4k0mRT3Damja5cSnA
GSK/lCuYFRE/TyQQZlMgDdl0ctkXaueSYm6xqnxRboQEeyYgR6kQkGfkz842q/cW
V/WKDklYhFNKzf0vwykqYDs8YgVBagp/rW46X+c6doHyaZmSRBfxtP/cNZBGP0rt
24OBolXMmDS78krpEmRVTwy2jQqBDso5B2S3AjBQ8m21lr0qb7qIDNqGZsC+RiDk
SFmqtTd7Zcl5u+wAPZ4xLmiJRQ4JYQnv5ziUxl3IciQbVfYEAUCg9/uPDTS3XJto
CC8tCfCCwkScY1NXY/9JNqmGS1P84Ln3WT4KK7srvUK5WDA9w6BRktzaBrvYUXPO
B/nv5pSMaOus62EckyBftNtikljW7Jx27YAmnF7sRUShaBdAZ8552uRW4VMJge4g
XaKQTVBDqbnExcZRFwso4X6Axx5iwqk6QLa4oVfjvo8Humhb/QA=
=Vpxa
-----END PGP SIGNATURE-----

--IsQQKijO0D7xuQDr--
