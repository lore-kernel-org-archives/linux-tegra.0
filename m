Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C40FD1DDC07
	for <linux-tegra@vger.kernel.org>; Fri, 10 Jul 2026 12:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783685367; cv=none; b=WQOMB0BJYdc1gMs5V++AvQJeyq7WZ0PVRMbCiaI/G5PkcodCzRJYlo9+TD9Ar/MFM6nfnRxGC/scciYHsoMviT5BSrWaVdHmpsD8Va7D2r3KPxW/hV/bgQS10nzitHXjasIeH9ytaLChgAoV2LE4axUYHkA5uqGMrzhQzN6xT6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783685367; c=relaxed/simple;
	bh=fpBBDrmrXq1aucFS/bbh7Cq7ulGOaKA6UoMOaOaAWPc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IYrC26PLxlZmyB8s5iGuhGp+4jjOHkoWUTKYmV13WFk+XXPd483v3oxwa68KmDcJZd4CJ7hyoNMNCeH9X2N3wobRc/Aglv063eXfb5xxLeaKe/poJjVNm+1vosMIyLvcNkPjtEyMYBBF0fRZZ3XbiIa7pIO36dIxC/jukknbJWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RpoVXz15; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RpoVXz15"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5aebc8cb5bcso619533e87.2
        for <linux-tegra@vger.kernel.org>; Fri, 10 Jul 2026 05:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783685364; x=1784290164; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=th2W9hmS5eUL+Nc6cqk7ifaLFgN1RmzPIQ5w3HUIf9E=;
        b=RpoVXz15WB6gFBX1WdD4QwhqynnPTfr5iJcN+Evi5iuBJn0IaqZg4IvQBAaY8WRTog
         4COP5TrQ4+zJ/qQafTWUa1fgaJQ+3wp2Q5su7xjIXfT+rCS02loSHGvKOQt12+45OJTK
         HlXfFjLedll9lt+9jzE4QR1FWggW8zRs3Z0CCaAle3uwWevIlIlttn+BYab3flrLGT/H
         4kaC+qkOETzLemdymMZKtOgvCIghtJG1/jwtLKWBg9T+MsfuLSykeBVaVzUW1N7obgVs
         J4SXiy90xhtLeK76XJwdcNM4Mr3+NNwP/Jgv+fx3bu2XGS2xqA8S+86JzcgeJrFjiYXC
         w/Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783685364; x=1784290164;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=th2W9hmS5eUL+Nc6cqk7ifaLFgN1RmzPIQ5w3HUIf9E=;
        b=D9lKh/7314pHuFvuCTIFS1Gci6oDIbhL2yTzkQH3GfWJnfbrCbOSdoEUYGinCngQDy
         8qv632/AcsdrhhTbvuAE9DhxqTpcPhlX5TpFn68hg2Dt53QcZ4TqJLBUMtKyGhBLpGfH
         /FbKxLaNwNDgvdq8VaNAV6HuRFJ5jOIs3FK3z+46E1GsMOdBWfKA0dAsy1UnbwTHcOet
         2NblAcCTYG6l4THZBF++Lpl5iGgdXDtVU9uTi2hvYSAlr7Wg2aH5KTqKG/9xvcyPx7F+
         Hq0zzzRDlCDCCWX/wipcoxcxm7AhSYNS2Lj1IrMk7KhWOiRuVPwi0ixbU/zBwhESHacl
         q8OQ==
X-Forwarded-Encrypted: i=1; AHgh+RpvkdODvzj19261GjMwiFT/qVcwS71qulGjH5zlV9wlCUSTs+WEyZYLr0OvKGS0ovXK+GWjrg+aDLkWFQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxHEp3/VzxBwA4tz+TNG6qTXxEd7eyF3Cv8yI2k327He1mbyFGL
	a2rD3e/MQ5L0ssGJqytfKCWjF49vP4IMlOucmBPy/qjMiByB8JuiCBRdqSuQ3qfMGlVk0w==
X-Gm-Gg: AfdE7cnj5ZOnSmAlWO5dPAnNZ8sCdCMfnM0MwberwIV5lL4nJ/UUqapc7m8MjS95dPH
	QhUlkw3GneKeT6RLegXqhCAei84U8H39jRsznF+Njy0b88yzoU7WVQA/ehVy1JXJQqk/ZsSbnAE
	FpoJYJTV68pvpTYa6cm37cIj+9PLr2zMSV1YTXjcPUlpRQxlxnZyJBoDxfh/A2zq03YAokayskV
	bcdUieieKVk1fYGZ7pPxQi4j2z9pN8reaJar1lB1QWjKGGiJyTms8w82KjSi4247yAndLxeDwzw
	ZNOwFEY0M9m3bzRn61Em+ywovhqqZ7ZkD6e03dq6JU+hGPFiRr8YXJGulbyUJ3Ybjd91n+u0/AR
	zYsB3QesabxKZ+T+oq0yYg/J4wiKpLbe3WHWawE2eezgRTrkxvNXL+q2BQGrZGLc3r6chke4b5N
	F+05JEbuJQ9Ns1pKABoHebgpSpRygqDdiQ1Fj1EEHVI6XB7KU2jweiMjTr5iok8sSogMSWiV1b
X-Received: by 2002:a05:6512:689:b0:5ae:a9ec:bb21 with SMTP id 2adb3069b0e04-5b0115aea8dmr3096898e87.61.1783685363678;
        Fri, 10 Jul 2026 05:09:23 -0700 (PDT)
Received: from usccs-nostromo.tailc718e.ts.net (91-157-100-11.elisa-laajakaista.fi. [91.157.100.11])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b01cab1486sm544923e87.81.2026.07.10.05.09.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 05:09:23 -0700 (PDT)
From: vadik likholetov <vadikas@gmail.com>
To: netdev@vger.kernel.org
Cc: "Andrew Lunn" <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Bhadram Varka <vbhadram@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net] net: stmmac: enable the MAC on link up at 10G on 10GBASE-R
Date: Fri, 10 Jul 2026 15:09:03 +0300
Message-ID: <20260710120908.3731591-1-vadikas@gmail.com>
X-Mailer: git-send-email 2.54.0
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
and returns early for a speed it does not recognise.

The generic branch of that switch -- taken for every interface that is
neither USXGMII nor XLGMII, which includes PHY_INTERFACE_MODE_10GBASER --
handles only SPEED_2500, SPEED_1000, SPEED_100 and SPEED_10.

MGBE on Tegra234 runs 10GBASE-R into an Aquantia AQR113C. That PHY does
rate matching, so phylink_link_up() replaces the media speed with the
MAC-side interface speed before calling into the MAC:

	case RATE_MATCH_PAUSE:
		speed = phylink_interface_max_speed(link_state.interface);
		duplex = DUPLEX_FULL;

The driver is therefore called as

	stmmac_mac_link_up(interface=10GBASER, speed=10000, duplex=1)

which falls through to "default: return;". The MAC is never re-enabled,
and the interface stops passing traffic after the first link flap.

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

Handle SPEED_10000 in the generic branch, as the USXGMII and XLGMII
branches already do. For dwxgmac2, link.xgmii.speed10000 is
XGMAC_CONFIG_SS_10000, which is 0 and is the correct speed selection for
a 10GBASE-R MAC: ctrl then equals old_ctrl, the register write is
skipped, and execution reaches stmmac_mac_set(..., true).

Fixes: d8ca113724e7 ("net: stmmac: tegra: Add MGBE support")
Signed-off-by: vadik likholetov <vadikas@gmail.com>
---
Verified on an AGX Orin devkit (Tegra234 MGBE0 + AQR113C), before and
after, on the same board and cable. MAC registers read with
`ethtool -d`, after a physical unplug and replug:

  stock		MAC_TX_CONFIG 0x00010000 (TE=0)
		MAC_RX_CONFIG 0x3ff022c0 (RE=0)
		rx_packets frozen, DHCP lease lost

  patched	MAC_TX_CONFIG 0x00010001 (TE=1)
		MAC_RX_CONFIG 0x3ff022c1 (RE=1)
		rx_packets keeps climbing, DHCP lease retained

A kprobe trace of the stock kernel across a link flap shows the
mechanism directly -- dwxgmac2_set_mac(enable=1) never follows the
link-up:

  linkdown: (stmmac_mac_link_down+0x0/0xc8) iface=27
  setmac:   (dwxgmac2_set_mac+0x0/0x80) enable=0
  linkup:   (stmmac_mac_link_up+0x0/0x350) iface=27 speed=10000 duplex=1

(iface 27 is PHY_INTERFACE_MODE_10GBASER.)

Note on the Fixes tag: the missing SPEED_10000 case in the generic branch
predates the commit cited above. I picked d8ca113724e7 because MGBE is
the first in-tree user to reach it -- it needs a 10GBASE-R interface
driven by a rate-matching PHY, so that phylink hands the MAC a 10G speed
on a link that negotiated slower. Happy to re-target the tag if you would
rather it point at the stmmac commit that introduced the switch.

Testing was done with MGBE0 handed to a VM via vfio-platform, so the
driver ran in a guest; the MAC register evidence above is read from the
device itself and the code path is not virtualisation-specific. I do not
have a bare-metal AGX Orin running mainline dwmac-tegra to confirm on,
but nothing in the analysis depends on the passthrough.

 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1125,6 +1125,9 @@ static void stmmac_mac_link_up(struct phylink_config *config,
 		}
 	} else {
 		switch (speed) {
+		case SPEED_10000:
+			ctrl |= priv->hw->link.xgmii.speed10000;
+			break;
 		case SPEED_2500:
 			ctrl |= priv->hw->link.speed2500;
 			break;
--
2.51.0
