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
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1280C433DB
	for <linux-tegra@archiver.kernel.org>; Fri, 15 Jan 2021 16:20:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 64C6D238A0
	for <linux-tegra@archiver.kernel.org>; Fri, 15 Jan 2021 16:20:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729011AbhAOQUc (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 15 Jan 2021 11:20:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726751AbhAOQUb (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 15 Jan 2021 11:20:31 -0500
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55A06C0613C1
        for <linux-tegra@vger.kernel.org>; Fri, 15 Jan 2021 08:19:51 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id a12so9822818wrv.8
        for <linux-tegra@vger.kernel.org>; Fri, 15 Jan 2021 08:19:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=LQ5pysIVvzw8UX1UVpnBr2BWl784HQLa7ZmK6MgcSpo=;
        b=tww0XAuPvVbDK+WWtsDaZEScz9oQkN3cjZ2TS9pg9O+NMTccvAkPCVr7ff2yJhuKv4
         fkTK4OBt39yFcIY10N2KteXDjkXyPNevhByoNigCms8WX03271Cv8ylQ7u9gGGFqdG3D
         nFULY5C/c5NA4CdnCGa4UxkcklnDDsnogr2hPhCCf1qtz27iiBdKoOuuhlO9WEpom8eW
         MqUO3imEtvHugDsAMVpmQv4+HsO+ES5SxPSdLxX1EmHW+C4/HfXK77ovSo/WfR62shz0
         4I3h/ZAh8tZug/rXD3Ot+7WXQ9awwtcsfSWEVE5NpRR/fr86hH2CTQoqwpZ728LIavL7
         KMHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=LQ5pysIVvzw8UX1UVpnBr2BWl784HQLa7ZmK6MgcSpo=;
        b=AmPnk79K59qJNHU4ZklltWx27sfqPhSva/zcozkQ+vpBSuN3mIRVU0J2okSJzGRsF/
         Qd9bMjqheNWZXYPyl1S3WVl30DkJzafCnhMkxUfZyvqZMQ4tW6u5IdKWKyqFy07TQRr8
         HSdkEoa25YBBIfFHEeruHWPS55TfP+1Kuy13xS/7VCfWxC61bIDprNmi5zq25nTUAsPL
         1pZpeFPR0azq1dBZ5Txng2fiaz3GV2O7h8Zrz1IO1lu0QgtE9xEfo/XjiM926vtyeLW5
         iZYh9ZiExcqz1nE82lkweGndXTXPeS3ekKfk4J2QUaZaY78hYtNkE8KwnRtFgEzQiHUl
         u24g==
X-Gm-Message-State: AOAM531E5jh2F/vB2hLk0e5veYM/PFlCYeCi27bxw3NaLiHm4uf+bqYQ
        7KfgB6jW3YaGOSWKViA8568=
X-Google-Smtp-Source: ABdhPJxOcIAfog89Q/+yn3+tZjESlYiessSXAArWffiF9meVS777/7pJkL5OXfgb/pwoUWpv0RUd+g==
X-Received: by 2002:adf:d231:: with SMTP id k17mr12831128wrh.264.1610727590150;
        Fri, 15 Jan 2021 08:19:50 -0800 (PST)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id b3sm9576381wrn.70.2021.01.15.08.19.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Jan 2021 08:19:49 -0800 (PST)
Date:   Fri, 15 Jan 2021 17:19:48 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Mikko Perttunen <cyndis@kapsi.fi>,
        Anton Bambura <jenneron@protonmail.com>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v1 3/3] drm/tegra: gr2d: Add compatible for Tegra114
Message-ID: <YAHApJNZG5rE/uMQ@ulmo>
References: <20210112181421.21293-1-digetx@gmail.com>
 <20210112181421.21293-4-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="JDyQh/XtqKkzYXWz"
Content-Disposition: inline
In-Reply-To: <20210112181421.21293-4-digetx@gmail.com>
User-Agent: Mutt/2.0.4 (26f41dd1) (2020-12-30)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--JDyQh/XtqKkzYXWz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 12, 2021 at 09:14:21PM +0300, Dmitry Osipenko wrote:
> Tegra114 has GR2D hardware block, support it by the 2D driver.
>=20
> Tested-by: Anton Bambura <jenneron@protonmail.com>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/gpu/drm/tegra/drm.c  | 1 +
>  drivers/gpu/drm/tegra/gr2d.c | 5 +++++
>  2 files changed, 6 insertions(+)

Applied, thanks.

Thierry

--JDyQh/XtqKkzYXWz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmABwKMACgkQ3SOs138+
s6E9KQ//Ww3t+ff5EPjesX5CUsgT3goZAgU6gMacwUgKCY24A/LzPtxVd5WEsG91
hUHyGHagXTnxMvA+5yNK1tGQiYKoQsCIsgbWCz8J/3JWo73++L+5Bcwrywy5vD35
CkkQsO0pXlCrEBlyIq++/EksW6MqaiAJwQJl5+vmHw3NLZT83Nkj4a1pwmNMFZyC
gpk99GsI9awRM8Xvc2+3gJ5z7FjGwjRQUOG5178yXtEwpIRlD6o1IbYmTzTu7Hyr
tki4JeeGXMblp26ON3D6jNda3LNhbIPimNKb/DI8a0GcNBH8YpZD54VW6QR0ykHK
qIHjqaXkIf6tvxPlU9MritvQSZvzxHgRL+XRQtonmBvoxgBbAX+BcEsT6TMnwb3j
WXZKzz7lOVCw2TUBST/j2A52JZfuADv3wVM24TQI8dEW/PzLAossA8rltjY/dboS
wMJ8SYWRva7qJQileioo40oPwpewbnsoijSK3ZrBCo9dTNIXVafjHjfc/M0kGCc8
E7i894+klC/TvCaIG3VVK9BT12ZO+O6VbPRL+h2F7qhxguMGYlF7Lcn8Fk91ZToq
LR+Tn/OUtKo75mvPneuanPOTCtNIJ6OMIPfN8DcJ6cEhA2cSAcsmbas/UV86CuQB
sZZ2J7RyzABBsMl+5lmhdxsWlspZT18AewYLL9tAT7RYi8wpY10=
=7Yfs
-----END PGP SIGNATURE-----

--JDyQh/XtqKkzYXWz--
