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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E6FBC56201
	for <linux-tegra@archiver.kernel.org>; Fri, 20 Nov 2020 16:26:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A905122269
	for <linux-tegra@archiver.kernel.org>; Fri, 20 Nov 2020 16:26:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X7Fu2uHG"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729989AbgKTQ0g (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 20 Nov 2020 11:26:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729792AbgKTQ0g (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 20 Nov 2020 11:26:36 -0500
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6E22C0613CF;
        Fri, 20 Nov 2020 08:26:35 -0800 (PST)
Received: by mail-wr1-x443.google.com with SMTP id b6so10647813wrt.4;
        Fri, 20 Nov 2020 08:26:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=uLP0sG7IAs7+cc+GreF3lr0MerBJLvcZOPUd3stxzAw=;
        b=X7Fu2uHGBxHD9Q0cLEJcbKQlyyEe6ZL5+8Rojb8tsCgxQtfTVox4rzCWhmnR16gpYC
         ux81LFBM7fgBYCa/8NdgpNpS1zClv44/zPqkBV/FkCc/At52qFwY9OK2hmClKlCMOwWV
         BvRbX0QI9ZPGEv9XqjxvUvv+dBc4hasXlcGUEBLfuI/f7FEYv/XJXBF+MzWyNHW+iqCF
         JaL3nwrdTysU0tg/XucM1i02u1jwhKwp4839LaKrx4sun0/m8KfqOIouDqZgKpX8LQBB
         BANXCtdH9FJCrQseVWOZVSh7Vnvr482vHOT27GYEnIveqEPkZrBAOs4bndBLrzJoMXzz
         4NFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=uLP0sG7IAs7+cc+GreF3lr0MerBJLvcZOPUd3stxzAw=;
        b=HxoFVL4INUBQQe1xN4PvHP2XQqRMaa/iOF7JG1fn7niV/+4bqJ6CWaINQL9dmx4VxD
         w4fjbogb+R7hClJtKeOcx6A+Keh/foAwGLLDZze9cibIc5yFaNU/AhQbP+UcUJl66/EX
         TQKcUcESIXVEb+inrK6L4H9omr9J0ygboXj1AQqr/hggG4U3534aMCUmlKrNilmM5U3C
         aJYUtsZvW6BSqY6v/hgy5hJw2/+7ios1djLr2w6xZxsO+/XPlQIzsLwBwG6PQRe1GbTm
         WuMRhwTkCoyzyDCVfXn4KlTxLroxHmIIcMUUacv4JtAT70iDIxXfnjp5f8btSvAWRN4W
         H2jw==
X-Gm-Message-State: AOAM532Jhbyoyculb8UHxf6qmM74grqB6WY6MECrSwvgr3XLa2PJ/bmK
        M2Im4fxFB+ql1ISnCI37ZVY=
X-Google-Smtp-Source: ABdhPJzhkS/cosRT2dyRGlAjfUutCi3tca5uZYK6T7Td7wjTAaL8iqjhxeZEShhwZOBC9zJ2ktURgQ==
X-Received: by 2002:a5d:5446:: with SMTP id w6mr16889747wrv.122.1605889594525;
        Fri, 20 Nov 2020 08:26:34 -0800 (PST)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id b8sm6055040wrv.57.2020.11.20.08.26.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2020 08:26:32 -0800 (PST)
Date:   Fri, 20 Nov 2020 17:26:31 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Nicolin Chen <nicoleotsuka@gmail.com>
Cc:     joro@8bytes.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux-foundation.org, linux-tegra@vger.kernel.org,
        jonathanh@nvidia.com, vdumpa@nvidia.com
Subject: Re: [PATCH RESEND 5/5] iommu/tegra-smmu: Add PCI support
Message-ID: <20201120162631.GG3870099@ulmo>
References: <20201111222129.15736-1-nicoleotsuka@gmail.com>
 <20201111222129.15736-6-nicoleotsuka@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="cyV/sMl4KAhiehtf"
Content-Disposition: inline
In-Reply-To: <20201111222129.15736-6-nicoleotsuka@gmail.com>
User-Agent: Mutt/1.14.7 (2020-08-29)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--cyV/sMl4KAhiehtf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 11, 2020 at 02:21:29PM -0800, Nicolin Chen wrote:
> This patch simply adds support for PCI devices.
>=20
> Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
> Tested-by: Dmitry Osipenko <digetx@gmail.com>
> Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
> ---
>  drivers/iommu/tegra-smmu.c | 35 +++++++++++++++++++++++++----------
>  1 file changed, 25 insertions(+), 10 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--cyV/sMl4KAhiehtf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl+37jcACgkQ3SOs138+
s6EiTg/9GRPPoHHfgJdC1KDJNHfaIvRHgIfN7UJZrAi+9AohCLVeZv7Hy4tc2f+W
9CGahWmVzh/ES/nlePd2ZU5dv7Ef+g7Pn6RFd2iBrK90oR+9FBoXfOIL42xWSgZm
iHBYOXt40v1+UOXGJ2Am0twNqHJ2nhP7o0s1I46WHOZbaW797J76HQd/vbLF5AYP
surUNEMbp2e49FwVBDn+gScDQfPvX88L6AcSWXuihwUEgSl0zYmByK2nav27GAmf
jTNDOi4i3I3uGTYgB9eOJLqlbWqgy50Ld7Ot2GoTHsuetAPB1wK8PxpXJGjVqCxR
AxxgIUFjmawetf/k9qAYL7SbC2aSYi5p/vu4EeTlXkvHzDaHzchCzacj3YCztlVE
AMzQ+Qhi6smuDbKF93Fb0LsD0dBUEE9Dam7UxzpdZj08Es3lC+e46srGVTWSDL5x
hA+v/qhB+QysJLuUTPiU8sg38tSLJ9rHyZqVU1fvLmvSa5fZyCVJaoCFhFk5I1vR
1Wos2O1lX6QcoO4u0H2HXw/mAmK3mdRsTl1nbu5xCISIcc9zld4sJwcEyx7vE64W
Jz9M51nARrLd9v/UhGMzwp3PuvLlguvVNY62R75gbnvPjQDDJCBm+HZBRlcup+pI
0Tnke8ctQk+71cQeUlgiv/GjzsOJo2KCsE5tyoFKbnIjyx3z9TA=
=0u3o
-----END PGP SIGNATURE-----

--cyV/sMl4KAhiehtf--
