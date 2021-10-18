Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E80E2C433EF
	for <linux-tegra@archiver.kernel.org>; Mon, 18 Oct 2021 14:15:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D0F8F61250
	for <linux-tegra@archiver.kernel.org>; Mon, 18 Oct 2021 14:15:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233304AbhJRORd (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 18 Oct 2021 10:17:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232411AbhJROR3 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 18 Oct 2021 10:17:29 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AC4BC035459;
        Mon, 18 Oct 2021 06:56:30 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id r18so41584500wrg.6;
        Mon, 18 Oct 2021 06:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=CQAjLnOximuKx0DmQIAeiOi/1ZXjfKn8epi/lvIk+Ss=;
        b=K5RE5oGLDAAciVB5NngQtXHbhlTGPi89aes19DUwmRHdMAnubtOr/N9ewroaDcLGwJ
         qrhvz5jkbJ16LQlX5BNfY9dBY6K9Zz+/NkbAuUPcJSoSKr8IxyU2oSDDWmLhCTKar+53
         fzUb7UHFoBIX1uRmBu74SC1mddispQ7ZJk4blw90WCLh7DF1ltyzHaeORmNyJ72NvWZs
         pOJpWQ6nQyfIym6APt/S/u2V3CRqNWqWZFG70AM1jEVrz5pGQoULPT/VBGEmBqWDkxPc
         HNPc1yNWrY6TWZ29wUFdBhHRQqPzs7DezJfkJAMI9u3RiZb+uf8dl2RJTrcgZnycuvVy
         BQRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=CQAjLnOximuKx0DmQIAeiOi/1ZXjfKn8epi/lvIk+Ss=;
        b=WByAhG2xfe9WJOttszE+0oV/6L9gAFnac7lLRCZ5x9zi1mtZiA+M5yDrSjCuHWTPjn
         1QG8PJ5VHfiysfX6EVuB+2mgQZ1Qx1AtvyenJqLPkNeQiIQYn96I0q8K6r6OGYO946HJ
         9L0mAoaDnDLqmKyxZx23RcjvC64URmF28lH2WXLDVQdMOCt5+bzaiG6ZoN/peD7XYeB8
         RIU29La7/L7mUoDzD718CQd2U14zbq1s6yiM4k9fLaBSzzXwFbXXsODsh0KK4ohOqcMc
         rVjmUpekkB/LEqf6s/cr3jSJ0/dZPhIrIzWp9eIbSBuReRTIgGZNV17UkYrJKaZr1HZY
         Ny3w==
X-Gm-Message-State: AOAM5327pQys43nWVyyXvG8B9X2WOWz3QpobJEDHWX7OEAcqWEqy0Dyj
        Y0s3nLXN/gAKHgLS0sakk+I=
X-Google-Smtp-Source: ABdhPJyLUikatPx9OZjnogCBKUsuSLMUC/VnUCNtU7OWVGgkrh+ihrhMGLmZ9Y11RvP4AUEpO2g0WA==
X-Received: by 2002:a5d:6d8c:: with SMTP id l12mr35594570wrs.80.1634565389010;
        Mon, 18 Oct 2021 06:56:29 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id f15sm12504747wrt.38.2021.10.18.06.56.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Oct 2021 06:56:27 -0700 (PDT)
Date:   Mon, 18 Oct 2021 15:56:26 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        Arnd Bergmann <arnd@arndb.de>, dri-devel@lists.freedesktop.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/tegra: mark nvdec_writel as inline
Message-ID: <YW19CoGje1xPjJtV@orome.fritz.box>
References: <20211013144109.2191071-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="n9hwELlB4KqoDSQy"
Content-Disposition: inline
In-Reply-To: <20211013144109.2191071-1-arnd@kernel.org>
User-Agent: Mutt/2.1.3 (987dde4c) (2021-09-10)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--n9hwELlB4KqoDSQy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 13, 2021 at 04:40:58PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>=20
> Without CONFIG_IOMMU_API, the nvdec_writel() function is
> unused, causing a warning:
>=20
> drivers/gpu/drm/tegra/nvdec.c:48:13: error: 'nvdec_writel' defined but no=
t used [-Werror=3Dunused-function]
>    48 | static void nvdec_writel(struct nvdec *nvdec, u32 value, unsigned=
 int offset)
>       |             ^~~~~~~~~~~~
>=20
> As this is a trivial wrapper around an inline function, mark
> it as inline itself, which avoids the warning as well.
>=20
> Fixes: e76599df354d ("drm/tegra: Add NVDEC driver")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/gpu/drm/tegra/nvdec.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Applied, thanks.

Thierry

--n9hwELlB4KqoDSQy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmFtfQgACgkQ3SOs138+
s6Gxtw//ZYz6Ut60RhlZ8WZy7EAs9vKEl0kYn1NyVnKCTcfVa10K9Xmn0FEJbaKm
gXu1RSB0V+SKrA0IJdTEuMHI+yjDngiwNU+CcsXlnjQc+kbtO65ekeXytE1B+DQq
oA05PTjFChGcMNai4Zpq2s1nuWVByJHeXGDjIQAkdfccojm3GpkV97a9fJvyYUuM
WOtk2OKc+hsHkBmQsVD0L3BSBPtz/VaJKLje2+E/LeQxZo5bZPkmMkUHE/PpNEc8
GSSxiDJLnhs7kCuw64YXmQHfiupEsBXSA2iFW/vhGrlS0LPGbec5ZFZqN18C/JRz
bJQLX6jn4hPtmlS4cLVz3UIfsDfC0mWLTh+pOUn0HpOQbea+FNA2l3r16tjil8Wm
ehUgxd3AWWDkRFj/1jels5FBZgFf8zX3glqsF39BhHzcTiW/sS80aRP2oK8t8dF6
ayO+bdb4xFQFcME7dME6OHHgV9xQRioATkP4E8ErTfl7CfUM8pKZ91q+C1fRBSr1
5F9YUF/X80QElBMaQ6JQbaUmi//mfQ0gLU++5Vs33UXaRfF3QJY++X7LMZ4xIbgP
IwrYjjMK9zhPWBAin0PGAc/sF6puSqOk1poU7tKlZCJ4vY1phhLT+iZiI2/OrUxq
D3LaibgtcLJyRlGZdD5qgt+agSSjyK+b7KlseDLvisjUg48Ldo4=
=nP4o
-----END PGP SIGNATURE-----

--n9hwELlB4KqoDSQy--
