Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 666542EB5CD
	for <linux-tegra@vger.kernel.org>; Thu, 11 Sep 2025 09:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757583814; cv=none; b=i4QN4eJfiOuWwHJUjPIG95Ek1qw3ywGXcNsZEhyUno2bKatvQtRG6mIQuVM5sPcrgN2UFBbN6+abL/MNOGQ3gv3LdLX9aUZmjNxpbEZ//z31KZlkLebSINU1SH8easp40km2JJPXjBRY9ZKHuPBZhWDyStc2DRzuHr0tJuBwTck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757583814; c=relaxed/simple;
	bh=oEubvqZI2n3V9FuebymqRYT9aJaRR3Y7ftHMN9o4xTM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cOpi8ZZIGNxsID1OZu1AFpw8JWPYkwEWRVRgn9c2n/03k379hxsxe89qa8xau7SR953yGGkriLZD4m49wmbk+Q+gaiJ4oJi2AAw66mxgCnbghbgzXibAjUo0XQOcbDnCs0WxlovfD5UbQVz+bVvTu8gMJs/wzrjUd8YKzge5c6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ikz42SOw; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ikz42SOw"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-45dd505ae02so705425e9.1
        for <linux-tegra@vger.kernel.org>; Thu, 11 Sep 2025 02:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757583810; x=1758188610; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=65ye4XkCH8izeRtH/tdAUKF+n65DyQp+SjhteFd0SJM=;
        b=ikz42SOwIIQC0yKbQwWgdrEEcrUcebhQxXPHiEB4EXPkxd4y6hOg6RYZSp/pwWx7OP
         HXQ/bHEJzm3WZxRGxCThKeXLKa6peURjYDUtVBECBTPRj60866bIAhsnOpG3iOd1yHJj
         HyEkHjqzcHOuJ4kI/HKrg9N/D2pevHbrde+cjrvEEdwm6feiXIjKskMMJlQA/8mVgtEM
         gzM5nT215A3D49Of4Jp2CWhe0xK2Q+ksBNuz+9YBBWmaTZikWvL9R82s0NPkc/4Ztoal
         ZW8mUSOXtmUlUTlY4Bt+iJp/W8DiZiRcufUqwB1yfnYpC786I/bJCoMpQyvywaNvzJ5j
         u//Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757583810; x=1758188610;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=65ye4XkCH8izeRtH/tdAUKF+n65DyQp+SjhteFd0SJM=;
        b=s3eGah3mu2bCmw+vWXnfRvxOXNVDa5tkAdh6NnSO1fIn5I8ISfjeRFa0VqDZuGEphr
         5ZYe3x6fdk/tL9sl25rLbQm6z/K9viYRsvV2mrvoENHwWhGu5AaZfn7VJKXWVVRGHGJn
         kvWCss41VhoD0G1ytTonpyZ1X671O1Y0K6g3lihbWpRqXrp7Vvi4uIk8MqUu+AhvnNMC
         GejEapZFro9KqiRAcFNi5uPkZDHkoOsy0sJah1TWTBL2TkM2JPAMcxK5GuANdmeJoKxR
         0CD22HZEnT03isZzHznYiZM/RZDlvXS2o+2bnn3bO7yxEAR3ial3NA6XrKNsd2KBheDo
         /YFg==
X-Forwarded-Encrypted: i=1; AJvYcCXFON+ck8ZqqRaWjxKblO6yitFj02woIbl4jt3R5Y0MXHQ80vYeWxeMOMWlma7VNyu9EGP4UQi/AoFvVw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzX3l4vN/TqK3LlHZo5NcW1uxkDoS+nYozxvvRsFS4OH3fUnJO8
	M1twC3CztvXAHDujVlPSnUxTZPZAiiBmAHmRKN01hcQXbxRfQzsQEQsJrm4+LGWh1hmsgX0vs6V
	3m9LG
X-Gm-Gg: ASbGnctHnhpvWo4qlnJbvl7LRIoA7Ce1tfA9HQCB8buirMjP0pX8BG6ZejD8fqrKUn/
	RWQkBU4dmaHctzifkvxqj/443fxeCX00uOBBYoCh3VE3LA0qoAVUls+BasfZaTQBMzWCg725x6I
	c/BGRQyHjxeoDjXtzpF9LowoLYRy4LCPwvehr9E0Yy9+1zIAfLHtXd1CCU2BSnAwQ+SLgV/cGwk
	9lZ3GrkeMK2R6gEffuj6+lxE6yn4mBykZKXEJt7wnPqf3F/uY+KWLpoezaliQj/+qyp+88gL2mh
	vNe9cWUBPCauRlBxny514yEVKuwW/Hde9JsyKPVEU9J8yodOC+hzKohe/Mn5UlWfn2upzSvlxeG
	RiUc+r5DIVCJH3khqIQxUq5tVl+4477YsKnEUXjmq4s3I7t22Eg==
X-Google-Smtp-Source: AGHT+IFxRjg9v81uuQcKgJCjKcjEAv0xsM9sp4SmD5WV8eob4iRgRmj1/g3CrehTKJs6CiX8Y1qZsA==
X-Received: by 2002:a05:600c:3508:b0:45d:ec41:e0d2 with SMTP id 5b1f17b1804b1-45ded9275a2mr42385585e9.3.1757583810410;
        Thu, 11 Sep 2025 02:43:30 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e76078fe3bsm1759218f8f.28.2025.09.11.02.43.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 02:43:29 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 11 Sep 2025 11:43:14 +0200
Subject: [PATCH v2 03/13] memory: tegra186-emc: Do not print error on
 icc_node_create() failure
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250911-memory-tegra-cleanup-v2-3-d08022ff2f85@linaro.org>
References: <20250911-memory-tegra-cleanup-v2-0-d08022ff2f85@linaro.org>
In-Reply-To: <20250911-memory-tegra-cleanup-v2-0-d08022ff2f85@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, 
 Aaron Kling <webgeek1234@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1229;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=oEubvqZI2n3V9FuebymqRYT9aJaRR3Y7ftHMN9o4xTM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBowpmzCfQwakqbrLKcSYcAFISPKrzFONKXF4Njj
 ePXILqcC6eJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaMKZswAKCRDBN2bmhouD
 12xKD/9hZV01mI7q0n2e0xRk06eXW9N4OPyG9owp/9bT/kwAnwmDRcqneVbww+q4jvJYmbsOdni
 3q7b+9wLhDLrQtoEjljXFwt1HDjfAT0njGbKrJgk0SJfWcFHuTyTq/q92WtaQOoSth5MmiJyeiH
 sIMAtHO/aTVXxUS5Zf3wDrvzbVJZEYOPc99ae7WliHQk7Pr9S1n2+L77hWnVzIfP7Fc5MhAqlse
 0AGbwous3Yd5fRQobeD6iqL3Gdi9M/TE8qjxRH9QqJcYg+8U3c6uTEKmUr+4IWEs65rVeU6sXJ8
 Lf83hpskL6GS1pAuT4+AIDJU6JUFMamgCW9FgeH077Qxf5X6FwdKKJ5vgwaf35z2SGMwFnOlNJv
 VNUkrWYuyS7rXV45Qg9bpOumQG+54o8yES2uanEM2XW4T6lcxlxIccwYSbT0/ZK+0ILpMaKnz8A
 SuyvleV7K41Pr83MjaPiKevpnyc2W1NnvLQM5XncrVArHRAyh+QXWpQE4yeoEcwTGvkc8pl8qQw
 eSMJvnA1iYWJdyuAWgYBzSVHbbgEtiaTVMLoi/JxpPydTIWGnaViRn2DLAMbmJgfD7o3TaxLJ+K
 H9j8qJfxJNtaFdTJcdm61EUaVyxJjwEgl6r6GALykIhLL8MBZhmZkEpojGnLUOOywalwgRZLIV8
 poyv0y7OWjVc0tw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

icc_node_create() is alloc-like function, so no need to print error
messages on its failure.  Dropping one label makes the code a bit
simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/memory/tegra/tegra186-emc.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/memory/tegra/tegra186-emc.c b/drivers/memory/tegra/tegra186-emc.c
index d6cd90c7ad5380a9ff9052a60f62c9bcc4fdac5f..00baa7ab89214b1a151ab0c0a9ab76f90f922478 100644
--- a/drivers/memory/tegra/tegra186-emc.c
+++ b/drivers/memory/tegra/tegra186-emc.c
@@ -273,10 +273,8 @@ static int tegra_emc_interconnect_init(struct tegra186_emc *emc)
 
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
@@ -304,7 +302,6 @@ static int tegra_emc_interconnect_init(struct tegra186_emc *emc)
 
 remove_nodes:
 	icc_nodes_remove(&emc->provider);
-err_msg:
 	dev_err(emc->dev, "failed to initialize ICC: %d\n", err);
 
 	return err;

-- 
2.48.1

