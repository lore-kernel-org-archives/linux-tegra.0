Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794171964;
	b=srGRgx17DDp5oKMtsaN5z78qVYi54d5O1uEqvGG6yhqVRmO2xmJZfoheqCff0I6ag4I+
	 yWKBbIO8+EEL3S19fYx4A4dB6V+HM55C/ZYNOTaeccBow+BFCrbmJf2GOi/i5pwxhzGTa
	 Je9Lo5Muoi076eeebaZjan2MSsvfXRAZbvsusQGPlOzEAK9hfTuuPfveg6MQCicb4mi82
	 x6w+0uN1DCYoTlUCQcFFxgLTjsAp5/nDmRdppd1LTSQ/f+xJjZEx7gjJG3HrpW7VLB3im
	 exkw2bW5NicY+AzOYFAct7W7Mw432pCu6qlvfV/TGRpdLtu0COpCuo+bPKvJiNGdrCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794171964;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=GNWXWN4JgZ7053uqaoeB99xmhmDCtwvTAn5dZkJ9Sik=;
	b=H4Y6ZHRuSflxuEjblgv/Z5Ilju72xRbvZl918MEEsVfzb6lv5PD/Azo18M4cXRocD9mO
	 Hc7C9SPVXhViHgiWViFMQot/wik4rRBBLTa7yIluGshF936cAoCX1UrV9+PmrCFSE6llB
	 RMeC9nByzPshSkpHXjCX8gpsV/1i+WURT0AaeyPqwYz13fYV+VA3umG2mg/zqCgEIWyZR
	 MdLNY2zZhh5jjtUcsFI45qbgktc57fvf+7s0w0fZYi0ecEne5CRyvAIBKZlVf514ro4ze
	 lwq+9UKSG9FfUswBhbnM6fgQRtlV261PYbf384cetjrbW3+D/tppTrvIB6RrEh0p4Yw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pEOmnNMk;
	arc=none smtp.remote-ip=209.85.210.43
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CD1F606A31C
	for <linux-tegra@vger.kernel.org>; Sun,  8 Nov 2026 21:06:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4CD1F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pEOmnNMk
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-825b40f8a26so101180a34.1
        for <linux-tegra@vger.kernel.org>; Sun, 08 Nov 2026 13:06:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794171962; x=1794776762; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=GNWXWN4JgZ7053uqaoeB99xmhmDCtwvTAn5dZkJ9Sik=;
        b=pEOmnNMkD8sFntj+FkOJGpjj8rcZAQMLRp/9VvuUb3AzT1pihw3SfSA61TPxtOUEGm
         GUX4v1V6qJWUWjzC7Hvb0FWsyBA8Ch9EZ87VthO/0eR9SJ0oDdX3CDZf0K6sOzeE0Fot
         kaYJ+xE09txht8kdIuA8zNWdlKagXEkqGEwb3iKZGFv+Di8zv94zFDZphOnH0Q+w16th
         73EOxV0NT0/ycAsVR9EOuvPddp0N6ASIopAqFHlOYJdz69r4xaLeiCRlItlvC9HWAcQw
         WCN62W3WMtcDViHj2vYEXVwI71BiAJoBQeNmDKMLVrzqvR7k4sw+29YdGbvAhhZNqL2X
         rciw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794171962; x=1794776762;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=GNWXWN4JgZ7053uqaoeB99xmhmDCtwvTAn5dZkJ9Sik=;
        b=k6gNyRFoQabj/Eg6DfINlgoeXv078ALhQQPIGZOb9xtmaugPDBlQ0nzLtrD3frDznQ
         Fb6E1exps78n5YVUswVSxEe2jxD1vDwXr1Jp4U49U9u+moMrzcodshGx9UoyI3adOWp8
         8dvI7lkWSj72zEcW8PTHwha19RqYsVnu2mDZjrXb38H/9ex5Ab0bUoL6AWnpbqGqOStW
         CWp8qx2s8Hc6MIIwUplNEzT9qWxdowSvavWhwfAiTu4ZngX2o37nv6Ee+LWk+csybz9W
         lQtuN8Q30Yp2VAek4eNKEkhN4vP0qLg97atmKozWCTmV8RYLHMB9Z7C1LN3kGSFhNnC+
         s8tA==
X-Forwarded-Encrypted: i=1; AL+hErGlctunoPYZbWd3h4wC6GprwhAB4o4PxHxMJEv0w1aXygD57rYP+EP+1gGLHjNLsxTCQF3qXwq8lNiE6w==@vger.kernel.org
X-Gm-Message-State: APuU4Z9cqBFdPHJGdbgBW1x9Jz01vXBUUD+cZU4/8lHoTZSF1ASJVXUo
	DqVDkd3te26FYUCIIQvREU9GrcqcP05JBf8ldEIZ+xS6d3hnkJQHVg/k
X-Gm-Gg: AYBFou2y/wf8+fhkt3wscJq5OHrSbO2koxlZSKGmYeiXRFJhksyjWPKk7rlrSmNlJ7k
	Z90lY2JQQ1sWrUCermnOdNqoAns4pnlLkTe8p9DtvxaRf4zfkFiYl048AuMbeJ9HEUPw683Svmb
	27pvVU9WGyzd7R5H7CCYFkWjePXNxCPLNpR8k+LT5oQk9eq7et8hXfDp4aZpBw7bLoO494YaDJ7
	3dEQ3TX99vXH0SvkN6gFkQ7f5mbXlbDkY/qurBYJXW+D5ylyL4YP/Doye4plLgJj4OLtqVvhHiy
	NogYNCRlEbVq6i2GXr/deyqn2WjCG5EGIppdNfB0E5Qcrjs1dVMWe6MuDZBu+H1w/PwUCUO5YFK
	qKk4YYOd+NnTd9tg9Ou2eJBm7Iba+2AlOpSLktBz+YoaWdE5Ed8xUBwtDtEImgVM7ahi3RJ1tIf
	1wE77Z+IrkRyYwYf27tHdwU+gRRyEORGwkdVGJNpe6pZA7QKlAeAMFPhiVem2H3DoTuBUZAVoLj
	8HctepdXXRZJNhrxMkPAM3dsVVAwHkiHvbn/qdbeBJTDYXbfo6yB0r+1g6zrJ7EAoYdRx5UBVTn
	fj9ZU4MBzo0z5+Sbf88cZRSs4Gnz0VNqK4zHDnxmNcySZs/XY4D0UXvpDI/0yGszeJ91d6uEH5Y
	hKDNDayrGM2HP25Cxeq+MG93T0e3BeArtJb4NY2/9YSXgLQyrA7OVWUGaJdPregJndlhj4HKvhq
	UM1pe7rZWbcIEydvlSVsRuRFD49AM3InI3X7V0d3t53DUNvMGKIY7NHtf+bAQfZNBzz7D+omEjj
	Q==
X-Received: by 2002:a05:6830:2317:b0:804:ec69:3979 with SMTP id 46e09a7af769-85f50854422mr1625444a34.21.1794171962292;
        Sun, 08 Nov 2026 13:06:02 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f4fbcef97sm2275583a34.21.2026.11.08.13.06.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 13:06:01 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 08 Nov 2026 14:05:55 -0700
Subject: [PATCH] mtd: rawnand: tegra: drain the IRQ before disabling the
 clock
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
Message-Id: <20261108-submit-tegra-nand-irq-teardown-v1-v1-1-2c570ad4a22c@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXN3Q6CMAyG4VshPbZhA4M/t2I82E+BmVC0m0hCu
 Hc3PXy/NE83iCSBIlyrDYSWEMPMOfShAjcaHgiDzw2Najqt1Qnj204hYaJBDLJhj0FeOY34+cO
 4aOxU3x0vrWrt2UF2nkJ9WH8/bvd/Z+RBLhW4XFgTCa0YdmOZpuTrItdMa4J9/wI6p3S/pQAAA
 A==
X-Change-ID: 20261107-submit-tegra-nand-irq-teardown-v1-60f649303b8c
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Stefan Agner <stefan@agner.ch>, Lucas Stach <dev@lynxeye.de>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>, 
 Boris Brezillon <bbrezillon@kernel.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-tegra@vger.kernel.org, stable@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

The managed IRQ handler remains installed until devres cleanup, after
removal or a late probe failure has suspended the controller and disabled
its clock. The handler can still be accessing registers at that point:
it signals the command and DMA completions before its final register
accesses, so waiting for a NAND operation does not drain the IRQ handler.

Mask controller interrupts and release the managed IRQ before dropping
the runtime PM reference. Apply the same ordering when chip initialization
fails after the IRQ has been requested.

Fixes: d7d9f8ec77fe ("mtd: rawnand: add NVIDIA Tegra NAND Flash controller driver")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/tegra_nand.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/tegra_nand.c b/drivers/mtd/nand/raw/tegra_nand.c
index 7f9eb5f042a7..1104d75b6cbe 100644
--- a/drivers/mtd/nand/raw/tegra_nand.c
+++ b/drivers/mtd/nand/raw/tegra_nand.c
@@ -1212,10 +1212,13 @@ static int tegra_nand_probe(struct platform_device *pdev)
 
 	err = tegra_nand_chips_init(ctrl->dev, ctrl);
 	if (err)
-		goto err_put_pm;
+		goto err_free_irq;
 
 	return 0;
 
+err_free_irq:
+	writel_relaxed(0, ctrl->regs + IER);
+	devm_free_irq(ctrl->dev, ctrl->irq, ctrl);
 err_put_pm:
 	pm_runtime_put_sync_suspend(ctrl->dev);
 	pm_runtime_force_suspend(ctrl->dev);
@@ -1234,6 +1237,9 @@ static void tegra_nand_remove(struct platform_device *pdev)
 
 	nand_cleanup(chip);
 
+	writel_relaxed(0, ctrl->regs + IER);
+	devm_free_irq(ctrl->dev, ctrl->irq, ctrl);
+
 	pm_runtime_put_sync_suspend(ctrl->dev);
 	pm_runtime_force_suspend(ctrl->dev);
 }

---
base-commit: 30daaf3e7897b4a8d9b72e5b0c86dd6e2a4d7d85
change-id: 20261107-submit-tegra-nand-irq-teardown-v1-60f649303b8c

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

