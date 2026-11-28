Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795880121;
	b=utgfX9nim6N9jZiUWJAoj57fOUssi6rbO8xBSP04sy4e3rMsTel6VCd/e+3TFMCu2GWx
	 hjnDUdZ9Mpc0wKkqRytyBx9mrrbkPTidIQq1DTj+mNZjKr1IC+imbrgACJ9bkq/WY5tSP
	 8VqT43vf8j36pjXUEGPOy1wBkgGiYeWi6TToc7F6tghTXbYzxBb+NZBqFU3NlXM93W6SF
	 XeTqF1rQnfi2qs4nfMW4axTuBwD+hmvCUDS79caxv3I/4mi1N1XXet5TJCie0c37uyvCk
	 795DI7VYbkoZCaefLCQy7ievBQPtzgPG2Jz7tq0eJdfDfxsuTLpSaZm+SPqT3jFTjMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795880121;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=2gzKBHAENFoQ+wCxaZUD5NGLvIPO/pOAHR4djcvLRmA=;
	b=h/je274EzFtZF1zXiJGZSP/rpAFHC5xtWwra3xEENybt2WWQvYugxOihj2VOit+Mlv0S
	 pi3jg2kN8Q9l4vUN8iHrGrltj5ZB5Pa3cIAZJ9ECGlG7pQBdyFCcrj+TY6NdWwuAW8ojF
	 qANqOi9wRovIOA9Dx5DVmWHfDpT5eNJ6dqbdpRynK8cjgo7vSCicMNWyFtFzkMVu0QIcn
	 iRFI0EIQrqhpV5u3d4i1vvnwyhl7amT6zsUNLLDd1D6pkE8OCLLoir07KSjfplY//EvQ7
	 F2IqhWu4+FwDlFA5kf+GNzSs0Bh0IGPN8yiqDrlLfAa/V+9DYuLTFrzIaurkDMySFVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eSzKkzeO;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 108EB606A323
	for <linux-tegra@vger.kernel.org>; Sat, 28 Nov 2026 15:35:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 108EB606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eSzKkzeO
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4bba5e17cbeso34974535e9.1
        for <linux-tegra@vger.kernel.org>; Sat, 28 Nov 2026 07:35:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795880119; x=1796484919; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=2gzKBHAENFoQ+wCxaZUD5NGLvIPO/pOAHR4djcvLRmA=;
        b=eSzKkzeO9z6ZPH/q5qorpyPTPn4WuZHmBVaecx4fZ133hEzbLQ8hzhw3e+1cL/jHV+
         b+aFf8/emiwyCttfw51l2cD36l6NcLK0RSxp7Lw5eNH4WkykPrjhQT+m8PjCa4hZx792
         IyddtYl4UjOKQBkzIcZERVJ4Fo5IB1dXbEV68i/2btl+IDS9LIRINnDNybb2qozYgriv
         fNKkKI21G2bgO5GsUBOMPjsvd56e5C/veidLUojEF615Rm2RugrIfnmEO/2h0osWG3zZ
         2U3BGO58ec1Uz1Wi+hwDr4NpFWkXwttBNOM+0YMzWrDxAxE8ZtDiNDUrpTyj5bv1Evz4
         gr0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795880119; x=1796484919;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2gzKBHAENFoQ+wCxaZUD5NGLvIPO/pOAHR4djcvLRmA=;
        b=CFyyEtowXQhUC4L2PC2LIWIr9zQTkNYhOQEl1XbgY+JmxccEOj5oTYwwzqeGnLO1vw
         OrbzhqZRlDKfcihN1nzv/sljzwsWZGrfoWYp6qyySeFhcGKMg4OLTdQP8Qvoxde6zOFr
         jODiSTFqEDvZf45nW8IgYG3rig+mfd4cI3C5Gn3kAccANFH064B7DimMJsY2hcbivlGM
         t9Xs9NyrCtoBfu904o9pXS/c6jd9f65w9bs/LZhPektexRCUZjXWytNeQxbWhl6g82bA
         L7MS9DCKMh5V9IoXaUxtoaxInchhNTWSBRz/afcXv+8MEAwQ8DKd05JypIfJajqwLEJH
         rrmg==
X-Forwarded-Encrypted: i=1; AL+hErGZfjO4wQhJ8+PfCjsmI4NdbdjNTqN54HR8QTgTmCiEGzD7aPesVQqoejQ7Vq38o12MnbPnHHQfpUcmMw==@vger.kernel.org
X-Gm-Message-State: APuU4Z/CwB3BO/+VJ2UNhJFVcF72LuWqVF2QR19Ev4P7h2PPsUjQLy6L
	f+5Y635f3OoM9fKapvJfHHvUigkTooBqZDxSpvZ5hVhgo97J74oCOn3A
X-Gm-Gg: AZFdTZf1Ija1K1c80aChsAwuszgPjC9HmKyEMxzU544FFoybQKX9N1TUcBUMouBUg/s
	14L1zkCmhsEVWYiPiwksHG6gTgfosvOub0/Fn2PiIrykT6q20P81TBCVg6vDtZc5fU+P5YnX1xx
	kC1jEUWITOz9lL/O0Pbv4MmuV3WPa6wzdxnGHHfBy1YkEyc+tS2gtkhrrKRAoslkk+GWyr6ygNL
	bBEdKHS1vRR+6WiRrc97EwMMjNG3jmgyYPhiBGuSwhGzS8VORVqP1N+uzmEK7jnQQ5AOkM8UX9F
	bz5bP0UnBDfcSsNy0ijySs6r2HfeCxXN251aMels2iHs/wjIUVXdhNrvcdWfnT/3M5YWProzTz6
	PBFrago4N/ejluacdWiDnLjx0EtBTqRSUZldLgx31e7XYR3jUGr5V67PF57r44orocnTSDXq4GZ
	VfDlKx1HpjkDLS3Je+kQtFMQlAgpS+vfb7BWWQYVZhw9usK8egbSDJFqJN5Ke/u7gzlc0Tvh0AP
	QFU1x9JIpvLUIIvIzpdsPdtU3+wUfU2ePmYUFj+IeUx2v6ElfIoV5k3/L4NTg1kw4esX11QwEal
	wycMAnOub9PBRp7LpGC4zS14bA3heB4MnXADN489
X-Received: by 2002:a05:600c:4e02:b0:4a4:4d57:8462 with SMTP id 5b1f17b1804b1-4bb88812b1cmr556620835e9.24.1795880119211;
        Sat, 28 Nov 2026 07:35:19 -0800 (PST)
Received: from [192.168.0.15] ([2a02:a312:c59b:a180:251a:f25f:80fa:af1d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb9067846esm561359015e9.4.2026.11.28.07.35.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 07:35:18 -0800 (PST)
From: Artur Kowalski <arturkow2000@gmail.com>
Subject: [PATCH 0/4] ARM: tegra: Fix warm restarts on Tegra20
Date: Sat, 28 Nov 2026 16:34:56 +0100
Message-Id: <20261128-t20-soft-reset-v1-0-0db458c5996b@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/yXMQQ6CMBAF0KtM/ppJ2oqE9CrGBdSpDAsgnWJMC
 Hc36vJt3gGTomKIdKDIS03XBZF8Q0jTsDyF9YFICC503oeea3Bsa65cxKRyHlx/SW5sr9KiIWx
 Fsr5/4e3+t+3jLKl+F5znB7VTWRZyAAAA
X-Change-ID: 20261128-t20-soft-reset-fa083c0b45e4
To: Lee Jones <lee@kernel.org>, Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Hans Verkuil <hverkuil@kernel.org>, 
 Dmitry Osipenko <digetx@gmail.com>, 
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: mfd@lists.linux.dev, linux-tegra@vger.kernel.org, 
 Thierry Reding <treding@nvidia.com>, linux-media@vger.kernel.org, 
 clamor95@gmail.com, Artur Kowalski <arturkow2000@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2489;
 i=arturkow2000@gmail.com; s=default; h=from:subject:message-id;
 bh=dU0F1WkbTG8tFNzFBXxX/HgRAHkTJjQlSwyPPAIbYfM=;
 b=owGbwMvMwCVmYeTc/TaVxZzxtFoSQzbXl/UBP2p+Kpy3rF/9YXNZ3e8iixmz5b98nOivaGb/b
 5JvR9jejlIWBjEuBlkxRRazh0JfeOZ5vd/wcmsnzBxWJpAhDFycAjCRD/aMDLs+LZzxss7hRKui
 3pyuTSq9LS3/3ynsOPfPWHdJtlVgwFpGhmt7Ty4T0W3/9cbL2pVdJNx1m9NZo10d5yd0PYhasMB
 xIwMA
X-Developer-Key: i=arturkow2000@gmail.com; a=openpgp;
 fpr=F60710C8D69E03A01A2801CD87A47D20C2709637

On Tegra20 boards with a TPS6586x PMIC, every restart is a cold restart:
the PMIC restart handler has a higher priority than the PMC one and
power cycles the whole board, regardless of the configured reboot mode.
That includes RAM, which makes pstore unreliable, and was the main
motivation for this series. Testing has also shown that warm reboots
are more reliable on my TF101: on cold reboots the board tends to just
power off, which breaks automated kernel build/deploy/reboot loops,
while with warm reboots (and the latest U-Boot) I haven't observed any
boot issues.

This series does three things:
- it fixes warm reboots on boards with a TPS6586x,
- it registers the PMC restart handler much earlier, so that kernel
  panics that happen before the regulator driver is brought up are able
  to reset the board,
- it improves the old workaround for the boot ROM hanging on a warm
  reset, which now also covers emergency restarts. Without it, boards
  that don't have a PMIC restart handler, and therefore reset through
  the PMC, hang if the restart was triggered by a panic.

Patches were created with help of Claude. I've tested them on ASUS
TF101.

---
Patch 4 is a cleanup of the old workaround, requires patch 3.

To: Lee Jones <lee@kernel.org>
To: Thierry Reding <thierry.reding@kernel.org>
To: Jonathan Hunter <jonathanh@nvidia.com>
To: Hans Verkuil <hverkuil@kernel.org>
To: Dmitry Osipenko <digetx@gmail.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: mfd@lists.linux.dev
Cc: linux-tegra@vger.kernel.org
Cc: Thierry Reding <treding@nvidia.com>
Cc: linux-media@vger.kernel.org
Cc: clamor95@gmail.com
Signed-off-by: Artur Kowalski <arturkow2000@gmail.com>

---
Artur Kowalski (4):
      mfd: tps6586x: Leave warm and soft restarts to other handlers
      soc/tegra: pmc: Register restart handler from early init on ARM
      soc/tegra: pmc: Power up VDE partition before restarting Tegra20
      media: tegra-vde: Drop warm restart workaround

 drivers/media/platform/nvidia/tegra-vde/vde.c | 24 +------
 drivers/mfd/tps6586x.c                        |  3 +
 drivers/soc/tegra/pmc.c                       | 99 ++++++++++++++++++++++-----
 3 files changed, 86 insertions(+), 40 deletions(-)
---
base-commit: 8d7fe9885c62fc9a95bf55d9db244d9672a8aadc
change-id: 20261128-t20-soft-reset-fa083c0b45e4

Best regards,
--  
Artur Kowalski <arturkow2000@gmail.com>

