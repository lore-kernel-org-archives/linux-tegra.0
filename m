Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4E14392C5A
	for <linux-tegra@vger.kernel.org>; Mon, 13 Jul 2026 07:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783928959; cv=none; b=g2MnLMc3Pu31bsP+B3EzbwjQTE/iPdKxUW3l9P22JkP1XjsY94ZxMPSReOfY6mFvLaqBPL/Ou8bhvZQ27pVeFNSAbYXWto8czVNMstzCtv1K9dJcMnvk5Fz8ULj3YUW66S80pBUoUrVzpCt/DajPmd5Dl9Plg+3Ca172Mzyn7j0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783928959; c=relaxed/simple;
	bh=ezsg2AOmrKM5FPpRSvwQBgIf+v7yaFU9LPan/rSwf2Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lDArwO1LSY+FybSu4LZXujfxmdPtR4p59ufC9f5XYThuEAagH5Err8Wcogf/IyuqM4KjN269x9uWjnq4rGZ4dByr3OZQYshU5OdXjiB17vuj5GFhh9jg20wuVEqCylpTt2+1J/JHR//cAcGx3SzzHV8dc1ONvL8F2Eig87Zw9Zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xnw9RqL7; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xnw9RqL7"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5aeb77b3afbso2780280e87.1
        for <linux-tegra@vger.kernel.org>; Mon, 13 Jul 2026 00:49:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783928956; x=1784533756; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IhBptR0856mA7x4upmTCTlL4N4Ll18gQEKUqog0l9So=;
        b=Xnw9RqL7fI3e1jk6r1SIh8rS1+GAq4BlluarmYFCW/WhyDSwNj8clJYt85vqKlpUc7
         1por4W71IxYTMG5e5rZMD45hzgBWszv3HtxtaWl99eIShL5FjgKo4NObkz88LyCTbNOD
         +4+1sNg93OazuN336Y+Rvlqa0ybfuJmhafMwCMzM+G7LyKBZTbXIeIWNjtK62fMjR4MY
         H1LopoMvhPaTOaAtwT3wwlDlHBgMvWJLfu2Sqxex/1gB2VtUCksT8B3E2lupB7dD8fm1
         qlOawaYRMDlV1rgcW/Xy9Tu0iqmf6kO33NDb3b2B6gwckp45eaAeBUuwxIASrgPfGb5x
         DBEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783928956; x=1784533756;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IhBptR0856mA7x4upmTCTlL4N4Ll18gQEKUqog0l9So=;
        b=mib9dZ77Y/U70gz3g5z4vPyFkcQnFI0vevIK0nylGzxsbjoThDn93M0Z/cMVWF0+QQ
         uCNVYuFPdRrbZY3CO9qmMR35l785kxsuD54+UslUfHkB2rONeLgPc6UUX+ol88LKpzcU
         IbHmMkoYNEt0noUdkamQAR82E4vtE0HKUWTWHVTKRmxOQTPZ67iM/DnuUbiVZ4VMMSh3
         DwkGA6pl6i0uiZbutvbot5cGYyPQJ7adpRVkW02/u6nBFzr5ofzR8OCwJl9azhLZu3Jt
         Nq4cUcsJlzFVg6VdBYufc5vYIfjA8//A0ydyNe76y7NsRfs2E2Q2dlvvkwriilrXxdj5
         E1jA==
X-Forwarded-Encrypted: i=1; AHgh+Rq/HhVhd4GppvWOWCg1dX0JIJhC4+FhDW+zM+LwUFBdfHDUG1oSlB8CGiHj1F2jqH0OzCsaE1KL5SabrA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4gnPgXNZW3HGuuIVG5Nxu3YIs0KY2Pktc1ntYKKfxRpZ40S+K
	2pfKio0LDeB/j7Ox+0KszuTw63n+5uyWFnWmg3Z8FGf6Sg5ZqVGo5XOj0x8thBPsKB2qlw==
X-Gm-Gg: AfdE7cn+2aLwjUY9iPWkA85jSY3jxMTSEszIifl8b22LzrRlgl+cmnfDyZwGb9Rw1bz
	BdpNx2SEEbbD8/l5Be+CUlnGUAphn12I2PqhMm2UYygyU4MoQCuDoyndZVI/A1PLQdD2qRm4zBQ
	5aZBgwE1kdAFAQdKkTbz5YL+TbrYDr1/jPmfJBS8aDbsW+jX5fYTTaWgOvZ9QklA2ByZ4HvWzzB
	JcN/vjn6BOfLNZ3X97EpbcY3FJtvx6aTt+P75tC0oCSGG2SgsxHJYPBoHtgIWZFsKmqOdaZJyrI
	2E6vZRhAVHKL+KzSjtzeJJH2yMKdbcv9E0VyxoPhH/FIIFMUII0v6C9rZfCTskBFeyCE77BWgAx
	enuyxR+VHo31jrQlEGjFXNWrxeGZkhFH9ooh4UTPNbfoSKN+AMG+evUqrjnyhPU2iDYSLLJgwjT
	/tNwyIvdfjoQ+wNuO15gnWNaXlD7YnLf/pwzrkKSVIPeSzKYdTWQW8lg2V8jAb6xBlQLxn95iJG
	UACJQ==
X-Received: by 2002:ac2:50a2:0:b0:5ae:d7dd:5815 with SMTP id 2adb3069b0e04-5b02369c7b7mr1069316e87.41.1783928955715;
        Mon, 13 Jul 2026 00:49:15 -0700 (PDT)
Received: from jeeves.tailc718e.ts.net (91-157-100-11.elisa-laajakaista.fi. [91.157.100.11])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b01caab9e5sm2645037e87.67.2026.07.13.00.49.12
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 13 Jul 2026 00:49:13 -0700 (PDT)
From: vadik likholetov <vadikas@gmail.com>
To: netdev@vger.kernel.org
Cc: maxime.chevallier@bootlin.com,
	andrew@lunn.ch,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	thierry.reding@kernel.org,
	jonathanh@nvidia.com,
	vbhadram@nvidia.com,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v3] net: stmmac: enable the MAC on link up for all supported speeds
Date: Mon, 13 Jul 2026 10:49:11 +0300
Message-ID: <20260713074911.30090-1-vadikas@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

stmmac_mac_link_down() clears the MAC's transmit and receive enable bits.
stmmac_mac_link_up() is expected to set them again through
stmmac_mac_set(..., true), but it first switches on the negotiated speed
and returns early for a speed the switch does not list. The MAC is then
left gated off.

The speed selection is split into three switches, keyed on the interface.
The generic branch -- taken for everything that is neither USXGMII nor
XLGMII, so including PHY_INTERFACE_MODE_10GBASER -- lists only SPEED_2500,
SPEED_1000, SPEED_100 and SPEED_10.

MGBE on Tegra234 runs 10GBASE-R into an Aquantia AQR113C. That PHY does
rate matching, so phylink_link_up() replaces the media speed with the
MAC-side interface speed before calling into the MAC:

	case RATE_MATCH_PAUSE:
		speed = phylink_interface_max_speed(link_state.interface);
		duplex = DUPLEX_FULL;

The driver is therefore called as

	stmmac_mac_link_up(interface=10GBASER, speed=10000, duplex=1)

which falls through to "default: return;". The interface stops passing
traffic after the first link flap.

The failure is easy to misread. The link still comes up, because the PHY
is polled over MDIO and needs no MAC, so the interface reports carrier 1
at the media speed. The DMA is untouched, so its start bits stay set and
descriptors are still consumed. Only the MAC itself is gated off: the
receiver counts nothing (mmc_rx_framecount_gb stops advancing, RE is 0)
and nothing reaches the wire (TE is 0). The interface survives boot only
because stmmac_hw_setup(), called from ndo_open, enables the MAC
unconditionally -- so the problem appears only once the cable has been
unplugged and plugged back in, and "ip link set dev <ethX> down && ip
link set dev <ethX> up" appears to fix it.

The interface is not what the speed bits depend on: with the single
exception of 2.5G, which is selected through the XGMII block on USXGMII
and through the regular speed bits otherwise, each speed maps to one
field of struct mac_link. The per-interface switches are speed
validation, and phylink already validates the speed against
priv->hw->link.caps. So collapse the three switches into one keyed on the
speed alone, keeping the interface test only for the 2.5G case. This
covers 10G on 10GBASE-R, and equally 5G, and 1G/100/10 on USXGMII, all of
which hit "default: return;" today.

A core that does not support a speed leaves the corresponding mac_link
field at 0, and phylink will not offer it that speed in the first place.
For dwxgmac2 at 10G, link.xgmii.speed10000 is XGMAC_CONFIG_SS_10000,
which is 0 and is the correct speed selection for a 10GBASE-R MAC: ctrl
then equals old_ctrl, the register write is skipped, and execution
reaches stmmac_mac_set(..., true).

Log an error in the default case, since a speed with no entry here leaves
the MAC disabled and the symptom does not point at the cause.

Fixes: d8ca113724e7 ("net: stmmac: tegra: Add MGBE support")
Suggested-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Signed-off-by: vadik likholetov <vadikas@gmail.com>
---
v3:
 - Use phy_speed_to_str() rather than %d for the speed in the error
   message (Maxime).
 - Resend as a standalone thread rather than a reply to v1 (Maxime).

v2:
 - Collapse the three per-interface switches into a single switch on the
   speed, rather than adding SPEED_10000 to the generic branch, which
   left SPEED_5000 and the USXGMII sub-1G speeds broken (Maxime).
 - netdev_err() in the default case (Andrew).

Fixes tag: the missing speeds predate the commit cited above. I picked
d8ca113724e7 because MGBE is the first in-tree user to reach it -- it
needs a 10GBASE-R interface driven by a rate-matching PHY, so that
phylink hands the MAC a 10G speed. Happy to re-target it.

Verified on an AGX Orin devkit (Tegra234 MGBE0 + AQR113C), before and
after, on the same board and cable. MAC registers read with `ethtool -d`,
after a physical unplug and replug:

  stock		MAC_TX_CONFIG 0x00010000 (TE=0)
		MAC_RX_CONFIG 0x3ff022c0 (RE=0)
		rx_packets frozen, DHCP lease lost

  patched	MAC_TX_CONFIG 0x00010001 (TE=1)
		MAC_RX_CONFIG 0x3ff022c1 (RE=1)
		rx_packets keeps climbing, DHCP lease retained

Only the 10GBASE-R path is covered by hardware here; the other speeds are
by inspection. Testing was done with MGBE0 handed to a VM via
vfio-platform, so the driver ran in a guest; the MAC register evidence
above is read from the device itself and the code path is not
virtualisation-specific.

 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 92 ++++++++-----------
 1 file changed, 37 insertions(+), 55 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 2a0d7eff8..8d3d87549 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1083,63 +1083,45 @@ static void stmmac_mac_link_up(struct phylink_config *config,
 	old_ctrl = readl(priv->ioaddr + MAC_CTRL_REG);
 	ctrl = old_ctrl & ~priv->hw->link.speed_mask;
 
-	if (interface == PHY_INTERFACE_MODE_USXGMII) {
-		switch (speed) {
-		case SPEED_10000:
-			ctrl |= priv->hw->link.xgmii.speed10000;
-			break;
-		case SPEED_5000:
-			ctrl |= priv->hw->link.xgmii.speed5000;
-			break;
-		case SPEED_2500:
+	switch (speed) {
+	case SPEED_100000:
+		ctrl |= priv->hw->link.xlgmii.speed100000;
+		break;
+	case SPEED_50000:
+		ctrl |= priv->hw->link.xlgmii.speed50000;
+		break;
+	case SPEED_40000:
+		ctrl |= priv->hw->link.xlgmii.speed40000;
+		break;
+	case SPEED_25000:
+		ctrl |= priv->hw->link.xlgmii.speed25000;
+		break;
+	case SPEED_10000:
+		ctrl |= priv->hw->link.xgmii.speed10000;
+		break;
+	case SPEED_5000:
+		ctrl |= priv->hw->link.xgmii.speed5000;
+		break;
+	case SPEED_2500:
+		if (interface == PHY_INTERFACE_MODE_USXGMII)
 			ctrl |= priv->hw->link.xgmii.speed2500;
-			break;
-		default:
-			return;
-		}
-	} else if (interface == PHY_INTERFACE_MODE_XLGMII) {
-		switch (speed) {
-		case SPEED_100000:
-			ctrl |= priv->hw->link.xlgmii.speed100000;
-			break;
-		case SPEED_50000:
-			ctrl |= priv->hw->link.xlgmii.speed50000;
-			break;
-		case SPEED_40000:
-			ctrl |= priv->hw->link.xlgmii.speed40000;
-			break;
-		case SPEED_25000:
-			ctrl |= priv->hw->link.xlgmii.speed25000;
-			break;
-		case SPEED_10000:
-			ctrl |= priv->hw->link.xgmii.speed10000;
-			break;
-		case SPEED_2500:
-			ctrl |= priv->hw->link.speed2500;
-			break;
-		case SPEED_1000:
-			ctrl |= priv->hw->link.speed1000;
-			break;
-		default:
-			return;
-		}
-	} else {
-		switch (speed) {
-		case SPEED_2500:
+		else
 			ctrl |= priv->hw->link.speed2500;
-			break;
-		case SPEED_1000:
-			ctrl |= priv->hw->link.speed1000;
-			break;
-		case SPEED_100:
-			ctrl |= priv->hw->link.speed100;
-			break;
-		case SPEED_10:
-			ctrl |= priv->hw->link.speed10;
-			break;
-		default:
-			return;
-		}
+		break;
+	case SPEED_1000:
+		ctrl |= priv->hw->link.speed1000;
+		break;
+	case SPEED_100:
+		ctrl |= priv->hw->link.speed100;
+		break;
+	case SPEED_10:
+		ctrl |= priv->hw->link.speed10;
+		break;
+	default:
+		netdev_err(priv->dev,
+			   "unsupported speed %s on %s, leaving the MAC disabled\n",
+			   phy_speed_to_str(speed), phy_modes(interface));
+		return;
 	}
 
 	if (priv->plat->fix_mac_speed)
-- 
2.53.0

