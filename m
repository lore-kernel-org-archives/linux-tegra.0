Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E71BC433E0
	for <linux-tegra@archiver.kernel.org>; Tue, 19 Jan 2021 23:51:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6EE6423104
	for <linux-tegra@archiver.kernel.org>; Tue, 19 Jan 2021 23:51:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726134AbhASXtM (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 19 Jan 2021 18:49:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731589AbhASOAc (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 19 Jan 2021 09:00:32 -0500
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com [IPv6:2607:f8b0:4864:20::82a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A2C8C0613CF;
        Tue, 19 Jan 2021 05:59:31 -0800 (PST)
Received: by mail-qt1-x82a.google.com with SMTP id c1so13684888qtc.1;
        Tue, 19 Jan 2021 05:59:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Ym9OdXfOruhx0VJLHJZTkysCmTkqfAJuYVRSw4XnoL8=;
        b=EBZb1OECg0pM/OcFrJFHHcTW2Gfd64bzWcWr9Vc9asStUH1lSYwKZQIkBDMAOcfUO5
         1Geu+QFg/NgTXuWqA6fpl8lFr9TqzTs8WRbPPVnC8NORmxaFEnLTTuevU4xy2DlEmX6v
         D360/Cv/ncHzhuqU0qcoCvs/OGAW7WOC8lyeEDKvQoZk0+mZubKZNdJbaH6xBxf1d1WF
         P9IUbHPVAc4H0wysQK6+8c0ukYe4R+V9zCjz9FQXsbLW769m0+OAQUTdlA84EZOW2LRN
         XyGJ102USONTAtaqrDEP5D3qrROhN5GWVxnn/4iM47Fa/8EVmmwnJ2HjtdRjC2ZxDnCI
         ZLLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Ym9OdXfOruhx0VJLHJZTkysCmTkqfAJuYVRSw4XnoL8=;
        b=trA0do/jNkoQrWQl9nOsKxsnMNfPduwTLAbda6qhy31PnPNAkpEHLWWBJfGqB6/k5f
         k8GFhLzmpPnPg10FhQ/I3SssxNO2GG0JPCjBWirMDeTAtmRksz1Af8kHRelgTXAUyYCX
         qE/uYEDcHsocpINYg6Zmp7u9yiVVXh214bKwqYhDLp1k6zKapAZXq0bRk/5YMYoSJ1ni
         OmSqNEW9gUnaqX0IQQyO0vKHB5XlWChawGxX8oyEWXXkUphV0QAi0ua3sQ3UaGw8pY5g
         Rcjz43H0UH+2c+PkWP8Oy6gqmVzcJNeqJJJYDfSmVOFgyUbXqJHQHp9/UuynsvnRIbCi
         nfbw==
X-Gm-Message-State: AOAM532VOJnWo7FpQll+Oalo8uBdhLOGH0vIe935pLxNGHWUMHet7E90
        JVOfwYiwOGntg/TetVx1oAg=
X-Google-Smtp-Source: ABdhPJxfvNtzwj2msR5tqNRB5ZxUuEV+4weiNh12lt3ZDH5679gJY1FRS5R4LNSD8MOrNxHQ4fGu+w==
X-Received: by 2002:ac8:7767:: with SMTP id h7mr4400936qtu.136.1611064770511;
        Tue, 19 Jan 2021 05:59:30 -0800 (PST)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id b78sm12913371qkg.29.2021.01.19.05.59.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Jan 2021 05:59:29 -0800 (PST)
Date:   Tue, 19 Jan 2021 14:59:27 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     JC Kuo <jckuo@nvidia.com>
Cc:     gregkh@linuxfoundation.org, robh@kernel.org, jonathanh@nvidia.com,
        kishon@ti.com, linux-tegra@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, nkristam@nvidia.com
Subject: Re: [PATCH v6 13/15] phy: tegra: xusb: Add wake/sleepwalk for
 Tegra186
Message-ID: <YAblv4Mk01wrHmEj@ulmo>
References: <20210119085546.725005-1-jckuo@nvidia.com>
 <20210119085546.725005-14-jckuo@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="2pZGkO1M510CWEK5"
Content-Disposition: inline
In-Reply-To: <20210119085546.725005-14-jckuo@nvidia.com>
User-Agent: Mutt/2.0.4 (26f41dd1) (2020-12-30)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--2pZGkO1M510CWEK5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 19, 2021 at 04:55:44PM +0800, JC Kuo wrote:
> This commit implements Tegra186/Tegra194 XUSB PADCTL/AO wake and
> sleepwalk operations.
>=20
> Signed-off-by: JC Kuo <jckuo@nvidia.com>
> ---
> v6:
>    no change
> v5:
>    no change
> v4:
>    move sleepwalk/wake stubs from 'struct tegra_xusb_padctl_ops' to
>    'struct tegra_xusb_lane_ops'
> v3:
>    move 'ao_regs' to the top of 'struct tegra186_xusb_padctl'
>    change return data of .phy_remote_wake_detected() to 'bool'
>    change input parameter of .phy_remote_wake_detected() to 'struct phy*'
>    remove unnecessary 'else'
>    rename 'val' with 'value'
>=20
>  drivers/phy/tegra/xusb-tegra186.c | 558 +++++++++++++++++++++++++++++-
>  1 file changed, 557 insertions(+), 1 deletion(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--2pZGkO1M510CWEK5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmAG5b4ACgkQ3SOs138+
s6HlEQ/8CuPqb+9pMvyV/wNLtjmK+GLs+WUaLtoxCnl3s8UhYpzW6EPvjKKbaaIR
iaKf5i0I1WSdNwmKLV2qn/jalkJ3VrY9169HgBDx1LAiS8lzZAjNBLSfsgUFa8Fe
G2PeRi7O2Trln5D62lvpkURcvPnzShZPZ7kUKi1wOQk4XvzGejsUGgPWHrEEn/wB
5D9aihWByZDp3IlprcVZ9HPHE4zxNPIjkMXYNjdK2uqgUWR3D8Sf11kV3ZLKvkym
9dh65nZNCKg9KTPg8+dnpi+LaH6TmwZAnc1h7FeQy0Nx2KYwW4jeiWI90dcr1INS
1otONRUT8WtR1DCBve1/F3Vv0bcswgnA3QHYnfempGBYhsSLT5N3yk5oKEUoGJYO
8BQOPqteicsw+EKyySpWRLPukGXCeTFp1ipWD8j9klTXQiRemtKy8ZuhVWCSI1On
s+Q80pXYDgrFBHnVzpRimVuG8eDUhuS0LlPHr1qvMXrXvUILTBfBGs1IXgmcV90O
5AY04GbPBGLIn8WkoBGFf5DOfFFwbAaXpckHtC2h/jtIyLJRBL04BhInwyvGtAoK
EYJ5lC6u3WpsLIZGFYHuTdbMGotPU0oc6ZcK24EuNu+zYu8vLbr0C8+1FtiY/WRR
3W6HUk9VthfAtGFTD9QBkLAdFf7fgXBXcXHMIGyKFP8cLtRNXrg=
=Kz45
-----END PGP SIGNATURE-----

--2pZGkO1M510CWEK5--
