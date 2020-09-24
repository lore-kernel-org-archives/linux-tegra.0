Return-Path: <SRS0=yNrD=DB=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58770C4346E
	for <linux-tegra@archiver.kernel.org>; Thu, 24 Sep 2020 07:26:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0AAD323600
	for <linux-tegra@archiver.kernel.org>; Thu, 24 Sep 2020 07:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1600932384;
	bh=94TZ4ZEsVidxddkdHx2pb6heCf8JpMWyUYacOZRXr3s=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-ID:From;
	b=pisSmRlV7CdU9qnd35EkLtK3Sn16UkLF/CFzt0KtM1jABFfA3jBwOjg5/eU9UVt1J
	 F5VCH2aZ18HYx117bskoixbChi5s2FZsexWVbydi+2WlzjKe3K4HF9hsaOC3bRa4om
	 899vhZOf77fHJhJMzSeDfrf/60yHcDVbWLEKP+pg=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727004AbgIXH0X (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 24 Sep 2020 03:26:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:42518 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726993AbgIXH0X (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 24 Sep 2020 03:26:23 -0400
Received: from saruman (91-155-214-58.elisa-laajakaista.fi [91.155.214.58])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C885C235F7;
        Thu, 24 Sep 2020 07:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600932382;
        bh=94TZ4ZEsVidxddkdHx2pb6heCf8JpMWyUYacOZRXr3s=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=Y8rmXLgqJNRl7XEVIMy8C3hXuW62VIxKwmwiK9qe53Fx8qv9CVARL0AphHQkZQc1R
         5Y2x36/aoppFdMOOkaO4s9vsFLuZo9gN68PpJFcccVQQLY5lhOFA+YCwn7dM2GF/gk
         A/hF9iYAycOb2j1rfSdR6pEUXYxH8rsHcnuTqExs=
From:   Felipe Balbi <balbi@kernel.org>
To:     Tang Bin <tangbin@cmss.chinamobile.com>,
        gregkh@linuxfoundation.org, thierry.reding@gmail.com,
        jonathanh@nvidia.com
Cc:     linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Tang Bin <tangbin@cmss.chinamobile.com>,
        Zhang Shengju <zhangshengju@cmss.chinamobile.com>
Subject: Re: [PATCH] usb: phy: tegra: Use IS_ERR() to check and simplify code
In-Reply-To: <20200910115607.11392-1-tangbin@cmss.chinamobile.com>
References: <20200910115607.11392-1-tangbin@cmss.chinamobile.com>
Date:   Thu, 24 Sep 2020 10:26:15 +0300
Message-ID: <87imc3eiug.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Tang Bin <tangbin@cmss.chinamobile.com> writes:

> Use IS_ERR() and PTR_ERR() instead of PTR_ERR_OR_ZERO() to
> simplify code, avoid redundant judgements.
>
> Signed-off-by: Zhang Shengju <zhangshengju@cmss.chinamobile.com>
> Signed-off-by: Tang Bin <tangbin@cmss.chinamobile.com>

Applied for next merge window. Make sure to get this driver out of
drivers/usb/phy and moved into drivers/phy ASAP.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJFBAEBCAAvFiEElLzh7wn96CXwjh2IzL64meEamQYFAl9sShcRHGJhbGJpQGtl
cm5lbC5vcmcACgkQzL64meEamQYsEBAAxoRLenIpfVmDh4VvaW4PJtOg2x9IqBV7
0vU1xAcQsgURSg+ob+VeuycHELzi0rf1W5G4aSz3ylrh84Nf9obCDOAsJCQf2bym
ncLOWvX4o1gR6ine/WyBVonQ47O4z6HZjl0z/FT5fOmG0BEpFCyq7oq/f7K6+a1H
1UbUAWAS5Gy0svm5OB4qwK1AW1qm62qCwIij8bbL7ktPu1ZJqmBrPr+aFE6LLGZ6
uVmfZQuO+Z10Apoi3FI0++k60sWz6P8VsyHFMdsV0jQVjXDHwgrOlnIaGki4nhTY
TrVsHxUjEqLLejIDgD53pZ1b5XCJfOipM1xiMC1PFQhr2Y0yK6F3wCdbfY670Ckh
ysZSeTUryS5OOezIZegMdu5CboUwYdH3eJZnoh1C43UvwJgaqByOGHqfgFFklYw2
FTONart0JO7znEhNVNno/KghLJiRRRGpPeR8y2Tw47aeMosrRCZHvT07/KxHPVsj
Uj0QFMzRKz+XFiJoh7g1Vu2Ya9pmIwJVUC2v93kJsr0cMiZy+PErntVA6w+NZDD5
kkzoxjSlj3pQCkQof1rh+YsvxiqFLIW/RpafPQWZjpk8Fou0HNvvAFdIYYInHwk+
GLxXJ66S2+bKoaU0BMhM6OuMFyLxF6O/1IsfHtkU2UHEi2g3BSC48wLYQQ7lcjqT
buCiuuC8wMc=
=Vm5E
-----END PGP SIGNATURE-----
--=-=-=--
