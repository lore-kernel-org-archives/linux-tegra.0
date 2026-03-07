Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B38133B6D5;
	Sat,  7 Mar 2026 11:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772881418; cv=none; b=ilZ2C46ECmmtoKcQ0C+KyyjBZXF+6jVL0PjQ3QjTodTPuwfF70UAZ34a859S2bZZLhYgTb7q5TpNlm7qAf2zqbjti8QXJ2QpiJW53EpD8qri5eUp/vRk5SWlFJM+Q6oJ5tPPvOGEyWA5SXeOIidd5AVINXPas2JwM3XiThf1ChM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772881418; c=relaxed/simple;
	bh=Cc4o5RiSBiXzTUt+4lBz53YglbIRDjNMC28x76OoMDQ=;
	h=In-Reply-To:References:From:To:Cc:Subject:MIME-Version:
	 Content-Disposition:Content-Type:Message-Id:Date; b=CZX35Ti0BxQXZmVZN0ijgC2Yu6jlCxb1AxRaK/yJHKE86IMf0J+iywg9AkAuF0v19utFgfWT1OA8ITKAvb8jhisHptlpI/eKFR9H9l6OqLsjzYP4QvPmvFUUM9xMqRGm09vq8GjBUXEUduBbJcjNEEZeh8Byf3IInmGdlUiEhVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=BYx63X43; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="BYx63X43"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=zyItZuZ4+Hst+XLGZf5NqjqPTntMZ8Z+OnnAGXqJkFo=; b=BYx63X43R4LLoKfUQVqcc83Swo
	cGcsR57YhjAAJpHRfwIjkeTQ3I4WCG+IiH0FtbLMmDyJ7QSKHEP9FyotKv5WbmaGwP5qdWPU0wek1
	EBtGs5xaAn9lClCuj5DjwkAiIZYIVjGBJLEqwJ3VKBRxclaCIkD53DlfY03G0XCA6JSX+ZggGj/n0
	vTQeAh06k07PTgBR+mFUbrK2H/TAFU0wgmITOV1QIBkIuEBb9Ukg6n19zXm9sVcZpwZfkgc1AnvID
	5VpcNJaetXacqdcV6FySLj88X/TsV3fxybua23hq4Ix+AmrjKmhBrLnmlxzLLb7Po2oWlF46ZUx5B
	mYWiPkgA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:48788 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vypR6-0000000028v-3IER;
	Sat, 07 Mar 2026 11:03:09 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vypR3-0000000CSwU-2m0B;
	Sat, 07 Mar 2026 11:03:05 +0000
In-Reply-To: <aawFuXTVAgVOrw4k@shell.armlinux.org.uk>
References: <aawFuXTVAgVOrw4k@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Frank Li <Frank.Li@nxp.com>,
	imx@lists.linux.dev,
	Jakub Kicinski <kuba@kernel.org>,
	Jan Petrous <jan.petrous@oss.nxp.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	s32@nxp.com,
	Samuel Holland <samuel@sholland.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Yao Zi <me@ziyao.cc>
Subject: [PATCH net-next 6/7] net: stmmac: add documentation for
 stmmac_dma_cfg members
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vypR3-0000000CSwU-2m0B@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date: Sat, 07 Mar 2026 11:03:05 +0000

Add documentation of each of the struct stmmac_dma_cfg members. dche
remains undocumented as I don't have documentation that covers this.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 include/linux/stmmac.h | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index 11886189bf51..3521b88aa345 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -93,16 +93,37 @@ struct stmmac_mdio_bus_data {
 };
 
 struct stmmac_dma_cfg {
+	/* pbl: programmable burst limit
+	 * txpbl: transmit programmable burst limit
+	 * rxpbl: receive programmable burst limit
+	 * If txpbl or rxpbl are zero, the value of pbl will be subsituted.
+	 * Range 0 - 63.
+	 */
 	int pbl;
 	int txpbl;
 	int rxpbl;
+	/* pblx8: multiplies pbl, txpbl, rxpbl by a factor of 8 for dwmac >=
+	 * 3.50a, or a factor of 4 for previous versions.
+	 */
 	bool pblx8;
+	/* fixed_burst:
+	 *  when set, AXI bursts defined by axi_blen_regval are permitted.
+	 *   AHB uses SINGLE, INCR4, INCR8 or INCR16 during burst transfers.
+	 *  when clear, AXI and AHB use SINGLE or INCR bursts.
+	 */
 	bool fixed_burst;
+	/* mixed_burst:
+	 *  when set and fixed_burst is clear, AHB uses INCR for bursts > 16
+	 *  and SINGLE or INCRx for bursts <= 16.
+	 */
 	bool mixed_burst;
+	/* aal: address aligned bursts for AHB and AXI master interface */
 	bool aal;
+	bool dche;
 	bool eame;
+	/* multi_msi_en: stmmac core internal */
 	bool multi_msi_en;
-	bool dche;
+	/* atds: stmmac core internal */
 	bool atds;
 };
 
-- 
2.47.3

