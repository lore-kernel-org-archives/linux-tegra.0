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
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2C1FC433DB
	for <linux-tegra@archiver.kernel.org>; Tue, 19 Jan 2021 23:58:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AFFCC20A8B
	for <linux-tegra@archiver.kernel.org>; Tue, 19 Jan 2021 23:58:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729313AbhASX5V (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 19 Jan 2021 18:57:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405687AbhASNzn (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 19 Jan 2021 08:55:43 -0500
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52B95C0613C1;
        Tue, 19 Jan 2021 05:55:03 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id c12so1286983wrc.7;
        Tue, 19 Jan 2021 05:55:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=xnKFQcCkUfT5gacgLGL3Mr/+q9VqSBSxDSHWitYfuVk=;
        b=Pa+xoo07ZpHZe57kNUXh30L3MLTNlr31ONoXbnDC9RGl7RvNiefyE/d+N8irl0GrjL
         WdR3M8iRLFPX1vRCZopFrOdHfCwGlT4TOc6JphI1E42UfjJl5AUInG8uLUu0F3YjRol5
         YKZLPGsebNZn96mfnxT5ItHEzV0HlF+AeYdGBX2DJeipDklgJVQjzeUT0Y0K8tRclphV
         opgUdg224AyRM6M6W632jwC5w8aJ9rzpHHnFoHFPszrveV3R8OUpzdEa4R80SfCmg5HZ
         fnBcffOEPJ1wQL0qS20jHCZA6oFVP239nr6N8iHeqeCdluZUlCNLl7QyPpYadEsR0hmS
         hzZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=xnKFQcCkUfT5gacgLGL3Mr/+q9VqSBSxDSHWitYfuVk=;
        b=ScO5TYHPz+XWc7BiWBgXPZ/fScpfEo+gIeILYlKeuw9T7q4UT7tmrBGj8QtvQLdigd
         fzNfD/tJ6dr6vzyvpJVRjX7yIORvHD0MmS4LNDEE5xu5eX5kRQJswzOxK14ZydhffnXS
         7aZAnrIW7nxZXu2QoCap0F9i+NZ/WY24GE8rrVG4BH0Lt9sj6tbLUdEUdBlTYd1HBKcN
         1/VStFmJcPQ+DvB1eSgH8zRqh3AepsHUW2xj2NK1lkOTJXCR/4ENd9UL8gKGtjS4FQ0H
         eQ7IMbZ/AgxaumCEX9FkijG8Qd56iAhEJ4T4Glc7olCWEFz6LNs9SSAwjL4bWSMRRPzl
         G+qQ==
X-Gm-Message-State: AOAM531c/rcr7ak1jDjOvtb0T+y/ZlcU8s9HwZpnyuIV9dhIad3WYAvL
        0Gk9X0UUHQ9RLgaAzdwJZJI=
X-Google-Smtp-Source: ABdhPJxyxjKW/KDW06pl/9ORv7Kj72CdGZvVBFbctpCJQpn5eOv69GADsHaWIcoCUx14HAO9dkP47A==
X-Received: by 2002:a5d:5387:: with SMTP id d7mr4373049wrv.417.1611064502126;
        Tue, 19 Jan 2021 05:55:02 -0800 (PST)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id p12sm4889160wmi.3.2021.01.19.05.54.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Jan 2021 05:55:00 -0800 (PST)
Date:   Tue, 19 Jan 2021 14:54:58 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     JC Kuo <jckuo@nvidia.com>
Cc:     gregkh@linuxfoundation.org, robh@kernel.org, jonathanh@nvidia.com,
        kishon@ti.com, linux-tegra@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, nkristam@nvidia.com
Subject: Re: [PATCH v6 07/15] phy: tegra: xusb: Add sleepwalk and
 suspend/resume
Message-ID: <YAbksocGBUShr1lP@ulmo>
References: <20210119085546.725005-1-jckuo@nvidia.com>
 <20210119085546.725005-8-jckuo@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="wB9qNvXHiaPN/M6W"
Content-Disposition: inline
In-Reply-To: <20210119085546.725005-8-jckuo@nvidia.com>
User-Agent: Mutt/2.0.4 (26f41dd1) (2020-12-30)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--wB9qNvXHiaPN/M6W
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 19, 2021 at 04:55:38PM +0800, JC Kuo wrote:
> This commit adds sleepwalk/wake and suspend/resume interfaces
> to Tegra XUSB PHY driver.
>=20
> Tegra XUSB host controller driver makes use of sleepwalk functions
> to enable/disable sleepwalk circuit which is in always-on partition
> and can respond to USB resume signals when controller is not powered.
> Sleepwalk can be enabled/disabled for any USB UPHY individually.
>=20
>   - tegra_xusb_padctl_enable_phy_sleepwalk()
>   - tegra_xusb_padctl_disable_phy_sleepwalk()
>=20
> Tegra XUSB host controller driver makes use of wake functions to
> enable/disable/query wake circuit which is in always-on partition
> can wake system up when USB resume happens.
> Wake circuit can be enabled/disabled for any USB PHY individually.
>=20
>   - tegra_xusb_padctl_enable_phy_wake()
>   - tegra_xusb_padctl_disable_phy_wake()
>   - tegra_xusb_padctl_remote_wake_detected()
>=20
> This commit also adds two system suspend stubs that can be used to
> save and restore XUSB PADCTL context during system suspend and
> resume.
>   - tegra_xusb_padctl_suspend_noirq()
>   - tegra_xusb_padctl_resume_noirq()
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
>    commit message improvement, no change in code
>=20
>  drivers/phy/tegra/xusb.c       | 82 ++++++++++++++++++++++++++++++++++
>  drivers/phy/tegra/xusb.h       |  8 ++++
>  include/linux/phy/tegra/xusb.h | 10 ++++-
>  3 files changed, 99 insertions(+), 1 deletion(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--wB9qNvXHiaPN/M6W
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmAG5LIACgkQ3SOs138+
s6GsnA/+Ky+cmTpSFVrUZzW5onmZ+ljZAgv+jUkLbky3QZDKBT5PMJ+oYbEwYkNW
tU5jj4zrvgYY6P6wDG1bObEn90TBEgX/WYKuY1SwsTBJOC5zhdHGDbHbiB4E3e6Z
xgs9U14zvQatAhinifHTXPwQhqxlgUC83JkNEZkPhrx1UkWL3qV9Ctw7dtNacgUo
F3R2IAdehyMvGNxrSn8h7ifWOL0YlVTckiw1QPZxixrGT9hw3J6Aj9tcEUf2yrQc
2XOJ7k0NGPaBRwpkI8A4gvJP3tbbu6q+P5TIYChG2ljvWRBB3kKG2BCTp4VZk6RP
z1iOO4leO7EaeF8aVZARdGnEE6QC7W3iq9/bD7mTzJLZ7yOCgBnS/e14ykNUdUlW
Cptu7LzY07cBLWrxNJXT/YC0XuwtH6mj+p3uIYuK41eAAjuK/xLG72mi4ATWikrE
VMt+gaQwyfCJv8u48NzrcYybcGBsKl0EHQfUULVYPI3c5WPvu/yAMIUQc/BX8mYN
TbAiijnaIS9Hj4oxQz2MArOV4CKSRludedLjW4MmBruG3g/iBLfHd9fwb05qntzN
jKqLk9VBdzzDOt5l+9F1EbrGu34+DsVsTV3zsxEqfM3nmFQySZ3DRxMg37uv/tDM
WNueRtrwc1HIrC30u4+5X3lrT0iv6AiWdMyC/pLSn1GlA61+WjY=
=EU19
-----END PGP SIGNATURE-----

--wB9qNvXHiaPN/M6W--
