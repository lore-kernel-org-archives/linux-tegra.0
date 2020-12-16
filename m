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
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD898C2BBCA
	for <linux-tegra@archiver.kernel.org>; Wed, 16 Dec 2020 17:59:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7A99025622
	for <linux-tegra@archiver.kernel.org>; Wed, 16 Dec 2020 17:59:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728672AbgLPR7Y (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 16 Dec 2020 12:59:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728665AbgLPR7Y (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 16 Dec 2020 12:59:24 -0500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5DDFC061794;
        Wed, 16 Dec 2020 09:58:43 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id d13so5802243wrc.13;
        Wed, 16 Dec 2020 09:58:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ve7Jlmsbnt71qFPD+2Sf0aXqbo6JYS08Pd/ri6fw8PA=;
        b=pazg4ExcI+iYTGqgJ2XKlS5Ye6XroB2V+9nQmzXQumBArkmTT7HgNpogJHY+UW0NkP
         4D6gKVcvdHIH7JR3HBzP3+AkKHFbGTxPfDDoYd6yRtnODhiK1CdmTB0ax3fGShF4aydA
         atYYpA76CsQFSDMVopqpbjduLhAhQdXB34cRsu4u42Pi7UMFAl08L26sWN6PgVSisga3
         vSUiiaf21b+zRbzbiMbYywGIKXjBu1iKENu17eIzeXcx+Ox4lu1VoZitc3gQmBF0sZKT
         ccd9/9MT6ewsGhHEmgt6Z9WxWHn7ITVl0mP+234VpjlS6QtpWTBK5T6OCRITbNm5sNh7
         cpYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ve7Jlmsbnt71qFPD+2Sf0aXqbo6JYS08Pd/ri6fw8PA=;
        b=dhpUvQdrJhsvSghr188lgHEzaEAATOzljb30nLuAgErq4GJyNlpqM4SJqtoUDXKyKm
         yAsUJfcVc0tufAU+Zje6MX9n7qVmhB2fm7bPtPsqqH6lRF+sxppm1skbIsPmd1lSuM4U
         SfLatQwbDnlsy5LqeFES0Ncjven08qflq3okHFPN772FP/TNXVT/V/uYRLv2ixeVfcW2
         0b3ayMnG96Dl8u/j1Aw2urbQ5R0AKVRnYIsDmlOCuhkBlyBTe3ewvUk1JrVK4tF3bpVE
         3XK4ii0jwHp82AGBFRc5BIlpm18lwztytIDfE/WjRU7EDjpuMybbGYi825DN08i/1GDa
         dcpw==
X-Gm-Message-State: AOAM531AjRWXI5ZCuun3lGo3QXxWFWHBxgjGFN+sf1bGLNw9e6Os2x6W
        8t7uMPX5hD+XseYcQmh6eV0=
X-Google-Smtp-Source: ABdhPJwuqcwT52lvkN/36+bqBTg7pVS4wVcVKDbjpp8nEqI5DYuxdaDIssSyUBxLGc8tzMHT8CVVIQ==
X-Received: by 2002:adf:ec86:: with SMTP id z6mr39532180wrn.17.1608141522538;
        Wed, 16 Dec 2020 09:58:42 -0800 (PST)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id b83sm3624733wmd.48.2020.12.16.09.58.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Dec 2020 09:58:41 -0800 (PST)
Date:   Wed, 16 Dec 2020 18:58:39 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Peter Chen <Peter.Chen@nxp.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Felipe Balbi <balbi@kernel.org>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Peter Geis <pgwipeout@gmail.com>, linux-tegra@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 3/8] usb: chipidea: tegra: Remove MODULE_ALIAS
Message-ID: <X9pKz8O4ESRShKzh@ulmo>
References: <20201215202113.30394-1-digetx@gmail.com>
 <20201215202113.30394-4-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="Z0OHV5uZms33lmlV"
Content-Disposition: inline
In-Reply-To: <20201215202113.30394-4-digetx@gmail.com>
User-Agent: Mutt/2.0.3 (a51f058f) (2020-12-04)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--Z0OHV5uZms33lmlV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 15, 2020 at 11:21:08PM +0300, Dmitry Osipenko wrote:
> The module alias is provided by the OF core for the OF drivers, it
> overrides the alias set by the drivers. Hence remove the unneeded macro
> in order to keep the driver code cleaner.

This is slightly misleading because that manual MODULE_ALIAS is there
for legacy reasons and created that alias to bind against a platform
device created from board files back in the day.

Depending on how I interpret the commit message, it also sounds like
you're suggesting that the OF core will automatically add this alias.
However, what the OF core adds is an alias based on the OF device ID
table, which is completely different.

We don't support board files anymore and to my knowledge the aliases
generated from the OF device ID table are enough to have the driver
autoloaded, so this patch is correct. Perhaps make it clearer in the
commit message why this is no longer needed. With that:

Acked-by: Thierry Reding <treding@nvidia.com>

> Tested-by: Matt Merhar <mattmerhar@protonmail.com>
> Tested-by: Nicolas Chauvet <kwizart@gmail.com>
> Tested-by: Peter Geis <pgwipeout@gmail.com>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/usb/chipidea/ci_hdrc_tegra.c | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/drivers/usb/chipidea/ci_hdrc_tegra.c b/drivers/usb/chipidea/=
ci_hdrc_tegra.c
> index 7455df0ede49..10eaaba2a3f0 100644
> --- a/drivers/usb/chipidea/ci_hdrc_tegra.c
> +++ b/drivers/usb/chipidea/ci_hdrc_tegra.c
> @@ -128,5 +128,4 @@ module_platform_driver(tegra_udc_driver);
> =20
>  MODULE_DESCRIPTION("NVIDIA Tegra USB device mode driver");
>  MODULE_AUTHOR("Thierry Reding <treding@nvidia.com>");
> -MODULE_ALIAS("platform:tegra-udc");
>  MODULE_LICENSE("GPL v2");
> --=20
> 2.29.2
>=20

--Z0OHV5uZms33lmlV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl/aSs8ACgkQ3SOs138+
s6Hp9xAAmYiXTCzXpMmKBqImnY/r3t/354dNZtckaGz6ftNA2mJ1alINNk/j2tdY
eIjXeJDTDspOXD9zI8wZ2k0jWT22r4wfN9FH9c6CQVrOocLQtxfKSna6FnFID+I0
c1xlLy/kp5R1HDYjR1VfukXDVx9pPGXrBgNjaZMOdTPNFhE2LwWxrIIElygoVUm1
TpDY+pzdHxlUr58iTcn5IoCmUPzlolhp1oKxU7aVEjcQ52Hp5Om0VNeasm/ce7fV
it5nKw0Pbml64iP6S3sC2kcD1QZuH/1M77zoxS6fCbdOUo9UOFwj7eeaX/5MqNtQ
DG0LdqXXpcfLpAymmNRPbH+VsjzLteXVmDQK0THLJHUJU2bR+MnHfZckUkSCKCkU
oQpRc5xGnMGF7hJ+5U0DAIF4EQqRyII4wPB/cxsVXZ2ZqRdSWuheHNE4ol4nUvUO
A7OJbMdoE3q5icb8lKhMcxHov64MYGjtgcpUTliS5PvhecCFDC/x1ak9zhGGiTUT
gRWUI5YWfyI1Abc3M0Sk1pB9hUXS3uCUp/JBCdaUBiwj4t+2Mww1fa8rS1Ctgq/1
rwYIWeWgXNaIDymU1FrP/wbEKd3ReqjXu5d0JJhtWm+OZKa0KhPnupBlfkYgMh52
eHKZd78291zRyhHeK//SKDi3Qq0dAkUMHE4q7kYEYZACP/uCBKA=
=OSNs
-----END PGP SIGNATURE-----

--Z0OHV5uZms33lmlV--
