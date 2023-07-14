Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8ADD1C0015E
	for <linux-tegra@archiver.kernel.org>; Fri, 14 Jul 2023 14:38:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236007AbjGNOi7 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 14 Jul 2023 10:38:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236075AbjGNOi6 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 14 Jul 2023 10:38:58 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CD5A10EA
        for <linux-tegra@vger.kernel.org>; Fri, 14 Jul 2023 07:38:56 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-51e344efd75so4025272a12.1
        for <linux-tegra@vger.kernel.org>; Fri, 14 Jul 2023 07:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689345535; x=1691937535;
        h=user-agent:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=n6vYaE9i4kUmXWP2uhG546h2t4lLH2hiTxzCGfy/HD0=;
        b=WPxXETSCLOBLlPTO2OE2LAB5VsyFYEGaFwIMldjNOhUvfB0kFPzyid/hwNiFtW79ZM
         szXBJ0Bbu7KvmJ0+Vt3ygNtawt83j2017J6QOexrhuzXCYCORYq2xyeUartZI1PaoaHI
         WmaVwMXOJdXOut6LZWVFFXaQIpV3DJe/w57z3lWwKLeacu0qJl+Op506CM7awEdaI1Xq
         9daoQQKwIm5a+kPvwYwz9iFHIMpoFM1JOI10q9WOKXXwVqfJJ7Et+DmnyqJ1SXYIZL9c
         ZQtMKJL16DQaptvwsyRicgtxDQRMweHtKLyXmwWAOAk/273L4vpuMJ+USzM+2D/eSg5A
         8Vxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689345535; x=1691937535;
        h=user-agent:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n6vYaE9i4kUmXWP2uhG546h2t4lLH2hiTxzCGfy/HD0=;
        b=fLZVekpgDiFhr9m5IGkPLMsC5wu64CWFAioeUdc8rgV04NLv4pg0hhOXLXNLKGLeAk
         bwmWDf1pgRAmFiATxRiA7waOUGrOEQ+FLQp+bP56uhKfea0QBmTEkWS6N9p3RASjGIPD
         n9QBTKfdANqZXMcIAAKV4nVsOJxeyae19WZbLznNjlbKMWhl1bG6PX04GYTrf36rNwAX
         +KAMvIgrMPELf7U+aUm1ruyE7JQ98mmHp9bPEyqaYU683j1Uflxyfmwv68vbIsLbPqGP
         LZK85pvNliQQoEN97kjdCeJ8qkbhA4c1ztinWWbYEgDZb6oKiWx0x6wC4FMGHvplHBj/
         Xv+g==
X-Gm-Message-State: ABy/qLYBfaRqHiqQ7VmEH73fgF5t3pf8MWjl3lU70kRt5ofdUeajn+2+
        SV6EzQw+ePK4dmHStEfkJfQ=
X-Google-Smtp-Source: APBJJlFRUsrNT8DUUfRt9Ntt/VBb45O5P+B1wYnrlckGiH7ZLLdkZ5EAh5hcp4Aa5rEbUHVRu0iOxw==
X-Received: by 2002:a50:ef19:0:b0:51f:f079:875f with SMTP id m25-20020a50ef19000000b0051ff079875fmr3483382eds.4.1689345534710;
        Fri, 14 Jul 2023 07:38:54 -0700 (PDT)
Received: from orome (p200300e41f4b7100f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4b:7100:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id k20-20020aa7c054000000b005215eb17bb7sm993298edo.88.2023.07.14.07.38.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jul 2023 07:38:54 -0700 (PDT)
Date:   Fri, 14 Jul 2023 16:38:52 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>,
        David Heidelberg <david@ixit.cz>,
        Svyatoslav Ryhel <clamor95@gmail.com>
Cc:     Raffaele Tranquillini <raffaele.tranquillini@gmail.com>,
        Ion Agorria <ion@agorria.com>,
        Maxim Schwalm <maxim.schwalm@gmail.com>,
        Pedro =?utf-8?Q?=C3=82ngelo?= <pangelo@void.io>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Zack Pearsall <zpearsall@yahoo.com>,
        linux-tegra@vger.kernel.org
Subject: LVDS panel compatible strings
Message-ID: <ZLFd_L_Uw1PmpSep@orome>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="7XCPdwxkz+h0ZUBm"
Content-Disposition: inline
User-Agent: Mutt/2.2.10 (2023-03-25)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--7XCPdwxkz+h0ZUBm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi everyone,

I've been working on converting all Tegra-related device tree bindings
to json-schema so that eventually we can fully validate device tree
files. Getting all the bindings reviewed and merged has been slow, but
I have a local tree where pretty much all validation errors and warnings
have been fixed. The remaining warnings that I'm not sure how to resolve
are these:

    arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-tilapia-E1565.dtb: display-panel: compatible:0: 'panel-lvds' is not one of ['auo,b101ew05', 'tbs,a711-panel']
        from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
    arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-tilapia-E1565.dtb: display-panel: compatible: ['panel-lvds'] is too short
        from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
    arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-tilapia-E1565.dtb: display-panel: Unevaluated properties are not allowed ('compatible' was unexpected)
        from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
    arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-E1565.dtb: display-panel: compatible:0: 'panel-lvds' is not one of ['auo,b101ew05', 'tbs,a711-panel']
        from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
    arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-E1565.dtb: display-panel: compatible: ['panel-lvds'] is too short
        from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
    arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-E1565.dtb: display-panel: Unevaluated properties are not allowed ('compatible' was unexpected)
        from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
    arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-PM269.dtb: display-panel: compatible:0: 'panel-lvds' is not one of ['auo,b101ew05', 'tbs,a711-panel']
        from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
    arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-PM269.dtb: display-panel: compatible: ['panel-lvds'] is too short
        from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
    arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-PM269.dtb: display-panel: Unevaluated properties are not allowed ('compatible' was unexpected)
        from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
    arch/arm/boot/dts/nvidia/tegra30-pegatron-chagall.dtb: display-panel: compatible:0: 'panel-lvds' is not one of ['auo,b101ew05', 'tbs,a711-panel']
        from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
    arch/arm/boot/dts/nvidia/tegra30-pegatron-chagall.dtb: display-panel: compatible: ['panel-lvds'] is too short
        from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
    arch/arm/boot/dts/nvidia/tegra30-pegatron-chagall.dtb: display-panel: Unevaluated properties are not allowed ('compatible' was unexpected)
        from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#

The reason for these is that the device tree files use:

	compatible = "panel-lvds";

but that's not valid as per the bindings. So what we really want is a
specific compatible string that specifies the exact panel that each of
these devices uses in addition to the "panel-lvds" fallback. Do you guys
have information about these that could help fix up the DT files?

Thanks,
Thierry

--7XCPdwxkz+h0ZUBm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmSxXfkACgkQ3SOs138+
s6E0ohAAv50no9Jgg78MylyowK5/JVWcWE4XgxaMGBRRfb5qblMtPGE3F9Q1xK3W
/Hc3vbiEKLN77OiNrzUVFAgrJM0XsD0m19XDzlmH/a+ZkLnuJvM47f0Z1Q2RwZd3
xxATlXFPFd1HfChWtukR5SuyJ8+/bJ8WIm5sPZbHQp13oXqDC6T5IdtR8mBmF0x8
zkqXnGZYMx+aYVRcANRtcoLycJRh6Y6jDXCXB9579xz6SUZqcoESq0Ojh7YFl4Lt
OroVYdjC1wlNNA0mQpwRR+SMpxSPMiFagvjRGGNGLOGBcKzNS9Z7lnE2DGVV4lMg
J070fAo5+7vqDNyuuWXLjg+f2RJokVHELK46lcEftej9byhORQKefUh+bPQ9DoPj
HPfLVNgb8yDeixXtL2GtSt8ZhZ6jLf26PR3Rj8+JXN2YdbbbbigB8wtPr5JKvF8+
8UwfedTAHJxmGtK5CvtEzqCL06TxY/PkEn0K1hAE83ryPEq3L8WKDK0JYj5XdJtX
A9xddRWB4PluGgReHq6aijPhOhALkoGsJL3QvoaMhjfqV/wSz2jKM676XSzO9z7K
87/gpSLzYHKZsnqM1GV27phr4QjbNyEE7dGshJI+IB79ecWPFXXUvsKET/qaLSj1
N4lLrBGPPbH0OTJxHH0HIGiLUFnpThcpT4ZcjFdyXXIFPXmFWrI=
=v4Ow
-----END PGP SIGNATURE-----

--7XCPdwxkz+h0ZUBm--
