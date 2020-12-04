Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A46B0C4361A
	for <linux-tegra@archiver.kernel.org>; Fri,  4 Dec 2020 11:10:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 48D6D227BF
	for <linux-tegra@archiver.kernel.org>; Fri,  4 Dec 2020 11:10:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729952AbgLDLJ7 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 4 Dec 2020 06:09:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728018AbgLDLJ6 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 4 Dec 2020 06:09:58 -0500
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 913E4C0613D1;
        Fri,  4 Dec 2020 03:09:18 -0800 (PST)
Received: by mail-ed1-x542.google.com with SMTP id c7so5402375edv.6;
        Fri, 04 Dec 2020 03:09:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=rAR9orkb5qmNC53ThA2KBvGwVIV3xnyehFuf7TXDza8=;
        b=qklmispeF9NSndgMUCr8XPpiWgCnE+3yh0bhcv9slPM/4/sq/Cy57wAlG4yExPM8S4
         kdvcjcwdwz3NhiUBInEbhHwkCuLwqEdSlpL/EGbJDW06VdNK0j4X66DxHGks10f5o82T
         4Cb9USWDErteqk4aswb7ZKviqUuc4fWgIxT4YcasByT67Zwib8J0/wZ7QPl5ul7reeoV
         ZI6Ob+QjL9PxEFvlQwiqC+OBS1hCVHGOGMDzdG6payPBYkNGOleiUW758XUXVVklo0zT
         FW6YSaX80LEp87RcC0W4cinxhVJ6MgqSp6jGRnfN+qkny/W0s3zRglKEIZAjjOZf8DI+
         autA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=rAR9orkb5qmNC53ThA2KBvGwVIV3xnyehFuf7TXDza8=;
        b=JeSj/OPdWAq/NPggXhZey2Eh9bxUMF2STXAznTcdd8Q3vxr8RP5mH0hSF1x+9u9hQF
         7YmurKaMcG+rrVeVfpZGan3z9B8hZ5WEG8Y0xS4iZbfoGSH4hjEfqGRwbhzTP8vc5nan
         87Z6WTVvq+YDYXNdqmXTQojFCRekryTdj84+qGhePdvd1Q8kRfnI3eEKrIZQrwb5KdRP
         z67wBYIhS5VYLgQq1Eh0K02pYpvKG3iKV0BjOYIpItJJH8VlZq6nV6dC1K8skg7+Co17
         YQxHF7MaAmcJWwOX8+joyOpz1xgqo4rwIbT2Xbn0stutsHDCCtwXqwEJ+pqnzI6KguBC
         7mkA==
X-Gm-Message-State: AOAM533ROUJiAZcX5QJuvatjB7Mk8Ha51dtOwzgNhbPYScNnobaIZEVb
        62cRU+K3rKKf1K/TY+ejSXB8GLVyr70=
X-Google-Smtp-Source: ABdhPJz8Cq2g+zeRiSrPMm4y90sDgq3pgTqYH+0NJMNpqHanTwnMeQeufYpcTA7XOtRZ1PQ2PtXtCA==
X-Received: by 2002:aa7:db8a:: with SMTP id u10mr6958845edt.204.1607080157328;
        Fri, 04 Dec 2020 03:09:17 -0800 (PST)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id v8sm3102598edt.3.2020.12.04.03.09.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Dec 2020 03:09:16 -0800 (PST)
Date:   Fri, 4 Dec 2020 12:09:15 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        JC Kuo <jckuo@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soc/tegra: fix T234 build failure
Message-ID: <X8oY28tTLXxnG5bx@ulmo>
References: <20201203230554.1480352-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="8QM8GXRs1wW0T4HO"
Content-Disposition: inline
In-Reply-To: <20201203230554.1480352-1-arnd@kernel.org>
User-Agent: Mutt/2.0.2 (d9268908) (2020-11-20)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--8QM8GXRs1wW0T4HO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 04, 2020 at 12:05:47AM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>=20
> In a T234-only configuration, the fuse driver fails to build:
>=20
> drivers/soc/tegra/fuse/fuse-tegra30.c:376:10: error: 'tegra30_fuse_read' =
undeclared here (not in a function); did you mean 'tegra_fuse_readl'?
>=20
> Add the missing check in the #ifdef conditional.
>=20
> Fixes: 1f44febf71ba ("soc/tegra: fuse: Add Tegra234 support")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/soc/tegra/fuse/fuse-tegra30.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Do you want me to pick this up, or are you going to apply it directly to
ARM SoC? Either way is fine with me, so:

Acked-by: Thierry Reding <treding@nvidia.com>

--8QM8GXRs1wW0T4HO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl/KGNoACgkQ3SOs138+
s6GjUQ/9GHbUZKKst76AqQFbD03xEKI4WHeDMFzzQX30+HgpbvWIUDz6LWXEUPoc
H7nc11oNCdLBr48u88k6thZKV4cjRdX9s+qs6Yq+wIFoEKzKhAHlaP6ENSf1arf7
CMA7KOKZ6hRE68njdiE6IsQfU6569fDmA8Q87qXT2mgTaQCobcUlIDHJklNmVmlW
ij7p5gns1ykMyqwZnv+NP5ke3ILagchZeLjCmBnZgbDtty0JRl5BUJezUIctRLUU
+rSIyWj5EZlm4kOEIzaN5h8KfauXFMmHW1vajXLBK1gl12roPqNym6o0+vgbO12f
Tbq99KEN4nAU2gBJHA23iAve+X/+fthjfW1wlbz3Oe3ozwzwI5QUjqahov43FzlL
HF/DJ1irbvI7lQMpEgu6YuaIHVHvdgdGViaXlVhm8EiWRBrwnkXlVV2cDmT151hT
jISkUM9Gu/+GejKQfnzMry5trrJ70QcPJVI+0BkxNaCyart7JrjNYoukrfKY2nxj
CWYLAMKtQLGZyr+vECE8Jyl9wI1v9vf5CL9AwKd2UxsTyYE+kTjPBWZZrnfdoyDT
JlVcLW6pQZ5P5Lnq9CmzlfuCAy66UhKTVvshTi8KJ+4tC7bSxNK34OHVKVakjqVt
RL2BDmc4bp+JF8+2wFhdkfUCdN6lW7vlucRzISfPsZjZGS9tR9E=
=2aIu
-----END PGP SIGNATURE-----

--8QM8GXRs1wW0T4HO--
