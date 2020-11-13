Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 189C6C63697
	for <linux-tegra@archiver.kernel.org>; Fri, 13 Nov 2020 16:12:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D20DD208D5
	for <linux-tegra@archiver.kernel.org>; Fri, 13 Nov 2020 16:12:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="coTGEDtP"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726701AbgKMQMr (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 13 Nov 2020 11:12:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726648AbgKMQMq (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 13 Nov 2020 11:12:46 -0500
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3F99C0613D1;
        Fri, 13 Nov 2020 08:12:45 -0800 (PST)
Received: by mail-wm1-x343.google.com with SMTP id h2so8611161wmm.0;
        Fri, 13 Nov 2020 08:12:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=CakwW7tKQkKgc/ZBPIhzjJYO+PtF41K8nuvggL/VjBc=;
        b=coTGEDtPvY9yrOhi7tgtaU225fE5k95RMp14nkTYej0QI5kxtFmESPoVZG04LntsqE
         uE4v7u62xf5JeO7Ec/W7HdDLK7qgB/WNPlgmwZOHfjqckb/M1kVKE1/IzUKsgYf96WeL
         OxE5diXuIaIMtJuaciNk6bKtcy4A2kIAOpNIe298Xw5AVapOxeZLU09g2s8nlAnNHbuJ
         ieVxqa6BnWeCvplTtnFcAI/HM/OAjXsxu5pGS4g1LNpGCND48GBTyaSnvy3PCAhPOQbd
         VqioKv9nxZSsnjvxBEtYS9wyzertRL6HLS3unYjMLFHLY1QDcWW3eEDnXLt0risFG5Ax
         BDDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=CakwW7tKQkKgc/ZBPIhzjJYO+PtF41K8nuvggL/VjBc=;
        b=RtFQTnAx8+vCLmdSJuuVHfbhBrZvroNnNH/v3GVCpfrHrr8EynwmzMIgofbSG27U2c
         OKsBJdGDisdKeFT45PTfbTzhzUUoDTMJRsV29/qUx2dFgyRSd2x7M1kb0uf6afqVvSc7
         ABVnAl/AoQ1J8iHJTt3yubFQOHvIpkIMglvpMjEixzUOsY6armZXJVM7zUK6dzMlT9x5
         wSsVQqGLCp+qeDNLvji2wcnBgnJkX8kSFDb/f0DxJytL/ozeAWmNHunmRmE0Og6pP/sG
         7vlRc79lT8+QpRI9LjZl9HTnvNjq2Zl01WSTGa6LSGY2zwPII3PPHDSHsLQz+mcsVgIy
         N7HQ==
X-Gm-Message-State: AOAM532rHG0wjrOUOQxATb61MGsgZwKECSfFn1s+xkrL82q2uiqFMr/z
        dMjI5RFcYWyqIPbSwBopm/I=
X-Google-Smtp-Source: ABdhPJzcRR3mEng2UqvOD/Bm3K2jgd5QNhROpMotvDCIX4axf7wNYWduUdvhoNCTeu/v2ThQxhtHUw==
X-Received: by 2002:a1c:5f45:: with SMTP id t66mr3080688wmb.132.1605283959662;
        Fri, 13 Nov 2020 08:12:39 -0800 (PST)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id u16sm11427512wrn.55.2020.11.13.08.12.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2020 08:12:38 -0800 (PST)
Date:   Fri, 13 Nov 2020 17:12:37 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     JC Kuo <jckuo@nvidia.com>, Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH] phy: tegra: Don't warn on probe deferral
Message-ID: <20201113161237.GC1408970@ulmo>
References: <20201111103708.152566-1-jonathanh@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="7gGkHNMELEOhSGF6"
Content-Disposition: inline
In-Reply-To: <20201111103708.152566-1-jonathanh@nvidia.com>
User-Agent: Mutt/1.14.7 (2020-08-29)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--7gGkHNMELEOhSGF6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 11, 2020 at 10:37:08AM +0000, Jon Hunter wrote:
> Deferred probe is an expected return value for devm_regulator_bulk_get().
> Given that the driver deals with it properly, there's no need to output a
> warning that may potentially confuse users.
>=20
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
>  drivers/phy/tegra/xusb.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--7gGkHNMELEOhSGF6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl+usHUACgkQ3SOs138+
s6E1CRAAvsRmuOGUR8FxLS27FAWqc3pLS6sBP4J/7BifRoxzn/D0AFNrDwgWZtjF
KcNWJcf5J8/0/5inQFqAuNjpFYztIayMmmfs56JxWnhuvFPUu66B60GBwb4g852A
Oy251Mfb8JxDQStuqauK8RODcTGQq/oEftt2inQM47jtqH9MwoAphE+lcZNFxaX4
ayc3gWaTcxL78TftVA3UnErOCwplV+U5oTGpMb2aCiugOfgBnNxxv5C9zBTw8Kyc
g3o2rYACboFgsG6NNxB/IJcREVVO1EsGxOzgbFpS4PrD1M+BLSVpLeDVEynyDG9p
QbGaXlJFx7I6FEYgl83pMwk19zDMN+zoXrL6pDUn3JNC7uBTMecarPcBZp7KicmW
yBEEEWFWHJshkcpDx96/H69PwrRGnjg2ty84j667qM0cLA8MRl318OG8LWd0TTw0
/6YhfPLZltrfQ81FPVTTrK609VUGYY1XA3Zps1TdagMcckQ39tuXsO91OJvKmA7k
bLjjv8qNb8MMHlit6pEFwCknusrWO9PDULPJ5TLcOPFraAQi+qaIaXRbcWVKMjSC
jB92R1615jaxHNx5EJ4mUTTdX/mgThmcr36k29sbMkDvOjGdRSE/EAZm16x4umk6
XHVSQiObWSBZpMD3kiW7+Ht5aMMnz4mIM73m4Z7F5Jo8GtooVwo=
=pkpI
-----END PGP SIGNATURE-----

--7gGkHNMELEOhSGF6--
