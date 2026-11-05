Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793887280;
	b=XFwB0xGBJlg/kUmqUdFQTT93+iMAQGauAnsLqcjWtSdgZr1d0N7WKgMEM6To8O8M19eP
	 R//yHbuehH1petRqpyyOnE8ua779HeHy2UheKh+YO7uWxrY3t0jSn0fLlY7nOx48Ar7/n
	 oT3hoWXPQxMWFWuzNYtIZDedg4hL26TPLEMg3HSlSpkPtu4oh4w8Um0CYcTi/90JHwtwr
	 MJOlg9KlOpNWO+25on29VNUBQ+BAtLJQsxqz/ZNH9dPuVX8V/30wGho3/VW7GGXsF2tss
	 9sTufDzWZQ+BocOOLekQqw7axIt+J761X+TguUh+Kfq3GNKveu3m/B/KKz6E0gQJubA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793887280;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=m3SlBj9C3fFyi2mB1vPCHBkBvVGhRO2V4RCAtxMQktY=;
	b=qiqnJGfqlW4ajRIF5KMpld6gL2C414q4TqcpkDXqiQU9wAXctFaCVBU0xZHdMae9LAcp
	 rra5G/Rs7x/Ztps0CKthfEJr2+KCOcpLDdtSa6BmW+OAiY5sHlLRnbH+cTqUftOorDeUK
	 Mc6bZbxtqzinRCM9Uq+APOcmfaiqbrW6FvR3KqfHHVPRZxZhLRJapaS84YEtIflPzjoQs
	 6YuTegVaTkgG4GDlf91xyAPjWS2TyRtci5qPLz642NFMpW7X/fLQxKhKOt8ki4xxbgKSQ
	 umxbGHvLgpq96bT3QWXl4Qn8+GF6ywpVRECj9llTAzW7JmrfNq5HGJjY39YKTKqCcZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aZmNibtv;
	arc=none smtp.remote-ip=209.85.128.179
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3C51606A33E
	for <linux-tegra@vger.kernel.org>; Thu,  5 Nov 2026 14:01:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3C51606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aZmNibtv
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-8b0ca1ebc8bso27751237b3.2
        for <linux-tegra@vger.kernel.org>; Thu, 05 Nov 2026 06:01:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793887279; x=1794492079; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=m3SlBj9C3fFyi2mB1vPCHBkBvVGhRO2V4RCAtxMQktY=;
        b=aZmNibtvLQCEM32b/zt5WhJQTtoH7O2Fwt3NwpEzwWk8Dw0keSlFx4cWE/8/7ToiLo
         ucpFUJ8rBVqgxx3UxS0rekV2RXJq64WC8ar6vyM8LWuUJJhLzFpB7RyB9D1uDwkmPexn
         0qlpkxO17m92xV93/T5C7qyM29GFaGjV3E5OSPVE71cAOwgnhwOrEPXkMhbR0QZupgQr
         Bi2tAVWD4quOTMIy3kF9w479vVx3PnzWV2eAnlZq1yax4DNEhpiu6yrRJM+nOIbhCPmN
         YGk9m/HedXdhK6fevC7rg09WCeGi2hTQAzS1PP2+FixKq4UBj0WreFEkhbS2KhVZEkW/
         mk/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793887279; x=1794492079;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=m3SlBj9C3fFyi2mB1vPCHBkBvVGhRO2V4RCAtxMQktY=;
        b=q41FvJNl7tAlv0PQOHvDEaURoxWfnKHeaccLyKwy4GLnJm2UJN8bxMwDU8buIKLCwk
         SBMDpL3971w3oLrvbCPHVaFCRIRmv2L5xwQfbqdm0DNItnzOMi8Y1xgT/dIWELTkycmD
         GOAJtuIRf6IVCfR8XEgkwjNDZUR33wix0KX0l7y/zYoPveEtCx5moiSIjLYz75xledsV
         5z3T6ST2zDelJk/SpKvn91hgy9WTn2EXMWoT3VZY0Ee7k6cs0p5m1F/bVLlifwq9skIq
         0+Ps+GIJ0Be6fvD3GyMXjpxdtMH4qv9lkaea0wZF4oMkoaEOYLy4/khzHCuIuoSuRMiB
         uqVA==
X-Forwarded-Encrypted: i=1; AKwUvBxfWEow9Rc/ORGX7o9CLLH6/YiSJ5f2XEH8LxEPgX6ZPbStgzytVaxwmkHKkQZofRNmSj+CrnbPC3+cWQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z+NeNbUfY2Op2wQjHutjIldEZQRHfbmdU2dKMxENIAnmVl1SsvL
	2fTKxivlbQDvOWVB9slWAm1kx5YBxETFIYXesw1YPCgLK0q69LDGaPVp
X-Gm-Gg: AYBFou04XOC7JtvMK2dVGt4OfByY3nZ+/1UaduA/BOwBn2XSqZ0qrtO4h8QvxZbki7I
	C4H0UxVOvjThOge2Zv8IaNgq224CrN7RLsb5b/bxP5zYAfO9Eugzocsd27/j0tXecXqg5vdbZwI
	11bpaFp3xYsJZy47nQyhh5zyMDR8HpBFuT76n+9OMkFs77IiJj7fe+Uyr0GoG6x9/MizxCs2nyR
	M0xvmBJealHPyZLvlOrdHA9uLlt/Y+8IoVpEs+cbvZogkgEEwsy9OGKukELwHAoPgfkFCCzH1zI
	QNfidwD0u7qwy1zVysyxJBmzSIdjhCaJRvrDNDbGsWt6ZMdF93Sy3AOqxJKlfHb20XkOX+ccV+p
	xMa+BHeeBrPclhgemfko01cPjCIydV5VcgjPJqE4eQr1PYCNx5imY63TFxv6LnEN+O/RNoTCheI
	XguPlJMVvNWIrN/bl8QviHqDaeGKrlnaveJxcc+6mP56iWkslmrIicF5dcHITPil1dtyOY1u+da
	B/wkN/ADayQx0i+BZJegKniCPEmlVCu+EKt8r5b5WM4es+ZA/aOPy753P8WiMIz/EnvolmFdwtV
	LwtDoJTIyUjuFp5t9TaZ2P9haKDqR3EluwzRxMV35reZUQ+kC8MEZlWyhT6p7S1RfI9YGGvXg+B
	7xkU2OJHuvSHC9JInchjVBYda2FFa467gM16+KPEdY9qqjyBBR0C7p5/XQCk2Y90X0RMIdOz0di
	WLI1lre7E=
X-Received: by 2002:a05:690c:a013:b0:8b0:ce77:8dcd with SMTP id 00721157ae682-8b2b67a446fmr105553857b3.62.1793887278349;
        Thu, 05 Nov 2026 06:01:18 -0800 (PST)
Received: from lab01.myowncloud.network ([2601:cb:4000:1c5:5396:7ba1:d08a:ebca])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b309959603sm41104577b3.24.2026.11.05.06.01.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 06:01:14 -0800 (PST)
From: Amit Patole <amit.patole@gmail.com>
Date: Thu, 05 Nov 2026 09:01:01 -0500
Subject: [PATCH] gpu: host1x: document the remaining host1x_bo_ops
 callbacks
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-kdoc-host1x-bo-ops-v1-1-cc171c9e36a0@gmail.com>
X-B4-Tracking: v=1; b=H4sIAByM7GoC/yXMQQqDQAxA0atI1gaMOhV6leJiZow1LRiZ2CKId
 3dql2/x/w7GSdjgXuyQ+CsmOmdQWUCc/PxklCEb6qq+EVUO34NGnNRW2jAo6mLYee5841w7BoI
 cLolH2a7po//bPuHFcf2d4DhOU1EOy3YAAAA=
X-Change-ID: 20261105-kdoc-host1x-bo-ops-7ae7a3554fb1
To: Thierry Reding <thierry.reding@kernel.org>, 
 Mikko Perttunen <mperttunen@nvidia.com>
Cc: Thierry Reding <treding@nvidia.com>, dri-devel@lists.freedesktop.org, 
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Amit Patole <amit.patole@gmail.com>
X-Mailer: b4 0.15.2

Commit 3cbf5e3c46e6 ("gpu: host1x: Allow entries in BO caches to be
freed") added a kernel-doc comment for struct host1x_bo_ops that only
describes the .pin and .unpin callbacks. Since include/linux/host1x.h
is pulled into Documentation/gpu/tegra.rst, this produces four
kernel-doc warnings during the htmldocs build:

  include/linux/host1x.h:159 struct member 'get' not described in 'host1x_bo_ops'
  include/linux/host1x.h:159 struct member 'put' not described in 'host1x_bo_ops'
  include/linux/host1x.h:159 struct member 'mmap' not described in 'host1x_bo_ops'
  include/linux/host1x.h:159 struct member 'munmap' not described in 'host1x_bo_ops'

Describe .get, .put, .mmap and .munmap, based on how they are used by
host1x_bo_get(), host1x_bo_put(), host1x_bo_mmap() and
host1x_bo_munmap(), and on the Tegra DRM implementations in
drivers/gpu/drm/tegra/gem.c.

The warnings were found by running scripts/kernel-doc over the headers
pulled into the htmldocs build. An AI coding assistant (Claude Opus
5.5) was used to locate the warnings and draft this change; it was
verified with scripts/kernel-doc (no warnings left) and checkpatch.

Fixes: 3cbf5e3c46e6 ("gpu: host1x: Allow entries in BO caches to be freed")
Signed-off-by: Amit Patole <amit.patole@gmail.com>
---
Comment-only change. Built with W=1 on x86_64 (drivers/gpu/host1x/,
COMPILE_TEST) with no new warnings.
---
 include/linux/host1x.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/linux/host1x.h b/include/linux/host1x.h
index e7ba601b2afb..7027adb9bff5 100644
--- a/include/linux/host1x.h
+++ b/include/linux/host1x.h
@@ -146,8 +146,12 @@ static inline struct host1x_bo_mapping *to_host1x_bo_mapping(struct kref *ref)
 /**
  * struct host1x_bo_ops - operations implemented by a host1x_bo provider
  *
+ * @get: take a reference to the bo and return it.
+ * @put: drop a reference to the bo.
  * @pin: create a DMA mapping. Implementation must not touch the bo's refcount.
  * @unpin: destroy a DMA mapping. Implementation must not touch the bo's refcount.
+ * @mmap: map the bo into the kernel's address space and return the address.
+ * @munmap: unmap a kernel mapping previously returned by @mmap.
  */
 struct host1x_bo_ops {
 	struct host1x_bo *(*get)(struct host1x_bo *bo);

---
base-commit: 05441d697f7f9a927264f4058cbbc6a03dfcac9d
change-id: 20261105-kdoc-host1x-bo-ops-7ae7a3554fb1

Best regards,
--  
Amit Patole <amit.patole@gmail.com>

