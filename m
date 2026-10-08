Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C3B236E48C;
	Thu,  8 Oct 2026 18:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791484462; cv=none; b=EBCWP2NA3ynzm56/y5jL0Te9NcIKxLHn8Gu25xsWukOr9TcC8kM1IDbIzogy3BM3qCrK9pQObn/qO4eo3MqywxC6c1jAt32zwskIwZzAX4UjyT7dty7HfexpKkmeUrf0Tolnqfr2oOgmRYuRDp2NBsbeBaDn4NqXJCkbjZ7+ggo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791484462; c=relaxed/simple;
	bh=dxKVQUB9bdHDqGSst6T7C+ohmcyWVEOehoYedx/8b9E=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=sm3FQlkmvnwEQpC1apnDwlzKKu8C+aH2P3SuxAgyUDT+twSOY6iEsqaBcLWWQ80T3s8AvQoODzfpNFghMTocvCubbh/3/47breqME5MQMa6kV/+IirbChMgrd3z1952rhTsMnM30ljtpcEYgTnG7m/fzq78dPhc1phZZScNqPEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VEvTuXRF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VEvTuXRF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40AB11F000FF;
	Thu,  8 Oct 2026 18:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791484460;
	bh=MDUs9CCOTYQKi4Eoui479ft8V8PVNTf33myUL0Knxxk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VEvTuXRFJbKXsdv51vxBwVb0nprNMat/salfxgcr7toLVUb9Od0ASyvpDvL45aHJ+
	 3rCMbJp6/l57wb6kF8KCrM4KsiIfXxmB+YrlsHcBuEw6aUmLXSQdIe0b4U534tcMSI
	 xeGv0X2M91DLoia2EbymifHf3zCPrjtDaxu33sQoGL5UsoOEVtdx0TZ8MtqY7yGV0I
	 dmqi2qqP0r7OUWJZ6ZHUQmHhGgP6yzPu8SdY1sfm9TJiasx/yrnix7zKVh+pDgLedB
	 K48Y/HawxCwjRkkCxXPF1gl12nPyZjuAxMrGmOwDxGTCMRSZQSL11dSGu4HTMU8OpA
	 YyoW430POzRnQ==
Message-ID: <sashiko-outbox-164461@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] mtd: rawnand: tegra: fix OF node leak in
 tegra_nand_chips_init()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Thierry Reding" <thierry.reding@kernel.org>, "Vignesh Raghavendra" <vigneshr@ti.com>, "Haotian
 Zhang" <vulab@iscas.ac.cn>, "Richard Weinberger" <richard@nod.at>, "Stefan
 Agner" <stefan@agner.ch>, "Miquel Raynal" <miquel.raynal@bootlin.com>, "Lucas
 Stach" <dev@lynxeye.de>, "Jonathan Hunter" <jonathanh@nvidia.com>, "Dmitry
 Osipenko" <digetx@gmail.com>, "Boris Brezillon" <bbrezillon@kernel.org>
Cc: linux-tegra@vger.kernel.org, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261008182442.2770036-1-vulab@iscas.ac.cn>
References: <20261008182442.2770036-1-vulab@iscas.ac.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 08 Oct 2026 18:34:19 +0000
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] mtd: rawnand: tegra: UAF due to premature of_node_put() before reg=
istration
--

commit 1cf3654f6b317262348cbad1bbf461282840058e
Author: Haotian Zhang <vulab@iscas.ac.cn>

mtd: rawnand: tegra: fix OF node leak in tegra_nand_chips_init()

This commit attempts to fix a device node leak by releasing np_nand right
after calling nand_set_flash_node().

> diff --git a/drivers/mtd/nand/raw/tegra_nand.c b/drivers/mtd/nand/raw/teg=
ra_nand.c
> --- a/drivers/mtd/nand/raw/tegra_nand.c
> +++ b/drivers/mtd/nand/raw/tegra_nand.c
[ ... ]
> @@ -1119,6 +1122,7 @@ static int tegra_nand_chips_init(struct device *dev,
>  	mtd->owner =3D THIS_MODULE;
> =20
>  	nand_set_flash_node(chip, np_nand);
> +	of_node_put(np_nand);

[Severity: High]
Does this introduce a use-after-free risk for the device node?

The nand_set_flash_node() helper stores the pointer in mtd->dev.of_node
but does not increment its reference count. By dropping the reference here,
could the node be freed before subsequent accesses?

Later in this function, nand_scan() dereferences this flash node to read=20
properties:

drivers/mtd/nand/raw/nand_base.c:of_get_nand_bus_width() {
    struct device_node *dn =3D nand_get_flash_node(chip);
    ...
    ret =3D of_property_read_u32(dn, "nand-bus-width", &val);
    ...
}

Furthermore, mtd_device_register() will also access the node to increment
its refcount:

drivers/mtd/mtdcore.c:add_mtd_device() {
    ...
    mtd_check_of_node(mtd);
    of_node_get(mtd_get_of_node(mtd));
    ...
}

If dynamic DT unloading drops the final reference before
mtd_device_register() completes, it appears these later calls might access
freed memory.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261008182442.2770=
036-1-vulab@iscas.ac.cn?part=3D1
