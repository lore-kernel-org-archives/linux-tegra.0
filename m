Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A1EF197549
	for <linux-tegra@vger.kernel.org>; Thu,  6 Jun 2024 14:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717685242; cv=none; b=UMHGYAeOXstlmpBMKZd29An4io+1Pi7pkv79YaSEnl3cV1RzIRur2+sjKYAl3XH0+a+OLFt5bm0wBnD29QVufEW/5E6g92cbKzIJhbS9O+MvMSX4o6JQSJ0GDNUtG6V7qXG8XF9jtnRgQ4om/55emX2mnJeJVQR8htm3Mm/PTdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717685242; c=relaxed/simple;
	bh=Ebu85krfGAChaJPN4EWzYaxvNmXdtfqRBv3rancPBps=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pYiJlIz7rh/FACRuE7z1LEbxei7SVJ4vc7MXzDOOcKwGDtQhRxAwO2WyPbtsH4Qv8EYrK4mvWnHC3oj5RxhuCIRM2i7dDNERRlyd2ujjphkvzlvsAD8iw7rc0tzOoSUnYrqKeXlzDGzr0teSk1Gcrq5ydHx71+kYGSMgFdVm3a0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Rst/WW5d; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Rst/WW5d"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-35dce6102f4so914329f8f.3
        for <linux-tegra@vger.kernel.org>; Thu, 06 Jun 2024 07:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717685238; x=1718290038; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gAMNxXiwwiKZelOMcLP7GiR7QCh00iHenVieTh1hHYA=;
        b=Rst/WW5d/29/I/Vr2/+k6YmH2fJwASpHqS+VlNCgjKWLa2J1mZlq0I0lUB7g4bvy9b
         ByGUx3oAQw9s8yPA/b3gtx7mrk8BUlT7t/yjET/IsGpz4GgzFDHRcfjiTKNraFfhM46N
         kIdzJeooAO+kQ7GPOAscsmIv2UGpRJ4OdZ0/w3Ylr+b0adz/pkXzC1rHUSz2jaSrtZ3d
         pMNoM4oc4/v0b0oVij62+E6ob8RQBjfUw/3NqBGHvug+9+4ARnV7uM9kwuSaZIzppPad
         sc1+DIX2P5cP55ic5B8zUwmQDv76dfXg8O6j+z88FMa8eU2XOnq7iAf8UOpOyFBVhKwx
         apOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717685238; x=1718290038;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gAMNxXiwwiKZelOMcLP7GiR7QCh00iHenVieTh1hHYA=;
        b=BfJrtn53vYeX6feGE4GObltMpddgV3dFJl4N0RSORUoyMD3kfNiMDP8rdMWfV6oSBL
         FJB4ZBVHFCuJ1UWkhxdT4L/J7E93P7tWvvZTpxnoN3j5yFaB4UoH8UEgsAnWz+KiSZsN
         c8U+70/TgGRCfqO88bqlpxy+ka/+wGIZ/hdGliL7C4phNVMQsWIxkF5xWqRtxPXHJ3w4
         fJMRL2if7u4RriuFPy7Prgb4kIxoo0jfoBqB7y4/SUE2JvpiF4aIy6ASd5okdnQQ8z+j
         qtAK+H27XCEeMbsOrhw6QT7VxzNxiQzS4Ttg04Vpv8pvnzQsmfNU22Jtv7m3reKLIjAm
         xqpw==
X-Gm-Message-State: AOJu0Yw46bAQJDnxuhZMpgm8WMbdPGhyUbvoSlnnOKpgdNAgb4UK1VPl
	cI2MCIhv0KLQTwXr5XUCH+j9GiOIKP4dcDeN6TjdLadivQLW7vugXk/QzfO+5Q0=
X-Google-Smtp-Source: AGHT+IGnRw7gclR2L13bttoMoqC/Ze9nXxsoh8QiaTGf4ppoKg3RVMfE+/mGMpwFjtl27lSycgHujw==
X-Received: by 2002:a05:6000:1250:b0:35d:c98e:9823 with SMTP id ffacd0b85a97d-35e8ef9702dmr4218356f8f.62.1717685237987;
        Thu, 06 Jun 2024 07:47:17 -0700 (PDT)
Received: from localhost.localdomain ([2.221.137.100])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35ef5d4729asm1746386f8f.25.2024.06.06.07.47.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 07:47:17 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: thierry.reding@gmail.com,
	jonathanh@nvidia.com,
	kees@kernel.org,
	andy@kernel.org,
	akpm@linux-foundation.org
Cc: linux-tegra@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	linux-mm@kvack.org,
	Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [PATCH] mm/util: Swap kmemdup_array() arguments
Date: Thu,  6 Jun 2024 15:46:09 +0100
Message-ID: <20240606144608.97817-2-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

GCC 14.1 complains about the argument usage of kmemdup_array():

  drivers/soc/tegra/fuse/fuse-tegra.c:130:65: error: 'kmemdup_array' sizes specified with 'sizeof' in the earlier argument and not in the later argument [-Werror=calloc-transposed-args]
    130 |         fuse->lookups = kmemdup_array(fuse->soc->lookups, sizeof(*fuse->lookups),
        |                                                                 ^
  drivers/soc/tegra/fuse/fuse-tegra.c:130:65: note: earlier argument should specify number of elements, later size of each element

The annotation introduced by commit 7d78a7773355 ("string: Add
additional __realloc_size() annotations for "dup" helpers") lets the
compiler think that kmemdup_array() follows the same format as calloc(),
with the number of elements preceding the size of one element. So we
could simply swap the arguments to __realloc_size() to get rid of that
warning, but it seems cleaner to instead have kmemdup_array() follow the
same format as krealloc_array(), memdup_array_user(), calloc() etc.

Fixes: 7d78a7773355 ("string: Add additional __realloc_size() annotations for "dup" helpers")
Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 include/linux/string.h              | 2 +-
 drivers/soc/tegra/fuse/fuse-tegra.c | 4 ++--
 lib/fortify_kunit.c                 | 2 +-
 mm/util.c                           | 4 ++--
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/include/linux/string.h b/include/linux/string.h
index 60168aa2af075..9edace076ddbf 100644
--- a/include/linux/string.h
+++ b/include/linux/string.h
@@ -289,7 +289,7 @@ extern void *kmemdup_noprof(const void *src, size_t len, gfp_t gfp) __realloc_si
 
 extern void *kvmemdup(const void *src, size_t len, gfp_t gfp) __realloc_size(2);
 extern char *kmemdup_nul(const char *s, size_t len, gfp_t gfp);
-extern void *kmemdup_array(const void *src, size_t element_size, size_t count, gfp_t gfp)
+extern void *kmemdup_array(const void *src, size_t count, size_t element_size, gfp_t gfp)
 		__realloc_size(2, 3);
 
 /* lib/argv_split.c */
diff --git a/drivers/soc/tegra/fuse/fuse-tegra.c b/drivers/soc/tegra/fuse/fuse-tegra.c
index b6bfd6729df39..d276672838465 100644
--- a/drivers/soc/tegra/fuse/fuse-tegra.c
+++ b/drivers/soc/tegra/fuse/fuse-tegra.c
@@ -127,8 +127,8 @@ static void tegra_fuse_print_sku_info(struct tegra_sku_info *tegra_sku_info)
 
 static int tegra_fuse_add_lookups(struct tegra_fuse *fuse)
 {
-	fuse->lookups = kmemdup_array(fuse->soc->lookups, sizeof(*fuse->lookups),
-				      fuse->soc->num_lookups, GFP_KERNEL);
+	fuse->lookups = kmemdup_array(fuse->soc->lookups, fuse->soc->num_lookups,
+				      sizeof(*fuse->lookups), GFP_KERNEL);
 	if (!fuse->lookups)
 		return -ENOMEM;
 
diff --git a/lib/fortify_kunit.c b/lib/fortify_kunit.c
index f9cc467334ce3..e17d520f532cf 100644
--- a/lib/fortify_kunit.c
+++ b/lib/fortify_kunit.c
@@ -374,7 +374,7 @@ static const char * const test_strs[] = {
 	for (i = 0; i < ARRAY_SIZE(test_strs); i++) {			\
 		len = strlen(test_strs[i]);				\
 		KUNIT_EXPECT_EQ(test, __builtin_constant_p(len), 0);	\
-		checker(len, kmemdup_array(test_strs[i], len, 1, gfp),	\
+		checker(len, kmemdup_array(test_strs[i], 1, len, gfp),	\
 			kfree(p));					\
 		checker(len, kmemdup(test_strs[i], len, gfp),		\
 			kfree(p));					\
diff --git a/mm/util.c b/mm/util.c
index c9e519e6811f5..6682097372efc 100644
--- a/mm/util.c
+++ b/mm/util.c
@@ -139,14 +139,14 @@ EXPORT_SYMBOL(kmemdup_noprof);
  * kmemdup_array - duplicate a given array.
  *
  * @src: array to duplicate.
- * @element_size: size of each element of array.
  * @count: number of elements to duplicate from array.
+ * @element_size: size of each element of array.
  * @gfp: GFP mask to use.
  *
  * Return: duplicated array of @src or %NULL in case of error,
  * result is physically contiguous. Use kfree() to free.
  */
-void *kmemdup_array(const void *src, size_t element_size, size_t count, gfp_t gfp)
+void *kmemdup_array(const void *src, size_t count, size_t element_size, gfp_t gfp)
 {
 	return kmemdup(src, size_mul(element_size, count), gfp);
 }

base-commit: 2df0193e62cf887f373995fb8a91068562784adc
-- 
2.45.2

