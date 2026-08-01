Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AA883161BF
	for <linux-tegra@vger.kernel.org>; Sat,  1 Aug 2026 23:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785628218; cv=none; b=BC5hF63hLGwPIosibpUEm2wcy7Sii10kyMI+Sbf68kqiraMwDzBe8MO0xRfDOmWZMhlRsLsbj99iBNK/3d7s7XjH+XZi32wWi44rHg53mzzo2V1Inqu0mF7de1nSKvAHpcL2+hsqjyuQ9xshhaYLal/hUCefhWLjikvY32CHCis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785628218; c=relaxed/simple;
	bh=bdMOCer1bcVwv0n3WoG3pcELhcbf1GL7jdCrYJhts6k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AGjOfYJ2oKOGO48P6kG456mJsHmcaHteug/ENrf6Xl8s6yJvFAe8FxRd8rEQN7ib5jwebvZeiX6aYJxjNrcrKzdeqa/lq2vSWMrJCNg79X+jmMxmBmVcdiSHrskAEHdb0fNMDB8BxUV2TJ2WXffDUxqwRicGZOIVvKtU7CWoBx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cM8ZyKiu; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cM8ZyKiu"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-92e512a9a6bso119970385a.2
        for <linux-tegra@vger.kernel.org>; Sat, 01 Aug 2026 16:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785628216; x=1786233016; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9v/DnH51uN08U9qv2qhSV9pzfF1H8nxjCJrgD+qcx2U=;
        b=cM8ZyKiu94wLIkPJuuqqnEmt+cynD3ZmJXaT/oZ16ZYK0WgHnDh3aual8AYZtlnIrK
         VJ6X/iJ8JtHYn3rDJ1mcGU+ReLfcdoIGDi15yjRcRopcmirKmXiEIxw3XUunh7RQM7hM
         Iay6udDKL5VtvJWs3ifALf3CmystOUE8XfvGVjf+NbRZ/xfHb2sPOm3bKCTzOgPPjnu1
         c2K+CoyZ2RmqVAzCIq6t85Y76+askZpp4TP+ytJiTLfBgkNfxGmgSo8jY4VmC7x63gwa
         0gxzZ+mwgSF+SjCYe4wHHdB/mCdH/fheHf7pyoPKrIQ5/gKiSy5GS43ISqK6+mgUmkGQ
         uwgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785628216; x=1786233016;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9v/DnH51uN08U9qv2qhSV9pzfF1H8nxjCJrgD+qcx2U=;
        b=p0+bOFhXSHpNXRpjWb1hjFR1w1+v1JgPHOtcu+Gr6kCmWT8mv04jng1GsxR1n8I/Hz
         OYo7l3AOhMxnQztPxR3wN2Z0ysik69R8SCIP1ETmL3LNYOOjAEYSxZ4q5UcWHr3sTEj6
         DPfeVuDNgKm7kaw5PpN5pd0yyploINw1YYUpk5+KaO3Fe9RdcAed6r/B0JwQfLNLbdMw
         G0foFMx6xK+maBg8XYIJ6IjpKBKbyTGBHoBeZ2Ld/oRBy+ZiyCuULH3AyazpD13iLR7I
         T/9reE/kQo/ibx/oObazg5xXnWfj+XRO7zUrr7Qj30PY6PNcFnSqXo+2cpYIfj0y0LgP
         V5ug==
X-Forwarded-Encrypted: i=1; AHgh+RoE9UG8PhCfokSAvhXQYbg9gsjoGuqwSExWgqz21TwtHyXsVMHAUUmD09yyNgzlV5Qe1W0LYV6ZvFuIOQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxm6S7K6ZDEeMHA1/IR0n4Tqd03m6yqsNR++mpy0S0ausDZF2sI
	GDPoQVFCNgHF5NKIffP1qBdF4GR/vSXETrmTLIjJ6DuSw14ipD+G3z6I
X-Gm-Gg: AR+sD11ox/bUvWbJZGeeHBH4D+gy20fFZR49gvEsxlQPYkXs/j0YHqnLN6OJEJnev7M
	pdr5VxbKUghHEfnXcj2vk8WN8+61lz4I3DjNbYViHyPYILozl/5mqGOGIS+K1qgRRwM9kKv8ylg
	wTPO+oCn+t7bpyDH1iTYIpqiPORY+PntT66qTRp3x/m4eBtvmbM9IbXrRzABnbQVTRIlFnYXJiN
	uBUSGdSBgtQoNU5XnCPIbz6vrxFFLgDeb8KIg0GOArUaK6NlGRQjHTnboj2gkTXj4/yNglRcOd3
	TmFGfGGGyFC7kodT1IKKK9L/sM6XUYQcOvHQJ9vguzKywcY59q9Gk4AFYZfn4J/RllHrCTN3RJf
	MeG4mRuPGVs673rK1W0Q3q5r9J5rRjQcKdsSDTRleHAch1h6NVckqGageuHWKwbu+PzDVfiL38c
	k7C054hCjcVEVp2IFlAnPX0GY/ZCyjDNdySVhnXjVYTsIxG92cJOmPD6QifaKmcG/vOK5n0vVYg
	6VOGXoKsI//gFlGfHyzPPosRlrg4FTbzw6Gl2ztgEYl/tmLw+6s7/vwEwmrmoY=
X-Received: by 2002:a05:6214:48e:b0:8e8:199b:aad0 with SMTP id 6a1803df08f44-90849553e0emr119082946d6.7.1785628216114;
        Sat, 01 Aug 2026 16:50:16 -0700 (PDT)
Received: from i4-gl-tmk5904.ad.psu.edu ([130.203.156.186])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-908432a16b0sm42515566d6.5.2026.08.01.16.50.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 16:50:15 -0700 (PDT)
From: Yuho Choi <dbgh9129@gmail.com>
To: thierry.reding@kernel.org
Cc: jonathanh@nvidia.com,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yuho Choi <dbgh9129@gmail.com>
Subject: [PATCH v1] soc/tegra: flowctrl: Release OF node reference on error
Date: Sat,  1 Aug 2026 19:50:08 -0400
Message-ID: <20260801235008.475176-1-dbgh9129@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

tegra_flowctrl_init() obtains a reference from
of_find_matching_node() and currently releases it only after
of_address_to_resource() succeeds.

Release the reference before checking the resource conversion result so
the error path is balanced as well.

Fixes: 1fd09e5d884a ("soc/tegra: Add initial flowctrl support for Tegra132/210")
Signed-off-by: Yuho Choi <dbgh9129@gmail.com>
---
 drivers/soc/tegra/flowctrl.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/tegra/flowctrl.c b/drivers/soc/tegra/flowctrl.c
index 221202db3313..55e20355a470 100644
--- a/drivers/soc/tegra/flowctrl.c
+++ b/drivers/soc/tegra/flowctrl.c
@@ -195,11 +195,13 @@ static int __init tegra_flowctrl_init(void)
 
 	np = of_find_matching_node(NULL, tegra_flowctrl_match);
 	if (np) {
-		if (of_address_to_resource(np, 0, &res) < 0) {
+		int err = of_address_to_resource(np, 0, &res);
+		of_node_put(np);
+
+		if (err < 0) {
 			pr_err("failed to get flowctrl register\n");
 			return -ENXIO;
 		}
-		of_node_put(np);
 	} else if (IS_ENABLED(CONFIG_ARM)) {
 		/*
 		 * Hardcoded fallback for 32-bit Tegra
-- 
2.43.0

