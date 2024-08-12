Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF2473B7A8
	for <linux-tegra@vger.kernel.org>; Mon, 12 Aug 2024 12:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723465863; cv=none; b=UAbsYd4Q0zD9jFD6GoKR8veDF3e+iqCBKFGr9RtQMRwMM1VqAKn65ttu5RfMKqgB60j3jzy40w6OuwVcqQjDdvrG6sDD2s9as3tUzscOPVOGNSDFz+kX7vcIT4MY2l4LtAn2B+2kfiN0z6QbU0nPcxSSQ9BokjU0takpSePf9xY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723465863; c=relaxed/simple;
	bh=4s62qVRHCnsvaoNH4q2XMZiaS9GZto2/rKo40yJ5wGQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=beYxCK7Fa53E/kaaH0Arnw86M6D4xOEULfzZAhomBFo3m9XMRNMBzDcjCtAN52KAd8b96197c5lgojwFS3oH2Si6zuoveuj+Pijj8tNk3MY9Ew1WjXdDp9RNu+fe+kds15uhIHCliZLLlg/ZFM63+ORnE7xKS0Bq2bcuB1mm/ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=de9bqy/G; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="de9bqy/G"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-36bcc168cdaso2984172f8f.0
        for <linux-tegra@vger.kernel.org>; Mon, 12 Aug 2024 05:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723465859; x=1724070659; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CrjMzxFTOymK1yhiDsFxq0lcAyXP/N53dsHhhTtc+pE=;
        b=de9bqy/GLISDqJXhRY/AzKzFfYNx/NlU4BsWVM/a799aNPDuzsnyW3I9Utwsv1aVOT
         S3pZ2etyjLOt7Ay6g/b0hPnDqn7+FOTpwAiNfW0R56VWkROya8c4kTR96P+Hg3MjTuNm
         F5O8YsOYvOWPfIWLHKbd06Xh2Pw/1LAa756GUwnqo9gJhE3r9Qy102mh1yzc1Bf4RweG
         SqhzlOzwXOOyJpMvj4SQ/BBCCQqp8ATfETZ6Lz3Qux63EPv5xtGqkJHKk/1ZAu1H/h5Z
         1KNmV9gh3GkReiMp68TPUzAOCzYP2uEf0BphBTr+LdI0fUOuk5vNUjFP5AKMemawaarT
         u/Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723465859; x=1724070659;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CrjMzxFTOymK1yhiDsFxq0lcAyXP/N53dsHhhTtc+pE=;
        b=DVuWRVhEDy/RvripgOTolAAmj/Tt6MxlR2dSLVp9R+SXQyQ4t710u5+vNOixKTydvX
         easShKygVoNDsoajDX18Z21Kjku9zdssJA7M8IL5a21Qn29YAs0Nd+iQAicN3FcUx/Rf
         8LSBXsj9GDZpgUXaYfq5DqM6cShg3KE/HeJSkdE0Lx1anmEkdmpsQt9TfPxE6ggwlkf8
         jsYyjTzFbkcr1eIxADWgIWl+06BIe4p7HqnRXFC4ZrnRx1AZBmRuKlVHBGC2Wg7+xq0n
         dfiyoAiXY91DRF1tvNd5uvjcOkio9gc0qY6Yi8ABKo7Bng4Bk7EO++aGn1CxCfVPuy51
         xLsw==
X-Forwarded-Encrypted: i=1; AJvYcCU1Wgpj2ilWexMDBunMLhkFef5v+FH9pSUr0WBMgTrIeB+SuQVJ9fZX0FtdXYdYl8g8AhPW43yvDmSAcwpqjvEGmB2txvaPcZ5m4EE=
X-Gm-Message-State: AOJu0YzTHFzB50bZYBEYgMsYn4xha6MIBvFhJ+wKyqz+nYpJEzHaOhDs
	axY//Pd4geA6bm4/rDw3AEiyhdv33yu6O6IXY2d5cc1y/MQzQ1yp3G4f+Y9mvmg=
X-Google-Smtp-Source: AGHT+IHqBpkoDp5Wal5s8Y3KdZUq9WqkY3HpRBrs+w1cLO3eMxLwKdriiu6K0wUn5dFjISVeNq3Axg==
X-Received: by 2002:a05:6000:1b02:b0:368:7282:51d6 with SMTP id ffacd0b85a97d-3716ccef03cmr182934f8f.21.1723465858925;
        Mon, 12 Aug 2024 05:30:58 -0700 (PDT)
Received: from krzk-bin.. ([178.197.215.209])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36e4e51eb10sm7349493f8f.84.2024.08.12.05.30.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Aug 2024 05:30:58 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sumit Gupta <sumitg@nvidia.com>,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	stable@vger.kernel.org
Subject: [PATCH] memory: tegra186-emc: drop unused to_tegra186_emc()
Date: Mon, 12 Aug 2024 14:30:55 +0200
Message-ID: <20240812123055.124123-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

to_tegra186_emc() is not used, W=1 builds:

  tegra186-emc.c:38:36: error: unused function 'to_tegra186_emc' [-Werror,-Wunused-function]

Fixes: 9a38cb27668e ("memory: tegra: Add interconnect support for DRAM scaling in Tegra234")
Cc: <stable@vger.kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/memory/tegra/tegra186-emc.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/memory/tegra/tegra186-emc.c b/drivers/memory/tegra/tegra186-emc.c
index 57d9ae12fcfe..33d67d251719 100644
--- a/drivers/memory/tegra/tegra186-emc.c
+++ b/drivers/memory/tegra/tegra186-emc.c
@@ -35,11 +35,6 @@ struct tegra186_emc {
 	struct icc_provider provider;
 };
 
-static inline struct tegra186_emc *to_tegra186_emc(struct icc_provider *provider)
-{
-	return container_of(provider, struct tegra186_emc, provider);
-}
-
 /*
  * debugfs interface
  *
-- 
2.43.0

