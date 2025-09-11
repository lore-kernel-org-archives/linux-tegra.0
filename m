Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 638852EAB79
	for <linux-tegra@vger.kernel.org>; Thu, 11 Sep 2025 09:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757583813; cv=none; b=UIRVCE5eeBthEt/hKqo+mTWF62T1+f/xDgFZbCCHCm9fBEkIaPlMg04PRTeiNlY78MGG0uKjMTAT1FxHM30Q3VI4kgpa2eHAMonCeC2FJ4A2NI24crM52y5EBRBiNKl/X/HSdrFtq4ctDE8gislML6PVrBNtm3mdrxN/jZ8htcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757583813; c=relaxed/simple;
	bh=+1ac3GUtdyb/dGqR8+GvO4DnEY81F76aKbH4bVPkyxo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tgRjhLj2Yy9vhuykcEcywVou4HQXIGxPxK/T9Rwqr9UGeMk/D+JZqaDw4TteeK3urNm0flKuPVCvUDLusZGIZfICQcrE5K9uxrvjBP3L/+Mq0ZXlPE3v4mbo/Edaj76C7FFHxamqYk3ADJyttTiWXFaha09x1vqMyyJHJmrjukc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=j76i+kiZ; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="j76i+kiZ"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-45de4ebe79eso675695e9.0
        for <linux-tegra@vger.kernel.org>; Thu, 11 Sep 2025 02:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757583809; x=1758188609; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WiDSDs3vgPK4naVERjozVRDiMqNnwv/gBegchhROC9Y=;
        b=j76i+kiZqzpBC1BNt1rQb88tkfU9lL4LEV+j4nvwx0dwqY/h1resxoc76rMoZLjSTr
         4+UjzIAhgrG6DhbqqUa2S81H9FwE9LiKygc1XJBqHnjMSTc7tYyuAZ73+vtjXcQ0a4I0
         mKgjGB6stbbLUeqtpfolSVAbtc5UaQk4iIYM7QJ+3XkY+cCagOz/1r6Esq1vaH+MKnwO
         nQIjmixfVJy+pDB/a6V18oN6cX5Wn+5Fq/BmPdE4QEdtuUpxpPpJLvFk4q3QtwcUY6QH
         Ys1E+lYAZBxnetraY2WBieWHtiaviM1OMUPkgIOZjG0AgHoeO/w32hWPLc7W9PQ/7DLw
         ftpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757583809; x=1758188609;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WiDSDs3vgPK4naVERjozVRDiMqNnwv/gBegchhROC9Y=;
        b=LQWH2iBKrvvMdJyJqNoGXg3Di9XyZgajFnB37O1n4gqNw+Hwb9keRX0nz4pciuvQTT
         7TczJFZu5P7fkEUVUWJRSAB8p/3ru/TiD2LntF5LsoCpDuySK4VduFQ5UbobS8lV7ZZZ
         SXRYswBN1CzDSWAhUm+WJwR92xN3sHICU9LnO0hmInVDTeBOJvPE4m9smZRLCiNJwFjD
         64MZ9yVMm58r6vgpJgiusP0OwN0lN592qhZmgsjZAook9l4nirJWwefGEiod6+CO1N4n
         BV1Du5ZtKW4FGBKl6pEZpqU3rQx7ZpvmSMUVXBt8fmjnS4CB0uUmxBPgFjvtm8TQom3q
         4sHA==
X-Forwarded-Encrypted: i=1; AJvYcCXkKN2nm/IzQ4r5qPK4tijfTflSPL0SiZNsB9Sn/+TGO9t4kwiMF7tcwZLkSh6ulw77a7N1WTXnJwSMVQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1KgcPnZxfdtd3r97o+ZtgmIFJWgtFOoLJv0EseYIJpFKHB4ct
	IBsTDpZ41c9ZkhME0jxDA1Z8lMVPXwnh+hCod1f5Av35EufuZdB5it9vfi9oIp9V57Gz9vcGEe/
	ZkvuW
X-Gm-Gg: ASbGncsq77eY3Z13YBxygGDA7SZPde8VEPRpdc4gn51ghbZmlqrEU52tjkv7JwyMBwI
	yu1by2CrOzysOjFTspwddq/BUXln2KvfVRVUyV3rk5gskUQM74E/jg6PQb2FZfEEFMoFU18y351
	iA68VOs/2lkHIOGjkKmZtcFbnEqI97RkLhfHSjJ6wnk/IBxj+zkPHxzYdH51qDn8jhSyGTOKABN
	8ImHPCx7s4d7RwKPhpFuifwGqrBq5jNhQIQTFYsfMHho8PwTqgj5DRi2QJfdpB2r0cXIS/4ZKNg
	GHgkLR/o9EG7R9aFGS9diEKOlXYomJMkarNUgp/I8pDOWNA103ETFNMqd13QGyUYJQFmZd77Kff
	aAakrwDGwRUEL/sRZ32a1ykPPms92UR1OUAZ1XVUEkwm76xvU5Q==
X-Google-Smtp-Source: AGHT+IHS9tYhf091OBztmobdfbj5Fdpeq8uN9LnenYjgCcxAwPpUy6aF+2m0BHN5JBLR2HOO67w8WQ==
X-Received: by 2002:a05:600c:430a:b0:45d:e16a:8cf8 with SMTP id 5b1f17b1804b1-45de16a8e06mr53531705e9.8.1757583809243;
        Thu, 11 Sep 2025 02:43:29 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e76078fe3bsm1759218f8f.28.2025.09.11.02.43.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 02:43:28 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 11 Sep 2025 11:43:13 +0200
Subject: [PATCH v2 02/13] memory: tegra124-emc: Do not print error on
 icc_node_create() failure
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250911-memory-tegra-cleanup-v2-2-d08022ff2f85@linaro.org>
References: <20250911-memory-tegra-cleanup-v2-0-d08022ff2f85@linaro.org>
In-Reply-To: <20250911-memory-tegra-cleanup-v2-0-d08022ff2f85@linaro.org>
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
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBowpmyTvZfpYOtMF52dmosD2C8tgzKBSg7E/br1
 JS1uYmsOn2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaMKZsgAKCRDBN2bmhouD
 10SRD/9OA1b8omkL0LsNd9stCmk1V1blJAOrM4xI+7jqN8/hi3wDYMp+m9MFbLP5EseD6eEZgKQ
 eyHqS4ZOfiM1C/MSdE5EyODE7qpSQz/onyYdM/TzbnRBsEmxagb2PiQADiAu+RRfJXGpUX84sKM
 cWeEPkueaFUa2UlhUZzYRYGEJZyb16Y2QkkMWVXw5p7dLJRKcywnyAkeJj89hwW+YNJUef3+Gq1
 5jaueSy63dCk6WxOwSK9MGkF2lrSWVcs6FMyttCe2/rCFnHjav/f4E5+rRi/YsU+pwjJ8B0BPNx
 ww3jACB9E+0l23fkvIZiOiE5VFFq8Ar7ByvKhkvG7EP6hE5VKRNJvYkpiHb4NJCcsQI5b8vM9cY
 ycZkTrxb6C3mAso2HTdV2dvwcD0PfIC6w8A4Y87Zsc3Pc3iqHuak90A+0lIJGgykJGltRMQwfTr
 Xj5hMmw2mpMkqUR8+qbgsZs+etMKqqUcUEJwwG20JdOG6v5k8XNzFtac3la0WUysSDGnKSby5E6
 EG9OdfwT9W6pMqdZ2Ukdb6pbBRyoTqhJV1goiLgJOgBmoDiyQQQtpII1Tpu5eEfS21UnzQCo1w0
 L9rifFeKp2OE0a1S0AjBcp6lNMXQVTAJXPj0Mdmx0by5gKnPCGZkVBU/L/6BOPhADTvr6Vdtecz
 tuBvxkdbSn7bHIA==
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

