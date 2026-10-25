Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792955009;
	b=WesqkeUU6r+Vax2DlMcg5rXWU7nOnQKIrWdw9FVCdL0n5/OaguOLyajAtETweoYUTNdN
	 L8Gn4lQnwmg1lWB5eRa6W6AJ1rW2r+PbfIuraOEJiBA9A6dsS8z4tXIXhuwzlf+yuJCfk
	 LoK+i83Bh8tx998u8n6BNPRkzObIjAenQm2S+wCL271vggddG28fywFzbShQRcbfBQnoz
	 w7IpAQgdWzFRrfJw1+1Fusl9e+Xse8tNCjIQRTw+QdI9I7ym3/258RZMTXww7PwwY+gE6
	 BBzQT0nYb8HGtFZy6ngqZM7+rX5e2a7/GCFe//fZ5EZNz5Tin3WF57Mz3aTe9VwFQ9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792955009;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=q59lJgdWrMpG/habggsWMdIWbeODWVZuLoi+lIAY/g8=;
	b=oW8UP6ApnFTCjmFSTzZSmdz49FlXP6k87LyMyVd7wtoDiTWWyskbqBTUXpMhMspnHl4x
	 EbhVTrTe1tnHdOolZ4lbt5agH5/AjKbRG8kdtF/UzO6ajTGOFxNq3C96Qx16iduVG8qg5
	 LWTFEIsAFBmBjdDLsuo6hR2e/c4oVIp7YNx7vXahUQwXrxNFbA7BP6z+M33+x0pDA4MzY
	 DSifYwkGXXNQKgujxCr1QGSctDl/ZN/0VuSJX1t9PGwErlDXx2z/iQowQhhw1gRmqTW5i
	 8lZRH4tA+DTO3/OfCCGqppMKjxK2BBh4R1KeTeORAq9tQbYQNprHr85NTYaUMztrtVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=m9mi0h2g;
	arc=none smtp.remote-ip=209.85.208.48
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5D10606A31A
	for <linux-tegra@vger.kernel.org>; Sun, 25 Oct 2026 19:03:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5D10606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=m9mi0h2g
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6ae14eecc64so3065608a12.1
        for <linux-tegra@vger.kernel.org>; Sun, 25 Oct 2026 12:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792955007; x=1793559807; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=q59lJgdWrMpG/habggsWMdIWbeODWVZuLoi+lIAY/g8=;
        b=m9mi0h2gQNuCwL8zMMugt+VnUvZrXgIRxDikvAD9F8zTtfs633f+Mfv2E+bT31fp2d
         2QuNGWX9adBEQAcp+EQUVQsWj0Kcj66xlcnkeog4xF0GugGG0rZxc1KPV7mIL0YiLKYS
         V//+TgUIewtGadLyJLwglNPT+yXBT7uFObBD8yDhAl8cVL8E+e93MYjCPzsOdyfzBo19
         utQ6X1fF5He8yfGk+iPj5UwH0eQypnoAhSxwmRCzYKgFv7XGAk4pb0QJw75xdd09VJbl
         Fj9GNNwLT4gSiczEeXNGGd3ccE/vQ8Gf+qPs3rcBE57xIhY8W4PEE24AsiKb/CGRNhKr
         gAFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792955007; x=1793559807;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q59lJgdWrMpG/habggsWMdIWbeODWVZuLoi+lIAY/g8=;
        b=Lf6yv8dWBMaj+4SHa5EisNo6m2V8JGIptZ8/lYTHISHt9Y7nNA7XoBJYkLQSTimkKN
         j4q+Tpnd2FJsOlhFK7lWn7Yvw6WuqnRvYLEDo/CKm7U6IVEEIHOeKO+iV6k7s1DH3BC4
         LD/45BZsfnLsZkOsPHeVgvipGs7XQA+nIL9J9pO3nKGNb+BtntJ+JyK+SCT3mnfDB0dc
         VqUIy+QDI/q3iUcxdOzDlTwSc9uscEDo04ezyMRYNoCOLTWcKhLMy0E4TG4swvJI6SPV
         V6AcKWpDV4kA4UpZGwuEME8lSbBib0jZ7XS7ua/wlCmArovBFoGoicRlDc0/T7haiI2N
         2+Xw==
X-Gm-Message-State: AFq9FYJnDIG2OBmqCTItwTdWRx1yWo/lolgPY2C2Vuyp8FGsxiOJCXjl
	NFYg/jyWlMWwy7UE24k+idlExP0pFAmE4Lk5pnMrV0p74MGUG3LxzvIWzdOmu2pGG5Q=
X-Gm-Gg: AYBFou0shaNXDLPJ/ROUPtt2B/3ZCiVnNu06yZFGK9RlcOUPSmrxLY3jbTN3fesjyW0
	uU8BDjWJ1iWyF4vutV5oFJRWSz8SzV6qbT2MNgxiHRlcwiYTnGDkBTcCg3KJXYZLcIxLIMXXKnZ
	QfxCw8vurhDu2msQDO/xEtqyzylVOlsDVkzZEoBQqXCG7VqEyi7uP4jjwq+BC80SmCsqZmh+5eC
	O/9EnMan/Tk0nlSUed4N76n8cTi571n4HRcKvUVvuMIGkgIDY82nGEWwIfja324JE7FpyOgHeO4
	TGHsUlGUMTtgfYDVJ2lrPCMhM6QAFlPR/OizgXu/3BjGfehHuu6FC6ZDvqFRvHUGNtEUlZ3qx/n
	vwBZ2Ph/IpPUv30j4ndtZZAExIY3vZxr3E5Bi4QZtVHmtlbA/vkV7lhqKkZySPjyW1APLrfeGpz
	wTh8CZ+asD4Fiffj7B03KhEnb8gNGHp1O7HCDcfV9yA1ZLc77YQ/yAdVyKmwtjzKCBQrttNZJkC
	A7YmYgz6W2VRY5gBAf6hEQXWDpDkKggcSb8R+agnL2djmV0icHZEG4PnVBShMmGARgn7U/KNA8/
	ulMLwTVD8NSg9gVSwR3N5jPTO0fU2ykofEr1mzRT6GfGBGovacQkG2W8klPg7RsENDWMmtl2FeL
	AtmY9wUi6vhi2aTyPjsxRRUcp4LPcIGzz6Q6edGX2VMLlllyZI644zexwIuwd6QoJkg==
X-Received: by 2002:a05:6402:2390:b0:6b1:f575:1687 with SMTP id 4fb4d7f45d1cf-6b443000478mr3814182a12.27.1792955006928;
        Sun, 25 Oct 2026 12:03:26 -0700 (PDT)
Received: from localhost ([2605:59c1:3500:c210:a19e:c679:44e8:e9a])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b44584ad9fsm2754839a12.0.2026.10.25.12.03.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 12:03:26 -0700 (PDT)
From: Selby Mashiki <mashikiselby@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Selby Mashiki <mashikiselby@gmail.com>
Subject: [PATCH] memory: tegra: fix device_node leak in tegra186_mc_probe_device()
Date: Sun, 25 Oct 2026 21:03:22 +0200
Message-ID: <20261025190322.449324-1-mashikiselby@gmail.com>
X-Mailer: git-send-email 2.56.0
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

tegra186_mc_probe_device() iterates over the "interconnects" phandles
using of_parse_phandle_with_args(), which increments the reference count
of args.np on each successful call, but never drops the reference with
of_node_put(args.np).

Call of_node_put(args.np) at the end of each loop iteration.

Fixes: fe3b082a6eb8 ("memory: tegra: Add SID override programming for MC clients")
Signed-off-by: Selby Mashiki <mashikiselby@gmail.com>
---
 drivers/memory/tegra/tegra186.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/memory/tegra/tegra186.c b/drivers/memory/tegra/tegra186.c
index 442edb2b0..0df5b5658 100644
--- a/drivers/memory/tegra/tegra186.c
+++ b/drivers/memory/tegra/tegra186.c
@@ -146,6 +146,7 @@ static int tegra186_mc_probe_device(struct tegra_mc *mc, struct device *dev)
 			}
 		}
 
+		of_node_put(args.np);
 		index++;
 	}
 #endif
-- 
2.56.0

