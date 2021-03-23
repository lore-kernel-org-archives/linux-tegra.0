Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8DE4C433E2
	for <linux-tegra@archiver.kernel.org>; Tue, 23 Mar 2021 18:39:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9C89A619CC
	for <linux-tegra@archiver.kernel.org>; Tue, 23 Mar 2021 18:39:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231985AbhCWSjH (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 23 Mar 2021 14:39:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231834AbhCWSi4 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 23 Mar 2021 14:38:56 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2919C061574
        for <linux-tegra@vger.kernel.org>; Tue, 23 Mar 2021 11:38:55 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id e7so24565238edu.10
        for <linux-tegra@vger.kernel.org>; Tue, 23 Mar 2021 11:38:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=dYznpMv3Ww5kYSRDGGPyai5vu7pTVlc0fXfdJm4pgjM=;
        b=g9jqvNPoIoRtiJ/5d6y5e5foYPbB9RdjMzhxLeADlQJx3t3AsfEIol8l1PkXfM+Tzs
         H+ok1w6OfXhPqlA4aOJvPH7qo/EOzZTsX29YOt9x0w8gmYNA1AbmSku8kxONdQKFVf7M
         14VC0b+MUPrV+bey1OMtGHsbRfWhhw6r+IPDraQHEvbZFs31M2PSWYLGURFIUqs/BYRw
         8un8TgkjjeRxxDxOsxv+sHXezuEP2Kujcfy0ThQcDmbtto5IaWmAq8g911jJP8Acu5sI
         0gWe1cLPJYX8Wta6EMP6XjIl5ASWP36AstZkfMBKu9BhKWR08hvTx9ehYaHKD9MlhQd/
         rmzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=dYznpMv3Ww5kYSRDGGPyai5vu7pTVlc0fXfdJm4pgjM=;
        b=Ne6tdJiqBEeoiUOWLZ8sitVN3abPImO6eaAh+b8+ly4WnlBHeeaqdCIs/zz+uhqvnG
         Xh3fgnRwHTZniOG8ZcQtwLNKaB1xRfVRIwnes92dOWJlHO1Vmp44W4TXe5SjyVRwbXpC
         s6F+vJwQeYr/mKkfe9YpfXAlqS70r4HSodSAwse4AImVUyYe7IXe4KVHWyxyADufQ7p/
         hzpnstNSBYwvrz1CO76W7SmhWmq6pyvIlqHNHLtmkUwKAofjgHAo9pAcqw6kS+wr4VEe
         R50VFQBxLGBsbJc5dq8fasamaPRWqb9hPqhmgb8fjk6BfXazQQ9PuIcBRBcWdDgDbVzg
         Vdng==
X-Gm-Message-State: AOAM533GMr3FdpMGbSJnE+Rx2T/p4tpJQJUOzLiF5V6tKhbxnkjykCfF
        AFIOhVbe4XBhtFSB1eaYAC2NZ9jqG40=
X-Google-Smtp-Source: ABdhPJw0unk5MrgrletxWVwRsnpOiuemKYoq8BBFQT/HI73CtCZhD9VkMyojHjqt3q8aSEA3VgUC1A==
X-Received: by 2002:aa7:c815:: with SMTP id a21mr6002088edt.38.1616524734561;
        Tue, 23 Mar 2021 11:38:54 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id k12sm13424950edr.60.2021.03.23.11.38.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Mar 2021 11:38:53 -0700 (PDT)
Date:   Tue, 23 Mar 2021 19:39:14 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     linux-tegra@vger.kernel.org
Subject: Re: [PATCH] ARM64: tegra: Set fw_devlink=on for Jetson TX2
Message-ID: <YFo10mfeeTuWbE+b@orome.fritz.box>
References: <20210312101551.757457-1-jonathanh@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="jiSyHc843Q2JU3nd"
Content-Disposition: inline
In-Reply-To: <20210312101551.757457-1-jonathanh@nvidia.com>
User-Agent: Mutt/2.0.6 (98f8cb83) (2021-03-06)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--jiSyHc843Q2JU3nd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 12, 2021 at 10:15:51AM +0000, Jon Hunter wrote:
> Commit 5d25c476f252 ("Revert "arm64: tegra: Disable the ACONNECT for
> Jetson TX2"") re-enabled the Tegra ADMA and ACONNECT drivers to support
> audio on Jetson TX2. However, this revert was dependent upon commit
> e590474768f1 ("driver core: Set fw_devlink=3Don by default") and without
> this commit, enabling the ACONNECT is causing resume from system suspend
> to fail on Jetson TX2. Resume fails because the ACONNECT driver is being
> resumed before the BPMP driver, and the ACONNECT driver is attempting to
> power on a power-domain that is provided by the BPMP.
>=20
> Commit e590474768f1 ("driver core: Set fw_devlink=3Don by default") has
> since been temporarily reverted while some issues are being
> investigated. This is causing resume from system suspend on Jetson TX2
> to fail again. Rather than disable the ACONNECT driver again, fix this
> by setting fw_devlink is set to 'on' for Jetson TX2 in the bootargs
> specified in device-tree.
>=20
> Fixes: 5d25c476f252 ("Revert arm64: tegra: Disable the ACONNECT for Jetso=
n TX2")
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
>  arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

Thierry

--jiSyHc843Q2JU3nd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmBaNdIACgkQ3SOs138+
s6FtdQ/+JadpxBhnw4WkCRLB6fy/JbAePSQ38/d5rQWrVwzD+gY3M3SWAL3o/8Q6
hEybJCX++7TlmrEPlgG6pswUnOTsLXFIaj/f/CrRp+g8nkhnM1DHmSEOFJYmdNLh
QhJI4HrRo/UxKOaX6W9aU+KXwtgRsTyXkFOJaBnchzUpko8mnvhNe6au3tN/VYd5
rDfyJgDpX/wEM40+Toj5QbcW8Dg1hzWguv1ic+vok0pT+pPepz4KmJjQGYcpB8Hp
Uaw8bx7FOJaONmKXZGoFVEfCUEiB6B6mhazAeFiBiMA9MNfnhyTasb7liLX4i2RK
F+e3fxMK9JTeCRTtZa+jyCoInpnUXPS6/uSWqcm6WeZo3g7kLvrjYGUbSsLnVigR
+MrSTkpFH0pi10kzcDAkgk8uluQaRuCj1IGXg148IsXJWsAGXuWrpNC8P70+QtjS
S83Imbwij6rWbukmgfPAaYF4AsSHWtUxPgITOWujGwze7BepXcxRnUs7zCIVZRPD
AcHSXW8Xetbw26c+zHwHpo6i/+tgf+R0715VysBYE1XWKbzXf3Qow72h2XUVlNHj
kckcbHuAZsCLm9+573UWZOKOMDLLyxl0ZKbUQ/i4NGhHsDyTESj5lkfIgsSyMd8Q
Le2P7FMqhd0nLP/zYZkpGfPRIhL+ZkyXxp8GywpZ1urxh2SepKM=
=S8Jd
-----END PGP SIGNATURE-----

--jiSyHc843Q2JU3nd--
