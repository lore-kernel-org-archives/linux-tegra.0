Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2ED28C63797
	for <linux-tegra@archiver.kernel.org>; Wed,  1 Feb 2023 16:56:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230519AbjBAQ4Z (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 1 Feb 2023 11:56:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230481AbjBAQ4Y (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 1 Feb 2023 11:56:24 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D07F470B9;
        Wed,  1 Feb 2023 08:56:23 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id B68B9B821D7;
        Wed,  1 Feb 2023 16:56:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC269C433D2;
        Wed,  1 Feb 2023 16:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1675270580;
        bh=p95VTZ74s0ngq1ak6ssuGjQk341jIH4Db9h0E9DotDQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hSgfHDJfjGSCg+AbjO0MN5I/C7xaW4gTqTuMmVspHl6qh+ppLkuvnIR5E1gSUEmZr
         mbmah0KLgRm5vdUQJzGJ4cjguLGrNrqCal+cBQYMQvW98Qx36H2RAFQ6bQHfqusGyS
         5GRTaP0yLS+PJBZ6Ng9SbmbMvu9sEYyXx/M2J9QDrCxUiYUY7fWnPpwS4ymyA47qw9
         6sXdWeUwOG2+G7mCiOFM4PNUXpSze6iWT3OP+Cfryr0GIGh0BYA7NeksplaN4eEFbr
         SDOa/AMShlISPd5Z4bG4G47TGV03OffTOocohUoJzzTPV1rfZDFIuhygiircEzXJRb
         A4rPIZFrQhT5w==
Date:   Wed, 1 Feb 2023 17:56:17 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, Wayne Chang <waynec@nvidia.com>
Subject: Re: [PATCH V10 2/6] i2c: nvidia-gpu: Add ACPI property to align with
 device-tree
Message-ID: <Y9qZsTQK8G8gW6+h@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, Wayne Chang <waynec@nvidia.com>
References: <20230131175748.256423-1-jonathanh@nvidia.com>
 <20230131175748.256423-3-jonathanh@nvidia.com>
 <db53d28c-119b-90c5-de47-bf7a3561552b@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="JUQU0uqB0ZH3qFIY"
Content-Disposition: inline
In-Reply-To: <db53d28c-119b-90c5-de47-bf7a3561552b@nvidia.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--JUQU0uqB0ZH3qFIY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Apologies, but we appear to be missing you on this series [0].

Yup, me, the i2c-list and the dedicated maintainer for this driver:

$ scripts/get_maintainer.pl -f drivers/i2c/busses/i2c-nvidia-gpu.c
Ajay Gupta <ajayg@nvidia.com>
linux-i2c@vger.kernel.org
linux-kernel@vger.kernel.org

If Ajay Gupta is happy, you'll get my ack for free.


--JUQU0uqB0ZH3qFIY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmPama0ACgkQFA3kzBSg
KbZ3Ew//dej9eH30wkbpqRs8i6+6ra4N51QjnoIE7iGw8zkpw0bcEvbmr/5H9xLH
ZFTJhqP/FZzxWp7eap9z96ZQ9sin/m1c0Hqws0uVRMr3fYql8H419KsLZJ5vy2VQ
ImeYxOu+4/KAad6x8Jsd4BsVk4DJzSfFGPQu7t3lVlSh/LgzitSZV5W755qpo1wS
g4NncOOoHfwv95AUi6RQcGihTyV8NZcS8Sa3gfitUkg1T/xXqYqsjDYkx/wVL/nD
PTD25TxaRoGU4wHCZmaSuUzRvLeWKE/0AK/Fzre9qeiyGcv02qG3uonY457bHfwj
+QmosdIvWCh4vpuSd2MukYQ2NtWggxtAalKMD6D13ljCkEu9hNCn8yNR7A4cdA4c
ApOhVfaFz362jjzLAldFwPxyFbo/Qp13MeoAKUJ/fkhMWQedt48VCBKE/CCEJO7j
itvLPI5u5VPLHruYOgUu4BjcQe3XzFVxFh2OZnm3T0KTb4PKzmo5FOTGfKz4lDFI
dkDox/gpBTAGmTIHy7c3nQJv2E7+/l502hVEDFeUBiVON47Vy1SQHpdo4mnQcr45
EsScKpfL9v6+gUh9joBJ5oxEOPEQ4xpu9S/N16hwxvbfOq6HkvPOKhgR3JEBfQ1h
dA+eutpdoYgdF+0cghfTj18cyuYBzqEornMdth1m5nUDYsZaJG0=
=6gc6
-----END PGP SIGNATURE-----

--JUQU0uqB0ZH3qFIY--
