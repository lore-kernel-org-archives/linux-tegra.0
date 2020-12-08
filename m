Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCA48C1B0D9
	for <linux-tegra@archiver.kernel.org>; Tue,  8 Dec 2020 12:14:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 907E1233FE
	for <linux-tegra@archiver.kernel.org>; Tue,  8 Dec 2020 12:14:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729305AbgLHMN7 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 8 Dec 2020 07:13:59 -0500
Received: from mail.kernel.org ([198.145.29.99]:50552 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726361AbgLHMN7 (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 8 Dec 2020 07:13:59 -0500
Date:   Tue, 8 Dec 2020 12:13:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1607429599;
        bh=mLvA4FB9gzMsXJ8QIezTtXurSP32ina1dgLS7P/tnCs=;
        h=From:To:Cc:Subject:References:In-Reply-To:From;
        b=ZMVHeQyHNSPwCQMbCqYhkTXnoF9Z0QSIOtBEpu8fRMHacmE3u67zGCIb5ThVu1RDq
         vx9/bw7vyu4AOMfQfGcw0JJbrvDtOMBSxVvumIhLuvhrkd0mGhlby6plAJp2GVYPh1
         RrJ2fW2vF0y5dvorTHyn4QwahvD3EH/FikvL63w7v7dnQxaNgw1irKUt4MyUJ5GBhq
         9r3bJfmuDklX/Gu7uAJmWcceeN9m6IOquI/OZ/ex3N7kNjdXBaAMhC8otrZlzCtoQM
         znyHuaX31VvvRQO4Znt/z/ZzBRAsyfnfuEmyxh2BxpVHCKDS0x10yO1x0qxCYzij+y
         QqTB79P6JCkkQ==
From:   Mark Brown <broonie@kernel.org>
To:     Sameer Pujar <spujar@nvidia.com>
Cc:     thierry.reding@gmail.com, robh+dt@kernel.org, sharadg@nvidia.com,
        jonathanh@nvidia.com, kuninori.morimoto.gx@renesas.com,
        linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
Subject: Re: Re: [PATCH v6 0/6] Tegra210 audio graph card
Message-ID: <20201208121312.GB6686@sirena.org.uk>
References: <1606413823-19885-1-git-send-email-spujar@nvidia.com>
 <160683107678.35139.14772386553150233276.b4-ty@kernel.org>
 <a3541d83-1f2e-c60f-05f8-4fdd8c8f4175@nvidia.com>
 <20201207123131.GB5694@sirena.org.uk>
 <14d2a6cc-9ca6-f6dd-ae83-6fc75d5361eb@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="bCsyhTFzCvuiizWE"
Content-Disposition: inline
In-Reply-To: <14d2a6cc-9ca6-f6dd-ae83-6fc75d5361eb@nvidia.com>
X-Cookie: Do not dry clean.
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--bCsyhTFzCvuiizWE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 08, 2020 at 09:24:47AM +0530, Sameer Pujar wrote:

> > No, this was sent by a b4 bug - notice the "no commit info" there, they
> > weren't applied.

> Oh I see! I guess review would be still pending then.

I don't seem to have them in my backlog so either there was feedback
=66rom someone else I was expecting to see addressed or some other issue.

--bCsyhTFzCvuiizWE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl/PbdcACgkQJNaLcl1U
h9CqnQf/eMYjgDWfCNyswXGemvr7kIq6mU3xUpEyqfZR+q62DDj64lzHbDh+56qf
IQR1LbQUCVgzig4dhU3+Sz6/mjZx7kxCac+Gp//Px7tcGoG0h5vaCHszxguqF/7Y
TnHTOm76s06tVl8eS9eZf4sN0xbWQWNaq7wk1KYxorUAqpAjQU0giDPhXHDwRJWw
ogelYbCNvEVqxHTKRn8ZoMQsdatgxiyUiUu+ZXHKbUUHhAAqUhxs0cAbSdI5KDOy
Ijqlx7oYx1m6IRQpEJDonQPe4K3EYbZz5umZKB9S8zOYDmd0cGFWpbVhjZfQ/nYx
1uf+VdF8gSYdWzAYO6jkUKPEXF+eVA==
=ZNIG
-----END PGP SIGNATURE-----

--bCsyhTFzCvuiizWE--
