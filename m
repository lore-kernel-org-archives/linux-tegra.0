Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89FF53A0E91
	for <linux-tegra@vger.kernel.org>; Thu, 26 Feb 2026 15:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772118583; cv=none; b=ibnOlJMSM0u9upTdkFRroXccrpP4HEiIKeXdGf9Cgq1g6WXdS6ZANoJfWKi/f9+HDdM+ENWB2Oqjljhp7+irywEHw5090QTDg8iNGHzAVgwiUMWHla51QnYUCVfc2/OEU9u2T9bTj2cGK4KoURDBzD8jzKWdBfSLevJnK5RlVcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772118583; c=relaxed/simple;
	bh=dM7h7sasxVzTsEh5Z4cUfB9ll5Z5dqbcZh4jIBxy4JY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bHSPjCU4xKDSYjJEUniXcTUFqGdpUwqCh2QVR39G1UyiHBw2nvAB9cven2YAWcaOTtC60zb9zeVMzZFHGQaXNTXKXJ2UK/ryxbVGi/y74YPp/+FX57IW5JQEdxzPECXYkkMoUCv3FIpnhHCHZGjLkVMMUnZjZG7JP9Am3nvT2ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mX2YlMha; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mX2YlMha"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 173BBC19424;
	Thu, 26 Feb 2026 15:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772118583;
	bh=dM7h7sasxVzTsEh5Z4cUfB9ll5Z5dqbcZh4jIBxy4JY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mX2YlMhazqprNl4bPZwVsnmQm/PXQBNEZI1/h1ALSLsQoqpD/UECipILws3TfKHn2
	 n3X0oio3i0JHlmTLQdNsZhXLUhKMlwCJroW6MfzgiJ2bcDGapYkQeKC1UdLcdj21Cj
	 vJrEOYjFDWNCx/clkqw+2jqumkquiL6nGOOF9tcUfwlnyprFq1VoPYPYNwkFjA65y/
	 EImdU6jbDB2oISw53F2it63LRbW+IGux1atEFqjCZPBXNF+GvRTLpaqu2JoN5JAfo6
	 9QzuBzbasYW9j2FXGPn+FUsKJqLbzCe3gp5EQpSF/yxw9hCT/tL/RbatdOVJ/HXUnd
	 aYXp1hB9H8V2Q==
From: Thierry Reding <thierry.reding@kernel.org>
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/2] firmware: tegra: bpmp: Rename Tegra239 to Tegra238
Date: Thu, 26 Feb 2026 16:09:33 +0100
Message-ID: <20260226150933.4067324-2-thierry.reding@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260226150933.4067324-1-thierry.reding@kernel.org>
References: <20260226150933.4067324-1-thierry.reding@kernel.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>

This chip identifies as Tegra238, so update the BPMP ABI header to refer
to it by the correct name.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 include/soc/tegra/bpmp-abi.h | 48 ++++++++++++++++++------------------
 1 file changed, 24 insertions(+), 24 deletions(-)

diff --git a/include/soc/tegra/bpmp-abi.h b/include/soc/tegra/bpmp-abi.h
index dc0789c20333..39bb3f87e28d 100644
--- a/include/soc/tegra/bpmp-abi.h
+++ b/include/soc/tegra/bpmp-abi.h
@@ -1020,9 +1020,9 @@ struct cmd_i2c_xfer_request {
 	/**
 	 * @brief Tegra PWR_I2C bus identifier
 	 *
-	 * @cond (bpmp_t234 || bpmp_t239 || bpmp_t194)
+	 * @cond (bpmp_t234 || bpmp_t238 || bpmp_t194)
 	 * Must be set to 5.
-	 * @endcond (bpmp_t234 || bpmp_t239 || bpmp_t194)
+	 * @endcond (bpmp_t234 || bpmp_t238 || bpmp_t194)
 	 * @cond bpmp_th500
 	 * Must be set to 1.
 	 * @endcond bpmp_th500
@@ -2108,7 +2108,7 @@ struct mrq_emc_dvfs_latency_response {
  * @brief Query EMC HUB frequencies
  *
  * * Platforms: T234 onwards
- * @cond (bpmp_t234 || bpmp_t239 || bpmp_th500)
+ * @cond (bpmp_t234 || bpmp_t238 || bpmp_th500)
  * * Initiators: CCPLEX
  * * Targets: BPMP
  * * Request Payload: N/A
@@ -2139,7 +2139,7 @@ struct mrq_emc_dvfs_emchub_response {
 } BPMP_ABI_PACKED;
 
 /** @} EMC */
-/** @endcond (bpmp_t234 || bpmp_t239 || bpmp_th500) */
+/** @endcond (bpmp_t234 || bpmp_t238 || bpmp_th500) */
 
 /**
  * @ingroup MRQ_Codes
@@ -2147,7 +2147,7 @@ struct mrq_emc_dvfs_emchub_response {
  * @brief Set EMC display RFL handshake mode of operations
  *
  * * Platforms: T234 onwards
- * @cond (bpmp_t234 || bpmp_t239 || bpmp_th500)
+ * @cond (bpmp_t234 || bpmp_t238 || bpmp_th500)
  * * Initiators: CCPLEX
  * * Targets: BPMP
  * * Request Payload: @ref mrq_emc_disp_rfl_request
@@ -2184,7 +2184,7 @@ struct mrq_emc_disp_rfl_request {
 } BPMP_ABI_PACKED;
 
 /** @} EMC */
-/** @endcond (bpmp_t234 || bpmp_t239 || bpmp_th500) */
+/** @endcond (bpmp_t234 || bpmp_t238 || bpmp_th500) */
 
 /**
  * @ingroup MRQ_Codes
@@ -2192,7 +2192,7 @@ struct mrq_emc_disp_rfl_request {
  * @brief bwmgr requests
  *
  * * Platforms: T234 onwards
- * @cond (bpmp_t234 || bpmp_t239 || bpmp_th500)
+ * @cond (bpmp_t234 || bpmp_t238 || bpmp_th500)
  * * Initiators: CCPLEX
  * * Targets: BPMP
  * * Request Payload: @ref mrq_bwmgr_request
@@ -2299,7 +2299,7 @@ struct mrq_bwmgr_response {
 } BPMP_ABI_PACKED;
 
 /** @} BWMGR */
-/** @endcond (bpmp_t234 || bpmp_t239 || bpmp_th500) */
+/** @endcond (bpmp_t234 || bpmp_t238 || bpmp_th500) */
 
 /**
  * @ingroup MRQ_Codes
@@ -2307,7 +2307,7 @@ struct mrq_bwmgr_response {
  * @brief bpmp-integrated bwmgr requests
  *
  * * Platforms: T234 onwards
- * @cond (bpmp_t234 || bpmp_t239 || bpmp_th500)
+ * @cond (bpmp_t234 || bpmp_t238 || bpmp_th500)
  * * Initiators: CCPLEX
  * * Targets: BPMP
  * * Request Payload: @ref mrq_bwmgr_int_request
@@ -2445,7 +2445,7 @@ struct mrq_bwmgr_int_response {
 } BPMP_ABI_PACKED;
 
 /** @} BWMGR_INT */
-/** @endcond (bpmp_t234 || bpmp_t239 || bpmp_th500) */
+/** @endcond (bpmp_t234 || bpmp_t238 || bpmp_th500) */
 
 /**
  * @ingroup MRQ_Codes
@@ -2453,7 +2453,7 @@ struct mrq_bwmgr_int_response {
  * @brief ISO client requests
  *
  * * Platforms: T234 onwards
- * @cond (bpmp_t234 || bpmp_t239 || bpmp_th500)
+ * @cond (bpmp_t234 || bpmp_t238 || bpmp_th500)
  * * Initiators: CCPLEX
  * * Targets: BPMP
  * * Request Payload: @ref mrq_iso_client_request
@@ -2636,7 +2636,7 @@ struct mrq_iso_client_response {
 } BPMP_ABI_PACKED;
 
 /** @} ISO_CLIENT */
-/** @endcond (bpmp_t234 || bpmp_t239 || bpmp_th500) */
+/** @endcond (bpmp_t234 || bpmp_t238 || bpmp_th500) */
 
 /**
  * @ingroup MRQ_Codes
@@ -2644,7 +2644,7 @@ struct mrq_iso_client_response {
  * @brief CPU freq. limits in ndiv
  *
  * * Platforms: T194 onwards
- * @cond (bpmp_t194 || bpmp_t234 || bpmp_t239 || bpmp_th500)
+ * @cond (bpmp_t194 || bpmp_t234 || bpmp_t238 || bpmp_th500)
  * * Initiators: CCPLEX
  * * Targets: BPMP
  * * Request Payload: @ref mrq_cpu_ndiv_limits_request
@@ -2678,7 +2678,7 @@ struct mrq_cpu_ndiv_limits_response {
 } BPMP_ABI_PACKED;
 
 /** @} CPU */
-/** @endcond (bpmp_t194 || bpmp_t234 || bpmp_t239 || bpmp_th500) */
+/** @endcond (bpmp_t194 || bpmp_t234 || bpmp_t238 || bpmp_th500) */
 
 /**
  * @ingroup MRQ_Codes
@@ -2911,7 +2911,7 @@ union mrq_ringbuf_console_bpmp_to_host_response {
  * @brief Set a strap value controlled by BPMP
  *
  * * Platforms: T194 onwards
- * @cond (bpmp_t194 || bpmp_t234 || bpmp_t239 || bpmp_th500)
+ * @cond (bpmp_t194 || bpmp_t234 || bpmp_t238 || bpmp_th500)
  * * Initiators: CCPLEX
  * * Targets: BPMP
  * * Request Payload: @ref mrq_strap_request
@@ -2949,7 +2949,7 @@ struct mrq_strap_request {
 } BPMP_ABI_PACKED;
 
 /** @} Strap */
-/** @endcond (bpmp_t194 || bpmp_t234 || bpmp_t239 || bpmp_th500) */
+/** @endcond (bpmp_t194 || bpmp_t234 || bpmp_t238 || bpmp_th500) */
 
 /**
  * @ingroup MRQ_Codes
@@ -2957,7 +2957,7 @@ struct mrq_strap_request {
  * @brief Perform a UPHY operation
  *
  * * Platforms: T194 onwards
- * @cond (bpmp_t194 || bpmp_t234 || bpmp_t239 || bpmp_th500)
+ * @cond (bpmp_t194 || bpmp_t234 || bpmp_t238 || bpmp_th500)
  * * Initiators: CCPLEX
  * * Targets: BPMP
  * * Request Payload: @ref mrq_uphy_request
@@ -2997,23 +2997,23 @@ struct cmd_uphy_margin_status_response {
 } BPMP_ABI_PACKED;
 
 struct cmd_uphy_ep_controller_pll_init_request {
-	/** @brief EP controller number, T194 valid: 0, 4, 5; T234 valid: 5, 6, 7, 10; T239 valid: 0 */
+	/** @brief EP controller number, T194 valid: 0, 4, 5; T234 valid: 5, 6, 7, 10; T238 valid: 0 */
 	uint8_t ep_controller;
 } BPMP_ABI_PACKED;
 
 struct cmd_uphy_pcie_controller_state_request {
-	/** @brief PCIE controller number, T194 valid: 0-4; T234 valid: 0-10; T239 valid: 0-3 */
+	/** @brief PCIE controller number, T194 valid: 0-4; T234 valid: 0-10; T238 valid: 0-3 */
 	uint8_t pcie_controller;
 	uint8_t enable;
 } BPMP_ABI_PACKED;
 
 struct cmd_uphy_ep_controller_pll_off_request {
-	/** @brief EP controller number, T194 valid: 0, 4, 5; T234 valid: 5, 6, 7, 10; T239 valid: 0 */
+	/** @brief EP controller number, T194 valid: 0, 4, 5; T234 valid: 5, 6, 7, 10; T238 valid: 0 */
 	uint8_t ep_controller;
 } BPMP_ABI_PACKED;
 
 struct cmd_uphy_display_port_init_request {
-	/** @brief DisplayPort link rate, T239 valid: 1620, 2700, 5400, 8100, 2160, 2430, 3240, 4320, 6750 */
+	/** @brief DisplayPort link rate, T238 valid: 1620, 2700, 5400, 8100, 2160, 2430, 3240, 4320, 6750 */
 	uint16_t link_rate;
 	/** @brief 1: lane 0; 2: lane 1; 3: lane 0 and 1 */
 	uint16_t lanes_bitmap;
@@ -3084,7 +3084,7 @@ struct mrq_uphy_response {
 } BPMP_ABI_PACKED;
 
 /** @} UPHY */
-/** @endcond (bpmp_t194 || bpmp_t234 || bpmp_t239 || bpmp_th500) */
+/** @endcond (bpmp_t194 || bpmp_t234 || bpmp_t238 || bpmp_th500) */
 
 /**
  * @ingroup MRQ_Codes
@@ -3092,12 +3092,12 @@ struct mrq_uphy_response {
  * @brief Perform a frequency monitor configuration operations
  *
  * * Platforms: T194 onwards
- * @cond (bpmp_t194 || bpmp_t234 || bpmp_t239 || bpmp_th500)
+ * @cond (bpmp_t194 || bpmp_t234 || bpmp_t238 || bpmp_th500)
  * * Initiators: CCPLEX
  * * Targets: BPMP
  * * Request Payload: @ref mrq_fmon_request
  * * Response Payload: @ref mrq_fmon_response
- * @endcond (bpmp_t194 || bpmp_t234 || bpmp_t239 || bpmp_th500)
+ * @endcond (bpmp_t194 || bpmp_t234 || bpmp_t238 || bpmp_th500)
  *
  * @addtogroup FMON
  * @{
-- 
2.52.0

