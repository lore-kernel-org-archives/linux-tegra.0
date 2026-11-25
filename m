Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795627227;
	b=TJlne2BUo2WVzOkJSyoKyRS3zKA+0qgI43UhUBJTS8BmT5yhCJljTSz1VMvSYkmWYqHV
	 a+UpkuREWnKedQM8Gl5N/I0/ZYNe6COAWUyWghEroSlQHC/QPokNUvGuYvGsJ/dkyNKd8
	 6DtTX420UhsLdllCgr1qc77zEtiUgnKgAcSqcBUNa6/hqxeA847RQvC2jJULGTdYprdmj
	 DzteQ9fiBry8+tBDCei76HqKubLOdutcZuT/UoYrLs+FqZmlAINoXMhSmbdt35sIFNgSx
	 kxjkmg+ACaDtkmBZEaRJau6i2dyr1/4GY8EpytX8WRCENO0KqxRxrI4lv7Eub7TgFZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795627227;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Qz7iwpD+T7mmeMKXzktrMNh0w5s186HdlphGIpLEmgY=;
	b=vTCtVspnmqX3etabxXOPzlUggfbWwATYDCQ0LgDOESzCh1isSzRKZXEtIILA4v1Hyjmk
	 H14yq//oRJsMb5gT+dRXvGqTlr3348kLdi62Lbk1XzOYGREpGvJBHhC8iTKJG9J8Gv/nq
	 uPVTq/WM0+icEtq0b58J+kNB6FCRTweKIb8+jY/RWMYQoq8MjX6VltpPe/MEqH1DM6oib
	 YrPlOCqOQHIJX3PNeJYmxE2Fyns5UWlS1fYdL209MiR2+7lug50Ecz4u3OVksH9zDBbka
	 wNtpUcOoDgyaapnCrk8WBpAZxQLn7plotPHQFzh552x77GqDyViSNwvVYi4jQBz8fxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="lC9r/a0u";
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C20F606A321
	for <linux-tegra@vger.kernel.org>; Wed, 25 Nov 2026 17:20:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C20F606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lC9r/a0u
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-386c4d2e2ccso3379720eec.0
        for <linux-tegra@vger.kernel.org>; Wed, 25 Nov 2026 09:20:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795627227; x=1796232027; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Qz7iwpD+T7mmeMKXzktrMNh0w5s186HdlphGIpLEmgY=;
        b=lC9r/a0u2sIwOi3TRlxPQDOagS68l2RVkFP90XIzYLTdcNtaXrLLjG64z1uJtDbjC+
         rN17cA9BQAEfV/NtS4hs97ZyClcrTNQz2oKmTkhhwcQi+uP1dksDG855oNzyA1DwZm2z
         xuwhIB6lPA4zocJg0Ji0a4YFLqFmp+gr+52ohREpbmWcN7+Bsd7jPVMicssmn7+iJu8g
         2j7UvPw2T2fqfG0MUNVWJb+0cJlVdzRAK7tOESFSSqhDuSJVgtt6E4j5lPUOuCkks4Nm
         3lbZ0Mn//ImVCI4AYVL9gnHN2xyKyHTAHeD+tFSlu/L/+HyeUM24eKsWkwDllfchPL74
         AehQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795627227; x=1796232027;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qz7iwpD+T7mmeMKXzktrMNh0w5s186HdlphGIpLEmgY=;
        b=htmJpWIAww+Ndeak4TBTXqnYA7zDAQrI7d6GqGbhEtbTd/JxEYUVal9XKjPj/QZ1qD
         4luHYHbi9PvSRu6bAVT1bGTLEXFIKjuid1Tl2yKMQec+kwIBFYFjdgLtzbkMo+kqiqaL
         +1e1Ch+VMj2Gzw3jW8nsHxnlcsU4/y9jWNM2osnZU8/RdtOrsPJXKFuUAibSCRkVpa7V
         oJUxyOnQ8K5URg5AzPviT5VyFClnoDqUU4afFXB93UfJWmhh4Pa738eVqCn7YZcOGZ1M
         iW/iY59SEc+VrHHqil7l0tyLZCW+e1nYQ6HhOf58T1i2U56moKPj3986GXNrBPN9Y0AK
         EuqA==
X-Forwarded-Encrypted: i=1; AL+hErHyKQvSDPYTvE/nOxMJBn0SRriluLiOCPv//p82YNIdZ9LN63T6myvQjZ1xICdKNGHSCTCb6s0nLm1YZQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z9WhkWAFZJS/1DXqwD8Ut9UWDlIS3nEIqEEvhO1JDzcvcYzKWbc
	R0vq/yCPay/+8CeGd41RGKxLlfN+nd/OBIgBS9illZA/l9elZnr2ZI79
X-Gm-Gg: AZFdTZcxZAFdHoqNwR04Gm6/C7xrHAavOb0st4Tr4+u2Z4YKPnAZToK6+NmBe1EuDAK
	/y1jUv+SwHCGJ/SkL3EhoigzHt53KIQj/SdPg4wVSe4K+HScVeI2NqJv+yshLHS/+0xikPjKVDy
	DUYKl+Ar3pFoqI58Je3Jurg6fvwFfHhOW3n1hhhknGmWeJLzJSzfHfJbyjpY2JRi8hFSJBtJYX5
	UewJX2pJgZcukRL/CNelAR6KZpcKmXmKiLICStX28x/nfVK2gd69CYeka1LZYI+nr98lfnFQA00
	vyNCSqlfliU61H/uKidzg/+W7O3OEZr8pfzMa6t9nnGlQG/QEi4cB33UEvZy3n2HMyALziUoC8c
	hUOAnxlsi/sYL6Ym8/ssMV0C31+tI/QUgJRSttPsvWlO+6Bjr0PfkvwTMRRXeCc/p1N4yR+bQhG
	pBczHwVOAQSoZfN7M42Cxi5KCXboDhZPSvV2YgpQDtiQoMphLdrhk9e09eZ9XMx/FQ3acUAKHp+
	vpO4e7+cZMK+WHJGEhmEm7K7xlvWX3ikrQLOF0vObndXWk9rb1RWayIsYlbmp2ktYz350N5y8TK
	HeV5VA6GEzuc+b8/vd51
X-Received: by 2002:a05:693c:42da:b0:386:95e7:8497 with SMTP id 5a478bee46e88-38695e790e1mr15040048eec.28.1795627226405;
        Wed, 25 Nov 2026 09:20:26 -0800 (PST)
Received: from a1-free ([2603:c021:8021:f000:0:1865:8c38:18fc])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567daaf70sm57637757eec.28.2026.11.25.09.20.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 09:20:25 -0800 (PST)
From: TAKANO Mitsuhiro <takano32@gmail.com>
To: Thierry Reding <thierry.reding@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	TAKANO Mitsuhiro <takano32@gmail.com>
Subject: [PATCH] gpu: host1x: Document the get, put, mmap and munmap operations
Date: Wed, 25 Nov 2026 17:20:22 +0000
Message-ID: <20261125172022.2344949-1-takano32@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

struct host1x_bo_ops documents its pin and unpin operations but not the
four that take a reference on a bo and map it into the kernel address
space, so kernel-doc reports each of them as undescribed:

  include/linux/host1x.h:159 struct member 'get' not described in 'host1x_bo_ops'
  include/linux/host1x.h:159 struct member 'put' not described in 'host1x_bo_ops'
  include/linux/host1x.h:159 struct member 'mmap' not described in 'host1x_bo_ops'
  include/linux/host1x.h:159 struct member 'munmap' not described in 'host1x_bo_ops'

Describe them from what the implementations do: get takes a reference and
returns the bo, put drops the reference, mmap maps the bo into the kernel
address space and returns the address, munmap unmaps the address that mmap
returned.

kernel-doc on the file prints eight warnings before the change and none
after it.

Written with Hermes Agent, an LLM assistant; the author reviewed it and ran
kernel-doc on the file with and without the change.

Signed-off-by: TAKANO Mitsuhiro <takano32@gmail.com>
---
 include/linux/host1x.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/linux/host1x.h b/include/linux/host1x.h
index e7ba601b2afb..411a1c84eb61 100644
--- a/include/linux/host1x.h
+++ b/include/linux/host1x.h
@@ -146,8 +146,12 @@ static inline struct host1x_bo_mapping *to_host1x_bo_mapping(struct kref *ref)
 /**
  * struct host1x_bo_ops - operations implemented by a host1x_bo provider
  *
+ * @get: take a reference on the bo and return it.
+ * @put: drop a reference on the bo.
  * @pin: create a DMA mapping. Implementation must not touch the bo's refcount.
  * @unpin: destroy a DMA mapping. Implementation must not touch the bo's refcount.
+ * @mmap: map the bo into the kernel address space and return the address.
+ * @munmap: unmap the address @mmap returned.
  */
 struct host1x_bo_ops {
 	struct host1x_bo *(*get)(struct host1x_bo *bo);

base-commit: b6a9fa34ce4187cb69d3c588a4bbffc31ce5db8f
-- 
2.53.0

