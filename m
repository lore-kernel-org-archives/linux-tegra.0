Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FE2B2836A6;
	Tue,  6 May 2025 13:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746538306; cv=none; b=LMZzG1ZmL2OghKf4jpFIHrKXtMSJVPDAR6lBV7cg7m4/Tv78Ojt4xXCZu9vmaCIK5GFSBD0e0Q+UcSsQuThVTtQXsZL2puUOJpDLgO7vo0BIxFzCFzC+VX8vGr+nYoMbR7QrhEWk4fTWHuJHkzw0oPWGexLFsEH1yexKuiS6W9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746538306; c=relaxed/simple;
	bh=Y0wkJJZXgLRlWfd2OFt0nXKcseTF1jz/pKnfr2hARis=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gKyKsOWfPuZ1x+REtzvZ+ZXlOKbIh64nl9L6qvSHM07w3kEIL/9TRLFdZ6fis1Joz30Rdfziy65jgfmaF0Dl32nEWjA5ED8ndNLCdrQGKd/yf2+iUZWSgGNB4UUel4Z5dhyBPjAR68ArK5uoFPdbBzkuU6q2l5PTjY9kLft9xUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LdtYFbfj; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LdtYFbfj"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43cf05f0c3eso34968915e9.0;
        Tue, 06 May 2025 06:31:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746538303; x=1747143103; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OJPEBo8/2FklhBRXQVrbXJ0ddjiV1/Z3tyBLYizuPbU=;
        b=LdtYFbfjMtRp5Uvig9gAz0A+hKKYHEoBiiUc0/wO2pbsNmT8nBKFXYfratr7IuFrHx
         +CyovIoiZYV99QG/UBze14pz036diIKkhOlehKi4LAbZ1AWRVw9rl2BZhiJi9VV6SUWX
         UbMJKNu+kBI0ZEKjV0AedokysOwclUdJxjdPqtSjMeaDOl5DLuCtSh/EUgJd60i6HH6P
         catZMCtc9TEQU84oKafcGCUl3H9cdN4hG83SmWAKRGmXmDI073/CjaKhNEAgggJMEx4l
         in1KesLBmT299NDP1EQkSC1SjRWY9s60ULqCXGyTeMyq3wRxA+tc4dWSb0BXw8PVPSsH
         WYDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746538303; x=1747143103;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OJPEBo8/2FklhBRXQVrbXJ0ddjiV1/Z3tyBLYizuPbU=;
        b=j8He9nPRiN4OF4dmXp880leo9KEx0VEeLR0wIp1XFe02IG5MD3hnjQKfFNOT6SBbbM
         JzVldNaZqUonbXlWxuWgyEsew5xh7DbETEYniEKXe2NAsW45+8NE/HhjKTUNgjiv3srx
         a2EKvzqd10raKhogvrje9pHbNIw+rlzKFOx1soXAzFHvbh/RuyjGDT9gopqDrW9w5Urq
         j0qR/sWhovqMD3v58H+ck28DsrByIiq98sZtoH3TL+PRSodkwt4Vqy2SiMo5d7gfSche
         hYj621CJkfrXbeIC/yCiDG0+zlc9ulVk+Hj0/xvnNIedyOW4J2vQb8/Gtz5pTYdIIRWW
         a94A==
X-Forwarded-Encrypted: i=1; AJvYcCUxVwAUtb1/v3GwhNTriDLQ8o58FKqBCoK5d7hhyzAHiHNVwmEwdKmeEqrg7k9rCLbVCPj8i+bvmKuL@vger.kernel.org, AJvYcCXm34ecL/uynMuRfigllFtAO3Sn5m8mhPqY5HVHxCTan+fObSZIlOMBJ9COqI3A2Ad+5/ul8wiGOaehxZo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzRHddDgrJ1uVZuM4ljoSKhyGkuLXG1jTiUlYd0fc9HEgur/Yla
	wRV1DdJ+FdNZXlOQQCTswZw76+PjzALHe7ZVYsYXU5bskvxbbgYF2ZEJhQ==
X-Gm-Gg: ASbGnctw57quFj9INMVnbiMmQy98Y1LDS/0bBuzmOkhRg4e03HKhQxx5w+jRGIX4bP3
	ilCfb+mvAJjXCY3x1ffW/4nP5NRoaybcktwBAsDD4Qm2/5hUzrEDAYgD2hpkntT2tQtxXjgPCXJ
	qHVghlAvXe3h/0CdYew9LqyIOejlZdk2LrkX1Kq8J0hGjiaxonovzZJpeKmrt6cwnS7kKzqUOEl
	VaPnc1F8ymmXjdHxZRflWkALTnkTRH10R1CL6jR31d/4i2uEK5+z24aeOqOoUXP1QAg8nyyOBHk
	DbjBCOMRjSZ6ZijSNp9AWVE1fx1EhoTHkMn7zGANMbxbndyafS5c0gdew430mfwesjH41GckAPU
	jneCPur3LLtTkB8hs8/zwzGPZJmB2IIEE
X-Google-Smtp-Source: AGHT+IHWN2ziCJWY/SQ3yYjj4A1xD22hrlquQqqAdwEjP8/KN2UnvdeQdYY1NbydhcBBozsl8m2sqA==
X-Received: by 2002:a05:600c:a014:b0:43d:300f:fa3d with SMTP id 5b1f17b1804b1-441c48b032fmr110754555e9.5.1746538302562;
        Tue, 06 May 2025 06:31:42 -0700 (PDT)
Received: from localhost (p200300e41f281b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-441b8a286cfsm168041535e9.29.2025.05.06.06.31.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 06:31:41 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 08/11] soc/tegra: Add Tegra264 APBMISC compatible string
Date: Tue,  6 May 2025 15:31:15 +0200
Message-ID: <20250506133118.1011777-9-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250506133118.1011777-1-thierry.reding@gmail.com>
References: <20250506133118.1011777-1-thierry.reding@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/soc/tegra/fuse/tegra-apbmisc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/tegra/fuse/tegra-apbmisc.c b/drivers/soc/tegra/fuse/tegra-apbmisc.c
index e2ca5d55fd31..0ce94fdc536f 100644
--- a/drivers/soc/tegra/fuse/tegra-apbmisc.c
+++ b/drivers/soc/tegra/fuse/tegra-apbmisc.c
@@ -128,6 +128,7 @@ static const struct of_device_id apbmisc_match[] __initconst = {
 	{ .compatible = "nvidia,tegra186-misc", },
 	{ .compatible = "nvidia,tegra194-misc", },
 	{ .compatible = "nvidia,tegra234-misc", },
+	{ .compatible = "nvidia,tegra264-misc", },
 	{},
 };
 
-- 
2.49.0

