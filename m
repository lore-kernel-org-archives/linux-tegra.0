Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38CEB1AC8B8
	for <linux-tegra@vger.kernel.org>; Fri, 16 Aug 2024 13:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723816653; cv=none; b=VZoABzDTDkBUPamGcgsgFdSsVrzHlz4x++Dffux7/mzacgv20PWzTBSs5q3WtY2o7IUWUPWxwhnMdxKz2blDMvb7d6nJ7Z1tb4ELuFK51+YJVeflIMXvsCSJrXxY/9ScG/eMD6TtHWeVnNPnlSrIKPJ8nR5nKeiUflMgf1S9wgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723816653; c=relaxed/simple;
	bh=bhKl8LrqSNNy1pCMzfb2la/HnUfCqWNtqkdVM7XHdW4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Fx5nuvWX8WWBEUbHsk7fXV98h3uqetR5bXaI0o8WsacDtynyAdEczrMwm70lToiU7sjVvBBecL27/ZeEgaqIY+/NWz5c6TiaHwV4lYSMIp1OQy3zjNmg0eHjcAsL2pzQRbH0HXJHY0t2+1+9lwlgul97rL5N6YnERIRRKkEJ4Zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PUNgIjoU; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PUNgIjoU"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-429d2d7be1eso10555435e9.1
        for <linux-tegra@vger.kernel.org>; Fri, 16 Aug 2024 06:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723816648; x=1724421448; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TUFNUXrgokXIwMs6WyuldKV0ZX1UE+1k07OmPjO8LYM=;
        b=PUNgIjoUp4E6BcHv/9txKXtLNQH6UnoJ8vYc79mK6ktExzy4vFH0DVKEKUMbiBHqFT
         Lud8vllDmLRYVeelE3zoOl14JcUqK6aF5L/5HbtKMtZOGbMBfFBGvM2YeULzkA3Y5kMK
         eVOUIDsDgV0Xd4iXAriM8pRNB4D18/O2UZ+o0yXjbQ3F3U2zDoLCJ10jnWWTteLbOeBg
         RLuxURTBUXfDK/fWvETtdSNkyMcyHeZ1F0tTdxgsvmAjObYmr7CKUWsma3pqdvDTneiN
         2vVqypBE+XGAPHsNTxpet4VjPOH9guXxDxCaQVFlvv34/Tb/T56jCG5nccj7rfGHw29N
         Q7nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723816648; x=1724421448;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TUFNUXrgokXIwMs6WyuldKV0ZX1UE+1k07OmPjO8LYM=;
        b=qZl1vKJczvVX+/o9ReH3dheKVqygMing25zHozQbt0fwfmzWWmofb0RxSOnCOXe/SJ
         WKS8/F5moAtavOtNgjMw3jq4ZxtdNdGP1HxtHWtNkfOw/5PyZMx66Nk65LQj//gF40L+
         zVeOSwZFvGyp4GYOGoyNelO6jJyS3fyxf8JpvOFwK7BHq07kLZNNFkfD2YuAH4XEb9A7
         8OuEZgnoUvGsbI71L4MXtCpj5OV4zci59oEKMAu5Qa0HqsUd4g69wAgLDTj0MdfHBD7o
         PGspbJmr/xyQ21FSg2wPYbb2wakNFc52HjqthySaiP2VAfHoEX8JrApAEUDcEu8uTfqe
         HgGQ==
X-Forwarded-Encrypted: i=1; AJvYcCUuMfzwjtjNKM7C+RLBV3yrMdZio6RvZBD9a2J/rP1/3qn0vHh7ZCRbA1rXUKYa9bR3nte0R1uw1gv0JOUs+fMURrVXKNGjVv088Qc=
X-Gm-Message-State: AOJu0YzgIuvW2mV3HyzQ8ZUIkXwixc35H7dRfHYT5reTYX/Ifb+zMKh4
	1E41aW3oKtvf9dyP/YnHEFmRvn5gW+kD2zMNPZ+FfoXieXfmKjXhDn90RTBunEI=
X-Google-Smtp-Source: AGHT+IFd4s3kymirxsu7ePVn8TcQO9UzOm0dQNnvzYRLs823Sud4ew3QO74mnMOX7OeGvHmgZRcr8Q==
X-Received: by 2002:a05:600c:450c:b0:424:8743:86b4 with SMTP id 5b1f17b1804b1-429e232b8a0mr48393265e9.6.1723816648319;
        Fri, 16 Aug 2024 06:57:28 -0700 (PDT)
Received: from krzk-bin.. ([178.197.215.209])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429ded36a95sm76183995e9.28.2024.08.16.06.57.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2024 06:57:27 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Timo Alho <talho@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	stable@vger.kernel.org
Subject: [PATCH 1/2] firmware: tegra: bpmp: drop unused mbox_client_to_bpmp()
Date: Fri, 16 Aug 2024 15:57:21 +0200
Message-ID: <20240816135722.105945-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mbox_client_to_bpmp() is not used, W=1 builds:

  drivers/firmware/tegra/bpmp.c:28:1: error: unused function 'mbox_client_to_bpmp' [-Werror,-Wunused-function]

Fixes: cdfa358b248e ("firmware: tegra: Refactor BPMP driver")
Cc: <stable@vger.kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/firmware/tegra/bpmp.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/firmware/tegra/bpmp.c b/drivers/firmware/tegra/bpmp.c
index c1590d3aa9cb..c3a1dc344961 100644
--- a/drivers/firmware/tegra/bpmp.c
+++ b/drivers/firmware/tegra/bpmp.c
@@ -24,12 +24,6 @@
 #define MSG_RING	BIT(1)
 #define TAG_SZ		32
 
-static inline struct tegra_bpmp *
-mbox_client_to_bpmp(struct mbox_client *client)
-{
-	return container_of(client, struct tegra_bpmp, mbox.client);
-}
-
 static inline const struct tegra_bpmp_ops *
 channel_to_ops(struct tegra_bpmp_channel *channel)
 {
-- 
2.43.0

