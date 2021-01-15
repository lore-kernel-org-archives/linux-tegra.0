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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B7A4C433E9
	for <linux-tegra@archiver.kernel.org>; Fri, 15 Jan 2021 16:26:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 71531238EE
	for <linux-tegra@archiver.kernel.org>; Fri, 15 Jan 2021 16:26:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726019AbhAOQ0y (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 15 Jan 2021 11:26:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725910AbhAOQ0y (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 15 Jan 2021 11:26:54 -0500
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D128AC0613C1;
        Fri, 15 Jan 2021 08:26:13 -0800 (PST)
Received: by mail-wr1-x42b.google.com with SMTP id d26so9853420wrb.12;
        Fri, 15 Jan 2021 08:26:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=nWLmc3yR2tv/EqCP45DZyypeULeeDqAZ/zy0X3SdJ5s=;
        b=QJB/43JqyTc1Gi68NiR+A3I1qp5KyVQrvM5MJJ/0u86ADDxhG/NCpLGJmGDzakounI
         Xc3fNEifdzB4tW1iLbNNB+lDEqTGiB3zKVmDOdR/k/L0SxymPeckR2twJicjdJ1Bir+2
         WItkF9dN3RRo9cgne1PedOxpOJNrOahbVg4kKKut9GJwpQU+UsIQBCnmcMd/sRzdEJ1Y
         xhcW+Vn5zsgasBELDibw9FLPFHM7qSddwBPsL6bMnJC+HS0/mhWCLkeA2Ua5wiemxKdQ
         +Fv5D7GKK2pCHHgtTyl4D/MLWqWbnjMpoKHviF86d6H3YVaoVnYMGFN0JwPP9SOOxF/V
         7c0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=nWLmc3yR2tv/EqCP45DZyypeULeeDqAZ/zy0X3SdJ5s=;
        b=OUm70Yueaaqw+GQkOVq6MqeN6ejBeXW05andau4yLxWVP3IfErsCTQhpcHmRWfR4r8
         Ihw2N3tNrlmaRW8irj9JIncYbrjb+1gil7SUlhIK4dvJRWTVTZvOGvcDKsWwR90oIjyj
         Rdk3Hptm+LFazGKw6RRaPJmXnqJWyH3fe4e/t3Ldbe7t9cFZcfQXDFM0LQEOVXfH9BWA
         jGV1+ZSECxLZWtjfh+rs9nTJQAj6jsLCOV189hpw1NOWOuyHuK50rcaeLUDzgfvFm5ob
         UxnlrmKewyiLOj5me7RdBygpaOXq2UQYA1VxPfhg3viuDk/ZxXKTU/n67omiLoEDz2jP
         DZaQ==
X-Gm-Message-State: AOAM5307cTG8agZv1TzGcblrU60/im3k8VVXeCa39XUgVgKGYcBlaJMJ
        /lk/EFdv/HloV2UVBDTZrz4Tq7+lO+8=
X-Google-Smtp-Source: ABdhPJxh8Z+P44Wu1c7fkR9xWwjvx8qEckdtWrwy9Mu4uUNFcydekCsOgd9NCGDZ2vrbTt++pa2J+w==
X-Received: by 2002:adf:f6c9:: with SMTP id y9mr14160847wrp.121.1610727972657;
        Fri, 15 Jan 2021 08:26:12 -0800 (PST)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id v20sm12822294wml.34.2021.01.15.08.26.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Jan 2021 08:26:11 -0800 (PST)
Date:   Fri, 15 Jan 2021 17:26:10 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Qinglang Miao <miaoqinglang@huawei.com>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/tegra: fix reference leak when pm_runtime_get_sync
 fails
Message-ID: <YAHCIsQtRUANr+m+@ulmo>
References: <20201201125631.142590-1-miaoqinglang@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="mXEwpiDczBzJuSir"
Content-Disposition: inline
In-Reply-To: <20201201125631.142590-1-miaoqinglang@huawei.com>
User-Agent: Mutt/2.0.4 (26f41dd1) (2020-12-30)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--mXEwpiDczBzJuSir
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 01, 2020 at 08:56:31PM +0800, Qinglang Miao wrote:
> The PM reference count is not expected to be incremented on
> return in these tegra functions.
>=20
> However, pm_runtime_get_sync will increment the PM reference
> count even failed. Forgetting to putting operation will result
> in a reference leak here.
>=20
> Replace it with pm_runtime_resume_and_get to keep usage
> counter balanced.
>=20
> Fixes: fd67e9c6ed5a ("drm/tegra: Do not implement runtime PM")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Qinglang Miao <miaoqinglang@huawei.com>
> ---
>  drivers/gpu/drm/tegra/dc.c   | 2 +-
>  drivers/gpu/drm/tegra/dsi.c  | 2 +-
>  drivers/gpu/drm/tegra/hdmi.c | 2 +-
>  drivers/gpu/drm/tegra/hub.c  | 2 +-
>  drivers/gpu/drm/tegra/sor.c  | 2 +-
>  drivers/gpu/drm/tegra/vic.c  | 2 +-
>  6 files changed, 6 insertions(+), 6 deletions(-)

Applied, thanks.

Thierry

--mXEwpiDczBzJuSir
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmABwiEACgkQ3SOs138+
s6Gq+g//aYAXqOKKZgi5czRT2/84OFx4O+y4q5hyEU08WTnNtySKAdW/EZ7hAFeo
hmeLvPOoa5zjIUx9/4M53lbxnRi8HC4acWL8s+r/WIlGgR6A1zyIIQygYjgQsYAj
UJcN5tWbmTduH2RM/JgrZ5RusiYLrMtxDlZHeGVeC5Zl0UoQulQQFjEdm+lMrlHo
1Lw3CHUnIvhscWzR0AjnQzRIgwCLmGbKRKA7/+kqpgBv6oi+BsR9tWieQhu6fktH
opfas2mz3KILuDTOa4UiBZCbMxEyeXOGIaJsU7+jRiBFEAG8G5I4Of/xXPpqXYV7
o5sVE1xe3W1u9rNha09Ir9cHny7vPWCsg1JHePiFuKzlSjj6Y/vf1YVFg/myrltn
76sCbPDb7aJQ3WbrOeUqJlIMONJGVj69cdhRKe4xbwTQPmAaoS1ywCO3Sm+VyyBf
IfY/SSDJHlqTowdDdGpxOx0mVEdT3OAz+xbEzxjfjX26n76iFKs5UfkG9IWp7lgk
uwsQkE9Y5POipaQNTJ0fuiUmgBCjruQWjnVdBFYAkPBSb/crGgP+8Kq+vAXdU4w1
+T1WLsPBProSSsEqKajIxfsKFqOuwKT5Zb9vi5f0jJZ/ERPybQVEVgxPyIr72dRE
PlYy48vD1184Bbn541hcgtp7eaqMIEizIq+/sHGjKBP5c+SQOGQ=
=TYn/
-----END PGP SIGNATURE-----

--mXEwpiDczBzJuSir--
