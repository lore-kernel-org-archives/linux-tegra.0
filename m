Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E947BC433F5
	for <linux-tegra@archiver.kernel.org>; Fri, 10 Dec 2021 15:01:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231383AbhLJPFH (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 10 Dec 2021 10:05:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231156AbhLJPFH (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 10 Dec 2021 10:05:07 -0500
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF7E8C061746
        for <linux-tegra@vger.kernel.org>; Fri, 10 Dec 2021 07:01:31 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id m25-20020a7bcb99000000b0033aa12cdd33so7325573wmi.1
        for <linux-tegra@vger.kernel.org>; Fri, 10 Dec 2021 07:01:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=0KZrnIu+zteTn9ooumUQg8iNynSkm9sAUepqTBXW/M4=;
        b=NAQy1KruoKj5SEP+ima2Po9jkRO/vTHfdI/aESfdX+5BlU2+fXUM211I9wCDSQHIhD
         07vJREaMl3cUpOvDIQp2BUrFlIFL6jCArixbLFJvgDS7prYfSyKqo1zh6eVZxWknCQOv
         6ONxMOitebp2L3u+QZZLydbzYAImKb1x3z8IOIaq0//hOjOCQhDXJc7oy7M/BPr/RKud
         e4mdfTJQd6neB6gHCirRi7Ffa8N6tQhsgru9wzvp89ULjT2X7bMm+OxyVH8vN/3he3Qd
         q5RPUugZeyBw6UJNAzZb+Io8Y97vImaO5QcpibV/1ygriN3sxbYxGc4MMOvqNxmDDFfI
         tj5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=0KZrnIu+zteTn9ooumUQg8iNynSkm9sAUepqTBXW/M4=;
        b=Tc8GrSGPxpySlHec2x2zraCPGM366ua4TdH5TdiO1o0ZYXlIce4jYEqb5cVvVELxat
         cJxIJzsYVr0as+O2VvmgW2I9vxqZsVMaqUqv56lFNEH/YOG3uJ39hJaf2DeYNJxzUI29
         qXn7wQcRrmfuZQml1qBbd9d3U3mwOYaJyOcUm8jBlJo2u76BFc1zwLBOmYs7N6N9b+Bk
         1WuBLuqo/itmLu7bXjBCw7rv7iWfi9CXeY+1GV2w0sXIn1kAo362/CoOpnhXyQiNOzt5
         cDdXmIplEvVF2X5payso5q+aO7siG6YZitqAe+R9mvtD9CbHIFL1atmM21FAgAYnK1/K
         eb1Q==
X-Gm-Message-State: AOAM532lX+cHl+4U0spfCtO8XoejhuxC2klJpYt8bErgookU5v0M1Tja
        erPvjP1WYEWw+O4DIdisLVM=
X-Google-Smtp-Source: ABdhPJwCiv8ck7B7ojLZ8p01z7AAvnZFw2WPI/lBofRecKM2iGl6fne/OF7/Z/P5EeMK3dc6YQwPOA==
X-Received: by 2002:a7b:c109:: with SMTP id w9mr17516450wmi.114.1639148490443;
        Fri, 10 Dec 2021 07:01:30 -0800 (PST)
Received: from orome ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id k8sm2800614wrn.91.2021.12.10.07.01.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Dec 2021 07:01:29 -0800 (PST)
Date:   Fri, 10 Dec 2021 16:01:26 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 22/25] ARM: tegra: Move I2C clock frequency to bus nodes
Message-ID: <YbNrxsv6Gd9jvx7l@orome>
References: <20211209173356.618460-1-thierry.reding@gmail.com>
 <20211209173356.618460-23-thierry.reding@gmail.com>
 <4865a5b6-c841-99c6-f132-24967a349f9b@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="AL+M4xkQ+OLwRWm1"
Content-Disposition: inline
In-Reply-To: <4865a5b6-c841-99c6-f132-24967a349f9b@gmail.com>
User-Agent: Mutt/2.1.3 (987dde4c) (2021-09-10)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--AL+M4xkQ+OLwRWm1
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 09, 2021 at 09:57:08PM +0300, Dmitry Osipenko wrote:
> 09.12.2021 20:33, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > The "clock-frequency" property for an I2C controller needs to be
> > specified at the bus level.
> >=20
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> >  arch/arm/boot/dts/tegra30-asus-nexus7-grouper.dtsi | 3 ++-
> >  arch/arm/boot/dts/tegra30-asus-nexus7-tilapia.dtsi | 4 ++--
> >  2 files changed, 4 insertions(+), 3 deletions(-)
>=20
> The clock-frequency is specified in the parent-common N7 DTSI, NAK.
>=20
> There is already patch from David that removes the clock-frequency from
> NFC node [1], please use it.
>=20
> Please never again rewrite the preexisting patches, this makes you look o=
dd.

Again, please don't make this into something it isn't.

> I suggest to collect *all* patches (not only your own) into single
> for-next branch, resolving all conflicts, making sure that you don't
> duplicate the effort and letting it all to be tested before it will hit
> the bus.

You know, if you guys communicated better over existing channels or
actually let me know of what's going on then a lot of this could've been
avoided. I don't have visibility into what you're all up to, so I can't
take that into account.

If I happen to start working on something that someone else is also
doing in their corner, that's by accident, not because I have bad
intentions or because "I want to do everything myself", or whatever
other reason you keep coming up with.

Stop insinuating things that aren't true.

Thierry

--AL+M4xkQ+OLwRWm1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmGza8YACgkQ3SOs138+
s6EuyBAAgLEbOhhHoM6qjpY2oBK+/4VB4JTlLxKdebN9kT+Y4emfuUZmMwkDSTil
jgRwsMn5bVRDNJVskYkznkwA6NklwEnphPUFLgq/2HlZJpw9V7mOlJqjFEdbOIO2
jg7y3Wy5KyhpDqlvHtDsMB0Y+h+vmO7XsH2AGL9k7PXbEWv2kwjubpOAtKuTZx1m
JdgEjgBHgBvEonU9UdEW1Axk4DdqBD5cFT3Gfa6nVw6UzfRK6iPeEZs6he2n/YHw
852IT7KEjEAzdmHi1msVE/e4O7s1Vy4q1Wv6+ViYwiYsJdgm775rFTKR3GZ6PkvW
fcpPn9XMTd7ybnYg+k/BlSBPdfC/VJRVGYhgyODXsgGQPxSfflDfPZL9WTXElvXW
FFGdBTv+Kl7hRPpQUYxAfS8e6+CxH/xLttNXdvY6k+qwo487ipTcgP7m9SfvGqGi
JD8ezdyi+qFtydq3ldRZsAJOiS9F7W1aNSMIWjQraPxM0qbo1tRuyE4iC3NHsbEG
x4ZCDbjwlGJmQ9pf/7z0iRhf+gFTxiMebFAsrSzlTDVacbjc/kkjGKZiIFFrZUlu
Aw03ZRFTZ9Tvd3vkugsrwjbaJ3jBF9x2q5kANG3OjtVyV5tBTAvZJEXc/bLcqAwl
BCkSauoblOqxDMHbzYv4m+uIAi5T1fHpaF/Psk3lp+Z+He7Wp9k=
=xgHf
-----END PGP SIGNATURE-----

--AL+M4xkQ+OLwRWm1--
