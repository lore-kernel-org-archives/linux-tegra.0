Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFE0F1C8FC0
	for <linux-tegra@vger.kernel.org>; Fri,  6 Sep 2024 13:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725627852; cv=none; b=R6kZypYW2wDIRijdZ7z61IIN1WWRxjma5q18YnfgZBDFncSOUgRQyadK7oV2/uU4HXZR6PyGOvuvuyn/a/Om803TGNt2t83ZawRGMSaey71GWkFw2FXmfsa0Nr/SJBIJvi/aC4DPS3Xh6jOT2ca2Tp+b0ay5O/SR8CYmWZUex18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725627852; c=relaxed/simple;
	bh=9q4r7GeARBztYMgW8YPZfHeh6+/n4pzhNMC+IF/+JEo=;
	h=Content-Type:Date:Message-Id:Subject:Cc:From:To:References:
	 In-Reply-To; b=RQRSks/hSumc61TNo2FnqzkoRKljBm3MApTeDGkpzBjEgfF09EwgP7xXNJL+9FISiMh4aA6RNvyHOcXiosiyMP/q1p3/xl4iHMToKAh9NdyRoZ5gmXcBqb93Es9apqbfoxjV3MtQngaKQ3lLiaW6jVjZ3+hMKvggrHqUpNL49MM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sfnufMnQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sfnufMnQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD5D2C4CEC4;
	Fri,  6 Sep 2024 13:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725627852;
	bh=9q4r7GeARBztYMgW8YPZfHeh6+/n4pzhNMC+IF/+JEo=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To:From;
	b=sfnufMnQmwIyiJjXHA6C6TseABlGj7kNjp7UUdmJ+NtWoWnfgbujYLkaYEWBJdYiw
	 HnIz6C/EP4+od55NGgBXDryAzHVDRbgT8EjX1jSMSsqNsQ925atJwkt7cV/g11mEYg
	 Kw6Su5nH0HO3z96ixcovaW+0yottnPYjkjCUVQekoIrB0/oWb6oXgdEs3lj43dc7SV
	 eebV7QlVG5JPP+Q0KBx5JXVZNqKrrEDiWzVrgBmJVjQGTUPDR5Zxbv5K8FyVBQAdD5
	 OEAb0ZEKcV2TWQ/8LxO8Jkl2m716T+L4zIHlZahQy2g770wp/RukunEl3PhwdpE9sz
	 Pl4AXjODiU+kQ==
Content-Type: multipart/signed;
 boundary=331a913f571b4788e835536ac7fa1552f0fc5985d86a5841d6abe4e3b870;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Fri, 06 Sep 2024 15:04:08 +0200
Message-Id: <D3Z80PI18VZB.1ZLQ2TMR10UTG@kernel.org>
Subject: Re: [PATCH] mtd: spi-nor: spansion: Add support for S28HS256T
Cc: <tudor.ambarus@linaro.org>, <pratyush@kernel.org>,
 <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <Bacem.Daassi@infineon.com>, "Takahiro Kuwano"
 <Takahiro.Kuwano@infineon.com>, "linux-tegra@vger.kernel.org"
 <linux-tegra@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Jon Hunter" <jonathanh@nvidia.com>, <tkuw584924@gmail.com>,
 <linux-mtd@lists.infradead.org>
X-Mailer: aerc 0.16.0
References: <20240830030841.24500-1-Takahiro.Kuwano@infineon.com>
 <D3T1W2VQFGNG.14DUML0OSKRH@kernel.org>
 <66c8ebb0-1324-4ad9-9926-8d4eb7e1e63a@nvidia.com>
In-Reply-To: <66c8ebb0-1324-4ad9-9926-8d4eb7e1e63a@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>

--331a913f571b4788e835536ac7fa1552f0fc5985d86a5841d6abe4e3b870
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi Jon,

> Bisect is pointing to this commit and adding the 'name' field does fix
> it. So it would appear the SPI NOR code still wants the name field.

Thanks for the report, could you try the following patch.

-michael

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index d8e551fd2e2a..101ee5b0ddeb 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -3281,7 +3281,8 @@ static const struct flash_info *spi_nor_match_name(st=
ruct spi_nor *nor,

 	for (i =3D 0; i < ARRAY_SIZE(manufacturers); i++) {
 		for (j =3D 0; j < manufacturers[i]->nparts; j++) {
-			if (!strcmp(name, manufacturers[i]->parts[j].name)) {
+			if (manufacturers[i]->parts[j].name &&
+			    !strcmp(name, manufacturers[i]->parts[j].name)) {
 				nor->manufacturer =3D manufacturers[i];
 				return &manufacturers[i]->parts[j];
 			}

--331a913f571b4788e835536ac7fa1552f0fc5985d86a5841d6abe4e3b870
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCZtr9yBIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/jXkQGAqF7F8s01+pkiOdiqaN7nlQHqtu47ZSEa
sDN/9IOwqOTvqSI4hTtBu05bH2ddwpRAAYD68YTxF/O8b5CGnzL/DjHwsuK+XpHY
RQ/gMcD4gUNHzkicu89J6PoAm2m/FYWR7Jc=
=hPT9
-----END PGP SIGNATURE-----

--331a913f571b4788e835536ac7fa1552f0fc5985d86a5841d6abe4e3b870--
