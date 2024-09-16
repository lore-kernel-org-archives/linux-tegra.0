Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E6EE14F9E2
	for <linux-tegra@vger.kernel.org>; Mon, 16 Sep 2024 13:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726493613; cv=none; b=ilvp91CS7M8fud2cPWgRcqX7RQRqhVfUdWGzfSoxb/9QsTU0Y1pMfjUpw7ISxoOoXUCL1mVoLgpwd2B6JT5OXDbOeBvxS4tgWn97yZS01Wu3L+Wl95hN53qm99nn649b5wfQcDsa0bETdHPQtwBX8TzfFvioyqzJeLdpkYBODYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726493613; c=relaxed/simple;
	bh=WKa4RiKVs6l0csU6YPeTspcG9jLqzAm77UA+cRDG194=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ka3YIiqqFHyGlvNf2paetrnIJMebJJPpDVgnkhEc1i18RRKmxDJaKNI7UIqIFbtz5cRkpv6MtdlSOatainS68yJZ1FpODCjpdL7MIa+EL4FbxyTFUbcdRbogrIUHAxno8+YMemY3zba6XVMCSbP+b9yBfbMZ7XG/GQjqPaQBxBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lNq9qZIo; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lNq9qZIo"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-374c1e5fe79so3346918f8f.1
        for <linux-tegra@vger.kernel.org>; Mon, 16 Sep 2024 06:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726493610; x=1727098410; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MmSpMtpE7+PdGOwOLX2Il68el4nS80XCM5+NcfYSgJc=;
        b=lNq9qZIoRuWX7+VVnicaUIO6WhLLI2TbqKxusIG42G6nOfmy4u7gasev5kCQVoJiur
         sRszmuv8oEfCGrHrZKI9Q5jQlmA3WuZ05G4D5NAE2Kmlymy+uHBd9yDqSzflfL3dlwCH
         Sr/aWNnfhX/3WMmW8sbyNrG5AU8iW/O1ELmM1QLpX/I4PUWg1CseVM0FGcLNNmsdRtBx
         tj1tnp8luBj6TrBQ0QkpaPovyx8UhuK4cFP5RtnmX+1ivuEvFZmLqWJEl7O0O/HKg7iH
         MbRWYOdNQNElpZ8oghTa6DppuccaI8iui+7L9SKO2hjbPFK7WZgBwFNla2Ot9mDjuEIL
         9OdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726493610; x=1727098410;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MmSpMtpE7+PdGOwOLX2Il68el4nS80XCM5+NcfYSgJc=;
        b=mQh9TUbI82KjULQevCyF47BNUeyMb9FYV2bx91ur+ZlzNSJkrzJ9b8bU06mRjxCrKO
         8MVha1Nyla4IJTi7WkM+eXYZayUPo6zs6ZoA6qTJi05Fj5sk8HjQ5Pto7PkLKluLWMBA
         KJcTrp3JfMUSQHWCxE3O0spd4Bd7WEEfknE8lb6E+EJPbx55flILDUDEv3mXrfZt64+B
         vSxkDjeTjEPAIl9pdZaMBN3TKIX8x+EvV+TMdWJKTkzlxQn47mB0HSGvXv45bhlxKqsX
         da8jMr+bAoSkDp0tbukPrY4xFUASnnq2txfqky5Z/SzM00ouQPA6cJr7Qww6urQ/HNNK
         FRgw==
X-Forwarded-Encrypted: i=1; AJvYcCVsEULV6mETC8qAJsGteRwjKlGDOiwDe/wDO/id8LiFTIPOTRbur2ap1TfXCUm8cWYsTDezX9Ceett5QA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyr0hACG39cbDyaMXzfCyNGvUcVcO+6uqFXa44sykMf6xj5AGqJ
	aBD2oSPvwMHPuI9609k3VOTKSSgk75Qt1T3+ckQqRNdUstAQ3ZdQ
X-Google-Smtp-Source: AGHT+IHR0wIl9Oj5JquBhyuv+6M1hgFteji/fbjd5SFUk9TqZ1PuyEtD5Yavk4+q4arRJWHycSMLdw==
X-Received: by 2002:a5d:6892:0:b0:374:c1d6:f57f with SMTP id ffacd0b85a97d-378c2cfea56mr8745501f8f.7.1726493609356;
        Mon, 16 Sep 2024 06:33:29 -0700 (PDT)
Received: from localhost (p200300e41f386300f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f38:6300:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378e78002a4sm7340662f8f.78.2024.09.16.06.33.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Sep 2024 06:33:27 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Jon Hunter <jonathanh@nvidia.com>,
	Christoph Hellwig <hch@lst.de>,
	dri-devel@lists.freedesktop.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH] gpu: host1x: Set up device DMA parameters
Date: Mon, 16 Sep 2024 15:33:20 +0200
Message-ID: <20240916133320.368620-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>

In order to store device DMA parameters, the DMA framework depends on
the device's dma_parms field to point at a valid memory location. Add
backing storage for this in struct host1x_memory_context and point to
it.

Reported-by: Jonathan Hunter <jonathanh@nvidia.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/host1x/context.c | 1 +
 include/linux/host1x.h       | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/gpu/host1x/context.c b/drivers/gpu/host1x/context.c
index 955c971c528d..a6f6779662a3 100644
--- a/drivers/gpu/host1x/context.c
+++ b/drivers/gpu/host1x/context.c
@@ -58,6 +58,7 @@ int host1x_memory_context_list_init(struct host1x *host1x)
 		ctx->dev.parent = host1x->dev;
 		ctx->dev.release = host1x_memory_context_release;
 
+		ctx->dev.dma_parms = &ctx->dma_parms;
 		dma_set_max_seg_size(&ctx->dev, UINT_MAX);
 
 		err = device_add(&ctx->dev);
diff --git a/include/linux/host1x.h b/include/linux/host1x.h
index 9c8119ed13a4..c4dde3aafcac 100644
--- a/include/linux/host1x.h
+++ b/include/linux/host1x.h
@@ -466,6 +466,7 @@ struct host1x_memory_context {
 	refcount_t ref;
 	struct pid *owner;
 
+	struct device_dma_parameters dma_parms;
 	struct device dev;
 	u64 dma_mask;
 	u32 stream_id;
-- 
2.45.2

