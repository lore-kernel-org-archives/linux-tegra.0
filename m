Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E610F1B85D1
	for <linux-tegra@vger.kernel.org>; Tue, 18 Mar 2025 06:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742279752; cv=none; b=B4a/hGa/hhuOr925SA96O17S1nuHZqiwbRy+leDoU0vfjNoGmKr+oZaRww5ND6LDjWJGXoKViwkuw+f+dTcump2qPoZPCNJajAHScgIAqu4b2G1KKd8LSOhvy/H7aim0ch7i1IEyM0ntn2QUBXO75wIMjlhf1xBYLLCHlHEo7kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742279752; c=relaxed/simple;
	bh=ZhumqbJyC0jbSm+aIwpEmIBwtKUwy6ehaPN7I3hoWMY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SFGXNhms//z5GPHbxevElM6FblezcCMnzgDRVBMyqKjMHweyx69Dk/oeMjfKU0HN+3i0mPjQ6rbriG4uPzefufu7SYzrQejqsWfpph6Ux7uKZDbelzsUgQhkvR50ij50o3GtqafaL0HDOa9IT+bkS/o7O7c7s9jtax4U6WalBZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=SzHkNd2Q; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="SzHkNd2Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=Lni5v
	gIHCnsELvDKBqFqxLmr1fHW/mwIGLXVHAW3C7g=; b=SzHkNd2QYFIpittBiqDGc
	d7vrnpG2TxueyfV+kGQAdlevWf0RPxiYprddST6wQD3PpgYFgCNxy9DPw1j3o2oK
	U0iWA542OI+0Xzj4zTxKTENWrkyXo315AD+WeBGr1HI1EvvKvSff2qXthM7g1GbS
	moKgcHOiCaqOMlw8epiuuA=
Received: from ProDesk.. (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wDnnuYSFNlnP+WyAA--.9231S3;
	Tue, 18 Mar 2025 14:35:02 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: lumag@kernel.org
Cc: mripard@kernel.org,
	neil.armstrong@linaro.org,
	dri-devel@lists.freedesktop.org,
	dianders@chromium.org,
	jani.nikula@intel.com,
	lyude@redhat.com,
	jonathanh@nvidia.com,
	thierry.reding@gmail.com,
	victor.liu@nxp.com,
	rfoss@kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-tegra@vger.kernel.org,
	Andy Yan <andy.yan@rock-chips.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v2 2/5] drm/bridge: cdns-mhdp8546: Switch to common helpers to power up/down dp link
Date: Tue, 18 Mar 2025 14:34:36 +0800
Message-ID: <20250318063452.4983-2-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250318063452.4983-1-andyshrk@163.com>
References: <20250318063452.4983-1-andyshrk@163.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDnnuYSFNlnP+WyAA--.9231S3
X-Coremail-Antispam: 1Uf129KBjvJXoWxZw18Xr1xtF4xAF4UZF4fXwb_yoW5uF15pF
	ZxW34UtF4vvw4DXF4ktF109r43A3W7Ca1kGrW8Gw48Z3WYyas8ta4a9F17JFW5Gr97Ca1a
	qFnYvayxWFZ2kr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jxYFAUUUUU=
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbBkAIUXmfZEzUB-gACs9

From: Andy Yan <andy.yan@rock-chips.com>

Use the common dp link power up/down helpers to avoid duplicating code.

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---

(no changes since v1)

 .../drm/bridge/cadence/cdns-mhdp8546-core.c   | 74 +------------------
 1 file changed, 2 insertions(+), 72 deletions(-)

diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
index 81fad14c2cd5..6094ecde35ff 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
@@ -545,76 +545,6 @@ int cdns_mhdp_adjust_lt(struct cdns_mhdp_device *mhdp, unsigned int nlanes,
 	return ret;
 }
 
-/**
- * cdns_mhdp_link_power_up() - power up a DisplayPort link
- * @aux: DisplayPort AUX channel
- * @link: pointer to a structure containing the link configuration
- *
- * Returns 0 on success or a negative error code on failure.
- */
-static
-int cdns_mhdp_link_power_up(struct drm_dp_aux *aux, struct cdns_mhdp_link *link)
-{
-	u8 value;
-	int err;
-
-	/* DP_SET_POWER register is only available on DPCD v1.1 and later */
-	if (link->revision < 0x11)
-		return 0;
-
-	err = drm_dp_dpcd_readb(aux, DP_SET_POWER, &value);
-	if (err < 0)
-		return err;
-
-	value &= ~DP_SET_POWER_MASK;
-	value |= DP_SET_POWER_D0;
-
-	err = drm_dp_dpcd_writeb(aux, DP_SET_POWER, value);
-	if (err < 0)
-		return err;
-
-	/*
-	 * According to the DP 1.1 specification, a "Sink Device must exit the
-	 * power saving state within 1 ms" (Section 2.5.3.1, Table 5-52, "Sink
-	 * Control Field" (register 0x600).
-	 */
-	usleep_range(1000, 2000);
-
-	return 0;
-}
-
-/**
- * cdns_mhdp_link_power_down() - power down a DisplayPort link
- * @aux: DisplayPort AUX channel
- * @link: pointer to a structure containing the link configuration
- *
- * Returns 0 on success or a negative error code on failure.
- */
-static
-int cdns_mhdp_link_power_down(struct drm_dp_aux *aux,
-			      struct cdns_mhdp_link *link)
-{
-	u8 value;
-	int err;
-
-	/* DP_SET_POWER register is only available on DPCD v1.1 and later */
-	if (link->revision < 0x11)
-		return 0;
-
-	err = drm_dp_dpcd_readb(aux, DP_SET_POWER, &value);
-	if (err < 0)
-		return err;
-
-	value &= ~DP_SET_POWER_MASK;
-	value |= DP_SET_POWER_D3;
-
-	err = drm_dp_dpcd_writeb(aux, DP_SET_POWER, value);
-	if (err < 0)
-		return err;
-
-	return 0;
-}
-
 /**
  * cdns_mhdp_link_configure() - configure a DisplayPort link
  * @aux: DisplayPort AUX channel
@@ -1453,7 +1383,7 @@ static int cdns_mhdp_link_up(struct cdns_mhdp_device *mhdp)
 		mhdp->link.capabilities |= DP_LINK_CAP_ENHANCED_FRAMING;
 
 	dev_dbg(mhdp->dev, "Set sink device power state via DPCD\n");
-	cdns_mhdp_link_power_up(&mhdp->aux, &mhdp->link);
+	drm_dp_link_power_up(&mhdp->aux, mhdp->link.revision);
 
 	cdns_mhdp_fill_sink_caps(mhdp, dpcd);
 
@@ -1500,7 +1430,7 @@ static void cdns_mhdp_link_down(struct cdns_mhdp_device *mhdp)
 	WARN_ON(!mutex_is_locked(&mhdp->link_mutex));
 
 	if (mhdp->plugged)
-		cdns_mhdp_link_power_down(&mhdp->aux, &mhdp->link);
+		drm_dp_link_power_down(&mhdp->aux, mhdp->link.revision);
 
 	mhdp->link_up = false;
 }
-- 
2.43.0

