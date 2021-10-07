Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CB72C433F5
	for <linux-tegra@archiver.kernel.org>; Thu,  7 Oct 2021 18:03:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 857C861175
	for <linux-tegra@archiver.kernel.org>; Thu,  7 Oct 2021 18:03:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243455AbhJGSEy (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 7 Oct 2021 14:04:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243452AbhJGSEy (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 7 Oct 2021 14:04:54 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 650B0C061755;
        Thu,  7 Oct 2021 11:03:00 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id t8so21809760wri.1;
        Thu, 07 Oct 2021 11:03:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=LzYgfKlvwHIBL3wW8fhtlH1KhCgihQqD0wQewNy3gTQ=;
        b=CnrKfrCI/7b7P9niH6/3IP1Wt0eRn43RT4hn5SxwlYELYRR0SK5WKU/Vr/4eE2NQcv
         Yg66RubvO6t+h58bUDi2pYnddx5mcj/CSK0pfE7DHvrb7yGY7Qhv/ZfWriK3aJqLFTg3
         tAq/5wyD2bVUOe3NJNMdEP5hqzRwlSdreV3jtphDHyFNmrZEBU+M2Nhh+qmIEU2f8UHO
         1VrYqfFkAbntzETc89XOlZd4C8rgPMX0beOiVqcuePDLJ2kAT5ax66nkwRbYc1Mrj1bq
         wrfWIk9XqGS0KT08W9SaFguWb6nyttqseHLSsNtV3xtO8REQ8QIiT8KkOnOT6/8q6LhC
         T7rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=LzYgfKlvwHIBL3wW8fhtlH1KhCgihQqD0wQewNy3gTQ=;
        b=PE5mnrDrHciKT2VxPe0McHqpprqk/ZavHsiZG/8XRH27Ngo2Wt6inPU+I8YWYJCgYJ
         MVVrpHZv/qx3BBp6KxpN+Z5UAa3i+iNgFMrpU0yrFRoxw986eFb6/cAvJdUq+lbup5in
         6FecLSseYhjQz6NUjUnoK9LGePFYG0KlOE5Htas65tqeFa9SaLu3VF6G9OCNOS2+HbS0
         Y9llCk6NfsyxKlpWH+KeciBiZnfKxy2f38o7l3vQT5PYtULA/8B78gTTGsupv5AED4f/
         eqnzGXkcwOg8X6BewMBT/phkdKwJSq/Xd2ijPtSOP+A/D1JzqFWJvE22FxEqI2KQFTqH
         XJ1w==
X-Gm-Message-State: AOAM530PFfezs8ofOXwb4Ww/JLQQKuXm0vN9vXwKr6+tst4Hjr5o8bV4
        T+OLuEJu1DQLkoI4oI1ozco=
X-Google-Smtp-Source: ABdhPJzLFQShRWgexENr9TAiLhixQbONosI4QunNbNjX2FeAqLNG3BVRbZG2LBnMAFnm0kRccGzhCw==
X-Received: by 2002:a1c:f01a:: with SMTP id a26mr6084520wmb.150.1633629778982;
        Thu, 07 Oct 2021 11:02:58 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id g2sm67566wrb.20.2021.10.07.11.02.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Oct 2021 11:02:58 -0700 (PDT)
Date:   Thu, 7 Oct 2021 20:02:57 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     vdumpa@nvidia.com, joro@8bytes.org, will@kernel.org,
        jonathanh@nvidia.com, linux-tegra@vger.kernel.org,
        iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] iommu/tegra-smmu: Use devm_bitmap_zalloc when applicable
Message-ID: <YV82USMgonpRzoWd@orome.fritz.box>
References: <2c0f4da80c3b5ef83299c651f69a563034c1c6cb.1632661557.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="YJJooXTg9A0B1Lju"
Content-Disposition: inline
In-Reply-To: <2c0f4da80c3b5ef83299c651f69a563034c1c6cb.1632661557.git.christophe.jaillet@wanadoo.fr>
User-Agent: Mutt/2.1.3 (987dde4c) (2021-09-10)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--YJJooXTg9A0B1Lju
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 26, 2021 at 03:07:18PM +0200, Christophe JAILLET wrote:
> 'smmu->asids' is a bitmap. So use 'devm_kzalloc()' to simplify code,
> improve the semantic of the code and avoid some open-coded arithmetic in
> allocator arguments.
>=20
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  drivers/iommu/tegra-smmu.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--YJJooXTg9A0B1Lju
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmFfNlEACgkQ3SOs138+
s6Ex8g/9FzkP6Q72V90vFaRIUz/isfotGtkN2TgNhkMcQ1nfh8YNMPDVdFOS0tPN
eTBbg2moh1JaDxrQ6V6SWNypCZYzoN4fzCYrLOmCa2mC7Yteq5m5zXlIqt9wMmdd
i1UAVw0u57F/Nyw9dH0bQxDZYNAYJzrhq8FUIlZ3UroysSKF+ipjf07k8ANtovrj
Wq0q+xm+vn6MJS5TElVeCd0fLQWJvUwq6lZ9YUtB44uszvhciCy04xeMJ4sLAvdA
0VA3BjOHglRi4bEivpviSMMw5viABX1ZedM5lrxkAZDzcoPEu4cNuri77aaAwcge
XSDX/jViJASF73nqt5AI3mhDa8RUbtgKBDFbWi7dgpVSF9JAPdNbeWQKR/lNWdos
7vLch3cbR7Zc6AGerOld5s7XDLAN85ocp5CexAr1Wj3UgYGmjk5RuvXQH6aHJ5Zr
RJ1AV5yzu8FY6CzvKGR6ywoJbmzZTAK5R+XrhyBSDO0IuIKLPByRH12vOnzS8bEX
5aJYrih3ugVLCgOLMda/qsRiKjhHZOeZYlFMxuXKqxLXsdOXcu27VuQg2Vu9mb53
wJdioW3oDctaL6La9upYSerpBxzOxjcP+0aSBMAu1hUqOIU5m+0ktn05xl06OyY0
sZ22iw1pYgmE7WGTmq2rTHksIX2WP1PipyJNpuJF4Xh5df/QOVY=
=EYc+
-----END PGP SIGNATURE-----

--YJJooXTg9A0B1Lju--
