Return-Path: <SRS0=0tg+=DF=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 454BBC4741F
	for <linux-tegra@archiver.kernel.org>; Mon, 28 Sep 2020 12:52:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EB13C21D7F
	for <linux-tegra@archiver.kernel.org>; Mon, 28 Sep 2020 12:52:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lzX0am67"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726573AbgI1Mwi (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 28 Sep 2020 08:52:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726547AbgI1Mwi (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 28 Sep 2020 08:52:38 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCFFEC061755;
        Mon, 28 Sep 2020 05:52:35 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id m6so1237037wrn.0;
        Mon, 28 Sep 2020 05:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=WhsdZacySdHmhYo66BvVLzv/GBpIKfZV61Gk8RkbUdY=;
        b=lzX0am67ZGVlsQoQ2kbF8vGo4KhrKHhSDPBuqsFxCYgC4MCZw73ajGQvluiQxvwL4n
         QWbNvFJL02cDelcLIh33ImNmabslsGgtra8ROBtQ4wDuVqEHgmppWTn5s2z4nXKUeNKP
         Rnxj4oc9pz7skqddCVA2Xj58LTLxtuquQFw5QHGMmfeBh22j/m169pCUZLADynPwVmMw
         O0X7dhWl1NQ5i58BuzfTvrKLioAttVE5bWDvtNzfgS0NbIwaHLrZbG0ywW385uMYxzT5
         QHTjWY1Coh3CBMTwl3hwsrGbGiRWASGuCoDuNsQY8LuhyN6lxbNBiIUZh8pCiaViiuUV
         8SkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=WhsdZacySdHmhYo66BvVLzv/GBpIKfZV61Gk8RkbUdY=;
        b=P0mfYyA9vvp7pKTMigwVkBi4rP1PFQLpSh/BNetoHXvFRJsKKo2bQ5Cvkaraf1g0Qi
         dq/CR+OGnve82N5dQ+1zm14LFOYjMevO0yfkA+lOFCQeY5Okt38aodNksM95+FgpOlvZ
         nFDgJYNJ7M7Eea4JUFIv3igeBaB10Ry+zLNzwrKBO0pmqQima9VNLGUPPTRdV41BkB0c
         Q8rKAW7ui230sXvLGMx3Xp+7uH0HFZudRjt+NVHzLXsIRuauCT/ybCcB9acJLcxUCDt/
         plgx94SNMXYx9EboAWeRILml7FX0fHLKhA9nc0GdEbdkle39VPDEQ6Cka8bEbmzyFsQj
         XTMQ==
X-Gm-Message-State: AOAM531bi9Jk6kTxcxxVby4fBNDye8tXH+x0R6r1lCciVnQnQ2kVY/L+
        4EqBrLm1uuPvvAEUmxEdMjA=
X-Google-Smtp-Source: ABdhPJyzbqE1S8hnXDtNXfxjwww9r7z4nj/5EZ1jJxjScBfwGXGDRoFQUqvGAoJuZ9m+Jda3RdSE6w==
X-Received: by 2002:a5d:4d48:: with SMTP id a8mr1559082wru.318.1601297554533;
        Mon, 28 Sep 2020 05:52:34 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id o4sm1263689wru.55.2020.09.28.05.52.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2020 05:52:33 -0700 (PDT)
Date:   Mon, 28 Sep 2020 14:52:30 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     JC Kuo <jckuo@nvidia.com>
Cc:     gregkh@linuxfoundation.org, robh@kernel.org, jonathanh@nvidia.com,
        kishon@ti.com, linux-tegra@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, nkristam@nvidia.com
Subject: Re: [PATCH v3 02/15] clk: tegra: Don't enable PLLE HW sequencer at
 init
Message-ID: <20200928125230.GB3065790@ulmo>
References: <20200909081041.3190157-1-jckuo@nvidia.com>
 <20200909081041.3190157-3-jckuo@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="Fba/0zbH8Xs+Fj9o"
Content-Disposition: inline
In-Reply-To: <20200909081041.3190157-3-jckuo@nvidia.com>
User-Agent: Mutt/1.14.7 (2020-08-29)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--Fba/0zbH8Xs+Fj9o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 09, 2020 at 04:10:28PM +0800, JC Kuo wrote:
> PLLE hardware power sequencer references PEX/SATA UPHY PLL hardware
> power sequencers' output to enable/disable PLLE. PLLE hardware power
> sequencer has to be enabled only after PEX/SATA UPHY PLL's sequencers
> are enabled.
>=20
> Signed-off-by: JC Kuo <jckuo@nvidia.com>
> ---
> v3:
>    no change
>=20
>  drivers/clk/tegra/clk-pll.c | 12 ------------
>  1 file changed, 12 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--Fba/0zbH8Xs+Fj9o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl9x3I4ACgkQ3SOs138+
s6EEmBAAuuvM/hY2DJvUpUjDsO0NA03byh0ZvnpmbiPAS93YVx96WfjbP1pMhKxQ
1zeO8P1gXC0rf3o7B3th4zL9PJsLOc1mcoqLGIjo4jFvuOrc6yTHIJ7xSN0oVG+H
1XQ8GWWoU3ErDW+TTgbnbjuwX1/cEJZLA9Ip1jsd+ANxo3oeknPvnKu2/WVLUYdB
pBOg+lTnPR0CtgtRdMWkUSjtHAMruF0oGGP7tTQnRnM5cOgpinzy3N6KWUe5KlHV
6UY2CUeACuAL2EqxmLjcK1HjusOJa19mbgdc4bhMCuvJdSRTtR/Ca4IL1Omk4+Pc
aXEgCy+uhC9S4rHXCC6SkeuAUSPhNCS71/oL+EKVeXY8+G4Hrh+KPjE5bi1XkPOZ
+m4KqXfYZKv+gSnV+4/Cf7Wfxju7EbM9nybyKpOZg93ys0xmcB5spk7+Q5M0LfnM
wW+dBwz9UeTPz+sLxJ7zx12ZOKpis/ZEJUSSkxVSxvnsHb+ZdAzoQhxM4wLP2lgo
9BX2a4F5eF3IKpED0WxjaC4/czGI3Tvrv6RtYRIbAMngMw9e+8nHaYGgwmeIHR6g
q78eUf/Q2CrZpymOerGGIUs0/nB0XzbsMFJTPDEfC4bYgg3HHo8tUfOshJGYf3Bz
sr1hwQu6xUP8wGYtI5MBfrwHPfysa9LfNcca41bnzK1lrCaavuI=
=QKJI
-----END PGP SIGNATURE-----

--Fba/0zbH8Xs+Fj9o--
