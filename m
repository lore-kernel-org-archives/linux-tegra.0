Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01BB930597D
	for <linux-tegra@vger.kernel.org>; Wed, 10 Sep 2025 10:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757501058; cv=none; b=G2HRy3q4LlPHyTZ0h6RGWS4Kzx42e81UzYwhwYgMRFAD2teMifnzut5XO5v57GncKBv9lht77SRJpsHTkBwCYcYqxgMlJ18yAvw26UOfN5CEhP4n9vWr8/BWt3oalu7kXd12yfSexWUQjeRtrg1ou9cs4w5FFwPpsQ2hpuvYyO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757501058; c=relaxed/simple;
	bh=+1ac3GUtdyb/dGqR8+GvO4DnEY81F76aKbH4bVPkyxo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=i6Mrew9JTJAQ+cb/ylZeTm+K5UFLbVUWX6HJNI+vCLxl9uDzicTpQIZjKCIjunJTGgX4jx3BEHKvd2opbuguetMOksJkX2r0IoPLngoxx0Gq0UabJXTYMpSPZT8qqdJwXma0NZ5bIknjnjdBhwoJYdSgyzah4P25rfSDG92MNqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=F3Z3ITp5; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="F3Z3ITp5"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-629f06935e6so684376a12.1
        for <linux-tegra@vger.kernel.org>; Wed, 10 Sep 2025 03:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757501055; x=1758105855; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WiDSDs3vgPK4naVERjozVRDiMqNnwv/gBegchhROC9Y=;
        b=F3Z3ITp5JZuSkEq1hregftRiGURgb+i4NQhT215aY/RdSZecDspVhQfF73cMPU/F6Y
         r1+WsKX9UtMWN07ZKUnpoUP96ev+sWhnLUmamBQ17lDyhVd8tEIfC7Wriaa9BTuiPNNv
         7xkP6m0TuXhPv4zy4T1sF7DyzhCB8T3+1SzwjS0QooCBCgsWkz4Zi8dNhzheRoMt5Ydc
         5ljTD0fFWIHgBnxbvry/zOXAM0VWzCWgJCU5/CmUknRurpinT1/sGGjTQQwVUnqb78xP
         LfFIkbGaidRDes7nsJYaGQnwXOl38xQgkFX7+JQCBo3XFE3tP0zSVk9eLr4PW71hzRwg
         dIRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757501055; x=1758105855;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WiDSDs3vgPK4naVERjozVRDiMqNnwv/gBegchhROC9Y=;
        b=tgvmfbatZ9UsqFGXRVrsfRlp462aN/zsWV75/Vs7LVdPs7EkTf0yCzvO8SOSMaLGAr
         PCTTsUxH18ZojGDIs5psWOmf5kzhrE9BSvfrrNIbucUjT4fZQhgk/Qp7m+iwlo8SEddr
         pWe7qFPQ8v9E+3Az2Gvtba7GdyJyt5tOd/+YL8VB5DImh8e55xkjOvF+hd5T1thSnNz0
         Z07x9OCBS+Y1F5PBE3jXBYrcdEZqLITZqjyPKHYuOpk7BIjcCjHEK4CU1PGJc3ywFlXi
         VEhDMzyfzeCPpWoe4TZ86TPieQo8n95/SkoTjdpGRLv59YfI+w0KZTFQ2u8/jCTQNN7Q
         K8Zg==
X-Forwarded-Encrypted: i=1; AJvYcCW2EK26coD3yx0h08JPrT67o1YB0sGADi8MZnjDLgAot7BiDW8ulX9JAitaUDjrOnGPr1cvsiZId+POrw==@vger.kernel.org
X-Gm-Message-State: AOJu0YygX0JGMLIdRjnh939iy2JhClPjl30WIoHaQcSccBbAl9sruiwR
	iZfJmT3HUwLpGuOzO5K6mBBZtic0QSJXqMN1GIE+zgwtlBDbFvrQ8O4DidtyhD3HK+0=
X-Gm-Gg: ASbGncsHKS0rpXuLnbHhyJMhgddrhUkHllnna5c7nrUv0ReEZI5uRuFarsy/7TKRUlW
	x9hb2ZmfRe9oMpkcgtFlGuuArpLwhcn1PTtTSuAJMR5UOJkazGVmIZCDo/Z92FXH1KneJYobZyV
	WleGRlk9ptCH6/Cw8AxARBTtuH2gOnohS9G4z83PryfRRYZ6Z+zT/AJ8nYIceWSQeNkOR5Wjph+
	0SszacLVHPFy8o8HhbS7Ew5wtLr6wr6Za87PzPaI43jB6OGVKz3U8p567s+JFi6Jw7TOHmvBtBS
	IOPV2NB4QH7RQ9P0y7Ad8DALHUdkKaXilK/SKiL5LefYJ44REGyDzXuK6sSaILtevqe1ipem9K2
	8S5SJkafk4ODEyC5BtdkabP0vGwERcDcaqHoTmKY=
X-Google-Smtp-Source: AGHT+IHdm9CW5J37x7w4w6YiBADoTpSU61DocOxKYkYVYgBvdU9khcBxjYJ/0bHx7R0zRRKmXU54zg==
X-Received: by 2002:a05:6402:26cf:b0:62c:af05:5814 with SMTP id 4fb4d7f45d1cf-62caf055e34mr1668538a12.1.1757501055395;
        Wed, 10 Sep 2025 03:44:15 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-62c01ae5f75sm3144890a12.46.2025.09.10.03.44.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 03:44:14 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 10 Sep 2025 12:43:58 +0200
Subject: [PATCH 02/13] memory: tegra124-emc: Do not print error on
 icc_node_create() failure
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250910-memory-tegra-cleanup-v1-2-023c33a2d997@linaro.org>
References: <20250910-memory-tegra-cleanup-v1-0-023c33a2d997@linaro.org>
In-Reply-To: <20250910-memory-tegra-cleanup-v1-0-023c33a2d997@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, 
 Aaron Kling <webgeek1234@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1227;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=+1ac3GUtdyb/dGqR8+GvO4DnEY81F76aKbH4bVPkyxo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBowVZwT3CDVMrlONPdbY6jb2lou5Qzq4s0WqSSA
 WTLLi9mfjaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaMFWcAAKCRDBN2bmhouD
 1z/4D/4wQDr9ImbS8nVtZoels+VrzmHSn2Rn7SqdrZma6/9cna4iaQBKEW0PVotkmNWHCgYVKwW
 MX1q3lgo/unq1+XXRIT8MDmbPaAtibG/hi9O6ymO1DDp8GzRtI8E6/Aeh6mlpPeyj+H6YwwpeUj
 Y7spFWZ0fXFjor0fFwCOQ7ciKRAi0RC/z0NoLSeSNp+6NydPNilliS+nmF1zY1PeZTmUGsWOaOZ
 yqYgGrc6koHC+ghjcmp/dakCHy1tdwKJq3TXZfJiIad8rBzGOa4xgTFXsQ6+m7LHht5v4d7uBu2
 QK8n5EfObDLKxZq2oVIXfc8sucLyG4zUDH9F2ndJpBucEfWEn+j0/LGZPuOlTGuH/IByquDSqy9
 5qHvgM3KzFqY70NM+Fe1GWIeojMVYoQqRnYQtKjazEVRiQvRI7iAx2YFDGZHwcRDvRjNKG1ClRA
 MR51FfRSr6kMy2hvYvmlep6vAuTlpRZxWyBw7wh53/ZyGyBc3R2uWiXWb9a4RibASr5kgluA3hE
 wEWyh5rllJglMLCVnJTbGtB/m8wESG+hqDmIyZowUjoyd11d1CFBU1bQTyVNTse2AIjee4R09uS
 eqjNXx9fuvaoeMf8XRxvkTw3h52aXz/dGyfVDCAE8fr48zzl9lH31dhZNXt3NHQZdh69aqVw8tZ
 goBtZtGU27TngFw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

icc_node_create() is alloc-like function, so no need to print error
messages on its failure.  Dropping one label makes the code a bit
simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/memory/tegra/tegra124-emc.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/memory/tegra/tegra124-emc.c b/drivers/memory/tegra/tegra124-emc.c
index 9aad02901613f1b2ed855c11bcd76fef153034af..f3372bd78ce8db666015a7844cba4e6aad79e61c 100644
--- a/drivers/memory/tegra/tegra124-emc.c
+++ b/drivers/memory/tegra/tegra124-emc.c
@@ -1350,10 +1350,8 @@ static int tegra_emc_interconnect_init(struct tegra_emc *emc)
 
 	/* create External Memory Controller node */
 	node = icc_node_create(TEGRA_ICC_EMC);
-	if (IS_ERR(node)) {
-		err = PTR_ERR(node);
-		goto err_msg;
-	}
+	if (IS_ERR(node))
+		return PTR_ERR(node);
 
 	node->name = "External Memory Controller";
 	icc_node_add(node, &emc->provider);
@@ -1381,7 +1379,6 @@ static int tegra_emc_interconnect_init(struct tegra_emc *emc)
 
 remove_nodes:
 	icc_nodes_remove(&emc->provider);
-err_msg:
 	dev_err(emc->dev, "failed to initialize ICC: %d\n", err);
 
 	return err;

-- 
2.48.1

