Return-Path: <SRS0=Tnts=C2=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B01AAC433E2
	for <linux-tegra@archiver.kernel.org>; Thu, 17 Sep 2020 10:17:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 635792087D
	for <linux-tegra@archiver.kernel.org>; Thu, 17 Sep 2020 10:17:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pKGvxYtv"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726552AbgIQKRk (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 17 Sep 2020 06:17:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726524AbgIQKRR (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 17 Sep 2020 06:17:17 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79C5AC06174A
        for <linux-tegra@vger.kernel.org>; Thu, 17 Sep 2020 03:17:16 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id s12so1421845wrw.11
        for <linux-tegra@vger.kernel.org>; Thu, 17 Sep 2020 03:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=V10C0Sx8Dh2zjQsPNII/TLX6UAq/q0bx+FwH8JSw7zs=;
        b=pKGvxYtvlNnz5cx2vbNra3WJahE0vrHC2ozYN8rWnGsvvTMpHmjHG3dI02SqemywJn
         pxRdaP1J67XTLmdn1ByomUhoQn/jfpwFfDSYGGZS4f/Rrw02R8B2ScjWEJjMbvSK1rBf
         MF8IAKdTIWPR2hUGHE1ctO5E+cA64CRP/YOJnfnM44kG6S/bYkDcbbZ8bkOjftlxdEPP
         UdBGwfOp2tPFvP7f7rzcKKtzcnYHViRULRdgS7xB06Th2h0Sc19tlu3OqW/I9XWJ/ePR
         ontluezkNrOr9VmcUrBxpBogpc6oX+ATvDt0EgSyuoUBxSi4xADpowajtJYlvsDHyOY6
         +PLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=V10C0Sx8Dh2zjQsPNII/TLX6UAq/q0bx+FwH8JSw7zs=;
        b=IZRvX7BhHzJ8QeHhSylYXRxg+yeiQhkqJsxKOB0aXmSfQWhqLsRbRXswLUMIf6REBm
         DF+HZrI0RmbioN91KGEYc68TdV/u0Q1diJH9LSIKbYwhQFIID0qCJ9c4j9ezs/bdTfo0
         WiJfRHeQbwTf/A1uEEFZ+eaRgvMTb3RlQSXbgHr++cFp6jhmji5Uq7W6B+Egcz+84LdU
         AFbFUTivbJqPic4tva/mIa5HlwSPO6DKv+ceFI+SGoCc9BWu8yw+RkCdLxR3G74bazTU
         I4mb1gMc4HqfXtet1WkNg/iPyt05X1E7AazFKWybH+w6OkNQrMaXxOA3VS/ciBwY3Tul
         gWVQ==
X-Gm-Message-State: AOAM531QUFMoP8cMc0G85nQI7FHBfpd764+Za7GRaTaATGha14CD/pCX
        NCecClaw62L+mNWNPmvNbto=
X-Google-Smtp-Source: ABdhPJzCUoZdovzeyScDCkpfsi2MO4jHC9w94Vt0jvUV98ls7n2t1Oj92tjYsX/DMXB71AritDx76w==
X-Received: by 2002:adf:f88d:: with SMTP id u13mr33731468wrp.213.1600337835011;
        Thu, 17 Sep 2020 03:17:15 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id y2sm9935463wmg.23.2020.09.17.03.17.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2020 03:17:13 -0700 (PDT)
Date:   Thu, 17 Sep 2020 12:17:11 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v1 1/3] ARM: tegra: nexus7: Add aliases for MMC
Message-ID: <20200917101711.GA3515672@ulmo>
References: <20200906190008.25247-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="3V7upXqbjpZ4EhLz"
Content-Disposition: inline
In-Reply-To: <20200906190008.25247-1-digetx@gmail.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--3V7upXqbjpZ4EhLz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 06, 2020 at 10:00:06PM +0300, Dmitry Osipenko wrote:
> MMC core now supports binding to a specific ID, which is very handy for
> embedded devices, like Nexus 7, because MMC ID may change depending on
> kernel version or configuration which affects MMC driver probe order.
>=20
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)

Applied to for-5.10/arm/dt, though I did move the new aliases so that
they are alphabetically sorted.

Thierry

--3V7upXqbjpZ4EhLz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl9jN6cACgkQ3SOs138+
s6FMiw/+OwcaDnUbp0sws9XTqIe1VwOaMIhUDCTpsp+0wgjGUv+j7DtsLa8f1mov
rj4QyIimMfBuQlxg/YXVB6U0+d+i+DX5DjMmN/47Expf2xwqlQcsE1VFw95/fk4J
+Nk9BQhIm79snSsLB7Z3m9gafKEDL2kCrrRilVgw9At7YXH3pGz7oXe1h5fymWYj
QQpaqO5fan3af0mxP1A+Gy4eyGNZS4HRbC3xuZUnav+mZh6yIcrbydckt2Vm9O8Q
2afGnCPmv08aR+I6A+b7aLC1PIPb3S4Bw70KSHunK97KemGIVL+o7V+ARYtP0rnm
vAnM70qUrLyAfDtihKQYUvJFe3w4ZXgVQ1XGTQ42u5B3RpVhfNUjBuk/B182dYxm
/Ea22r2YjRVu7GMhzyzw04nuhvKOqJPaW24+07/KrDDb51QxrwSvNyTEx62d3QMa
hSrHr4xDrfNzRKQ9RlDydnIxRwW9y8qOvYVj1l9r651+zHDwly7x9PUlRY8O8Fya
XNKYIcuRvHIKENu0Ech2Li7qnAIo/IZLFsYzFq9Q/WqpryTdeTqRg0roIBB86+Gr
M+QdztgSF9omMaJPP+raEhqXtDMKUuX3dycu5BfdteW01fpKOvgYGDRRmf0yL6OJ
yRy8Mwl1Jl1jRZ0WObcX4fwA5QG3EsTVsIG2VH+Vkf+QRpZL9GE=
=MNys
-----END PGP SIGNATURE-----

--3V7upXqbjpZ4EhLz--
