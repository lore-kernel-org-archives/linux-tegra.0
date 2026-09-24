Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9848E4756B1
	for <linux-tegra@vger.kernel.org>; Thu, 24 Sep 2026 11:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790248934; cv=none; b=VkV0gCFIqY6lEC6mhV83pjn7LWwIX8pA1e7KnYDEgC0nsQDM28mwAy5rEI4GnFReBHxroMUId303+n0zdWKjsSAv++6W2uhvVmgdc2qbZ1peZ3QnhHvfqnwON3u+JSXDl2kxE5jiahRGgRwsqbMQ9/DGwkk5A61+aaEQsZHWjU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790248934; c=relaxed/simple;
	bh=MG2Bc3HSziZh5YSiBO1i5BIAIbO837rHWuxb349QBQs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jLKpBdHw5vBgaRcRczhS2UgG0m77f+Ko1hXDvMv439420+BYWdjh9V3puuEtFlqhBeLUgNRou5JoIaOBPVmuUf/EKTQzf2Ode05nF9hALrVUYhjRqn1uOFy9aIRDSdwy76AAEKZC+zKz2hnewuXzy5ZJeyao2ewUwgzywlERtis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R7HrVQw8; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R7HrVQw8"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3a02551822eso530028a91.1
        for <linux-tegra@vger.kernel.org>; Thu, 24 Sep 2026 04:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790248933; x=1790853733; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VspQI5WMjsdSCk34l3Q9s/IcuI4zoJXws0vCPV44u/M=;
        b=R7HrVQw8QKDQuKurTHlraUoMIIphjzb10yL/pFmxz5msgV1UGn5DeC0tL01MdlvPaz
         GmdVcEqTCFDSGJ6B30yccueia1ZZhklDDViXztezddZmN8KWM79r+550nJM6rin3gOGn
         G+2ijZnnWjoOk9mJEbaftBvh0QPdl+3VIpgRifdWbT2hwDY/1lV8N5daSjQQiSo/7E98
         t8aNlRFic3jiqHJOHBvsbD2V3thFeCpHuMn+xvswaO04b8OWNXjSGx6BMTUECKFBlA87
         xgX7iFHtapMRtx0K0tkK+EL4Yp1CGjXMffTr3a2j1+jGDyKe2CtUF3LJpNTGMBrTVZZ8
         oLyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790248933; x=1790853733;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VspQI5WMjsdSCk34l3Q9s/IcuI4zoJXws0vCPV44u/M=;
        b=aPJEtGvspCflblorAB4WUQ/3poy6jINhcBk/Kri2BjL0REg7zaxSDl4kmkEYbusejm
         gmIjNbOjCSxW36PX31urz//O4aGUMmXsvzAIzVObOSri/H1zs2Yiq3BabfmiBZh5NL3S
         59XLGhnxEqWXH4ghy5cGzsp3tYWksFyNFA2mLOkv7RgRG2644WqLEGyzeeGl0YA1Z186
         0Rc6TS73vt51G3n/DZL0y9vsbTM54KUYRskcJPkAjssaFVvy105+LRrQEvZNku1GTuIF
         l2PZWdb34hh9RbcnnSabbHDEo/qpT+HeVAeoTzSQE90ZbC1mu2T3RxpRHbl8TqCnrdx+
         b4kw==
X-Forwarded-Encrypted: i=1; AKwUvBwXbklDllTk+3xtnvf71ff4dvZDdscKD4CKapabVOFAFpZeorWhPh6Feji3DHENkUUtc6w0Fr6JC+JEow==@vger.kernel.org
X-Gm-Message-State: AFuF++n2dxUQlqEbb/zIWPWzPITtt6owVdPcI2onJuCcMP7J+19vQd84
	IBxRVaIbT87RgiWJuT9Q+K3SDRkV+UPbi6sdh4q8zpKZYK+bCCu/KZ4Iedcs402a
X-Gm-Gg: AYBFou3dd+UK3qnmw7p6GgOJ0vV5gqITmZvR9Jq9clTrIByIWmY9vF2AUp5URS2Ku5r
	kwk2JNMIyMn6tYfK4ZOeGFaGxnmdiQukajQCKOky+3IxBiloxfz0hw68tLLpDMYiH+aLR8kbchb
	r9tJ74e5pbiDSF7Zez0XdfPWywbWQQd49EaUhY1l+UEel5DhFRykYEuaQrnW0ML8lb66mGIdXgn
	at/XQ5CHvU+u7xG9JRWcaHHkpMm3jg9/Ys0eM4swTyDjIt1ItadoEnH0Am3m3Iwrp0ug5ATv1p2
	T9qOp8n156fgf3Xcnt9jk9e9r1UIvaeSXShW6HPwFnkOhBoI6yRTvxHjybp5WFovQzA2AArbdwG
	ESwu5AVgafZBwHQvtrrGa8NJ/m03FMKMkkhGFpFofuv4HbYzNLXNBTz3gECPw2Fh7eMPpcd7ezi
	6vC8zZMMC8KHFIXoEpA7x/Jn4P4bpQaHj6DLIKdKpzA2dMoaBxzqJO6A==
X-Received: by 2002:a17:90b:1a8d:b0:39e:58d8:f899 with SMTP id 98e67ed59e1d1-3a098abd80amr1586783a91.35.1790248932805;
        Thu, 24 Sep 2026 04:22:12 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1002::de93])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc75f3b82aasm2569713a12.9.2026.09.24.04.22.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 04:22:12 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: gregkh@linuxfoundation.org,
	mathias.nyman@intel.com,
	thierry.reding@kernel.org,
	jonathanh@nvidia.com
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	rosenp@gmail.com,
	kees@kernel.org,
	lgs201920130244@gmail.com,
	avorontsov@ru.mvista.com,
	linux-tegra@vger.kernel.org,
	jckuo@nvidia.com,
	eeodqql09@gmail.com,
	stern@rowland.harvard.edu,
	davidm@egauge.net
Subject: [PATCH 1/3] usb: fhci: release IRQ and MMIO mappings on remove
Date: Thu, 24 Sep 2026 19:21:54 +0800
Message-ID: <20260924112156.1564208-2-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260924112156.1564208-1-lgs201920130244@gmail.com>
References: <20260924112156.1564208-1-lgs201920130244@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

of_fhci_probe() creates an IRQ mapping with irq_of_parse_and_map() and an
MMIO mapping with ioremap(). The probe error path releases both mappings,
but fhci_remove() omits the matching cleanup after a successful probe.

After usb_remove_hcd(), dispose hcd->irq with irq_dispose_mapping() and
unmap hcd->regs with iounmap() before usb_put_hcd(). This matches the
resource release order in the probe error path.

Fixes: 236dd4d18f29 ("USB: Driver for Freescale QUICC Engine USB Host Controller")
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/usb/host/fhci-hcd.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/host/fhci-hcd.c b/drivers/usb/host/fhci-hcd.c
index 71e785f445a3..1c8f6317f6aa 100644
--- a/drivers/usb/host/fhci-hcd.c
+++ b/drivers/usb/host/fhci-hcd.c
@@ -756,12 +756,14 @@ static void fhci_remove(struct device *dev)
 	int j;
 
 	usb_remove_hcd(hcd);
+	irq_dispose_mapping(hcd->irq);
 	free_irq(fhci->timer->irq, hcd);
 	gtm_put_timer16(fhci->timer);
 	cpm_muram_free(cpm_muram_offset(fhci->pram));
 	for (j = 0; j < NUM_PINS; j++)
 		qe_pin_free(fhci->pins[j]);
 	fhci_dfs_destroy(fhci);
+	iounmap(hcd->regs);
 	usb_put_hcd(hcd);
 }
 
-- 
2.43.0

