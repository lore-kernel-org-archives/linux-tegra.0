Return-Path: <SRS0=kAmo=DM=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB873C4363A
	for <linux-tegra@archiver.kernel.org>; Mon,  5 Oct 2020 20:53:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9CD342078E
	for <linux-tegra@archiver.kernel.org>; Mon,  5 Oct 2020 20:53:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725855AbgJEUxC (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 5 Oct 2020 16:53:02 -0400
Received: from sauhun.de ([88.99.104.3]:52328 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725845AbgJEUxC (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 5 Oct 2020 16:53:02 -0400
Received: from localhost (p54b33598.dip0.t-ipconnect.de [84.179.53.152])
        by pokefinder.org (Postfix) with ESMTPSA id 1D8E62C08AE;
        Mon,  5 Oct 2020 22:52:59 +0200 (CEST)
Date:   Mon, 5 Oct 2020 22:52:58 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 00/32] Improvements for Tegra I2C driver
Message-ID: <20201005205258.GB1397@kunai>
Mail-Followup-To: Wolfram Sang <wsa@the-dreams.de>,
        Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200929221915.10979-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="i9LlY+UWpKt15+FH"
Content-Disposition: inline
In-Reply-To: <20200929221915.10979-1-digetx@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--i9LlY+UWpKt15+FH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2020 at 01:18:43AM +0300, Dmitry Osipenko wrote:
> Hello!
>=20
> This series performs refactoring of the Tegra I2C driver code and hardens
> the atomic-transfer mode.

Applied to for-next, thanks to everyone! Please send incremental patches
=66rom now on. Also, there is this unreviewed series:

http://patchwork.ozlabs.org/project/linux-i2c/list/?series=3D191802

Is it obsolete by now?


--i9LlY+UWpKt15+FH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl97h6oACgkQFA3kzBSg
KbY0HA/+NdA/QNyneG0/JryMokkjx1IQtTCzlc7EZ8kmSRY/9yw75uPM9BP5xwCk
uNIKjR05V1GE5PzoTMjoQ9sHKM1ES3rU6hpoqbuPl//ihdhvyhFUO8FN8aVqCJtV
GE7jvWxqLSnjVU7TG+EMlSQu7zIL1PGzrBdCn4AITxAS6XW6oNseyNGnXi/YyJhd
828ILM2YRZXSaiR9YuMhuCQaBlJMcXB5oQ7xbkdlQat+KjnB9jmgj16oHyafH1mF
kN4N/8f2Qnc9EL4vaGaY+ktp/vTqPcqjDtBo4VDpdkQXVwQdi5JfqMQVk5SmT9Q0
K4Wnw6cHf+UspgvyABsWn5ofg0gaZOHMoE5gBQGY5FpGh/9XJ73WN2Q0Ub1+zQQy
jTNfzbPIQxvP/YknQ5eDUBmgVGwN5xdQ4odT05AVBE/VGilfVcYgXsIdtQ/ZGeG+
l3oKS0jZzaUEjsgQzpm5WoHftrQpaVstFEJwT5vxdSZubaqGQ72bxlEvQX/iFkZv
iruiHVdC5KdZxlG+J2iMmqiG0qBMKxa7LX3TAr3XrywpttJtSe8tL8DFX5I1T0x1
VrrJ3510F5NQnK/jLicdlQ0+lLPspRI7w2Ocq078Fuc/VZldmZ7qNpFuXdbGOxv1
q4hV+VeVu5FcFtClwxjQRzt/1Su1jDiKBZQHQDEBBJVYIDfTVP4=
=Vvdi
-----END PGP SIGNATURE-----

--i9LlY+UWpKt15+FH--
