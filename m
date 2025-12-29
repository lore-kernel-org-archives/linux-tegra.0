Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 065A922A4EB
	for <linux-tegra@vger.kernel.org>; Mon, 29 Dec 2025 13:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767016756; cv=none; b=XPHfwUlBHapBbyu5emr5yl8f+j81OEq8k+d2E4lQhoGPm89ajMwqhHFsO1lxHbYrC/4FfL/jFrx3h2EHET4m17Bc51Tmsox2j48b7Od61es/cugEoMJDkUgolqpiLsnLJCveARVH1k+kmG8NgDZJUcWLcYuaFH7HZr3CIiGbGbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767016756; c=relaxed/simple;
	bh=k257uZ3HPDKFfAze/hz1Hfmw8/7Hf+9ogZi61Nyan10=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kwE3YMNNH+PLbBL/DJ1mR9aWPuxbLDaHQJ+1rVyyQIW69ZmdcmvGLipyzxLbL4gI5ZC3H1fI1TGWYKzz5471Ye0Y45joj3UBnhtjjg2R4yFjkXxektuj/tN5qX/1tyDP35HVu/ZmTKbLVfGHSYSV8QQ++JM+ClkTPkPWtIqKKpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jb4vi6OU; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jb4vi6OU"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-477985aea2bso8520715e9.3
        for <linux-tegra@vger.kernel.org>; Mon, 29 Dec 2025 05:59:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767016752; x=1767621552; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jnurlv5ZkeGevc2yEP3yL2OMFl89R04sLNUEhoXlc4A=;
        b=Jb4vi6OUmolZ4NXViQlAkeq0JttPiAGs85sSgTroLRQN6PTW3eJ0Qx3lk4q4uljvuw
         hY9QD7hSwXfbp/I/Uuldx6Pou/8Kv8NqMzpG1+EEMTiaOxSHjdDOUPMdooPJvLO3bgrQ
         fCL2C1VDR+wLBEildF9gD831DPeJGwNsvtKw2eWJOCRVAgEIEVwo1HVLcH+aXZV4KGRO
         DZX1zoLxHJ7+zgAsrUl5a+N7J5DC9d3PYmD1CsE1BDztKcCSRKebIWEKm//NvNf/38rp
         ohxAD8pFkM6X7cwgMPp7NlvYiagUcfRxNBB2dPAcNvO1i8nCJWNeGB+GRHYYwDMjZv6u
         z8bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767016752; x=1767621552;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jnurlv5ZkeGevc2yEP3yL2OMFl89R04sLNUEhoXlc4A=;
        b=G8hjBI+cOMjGFyn0MDMKRlcsI7fjjltN324t3G05HMBSYGYlnTfn6bhjUDX1NRI+4Z
         udBvaSBIQmywYVt/5P7RD6SC72BdKC7nJcEgX6ALNrQmHqM/5UJ9w368NJ1hGPQLpV/f
         aYV4tcdqSbT3nR8K8+Cd25vmwVt89nJfkqcfQcdzq233HUhiSMvV94XxWjkioLyCpoif
         9141qpG+LHZMtvdUX0IGwlNQwfm72x1d159IECPpA4AYyCpz9a3IwfEZjrbJKaSsVM+0
         cspC6U77iWLF2Zqv4rqdPsyd2dgqmZtYTpet6u98Wna5utNGj4PXoZMwPIhb0jtXSIOi
         mQqA==
X-Forwarded-Encrypted: i=1; AJvYcCXZojF79Gm8A/0/rXsChSuf6p8nX80zptO9ooKc5nLCUJhnSM6EPiH6yTG50RSNDwnS/WwP8jjocGir6A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3ZwghKmvqLdAp4t9mJFJnrcQ/7wPg59+VKQR0ahS3jp0WQYWp
	IoiksnVdtNTVBpRMNAdQqrPIjWI8Q+RdaOi2+8OO+tfiho+uUhaxc8/K
X-Gm-Gg: AY/fxX6P5N+QeHe+aoSrYQTHWjwPs1a0uN71U+/bfmOtod/abWLm+MRZPVyxE574ZR/
	+g1lgn3MaDhA86loO1oJrxYrErsbu50dCHlvCedjNaQK/yFosG/YId6Ybi801HyPLa0i/KinKn0
	1KSvdsF7jqDrDJV/gEqxLxooM4TVMglGOvcHKKYGQBHl2wQIWFU7dqL9SNm0rmD5XIFtFlNrejA
	wsGaAifNPjcrTeNrgtAi1KM9ys9a2b4Nh6z2xQYtLD9OHJVAINqYqP9qohmYIqW5oUytfeeUC6k
	fh7TFm0N/QjTkyNYuFCcOLdgq8yz5pbvJH4jyJVGz6s+iRQgAZLWAr1IjPshugdHb0qUzvqKMEI
	EAA43KqF4K6hvK9xQbDkYUJ+xzAc1l+Uev34dWoYowlMN3i5d+1DwYsDB/xPYhHq9IHUwLGsTHA
	LYja/OuLcW1LKc60lbi+yZKX36VdYem0Mo/bQx+zvo466o9fWvb3mhjRCWxKyufUYZcZ2J8Mvkt
	DUZhAw=
X-Google-Smtp-Source: AGHT+IG9xRAmZubwF+oTURx72QKNS8IBmfurtixzLyk4corHAwr+82eB/ZvmEfCyKAkZ8m72tcMOWQ==
X-Received: by 2002:a05:600c:3ba4:b0:468:7a5a:14cc with SMTP id 5b1f17b1804b1-47d1957af0emr232438825e9.3.1767016752121;
        Mon, 29 Dec 2025 05:59:12 -0800 (PST)
Received: from thomas-precision3591.paris.inria.fr (wifi-pro-83-215.paris.inria.fr. [128.93.83.215])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4324ea1b1bdsm61881417f8f.8.2025.12.29.05.59.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 05:59:11 -0800 (PST)
From: Thomas Fourier <fourier.thomas@gmail.com>
To: 
Cc: Thomas Fourier <fourier.thomas@gmail.com>,
	stable@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Wayne Chang <waynec@nvidia.com>,
	Haotien Hsu <haotienh@nvidia.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Liao Yuanhong <liaoyuanhong@vivo.com>,
	Nagarjuna Kristam <nkristam@nvidia.com>,
	Felipe Balbi <felipe.balbi@linux.intel.com>,
	linux-usb@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] usb: gadget: Fix trb_virt_to_phys() error value
Date: Mon, 29 Dec 2025 14:58:49 +0100
Message-ID: <20251229135853.33222-1-fourier.thomas@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

0 is a valid DMA address, so returning DMA_MAPPING_ERROR in
trb_virt_to_phys().  Also, dma_mapping_error() wouldn't
flag 0 as an error address.
Checking the return value directly because the dma_addr
does not come directly from dma_map().

Fixes: 49db427232fe ("usb: gadget: Add UDC driver for tegra XUSB device mode controller")
Cc: <stable@vger.kernel.org>
Signed-off-by: Thomas Fourier <fourier.thomas@gmail.com>
---
v1->v2:
  - Add Cc: tag
 drivers/usb/gadget/udc/tegra-xudc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/gadget/udc/tegra-xudc.c b/drivers/usb/gadget/udc/tegra-xudc.c
index 9d2007f448c0..63f7eeddb401 100644
--- a/drivers/usb/gadget/udc/tegra-xudc.c
+++ b/drivers/usb/gadget/udc/tegra-xudc.c
@@ -904,7 +904,7 @@ static dma_addr_t trb_virt_to_phys(struct tegra_xudc_ep *ep,
 	index = trb - ep->transfer_ring;
 
 	if (WARN_ON(index >= XUDC_TRANSFER_RING_SIZE))
-		return 0;
+		return DMA_MAPPING_ERROR;
 
 	return (ep->transfer_ring_phys + index * sizeof(*trb));
 }
@@ -1484,7 +1484,7 @@ __tegra_xudc_ep_dequeue(struct tegra_xudc_ep *ep,
 			deq_ptr = trb_virt_to_phys(ep,
 					&ep->transfer_ring[ep->enq_ptr]);
 
-			if (dma_mapping_error(xudc->dev, deq_ptr)) {
+			if (deq_ptr == DMA_MAPPING_ERROR) {
 				ret = -EINVAL;
 			} else {
 				ep_ctx_write_deq_ptr(ep->context, deq_ptr);
@@ -2834,7 +2834,7 @@ static void tegra_xudc_reset(struct tegra_xudc *xudc)
 
 	deq_ptr = trb_virt_to_phys(ep0, &ep0->transfer_ring[ep0->deq_ptr]);
 
-	if (!dma_mapping_error(xudc->dev, deq_ptr)) {
+	if (deq_ptr != DMA_MAPPING_ERROR) {
 		ep_ctx_write_deq_ptr(ep0->context, deq_ptr);
 		ep_ctx_write_dcs(ep0->context, ep0->pcs);
 	}
-- 
2.43.0

