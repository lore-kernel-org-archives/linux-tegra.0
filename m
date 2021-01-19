Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71981C433E0
	for <linux-tegra@archiver.kernel.org>; Tue, 19 Jan 2021 23:37:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4B30422E01
	for <linux-tegra@archiver.kernel.org>; Tue, 19 Jan 2021 23:37:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727866AbhASXg5 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 19 Jan 2021 18:36:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2395056AbhASOFD (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 19 Jan 2021 09:05:03 -0500
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com [IPv6:2607:f8b0:4864:20::833])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DC21C061574;
        Tue, 19 Jan 2021 06:04:20 -0800 (PST)
Received: by mail-qt1-x833.google.com with SMTP id e15so13678885qte.9;
        Tue, 19 Jan 2021 06:04:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=TH6tIa7KmmTBxKCeREOLdZWW+HlzUZd6P/Dq1uJJcvo=;
        b=VGhLZsyv+gpGddxVKxIkOaWu3PVVMK8hpdjXJLLlA4F81h1k0YkPSiEnQAd4bVv6pA
         JgRtf+bhPCzcUdd4sqblBP/PyDjQApDKodflTiZblp036j001pZm9Alho8iS2tbT1Q8/
         QNfPnykbPuA0b6XZ576Qnd9SMZqKKnKAWAaRnkJbbPsWv7651gHbAh28Ux0GhBiF0TgW
         Su5atvXpCaAczl3eSAFErJsOJo07stP2icTwHW/KLsF5mq0XiZu0Z/SFLrfLLdTccYhW
         lPG/+rmgZs4h3P1Aqj7PuIRE0aRIOnAV5CzIF/sY/D9I07KZ38x47Xbgey18jILnNadU
         FLdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=TH6tIa7KmmTBxKCeREOLdZWW+HlzUZd6P/Dq1uJJcvo=;
        b=KBoHpUvhWb1pK4+BwCKiEkTE9Yn47FisVdu8Ys00jokLUu3GcbZ7Wz8D2O4tyU/Bx9
         Pq+uoI2U/k8MWqokGawPqoW0eS3SMezJPuHKNXG02oHvaz4iVfy8Jrir/Ck7p3fc5A62
         M6rJAY3lPAtKdQ1ksIyGPi6skB5/yZRG1v7/ICdbWhEFhKmR+TZNZq57dCjklx6VaL4K
         Dl9WKPPt37XuroEsqSoQR26Vn3KKvFYK++OxZ8iGsGW8Or9XErJyDoCU+df0gnyNELGU
         u83OyYZC+n11Lz8+Iqpxbtig8dSWHT0oB0hx8yP2hHPeCqozCMi25cHPGdsvwwUIf5lW
         wGKg==
X-Gm-Message-State: AOAM530fQWjoPEtmBKvPcWZRmqAsmMYQL0gBFNKUWJa114YBUIQbhAPX
        YFQFFtH4qZqmpI307G05QJE=
X-Google-Smtp-Source: ABdhPJzMe8jbW50g1iVGM3lGWpJV0ziRnIiiTGPcykrnoO8Tj71NQBBD2B/hMWGfGZj5U2douqQ5KA==
X-Received: by 2002:ac8:742:: with SMTP id k2mr4228578qth.46.1611065059735;
        Tue, 19 Jan 2021 06:04:19 -0800 (PST)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id b16sm5234059qtx.85.2021.01.19.06.04.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Jan 2021 06:04:17 -0800 (PST)
Date:   Tue, 19 Jan 2021 15:04:15 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     JC Kuo <jckuo@nvidia.com>
Cc:     gregkh@linuxfoundation.org, robh@kernel.org, jonathanh@nvidia.com,
        kishon@ti.com, linux-tegra@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, nkristam@nvidia.com
Subject: Re: [PATCH v6 15/15] xhci: tegra: Enable ELPG for runtime/system PM
Message-ID: <YAbm39gww7F3okLP@ulmo>
References: <20210119085546.725005-1-jckuo@nvidia.com>
 <20210119085546.725005-16-jckuo@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="m4cIgoQOaH3JJzUk"
Content-Disposition: inline
In-Reply-To: <20210119085546.725005-16-jckuo@nvidia.com>
User-Agent: Mutt/2.0.4 (26f41dd1) (2020-12-30)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--m4cIgoQOaH3JJzUk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 19, 2021 at 04:55:46PM +0800, JC Kuo wrote:
> This commit implements the complete programming sequence for ELPG
> entry and exit.
>=20
>  1. At ELPG entry, invokes tegra_xusb_padctl_enable_phy_sleepwalk()
>     and tegra_xusb_padctl_enable_phy_wake() to configure XUSB PADCTL
>     sleepwalk and wake detection circuits to maintain USB lines level
>     and respond to wake events (wake-on-connect, wake-on-disconnect,
>     device-initiated-wake).
>=20
>  2. At ELPG exit, invokes tegra_xusb_padctl_disable_phy_sleepwalk()
>     and tegra_xusb_padctl_disable_phy_wake() to disarm sleepwalk and
>     wake detection circuits.
>=20
> At runtime suspend, XUSB host controller can enter ELPG to reduce
> power consumption. When XUSB PADCTL wake detection circuit detects
> a wake event, an interrupt will be raised. xhci-tegra driver then
> will invoke pm_runtime_resume() for xhci-tegra.
>=20
> Runtime resume could also be triggered by protocol drivers, this is
> the host-initiated-wake event. At runtime resume, xhci-tegra driver
> brings XUSB host controller out of ELPG to handle the wake events.
>=20
> The same ELPG enter/exit procedure will be performed for system
> suspend/resume path so USB devices can remain connected across SC7.
>=20
> Signed-off-by: JC Kuo <jckuo@nvidia.com>
> ---
> v6:
>    fix compiling warning: extra tokens at end of #ifdef directive
> v5:
>    avoid using xhci_get_rhub()
>    protect ELPG routines with (CONFIG_PM || CONFIG_PM_SLEEP)
> v4:
>    reshuffle the code to avoid these pre-declarations
> v3:
>    use 'unsigned int' for PHY index
>    remove unnecessary 'else'
>    drop IRQF_TRIGGER_HIGH when invokes devm_request_threaded_irq()
>=20
>  drivers/usb/host/xhci-tegra.c | 407 ++++++++++++++++++++++++++++++----
>  1 file changed, 370 insertions(+), 37 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--m4cIgoQOaH3JJzUk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmAG5t8ACgkQ3SOs138+
s6FiRA/+JzS85x8wlzd3wVtXLr/NrOGVX+ABlM+gzXd5MCguuF81Ih/SXmYHBc3Z
99OFwL708T0qXOS0/DM7Wq/VUmFM8mlbyjSujsrG3Daa69CrEbH9pboUMBihc6ki
I1TNQe+SWlnrMxaS9YjuMtM8bSIWIiVmSDUlpOuzFFjm37CESKGCTx3u3T4+jO9D
IsVDgcwkX63kIb25yeIyVkfS9mYwD4NlMkBdIo4NIULSscGQB2fKX9gZX2HCBA7u
qQvxc2+1jdnp5mV4wZGmQ2iXZ55ErmCh315kLI5jIE3KYGsilwvcvJAYAsZDN1rL
wyp9Bq0pkT41f/xQqe7OYKYUxKBHdD5LgbSpXf7CvqyMG930rCgHDDooERfnQNAN
8cly6toEj/ugUhknxB7TU7mt1FO3c2BNjSYc7xPHlLXGaKEqa5reYYGoufP+SEuL
uAY/4tqxWroI+8afW4BVYCrDevQNjDH7FniUePgX5xd6ejhvjfFPU0YnyszM7dE9
egmqzDp9bpkM4ddIwHXZYYITL8AdM0n9FsgYvFu6/evzy2oUDC4caQTZwoiU2s6r
4Imn6H/rxR5zShSi6zZKTrDdnFQIUwfPHPLbNHuiqzcucaaLIXFSMVHZYiBPhX6M
yh1hWi2U4b1gPfPb8Rpy3ZWvWKfkYOrwg5l4GTIPphIWJ9MKnBg=
=B9a4
-----END PGP SIGNATURE-----

--m4cIgoQOaH3JJzUk--
