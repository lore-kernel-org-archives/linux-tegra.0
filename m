Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D85F1B85C0
	for <linux-tegra@vger.kernel.org>; Sat,  4 Jan 2025 14:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736000078; cv=none; b=fOMR8gtW8NPqkJ6u09YuZ4KV9ghGxsk+bJAyM4jInHUdV7HK4mCh9KoqTqpHDiG+lNQ4Rzg+lh/Vsbbm9FOl0qPCYBiGO8N+ND5L9VQGl/mCnbsjEaCEfI7dVq9uJgTXZORx9q9cIxyDyvqYSIlqxmUvY3l12zLjOskys/EEsE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736000078; c=relaxed/simple;
	bh=i8bnxcerM5jTOQq9tgPtD8jdS78JSC3ymp9fz7MJxO0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=A1qfzqHHN65gMh6r6dV3hN/3QFFtGzTo+z3AeVc6d/9j4uKQKCj7aZtVCYoOi401zKR5Iif7CVN6qaOzYKhUjhfbaHVTjljftC5Z2YvEzveuL3Hpkg8EjtcC4O2yobvfIXCm5irOniEXJ/orjTzdUhT6iDinDs3AMpEaGhmSFpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZRrH247t; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZRrH247t"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43616c12d72so21200355e9.2
        for <linux-tegra@vger.kernel.org>; Sat, 04 Jan 2025 06:14:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736000074; x=1736604874; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NAS0zHngx5LNnWHW9jDNMcOJDZmzIAjDDo//KjV8/wY=;
        b=ZRrH247t/pmkDJRmB2JpkARCD0+Q/OzSnFbCaS5SjyHbrrKOU0+j0Vg41+FPxqrlJx
         xV85OfrIk2jr5Yc1Xtriivzakb++UUjAyq7JO1fG1l/EVyZeadOZ8zUwQhjRBopejMQj
         wrkPfX9m8GnbiWhkECGgc6VwHBV4G5XopaGFb4wDQ4g6EihU3ac/24PwuISV3W3gtPEz
         ukDNjDChDsL1yDobksccHJPSsq1jIOoOwoTqIKf+OV4Ha5buaX0q3OT4ExIMeDJyTa+/
         hC9UHgKKLOmDW0lud8mtMuz0hQkhKKwMvKRrJl5b2Oo2o+X7SNCqRR+MShrdJI5thvSV
         ZWVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736000074; x=1736604874;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NAS0zHngx5LNnWHW9jDNMcOJDZmzIAjDDo//KjV8/wY=;
        b=Qo4HaB+YVvG8aT6Kg6nm7MshstXsIUJfFJ0hF02kccQamYRqidjASAeDs2Waz7chqP
         MI5vnb/PuFSbticx4Pz3qjkQI/Zateagq03iZguJoMqpR+fwS7B2U4NdFjVRouqn3d4z
         lCJyFGPecxnm2K4Bx9bD6oKGfQfI5I9toIZ9tcMtmctaJ8oXbtH9x8wjSWTGNXeCyw9Q
         WOp03vI6RAOBO6ESZvw9wr2wx/T3IHsuxtxM4bz3DsWftDoi5Kl/EMSiuRX+kzFMJsZp
         tHpkEQvw7wS/vgTY/6MPb/qxjVM2fzXfB2PGzSHkVLd/ZXRBuyJIB865bVJp+TSoCtVb
         C1mA==
X-Forwarded-Encrypted: i=1; AJvYcCUeJN1mogVxcGcqocT96bH32GCLq7pCMOE0SYzTEJtL27ph0Q/r+Fue1/CtIaV5TCqOmtwMVcSfWDjhfA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwYNQxZ+vHrTyG1PpQ3yDwHvf+4rQ8REbe5RUZxpKv5pBf+iBHx
	MKRzPZN3R3gRdSsIu5GQofu8kSl9Cv0XdMFTChJJKsDVlom6SNIhPQfrvJQ1dBc=
X-Gm-Gg: ASbGncu1ryR1Rs/oBnYMXxAvmGQFPqn2B1VFdmtLcc9maZ3HayD71C8PwH+cQRRS6bT
	UZjxTovXMdt8AXl5oCqfnKCu2/o5jD/JShv9JD/O4Ux4l38u9aIS9KZBvJELazZkE8+P/863Vbk
	9kdDd5Gqb9tTRdeAHD/viw0S6V5HIhgwiXBbXEVFGT2ogfmSuiHfqcONfmeADXVH5VHseXaDszb
	q+TQoqoSnFLfR808nitG+hXxIexwkcQN199e5VCPkKnvDhtEP+Pc36YaFXE2o3zXAPLtZk=
X-Google-Smtp-Source: AGHT+IGDD1lbzRhJpt66gSp3AbzWs+7yye6arMKqoGbFiIjvhXGsAkAae8MMEYvsNAYfM4Ob+xdT7w==
X-Received: by 2002:a5d:6487:0:b0:386:1cd3:8a06 with SMTP id ffacd0b85a97d-38a22206907mr18279273f8f.9.1736000074339;
        Sat, 04 Jan 2025 06:14:34 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c84840asm43173413f8f.61.2025.01.04.06.14.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jan 2025 06:14:33 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] memory: tegra20-emc: Drop redundant platform_get_irq() error printk
Date: Sat,  4 Jan 2025 15:14:30 +0100
Message-ID: <20250104141430.115031-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

platform_get_irq() already prints error message, so duplicating it is
redundant.  The message about "need of updating DT" makes no sense,
because this code was there since beginning.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/memory/tegra/tegra20-emc.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/memory/tegra/tegra20-emc.c b/drivers/memory/tegra/tegra20-emc.c
index 7193f848d17e..ed094cc3c108 100644
--- a/drivers/memory/tegra/tegra20-emc.c
+++ b/drivers/memory/tegra/tegra20-emc.c
@@ -1191,10 +1191,8 @@ static int tegra_emc_probe(struct platform_device *pdev)
 	int irq, err;
 
 	irq = platform_get_irq(pdev, 0);
-	if (irq < 0) {
-		dev_err(&pdev->dev, "please update your device tree\n");
+	if (irq < 0)
 		return irq;
-	}
 
 	emc = devm_kzalloc(&pdev->dev, sizeof(*emc), GFP_KERNEL);
 	if (!emc)
-- 
2.43.0

