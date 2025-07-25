Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD6AA272E5E;
	Fri, 25 Jul 2025 09:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753434352; cv=none; b=SgRBRtwFPCq/GMhrgmTd8T4SKnfEYhUEpCBd6bcWMUA4zeXV0jKy/gnz/uBrrapXeBGZTHsoiFZSbyJ5Bp5wCL3E2XCUNIzVAY+Mvpnn1oi7cKS7sXulvkf5bn1XB8mYfUgxvIabrzwjTfZBsWt8Sg1+MrXv9LK69enewlz85+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753434352; c=relaxed/simple;
	bh=9OPpFAVMQK1bN+gEue2HZ/CBVep0+K0ZTrMT8Lmv4ik=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Z84cclRN9tzbE7b9f4gpy7869mPZSGb/bkkMtlpgK0wHg/c4JOncGjtCBYXzU78pV6FTkw1/B4BPKdX+4sn3wor4gSZnJgehjzXPju4L6TApki+2xVGAC18EeC8P6xllTLgSS6s5OZ9839933WhEbB3covk3izPJFSgPvw7Qhps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bljCoKx7; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bljCoKx7"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3b7766698eeso34713f8f.3;
        Fri, 25 Jul 2025 02:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753434349; x=1754039149; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CFZ6aBFoyBkiRDzNBM867EEPpKDX5bjHKu3Sm9kruSY=;
        b=bljCoKx7RTZU+MxuCWDZIUC9NJblfIiVGiC40o/TexunOrIwCls0+KqsnbqQTstbx/
         Wk/gxz3WPzYFg3ANVgbPQtr8HXH1z3L6JMOJLSf2DrhH719K+he4XrM0IScn+/nVQbSM
         DlVu8kzfz9YrYxsabxHzYYhH3w16znhsTnlytilVXlVwHpZotQcabzikKuhCv6VX2CF2
         kGiWQXpStH3ScXKw2lakENAl+ZI4r6+b7upT+sXqkVxYxxEDeC7pAS1tJvjeE+ComMZu
         PWfSJ4wyowh3ZUaR8/iLMhHm7CmfYmOJHunKqKF19FAuOh/+SZiNe+o7y7hEdz4n4qfN
         1Bmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753434349; x=1754039149;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CFZ6aBFoyBkiRDzNBM867EEPpKDX5bjHKu3Sm9kruSY=;
        b=G2GqhQbbWfTnIXCmeezleBzp2y4BhxHsPlL8xM79OBdNIB18X3zHA/Pxh1lGYdPk60
         Spmj4+oRvl5G7iBaOhYXEB9l74XrW1q/sblX/Wl63JZqr8EKVs92doP64H51Fmno1Ey6
         RTriMut4P3oUtNI/g6YCDbPl6AAlhKQh3fudMWqK5as4wnkRc+BNGbs7r8vqb0XwiBn6
         5NB0Jx2vc6IOYkc82Y6CPkR1Em+B6dpcyZe3twuPtPLutdTGelK6mKHKtmizH1JIZqAP
         ajxelrSVIimCEqetUfq5o8UW6ghqjXPFc7k769CiPugOucToL47+TqZoOXMzUFiPt9Af
         0xLQ==
X-Forwarded-Encrypted: i=1; AJvYcCUyEJe+5yEn2aNviSRSgoyb9T4vy7aLCrB+jTtcd7f6SSesKX5kvrBhqCyIThOgiTrLvaEfryNfgVtb@vger.kernel.org, AJvYcCV/ycQBsyZvY9E/lEsWEQk0QqRK+zcOcboTGteH8M/Mq3ZloZMaw2adhfxpPglCTGuMKRQJPMYxwlHJY6Q=@vger.kernel.org, AJvYcCX+9pVUXzKCOWzFygmgDR9z0jaV5MZrib4QbH82l67yKYInfYZOcA11jpIpO3wJwIXnX9PQXe5LXpml7n4=@vger.kernel.org
X-Gm-Message-State: AOJu0YycMeBGoccuBIEp86YhJct7JVFjUuVkZjo9z2gF5vGuvRUNbfe+
	miIYbKO5h4ARiC1k3H/oWdtdzgrYqmFRnB4c864o94X7A+WB+UC8uwG6
X-Gm-Gg: ASbGncus0QjXTjvwqRSKPPN4ZyQkE9NwmfB2f2no+PIlcVflQf9nljUuc/0jayMUlaO
	jQ0+h850yQR1X7lWOF4diSSBiHGLE3M3zSozAqJ7I0Y24Kxj+Pendw5WzWV4eXt/RazcL7dGeii
	BTEOyKNXWU2lVk3zy5W0vqnv3FblN9MJkd/K1ey3wecK79g+NpkKRBg89iuno2I+iZIwoZCqBNK
	SAazpGs4H3tZjJ2kGTWNqaSeal85MyHsLRgGoHdsGpVhD71HR0LLpuu39xIiUjEtHlXDIQLShU6
	Xnd/NhnmeuWrmnyl4m89pfZMgtvH5dQfjKQVmGJX8k6ydB0zyRizc4H0PiSQWYerdh8ZfuYfV6w
	7mehNkGO2XT3tybZabqCVgDh95uCB/hJ0ExFwgkyuet7im80=
X-Google-Smtp-Source: AGHT+IFwplxRDWetFtC9Z04tT8q6AgVjbsmRxl41gmfUmRsrZ5It5r7ruUEL+rrpm37jZ7qpDSC+rA==
X-Received: by 2002:a05:6000:250a:b0:3a4:e740:cd6e with SMTP id ffacd0b85a97d-3b77673dcc3mr408463f8f.8.1753434348873;
        Fri, 25 Jul 2025 02:05:48 -0700 (PDT)
Received: from thomas-precision3591.. ([2a0d:e487:31ff:1e66:d79d:18fa:7b96:a238])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3b77078b1absm4302974f8f.1.2025.07.25.02.05.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 02:05:48 -0700 (PDT)
From: Thomas Fourier <fourier.thomas@gmail.com>
To: 
Cc: Thomas Fourier <fourier.thomas@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Wayne Chang <waynec@nvidia.com>,
	Felipe Balbi <felipe.balbi@linux.intel.com>,
	Nagarjuna Kristam <nkristam@nvidia.com>,
	linux-usb@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] usb: gadget: Fix trb_virt_to_phys() error value
Date: Fri, 25 Jul 2025 11:05:33 +0200
Message-ID: <20250725090540.51958-1-fourier.thomas@gmail.com>
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
Signed-off-by: Thomas Fourier <fourier.thomas@gmail.com>
---
 drivers/usb/gadget/udc/tegra-xudc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/gadget/udc/tegra-xudc.c b/drivers/usb/gadget/udc/tegra-xudc.c
index 2957316fd3d0..5dd3452bddbc 100644
--- a/drivers/usb/gadget/udc/tegra-xudc.c
+++ b/drivers/usb/gadget/udc/tegra-xudc.c
@@ -900,7 +900,7 @@ static dma_addr_t trb_virt_to_phys(struct tegra_xudc_ep *ep,
 	index = trb - ep->transfer_ring;
 
 	if (WARN_ON(index >= XUDC_TRANSFER_RING_SIZE))
-		return 0;
+		return DMA_MAPPING_ERROR;
 
 	return (ep->transfer_ring_phys + index * sizeof(*trb));
 }
@@ -1480,7 +1480,7 @@ __tegra_xudc_ep_dequeue(struct tegra_xudc_ep *ep,
 			deq_ptr = trb_virt_to_phys(ep,
 					&ep->transfer_ring[ep->enq_ptr]);
 
-			if (dma_mapping_error(xudc->dev, deq_ptr)) {
+			if (deq_ptr == DMA_MAPPING_ERROR) {
 				ret = -EINVAL;
 			} else {
 				ep_ctx_write_deq_ptr(ep->context, deq_ptr);
@@ -2836,7 +2836,7 @@ static void tegra_xudc_reset(struct tegra_xudc *xudc)
 
 	deq_ptr = trb_virt_to_phys(ep0, &ep0->transfer_ring[ep0->deq_ptr]);
 
-	if (!dma_mapping_error(xudc->dev, deq_ptr)) {
+	if (deq_ptr != DMA_MAPPING_ERROR) {
 		ep_ctx_write_deq_ptr(ep0->context, deq_ptr);
 		ep_ctx_write_dcs(ep0->context, ep0->pcs);
 	}
-- 
2.43.0

