Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6E2BC433EF
	for <linux-tegra@archiver.kernel.org>; Thu,  7 Oct 2021 19:51:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A7F2161056
	for <linux-tegra@archiver.kernel.org>; Thu,  7 Oct 2021 19:51:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232986AbhJGTxH (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 7 Oct 2021 15:53:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230009AbhJGTxG (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 7 Oct 2021 15:53:06 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57E52C061570;
        Thu,  7 Oct 2021 12:51:12 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id t8so22647015wri.1;
        Thu, 07 Oct 2021 12:51:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=lz9oq5Md4l8gWBKQG192zwKCaXrXF7jMk5OPSlnJtjk=;
        b=cX8RtLHd4l/8/5sfNMzDP8e2hG/lqzK5pPIG3PkKujtbek0mMS2IlA1HWzbSKryq0p
         T2oTWC1+rplB2aHGg3F/TIRo1yXRXQWW0V96cIj0jchYiN6L9lFMSTXFHUuaUeJ81VyQ
         KbmVL/761oHGrMdNGpsunS4EZ7gydWl4HRvtXErQs1YOyrXWb+TEMyQZVn1uKGw1+cnI
         wHxQAuwMW5a3anbyv2HfX8l0iir3q54UHHeV6BaVIp9owqusyYYGoIhe0f8TsLn1pfVW
         0Zw4UTxvvDF9X7HnD8dUP9cF4jZicVAs00SJGGcX15CKgwnF/88O4N8aT1KhQO31X1hf
         Z1Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=lz9oq5Md4l8gWBKQG192zwKCaXrXF7jMk5OPSlnJtjk=;
        b=ETS31HYVwvp/nLj/gnUmqGZ0syW26w/AG/wlxinzK3Pg7uanNwzCqb01kZVuYjsb5C
         h1zkigCKe7ymgnALSe/Re/6+CjZNWfsH8toXoz/G+idhqo66+ySEaGIef7TlP9mj/jJS
         pXIfgjYFIignTdnU51BckJGJ7UtbNWLxTD2YEyHi4CaIQCDAxoBRNYSWbFyDTWZCgMp1
         CSxN6qkADCTzmi9X7RCuLKC4OPpZ4d8c96wiAfPxyuBwbgXcJf0So7pGX3DLaPvHeXjr
         QDnyqxOSVcG6Ro/Bkpc4itajM2i7yrRnBoYsnhTLF+/+9jRzZikj0x6xBR/XhcUqenEs
         eEew==
X-Gm-Message-State: AOAM533dp7qNBUGbs6DFBWH6Wf7DUfLj2lVARdK10kkDKJgR5cTVXWrl
        TtyR2sv4P3REUFqBy/lYZZyMHkLgnbs=
X-Google-Smtp-Source: ABdhPJzmWyUsp3tFtm13rYXujI1Tm3Th0nofJO3YsPsqUQOOPe2DiSpDpQo3kYCmd6JXiBPFoweVCg==
X-Received: by 2002:adf:a183:: with SMTP id u3mr7962242wru.330.1633636270990;
        Thu, 07 Oct 2021 12:51:10 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id w1sm276207wre.79.2021.10.07.12.51.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Oct 2021 12:51:10 -0700 (PDT)
Date:   Thu, 7 Oct 2021 21:51:08 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Cai Huoqing <caihuoqing@baidu.com>
Cc:     Jassi Brar <jassisinghbrar@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH] mailbox: tegra-hsp: Make use of the helper function
 devm_platform_ioremap_resource()
Message-ID: <YV9PrOJooLo04OeS@orome.fritz.box>
References: <20210907074208.2604-1-caihuoqing@baidu.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="+WMH0nGpaYz2ohRn"
Content-Disposition: inline
In-Reply-To: <20210907074208.2604-1-caihuoqing@baidu.com>
User-Agent: Mutt/2.1.3 (987dde4c) (2021-09-10)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--+WMH0nGpaYz2ohRn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 07, 2021 at 03:42:07PM +0800, Cai Huoqing wrote:
> Use the devm_platform_ioremap_resource() helper instead of
> calling platform_get_resource() and devm_ioremap_resource()
> separately
>=20
> Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
> ---
>  drivers/mailbox/tegra-hsp.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--+WMH0nGpaYz2ohRn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmFfT6oACgkQ3SOs138+
s6GrtBAAmyI11L6dhKN7QxxJjkHkCD/wkLdPbp7UXETCm6Rf8ra1/vF0KWXtMZSb
H7Hs26J7rkpB8VF93eP2co1gxgd/Yer4il7e/Drt59b3S430Rmhup3xL1JalInHm
CMm63Sw/svZlsalsxYLH1DmxbBZFEK9pphBfAqOkXzCUt/s6rzz6HiBZIHGV8zpd
dzl1HNrWHMSZzCGwAjWziEMQUgn0x+/A9/lWglae5j3FeBnoH5TVIeyfnHpjJu9v
FAImb6vWSVbtnPGc+3fseIfbkbOwUYfqZwgdyVBAzUPCaHImfXJMe6AA/JS8q6U7
pT7/0GkaQEDa5QatguqZXtSkrAvoDH/vGw49TUm3/TdwnTzNgWfLE7nv/9LTBEZg
k1F3BTSnAdm0If7/USzY/7yx6HrR6zmVs3BO5XXM41O93r4o/Lyx6YB81edFoHoJ
JS7UwmtMRPXvPIGyIb0mApjriVx+IsNNe/7qjkopThimtgMS9A7sqZjPm4FGa20O
sbLRQgc4qu9pendU0pru1zyZGq/qx92Az/5BG0eAQsWifWSTMGNyL4dCZwuygLw0
bhdAzLwiQys0UNBXxKL/L2sRM7+LC/SXv+2DVDFzSO7CbRdWeP2od1TL79YXMek8
xNpKS/q0UgddUldkbutJp4lxFQTMiaVct5nocbo8utD98URvQVs=
=jFao
-----END PGP SIGNATURE-----

--+WMH0nGpaYz2ohRn--
