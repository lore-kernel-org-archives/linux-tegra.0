Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 307D4211269
	for <linux-tegra@vger.kernel.org>; Thu, 23 Jan 2025 11:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737632382; cv=none; b=hzlslyLkqnyEaK9Zf8Cv4Cl5ZwpnY9YQHLJYDlhVuTdZHKfsPSymXy2lrdP9S3CFO1z9QMx35XKA8X6OVZZrHh6rR6Ux0YaZO6XIl4cV71fEHq7r5/6ToDDTCBrRvpVNRmwx/QEyQIlRw+Yby9cVY5R8gBO76MpP10vC0AZhzfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737632382; c=relaxed/simple;
	bh=/RmPuuk1QBdOp+fFd+3u2pJjkPwx9R+qmj0CkPks3v0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SBzaHQG/AcRg8J7jasKKEU/T9zffOtafXDHrgWS6RznvquiLNGNJKSKkv4ywNSnM85yW39AMYZRjVnfqxc3CingG0yVi3oTHuUiUqzSK23qo/o82foqjV/7aeST5Y6iCwq7wCJYvJ3Ed2ChskdBjPh/O9Us45btvd9ABfcky2Qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qMWkRTXN; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qMWkRTXN"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-216426b0865so11526835ad.0
        for <linux-tegra@vger.kernel.org>; Thu, 23 Jan 2025 03:39:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737632380; x=1738237180; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4UBx5rEFZg5PgS8nxgdRfkrF65rnIH7pugxuBKI58m0=;
        b=qMWkRTXN3VHUyoPzNC0oOZmBpkit1qy/eQ1amcM29oM5zq0/oRpq2fyBpyJ+64U8Sb
         ftVDcM/J/995U4flbvxGKMMaSzbvuMoBG9MtFLQwx5rg2WzD9isGqG+KzT9So1B/Hxio
         DT338KHL/CfTwPpD/Rz7bC8oJZ4l5TXuRi3gZ0b45ktr8wCxF2qw43eZ0I2jpiiRubRo
         H4symqPgsk7zzaTNRLhV0763VzdDz1jJDgse8d/1/Y4YWrrSOYOCvTNTJTcivAAmfG+4
         dHc0Tr989gVTNr5WuZjlMB6Wy76zjztovqPYYkHizAmwe24TwAfcu9lz/7VTRlkTYHF0
         QnLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737632380; x=1738237180;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4UBx5rEFZg5PgS8nxgdRfkrF65rnIH7pugxuBKI58m0=;
        b=SwdNS0vYtDHOfGLpgwE6WUhYL7FkPWRi7Swgiea66qHDYSIqOUWUPjW0aBwR7vM+K9
         22c1b9Go0V3OleuzFnE+F+JrBiyMvyGGtFQKmFqwhqGuyIoO1GvJ+wxJEHOgMAJaggQ8
         GvRI5gD6iqeYFMQ8vL3YgIyphAYqP+gBEXA4WzcEkj5/nvy9JDYpxNLyHMQPoCvH8Fqv
         LgEj7L3sValKLDauy84tiYGXDm5UaYC8D3IxT5sLcibqVdlowias2DfKkrfqDz1AuoT8
         wc9/Qi8uGOEFxeonHfClntLqlVzGWDBx/j1JblNoEhI7XFQS5/8xI9Mhi2nMczMNVpP4
         uJmA==
X-Forwarded-Encrypted: i=1; AJvYcCWf/p3a8i7gt/FpPiU1smdU1TIoSa04YVi7Y5UcacWMbdP/QdW7ziKXUz3gxFI1y7Klorbx6t6td5HaXg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwLrvThlvA8DFHi8F9JZaVL3niSSNxx3YSGtAcWiVse55/C26dy
	lWd6uWpDThfxD8fxDkgrwfzrQkY5hASzuZxjfpmenxJOqP7y3ksC8DSr7H8yob4=
X-Gm-Gg: ASbGncvt9u0UHgtUz6Df0uuohzdQWxr3MM/EtqaCHVq/XHe+NkHVd/NP1TXCk2tJfaJ
	bXZ030ljX2btxCrT19sFbDhZDO2lFmpG3Zi1aNvneKoDp9rg+8LsAlNIFVteGboyK4LYGDtCaPF
	LyOENCSoydYBAIUOS+gajXgaKv/wrrPmEaYx70mvpIhszKUruqR3OBmz7Dj9WbbGl8qV+kGAVht
	hS+6hnkxrjL1+h3QA14dW+G4m72cIUUsfIhmgKivjgQiEI11mWYcnHxtXI5Nqo3rPHtkBIzCBB4
	JRftECWPxqI2uy+imA==
X-Google-Smtp-Source: AGHT+IGvwGQNvEk20SR8FXwOYBdk/eKLULIdQVMu1dIgz8TqDRTBdFlyeE3AUsqvQwO3DrZBqBulzw==
X-Received: by 2002:a17:903:41c3:b0:216:386e:dca with SMTP id d9443c01a7336-21c3554c994mr378111625ad.30.1737632379733;
        Thu, 23 Jan 2025 03:39:39 -0800 (PST)
Received: from localhost ([122.172.84.139])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-a9bce3a6157sm12352214a12.39.2025.01.23.03.39.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 03:39:39 -0800 (PST)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-pm@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 29/33] cpufreq: tegra: Stop setting cpufreq_driver->attr field
Date: Thu, 23 Jan 2025 17:06:05 +0530
Message-Id: <eb3120d85361e02d6370250a2d06635ed82ea593.1737631669.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1737631669.git.viresh.kumar@linaro.org>
References: <cover.1737631669.git.viresh.kumar@linaro.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The cpufreq core handles this for basic attributes now, the drivers can
skip setting them.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 drivers/cpufreq/tegra186-cpufreq.c | 1 -
 drivers/cpufreq/tegra194-cpufreq.c | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/cpufreq/tegra186-cpufreq.c b/drivers/cpufreq/tegra186-cpufreq.c
index c7761eb99f3c..b54a77be54e6 100644
--- a/drivers/cpufreq/tegra186-cpufreq.c
+++ b/drivers/cpufreq/tegra186-cpufreq.c
@@ -123,7 +123,6 @@ static struct cpufreq_driver tegra186_cpufreq_driver = {
 	.verify = cpufreq_generic_frequency_table_verify,
 	.target_index = tegra186_cpufreq_set_target,
 	.init = tegra186_cpufreq_init,
-	.attr = cpufreq_generic_attr,
 };
 
 static struct cpufreq_frequency_table *init_vhint_table(
diff --git a/drivers/cpufreq/tegra194-cpufreq.c b/drivers/cpufreq/tegra194-cpufreq.c
index 9055dd398e7f..9b4f516f313e 100644
--- a/drivers/cpufreq/tegra194-cpufreq.c
+++ b/drivers/cpufreq/tegra194-cpufreq.c
@@ -589,7 +589,6 @@ static struct cpufreq_driver tegra194_cpufreq_driver = {
 	.exit = tegra194_cpufreq_exit,
 	.online = tegra194_cpufreq_online,
 	.offline = tegra194_cpufreq_offline,
-	.attr = cpufreq_generic_attr,
 };
 
 static struct tegra_cpufreq_ops tegra194_cpufreq_ops = {
-- 
2.31.1.272.g89b43f80a514

