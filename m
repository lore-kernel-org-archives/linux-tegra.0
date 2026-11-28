Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795880128;
	b=LxeRoz9vqLZKK9s3m92gdfuFMrRXs2+W+iF7VgMtU7Yl1FCLNfm2EDh1VRqePB6YQBIE
	 KNPi1OEGARMsnYHfigaJe5krB5A9PvN0ndKqc1BaZFlMqWcFXgQX5u1lDiVLBju9jNHWm
	 MQX3e2tX08sIHq/vu51FnU/7Z2pLF6pQwCmwThKvpbbZ6ZCQjwlDiF+fLFzO9SzX+HhIq
	 wmfFLGAl+z6g1rblNq0rKYBB2ZgsdnsqPqkzN6zJAfe6wvTsxRT4dEPoYglEfEkYNLNSA
	 OGsOzbhMZZlhsERf1NvR4deQ8jdgrIbJf60ti6CpdydKl4tUmLyzUy6qrn37zF7bSIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795880128;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=cfftNM/o6/uERx2scyV8aMPrgBR3cRX3BHVyMUstbh4=;
	b=3ZDFk0IUNby2rZQt3ALr1t4IAawKatGOtRz6vja0BURlYP1cQ0cXJ6LbSgM1cOG5o9Eu
	 JQ4ZF/+ouhnGhUJ/e/Da27E9lYO/EYsfIXKhG4Bw6X3JuOHmx6y1umCjDP5swmwxiwFDG
	 oQGe5KEGPg8vhHoQBpVcI8R3DRGJGtp7rVeLXarDrIN5/wF4ErHI7Q9OKtyNVA3ukVtNk
	 zGNZbwxHmTbKfccSODvX3is0e0PzkDT7aemM5WoKQCxW0ydRTSGKPag3PN9/kMFdRN5fF
	 updsrmL5VZxn98UdeoAjSC4cr5s2OpL4tpWRewXNaYAfAGLJ2Sf0mjnI/kI0kCTb5bA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pKfIYDPC;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A13A606A321
	for <linux-tegra@vger.kernel.org>; Sat, 28 Nov 2026 15:35:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A13A606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pKfIYDPC
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so92166385e9.2
        for <linux-tegra@vger.kernel.org>; Sat, 28 Nov 2026 07:35:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795880126; x=1796484926; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cfftNM/o6/uERx2scyV8aMPrgBR3cRX3BHVyMUstbh4=;
        b=pKfIYDPCG1CqekvZklsaC+7dg20spjbGOEwXkA0yIDKykb64+/yXCAAppvkcXwlPmC
         wvUhxBDIlLUKTcybvMBEd0YhuFQ708HvgEK+cS+PczYut3pq6bO4RN4Tw4weSiSkkKnk
         ilsuLWhLYf+NX7/POoDkBWcY3BR8Yq0Z+ricI++hhsOxv5bkHOYQj7pqCf4BA5FjRGq2
         Q5reHggiCwqqzT2BdQQPfMachHtuPFXv2QLWrrNAO1UWoAiedZTz8NAK8um1sQ7QHbfA
         A0QufZBc/5Qy6P4bclYXGHqEU2Ubag6CWP00mQ519M3Ur91vJ/zRQe2FKzDywiGhXQBS
         tBjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795880126; x=1796484926;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cfftNM/o6/uERx2scyV8aMPrgBR3cRX3BHVyMUstbh4=;
        b=tYoqmPAE2lL2M7yWvjqjAJG0ClR5EoN41fmRM7Gr/zW8JqXbU4eBJIZexvOMI0pmTH
         WI36xUtHZMG9S+duRN8yB+kNlgRjHbFEnHuH+uLVjuXTv4pFLY46BNHm1xQR/Yw/+dPR
         Ys1LVcV/MvTOa9MjooTHJcAhee48w+eOrofcfMJUhhOHHzqWGSnhLdJ//gy91BMx1b4Y
         KtsSarCNK1WkGGl9ovjXprmveoPc/d5Xe2cZrSGU2L+7R5DRPQbqU7GUM3SsNC9Q5n/u
         Q7riuNOWsWCDZrqCBTS0/mlKAJxsdOFeIcOagk39QLqgaw7L1RXVH+rDDgIEm4vywx0M
         /noQ==
X-Forwarded-Encrypted: i=1; AL+hErGLk0heUa4zrLyAwBBwOyT3oNV0RLKC0sQkDaPgPv40t7Z3cQEvuqiPwYBPiMwfp1GQ02dvfTpsYPGF/w==@vger.kernel.org
X-Gm-Message-State: APuU4Z+oMjsad81U0XmeIpHX4T1jJj18jeKeF8kfSPc6lu/866FXXV1j
	XFz1g5cjjMOpke4RbUrF8/V5WJSUuCnX35bJDSHRnMPCfQgVK8GOTlY0
X-Gm-Gg: AZFdTZcz3mW25qXll5BFdD2NKliTkFxsn72Pezj7xw3Drwv/wlSjiL6/6D9P2tY/wIC
	Q0POIhfi3h9ITLVFgQti7L/OCXBTDZ33pN+BrfWTSJMPJNCjCITFwzZ9fMUsmERWTaxPnOaChdk
	ORhJ9Atbj7l79KltHMxq19Zz2s4mroOWhwRac1OK/58bWWZlY8Kp96i4gDUipswyB2qf47pQoGR
	Dz10LQ5ixdng3ka2RbMpoagrm0YUorsKDPt1dEdFGrvHC60pRQhnnS+47GIiJlqkUN9MxB1y/+k
	YHqcrEUdpHSnfq2laYFURn9+xxDp4T+06TkLUwu9hrbbOPfd7HIL7jPn5tL/uNaAgDobQhnC7LR
	hv8NAZ6HxoAvZtj6v/qrw6pREQNAyiHFNXQDTZWRtW+DjaxtHJ6M32rSCUZHn+wdT7bVsUGE4Cm
	6JxO/RrADTB1HL9H42Yz0N9TYEiJH1nHpqIJ0yK5iplZK2/zZJCmVqY3qhK8VhJLrqPHp73YyvD
	ujFRcxhFtGlO6CMhdGGChULOeb7L40EHc58JcvdY0jNV9w7+BwZdRnJ1HDm0L4bTUhIyUslF5Cf
	uLTT0yEE98O5w2Bd1t+eyaogOVmOeBLDro0tamaI
X-Received: by 2002:a05:600c:1da9:b0:4b1:2026:6b41 with SMTP id 5b1f17b1804b1-4bb88819294mr584305435e9.30.1795880126455;
        Sat, 28 Nov 2026 07:35:26 -0800 (PST)
Received: from [192.168.0.15] ([2a02:a312:c59b:a180:251a:f25f:80fa:af1d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb9067846esm561359015e9.4.2026.11.28.07.35.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 07:35:26 -0800 (PST)
From: Artur Kowalski <arturkow2000@gmail.com>
Date: Sat, 28 Nov 2026 16:35:00 +0100
Subject: [PATCH 4/4] media: tegra-vde: Drop warm restart workaround
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
Message-Id: <20261128-t20-soft-reset-v1-4-0db458c5996b@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2609;
 i=arturkow2000@gmail.com; s=default; h=from:subject:message-id;
 bh=hFtT0U2Rwf+oq2641JSfqN8CqbYI8bYr/DwXrJChJgA=;
 b=owGbwMvMwCVmYeTc/TaVxZzxtFoSQzbXl61MTeKt/Iwu07XrJh103vSX9VZ3R9GsO4quqvGWL
 32/1zB1lLIwiHExyIopspg9FPrCM8/r/YaXWzth5rAygQxh4OIUgInMdmL4Hyj/7K4PQ9Ha64fl
 eF5M+83SvFvhoG9F5T2N1ycnihwPnM/I8Lrvy9Nfjpq1ITNNNnkcuNFn8OqkWt7MD1P3TZxx6FD
 IGmYA
X-Developer-Key: i=arturkow2000@gmail.com; a=openpgp;
 fpr=F60710C8D69E03A01A2801CD87A47D20C2709637

The VDE driver powers the VDE power partition on from its shutdown
callback, and leaves it powered on in remove, because the Tegra20 boot
ROM hangs on a warm reset if the partition is power-gated or clamped.
The PMC driver now powers the partition on right before restarting on
Tegra20, which also covers emergency restarts and doesn't depend on the
VDE driver being loaded.

Drop the shutdown callback, and power the hardware down on remove,
unless user space has forbidden runtime PM through power/control.

Tegra30, Tegra114 and Tegra124 aren't affected by the boot ROM issue, so
they no longer get the partition powered on before a restart.

Signed-off-by: Artur Kowalski <arturkow2000@gmail.com>
---
 drivers/media/platform/nvidia/tegra-vde/vde.c | 24 +-----------------------
 1 file changed, 1 insertion(+), 23 deletions(-)

diff --git a/drivers/media/platform/nvidia/tegra-vde/vde.c b/drivers/media/platform/nvidia/tegra-vde/vde.c
index 878a5b37846c..6546959e4069 100644
--- a/drivers/media/platform/nvidia/tegra-vde/vde.c
+++ b/drivers/media/platform/nvidia/tegra-vde/vde.c
@@ -394,22 +394,10 @@ static void tegra_vde_remove(struct platform_device *pdev)
 	tegra_vde_v4l2_deinit(vde);
 	tegra_vde_free_bo(vde->secure_bo);
 
-	/*
-	 * As it increments RPM usage_count even on errors, we don't need to
-	 * check the returned code here.
-	 */
-	pm_runtime_get_sync(dev);
-
+	pm_runtime_suspend(dev);
 	pm_runtime_dont_use_autosuspend(dev);
 	pm_runtime_disable(dev);
 
-	/*
-	 * Balance RPM state, the VDE power domain is left ON and hardware
-	 * is clock-gated. It's safe to reboot machine now.
-	 */
-	pm_runtime_put_noidle(dev);
-	clk_disable_unprepare(vde->clk);
-
 	tegra_vde_dmabuf_cache_unmap_all(vde);
 	tegra_vde_iommu_deinit(vde);
 
@@ -417,15 +405,6 @@ static void tegra_vde_remove(struct platform_device *pdev)
 		      gen_pool_size(vde->iram_pool));
 }
 
-static void tegra_vde_shutdown(struct platform_device *pdev)
-{
-	/*
-	 * On some devices bootloader isn't ready to a power-gated VDE on
-	 * a warm-reboot, machine will hang in that case.
-	 */
-	pm_runtime_get_sync(&pdev->dev);
-}
-
 static __maybe_unused int tegra_vde_pm_suspend(struct device *dev)
 {
 	struct tegra_vde *vde = dev_get_drvdata(dev);
@@ -543,7 +522,6 @@ MODULE_DEVICE_TABLE(of, tegra_vde_of_match);
 static struct platform_driver tegra_vde_driver = {
 	.probe		= tegra_vde_probe,
 	.remove		= tegra_vde_remove,
-	.shutdown	= tegra_vde_shutdown,
 	.driver		= {
 		.name		= "tegra-vde",
 		.of_match_table = tegra_vde_of_match,

-- 
2.56.1

