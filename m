Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11A17C433ED
	for <linux-tegra@archiver.kernel.org>; Wed, 31 Mar 2021 16:39:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C4F896101A
	for <linux-tegra@archiver.kernel.org>; Wed, 31 Mar 2021 16:39:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229615AbhCaQiq (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 31 Mar 2021 12:38:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229787AbhCaQiO (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 31 Mar 2021 12:38:14 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7046DC061574;
        Wed, 31 Mar 2021 09:38:14 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id h13so23053755eds.5;
        Wed, 31 Mar 2021 09:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=EvHVTiNpxncmqmnUHDfaPgtAPjMzlqjL23gXxm4wP7w=;
        b=Qc9ML1reRfZwzolatzMLJ+NIMbdbzZYl0uUtLIp/Z5rmjKxdccvOmMiPSQ/mbKY3XF
         dLn3acNZJ43G5XJQf4HNsKhKN7AbWKucnsM9RxABhzCqWgmkeZwYNG8s3RNTKTLYtBFH
         clILf/FiIxtUpZlZtUOdd2j9HGf78CtXHZWDb3dwrNGWa4ugkzI4dgKkHufTxFZafYqf
         lAPw0mkELlCOE0/ijpkhGRK1UXoUrU8LtWpVy+Aso5RlQoX5Xp/ctfX44c2M9EkmhQAl
         k5YFNnrmFCbJlgTQTmvP2oHQL93ovkHhOlnhwlexeiukFatNBjz6VFcCmW3J/emDwrSS
         pkEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=EvHVTiNpxncmqmnUHDfaPgtAPjMzlqjL23gXxm4wP7w=;
        b=dU6jo/x5Nx4O50O4VudBQCP/l9grl1WQnClbjkz+MoJATfT5YUxh1wRvTJCYUumLxW
         Stgc+Lp8ua76ptNa14n2nag9LCAPBJ9X22T93hdgBDGcN5BFfz3fOWaulJunTsZROPno
         WysOB6UVNJHNvvdC8IZ8+NVSz7qTXceEyH3hj8wuMXThNIRrdsKNgdLO3Mn6BbjZ6R5W
         D4D2Y2hOhDx0M3Wpde0u3PTGVG7giwpJrsor0z+Go9mfeUMS68r9fGeehLShriZ5QoFz
         2AqxpyMUoHJIkpUDd/2ea2ZcwhDsDilf+i4TqF4g87kyZWIxF4bZnVQVifLxYjuQA+wY
         ORtg==
X-Gm-Message-State: AOAM531gGNFDMuh/ZIb7AZU+1GsV8mx7RoyCL13Hd54FsnNZ7MMa6p0f
        4CVOz1mazzcklbsJGzk77PM=
X-Google-Smtp-Source: ABdhPJyRMANGCobgTFhalJYhZ+QN7TnYGntxs9rJQvdr/u30sa0oJOm1V57wan97s7JF2dg9HinP7A==
X-Received: by 2002:aa7:c497:: with SMTP id m23mr4823080edq.74.1617208693241;
        Wed, 31 Mar 2021 09:38:13 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id a26sm2239439edm.15.2021.03.31.09.38.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Mar 2021 09:38:12 -0700 (PDT)
Date:   Wed, 31 Mar 2021 18:38:39 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        JC Kuo <jckuo@nvidia.com>, Jon Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH v8 06/13] phy: tegra: xusb: Add sleepwalk and
 suspend/resume
Message-ID: <YGSlj85/3kkfoDiH@orome.fritz.box>
References: <20210325164057.793954-1-thierry.reding@gmail.com>
 <20210325164057.793954-7-thierry.reding@gmail.com>
 <YGM0ZOroZolJ9zEC@vkoul-mobl.Dlink>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="fQeIu1t7loiQgo/8"
Content-Disposition: inline
In-Reply-To: <YGM0ZOroZolJ9zEC@vkoul-mobl.Dlink>
User-Agent: Mutt/2.0.6 (98f8cb83) (2021-03-06)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--fQeIu1t7loiQgo/8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 30, 2021 at 07:53:32PM +0530, Vinod Koul wrote:
> On 25-03-21, 17:40, Thierry Reding wrote:
> > From: JC Kuo <jckuo@nvidia.com>
> >=20
> > This commit adds sleepwalk/wake and suspend/resume interfaces
> > to Tegra XUSB PHY driver.
> >=20
> > Tegra XUSB host controller driver makes use of sleepwalk functions
> > to enable/disable sleepwalk circuit which is in always-on partition
> > and can respond to USB resume signals when controller is not powered.
> > Sleepwalk can be enabled/disabled for any USB UPHY individually.
> >=20
> >   - tegra_xusb_padctl_enable_phy_sleepwalk()
> >   - tegra_xusb_padctl_disable_phy_sleepwalk()
> >=20
> > Tegra XUSB host controller driver makes use of wake functions to
> > enable/disable/query wake circuit which is in always-on partition
> > can wake system up when USB resume happens.
> > Wake circuit can be enabled/disabled for any USB PHY individually.
> >=20
> >   - tegra_xusb_padctl_enable_phy_wake()
> >   - tegra_xusb_padctl_disable_phy_wake()
> >   - tegra_xusb_padctl_remote_wake_detected()
> >=20
> > This commit also adds two system suspend stubs that can be used to
> > save and restore XUSB PADCTL context during system suspend and
> > resume.
> >   - tegra_xusb_padctl_suspend_noirq()
> >   - tegra_xusb_padctl_resume_noirq()
>=20
> Acked-By: Vinod Koul <vkoul@kernel.org>

Thanks. I didn't see an Acked-by on patches 7-9. Did I miss them or did
you not get around to that yet?

Thierry

--fQeIu1t7loiQgo/8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmBkpY8ACgkQ3SOs138+
s6H71xAApJOssnhCMYvdV0893k75SPdXH3Jje5QjqvEU9BzMkY8poGqBZ9s9kU/9
YDA9io8wQLUemmjeCJz2UzX5dshX1+cEAK1pCU1lAURTdGbYagQCp+dNXvaAI6fe
O8wPMS+BskGEysxaMqapj7vzXBeaZDu42n1oAZZJpdF50n0vkv1KAai6l9F+QhBO
T6wqqZQUHVkDjo/30bhFABsZ12JpeoiMYtls5eJ0XY/tzv81UFcpwwefaIe5InrQ
MJnYdZMh9BZnty6L/vWoFglAoeWkqrwf/NmcDvm3wPJeFLGl5pNbg8UYl84U2Yto
mYLwEfr0IZ3My/p0DS9J5t8EKdWlEHi2/6DwqomUzWTgpGvQw1OcBEms/1nAn4iE
FzVQ0CC9mEzpgMKq/s879SkZ5TRKPRyKk1A6Xk+GT/T3h0xSFm9yaqh29JoWLQMc
sENdbotG84BeW5zYJFzS5iR2hjV+9G1oaqCcJ1FZVgIm3HIPvYr4JhhRR3cv0OeH
koNssH4CEftVlZYirEAwUaNdp7Qxg8R4GAnzqAn1UaEy2o51kwSStBL5HUI+suqP
3Xn80VzPqbk6lVlTqOBO7z8J/ixOvGh2jz6QVpAupKDe8TmQJ4Ob7ALQKQZ87q0Y
6LOQdfUdyS79VUNmKwE5DtkiBK5a2k3PPIkY7YfjBETXujyfpq0=
=M/pQ
-----END PGP SIGNATURE-----

--fQeIu1t7loiQgo/8--
