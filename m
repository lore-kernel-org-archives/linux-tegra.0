Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794364784;
	b=4hwpSojcFfFCoOW+8phntbvwxYbHv3GwQpjlrE1vrH6lgm66lc2ZnBtaszEF9ygFJcda
	 i7XbjL5NvnWH2gKsrATn42+WCpuyJtc9U5sE3I+DyOd+yNMTWWdzwvHOOAH7WI7TClyrK
	 j6e+bdVm31iH4Nz5N48oEOOJbc5jSB1cFXsv/fMG3ZUuEOvBSo2RkkYJGg1rrsNm5pKDw
	 Od1Vlyf1R1YeV4dCbWQzHdHRmQJgte3ZbUBLIZJbU6brCEXfOEmrU5dZnQQV4jwNUaiAB
	 +Dm6BmcCRwunLqJYLy1R/ypu6rjz/mRYNY/yhbamd6AP0ppZw7TZWL/U4OPtWx8dEFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794364784;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=yWgatv2qYfrMiUj+V1Eg5nb2TyQSEHAlAGM5NfT6vts=;
	b=hbSVNZ1zGoJYYUeAZ3BCy8VOCD5H2rUvAK3itLLLdJxe94QYDT2otwgqSbAYSCy6bUeq
	 HyGGEYy04mBzzRyCwwIu53zFoA+274hbOfIq+O30ooKmRJERYsgH2LUmVqunCsiZ6OZTv
	 xx9gCjTDG5TRE0mJDtaCkd5mBdpHdBVaMJNN5B9m8aPgcvXTKzqFgBmlQBKOVpDvL6omo
	 7bQJ19W1yQY/ZZmRAhunb1G/rETIoEbLvgVhVKF4oeF/+ck0kwR+Qv8Ry6xdT25bllWjn
	 zPs8ky2c+8genQML6y+upTuu7MfikYMAknIE+8VT1GrD+escfVV1ZDJ8cNZj1UxI/aw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Hqcs/u2r";
	arc=none smtp.remote-ip=209.85.210.177
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF761606A321
	for <linux-tegra@vger.kernel.org>; Wed, 11 Nov 2026 02:39:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF761606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Hqcs/u2r
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8b66d1a08ccso2364857b3a.1
        for <linux-tegra@vger.kernel.org>; Tue, 10 Nov 2026 18:39:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794364783; x=1794969583; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yWgatv2qYfrMiUj+V1Eg5nb2TyQSEHAlAGM5NfT6vts=;
        b=Hqcs/u2ra8lREdfSNyYvzfvusNIjK8yDCTNavHbuglAZMtxeAqPdHp41OpaHKumytM
         M0KodzULDGxmfa9IGX2fa/FIa5AE11/kxw5WARdSM3UARuoV6IWAUMY0bb/MI8V9nufJ
         mc0yt9tm8Vk8RUcJemGFiA9ucqcdIjvVSwvjn4dmP4YB14kJyIi9FUK3V700VI5lcN17
         2p226IILmpoUFnJl9jYOs75bXKgVA3ODQFQwF96zDGyjyJfbo8QjZ3An9Fw2hDgnIEip
         lCQByrwBrW45791C6Ts/4MEMtXOKLtZRovWFyvfMkT5vTe8A2sl401QZXJ7leMneeEFJ
         bQ3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794364783; x=1794969583;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yWgatv2qYfrMiUj+V1Eg5nb2TyQSEHAlAGM5NfT6vts=;
        b=LJ1GJp7dE2afpdWSfpSP9L+A8xClkMzXt9AMrpSPc1snLCLhg0qCSryCP74/vnCcTF
         USgK80nqzbo1DEfFJje8NVNoedzY0qLs28GVxmDxRi8gn46kOs03mdx7aeM0DsFzgOjx
         8E2puYiLgfTOARCL0xaJTwUzSviFDofiFO1vEnp/4nJbsGCzUU/3bsczKewDY9P8F5+I
         tS/R8iTUXDjjX1Ok2nSfnEQXknUI28GAGduKqKRMmbi9KSZT5st2J8qe/QQtjM+5JfPQ
         QiFU0qCj3EerDVT9UlBbhjKo0x+J0oLvPW5rX0mO4Tv3vOJemdh8UZeKlX6LjPW5nxus
         o+Mg==
X-Forwarded-Encrypted: i=1; AL+hErEEMAOVoW8RtGclExRX1YrIWRgbSVG9y+vZYNkWs67I/EAwvPWlsMHZjJqrt88kWh8Jsu7B0hZ2Zvfzrg==@vger.kernel.org
X-Gm-Message-State: APuU4Z+w91TP6gn2Pyqc5fB1jvYyskaAZaYxwvZ1Rb3YRLXpNRrPrM8T
	yTfxxg9lKOUcg4EZYSvdS6oJYzRS81v4Sjr5M4daiB/7EjXwTJJgBlMs
X-Gm-Gg: AYBFou1sfmyA5+litthdG/F2TUoVwk8xwncFfIrCyEH+MRFnyoVh3qxE8VUnFvEyzgZ
	7jnhd5ZMEp3+6w9zaBNun0Z723+CoRzOJ7GmSf6wWVjCAc6y5f5XzRQkjIFCoSjaAKZTLZaiG6N
	va7vS5twnN1M3JB1QefA5qeY56t1Sui1Xc9n9oviy+PPe8Xd1/kctaB8NWm5CaJ02UgLMt3JLKy
	6AvvRgv0plKzs5DoNGUwytl1cslWvpQmypTU73mL8oeVs9Hfp/rYPV4F+QPwC1Licq0poUmC1hB
	Di5VoHSbCZqEhKZrZHN4MAS+nkA0h9iroSKVGSW9DryctbdbgS9tD3KzUv/jZCKNbFukpV9pId6
	ZO7Mc8Gi16C8eacfqfwgtgXHH4JRtEtKsVP+ZNaOkOCjtcjiRPfuBvo3tTiHRNlb8lHzayR67m1
	BJUhavDh81etvivmoGvp9LU9qUAjb396+9OzZdr6SxB43WF4ucQXnWelXsfFlPimqwu6caWqWWy
	e1cTt8HSILknvPPkiSC8DgweexU4JpTaTq5Zc4/xyQlCCopMG89n4XpsolO853izaCR7n6dUx6b
	V/2qzqIYQEZ7+qwUibJfB64pwYYs/0RpATPSkyEY60By/z5b9EfWCWgcNWMD4BbvxrYrEx5AEoL
	/8lH6WhleY0vnMMwvaE8SAHxf1MF6sA4p0s8H4Spxu2PfcpmXEadB8K+uPqjFRnKilYTxSYC7d5
	ZPtsNDbTbMEwnMEfF1kr2nDq4=
X-Received: by 2002:a05:6a00:4c15:b0:880:b709:cefb with SMTP id d2e1a72fcca58-8bc1d3324ecmr1077159b3a.45.1794364783094;
        Tue, 10 Nov 2026 18:39:43 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baa7de3a55sm1488097b3a.3.2026.11.10.18.39.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 18:39:42 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-ide@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCHv3] ata: ahci_tegra: use devm_kzalloc_flex()
Date: Tue, 10 Nov 2026 18:39:39 -0800
Message-ID: <20261111023939.75386-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Combine allocations into one by using a flexible array member.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v3: use devm_kzalloc_flex()
 v2: Rebase
 drivers/ata/ahci_tegra.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/ata/ahci_tegra.c b/drivers/ata/ahci_tegra.c
index 2b9b98643128..c6ec344c2e6c 100644
--- a/drivers/ata/ahci_tegra.c
+++ b/drivers/ata/ahci_tegra.c
@@ -176,8 +176,9 @@ struct tegra_ahci_priv {
 	/* Needs special handling, cannot use ahci_platform */
 	struct clk		   *sata_clk;
 	struct tegra_pmc	   *pmc;
-	struct regulator_bulk_data *supplies;
 	const struct tegra_ahci_soc *soc;
+	/* this must be the last member */
+	struct regulator_bulk_data supplies[];
 };
 
 static void tegra_ahci_handle_quirks(struct ahci_host_priv *hpriv)
@@ -514,6 +515,7 @@ static const struct scsi_host_template ahci_platform_sht = {
 
 static int tegra_ahci_probe(struct platform_device *pdev)
 {
+	const struct tegra_ahci_soc *soc;
 	struct ahci_host_priv *hpriv;
 	struct tegra_ahci_priv *tegra;
 	struct resource *res;
@@ -523,14 +525,15 @@ static int tegra_ahci_probe(struct platform_device *pdev)
 	if (IS_ERR(hpriv))
 		return PTR_ERR(hpriv);
 
-	tegra = devm_kzalloc_obj(&pdev->dev, *tegra);
+	soc = of_device_get_match_data(&pdev->dev);
+	tegra = devm_kzalloc_flex(&pdev->dev, *tegra, supplies, soc->num_supplies);
 	if (!tegra)
 		return -ENOMEM;
 
 	hpriv->plat_data = tegra;
 
 	tegra->pdev = pdev;
-	tegra->soc = of_device_get_match_data(&pdev->dev);
+	tegra->soc = soc;
 
 	tegra->sata_regs = devm_platform_ioremap_resource(pdev, 1);
 	if (IS_ERR(tegra->sata_regs))
@@ -578,11 +581,6 @@ static int tegra_ahci_probe(struct platform_device *pdev)
 		return dev_err_probe(&pdev->dev, PTR_ERR(tegra->pmc),
 				     "failed to get PMC\n");
 
-	tegra->supplies = devm_kzalloc_objs(&pdev->dev, *tegra->supplies,
-					    tegra->soc->num_supplies);
-	if (!tegra->supplies)
-		return -ENOMEM;
-
 	regulator_bulk_set_supply_names(tegra->supplies,
 					tegra->soc->supply_names,
 					tegra->soc->num_supplies);
-- 
2.56.0

