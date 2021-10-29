Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3375FC433F5
	for <linux-tegra@archiver.kernel.org>; Fri, 29 Oct 2021 19:58:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 193D861037
	for <linux-tegra@archiver.kernel.org>; Fri, 29 Oct 2021 19:58:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230196AbhJ2UAi (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 29 Oct 2021 16:00:38 -0400
Received: from sauhun.de ([88.99.104.3]:37876 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229886AbhJ2UAi (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 29 Oct 2021 16:00:38 -0400
X-Greylist: delayed 358 seconds by postgrey-1.27 at vger.kernel.org; Fri, 29 Oct 2021 16:00:37 EDT
Received: from localhost (p5de04e1e.dip0.t-ipconnect.de [93.224.78.30])
        by pokefinder.org (Postfix) with ESMTPSA id D7A252C00AC;
        Fri, 29 Oct 2021 21:52:07 +0200 (CEST)
Date:   Fri, 29 Oct 2021 21:52:07 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] i2c: tegra: Ensure that device is suspended before
 driver is removed
Message-ID: <YXxQ57FgbQIx+fR7@kunai>
Mail-Followup-To: Wolfram Sang <wsa@the-dreams.de>,
        Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>, linux-i2c@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20211019232919.21916-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="nQtl7vGokyqWsQ1f"
Content-Disposition: inline
In-Reply-To: <20211019232919.21916-1-digetx@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--nQtl7vGokyqWsQ1f
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 20, 2021 at 02:29:19AM +0300, Dmitry Osipenko wrote:
> Tegra I2C device isn't guaranteed to be suspended after removal of
> the driver since driver uses pm_runtime_put() that is asynchronous and
> pm_runtime_disable() cancels pending power-change requests. This means
> that potentially refcount of the clocks may become unbalanced after
> removal of the driver. This a very minor problem which unlikely to
> happen in practice and won't cause any visible problems, nevertheless
> let's replace pm_runtime_disable() with pm_runtime_force_suspend() and
> use pm_runtime_put_sync() which disables RPM of the device and puts it
> into suspend before driver is removed.
>=20
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>

Applied to for-next, thanks!


--nQtl7vGokyqWsQ1f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmF8UOcACgkQFA3kzBSg
KbavlQ/+L5xrHBpyis/WSbwIgJKdE8IknJFBlnJ6lqXQcCINWezSQKRkJUzx5rt3
HEA6VUXY4oSVYjfKhqZUGSqxWM2M3dTHl+uCgzR90jcLo1+MAdNwoweQlfv3aOxV
kkrp6taeHXlj/b8ilX7QrvFWno9iXYnbFH3ZpBdr6JDfZvZw9aZ+nE+/obaubalk
orwEBOTl053OkBNlAuMseMM+SzSJli5ZYSC5cnbH08/07N5OGtE6Yf3fi45jMicu
oXN/lzX/2XOulACsdX/ooK+6FVstSSZ1ZISI9VbDB6jaYQlZ//nLk4TBXnmWwpq1
z9+hBm6s1hKEltdSTcyUE4TOHYgSmFtbTq2Jl2oQEbc6aIwf+utBaXY4p+pISVUU
60zbMYYS+hhE0zOI0DurrsH/iBuguSXm0wF/GRGGTTkZTMH5Q/F/hXdenRmqJ3h2
qLgpFGXt9SOmdF9DI5397NLvq1eYl/qBHwZ2t1Vhtfse3VN/5f6ErAZCw/HbbaER
GzznfQX+7Z/yCW98QtWUi662HisUtavcFLvLdkT/NwHMhF2QleE9Zb7gfayNET4S
Zk4K34lV/4+rNgexU0gWWHAg2LWh5tTrS8UiTma6x40Xg9Jg8gu1QOZ6z8i03d/S
cAQX6zqMrqlm3u05qt0SMq7g2EyNmZ+XZFp9j7F2g5h76qROvVQ=
=782P
-----END PGP SIGNATURE-----

--nQtl7vGokyqWsQ1f--
