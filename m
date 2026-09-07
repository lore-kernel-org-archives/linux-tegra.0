Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C362440B38C
	for <linux-tegra@vger.kernel.org>; Mon,  7 Sep 2026 06:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788763662; cv=none; b=vBJl7oKxEra64W2zFomWQs1ndIaDu3XCvxtMpz4D0Lt1yWtYcgsX1ORW8IqZGlrMEELy5QArvUz19HwMC0CYaK3+d9zqNkN64q5uz//ox4+z5uoRUX85qvv91qhy8RgTKVqgz3Q+002pT3dxl+9GcQGJZPyUowIPZ3uDvY5/ln4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788763662; c=relaxed/simple;
	bh=Q3bBIxz90yEEYsWH5ikWyXfUpYba5QGg5QwQbHT02IE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WcW7QqxIXcUyie08QGbmiQwdCti3YS0b0iYMGeIOgPcs4p6dZRw3CY96b+60c2g4o0ICxz6XmiSWe7mSDyL2gAhnwrXzsfL917CMWN0Lor698xG2RIM0zo7Tp3pp/HUxuHlVmzCYPn4qdGGBr5jVa0vTIUGb5L879QwWSmuY+as=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KAZsVs8m; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KAZsVs8m"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2d94c868ea5so32370625ad.3
        for <linux-tegra@vger.kernel.org>; Sun, 06 Sep 2026 23:47:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788763660; x=1789368460; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rh6WnyF7wCSbyOvDJNwh7JY6+tMlKujEj6rsY7bD4mU=;
        b=KAZsVs8mh7GDKrQAO6O6sFD1lealyJfsfycKd4Cq8TDv5qJRo2Xv0wNqiSeksip3Jo
         bwaG3maYCK0tnc5KilVd1m53J6omDjYYFBn71RxoIQn2CjnFrZid49ZKQGlVORxQXQ4w
         3EuR+ppm5eOflUmC3jMnalDFXyARUu58qNYhC6WPGNF3VwWzx6L02Cx+4pq2qxgM6SbI
         GRZZgP026U+q7V9bSSs7Kb2SDFe+0hz87+JGgLz9N6gsHe4Cy7Xg9Uu/nYOxbahxER4q
         PD9R9MH5gP9ZU/kkKV1i5mf2HjR19R+PZXTecqVEkWMSuD7YDtCw/JMxaIZ3gYBTtH32
         0YUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788763660; x=1789368460;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Rh6WnyF7wCSbyOvDJNwh7JY6+tMlKujEj6rsY7bD4mU=;
        b=hbjR/dGFjSJilF2Z3UTCoJNLT4VfgTV+26oHWcbOe58eiemq7amBffObOQkCxhMcpp
         IT94y+Al8UH4Dc5nRE1oXpIDJJCDqgJuk0p2Ce8CKBBQAKOjd4hvcvpS71ye4Q/vuu6F
         hEdjuVylRFIW66A8TfFbQOSTQr3OTXDHr72goe162r0YQ+8V/ICkPRYTpCjydgtv2/Vn
         eHBU7jVB1QjJJ3okyjHBkPjqLILQE27Sq9y+J5hbAFwNxeM7IuuileOV/AHxvasmzGlt
         kQvb/SNxz3R5p0lqvkcekiNoApI21JTrXW9rwVypdJHZ5p8OiAjPyAIZLq8/Tt7jGJ1e
         QKeg==
X-Forwarded-Encrypted: i=1; AKwUvBymlvG25DLncWwLBSC8qHSY3zdSM1o5ct38M5Xwmsfj2sS/YwZ6z1RPuAX+9X9l6SUyFQADju5aqCXi3Q==@vger.kernel.org
X-Gm-Message-State: AFuF++lZRD/Ym7Rv8qggfy/dqa1oVjS4SVH60947AtqylcULrCi5Wroc
	vYLd0l0/jbNMGHWXCIymPUptZfSS1qB1wt+C8D4AIDxC5+yravkd/OUu
X-Gm-Gg: AYBFou1Xve1FszF/Fk5AGL99jQbEZg5o8pDhqQNgRpuOOYqtrOXbqKVKTiBGLq3UyjN
	tGHJ1+05BdrPS+nVmmK67zRrF5920m/ajm7uD413zd4tS5w95PtPSMy0Bob35jvhQqkdnWJv7ar
	DUX3zcqGMQ6ppv6fPJb/EVzCqzHRC5yhKaxb7ldMNKS95maQnGD58v37rTQp71MDog8fXXw4bMP
	2l6orez38bEV976Ih1QCWDsHZNZqjAlOp6HBEgiENwKyKypVCT34LVn0QNUEKJjmWp8f2E+MYxV
	8A7xpzXo0zmzcFrL+Io681WT3SInYheucQIRGjeFU9U20DrPi3LOXcFYHMR2ietr/cQpCVVBjJt
	DxA2VbOu4jELVzJN8nrlTBMFsmgKP/H5wB1Ab/6l+11xkJqi6DbJFc4SNBK4lweTsiduzZrMswP
	tQPJp1lIwWdG05Va49tLKTeOXFA/3D6XzclJ/6ybBAOTSnhZ8MkCyeGP8YiqnIVjSW57KEaKcN7
	iUGCcWYd6vy1g==
X-Received: by 2002:a17:90b:5790:b0:398:9bd5:4910 with SMTP id 98e67ed59e1d1-39b2624f0ffmr31452068a91.23.1788763659995;
        Sun, 06 Sep 2026 23:47:39 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-333c9db92b1sm24811158eec.9.2026.09.06.23.47.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 23:47:39 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: "Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Eduardo Valentin <edubezval@gmail.com>,
	Keerthy <j-keerthy@ti.com>,
	Christian Loehle <christian.loehle@arm.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-pm@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-acpi@vger.kernel.org
Subject: [PATCH 1/5] driver core: fix typo "sucessfully" in comment
Date: Mon,  7 Sep 2026 12:17:21 +0530
Message-ID: <20260907064725.10686-2-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260907064725.10686-1-hemanth.selam@gmail.com>
References: <20260907064725.10686-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct "sucessfully" to "successfully", reported by scripts/checkpatch.pl
using the misspelling list in scripts/spelling.txt.  Only touches comments,
no code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/base/power/clock_ops.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/base/power/clock_ops.c b/drivers/base/power/clock_ops.c
index 59bb37e8244c..3b8ba27802a8 100644
--- a/drivers/base/power/clock_ops.c
+++ b/drivers/base/power/clock_ops.c
@@ -250,7 +250,7 @@ EXPORT_SYMBOL_GPL(pm_clk_add);
  *
  * Add the clock to the list of clocks used for the power management of @dev.
  * The power-management code will take control of the clock reference, so
- * callers should not call clk_put() on @clk after this function sucessfully
+ * callers should not call clk_put() on @clk after this function successfully
  * returned.
  */
 int pm_clk_add_clk(struct device *dev, struct clk *clk)
-- 
2.48.1

