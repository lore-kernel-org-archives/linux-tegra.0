Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A27E12BE053;
	Tue,  8 Jul 2025 08:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751963312; cv=none; b=pS2lOMGVQyQ5TSSUpFOZWJaqQYlpSfotwZrTdwHkB4lzUx94N2hbVs8nqjU++JYE9pAlgKwbeonuPrMD08n2m5U+gmJBTgbrCdg1nY8yFoBFYQLwsR9OywiyOgKfkPpySgl2ip/zfN/B0vGKZyw1cqwJvNsJz6pSVm7gYbY4Zh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751963312; c=relaxed/simple;
	bh=thZx/B16725krqNG88NVn4yyd/QHJKujDFO0V1LTLdo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XHFAqAP+3ntgTSUPQ7ZafYjCFq950lheR/aIzD8wgZiZrL81Xf1iN5ZYuw1qpTqV+XhU8Id9p3u+GU7opwrKmYeMgkxcCL1J/uWsDysd2vNpiItCB/Wu01hmo6GWk0of8w/2C/5Az+8lctIBCes8vWOrPBzk57VKK3Z7uMSmQ4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cwWhUPMc; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cwWhUPMc"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-451d7b50815so32960595e9.2;
        Tue, 08 Jul 2025 01:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751963309; x=1752568109; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e3A242zS5MYAQYfJ5usGXncBXPwZ1AAMz4fXvSN5Omk=;
        b=cwWhUPMcKhHx4Mzjj7ULv0pEKYNRu2aLg1H2VV6IbyGj2Xx1n60tXYbcsCPirEn1Rw
         30EPnPhUgg6njJ7kG6vkEocBevUjAv7tEnG9uN5c7/86BVhxUoGOlGWo7FYHe/CtjcN/
         IOiiqHxVj/dD03oEVUUjSXL0IjC0gfXHrZrZast90Y39EEtFAIEWL8yGepss9EJ8FUfb
         zk3YcSiP50Ct4cFKhxHeHYFoinMpKEjBCeVbdY8ZsU4MgpP1ki6E7KgRCgM4K7tqJUEz
         AXN3eqzMY3FxHDu7D0Gb1126IR10usxRillBZIXnGYMyYhySrAQos2KLBlR6ETYlhBdq
         2Xxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751963309; x=1752568109;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e3A242zS5MYAQYfJ5usGXncBXPwZ1AAMz4fXvSN5Omk=;
        b=SwAo+d/un1lpYEVvnT2eimeir3sVBlaPCVJa2VXVts6FF9tBNAL4RC+vd/0aMYNQ2T
         A8HbEaFu9SeKbpu6HPZXhWNA72S2EFU1r1n6xR52AX4F9YS+MJXFY1DI0CIebNtR7xTR
         tMxC+z/5wzAGuAtrNjgcEPeJv+6UpA0doM9hMgVRZpBcPCCYdoVwccITT9YxA0fwKBm2
         CxgiLc+sLVqoxg73jUIKqQyRwGH27T8Ofq4G2QYFMFnOteb08KxH8XxmOY8mOZglF6I2
         NPr2ly+7vBKwZt63/8dRGqtZJx7Mk6Y2oEuGxkZpH0rJAUqFn+iQ2OQZG5dl/9jZmgRy
         AO9w==
X-Forwarded-Encrypted: i=1; AJvYcCVxYL08slEW5C6VftTSbQqE0fJsx8XVEwpaJdgFo5C7vfUCy66v+nJ8egQyFAWY2s/5TNB00g0TW+nP@vger.kernel.org, AJvYcCWSKiQSpWV+Vr1bH55ecN/90yu/7PF0Yksm54d9QkQP3mJJSQBPe+geB877N4A0t6CwUK2YBL4yhgI6KjY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5AcIPmwUaGGS5PYr8LoeIJpTpyl6PaZ53TAiB3pLikVOWyp+P
	R8aJk3+9GvUP3ZuKHafI2Aha2+a4gvrHVPnx+AMV8o++WuLzlqMat/4b46b2wQ==
X-Gm-Gg: ASbGncsJS4K9x+h9M/oFL3Kn3kzRCiWHoRz9G29KVfmZpNFVCM83zRzmeTP7mKEZ0G4
	esH1Ld384lCIUf79kIZwl2AnzdtzBj3qLvnQ5C683tSYtasLZQoQ9wwT8XyQaSLDbLi8Ha3Ri/K
	RvFcx4XbtBvdL2kLTZkzjPpFS3Jv5+W7lIymrXaa47g80K228EINEEkT5t/yt+pjFeaR2izr47/
	OawJu0ej2qQvGSXq+9YnGywm9et2XnxZRO6Ia7QQan+N3R8xQ/WZ64ePbtbEvDaEmUpN6foFshN
	BtHC1riRQIHm87leeu3cZ1XsFFxlM+7ATkPurM5fVWKp3k9unl384qCDyL0wA8VK42+HcSmdkJ6
	p9fSogF5VCHGESYhAxegUkG59nnjt8oHG9775kdEakQzAQl4oy8osnQ==
X-Google-Smtp-Source: AGHT+IFqMZRDLhvnw8G2AnPyFJea5WWnS/+DnHR/RTAqsR+1cKvrrb5iYIN0wdm0IoMdGl5fRhTgcg==
X-Received: by 2002:a05:600c:1549:b0:43c:f6c6:578c with SMTP id 5b1f17b1804b1-454b3122455mr168049345e9.15.1751963308819;
        Tue, 08 Jul 2025 01:28:28 -0700 (PDT)
Received: from localhost (p200300e41f4e9b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4e:9b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b47285c4f9sm12208359f8f.88.2025.07.08.01.28.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 01:28:27 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 4/5] firmware: tegra: bpmp: Add support for Tegra264
Date: Tue,  8 Jul 2025 10:28:13 +0200
Message-ID: <20250708082814.1491230-5-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250708082814.1491230-1-thierry.reding@gmail.com>
References: <20250708082814.1491230-1-thierry.reding@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>

Support for Tegra264 depends on the Tegra186 support, so make sure the
latter is enabled.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/firmware/tegra/bpmp.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/tegra/bpmp.c b/drivers/firmware/tegra/bpmp.c
index c3a1dc344961..e74bba7ccc44 100644
--- a/drivers/firmware/tegra/bpmp.c
+++ b/drivers/firmware/tegra/bpmp.c
@@ -836,7 +836,8 @@ static const struct dev_pm_ops tegra_bpmp_pm_ops = {
 
 #if IS_ENABLED(CONFIG_ARCH_TEGRA_186_SOC) || \
     IS_ENABLED(CONFIG_ARCH_TEGRA_194_SOC) || \
-    IS_ENABLED(CONFIG_ARCH_TEGRA_234_SOC)
+    IS_ENABLED(CONFIG_ARCH_TEGRA_234_SOC) || \
+    IS_ENABLED(CONFIG_ARCH_TEGRA_264_SOC)
 static const struct tegra_bpmp_soc tegra186_soc = {
 	.channels = {
 		.cpu_tx = {
@@ -884,7 +885,8 @@ static const struct tegra_bpmp_soc tegra210_soc = {
 static const struct of_device_id tegra_bpmp_match[] = {
 #if IS_ENABLED(CONFIG_ARCH_TEGRA_186_SOC) || \
     IS_ENABLED(CONFIG_ARCH_TEGRA_194_SOC) || \
-    IS_ENABLED(CONFIG_ARCH_TEGRA_234_SOC)
+    IS_ENABLED(CONFIG_ARCH_TEGRA_234_SOC) || \
+    IS_ENABLED(CONFIG_ARCH_TEGRA_264_SOC)
 	{ .compatible = "nvidia,tegra186-bpmp", .data = &tegra186_soc },
 #endif
 #if IS_ENABLED(CONFIG_ARCH_TEGRA_210_SOC)
-- 
2.50.0

