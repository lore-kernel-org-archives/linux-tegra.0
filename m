Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEE6A252904
	for <linux-tegra@vger.kernel.org>; Mon, 26 Jan 2026 18:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769453691; cv=none; b=VPYRQhX8RuEI40zBVLqUqIE4ex17Qvu23CgDlxrWYXhUJbXJ7IVEpmEXaZAZUdoeeEbMXNzF6wHMTSLmsYLqRdaamBLeIvclX+nW7Hbckb+q8G6wr+rk3xdtVhGJOObZg4WrX6ZVpqjwmtVWLDoUW0sPGCJcckHSHqdC4AMLEkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769453691; c=relaxed/simple;
	bh=1+5DCp6OHuKcpHx/26jzXFcnmrgHGTiIgTauDkixbRU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gMI0qSAFCRBJOxNvsmVjbxJPgK48MkoQ84sTuLPuQQEpmohzcx7LkBUoi2UX7tpsR8zG9zeFC+h0rBti192n3Rc1/rhmBx4Ca+WayWc7qrL+5qOIzyLDZjcEEDvYIJOvypCN55Ogh1VLHqifx4tbcKlU7SIRpTe1DZ8+nAo6Mmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O08VUooE; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O08VUooE"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-432d2c7dd52so4974953f8f.2
        for <linux-tegra@vger.kernel.org>; Mon, 26 Jan 2026 10:54:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769453688; x=1770058488; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DkYHBbf51iPoTKTb/DYQ1Urxy3yreGvpCuibSsYjEfk=;
        b=O08VUooEHqZP99OBKgphpyM1x2G+l5I83pvvSWY9ZwHkn1mCOD35UmFETDnntnW4wY
         O82qDe1A4AWpVU6hIU0ONs97tn/Jt3/5HDXq767wXz/AqcB7ZEj7GMFAHS1IEClI2uYM
         eJk2kkeXJAMgiB4AG3Nfjb8H6nIYDce4WgIwFVDJ/sNzY2BrWOep5IArk/lXcIt+yji5
         lYbkKmkpTj7ilGFYe4K7nsot9Quyl+G9HX5GyrrzZSfcsFMYAIXjn/hRwXuGZqshHrls
         H6ORjnI/4w9WQpou0iDtR6H4NCm/8lsuVk9ySQZ5vPdExrJWywdlG3xEFLaOcVI6qL2D
         dWiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769453688; x=1770058488;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DkYHBbf51iPoTKTb/DYQ1Urxy3yreGvpCuibSsYjEfk=;
        b=cC2O4OnqHl4Tzblnz929o27qSnBQAFZQrkGq9htXj7ynV0xlQJfvS7Gl2aZpXcfMsK
         OBcTVZW3CWTPwkSxhjGeahvcJStSyBYh0h/J5/1l5dJXdvGUZbYEtK+cIyS6HruBuCKh
         +EGbrQdgH9stZBnlJxQxR4ydDQm7doXITt1L3KahbNTZRR6EZNmGLf4SHQQGYEYhZUVr
         MxHE0CR2N14TZtEfTS46MVnvP+63ketipuZ790cyTeBQJL18iKBMoCKa4QRa9BKs9iFH
         mRJKSO5GgsWQY4rGbGDWbz07i2JxpkLNfuGra4x5Yggzb8unxrxsRSFWEBkNLuMrlYsi
         m4yg==
X-Forwarded-Encrypted: i=1; AJvYcCU5eDdX5U6A9nznmChWvBv7VulKjsfG98RjE+qVyhArW8h9ZqT9nh9ec2B2CBbuOGtpLFFjNSofgdc2iQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzxN+aLL6WMW/kzSMtjYpt5vPda3KHCugxI4JnN2Zp+IfGizgE5
	XSnrfhoIVL1ukeJl3JmbjgqduFVD7awBIp36pFTm97+VAHdhwlz9o1QP
X-Gm-Gg: AZuq6aLqV+SUY/4ZyVnOU2b6vhvXMgoiU6mdXCLxv62FRqXFpOMwbrQL490ZQZmBTKP
	f3Xi7I2yTXbe/wTucLKQBJFCHxMu8fsf82h85peR0sFYPz4i9cI1szXRzxxLC65b3WQUH2achAf
	vLfJSo4YG4ykDFoJ9I+u6S45J1eVgowfBzP/rMd67W6pmx0U8TfzrsaQKz/c9rVBV6Cq2A/gvBZ
	e3YdTwrH/xXnUouthPtFaypSj8xF3HNsEWHegAqhAfflVvXzLSDvZQZHQS1jWdC0xrek3iPWniu
	K2PiraczdR6Qy9jZ1q3cQ7kQe1TV0gp3eqJsPkfzJj+LRe6VTii6HbBkcfnls/QAKPfGAQEr51t
	GvnCKSbXs1J/aAsMEljCSVjxuDCeoofrW0aTCm86zB/4Y6nibsl8VMNeJOoNnJsgaDzFQkWIm6i
	Rr
X-Received: by 2002:a05:6000:2313:b0:430:fa58:a03d with SMTP id ffacd0b85a97d-435ca3ac2aamr9067059f8f.63.1769453687994;
        Mon, 26 Jan 2026 10:54:47 -0800 (PST)
Received: from xeon ([188.163.112.49])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1f742d6sm31793947f8f.30.2026.01.26.10.54.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 10:54:47 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Dmitry Osipenko <digetx@gmail.com>,
	MyungJoo Ham <myungjoo.ham@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-pm@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/1] devfreq: tegra30-devfreq: add support for Tegra114
Date: Mon, 26 Jan 2026 20:54:23 +0200
Message-ID: <20260126185423.77786-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260126185423.77786-1-clamor95@gmail.com>
References: <20260126185423.77786-1-clamor95@gmail.com>
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
Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
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

