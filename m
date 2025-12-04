Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt [193.136.128.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 509852FBDFF;
	Thu,  4 Dec 2025 21:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.136.128.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764884228; cv=none; b=WgcyfSFf+BEiHG7oyps7J4FVYrTO34BYQuQONf3MslN34xksZrwALvsz1D3XdEVYCEWVxB8Ft2Zrv/wFV5mNzVz+pz/K1Wj0SFGFzHtkkibYMaVOlVpjYImARnBwwl18+tFci3RwaWuiu9TAXllSGDvnfzGKuGezHUlhg9aR3eA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764884228; c=relaxed/simple;
	bh=7Bhceul0Djmy/FTqFXQ8yH/nOs3uT2cr4R1ec8CPF5U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GKmCT1EgHdId6KnCSrsVIVJ1/NMx2wwxwu65j8JXBfEE+UOzzcKCfk/EUS5GiKfHHLjTyCzbgRiL7pE21sEksWoB51SAqb2171DQdxMvhvW63dvSE7cty9G+3vCRx73lJClHHkbeUi44qe6navmEbvw5JSdF9jk6MdIbFTLF5fI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt; spf=pass smtp.mailfrom=tecnico.ulisboa.pt; dkim=pass (2048-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b=caq+uw9w; arc=none smtp.client-ip=193.136.128.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b="caq+uw9w"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id 636D26007C0E;
	Thu,  4 Dec 2025 21:27:30 +0000 (WET)
X-Virus-Scanned: by amavis-2.13.0 (20230106) (Debian) at tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavis, port 10025)
 with LMTP id BGUSO3u_jN07; Thu,  4 Dec 2025 21:27:28 +0000 (WET)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [IPv6:2001:690:2100:1::b3dd:b9ac])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id E1D0D6007C1A;
	Thu,  4 Dec 2025 21:27:25 +0000 (WET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tecnico.ulisboa.pt;
	s=mail2; t=1764883646;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=i2xJ/PFmcIyGi2LSxLsJ2Rs5bQ0h4NEOjIa44Tuehhw=;
	b=caq+uw9wNmaYLrBjvqhTf7/lFDUe9ka5PtWeIlUrVyBZRPzqO1ZGVGONmW90vhOTs05ai9
	VWJuGEz3e4P9WBw2C/r0pTi4Lo2QwyNWcNdB6qEKzULsY1KkKM4dHNJYOr/pKIfScQHMdc
	VLV/E1eHRACHg55Nm0phIWWkLVuaImKr+C2VF93JY+zc6CdASHVWBfCuUlxFJ1FdBjaThW
	tnXujGa92x5Gy5d+OAi7rnjJQ92cqhRqgMcAH0KScW+HVeGWKLzTUb8GBkCLjyFNQq6kCL
	DRv7Q+r63gQmfa2ONzwhWYOlXRw6h7Xbs60yopU7nHPlUccmR2hL4LrTLSfKuQ==
Received: from [192.168.1.151] (unknown [IPv6:2001:8a0:57db:f00:3ee2:38aa:e2c9:7dde])
	(Authenticated sender: ist187313)
	by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id B968436013A;
	Thu,  4 Dec 2025 21:27:25 +0000 (WET)
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Date: Thu, 04 Dec 2025 21:27:17 +0000
Subject: [PATCH 1/5] usb: host: tegra: Remove redundant
 pm_runtime_mark_last_busy() call
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251204-diogo-tegra_phy-v1-1-51a2016d0be8@tecnico.ulisboa.pt>
References: <20251204-diogo-tegra_phy-v1-0-51a2016d0be8@tecnico.ulisboa.pt>
In-Reply-To: <20251204-diogo-tegra_phy-v1-0-51a2016d0be8@tecnico.ulisboa.pt>
To: Mathias Nyman <mathias.nyman@intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, JC Kuo <jckuo@nvidia.com>, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764883644; l=780;
 i=diogo.ivo@tecnico.ulisboa.pt; s=20240529; h=from:subject:message-id;
 bh=7Bhceul0Djmy/FTqFXQ8yH/nOs3uT2cr4R1ec8CPF5U=;
 b=MSFpWziUnBc/OPf/yhVMRKv6Ok/jVF90lG2n6xG4zPodbFDYWpxS6sqYuBVXaUgIVZHBYEOuu
 zcCx9l7YBjkBXgP/LpUKBo3mcNEBo57EXVFGdhxhMwKm+/I/7MbwEx8
X-Developer-Key: i=diogo.ivo@tecnico.ulisboa.pt; a=ed25519;
 pk=BRGXhMh1q5KDlZ9y2B8SodFFY8FGupal+NMtJPwRpUQ=

As pm_runtime_put_autosuspend() called at the end of tegra_xhci_id_work()
already calls pm_runtime_mark_last_busy() remove the prior redundant call.

Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
---
 drivers/usb/host/xhci-tegra.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
index 5255b1002893..9c69fccdc6e8 100644
--- a/drivers/usb/host/xhci-tegra.c
+++ b/drivers/usb/host/xhci-tegra.c
@@ -1399,8 +1399,6 @@ static void tegra_xhci_id_work(struct work_struct *work)
 		}
 
 		tegra_xhci_set_port_power(tegra, true, true);
-		pm_runtime_mark_last_busy(tegra->dev);
-
 	} else {
 		if (tegra->otg_usb3_port >= 0)
 			tegra_xhci_set_port_power(tegra, false, false);

-- 
2.52.0

