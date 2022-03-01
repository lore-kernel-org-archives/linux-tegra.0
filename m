Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4AB2C433EF
	for <linux-tegra@archiver.kernel.org>; Tue,  1 Mar 2022 19:37:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236414AbiCAThw (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 1 Mar 2022 14:37:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235896AbiCAThv (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 1 Mar 2022 14:37:51 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 555876AA6A;
        Tue,  1 Mar 2022 11:37:10 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id EF5DE615FF;
        Tue,  1 Mar 2022 19:37:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B06E6C340F1;
        Tue,  1 Mar 2022 19:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1646163429;
        bh=nuOYLNOEKJ/PgEM06VBZtI0/ROOjPa0AMzbnmjnXZG0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=k47vvtrEf+u2glkkwutfQGlA8hUowEAKkYEVj6qlJEfZdvtek2kyF8GT/7fBkt6gZ
         BlMJTyYjcyZuIDN47yQkLegbf5O2lC7TTiZSHkaghmaXeqwVT3gV4foiF6PtqRH/Y/
         2xtBNTGHdtHwj17qQyTv4fhRTIu7qUufcXKXP/ZvSo/lqTTtn7rH0hC53AwiLE4T2B
         g093inN/1KUYC8Tj8LvlOyDOin2g1NxPx5SYYuZeVXKhnxBeKyibellRGi3iL6xPRT
         taUXTNywzDmVib1lGI3PCSj+4ipH5+PfRzdRQDyBw5+oxs2vjUI6X/rQ+oSXnO1CqF
         RLeZYMRcbfAKQ==
Date:   Tue, 1 Mar 2022 20:37:06 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Akhil R <akhilrajeev@nvidia.com>
Cc:     christian.koenig@amd.com, digetx@gmail.com, jonathanh@nvidia.com,
        ldewangan@nvidia.com, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        mperttunen@nvidia.com, p.zabel@pengutronix.de,
        sumit.semwal@linaro.org, thierry.reding@gmail.com
Subject: Re: [PATCH RESEND] i2c: tegra: Add SMBus block read function
Message-ID: <Yh514tXfut9w9Ol+@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Akhil R <akhilrajeev@nvidia.com>, christian.koenig@amd.com,
        digetx@gmail.com, jonathanh@nvidia.com, ldewangan@nvidia.com,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org, mperttunen@nvidia.com,
        p.zabel@pengutronix.de, sumit.semwal@linaro.org,
        thierry.reding@gmail.com
References: <20220210153603.61894-1-akhilrajeev@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="T4xbMA2NOxe4BtNR"
Content-Disposition: inline
In-Reply-To: <20220210153603.61894-1-akhilrajeev@nvidia.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--T4xbMA2NOxe4BtNR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 10, 2022 at 09:06:03PM +0530, Akhil R wrote:
> Emulate SMBus block read using ContinueXfer to read the length byte
>=20
> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>

Applied to for-next, thanks!


--T4xbMA2NOxe4BtNR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmIedeEACgkQFA3kzBSg
Kbbl0A/9EQo5qWJTSPRQsEU4fPR14AHkeiO5c/SbikbpUPzOgj9OS+mRuB24Mj52
SfR0uo1lw+8zINim8HK0duRzNB4JBQWe1HwzirYefs4WpygMpvsSCrFqzSxPKw1V
B9X/iCz/b+ose2S6nNaZe6lljN1QXEEscOlC+39yKMwGdO65b2DcmeL7ufVGige4
TaF/Q71/Mmjyka0cTl2J65RcWQA2AhZPztxQ/JSuyoQ26TMnsoYi5bdpVMnQOdad
DlThRB6kXwniP4OFay9CppKBdk/QPVINWFqdaGOiv0veCaaGiN0AFuAn9KZFkUmt
0boQ+dq0fX5ONbUdhSU3JPkQhjBd9xOOrcyM41z9JAIuAZfhXPYvbJ0tudp0pYks
zLJWSghbm9hmlee5TY8Op6PMxNX2nGmDXjt9AOMZW7d9gLblmzagGhuU5TWfCPfm
yjP41J2UtFbQUpOt9m9vxBwc5BxqgRdBngKwt7TYzGNOFudHeD0+1NXy3oHbi4pP
UDh6ZQJn/Iapqkn0kzgrWlvS5R7akgCegrBwmhpZwyt+jrn6aqnYtUzeqHt5AuDA
VJO2FUgsG/n0mwDUEs3ap+4Fjj+o8AeFKylXBExKgIytbPJIsAaAYCVsnhlZmv1f
m85JjekGc6FrsHcTtKLohwf6K6eWqE0RMS+Y+XCUYXrUI2fAIJo=
=eiDr
-----END PGP SIGNATURE-----

--T4xbMA2NOxe4BtNR--
