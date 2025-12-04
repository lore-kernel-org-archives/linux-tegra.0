Received: from smtp2.tecnico.ulisboa.pt (smtp2.tecnico.ulisboa.pt [193.136.128.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35F7E307AF7;
	Thu,  4 Dec 2025 21:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.136.128.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764884242; cv=none; b=JERUuWWSYkl/gQEcJTnZ2EWLeDhA52Ta5CQg048KutNKDfbsccQUsn3ZfQz/kxUy6P5rnjGgLq6zcM10grTYF2OFdDLS69BGMhaWUUndfhnLiOC+yLbQamE93tFJwcl9d8NKzrI11QeMzLu3Qg4DL2GPwfrvyJdPPrTattHFKcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764884242; c=relaxed/simple;
	bh=w6fVfOXdVz6LTWwtRSJOAjJ+BIeklHmzE7MoA8q2mpM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gAGd0/psLMQmdvRY4dntrrjBX6A26BYq4V2xgK72EajoTmjOvtx7YYlCrQRIQ93iT0/tbCipqzmQdfHGHOdCEnbNRZviJBQ7UjxtA03e3YUAHWoRIF2vx+vFOoN3eoMABVL7wQP4MtxvP9rQITGQbkjS3qx23u8SprOxxnbfbBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt; spf=pass smtp.mailfrom=tecnico.ulisboa.pt; dkim=pass (2048-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b=ij9SJ9fB; arc=none smtp.client-ip=193.136.128.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b="ij9SJ9fB"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by smtp2.tecnico.ulisboa.pt (Postfix) with ESMTP id 2B75D245442;
	Thu,  4 Dec 2025 21:27:30 +0000 (WET)
X-Virus-Scanned: by amavis-2.13.0 (20230106) (Debian) at tecnico.ulisboa.pt
Received: from smtp2.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp2.tecnico.ulisboa.pt [127.0.0.1]) (amavis, port 10025)
 with LMTP id 6OYoCyNrcuP8; Thu,  4 Dec 2025 21:27:28 +0000 (WET)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [IPv6:2001:690:2100:1::b3dd:b9ac])
	by smtp2.tecnico.ulisboa.pt (Postfix) with ESMTPS id 0C2732453F1;
	Thu,  4 Dec 2025 21:27:26 +0000 (WET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tecnico.ulisboa.pt;
	s=mail2; t=1764883646;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IYNRE9yHL8E4dpaM7LuZEB4UxBbEOcv5tHwJnXhtPMM=;
	b=ij9SJ9fB6tXPhCXQLw8bBGmTjBEKIQiIWzMhKVp5l4lR50m0xY67LpsrrYTY2uDw2lIBbM
	kEuyCt5X4u+xYNUYol89sNXqSrJL3FKHqjp2JpoVzARS+MN21LLrAZRhn+zgn2Hnvu++XW
	+SYnzdeSNdsfHUumh+xJRQZqlYnd4rybPBnPLRPLMDXhP9kNcanoNYRUR+IWY03xYgqWgC
	pkfpz3fWMO3UncGXLDTkzI4J3TFtHeOGlJsIy97LYcXB7xwYU90+oGWCraYv6wU26urbvF
	7ev66hfUtENn3Ad+pkyXDLw20rEcoNk86jiA7IRrJgj9qkZdKVUbi8A6jd6uVw==
Received: from [192.168.1.151] (unknown [IPv6:2001:8a0:57db:f00:3ee2:38aa:e2c9:7dde])
	(Authenticated sender: ist187313)
	by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id D5B7A36013B;
	Thu,  4 Dec 2025 21:27:25 +0000 (WET)
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Date: Thu, 04 Dec 2025 21:27:18 +0000
Subject: [PATCH 2/5] phy: tegra: xusb: Fix USB2 port regulator disable
 logic
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251204-diogo-tegra_phy-v1-2-51a2016d0be8@tecnico.ulisboa.pt>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764883644; l=2313;
 i=diogo.ivo@tecnico.ulisboa.pt; s=20240529; h=from:subject:message-id;
 bh=w6fVfOXdVz6LTWwtRSJOAjJ+BIeklHmzE7MoA8q2mpM=;
 b=xRg0NMEvSnEuvWGJPw3JTgMP9jYi7exp/trncl53q53RM2rVrIznZUm7UPC1b3LqoqYoftvIh
 OiY87L+0dVSA29+4EHlRBBVYE9OAUut41cHcc7CpmyKFQCTGVkFqyWw
X-Developer-Key: i=diogo.ivo@tecnico.ulisboa.pt; a=ed25519;
 pk=BRGXhMh1q5KDlZ9y2B8SodFFY8FGupal+NMtJPwRpUQ=

The USB2 PHY mode handling on Tegra210 incorrectly relied on
regulator_is_enabled() when determining whether the VBUS supply should
be disabled during role changes. This is because regulator_is_enabled()
reports exactly what is states and not if there is an unbalanced number
of calls between regulator_enable() and regulator_disable(). For
example, regulator_is_enabled() always reports true on a fixed-regulator
with no enable gpio, which is the case on the Pixel C.

This then leads to the PHY driver wrongfully calling regulator_disable()
when transitioning from USB_ROLE_DEVICE to USB_ROLE_NONE since the driver
did not previously call the corresponding regulator_enable().

Fix this by keeping track of the current role and updating the logic to
disable the regulator only when the previous role was USB_ROLE_HOST.

While at it fix a small typo in a comment.

Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
---
 drivers/phy/tegra/xusb-tegra210.c | 5 +++--
 drivers/phy/tegra/xusb.h          | 1 +
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/tegra/xusb-tegra210.c b/drivers/phy/tegra/xusb-tegra210.c
index 3409924498e9..63ad57d95514 100644
--- a/drivers/phy/tegra/xusb-tegra210.c
+++ b/drivers/phy/tegra/xusb-tegra210.c
@@ -1934,9 +1934,9 @@ static int tegra210_usb2_phy_set_mode(struct phy *phy, enum phy_mode mode,
 			/*
 			 * When port is peripheral only or role transitions to
 			 * USB_ROLE_NONE from USB_ROLE_DEVICE, regulator is not
-			 * be enabled.
+			 * enabled.
 			 */
-			if (regulator_is_enabled(port->supply))
+			if (port->role == USB_ROLE_HOST)
 				regulator_disable(port->supply);
 
 			tegra210_xusb_padctl_id_override(padctl, false);
@@ -1944,6 +1944,7 @@ static int tegra210_usb2_phy_set_mode(struct phy *phy, enum phy_mode mode,
 		}
 	}
 
+	port->role = submode;
 	mutex_unlock(&padctl->lock);
 
 	return err;
diff --git a/drivers/phy/tegra/xusb.h b/drivers/phy/tegra/xusb.h
index d2b5f9565132..273af147dfd3 100644
--- a/drivers/phy/tegra/xusb.h
+++ b/drivers/phy/tegra/xusb.h
@@ -317,6 +317,7 @@ struct tegra_xusb_usb2_port {
 	enum usb_dr_mode mode;
 	bool internal;
 	int usb3_port_fake;
+	enum usb_role role;
 };
 
 static inline struct tegra_xusb_usb2_port *

-- 
2.52.0

