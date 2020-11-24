Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BEFFC2D0E4
	for <linux-tegra@archiver.kernel.org>; Tue, 24 Nov 2020 14:12:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 21F9B206FB
	for <linux-tegra@archiver.kernel.org>; Tue, 24 Nov 2020 14:12:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="0uJjC1Rd"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730508AbgKXOMC (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 24 Nov 2020 09:12:02 -0500
Received: from mail.kernel.org ([198.145.29.99]:49198 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728474AbgKXOMA (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 24 Nov 2020 09:12:00 -0500
Received: from localhost (cpc102334-sgyl38-2-0-cust884.18-2.cable.virginm.net [92.233.91.117])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8F4AF206FB;
        Tue, 24 Nov 2020 14:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606227120;
        bh=kZ7dmWGqYUsz1iJvnX3piGx7qsV4bipITHCKQ/3Wwb0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=0uJjC1RdpOp0N1iNy7l0WKP5GF1sCDhOue/56l57aWMc1y3swfVQhpGrWxf0zRy8d
         9CPdTDY3oOLDelRnxJ9FGtfqclVg4MCNDCq7JDFno8yNPnnaUTgBEwLBXukYzsm/Ut
         T7zA75dfUHip/G1NG3r9dOXcxDilVfBuTE6msBGQ=
Date:   Tue, 24 Nov 2020 14:11:36 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Claudiu.Beznea@microchip.com
Cc:     jonathanh@nvidia.com, lgirdwood@gmail.com, s.hauer@pengutronix.de,
        ttynkkynen@nvidia.com, linus.walleij@linaro.org,
        axel.lin@ingics.com, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v3 1/6] regulator: core: validate selector against
 linear_min_sel
Message-ID: <20201124141136.GD4933@sirena.org.uk>
References: <1605280870-32432-1-git-send-email-claudiu.beznea@microchip.com>
 <1605280870-32432-2-git-send-email-claudiu.beznea@microchip.com>
 <cb096dc5-3757-d72f-41a9-c99007c84b40@nvidia.com>
 <f06c90ca-11c8-961d-1461-a9486933a1a3@microchip.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="7DO5AaGCk89r4vaK"
Content-Disposition: inline
In-Reply-To: <f06c90ca-11c8-961d-1461-a9486933a1a3@microchip.com>
X-Cookie: Who was that masked man?
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--7DO5AaGCk89r4vaK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 24, 2020 at 11:14:54AM +0000, Claudiu.Beznea@microchip.com wrote:
> On 24.11.2020 11:36, Jon Hunter wrote:

> > Before doing so, I wanted to ask if that is the correct fix here,
> > because it seems a bit odd that regulator_count_voltages() returns N
> > voltages, but if the min selector value is greater than 0, then actually
> > there are less than N. However, changing the number of voltages
> > supported by the regulator to be N - linear_min_sel does not make sense
> > either because then we need to know the linear_min_sel in order to
> > determine the first valid voltage.

> I would say that a solution would be to have a new helper to retrieve the
> linear_min_sel (e.g. regulator_min_sel()) and use this for all the
> consumers of regulator_list_voltage() and the other APIs that patch
> "regulator: core: validate selector against linear_min_sel" has changed
> (regulator_list_voltage_table(), regulator_set_voltage_time()). With this
> change the loop in find_vdd_map_entry_exact() should be b/w
> regulator_min_sel() and regulator_count_voltages().

We need an incremental fix to return 0 rather than an error for things
below the minimum selector, it's not invalid for there to be holes in
the range of selectors and this is just an example of that.  Consumers
need to be able to cope with skipping over values that can't be mapped.

--7DO5AaGCk89r4vaK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl+9FJcACgkQJNaLcl1U
h9Dt1Af/UjJU7QvVQkXzT954zArh+rkMyXnOg1BnqMdK4r+iGxZj+ItXebH76dcP
qgGSPRcx/pqby84TgsjvA+HCXVwLWFMkHyzXo0nmczSZhz6PCEOas51+EVxaJ5Qb
eNzScw/EMMuYHIfrPSiLD6k5Z+vMigwOdRlh/Du8uqar1ZKj7QPsN9ztKA6SJSQ2
6wyhIB4YsMNra6nXQzG7kysIfPPPx0xdPuoARAzif3Dzsqj2pD3VDWadiViqnbnX
4UVuchN7CxciC8k8tNGwnCHq1mniaaGhH+HCKmLGllzhB56O5Xi8I9WZtZhLQduT
kSmxRhhNq0CBvKLPjWDOV9Na4gp8SA==
=yh8y
-----END PGP SIGNATURE-----

--7DO5AaGCk89r4vaK--
