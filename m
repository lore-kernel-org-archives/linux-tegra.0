Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEDD62EA154
	for <linux-tegra@vger.kernel.org>; Mon, 15 Sep 2025 08:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757923347; cv=none; b=jEBj2C6QGroJ//5B2OJGCeF2hJ9t/n15E5pkGn70K8Fi7TiE3tjJwAYYuyqaaXVdQW9K9YavdHbAlgrE/54dWnRyL8cLhuyKzEoFMsu6fBUIW+NH6rkhcbVzUCKwGZbUmy9pizxkvW+14Ago4x/8ecJgRarh9MBFQw1oSasURWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757923347; c=relaxed/simple;
	bh=zND4GhxFU/tz0sYLfWaRU8glzS+okJHK24B1i0p/cZY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LGqrYghAQAMuYOyF8Tr22FH21hQIqyLrNiFI4Fzg1l5RkR5szjc+snQWkEtwjdrqi1HPqXhljRpy+g1QUN+EMZPc1gfex2o7j8n9c/2Ej0toX7TMrU1swlOVUZG8kpmsTvKTLN7kZqa1w9slIPW65qgIs0JhGQcxy89YJfglSZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K9o3Awbg; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K9o3Awbg"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-55f78e3cdf9so4443546e87.1
        for <linux-tegra@vger.kernel.org>; Mon, 15 Sep 2025 01:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757923343; x=1758528143; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I+y0n2iQaoQRxXuIEAJP6wVzz5TSA3TjXyGRiIjZrCw=;
        b=K9o3AwbgmZiQ/wdnFKUyEc2dCx6D5gVDTz+yZRekRc8pJdKcSydcnbf7psHj1pdExI
         ofMDtNmiLOP7w5RTwWU6LvrqtDlzIuee2jH7VEtVnx67GMh1gTQ5fZsfFHRNT5Oh/Kwu
         HMgy7QX2Edbvgq29gf1Elrop4XC9Y6+yMjd6E/8MdqlSVXS5PLPUupDqE2t2/AJiy98Q
         O3RP1xk3wP0CDTEdYpkcemPWEjF57hYoLVFH1TkJsFATOaTM/NSGHqiJmcUJrZK1fjaw
         EPZkICu3B3UYEQ6zlwWHRnpNtxOSMQCkyvnFp42A/5FgaA83NVqRogyN//XnhvlMa0Ck
         bupQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757923343; x=1758528143;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I+y0n2iQaoQRxXuIEAJP6wVzz5TSA3TjXyGRiIjZrCw=;
        b=lBqzJXJKL08qeS3mrXL6rsxLK8t7bWBwUOymz1eZnBefd/HOzrta1uAenDjkwvKwTN
         jc2ctVYFmxGIzZ8ZBJHODJOweIs/kF4GESu031BvDhbvXXQH8k1oQugQTvhryRWtqpqd
         sT8HbYIvxolU7DfDGlhKrJ2y8gQ8Xq3Noaa1Xn4veg2UQ/G629iNO7y66V80yuBOrXux
         7AML472NRmXLDEZqvsq8znOYc+SGLShG/vqOCWyvuMu3x0hJXcHaOi9iTXXoJ/HUr2ZQ
         puJk16UY5yiZ7XKJziMf3gfMJPoanwnpAU29zqL5Lyt654FdfHHce+oXEj76miWq7PCP
         ZgEg==
X-Forwarded-Encrypted: i=1; AJvYcCWaJ8ZkUd/uHsU4DTVMKajVC6W864biIEJQ5qOHltw8jETnmrQKLRRFDIy23oZQ3WDUNoQ+Tvpfgc+OLA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwjuaoqP/8PEvC/C5LZR+QpxCHl5K87V5mLIb9GTe7dymwxaKMa
	gUrQSJvtzXa173NhwQD90JWgQpLmmk3QZBfiexe0XpkLyWrFSTw28JTG
X-Gm-Gg: ASbGncvnlX7v8xSHKclPdu8jZ1VpyRXayEPmXMFKbaZxvZKLkfcwl6KQGFK7aWSqoEe
	2bvG6LI+JwaWoMyzli4D6hAT+G2LS0JAAhUQeCD9rJn2vlgxyiq2PkL4465Amy4JRe1/TBCBqm2
	5sr9zKHBUeqkKR7cE9f3IxBFsNXQO+5stlJkRIEPLHcfvysEYlD+ohUD3Cy1kRqJCXvh3KPQ3/b
	peSJDh7TXYTKwT7kZ7bSs8+mY4hms/wYKz2m6riSxwjPKZcIm4P8a7Eob/ryEHRPYSeKDzGFctP
	TBildOQLJC/wFqe2oK18cwE9e4du/TY+C6IvP5+6xN2F8xFR7XE0TF/MOguBKPWEmWhI7+gF+En
	8ftFpwyUWu27PFCuo7M0wRqvC
X-Google-Smtp-Source: AGHT+IE6lsTSCi1HbUYjhR6DRaTx/WD5l7j/ig8VpXqBNn3d/LYOB9q6iXpX88ot17AUCeJYiqAUPw==
X-Received: by 2002:a05:6512:79a:b0:55f:536f:e89b with SMTP id 2adb3069b0e04-5704fd772d9mr2486614e87.53.1757923342570;
        Mon, 15 Sep 2025 01:02:22 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-56e6460dec4sm3392381e87.103.2025.09.15.01.02.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 01:02:22 -0700 (PDT)
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
Subject: [PATCH v3 01/11] devfreq: tegra30-devfreq: add support for Tegra114
Date: Mon, 15 Sep 2025 11:01:47 +0300
Message-ID: <20250915080157.28195-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250915080157.28195-1-clamor95@gmail.com>
References: <20250915080157.28195-1-clamor95@gmail.com>
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
 drivers/devfreq/tegra30-devfreq.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/devfreq/tegra30-devfreq.c b/drivers/devfreq/tegra30-devfreq.c
index 8ea5b482bfb3..d976077d4757 100644
--- a/drivers/devfreq/tegra30-devfreq.c
+++ b/drivers/devfreq/tegra30-devfreq.c
@@ -980,6 +980,7 @@ static const struct tegra_devfreq_soc_data tegra30_soc = {
 
 static const struct of_device_id tegra_devfreq_of_match[] = {
 	{ .compatible = "nvidia,tegra30-actmon",  .data = &tegra30_soc, },
+	{ .compatible = "nvidia,tegra114-actmon", .data = &tegra124_soc, },
 	{ .compatible = "nvidia,tegra124-actmon", .data = &tegra124_soc, },
 	{ },
 };
-- 
2.48.1

