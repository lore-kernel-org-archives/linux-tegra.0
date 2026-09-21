Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8EA635E1AD
	for <linux-tegra@vger.kernel.org>; Mon, 21 Sep 2026 23:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790032139; cv=none; b=fm3BJT36/8M4M8ZbkRFAIgJuKx+j36m20HZwj7QvF1hCWmh0ed45sIE5Yj6MzFkg9yDO8RheQ0i/ytjc1noraBpBc33H+VIJ+ECVOXXjJ401wjOSxIHBuzVAmTu8S7DWNfg413pA/Hq7L4tHn2ufs3B4qan7TsfLpSCwRqoN7Oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790032139; c=relaxed/simple;
	bh=1gnA8TGe9af5RJ6waDfAsYApcBrdbInaq4eInVQa1YI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PEHO8uSNwv4yK2pdd9r75U5LbvEJzqlIjJHXqnfJXgq9u6VsEp/nmQh43l1gbkl9UJgYN/H3SsPFoPYRFxa+WV9Pbcz7BO9nlhA+VQ57ppmCXUfMwF/3fl2u5C456Une4GSwAllC0cUOfmZQ7vCR8xeYt8TE1/SOPbPgRGeBnQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bxemTQS+; arc=none smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bxemTQS+"
Received: by mail-qk2-f12.google.com with SMTP id af79cd13be357-939eb3249c1so294336585a.2
        for <linux-tegra@vger.kernel.org>; Mon, 21 Sep 2026 16:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790032137; x=1790636937; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Uil38kKcJdnxLESM2C/w42Vib+0WwToXVLrxxQmRKFM=;
        b=bxemTQS+2DFclC5/fsx+gHH1PG43tVu5KjOWk5bfXVu0elQhvWAV6v4FyLkUvnEnW4
         CiO016aTfsnenevBHUcYPc+WCSq8UJfwVpnd6ZwQEoRFzG5d86zvAf42aaHUSyTrsvP5
         3rssbewrN/HGWWyY/BuuKjZSk+w3jKL1z8ZlIaMt5yJcIrCDEJ3PABi58GSv0Cxt1AaR
         6hEJvauXXzGjcILnvNIt3Q8fAFFBBRevjnp7d4tKZMc91iOwx2D5ADl3Z8IV53GlE/CD
         gaVbWpu4FWXTQVVA0gpu5DdzSccolI4L3uJYbfGk15joVe7oIQKGOPK4MNbhm4Cu3+9j
         dhLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790032137; x=1790636937;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Uil38kKcJdnxLESM2C/w42Vib+0WwToXVLrxxQmRKFM=;
        b=P75F4PP+r01lFoaxHZYxDEUQ409Ej1Vfdsz7loOolt//qRX5X0z24gxQB3U86lIjP9
         PR+GcZJHRa18iHmdzFamtZUGoP6SgZZMq2BAPky5aphdRRJolng8w2/L+JQyTLZcCOp4
         VlAsbCZO0II+Wkr4M4GZAE6iZIbqaaS0jvgMg0NQnxN7ca2Eg2iuXlYL0Ov/pLsJi97b
         lSIaUt4OqatqDjcitpXzCNp7OYbNHrZixzPUk/xCb6/RQmsaZax2N6sP5CUlh0mg3KwD
         YaIpY04gxeDL2hiZdzbF6pJYTuDlKHghwjUzK/62PTKhdInPj/P0+mKr0S7ITuwDbqn/
         37HQ==
X-Forwarded-Encrypted: i=1; AKwUvBxhlLrvEWh2hgeJXmxI+LsfAxzPVMz+9U89feQjfiwkf0+W7kkZNZPBhv2wM7fIZ9cXNvO4C72UnYp/Sg==@vger.kernel.org
X-Gm-Message-State: AFuF++mX9A+e/AMlmk8GyeXH2Z3Z2ssN42yrg3v67isKH4pKaRuhGdCe
	HrEWPdURw5vL+C0iMayq+3aJ7X6Bfd5dVXrKB+/cj0z/4xyWpCywewg=
X-Gm-Gg: AYBFou3DWUlMGoxX2uggfskLJSWEuE654ucslYliZSnliv0F2DHEDPsoCZ6Bpa7N+i6
	fk4nDzp3HLGGsyrMtmwx7Dw0b47lg+L5dDXdVr7twmdvFA0RQ0IH4kz9xIlNNGoWDlgzZqIvIQ3
	toxLNndDlDhbLfVBzwYN1FNsO/5FNWHjXxZ/MfoEKex78HDVSKwrUVsGglLfxts/HigemzlNYAY
	Pg7d3h2zJzxX+KtEsuR/smKtTrBSmAVciPjIb1qDL6idzygpQx2DfJhGo8ml4/StDxWW1/8DSTl
	XZ+dvfT7gzBgJOu0DLKMPiV8jkFiCHLGmQtCZUj3p6dTuwNnwSEPgIi00OIA2gIDl4TXilpvFI8
	JtKLXzubEGWjcScdR5hR/eExXau1KMb5cTSm5PTq0FuaKRLKohKfOMzhliV6QDpeRM6Atu0zXME
	XQs4AhT0G7viNX5F0yRS5LYy1NgFugLe3I6+13HF9j78zMGrdjm8pAT6UazX9G0fcocJMBYvZ4U
	UuVtZm9IV96IpkxSjknEITWkzpQ9OOWR1xRmOt3LFqprz32P/WIpLwI//QYx93R+FrllkuylB1d
	4vIItDb1AONHgfYt/I8u8vmo3UZw
X-Received: by 2002:a05:620a:404f:b0:93b:e412:8cee with SMTP id af79cd13be357-93c15eea61cmr284237385a.73.1790032136724;
        Mon, 21 Sep 2026 16:08:56 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c19a7f592sm39933985a.17.2026.09.21.16.08.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 16:08:55 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-usb@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2 1/2] usb: gadget: tegra-xudc: Unregister VBUS notifier
Date: Mon, 21 Sep 2026 19:08:47 -0400
Message-ID: <20260921230849.502492-2-mhun512@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260921230849.502492-1-mhun512@gmail.com>
References: <20260921230849.502492-1-mhun512@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

tegra_xudc_vbus_notify() queues usb_role_sw_work.  The notifier is
registered with usb_register_notifier(), while devm_usb_get_phy_by_node()
is passed NULL, so devres never unregisters it.  vbus_nb lives in the
devm allocation, so a later PHY event calls it after xudc is freed.

Unregister the notifier before cancel_work_sync().  That waits for
in-flight callbacks, and the existing cancel drains the last work.

This issue was identified during our ongoing static-analysis research
while reviewing kernel code.

Fixes: 2582d629c9e0 ("usb: gadget: xudc: Refactor update data role work")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
Changes in v2:
- Unregister the VBUS notifier before cancel_work_sync().  It queues
  usb_role_sw_work and is not devres-managed.

 drivers/usb/gadget/udc/tegra-xudc.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/usb/gadget/udc/tegra-xudc.c b/drivers/usb/gadget/udc/tegra-xudc.c
index e9d33be02866..a0585a1f19f0 100644
--- a/drivers/usb/gadget/udc/tegra-xudc.c
+++ b/drivers/usb/gadget/udc/tegra-xudc.c
@@ -3926,6 +3926,12 @@ static void tegra_xudc_remove(struct platform_device *pdev)
 
 	pm_runtime_get_sync(xudc->dev);
 
+	for (i = 0; i < xudc->soc->num_phys; i++) {
+		if (xudc->usbphy[i])
+			usb_unregister_notifier(xudc->usbphy[i],
+						&xudc->vbus_nb);
+	}
+
 	cancel_delayed_work_sync(&xudc->plc_reset_work);
 	cancel_work_sync(&xudc->usb_role_sw_work);
 
-- 
2.53.0

