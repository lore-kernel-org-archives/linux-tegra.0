Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F406DC433DB
	for <linux-tegra@archiver.kernel.org>; Wed, 20 Jan 2021 18:42:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C633523428
	for <linux-tegra@archiver.kernel.org>; Wed, 20 Jan 2021 18:42:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733290AbhATRhV (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 20 Jan 2021 12:37:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732001AbhATRgC (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 20 Jan 2021 12:36:02 -0500
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E17C2C0613C1;
        Wed, 20 Jan 2021 09:35:21 -0800 (PST)
Received: by mail-wr1-x42b.google.com with SMTP id g10so5510936wrx.1;
        Wed, 20 Jan 2021 09:35:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=bgWbillt2EgWWG5wuhiDZDSvtc6oP4uvK/bDe7atus4=;
        b=m/DQCZTCFDAKAA47Fqyr754WPbDeIlXyeMyJc5X1hFhVDLxtVxK9YanCcfypvzCVTm
         f4oeRquI2HYah+oWSPGB44coBCY0pbzUGmiVjq3BoIZ5eRH7vPNGqWFa/++/wlUF9sog
         vVUpbF0+aUvcbCf7q80COT84GSMUolRI9fk5M0uMlbX6aVemVh27ksTZuJy813zMym6i
         8HndGkfMoxwVk0a/wGLhj5fbZJRz3EajFrz7YXvXOZJTPR8a9Cfo1iYoqIE95k3TYdoS
         a+rbQYxnPf3dIIvpdkjdkO4X4zRPfgqLtnNZQK2K5ZCD16ZIYj/RMO831ok5u+jVJjz9
         g4Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=bgWbillt2EgWWG5wuhiDZDSvtc6oP4uvK/bDe7atus4=;
        b=pMkZHZIZbCZlrmsrS143XMv1/nfw8qtTk3DFN4pjLizPuYuTsewdyhYD2tKn5Q1rLc
         04iP0BVNqrN/GzyX+QK/UdNZ10RrtMD6WuNdlNGrAO8gc6U8GHV5foyCxkBC3AyQBnqc
         lL/FKP0Y2+UhB1ECBlXhbjkV8E0wxG3psK9fY5da0qyy9dbzmzMoLrlcY5/8NiZRQ8oQ
         03LkTeIq2G4hpdj8x3eblZzrJJlGn40d+tWnqj2NU8IhPHM/RgwhJ4DM+T5ij5bvkFEo
         XYMwawF5GUS8yUhC0aH6S8WM7O2LCcyG8H9//aLi8AldZ51Wnvt4TYLjGfgR1UGJ34f4
         /ziw==
X-Gm-Message-State: AOAM533QalzsIlaknlFzyfvRmGhFGJBwqPCtKnh9YqKdV8r8YOFmnBAX
        3Eyj23PidBA7wDbvIiDEO7I=
X-Google-Smtp-Source: ABdhPJzByxqsWOE3ecma2d/q4MjvAdPab8HfLtylXkpN1r5aMzK5sHc1+rLNxK0T60IIARVKjx0OjA==
X-Received: by 2002:adf:e547:: with SMTP id z7mr10021098wrm.283.1611164120662;
        Wed, 20 Jan 2021 09:35:20 -0800 (PST)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id r16sm5306760wrx.36.2021.01.20.09.35.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jan 2021 09:35:19 -0800 (PST)
Date:   Wed, 20 Jan 2021 18:35:18 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     JC Kuo <jckuo@nvidia.com>
Cc:     gregkh@linuxfoundation.org, robh@kernel.org, jonathanh@nvidia.com,
        kishon@ti.com, mturquette@baylibre.com, sboyd@kernel.org,
        linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        nkristam@nvidia.com, linux-clk@vger.kernel.org
Subject: Re: [PATCH v7 08/14] arm64: tegra210: XUSB PADCTL add "nvidia,pmc"
 prop
Message-ID: <YAhp1tzeVszKFAXt@ulmo>
References: <20210120073414.69208-1-jckuo@nvidia.com>
 <20210120073414.69208-9-jckuo@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="18V6D7czgfXzXs7x"
Content-Disposition: inline
In-Reply-To: <20210120073414.69208-9-jckuo@nvidia.com>
User-Agent: Mutt/2.0.4 (26f41dd1) (2020-12-30)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--18V6D7czgfXzXs7x
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 20, 2021 at 03:34:08PM +0800, JC Kuo wrote:
> PMC driver provides USB sleepwalk registers access to XUSB PADCTL
> driver. This commit adds a "nvidia,pmc" property which points to
> PMC node to XUSB PADCTL device node.
>=20
> Signed-off-by: JC Kuo <jckuo@nvidia.com>
> ---
> v7:
>    no change
> v6:
>    no change
> v5:
>    no change
> v4:
>    no change
> v3:
>    no change
>=20
>  arch/arm64/boot/dts/nvidia/tegra210.dtsi | 1 +
>  1 file changed, 1 insertion(+)

Applied, thanks.

Thierry

--18V6D7czgfXzXs7x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmAIadUACgkQ3SOs138+
s6EDMRAAvfRgeCYikIL6BAwhM+SJloxBij+bHJARe9b4wi6pnROzxtFyJqUvo/cB
g19sC695KcooGStaivQiO9I7P/oFiss+DW2X7p0gz/3QvOO9JCsjpw6rT87qi6d/
ssfTnZ+vjiJg2YA+xvIomS9x6VTknLB4yNf0gN++hr/qkLUBviIg1WLwEKQ2TA4q
42rT2OoJC1IXx+BJ7w6O1N+bu4RFRva2jv2E6dOrTFdgeP4WR6D3gvgoHfeqGYJ+
HXtn/3j4X2DrTnUwAXkZ3EPBSTW/KxjUKKmUkZLkxILSZDFzQ2wIVH1DUEGIqQYn
GN52PjCca4A7FYY0coZIEiW48lthCybbVu21NPs+C/qqBTwuyEBOZULvPfDeVJQa
5b9K3RsL1M4z00iSTueUa/Q0aiiGcAoOoeOZIbdH+4E9AteeboFfO0NB+qmudQxi
fpR0JJtEbov1KiE2xJG0McHesgUfWbqdcfyN9U2FNcEzNhppyDhdj1OfTiJ/frRy
L8ryBXnTZ2aufYjDyJe7ShDJElIbssSBI4ETs48Zc9zYlejUuth8H4aNgNS7pCe1
ihtyG2TegmRT2IgZDEvYn3CrPGElfcDaRBMBYaM0869tTa1Has8+SVIPxWO51UWK
YZkkTPNo9qYFrMwP2E/EwyiImIxLsDeBQh8RTEUG0ED9CQgd/9M=
=zY9/
-----END PGP SIGNATURE-----

--18V6D7czgfXzXs7x--
