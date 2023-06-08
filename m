Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4CE2C7EE25
	for <linux-tegra@archiver.kernel.org>; Thu,  8 Jun 2023 16:35:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232728AbjFHQf3 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 8 Jun 2023 12:35:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236046AbjFHQek (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 8 Jun 2023 12:34:40 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8449035B0
        for <linux-tegra@vger.kernel.org>; Thu,  8 Jun 2023 09:33:54 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-3f7a8089709so8155025e9.1
        for <linux-tegra@vger.kernel.org>; Thu, 08 Jun 2023 09:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686242032; x=1688834032;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2nIMWVgBZO9wviaXqxbxhm1OfLgkdmtS0aN3f28jgdY=;
        b=qDxFdUobwkFasyL8eym/uXsW/Y9PS7vLGOg1KmrJNqOpDzwK4hY4YSmM62yMY+XiMi
         dpzantEF8+q7gKUi/p1pQ+U8eH0chqvGKSN6Uij9QAhCJRTzt/swK5k/slpUjv4uqS+V
         hrW27P5FKVtNpqTQXbvu0nGsYsoHhZ2XOjLZeVHWl+IQsEh9Ko5OI8RT5ZLu5vSwtvgB
         KaMdlQPSElklyzY3nStEDsP8I92ZoY9SyBE2QiCcq7WnRie+sX6bc8Fg8njhUccfGBHj
         PbYRbNHOBb6j2bX2bgCnWeYLwfVv+7d6xx/YOro5+qVA+bxeSbf6VwRAmU0FUcHsSZBg
         6B5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686242032; x=1688834032;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2nIMWVgBZO9wviaXqxbxhm1OfLgkdmtS0aN3f28jgdY=;
        b=ZcLwqgRM/ogzkcqYZxdzhayxQPhRblO72igTCvrLqfEhojdAP2DTbiIM/4tVK0XDA9
         gkgVgWQ4wHuGWvqNGlUfuIx14wNvfcMeGxR0GfWmPsnc0u5LjAMSddBrT0rIyRaGclXa
         qmgix3930sXvUJr0psX58rMvN2dU9wSu50+c8InTiBN/XG31mKbSGjFATOKLCB/jA3ZF
         Xi5jPSbyOJbGTFMqiv9vPiivblHsqC6stH6zp35FjKq5ytT6VVYOBnLYjsTXs/bOixwA
         SK/uqkY/vu7XegxWfhaDDemxOLpWNzA/PE3XxokudzGz3Q2jrYsLjryxZMTzlPc+E42H
         6i1A==
X-Gm-Message-State: AC+VfDwWpo57thDtfdTds6MuYpxYHSe6jizzbwpZnonZ7ywAnVVvo4IJ
        UfPYSrMeHCqCWnBV/4WsjEMTfN9FpAo=
X-Google-Smtp-Source: ACHHUZ5g+UYR1Zt2hMXgNUlR0COkerAkFdQk1GyBrsuIggzHAJIwqAksxz7Cv3xSuOi6VO0q1U+cOQ==
X-Received: by 2002:a1c:6a12:0:b0:3f7:fcca:5e32 with SMTP id f18-20020a1c6a12000000b003f7fcca5e32mr1547551wmc.17.1686242032115;
        Thu, 08 Jun 2023 09:33:52 -0700 (PDT)
Received: from orome (p200300e41f305300f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f30:5300:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id l8-20020a1c7908000000b003f7f4dc6d14sm112421wme.14.2023.06.08.09.33.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jun 2023 09:33:51 -0700 (PDT)
Date:   Thu, 8 Jun 2023 18:33:50 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     linux-tegra@vger.kernel.org,
        Petlozu Pravareshwar <petlozup@nvidia.com>,
        Bharat Nihalani <bnihalani@nvidia.com>,
        Kartik <kkartik@nvidia.com>
Subject: Re: [PATCH 1/3] soc/tegra: pmc: Use debugfs_initialized()
Message-ID: <ZIIC7qHzo8XFD92F@orome>
References: <20230606153608.94289-1-jonathanh@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="guwFSYA8aK5gwrvY"
Content-Disposition: inline
In-Reply-To: <20230606153608.94289-1-jonathanh@nvidia.com>
User-Agent: Mutt/2.2.10 (2023-03-25)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--guwFSYA8aK5gwrvY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 06, 2023 at 04:36:06PM +0100, Jon Hunter wrote:
> From: Bharat Nihalani <bnihalani@nvidia.com>
>=20
> The kernel command line parameter debugfs=3Doff can be used to dynamically
> disable debugfs support at boot time. However, the Tegra PMC driver will
> always attempt to register debugfs entries if CONFIG_DEBUG_FS is
> enabled. Therefore, if CONFIG_DEBUG_FS is enabled but the user sets
> debugfs=3Doff, then probing the PMC driver will fail.
>=20
> Fix this by using the function debugfs_initialized() to check if debugfs
> support is enabled before calling any debugfs functions in the Tegra PMC
> driver. Note that if CONFIG_DEBUG_FS is not defined
> debugfs_initialized() will return false.
>=20
> Signed-off-by: Bharat Nihalani <bnihalani@nvidia.com>
> Signed-off-by: Kartik <kkartik@nvidia.com>
> Co-developed-by: Jon Hunter <jonathanh@nvidia.com>
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
>  drivers/soc/tegra/pmc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
> index 5d17799524c9..12e852a8a609 100644
> --- a/drivers/soc/tegra/pmc.c
> +++ b/drivers/soc/tegra/pmc.c
> @@ -3026,7 +3026,7 @@ static int tegra_pmc_probe(struct platform_device *=
pdev)
> =20
>  	tegra_pmc_reset_sysfs_init(pmc);
> =20
> -	if (IS_ENABLED(CONFIG_DEBUG_FS)) {
> +	if (debugfs_initialized()) {
>  		err =3D tegra_powergate_debugfs_init();
>  		if (err < 0)
>  			goto cleanup_sysfs;

Judging by other patches I've seen sent over the last few years, I think
the more idiomatic fix would be to just ignore the error returns from
debugfs calls. I think in this particular case we can probably just make
tegra_powergate_debugfs_init() return void. Any subsequent calls using
the pmc->debugfs pointer will ignore errors or NULL.

Can you test whether something like the below fixes the problem you were
seeing as well?

--- >8 ---
diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index 5d17799524c9..16992ddd6e04 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -1190,14 +1190,10 @@ static int powergate_show(struct seq_file *s, void =
*data)
=20
 DEFINE_SHOW_ATTRIBUTE(powergate);
=20
-static int tegra_powergate_debugfs_init(void)
+static void tegra_powergate_debugfs_init(void)
 {
 	pmc->debugfs =3D debugfs_create_file("powergate", S_IRUGO, NULL, NULL,
 					   &powergate_fops);
-	if (!pmc->debugfs)
-		return -ENOMEM;
-
-	return 0;
 }
=20
 static int tegra_powergate_of_get_clks(struct tegra_powergate *pg,
@@ -3026,11 +3022,8 @@ static int tegra_pmc_probe(struct platform_device *p=
dev)
=20
 	tegra_pmc_reset_sysfs_init(pmc);
=20
-	if (IS_ENABLED(CONFIG_DEBUG_FS)) {
-		err =3D tegra_powergate_debugfs_init();
-		if (err < 0)
-			goto cleanup_sysfs;
-	}
+	if (IS_ENABLED(CONFIG_DEBUG_FS))
+		tegra_powergate_debugfs_init();
=20
 	err =3D tegra_pmc_pinctrl_init(pmc);
 	if (err)
@@ -3067,7 +3060,6 @@ static int tegra_pmc_probe(struct platform_device *pd=
ev)
 	tegra_powergate_remove_all(pdev->dev.of_node);
 cleanup_debugfs:
 	debugfs_remove(pmc->debugfs);
-cleanup_sysfs:
 	device_remove_file(&pdev->dev, &dev_attr_reset_reason);
 	device_remove_file(&pdev->dev, &dev_attr_reset_level);
 	clk_notifier_unregister(pmc->clk, &pmc->clk_nb);
--- >8 ---

Thanks,
Thierry

--guwFSYA8aK5gwrvY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmSCAusACgkQ3SOs138+
s6G4GA//ZN7whcwrmt2UP9AXHGzAwcKYdTqu2P4kXj9OeehhsP66UO4cdAjRNVwd
fFMzcJxlGkrrLbxKetY1mL9Gd4KruPWzAV+1iHawIdq8MaVgdgE+priL8IG0OFyz
DeZl5GJJsY5bNgB40n9HOFnkTJlMDdykOXFJm2x0325K/YUqfBJRedNJxkmikhDz
1qbMX+hBrMwtkFbNHicgFg/sC1SUStg7kg2oENr6q9K5PjSrri2cXVpfG2UBYt5b
hOfACWdJgW8xf9XTgGBK2v1B1X4xdMOIbZ+9t4ti2mSIr4JADp8UTGtmbPLM74Yh
gkLMWQN1Cf6ZiSwlFoO+LC318WBXpwnfTj8l0bovnV0MtXZvSJYzjN6wlaujhgCv
YHhV6U/3pKVXjoj4RLDS33rrU+/tuZo5L+w4Pfq1cCc2tb99dmn0T0ZwoxWeNla2
MLwYwCOqZnd5X4G6JRWd6qPy7AJw+nAvWrUx3T5cdtG1g900j/1c0+MZ4ppLv6XO
Ek70cYHSwae+2mJSt4VwAUUksvA22xydYWjym29hzspUMti/F8AUiojs4f18UPGc
t+G0ohfgNvEU0rm326YC6oFQmi9wo4JKNc0DtunazSdR+WYDTuHS50D5HPxvM6d4
eq81egAPISOB8XS40GDkYvhyZlCCSOjNFZ9bydnuS8gCTMr2iHs=
=TkRW
-----END PGP SIGNATURE-----

--guwFSYA8aK5gwrvY--
