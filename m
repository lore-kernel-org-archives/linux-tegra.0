Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC041319619
	for <linux-tegra@vger.kernel.org>; Tue, 25 Nov 2025 12:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764072383; cv=none; b=RkMLMf7jdg2vU25obJu1EgAfytq7fOktlfhz4zeU0xk93zXJnedrl+o0/szKrk7YgnB5/uA+v/yxxFToHhqF6Do5N6yNVMznzBqKKAJpoTK5XzrFctTAb6sceK8CijvQg8IkvJe9YVmbdWQRpb15QmzJ9Ods9PwJORFEnrsYwT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764072383; c=relaxed/simple;
	bh=oSxMov1SESrAgpKKZcLn4WtxFn0hZta8BIUSnqu+iNo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qN6asxbJtNiJVWyqevbTvaZ3kxbu3b9LYIq9U/WUUW3trWBs3YurXcCr6IuEV21tInTTxA+fIDNE36RNYqxFHAUFRhYVaoZ7UquYqSwg6BHL9FyNDULsCkqJxVJPKcjSjEk4S+BDr/UPeoZKdhnukqEklOgv6EnqISEGolb7WFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k1czExDw; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k1czExDw"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5958232f806so5688702e87.0
        for <linux-tegra@vger.kernel.org>; Tue, 25 Nov 2025 04:06:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764072379; x=1764677179; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MQgVO7SUdIDltP6h5MVysIssYHMNX5v/mXvkkoKdSwQ=;
        b=k1czExDwJZmYSaGUoDNF3wafP+LkiTmWpEq3eJgODWVtvNp97tx3MXr8Dw5vf6OFSl
         bHyItokgSY/CTT4BbDg/x6WQJD2cZRKZWdCWHtpNLdIkQVYNFCoSbiw08KVPOkXOwthW
         xMBtUwy9U0m27G8BDMqRKnz/Dp4HLQR9iiGMDOeW5mRkUNoqoZlRH+ss8SFEPMtUlX01
         nkfe7MivbEsRLI8qUDPeMP+zCB8ORUVtmo9aHOZYoj+U1Z1LJER2HSOonSCzChJvR17u
         wI2RD7lIOB9XB5QJciVWKRyxxM2stn6KGi68VTBIvJ6qYUt8tqgSjUreKp1qYxpOM1hP
         yfIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764072379; x=1764677179;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MQgVO7SUdIDltP6h5MVysIssYHMNX5v/mXvkkoKdSwQ=;
        b=OhUtuuBlfFLKlx3/jfKHI8bhyLN0Ddem3MzCPiKEihEuva0m9Av/hGO8nbxmIkNV0z
         ZuJVR/cm5dioKSMqGy9BjyVCHxNyvt23btMBPyhG1pSkrYuA4IjnGzvSD6r+UVQzwqiP
         lJJrq5o9Fcr5Mh4l/AYWfTQ4OyLyRh0qZFCJh9TPaqhjXMD8SGMT5b+OKbBO8FED6m8e
         uIdwLTkq5YuGJFH5M0330Y9+DNYpoh0pY7s1SAf4y1DKdU8LXQEWOLORFc+A6AZkBqhY
         zV+fRzKH5/sbVQb17XGqtZz6oM1ATAEKZg/sBQIl27qo8JtviGBIeD4UiKIktLHgGAlk
         bVoQ==
X-Forwarded-Encrypted: i=1; AJvYcCWdUCBL6QPOjMwtp+zWybgR4gBpVZ2iLxLncMHUrRoQnUH173qVE+b6QSN3uuWxQHyr7Dl/gDJTxotOsw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyqJCSfizdG2kKpRcRh8xe7wAgJCSFe3ddTHC0ofSpIPx9ZpH0X
	uTCtMUqZnuI+DyrxBZL+OCBVOivRya/a1lyWltbCVF0v19dqBSJLS2wb
X-Gm-Gg: ASbGncusnj2LkYYftmymK7lCSbtrE3KphCXQP0+WTSHXK1a1FCKoR1YsET0M9js1uwl
	aeLqfeXRuHwQb0ZmhiWxNnvWtDVFsVWWp2LzFpnowaE42gEWqV1cNtvvj18sylE5sXLSxWvXoR9
	eqzYv3DBcnZ2mR33bDrRbFz23Ewhh7sAI2bVI7GNZiNYj7eUdh/YnJronJ87g+2IRgOA3BArP/1
	ZPBResWD/u5KUmFFYu3HsFHNeI8RRR9CdETPtYJbM7pJ4p3Qezshk3l+hlLVmgJp7QA0SbO1BIE
	XpPPou31iyYDBauDNM7E9vfIKKbFcPUN6RLfeapOXvwMVW1cUaH+sY3U7JekdIqE2dBNJBxX+Y8
	NCN/a2NU7CD3wAC2ugYGy7iXffZ1U8SL6DTWdPBZGfuNTD9GDaEzUJSQ+n/2b6hSmqEE34ZAZ0a
	s=
X-Google-Smtp-Source: AGHT+IGtM1PyFoR4RY0zhjHY2chTLDIVD6KPz0Yfdd6DO6DZabktBNfX2NguAOJht6zWvGQbtOixQg==
X-Received: by 2002:a05:6512:234a:b0:594:48e6:26b8 with SMTP id 2adb3069b0e04-596a3edd5e8mr4793046e87.39.1764072378784;
        Tue, 25 Nov 2025 04:06:18 -0800 (PST)
Received: from xeon ([188.163.112.74])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5969dbbecb9sm5150993e87.58.2025.11.25.04.06.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 04:06:18 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <treding@nvidia.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Dmitry Osipenko <digetx@gmail.com>,
	MyungJoo Ham <myungjoo.ham@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH v4 01/12] devfreq: tegra30-devfreq: add support for Tegra114
Date: Tue, 25 Nov 2025 14:05:48 +0200
Message-ID: <20251125120559.158860-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251125120559.158860-1-clamor95@gmail.com>
References: <20251125120559.158860-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Lets add Tegra114 support to activity monitor device as a preparation to
upcoming EMC controller support.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/devfreq/tegra30-devfreq.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/devfreq/tegra30-devfreq.c b/drivers/devfreq/tegra30-devfreq.c
index 8ea5b482bfb3..fa83480a923f 100644
--- a/drivers/devfreq/tegra30-devfreq.c
+++ b/drivers/devfreq/tegra30-devfreq.c
@@ -963,16 +963,22 @@ static int tegra_devfreq_probe(struct platform_device *pdev)
 	return 0;
 }
 
+/*
+ * The activity counter is incremented every 256 memory transactions. However,
+ * the number of clock cycles required for each transaction varies across
+ * different SoC generations. For instance, a single transaction takes 2 EMC
+ * clocks on Tegra30, 1 EMC clock on Tegra114, and 4 EMC clocks on Tegra124.
+ */
 static const struct tegra_devfreq_soc_data tegra124_soc = {
 	.configs = tegra124_device_configs,
-
-	/*
-	 * Activity counter is incremented every 256 memory transactions,
-	 * and each transaction takes 4 EMC clocks.
-	 */
 	.count_weight = 4 * 256,
 };
 
+static const struct tegra_devfreq_soc_data tegra114_soc = {
+	.configs = tegra124_device_configs,
+	.count_weight = 256,
+};
+
 static const struct tegra_devfreq_soc_data tegra30_soc = {
 	.configs = tegra30_device_configs,
 	.count_weight = 2 * 256,
@@ -980,6 +986,7 @@ static const struct tegra_devfreq_soc_data tegra30_soc = {
 
 static const struct of_device_id tegra_devfreq_of_match[] = {
 	{ .compatible = "nvidia,tegra30-actmon",  .data = &tegra30_soc, },
+	{ .compatible = "nvidia,tegra114-actmon", .data = &tegra114_soc, },
 	{ .compatible = "nvidia,tegra124-actmon", .data = &tegra124_soc, },
 	{ },
 };
-- 
2.51.0

