Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DAA6C433FE
	for <linux-tegra@archiver.kernel.org>; Mon,  4 Oct 2021 20:41:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6E6E16140B
	for <linux-tegra@archiver.kernel.org>; Mon,  4 Oct 2021 20:41:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236658AbhJDUmz (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 4 Oct 2021 16:42:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234781AbhJDUmz (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 4 Oct 2021 16:42:55 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82203C061745;
        Mon,  4 Oct 2021 13:41:05 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id a131-20020a1c7f89000000b0030d4c90fa87so1027935wmd.2;
        Mon, 04 Oct 2021 13:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=21pmMNHe04yYMw5Rk6sKWbHD+gygwVufGvhmdxyhUGA=;
        b=R6spbj/fPg5LoFFOE0o/9MFMBvyT/tbtJJYFAKOwr4qHWUgosvTjFMcUBMHaoxq2EW
         OnQpGSQqrG851za5EzNh2Ju/QfzXh2R1X5n9B2CsIve+APHA/J1EBxTvL3F4TSvczH/3
         Mse7Re6gUS3S8uVybjY+/IKedQR8bppQr9jsfiaH4SKI/yLWv5kxW8xBlaeR4Am54Ct5
         m6SIIbJyy+qn1KNVpwV4qduB4yHVEWL5PzbEmQloeCmSW3L/0HqX7UH2KapTFNCAd44/
         N2kBp2N0aPbteL0nyEtfNOOMzuJe3uwevKJTry05VqxwGOYZyX0M01p+Ju3CJxr3fltI
         hHNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=21pmMNHe04yYMw5Rk6sKWbHD+gygwVufGvhmdxyhUGA=;
        b=0g5WabgqccDYYXcVfsPBMc6GNDG0fJt30ucGay2SMbmpHTReiN2Nd8JFWmWfvaAVXH
         Uh5sdx7Ez+KwL3E3Opzn1I23oyKYsdxzfNKr7JWMNJWwuQZ1v1OUw0dLd/TanJY6iTMt
         hN5mJZsPRqnvLs9CN3zeB9DN8GihP4JvCvMBVD6dbZlVFm2w8jtzaOSvQowTxOZ7b/x4
         J0+WdqV+uxLyQjKvCG6lY5jnhwv/FM37LEqHlbENwx23BAix5zmUFvCvLlLNVxWcU1/R
         7u3nK0nKItSJRYj7HlmYKjGK/CN/5VitGe/8CR8xF7PB2Dtv0o3EripeeTM3RF9pjcrk
         Do0Q==
X-Gm-Message-State: AOAM532ISsEsbzt7y+5UDYnnDjgBwiRpJZmiPvRKob1B+rJUapWrabS8
        9jJ96IsryKHxx0O8g8eSIj9xIsYqEpc=
X-Google-Smtp-Source: ABdhPJxhHLgRjQXPROlYLjAlGgN667s8LGXelXScqsIpvIuRzBYF4Lzw9EGCOjBefrbV/W+zngVJ5Q==
X-Received: by 2002:a05:600c:210e:: with SMTP id u14mr8225021wml.70.1633380064118;
        Mon, 04 Oct 2021 13:41:04 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id q3sm14987413wmc.25.2021.10.04.13.41.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Oct 2021 13:41:03 -0700 (PDT)
Date:   Mon, 4 Oct 2021 22:41:02 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <treding@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        David Heidelberg <david@ixit.cz>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v1 3/3] ARM: tegra: Update Broadcom Bluetooth device-tree
 nodes
Message-ID: <YVtm3sivqqpeaz3T@orome.fritz.box>
References: <20210926233704.10164-1-digetx@gmail.com>
 <20210926233704.10164-4-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="8Ydouu++YzPYEfu5"
Content-Disposition: inline
In-Reply-To: <20210926233704.10164-4-digetx@gmail.com>
User-Agent: Mutt/2.1.3 (987dde4c) (2021-09-10)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--8Ydouu++YzPYEfu5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 27, 2021 at 02:37:04AM +0300, Dmitry Osipenko wrote:
> The host-wakeup GPIO is now marked as deprecated in the broadcom-bluetooth
> device-tree binding, it's replaced with the host-wakeup interrupt. Update
> Tegra device-trees to the recent version of the Bluetooth binding.
>=20
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  arch/arm/boot/dts/tegra20-acer-a500-picasso.dts           | 5 ++++-
>  arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi | 5 ++++-
>  arch/arm/boot/dts/tegra30-ouya.dts                        | 5 ++++-
>  3 files changed, 12 insertions(+), 3 deletions(-)

Applied, thanks.

Thierry

--8Ydouu++YzPYEfu5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmFbZt4ACgkQ3SOs138+
s6EDCg//U3Caykm+rdRuiv4nU+AeIO+eAJRNgrXKOhguzu9fG4sF+H7cgdyQqsCv
IR6wcWg25E5liq6Hgo/yGGje/VlKi3nclj0EUR26Rrm0oGzocbIjh9+aiAMiKRHg
EA6t5I2BLGwjWTemf7pkKljGiQStsKUHHn5BSEdYgT+cBhX1H2ac+TllOJDNur1F
vtBMgmfiQMSYZ3iGca5ig3FcntIdhVYDSEuGjaQebffmJLotWnmczZ5orvsxNrRE
6MM6y2KreCCFS/xJAcBPNZjMm7B4MGNjWdCx61GZGGhl+XZxAxVzQuiVFgPaAlvD
/SPxesFlBxCLoMbaC33IKoL5VODz87EycouNYMz/u9Um8vImaBLn5UHmjMyLb3w0
Mts55XX2I3u1uR9easXXdORCm2/qw0xTy7aOlDPfBEEaM0pnTFxSS1lsltyTaytw
t7wN3zu7fSgS/3dszmQKJBQESSyXlbloUEL4eMX/GVf9Bbvxi6+hoSQD1Zxl3ORm
seBlvCne9gfTreswkIxaWAO+TVO0hFvE5uS3XobEpGFQJRVAeaLHuugwWB7OvVhw
bJS2KJzj69ZfRcrADm5XH8yu4JZbk6I0l4xd4aADpxjS5BHBCIbpaWA2k9fO1fkK
56S+lXqSq54hsiExI3Z64/QilVs/GnyIvilyhbmE+Zd8BDQrqpo=
=yfom
-----END PGP SIGNATURE-----

--8Ydouu++YzPYEfu5--
