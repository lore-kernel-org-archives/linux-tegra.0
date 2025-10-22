Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D92491FE451
	for <linux-tegra@vger.kernel.org>; Wed, 22 Oct 2025 01:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761098151; cv=none; b=d3DLZPWWDu0+0eYC0g89HQM6+swcjmD6S8sX//t2gf989PbfiMDOyVHXN7zCuU1VvrsguM5r7jBY1lI5ZLaKyqURzv5w1hnpIJlCbFguDJ0O88kz+DIlGwnBVqW7S9YMJ3MCzH4Zvq877ZNWBhnMY5XRvCj21IZfnDO/NzgY0HE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761098151; c=relaxed/simple;
	bh=Y5j/Bnfa9vnAcAs2FiaNWlxj6FttS8dn3fKo1856mw4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=EKfGNfkPkH3Js5Jv6AwQY9p1v9+rgDQ1yyBEj/bu4N3IifvWwG5zU6gwXVtgwkqQLVYiM96Hs63Q2zUbGgyLJPaLSJZJisw0/2cZ37wBwk4OAiI3dL4OHlzMsTZ1h+zM0LrgbJ+rLzpz656CTzyX06YGySmIZyyMN26uTHyFgCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sw5f1Pg3; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sw5f1Pg3"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-33b9dc8d517so5703217a91.0
        for <linux-tegra@vger.kernel.org>; Tue, 21 Oct 2025 18:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761098149; x=1761702949; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vdRGmRFj0+9fhloGjpnhbXyISHONx/9VHecgIuMRmLs=;
        b=Sw5f1Pg3v9t1VCJMXnm9feA8QOMyp/QKrrr+xxOCvaqkqbXkPvRAtEFT6hqrbpeW/V
         eMSka3hsE4n90+7chgeJ54zv/z1Y6eGsviMJOdoQ8TcSEOqcVKn/NLmX+xrE6CkggUVz
         HGwk0Wk7Tg5G8XuSnKFL/HG1Dz/0NkHSnMs93oI/otcY+clTHIkDXj+arS+BfEU79llN
         2M+lrna7HHA2f2mdvw3OZ9KEtXGrt2aCjXKZmsh2jmGXpF1kB+oc46UzKHCyVjqjzYRj
         U2GZCB4Plzf2tGLbSQc25/RvBYLjd1Dhd/7tYNCv2Rk/wmgNZYHt8ZjFG32FE1j/WdSM
         /hxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761098149; x=1761702949;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vdRGmRFj0+9fhloGjpnhbXyISHONx/9VHecgIuMRmLs=;
        b=O8a44Azpe0jKypsjBnzc0RaHk3H9Jx4qsmOQC6eZ734YYhuGS7DcCVKIiI0u9GAKnw
         kmzZpyP0waiK5LJJOdRZkDYuJ73/fVCOZV6taQXE3LDCCiIw9tA4VuMc/0dI1ioSaWKK
         ggAfDx0IcERVfUnMOY3RvOBOk7wyR2fvfqwETgCCcdY9XSp64GCo63aFZSohrQiha7wR
         4SL7wsljGVX7iMEfHiQUCAmb8VHu0/S4nqzXgdsTU3PhlocvYd70EduGIeYrjVQzcWzn
         fs3l25NDVm4jj5Nn3Bx4hoxiZODyKq5535iMq4w0h94UeHNzNpbjRuxhsazrnCUQaiQi
         dI8g==
X-Forwarded-Encrypted: i=1; AJvYcCVtubTY3yVyGRZ7e0HKgkYki09V3nvohzC+7wrNXNEsjKlV17l9raFwKRv0xWFsZ/eilheI8+BgEbcS9g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxD9l7VfrokReB+a+604thMo5XENEtKhMjo8Nafy8tCviIMOVU3
	R6apdzzBWa4rrBr1alqZWeIobGlTHmTJy5cQuyRakngXMVXSkvcMR6t9
X-Gm-Gg: ASbGncuItk1EZWSncQhLCiv9iCG1KAhB6TKze6sJC/51K+1YMhT+GLjvfY6aGzjSgha
	a58NaKZ4G139b7zaVILVZyJIhsbKnpbNK9GXqlmsmXqzVLx1G2octxSwVE2xjpWaj8ZTvYflZ7z
	KIjO37x98HuGgu1hdsyLwd0Z6CNNOw86Lsj1x5qiCm9AWJCjD2EFsCGV/St0GC7AvtKQ5jHTnqp
	0bpvIkvQCrfz5tmJhRStrCJPdA5nhM6afnMePSkn73vZeQiDbUJi9ZWnVEu9xUWSG+8bA5euroT
	a/zSNykCqW64kvwwtoRBOLquzr8FGTrYllRHHvLoVcQGskhP/jOSD5pGm/BXrFZlX9qBYEI5PNB
	8efdOCBmv4hzM8ZP0raCmEwy3CbXENA88u+oXAOg37NRiIvvtgOrUYP1n2DAXABPkGZDVc86FGg
	WCElUwlK79E36V11Xx
X-Google-Smtp-Source: AGHT+IH4VFJdE+kDCVl6k0I6gA+Y4FWyXYx4XWrJNt2MQHubXgoRL2/ifVMDcCHlbJ/5611GH+xrRg==
X-Received: by 2002:a17:90b:3d87:b0:339:d227:82fb with SMTP id 98e67ed59e1d1-33bcf8fa579mr26874479a91.26.1761098149249;
        Tue, 21 Oct 2025 18:55:49 -0700 (PDT)
Received: from hilb.. ([170.254.111.1])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-7a22ff14a2esm13163188b3a.9.2025.10.21.18.55.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 18:55:48 -0700 (PDT)
From: =?UTF-8?q?Bruno=20Sobreira=20Fran=C3=A7a?= <brunofrancadevsec@gmail.com>
To: 
Cc: =?UTF-8?q?Bruno=20Sobreira=20Fran=C3=A7a?= <brunofrancadevsec@gmail.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Gabriel Somlo <gsomlo@gmail.com>,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] soc/tegra: Resolve a spelling error in the tegra194-cbb.c
Date: Wed, 22 Oct 2025 01:54:54 +0000
Message-ID: <20251022015511.7257-1-brunofrancadevsec@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

I aim to join the Linux Kernel Mentorship Program, so I'm currently a
ddressinng minor issues in the kernel.

Signed-off-by: Bruno Sobreira França <brunofrancadevsec@gmail.com>
---
 drivers/soc/tegra/cbb/tegra194-cbb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/tegra/cbb/tegra194-cbb.c b/drivers/soc/tegra/cbb/tegra194-cbb.c
index 846b17ffc2f9..9a52cd3aea65 100644
--- a/drivers/soc/tegra/cbb/tegra194-cbb.c
+++ b/drivers/soc/tegra/cbb/tegra194-cbb.c
@@ -1836,7 +1836,7 @@ print_errlog1_2(struct seq_file *file, struct tegra194_cbb *cbb,
 }
 
 /*
- * Print transcation type, error code and description from ErrLog0 for all
+ * Print transacation type, error code and description from ErrLog0 for all
  * errors. For NOC slave errors, all relevant error info is printed using
  * ErrLog0 only. But additional information is printed for errors from
  * APB slaves because for them:
-- 
2.43.0

