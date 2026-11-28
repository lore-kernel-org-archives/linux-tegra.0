Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795880125;
	b=bm6ofctB2Ms99YRZpd3XwiMps+cqI5Pps5OLSixG7R5alV6v0oVwcZKKPpLe3bfpGDOn
	 4pJNl9wj/Bm66htgW2MUpSLqmqmClQcoOP8jJVjfLBH1dCZ8E89yon8JtmI3N7Ij+LISl
	 Qtl3U6e9XsTET3DZWpWODo5+jH6e7VIZNFSFVfT2n1WiJZTzITD5tcZvXL+2jyDgcs9hJ
	 Ym0ro7p+d+VG+9BCurJ/iGqQRSJZWz9WEFVlSHYaHSZ6ZJbdHzjGT2reLv7vGjphT+XJO
	 J9HAJIjQH3Sa7ei0YONnhwWZ2zoY7WQMiHryv//4XZHeXUMnCDDwBV0YFil0uN9lE9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795880125;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=4UNIcfLh2UmARAy7gKdF7vRyfbS9uaHEze4ik/95PcQ=;
	b=fhcw5ouuaJyw9fzpKwGSXHcHBa82hauwhYPOtcbk/uBMqa9HyYVc/dw31inmr6MYG8D/
	 z5vucFd3fAZb2iFpFueVPWrpY9iS7EwhQ9LRbtnXRCJQwuRhc5shQoTlPWoWZk7Vz2myM
	 DQj4fl+jNkDKFrRgH5lavoiZyNvgfobiDHdOlKUqUe8qhSpzkkyTFxifjymHlHZIp8L0Z
	 ttKylfCONvL69WxYXv1mDalWpoeMAg3FkjdsjUjm8mjiTcJfK97wEjzqzxicO8F9RdBvs
	 PICaV/LNtd03WthD7UUJE6KnD1/I+2dYa9NzBvHfUUSOGNKdpoPBS8PsEPRvWleOv2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X8D70t7Y;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D122606A323
	for <linux-tegra@vger.kernel.org>; Sat, 28 Nov 2026 15:35:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D122606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X8D70t7Y
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-4a5024b3c28so5683511f8f.0
        for <linux-tegra@vger.kernel.org>; Sat, 28 Nov 2026 07:35:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795880122; x=1796484922; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4UNIcfLh2UmARAy7gKdF7vRyfbS9uaHEze4ik/95PcQ=;
        b=X8D70t7YzynWqvpBu80kvugfAAPkuzNiG/M1kd1gbDUL0bl2Z03/nJQuPmVcjst3KM
         XdU+Qw1H4I3ihxX2uUF33/2R84qK4z+/BJNYVWqX30MRGK7ROL7QRHCMLYw1Q5ho7y8R
         AEk9oYLYAfYd+p1maz1Eff3xM9sYwbNI92j5DootxIZ3yN6vqawtSlbpTDA1aVVY8FFK
         xt3CnjnhvIkkvZdLt1PbCGjzaBqlfH+2xZ48zFVlgKnouYm3zAzePoPFbkCdaLuFhSSk
         s3MA4kHOjzj+SdklGwl2+ONCSvU+Y+ML6EHWaA9CiOas/dpQHJomkmZK8jbJsXYE4IKh
         xcUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795880122; x=1796484922;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4UNIcfLh2UmARAy7gKdF7vRyfbS9uaHEze4ik/95PcQ=;
        b=d6XUVZ2Sbl6Y2Oa8d7HcdHob+udRZx6+FzXK76r9Xj7VWUeb9kO6ljQzekuw25q2qu
         RzimCf2bpVvHQPca5TE4NiJOFypHlzaur8CS5k9ktMmqS7EF5CYHmmeIYEKRgexsLftj
         XYuXSXt23OfWjZ/+liTZACYNHMnX3v4vd/rzSk9LgWQi8D2Mj5kLDVEe1ZMol8UhoMVu
         sj4xa035RROpfdq6Y3OYOY74oJTxDQMgC1qtDAhiW9x0gv/HDDJ/kgombhGqosD/zhyg
         5qe/2MAWwx9Q8M+U76GcZN8FzHwZUvNhPznU18HXi82SprJBd1qQmaNVCcqZIOco/ce+
         g1Jg==
X-Forwarded-Encrypted: i=1; AL+hErGbYUe9hfUPiqcEL3S2yvbMSNaRFekDDtukWIl3oAGSui3nRDBPHrigo6IVvuLJMSOVQFA9Mq5vf464aw==@vger.kernel.org
X-Gm-Message-State: APuU4Z94cSR8LAqEgo/jnVNdoUa2PyLLHOOt35wT0DpsC7EXN3BaQtoj
	dsRTlCDF/fQ+p0yZ8e1GCWyoK8iwL4OOT5QzGMNWap97QCCGqk3kybUj
X-Gm-Gg: AZFdTZe/+jO6TgrJGMUF7AtEZAA6MB8ApT3MmIsjf4KoxtH12nLV1EbEYovPbXjXkYu
	eQ+SuW0WDdt19EChKmvaJWlG5Pzv/wGblSHjZ6Y8+E4jzRCV04C7jqb8WmOsuNq1q4bWLckbBE5
	W/p6693PWZxflfstNBMyRg/4LV0GXbG/hAUpgwWf2BN21sFDw5EwAInfYNHcQRLPy/pg1m+dL50
	43201nnNC55KzMboypzfxIpqYsnbXYcOoMTEf8jZ7MhCPVcZn1gIQScGrvkcMlH7txsHxbxEihc
	sXKXQJYggZOlzbMdeeZQTHae1JZl4r0x1v9DJeJ3+kdmyjoy9m3POxz0w7sNjIXtiQQqNYKkMZS
	uZFHNGlXVj8mCIWWWyQHe7xtCeuPUkgcVxiyO+r6jmbgQy2Pc3uxYJ+dpgr2Zl8ZXxuQ+DhgmF8
	J1qy7kkLLiRJ67z9N1Bt5DeWn/UgaUmki6YYpcoAdnDAeWVVZ0oYsaNdaV8Ivn06/TebVq8StVc
	lVfadQPEYiU+1erqo1uq3c3YyTlbTVFBaA60aB5SGTtJ8CmrrinksrwHGJvOEyVD234HjMLyq7j
	9AYdnxWyyofn97lqwOFxuAh09QngDer2vjhdeqxy
X-Received: by 2002:a05:600c:4504:b0:4b4:a551:681a with SMTP id 5b1f17b1804b1-4bb887fc396mr571761385e9.3.1795880122490;
        Sat, 28 Nov 2026 07:35:22 -0800 (PST)
Received: from [192.168.0.15] ([2a02:a312:c59b:a180:251a:f25f:80fa:af1d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb9067846esm561359015e9.4.2026.11.28.07.35.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 07:35:22 -0800 (PST)
From: Artur Kowalski <arturkow2000@gmail.com>
Date: Sat, 28 Nov 2026 16:34:58 +0100
Subject: [PATCH 2/4] soc/tegra: pmc: Register restart handler from early
 init on ARM
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
Message-Id: <20261128-t20-soft-reset-v1-2-0db458c5996b@gmail.com>
References: <20261128-t20-soft-reset-v1-0-0db458c5996b@gmail.com>
In-Reply-To: <20261128-t20-soft-reset-v1-0-0db458c5996b@gmail.com>
To: Lee Jones <lee@kernel.org>, Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Hans Verkuil <hverkuil@kernel.org>, 
 Dmitry Osipenko <digetx@gmail.com>, 
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: mfd@lists.linux.dev, linux-tegra@vger.kernel.org, 
 Thierry Reding <treding@nvidia.com>, linux-media@vger.kernel.org, 
 clamor95@gmail.com, Artur Kowalski <arturkow2000@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2874;
 i=arturkow2000@gmail.com; s=default; h=from:subject:message-id;
 bh=1FogJzqzHqWpDAjuCweRHcTK3ViL2zXlOiygHcXOspQ=;
 b=owGbwMvMwCVmYeTc/TaVxZzxtFoSQzbXl63hotdPHJj4Qa2g4NqnKVxrb9lt2dU18b8s462Xh
 vxlvRU3OkpZGMS4GGTFFFnMHgp94Znn9X7Dy62dMHNYmUCGMHBxCsBEGPIZ/vBubk5wqHlinHI8
 ufDsya5Ss9teUv8Eg26KFD/lKo6b8oaR4YyB2NSN96+zaR1YYbrL5/9Hm0luNd9yW1/s1s46mGz
 ZzgYA
X-Developer-Key: i=arturkow2000@gmail.com; a=openpgp;
 fpr=F60710C8D69E03A01A2801CD87A47D20C2709637

On 32-bit ARM the PMC restart handler is registered at probe time, which
is deferred until the core-supply regulator appears. If the kernel
crashes before the PMC probes, it won't be able to reset the board.

The handler only needs the PMC registers, which tegra_pmc_early_init()
already maps. Register it there, using early_pmc, so restarting works
from early boot, and don't register it again at probe time on ARM.

Also switch early_pmc to the new register mapping before unmapping the
old one at probe time, as the handler doesn't take the lock.

Signed-off-by: Artur Kowalski <arturkow2000@gmail.com>
---
 drivers/soc/tegra/pmc.c | 25 ++++++++++++++++++++++---
 1 file changed, 22 insertions(+), 3 deletions(-)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index 721e9596b07d..fcd9a644d97f 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -3090,7 +3090,8 @@ static int tegra_pmc_probe(struct platform_device *pdev)
 		}
 	}
 
-	if (dev_to_node(&pdev->dev) == NUMA_NO_NODE) {
+	/* On 32-bit ARM, tegra_pmc_early_init() registers the restart handler */
+	if (!IS_ENABLED(CONFIG_ARM) && dev_to_node(&pdev->dev) == NUMA_NO_NODE) {
 		err = devm_register_sys_off_handler(&pdev->dev,
 						    SYS_OFF_MODE_RESTART,
 						    SYS_OFF_PRIO_LOW,
@@ -3168,8 +3169,11 @@ static int tegra_pmc_probe(struct platform_device *pdev)
 #if defined(CONFIG_ARM)
 	mutex_lock(&early_pmc->powergates_lock);
 	early_pmc->rate = pmc->rate;
-	iounmap(early_pmc->base);
-	early_pmc->base = pmc->base;
+	/*
+	 * The restart handler may use early_pmc->base without taking the
+	 * lock, so switch to the new mapping before unmapping the old one.
+	 */
+	iounmap(xchg(&early_pmc->base, pmc->base));
 	mutex_unlock(&early_pmc->powergates_lock);
 #endif
 
@@ -5182,6 +5186,7 @@ void tegra_pmc_enter_suspend_mode(enum tegra_suspend_mode mode)
  */
 static int __init tegra_pmc_early_init(void)
 {
+	struct sys_off_handler *handler;
 	const struct of_device_id *match;
 	struct device_node *np;
 	struct resource regs;
@@ -5235,6 +5240,20 @@ static int __init tegra_pmc_early_init(void)
 		return -ENXIO;
 	}
 
+	/*
+	 * Register the restart handler here rather than at probe time, so
+	 * that restarting works before the PMC driver has probed, e.g. on a
+	 * panic early during boot or while the probe is deferred waiting for
+	 * the core regulator. The handler keeps working after the probe, as
+	 * the driver hands its register mapping over to early_pmc.
+	 */
+	handler = register_sys_off_handler(SYS_OFF_MODE_RESTART,
+					   SYS_OFF_PRIO_LOW,
+					   tegra_pmc_restart_handler,
+					   early_pmc);
+	if (IS_ERR(handler))
+		pr_warn("failed to register restart handler: %pe\n", handler);
+
 	if (of_device_is_available(np)) {
 		early_pmc->soc = match->data;
 

-- 
2.56.1

