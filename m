Received: from air.basealt.ru (air.basealt.ru [193.43.8.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8CDD2260C;
	Tue, 15 Apr 2025 17:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.43.8.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744738932; cv=none; b=TkgUYcYY7u4IDQdBJqNsh7CJVBeVPXkm9+hNxp3JvNziVALutvhemcyyR35LlYf+z2gV5X2RKMgn58ZdpUghhoSkDdga99gKWsHcAVoy6I17PQjIZeIlinmRqZGPBYVHo3oje5N6lAXotd2lit++RShzfxzRFv510yPAEeLXl48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744738932; c=relaxed/simple;
	bh=g2timJ2x6HC90A+91+Twr37DLBayUHwEXu33vTYCSNc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EgqO+QdVb15bQ5JhVSxMuf0aK+2KDUDbwN09bX6eyQcayoLUwM6RrIXZqEqr/fq6e3t6ix03VRHYpQtkShiKeqtrJmETlv2k4+jN2D6GZQoDc09MmC0iP68EOljLH3WXwBY9Zywzb1Cww2K/dmH12KWI/Vzje7vZnBxxnDkFCrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=altlinux.org; spf=pass smtp.mailfrom=basealt.ru; arc=none smtp.client-ip=193.43.8.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=altlinux.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=basealt.ru
Received: from localhost (broadband-46-242-4-129.ip.moscow.rt.ru [46.242.4.129])
	(Authenticated sender: gremlin)
	by air.basealt.ru (Postfix) with ESMTPSA id E27B12337F;
	Tue, 15 Apr 2025 20:42:04 +0300 (MSK)
Date: Tue, 15 Apr 2025 20:42:04 +0300
From: "Alexey V. Vissarionov" <gremlin@altlinux.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	"Alexey V. Vissarionov" <gremlin@altlinux.org>,
	Felipe Balbi <felipe.balbi@linux.intel.com>,
	Nagarjuna Kristam <nkristam@nvidia.com>, linux-usb@vger.kernel.org,
	linux-tegra@vger.kernel.org, lvc-project@linuxtesting.org
Subject: [PATCH] usb: tegra-xudc: check ep->desc before dereferencing
Message-ID: <20250415174204.GB6814@altlinux.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=koi8-r
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Check ep->desc before dereferencing it in tegra_xudc_req_done() call
and later in this function tegra_xudc_handle_transfer_completion()

Found by ALT Linux Team (altlinux.org) and Linux Verification Center
(linuxtesting.org)

Fixes: 49db427232fe ("usb: gadget: Add UDC driver for tegra XUSB device mode controller")
Signed-off-by: Alexey V. Vissarionov <gremlin@altlinux.org>
---
 drivers/usb/gadget/udc/tegra-xudc.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/gadget/udc/tegra-xudc.c b/drivers/usb/gadget/udc/tegra-xudc.c
index c7fdbc55fb0b97ed..0322e984e2c6fd91 100644
--- a/drivers/usb/gadget/udc/tegra-xudc.c
+++ b/drivers/usb/gadget/udc/tegra-xudc.c
@@ -2661,6 +2661,10 @@ static void tegra_xudc_handle_transfer_completion(struct tegra_xudc *xudc,
 	trb = trb_phys_to_virt(ep, trb_read_data_ptr(event));
 	req = trb_to_request(ep, trb);
 
+	/* tegra_xudc_req_done() dereferences ep->desc; check it here */
+	if (!ep || !ep->desc)
+		return;
+
 	/*
 	 * TDs are complete on short packet or when the completed TRB is the
 	 * last TRB in the TD (the CHAIN bit is unset).
@@ -2678,7 +2682,7 @@ static void tegra_xudc_handle_transfer_completion(struct tegra_xudc *xudc,
 
 		tegra_xudc_req_done(ep, req, 0);
 
-		if (ep->desc && usb_endpoint_xfer_control(ep->desc))
+		if (usb_endpoint_xfer_control(ep->desc))
 			tegra_xudc_ep0_req_done(xudc);
 
 		/*
@@ -2694,8 +2698,7 @@ static void tegra_xudc_handle_transfer_completion(struct tegra_xudc *xudc,
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
