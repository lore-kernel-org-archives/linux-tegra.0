Received: from air.basealt.ru (air.basealt.ru [193.43.8.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46DFC2417D6;
	Wed, 16 Apr 2025 09:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.43.8.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744797361; cv=none; b=LSnD0zyPUFiK7AX85Gasa22GSgHwGB8wvvuV8NezaQKNjCr5mxI2gcijffk59vGwau8Ns1YOXWgFu/FZmCHMQ61eRuBmMvr0L8C7mnANcGzoS6qHHo8AGi0qsp4w+uxNsmrec0V1WVPHwRzntCg9fQAsxOyy+jC/YAVsMaWhz00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744797361; c=relaxed/simple;
	bh=KQ5Xc5Z0JvRv2E3SsCbXG+cnjTXdZ256VX7EJo7YlIU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SyMXFTEhSlKEQ2PjW0E/j9Gi2R/363GTqyZ6wqRrN5of+An61hzLbmzERiCZScltsVMXJ4l/sh/j68ZarxTRkl5kGUAluG+wU1nOGeWUS73q4upwGtGw22Tq2i7LZvygLKjksIzTJ4Twu2b2FI1tq+Jk/hA7frmye9HQR0NfQkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=altlinux.org; spf=pass smtp.mailfrom=basealt.ru; arc=none smtp.client-ip=193.43.8.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=altlinux.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=basealt.ru
Received: from localhost (broadband-46-242-4-129.ip.moscow.rt.ru [46.242.4.129])
	(Authenticated sender: gremlin)
	by air.basealt.ru (Postfix) with ESMTPSA id ACC8E23339;
	Wed, 16 Apr 2025 12:55:55 +0300 (MSK)
Date: Wed, 16 Apr 2025 12:55:55 +0300
From: "Alexey V. Vissarionov" <gremlin@altlinux.org>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: "Alexey V. Vissarionov" <gremlin@altlinux.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Uwe Kleine-Knig <u.kleine-koenig@baylibre.com>,
	Felipe Balbi <felipe.balbi@linux.intel.com>,
	Nagarjuna Kristam <nkristam@nvidia.com>, linux-usb@vger.kernel.org,
	linux-tegra@vger.kernel.org, lvc-project@linuxtesting.org
Subject: [PATCH v1] usb: tegra-xudc: check ep and ep->desc before deref
Message-ID: <20250416095555.GB27292@altlinux.org>
References: <20250415174204.GB6814@altlinux.org>
 <79265b11-c23a-4e4e-b7c3-6cf5b89b9977@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=koi8-r
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <79265b11-c23a-4e4e-b7c3-6cf5b89b9977@nvidia.com>

Check ep before dereferencing it in trb_phys_to_virt() and ep->desc
before dereferencing it in tegra_xudc_req_done()

Found by ALT Linux Team (altlinux.org) and Linux Verification Center
(linuxtesting.org)

Fixes: 49db427232fe ("usb: gadget: Add UDC driver for tegra XUSB device mode controller")
Signed-off-by: Alexey V. Vissarionov <gremlin@altlinux.org>
---
 drivers/usb/gadget/udc/tegra-xudc.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/gadget/udc/tegra-xudc.c b/drivers/usb/gadget/udc/tegra-xudc.c
index c7fdbc55fb0b97ed..cae99ebe9f85868d 100644
--- a/drivers/usb/gadget/udc/tegra-xudc.c
+++ b/drivers/usb/gadget/udc/tegra-xudc.c
@@ -2658,9 +2658,23 @@ static void tegra_xudc_handle_transfer_completion(struct tegra_xudc *xudc,
 	short_packet = (trb_read_cmpl_code(event) ==
 			TRB_CMPL_CODE_SHORT_PACKET);
 
+	/* trb_phys_to_virt() dereferences ep; check it here */
+	if (!ep)
+	{
+		dev_err(xudc->dev, "Unbelievable: ep is NULL\n");
+		return;
+	}
+
 	trb = trb_phys_to_virt(ep, trb_read_data_ptr(event));
 	req = trb_to_request(ep, trb);
 
+	/* tegra_xudc_req_done() dereferences ep->desc; check it here */
+	if (!ep->desc)
+	{
+		dev_err(xudc->dev, "Unbelievable: ep->desc is NULL\n");
+		return;
+	}
+
 	/*
 	 * TDs are complete on short packet or when the completed TRB is the
 	 * last TRB in the TD (the CHAIN bit is unset).
@@ -2678,7 +2692,7 @@ static void tegra_xudc_handle_transfer_completion(struct tegra_xudc *xudc,
 
 		tegra_xudc_req_done(ep, req, 0);
 
-		if (ep->desc && usb_endpoint_xfer_control(ep->desc))
+		if (usb_endpoint_xfer_control(ep->desc))
 			tegra_xudc_ep0_req_done(xudc);
 
 		/*
@@ -2694,8 +2708,7 @@ static void tegra_xudc_handle_transfer_completion(struct tegra_xudc *xudc,
 		dev_warn(xudc->dev, "transfer event on dequeued request\n");
 	}
 
-	if (ep->desc)
-		tegra_xudc_ep_kick_queue(ep);
+	tegra_xudc_ep_kick_queue(ep);
 }
 
 static void tegra_xudc_handle_transfer_event(struct tegra_xudc *xudc,


-- 
Alexey V. Vissarionov
gremlin נעי altlinux פ‏כ org; +vii-cmiii-ccxxix-lxxix-xlii
GPG: 0D92F19E1C0DC36E27F61A29CD17E2B43D879005 @ hkp://keys.gnupg.net
