Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7D55C4742C
	for <linux-tegra@archiver.kernel.org>; Mon, 16 Nov 2020 16:50:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 55DBF20776
	for <linux-tegra@archiver.kernel.org>; Mon, 16 Nov 2020 16:50:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E7nC7WUp"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727499AbgKPQtw (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 16 Nov 2020 11:49:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730741AbgKPQtw (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 16 Nov 2020 11:49:52 -0500
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F005C0613CF
        for <linux-tegra@vger.kernel.org>; Mon, 16 Nov 2020 08:49:52 -0800 (PST)
Received: by mail-wr1-x444.google.com with SMTP id d12so19377582wrr.13
        for <linux-tegra@vger.kernel.org>; Mon, 16 Nov 2020 08:49:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=F1wZgVirySN2dgENiDlcVdO081kMB2zHL970Q+yNMAE=;
        b=E7nC7WUptMx3ZPwbhTYTSkDU7zqRrFqVL+KVdneUUI7kE6Bh3F9OHe30viojPYMuGj
         IObcRykBtO0ubyNcP8qMnHtcZHYhOmKFfVnQFucNWzbMn+JwMetZ4XRCYzt+Iq8ChrJz
         WcBajZIEtUehWrHhgtU+kYkCncHvzwNWKUlpUdDpZdi4WVk7UNTPWh9InB1ZE+j1WXuf
         pk1IxNPHg8bGY45Fa2nw25xdi11BGwkMDvnB5LSbbZwObLwjHhUyIwzg36XdTiR0C1SX
         SglzbtsLTyzdpAPRiB+perQVk+ncdXb0Zgb+GgPbMHtsb1UDGuHdfneYEMEN3FfmxMK3
         U9wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=F1wZgVirySN2dgENiDlcVdO081kMB2zHL970Q+yNMAE=;
        b=F5FboQGBS8i+Zv/okZSJqPa2B+Ngb6BvUM/GsSGzAh9+Gt6F50OncQfvsLZJNg4aq6
         yz38HvAOkiAdb+gXhocO0YPfXM60h/idzuM++orIB0gK8k+Elpo6+n/ro31xplD2k6Um
         qSulyhXU/awOga89Wo+A/6w00NQRkH14fqAPdzQ8MqBaOo8t0xjdYAk+aTMnHRD+lYbi
         kgi4GH4/x6TRs36zkygOGkYEOWXckuYEU9W6BwtR9Yvr/p53fHHSsGkYUvzl5n4bKNTT
         LrQ6uwTiqwvYTq2TovwmMtL1Nel6XrK/7NMJGAGfcLm11H62TGEtSuH54LtES76BYzow
         5nsw==
X-Gm-Message-State: AOAM532c+O3B5S2HLFyp9atl9bQsU4Ks/DkwElVX62bfDB8A7C77sOqD
        xBIli+iesOZijRzwUit02i0=
X-Google-Smtp-Source: ABdhPJxoZPUxP23osCZh2p3L+EvA93T0+SvaJC8nEjo8QPz96v83lFP+snxRu1cL4kZjjpH1SPHoDQ==
X-Received: by 2002:a5d:474b:: with SMTP id o11mr19499394wrs.235.1605545390767;
        Mon, 16 Nov 2020 08:49:50 -0800 (PST)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id n128sm21115280wmb.46.2020.11.16.08.49.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2020 08:49:49 -0800 (PST)
Date:   Mon, 16 Nov 2020 17:49:47 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Necip Fazil Yildiran <fazilyildiran@gmail.com>,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH v1] soc/tegra: fuse: Drop Kconfig dependency on
 TEGRA20_APB_DMA
Message-ID: <20201116164947.GB2584498@ulmo>
References: <20200923003421.4561-1-digetx@gmail.com>
 <20201116132005.GD2224373@ulmo>
 <4699e7eb-ac82-4666-9bca-7692d5441b3f@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="Pd0ReVV5GZGQvF3a"
Content-Disposition: inline
In-Reply-To: <4699e7eb-ac82-4666-9bca-7692d5441b3f@gmail.com>
User-Agent: Mutt/1.14.7 (2020-08-29)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--Pd0ReVV5GZGQvF3a
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2020 at 04:48:39PM +0300, Dmitry Osipenko wrote:
> 16.11.2020 16:20, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > On Wed, Sep 23, 2020 at 03:34:21AM +0300, Dmitry Osipenko wrote:
> >> The DMA subsystem could be entirely disabled in Kconfig and then the
> >> TEGRA20_APB_DMA option isn't available too. Hence kernel configuration
> >> fails if DMADEVICES Kconfig option is disabled due to the unsatisfiable
> >> dependency.
> >>
> >> The FUSE driver isn't a critical driver and currently it only provides
> >> NVMEM interface to userspace which isn't known to be widely used, and
> >> thus, it's fine if FUSE driver fails to load.
> >=20
> > This isn't entirely accurate. The FUSE driver also provides SKU specific
> > information via tegra_sku_info and exposes some of the FUSE registers to
> > other drivers, such as the calibration data for XUSB.
>=20
> The SKU data is read out only once during early boot and the DMA is not
> used for this. The FUSE platform driver exists separately from the early
> FUSE code.

True, but the commit message isn't entirely accurate as-is, because on
later Tegra SoCs the driver does a bit more than that. So if you don't
mind I'll reword this to be a little more accurate if I end up deciding
to apply it.

> > The APB DMA is really only needed to work around an issue on Tegra20, so
> > perhaps this really is okay. On the other hand, could we not just change
> > the dependency to something like
> >=20
> > 	select DMADEVICES if ARCH_TEGRA_2x_SOC
> > 	select TEGRA20_APB_DMA if ARCH_TEGRA_2x_SOC
> >=20
> > to fix the Kconfig issue but keep the explicit documentation of this
> > dependency?
>=20
> On Tegra20, the APB DMA is used only for by NVMEM which is exposed via
> sysfs. If DMA is disabled, then NVMEM isn't registered because
> tegra20_fuse_probe() returns -EPROBE_DEFER.

Again, true. But -EPROBE_DEFER is a silent error, so if somebody indeed
has DMADEVICES disabled and TEGRA20_APB_DMA is not available, then they
will not get FUSE support and they are going to struggle to find out why
that's not working.

> Hence there is no real need to enforce the extra dependencies. It's
> always better to allow minimizing the build dependencies whenever
> possible, IMO, and it's possible to do it in this case.

I don't entirely agree with this. Dependencies (and especially selects)
are used to pull in driver and/or features that are generally considered
useful. In this particular case, TEGRA20_APB_DMA is needed for the FUSE
driver to work correctly on Tegra20. Whether FUSE support on Tegra20 is
useful or not isn't quite relevant at this point.

There's also a balance as to what makes sense and what doesn't. APB DMA
is a useful feature in itself and disabling it is very much discouraged
because there are plenty of other drivers that can make use of it. That
is also the reason why we enable it in the default configuration. So I
don't consider a select on a symbol that's enabled by default an extra
dependency. Instead it's more of an explicit statement that you really
do want this enabled if you want that driver to work.

And like I said, if we don't have this and the driver will fail to probe
because of -EPROBE_DEFER, the user is going to have a very difficult
time of finding out why exactly that's happening. We're not even
emitting an error for this, so there's no way of knowing, even if they
enable driver debugging, /why/ the FUSE driver isn't working.

Thierry

--Pd0ReVV5GZGQvF3a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl+yrakACgkQ3SOs138+
s6H81A//VQ5QaxfXZqlyASyuYASrc9HaBKVSgsyX1TtSWod2caQUodH4eti19c7H
+a0xA3ZjEMgLL5dCpTxqF0ZvROt5zkI5Ps8dnb7UdMhoisu0QNX/4TP3dTFfRk1S
vXD/7dS7sKj1ulTy3hHsevJukdWvErVyLMU9cUQ1rwyKw2LDIfqKohX/9NSySnG/
kJKHM+/cn3c0uvCdmwA1Jzg1F/2TJawRWAGSxbkeV8SCglcMTAdxGq/ePbmZv8pM
XqnHD9/lAUM01uy9DPygyFGxUtC2ySK4wYqhpVhh1b7cbqsV+udtG12QhjO/M392
+fe0kemB/3S4ckW2AaLpxhFWxS++LMkcoWQ1/QMWl593yrNpiFbTPs6x2cHxICTn
fqTdGWk6S3QJm3lbwCxxlVZFTMofKxrdvUbCVSUTM8GlM9t0e048ByWXMhE0MFt1
xIDP8IUPM3NnHtJg2Ybmy3OOvrfbcPNIXeCet3fr+fZwc5y+Qn4hV36pDHGfumiO
CdAsvAKix14mKK3pfUswXflSouS+Y41DgOAoydTtIV5nDdx/HofSkDg9ReumkXGG
ObOuaZv1PlESI8OSdOD5Z+ZWw2TaNJta3y7+U7fWwRUIpqi2xM4GgSfpz8mg/xwU
n/UF9a/ZjQWMfI00XHFQ91KGpya6omQZ1LFdb7BZMfZaut/s1dk=
=5Gbn
-----END PGP SIGNATURE-----

--Pd0ReVV5GZGQvF3a--
