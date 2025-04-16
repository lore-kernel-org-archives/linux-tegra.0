Received: from air.basealt.ru (air.basealt.ru [193.43.8.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63CB3241698;
	Wed, 16 Apr 2025 12:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.43.8.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744804806; cv=none; b=pUWWcwZb0x47nOAA+VGYeEDsQsY6S+NxYg/TNYxfX0OUZYnJZzIk7kYrgtUs7wf5UIJIHCS/6WLzSwnLP9T1vb696d8WxzFNW2ctqaG0wjXxY6VtybDmYo/9/IyoFk91tWBYVMRvQCqViTtBiRWsNqtiHhKjd0Cdt1vQXv+qOD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744804806; c=relaxed/simple;
	bh=Okifm/p759w941HYWQkEuQH9CmY2eKRIaFW7JAx6tfg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KxxZ607KUaVrS71AosC2vMMccOQ33iw+CbLfJIsXabWo0gAnJY6IP8k+6zoFMoKj7razx3bSOC8/GyfcfZ+i7SRJ3q74+F7CvJkuSpOF0sTDqyLtZG78UF8nQwH04w6ljEhpZk9KbFN9hPSSRengs/XYc77Umec1tcxs4ERvOew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=altlinux.org; spf=pass smtp.mailfrom=basealt.ru; arc=none smtp.client-ip=193.43.8.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=altlinux.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=basealt.ru
Received: from localhost (broadband-46-242-4-129.ip.moscow.rt.ru [46.242.4.129])
	(Authenticated sender: gremlin)
	by air.basealt.ru (Postfix) with ESMTPSA id BFC95233A3;
	Wed, 16 Apr 2025 15:00:00 +0300 (MSK)
Date: Wed, 16 Apr 2025 15:00:00 +0300
From: "Alexey V. Vissarionov" <gremlin@altlinux.org>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: "Alexey V. Vissarionov" <gremlin@altlinux.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Uwe Kleine-Knig <u.kleine-koenig@baylibre.com>,
	Nagarjuna Kristam <nkristam@nvidia.com>, linux-usb@vger.kernel.org,
	linux-tegra@vger.kernel.org, lvc-project@linuxtesting.org
Subject: [PATCH v2] usb: tegra-xudc: check ep and ep->desc before deref
Message-ID: <20250416120000.GD27292@altlinux.org>
References: <20250415174204.GB6814@altlinux.org>
 <79265b11-c23a-4e4e-b7c3-6cf5b89b9977@nvidia.com>
 <20250416095555.GB27292@altlinux.org>
 <6e0b8bb7-c9c4-4625-bad0-552dcad89ea0@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=koi8-r
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6e0b8bb7-c9c4-4625-bad0-552dcad89ea0@nvidia.com>

Check ep before dereferencing it in trb_phys_to_virt() and ep->desc
before dereferencing it in tegra_xudc_req_done()

Found by ALT Linux Team (altlinux.org) and Linux Verification Center
(linuxtesting.org)

Fixes: 49db427232fe ("usb: gadget: Add UDC driver for tegra XUSB device mode controller")
Signed-off-by: Alexey V. Vissarionov <gremlin@altlinux.org>
---
 drivers/usb/gadget/udc/tegra-xudc.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/gadget/udc/tegra-xudc.c b/drivers/usb/gadget/udc/tegra-xudc.c
index c7fdbc55fb0b97ed..d61a0675e18f448f 100644
--- a/drivers/usb/gadget/udc/tegra-xudc.c
+++ b/drivers/usb/gadget/udc/tegra-xudc.c
@@ -2658,9 +2658,21 @@ static void tegra_xudc_handle_transfer_completion(struct tegra_xudc *xudc,
 	short_packet = (trb_read_cmpl_code(event) ==
 			TRB_CMPL_CODE_SHORT_PACKET);
 
+	/* trb_phys_to_virt() dereferences ep; check it here */
+	if (!ep) {
+		dev_err(xudc->dev, "unexpected NULL pointer: ep\n");
+		return;
+	}
+
 	trb = trb_phys_to_virt(ep, trb_read_data_ptr(event));
 	req = trb_to_request(ep, trb);
 
+	/* tegra_xudc_req_done() dereferences ep->desc; check it here */
+	if (!ep->desc) {
+		dev_err(xudc->dev, "unexpected NULL pointer: ep->desc\n");
+		return;
+	}
+
 	/*
 	 * TDs are complete on short packet or when the completed TRB is the
 	 * last TRB in the TD (the CHAIN bit is unset).
@@ -2678,7 +2690,7 @@ static void tegra_xudc_handle_transfer_completion(struct tegra_xudc *xudc,
 
 		tegra_xudc_req_done(ep, req, 0);
 
-		if (ep->desc && usb_endpoint_xfer_control(ep->desc))
+		if (usb_endpoint_xfer_control(ep->desc))
 			tegra_xudc_ep0_req_done(xudc);
 
 		/*
@@ -2694,8 +2706,7 @@ static void tegra_xudc_handle_transfer_completion(struct tegra_xudc *xudc,
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
