Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 265534779A3
	for <linux-tegra@vger.kernel.org>; Fri,  5 Jun 2026 07:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780644443; cv=none; b=fpWcslF0458wWprtWluXAilUsmwNH2XVTNWy/RnyX9XQ1Q0uRSeY/5HjoxVZszaDCiOLPzTA133qTgP7SQisdBVwkO43TrG+xc5bjrbPu42gujHS//QhWAYMtcEsnd9qljxTyiD14/hbAYjkn+XyXk4qpmGvT/9t65Jbj5RFwds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780644443; c=relaxed/simple;
	bh=J5yo9hb4DiG2V5nvVCbiSN6dy3FUvV2ZxvrOFGt4cIg=;
	h=Message-ID:Date:From:To:Cc:Subject:MIME-Version:Content-Type; b=aQdVAE4mP2vc0HrFtv4RJx45iD+eGv97A/HHOEBvAYCBasTq5AzY6hyOgpkeZHg52pAgt+ijPWoIzn17BXqxiBJ3GS1q4Okampg3mXDfyNEXYAwTFwXDLazigldsSAwNtlTx7Rfw3OUDdwSyc+xqIukY3HtxtLLSj8LKmflGtZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KE0RKmNq; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KE0RKmNq"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-36d630c0e35so1590331a91.3
        for <linux-tegra@vger.kernel.org>; Fri, 05 Jun 2026 00:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780644440; x=1781249240; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:subject:cc:to:from:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=610gyzIqBO1JVhEX585ySATLb6xibPYUqJZc1nejfdI=;
        b=KE0RKmNq32w+Vxlo7XfRShbrnhFxSuPbHXS1TyWihVBdqVGHNYFwfxlOGHJwtu2LA2
         Hf3l7JX6UmXQUJdKVmN0ugAdAhLkq9z68zhzqiOo02PprOk1Ios4pLliCp458NBzotJo
         eOdCW9bqVBm72aGHrCZqL4aDIiS1+eLLsDbj8AbX/YphXW5VdkcNXVx811Q9YkjWQQ3q
         AK/RvOu5gIzXB/hidRntjsOJeCkwDfHHpKywJPBmBakoLZQKPz+3xu5tpEIztRP+o9Ci
         z4m7v049R+4cSVkct0cehURfBqoXoOP1JBkL1zdPehgHrcP2e6SGVBjPh3S0Lh/HkIZM
         Y1cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780644440; x=1781249240;
        h=content-transfer-encoding:mime-version:subject:cc:to:from:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=610gyzIqBO1JVhEX585ySATLb6xibPYUqJZc1nejfdI=;
        b=ob1bW00jsP+O4J99wGLk7wFif6a+g6wfW9PPuRJcHwO77oHds31aSQ0Da+aJ1E1lrU
         0zp9fIbV+mkGnAmjA1EOONx47SQFnXGcPlHMoPH2EWwV1UniMqkdEa7BT5//3V8owSQ1
         x2NA+t7JxiAggFTrnFrMXoKgT/NmKtGJwrM5v+W1W/RMU5X5aaN1ulR2wY5dIY5fIlTu
         +UuvKMb/a4NuYPSdhTZKuPmOvRxKdTI9Y6b6oTM17gOcQnTHP2fckxDa7vBT2pP65SkF
         M0xAAhSuh2yv3eKhSxe6uSJ01xxEGRHm+4S8MfjoYxsxLNm0k1GBknnVosa/EuuKFzQ5
         7sfA==
X-Gm-Message-State: AOJu0Yy2t6WNDVDn/2EvOkaE/ErF8dv1mn0tqScas0rvlmNH/RWtqy2f
	FaOt1a/vWvXvIgH3giOGNPq7LouH8FiJoOiQOJY9VmS3RESNLg3UvA5b
X-Gm-Gg: Acq92OHP4iabvKRYo4LZFSWKKULhglIIcyztZwDzp46zffaABeQvtdHYDNDte+9y5BS
	IrGpcDkooGVYq5lgYAH/elkJWBlWhchJaz+g8XKzPVjeefjRo1CZeLCreYfvwHSTI5PbT9tiJfL
	kVLS17ZWzBeRxG6FhnlVo93qk3OcNFzfLqiOMo/v1kwvU4XUKeYP/fB38ji8M+QZl0AIzm8kIMJ
	3VvlMm23p9JsWcQjyUemnrgiFHrjmDXQZDmW2qebVh6NVQeOpEEoxU1Wqm1oNUuw12n8yULp2rv
	oa5+ef1i8okW5RcKkMqEHjUaE+MNHHBGs6mBh+m8pcFKGOzc5ohMjX4Y2BE01FlBNsWTG8zzIpZ
	EJb6SN+wj1n6Rvf0QWlTLv7HDSD3qig56EgffrDO6V9DdEdwfD7PxrRXVABHFJLyLXgaD1Hey32
	IfEWGR2S8UxHdNqLKtiQU/IUopUzpNOVEtd8lSCA5/Ka/vLs6ySZ1bOiGl2Wsn6Ir2W3R91psJE
	Sw=
X-Received: by 2002:a05:6a21:68b:b0:3b4:c9d5:cd5b with SMTP id adf61e73a8af0-3b4ccd5dcc5mr3306756637.13.1780644440283;
        Fri, 05 Jun 2026 00:27:20 -0700 (PDT)
Received: from viku.office.rr.lan (fs79022602.tkyc410.ap.nuro.jp. [121.2.38.2])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df04311bsm6839996a12.9.2026.06.05.00.27.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 00:27:19 -0700 (PDT)
Message-ID: <6a227a57.b453d089.3d0874.3012@mx.google.com>
Date: Fri, 05 Jun 2026 00:27:19 -0700 (PDT)
From: Vishal Kumar <vishalmimani008@gmail.com>
To: linux-usb@vger.kernel.org
Cc: linux-tegra@vger.kernel.org, stable@vger.kernel.org, gregkh@linuxfoundation.org, thierry.reding@gmail.com, jonathanh@nvidia.com, digetx@gmail.com
Subject: [PATCH] usb: gadget: tegra-xudc: drain EP pipeline before DMA unmap
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

From: Vishal Kumar <vishalmimani008@gmail.com>
Date: Fri, 5 Jun 2026 14:08:54 +0900
Subject: [PATCH] usb: gadget: tegra-xudc: drain EP pipeline before DMA
 unmap
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Tegra186/194/234 the XUDC appears to post a transfer-completion
event when the DMA write is dispatched to the AXI interconnect, before
the store is committed to memory.  Under SMMU strict mode dma_unmap()
synchronously removes the IOVA TLB entry.  If an in-flight AXI write
to that IOVA has not yet been committed, the SMMU raises a translation
fault (fsr=0x402) that permanently wedges the bulk endpoint; the host
cdc_ncm TX queue stalls and fires NETDEV WATCHDOG after 5 s.

Fix for non-control endpoints: poll EP_THREAD_ACTIVE until the endpoint
sequencer goes idle before calling dma_unmap().  Follow the poll with an
MMIO read-back that orders prior CPU writes to device memory.  Only
after that does dma_unmap() invalidate the TLB entry.

On timeout, skip the dma_unmap to avoid triggering the SMMU fault.  The
DMA mapping leaks, but the hardware is already in an unrecoverable state
at that point.

ep_wait_for_inactive() uses readl_poll_timeout_atomic() (1 µs poll,
100 µs timeout), already called from IRQ context in
__tegra_xudc_ep_dequeue().  Change its return type from void to int so
both call sites can detect and report a timeout.

Control endpoints (EP0) are excluded: their completions go through the
control-transfer state machine where the DMA is fully committed before
req_done is called.

Fixes: d720f0f7bfa0 ("usb: gadget: Add Tegra XUSB device mode controller driver")
Cc: stable@vger.kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>
Cc: Dmitry Osipenko <digetx@gmail.com>
Cc: linux-tegra@vger.kernel.org
Signed-off-by: Vishal Kumar <vishalmimani008@gmail.com>
---
 drivers/usb/gadget/udc/tegra-xudc.c | 35 ++++++++++++++++++++++++-----
 1 file changed, 30 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/gadget/udc/tegra-xudc.c b/drivers/usb/gadget/udc/tegra-xudc.c
index e9d33be02..8f1d52af0 100644
--- a/drivers/usb/gadget/udc/tegra-xudc.c
+++ b/drivers/usb/gadget/udc/tegra-xudc.c
@@ -1026,9 +1026,9 @@ static void ep_wait_for_stopped(struct tegra_xudc *xudc, unsigned int ep)
 	xudc_writel(xudc, BIT(ep), EP_STOPPED);
 }
 
-static void ep_wait_for_inactive(struct tegra_xudc *xudc, unsigned int ep)
+static int ep_wait_for_inactive(struct tegra_xudc *xudc, unsigned int ep)
 {
-	xudc_readl_poll(xudc, EP_THREAD_ACTIVE, BIT(ep), 0);
+	return xudc_readl_poll(xudc, EP_THREAD_ACTIVE, BIT(ep), 0);
 }
 
 static void tegra_xudc_req_done(struct tegra_xudc_ep *ep,
@@ -1049,8 +1049,31 @@ static void tegra_xudc_req_done(struct tegra_xudc_ep *ep,
 					 (xudc->setup_state ==
 					  DATA_STAGE_XFER));
 	} else {
-		usb_gadget_unmap_request(&xudc->gadget, &req->usb_req,
-					 usb_endpoint_dir_in(ep->desc));
+		/*
+		 * Drain the endpoint DMA pipeline before unmapping.
+		 *
+		 * Under SMMU strict mode dma_unmap() synchronously
+		 * invalidates the IOVA TLB entry.  On Tegra186/194/234 the
+		 * XUDC appears to post the completion event when the DMA
+		 * write is dispatched to the AXI interconnect, before the
+		 * store is committed to memory.  A subsequent dma_unmap()
+		 * can remove the IOVA translation while the write is still
+		 * in-flight, triggering a translation fault (fsr=0x402) that
+		 * permanently wedges the bulk endpoint.
+		 *
+		 * Wait for EP_THREAD_ACTIVE to clear (endpoint sequencer
+		 * idle).  On timeout skip the unmap to avoid the SMMU fault;
+		 * the DMA mapping leaks but the hardware is already in an
+		 * unrecoverable state.
+		 */
+		if (!WARN_ONCE(ep_wait_for_inactive(xudc, ep->index),
+			       "ep%u: DMA drain timed out; skipping dma_unmap\n",
+			       ep->index)) {
+			/* MMIO read-back orders prior CPU writes to device memory. */
+			xudc_readl(xudc, EP_THREAD_ACTIVE);
+			usb_gadget_unmap_request(&xudc->gadget, &req->usb_req,
+						 usb_endpoint_dir_in(ep->desc));
+		}
 	}
 
 	spin_unlock(&xudc->lock);
@@ -1451,7 +1474,9 @@ __tegra_xudc_ep_dequeue(struct tegra_xudc_ep *ep,
 	/* Halt DMA for this endpoint. */
 	if (ep_ctx_read_state(ep->context) == EP_STATE_RUNNING) {
 		ep_pause(xudc, ep->index);
-		ep_wait_for_inactive(xudc, ep->index);
+		if (ep_wait_for_inactive(xudc, ep->index))
+			dev_warn(xudc->dev, "ep%u: DMA drain timed out during dequeue\n",
+				 ep->index);
 	}
 
 	deq_trb = trb_phys_to_virt(ep, ep_ctx_read_deq_ptr(ep->context));
-- 
2.25.1


