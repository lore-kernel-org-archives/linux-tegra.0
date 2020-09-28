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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7278FC4727F
	for <linux-tegra@archiver.kernel.org>; Mon, 28 Sep 2020 12:52:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0E6FB221EC
	for <linux-tegra@archiver.kernel.org>; Mon, 28 Sep 2020 12:52:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AfFzz2qI"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726466AbgI1MwE (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 28 Sep 2020 08:52:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726415AbgI1MwE (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 28 Sep 2020 08:52:04 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1D9AC061755;
        Mon, 28 Sep 2020 05:52:03 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id g4so1207476wrs.5;
        Mon, 28 Sep 2020 05:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ixzXxdwc77/F5EB6zZGlL+a1Hf/Z5UQadBnLKAZ43Wo=;
        b=AfFzz2qIjvvzVaz06B97nEUh+GLE9r0R/4hrtsIzsLCUouoxTQxgs3iNP13pKSeVrg
         6ZGdHMX2PeDtaInjnl6fUBY6n2cWBVKOkW8bmU9AfLwprSmAUFw1iBVncMzW7nGwSB+R
         qvnCSrqUGGmKyKa3jZNqTeRDFUsytWNshM/+QlExqNQ+6rsyYSmmwrzweYN0vb+jZTsv
         5u1PShWTPXDyGgFrLQouJV75Un8VLnMGmpIGhJNqqVU+7/qmK/j/icJBPm49g26KijtI
         OpoxZFE2ZLfsWkUJ5dfvaX0KG+O7zP3R9lyjns9DmGiHc64S0UwO0X20MDCmQCzkyeyD
         wH4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ixzXxdwc77/F5EB6zZGlL+a1Hf/Z5UQadBnLKAZ43Wo=;
        b=k7Vi95+sYp3x3a0zDUedeqMHcTOjvkRIkOnpDb6gcyQqXzRp2Ext0L05uDcMvRLIRQ
         IZsnZ/0uw6xFI7u6cR9m0Hjy4SQXCBOpwxk3tLjzCZ327LFQwZgAEsPVyardIo4eDcc2
         MTe+JqNlpHUpZ7xnNZado3QT+lgHD9cibFs0ZABkXnqOiXj+t47BqXNSrh2T7joWu44Q
         FRPqikDiz9bb9mda4gCSl8MzJaHdaaljplXKRiQebRBPaSvVs6EV0ygvVF5RgPZgSAi2
         QWnrewcqh6tWuYBbg9b3AiYqD9Q9P87vYSKP6PQyI4EVJz3Qqr0qpdlN+aq0p2kqkJP4
         o4og==
X-Gm-Message-State: AOAM531HQuzUT3HclSnv8PH5PW9eypknZX/kQlTvzV595zSPkKxxSquK
        UV7dnRAekxIdgIRHJOAJE9E=
X-Google-Smtp-Source: ABdhPJy0fTcsqu8tJhuFWhfOnaBqoiIZ5natgVeK+XWgPIJOEhOqewl4A7r4vQsy+CJ3pJsts8bC8Q==
X-Received: by 2002:adf:9b8b:: with SMTP id d11mr1665079wrc.71.1601297522461;
        Mon, 28 Sep 2020 05:52:02 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id i33sm1533678wri.79.2020.09.28.05.52.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2020 05:52:00 -0700 (PDT)
Date:   Mon, 28 Sep 2020 14:51:58 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     JC Kuo <jckuo@nvidia.com>
Cc:     gregkh@linuxfoundation.org, robh@kernel.org, jonathanh@nvidia.com,
        kishon@ti.com, linux-tegra@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, nkristam@nvidia.com
Subject: Re: [PATCH v3 01/15] clk: tegra: Add PLLE HW power sequencer control
Message-ID: <20200928125158.GA3065790@ulmo>
References: <20200909081041.3190157-1-jckuo@nvidia.com>
 <20200909081041.3190157-2-jckuo@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="wac7ysb48OaltWcw"
Content-Disposition: inline
In-Reply-To: <20200909081041.3190157-2-jckuo@nvidia.com>
User-Agent: Mutt/1.14.7 (2020-08-29)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--wac7ysb48OaltWcw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 09, 2020 at 04:10:27PM +0800, JC Kuo wrote:
> PLLE has a hardware power sequencer logic which is a state machine
> that can power on/off PLLE without any software intervention. The
> sequencer has two inputs, one from XUSB UPHY PLL and the other from
> SATA UPHY PLL. PLLE provides reference clock to XUSB and SATA UPHY
> PLLs. When both of the downstream PLLs are powered-off, PLLE hardware
> power sequencer will automatically power off PLLE for power saving.
>=20
> XUSB and SATA UPHY PLLs also have their own hardware power sequencer
> logic. XUSB UPHY PLL is shared between XUSB SuperSpeed ports and PCIE
> controllers. The XUSB UPHY PLL hardware power sequencer has inputs
> from XUSB and PCIE. When all of the XUSB SuperSpeed ports and PCIE
> controllers are in low power state, XUSB UPHY PLL hardware power
> sequencer automatically power off PLL and flags idle to PLLE hardware
> power sequencer. Similar applies to SATA UPHY PLL.
>=20
> PLLE hardware power sequencer has to be enabled after both downstream
> sequencers are enabled.
>=20
> This commit adds two helper functions:
> 1. tegra210_plle_hw_sequence_start() for XUSB PADCTL driver to enable
>    PLLE hardware sequencer at proper time.
>=20
> 2. tegra210_plle_hw_sequence_is_enabled() for XUSB PADCTL driver to
>    check whether PLLE hardware sequencer has been enabled or not.
>=20
> Signed-off-by: JC Kuo <jckuo@nvidia.com>
> ---
> v3:
>    rename 'val' with 'value
>=20
>  drivers/clk/tegra/clk-tegra210.c | 51 ++++++++++++++++++++++++++++++++
>  include/linux/clk/tegra.h        |  2 ++
>  2 files changed, 53 insertions(+)

Acked-by: Thierry Reding <treding@nvidia.com>

--wac7ysb48OaltWcw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl9x3GoACgkQ3SOs138+
s6E8zA//X72FLMZsvq0ehMvTMnGUFDQCTFAcoaAjJWIsFSXzCu2cOlOnUzGff0nr
Ps2OIt30Gv0cumo34Aci9ttDLe2lCHmYY3Jc+Yx4Jg0thE+bcqK7REHFichWw0bR
NXVyT76WfWqkFjePOeX+KIho2SS8GPs3T21a14WD5bgJThny6IZe+plQkLUR3j7I
QloXTpSQUkA9I+aaIq+se0crgsRQuV/cNxUWh03nKBgr134u/jB8xfRKk/kjggWi
yLYWwOMwxrQppOledLF8yn5ad9wnrOzlP3ebG5p1gMolebLuCR/XdPLcoSDxOTjt
PP7vgjH9/HaWvn4IGDedM7FbBS9dYQarnqXtLUxh8gOz266cU8VeLRsrGSSsGjii
tqHRf100EJbt0cCqExkzUhMYaHFGjSydtjzB7YmBZt2JodNzQEBxS+tFJaGzLjMc
RDDZO4tNR196nJtC5U2/lBFUR8TvJBnLEKbR30DGeF03fyJ6gH04bM9YD+/mBhK8
Sx8kKK6iPyp90AA55XhmaSV+Oo38Q8HIGKmp7vFnYphfbWnGNBiaJwT6tGmLUdl2
+lXHRemozVSWQe62uKHhirLg76k3KydGf/OEJuC5S547iAG0o1xkUJ4giOweo+Q6
q9gk7vkkp34qztWWceQF3OnlURNNWwSoJ3v50HDnqWhkIsPHopU=
=2pDf
-----END PGP SIGNATURE-----

--wac7ysb48OaltWcw--
