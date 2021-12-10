Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41BDDC433EF
	for <linux-tegra@archiver.kernel.org>; Fri, 10 Dec 2021 14:10:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235997AbhLJONy (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 10 Dec 2021 09:13:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232310AbhLJONy (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 10 Dec 2021 09:13:54 -0500
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D50FC061746
        for <linux-tegra@vger.kernel.org>; Fri, 10 Dec 2021 06:10:19 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id 77-20020a1c0450000000b0033123de3425so9149228wme.0
        for <linux-tegra@vger.kernel.org>; Fri, 10 Dec 2021 06:10:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=dpWzJfXrxTIJO7enZ+l98rgC61nK37+fxuME5MUu6ws=;
        b=GZfM65y7PCDSzJAdbtz0yD+xD8trDp3I6AEDXcvWaCxdK6gPpn+GgIE//3SdUfQSD5
         zqzOakvEqdX9JqcNpRopg6yg4PLcn3eq0UoC5DrAFS8o5G23+dUuX3ufIelFYl+8nHGM
         Jc1a+MMlayRL8KxfmokIKC/Bua4vv9IAjLMioEtDIy9A60GW3ilAHCYabocLCORiu5q1
         150Dr/51TI/Pu9HYI0ljn4cXylijPaunZFMCpwsgHDJXW0aOOIauhdkiPL1fm0Ky8yWo
         xTiuY+3yf19Pu6yLdYu+dJ4uhW/juQWzXjkIaExs+YDWotL4LjyNdtWfNBr3lRrzaqB0
         PgTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=dpWzJfXrxTIJO7enZ+l98rgC61nK37+fxuME5MUu6ws=;
        b=wpO07zmcWehDwJLUOcJ+q8U2asWIqBMvJFf6KYgisUFjXVT7tkfy9oecYkAlFaYPH4
         5v4NERzoQq0/Iip8JjG9u9dyWXYaN0KmMpdlkmX90ntFIxGK9HGxb78bwmFjZexdZf/b
         A273XMy4Q61hIlZK2xpIWDd2OnN/YoluN0m+1npiB3WwlF+cXMeob0JtMvoimPmSclRW
         ylf6xPzlfd7a/7LT0eKFpOl6bfEdB/c9qB+moRQQV1biSeAvD7gs4YVjcxRBGPzT6jWc
         kGmdlxJP0EOk+cJFOQw5iULrQWBJj1US4CwLyBc6axeQr2ntraUd61YPlg+vyx9yjhoV
         EdVA==
X-Gm-Message-State: AOAM533sXqgoI3/ScUyQ8m6ok/rXl6pKkyEHhlOUq51sG2DlPRgwjtka
        HmFHAx4UHllK2eHkXS0lYuXhSTns19KlJQ==
X-Google-Smtp-Source: ABdhPJzmia/lLYA/bbdBZ0OjRXvG+ClzDTwUQROrsVilcInVhPrWXvpKR3ESlV3JO1vBCQryLD8FYg==
X-Received: by 2002:a1c:1c8:: with SMTP id 191mr16561791wmb.90.1639145417736;
        Fri, 10 Dec 2021 06:10:17 -0800 (PST)
Received: from orome ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id o12sm3417927wrc.85.2021.12.10.06.10.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Dec 2021 06:10:16 -0800 (PST)
Date:   Fri, 10 Dec 2021 15:10:14 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 11/25] ARM: tegra: Rename thermal zone nodes
Message-ID: <YbNfxvRBaoAHyL6+@orome>
References: <20211209173356.618460-1-thierry.reding@gmail.com>
 <20211209173356.618460-12-thierry.reding@gmail.com>
 <ca6f962a-6ea4-2a4c-cddd-a49bf482be9f@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="4dD/J9tD+/SKLriw"
Content-Disposition: inline
In-Reply-To: <ca6f962a-6ea4-2a4c-cddd-a49bf482be9f@gmail.com>
User-Agent: Mutt/2.1.3 (987dde4c) (2021-09-10)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--4dD/J9tD+/SKLriw
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 09, 2021 at 11:06:30PM +0300, Dmitry Osipenko wrote:
> 09.12.2021 20:33, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > The DT schema requires that nodes representing thermal zones include a
> > "-thermal" suffix in their name.
> >=20
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> >  arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi | 6 +++---
> >  arch/arm/boot/dts/tegra124-apalis.dtsi      | 6 +++---
> >  arch/arm/boot/dts/tegra124-jetson-tk1.dts   | 6 +++---
> >  arch/arm/boot/dts/tegra124.dtsi             | 8 ++++----
> >  4 files changed, 13 insertions(+), 13 deletions(-)
>=20
> Won't this break the soctherm driver? Looks like it relies on those
> names. Have you tested this?

No, as far as I can tell this is matched based on the sensor ID. The
name that is specified in the driver is only used in kernel messages
but has no impact on how the nodes are matched, so this patch should
have no impact on functionality at all.

I've just tested this on Jetson TK1 and indeed all of the thermal
zones are still properly accounted for:

	# ls /sys/class/thermal/thermal_zone*
	/sys/class/thermal/thermal_zone0:
	available_policies  k_d   offset     sustainable_power  trip_point_1_hyst
	cdev0               k_i   policy     temp               trip_point_1_temp
	cdev0_trip_point    k_po  power      trip_point_0_hyst  trip_point_1_type
	cdev0_weight        k_pu  slope      trip_point_0_temp  type
	integral_cutoff     mode  subsystem  trip_point_0_type  uevent

	/sys/class/thermal/thermal_zone1:
	available_policies  k_pu    slope              trip_point_0_temp  type
	integral_cutoff     mode    subsystem          trip_point_0_type  uevent
	k_d                 offset  sustainable_power  trip_point_1_hyst
	k_i                 policy  temp               trip_point_1_temp
	k_po                power   trip_point_0_hyst  trip_point_1_type

	/sys/class/thermal/thermal_zone2:
	available_policies  k_d   offset     sustainable_power  trip_point_1_hyst
	cdev0               k_i   policy     temp               trip_point_1_temp
	cdev0_trip_point    k_po  power      trip_point_0_hyst  trip_point_1_type
	cdev0_weight        k_pu  slope      trip_point_0_temp  type
	integral_cutoff     mode  subsystem  trip_point_0_type  uevent

	/sys/class/thermal/thermal_zone3:
	available_policies  k_pu    slope              trip_point_0_temp  type
	integral_cutoff     mode    subsystem          trip_point_0_type  uevent
	k_d                 offset  sustainable_power  trip_point_1_hyst
	k_i                 policy  temp               trip_point_1_temp
	k_po                power   trip_point_0_hyst  trip_point_1_type

The only difference, as far as I can tell, is that the "type" attribute
now reflects the new name, but that seems harmless enough.

Thierry

--4dD/J9tD+/SKLriw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmGzX8MACgkQ3SOs138+
s6FS0Q//RGhlb9+BZaAExiUQFg9D5HW2CFcYDWHd2UeiyyaXspvSPoYbjYZJNHjG
D+xSezClGhiLK9hRPfQ+/eO0Bofsc5Nhw+IvWnJnT9w5X+6gii8m7jPx9OkqOe+E
fy4OUwC4gMhicGVnH8nUwuQTGvgQtJ8y8dIB+2nnPPMrVckesILarfLSzzupqAPU
utQA9M3kW4gB+8cZDPNELu9yN73yoY7mSjqU8t7eeeeL6fN/wl9K4xVvKQUdggdX
ZPCCIc5Y4QW3Ke1+Fnq5QrHs+dZJWrzS4Et49z6TdS7h9+GDRwWQ+XpfSt23EkWR
4kABm1su3usoh7sUxpBpfTdPVbuvo82Wmbu+OvT8c6CVoocFCPlpa09ljFWSUPcj
+42zqAZPASMhu6oTF4VnK7dhN4mXM0FEPof9CwDVbnsAO0i+BOzYS68AiiI17ojF
xjEvDPCybvbZGlC5q4A8ApVU2JV6tph123j/P1PS2kIw3rB0fvSK+sIh3BpG9TMH
yo5Jgi+RUE1X+h3B3tViLQtZiAGfr2+XZ3kCyKuugtthEFQDwzbNa94tjq6d2UQv
xLrKZUxAoMwE7aB4f9Mwu0MJoDws34v5aXxxk6nLuK1a24Lw9SLz/U3oBlvDERyy
0aW3oGz5NeXQ4CdpThANX1UFC3KW3Ot3ELqos8pZVydksninwkQ=
=kpW2
-----END PGP SIGNATURE-----

--4dD/J9tD+/SKLriw--
