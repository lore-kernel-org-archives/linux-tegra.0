Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 384C23D544;
	Sun, 26 Apr 2026 00:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777161792; cv=none; b=MGmYeu/hImnXjR3i0QHewQfcWbAXxpx5jJmSJmefrQuk6B456NjRyHrYC0a/V+gTEdKwNkBqYjYQ5dXOHkmirrwOnkdSnEf5pml+F3qgVy0bcItwJAJXUtzf+lWgONZbGt/WKfvrs5hFmm4y/GpvEpFEfC+P+o/BiLPkSS4bTS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777161792; c=relaxed/simple;
	bh=+O/Umb/ZYAjq527NytNL00ALTjlEFwQ5skbkPFWkgqQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=nBK8/okxl9cfzRfvne+SuvLnomV0MvbwlKDtNrmBSPNWxyf0CH0lvC+rtVazMnS+0U2HDNM8uVvnC9DYh5Vfd83/ou304Jq/AUFlPbPL15jSulNuvy29BHy2NmSJ1vLQwNTRc/PZ7O5VrEf0aI7/w6uk97g819RkkyJ+Z9VxWE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=osHy50Ln; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="osHy50Ln"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6804C2BCB0;
	Sun, 26 Apr 2026 00:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777161791;
	bh=+O/Umb/ZYAjq527NytNL00ALTjlEFwQ5skbkPFWkgqQ=;
	h=From:To:Cc:Subject:Date:From;
	b=osHy50LniNL4jDtdCNjXKaH6VqEarx3uxf9xps0723ubaAIzirklHlvUUSWhfakip
	 /eWmWFU6J1M2aqL9QqC1XvYtknzXkpnUVMRQKZVHpOcOfrYVhUb/GrUHds4sNH3LnM
	 LpJ2VCzBOGtIPbaJAR98l94bdOBj4axkyk/ks4XcxGFTSwrRPJJBNfGplwnjw1RbVd
	 BInvibsFMpFWxfkjAlKomQB3bX1oUi/4eXMsxBQCmW1D9DRADr8WT5dlp7dWJoq6Jg
	 U83PITy4cW8o5h/nDUF0jInAVUa18JbzK7bm211YhhWoFjJ4qIumbN9XbZIWIK6ioh
	 UhbOTk/jPfV5w==
From: Sasha Levin <sashal@kernel.org>
To: Vinod Koul <vkoul@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Niklas Cassel <cassel@kernel.org>,
	Vidya Sagar <vidyas@nvidia.com>,
	Sasha Levin <sashal@kernel.org>,
	linux-phy@lists.infradead.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] phy: tegra: xusb: Make USB_CONN_GPIO select conditional on GPIOLIB
Date: Sat, 25 Apr 2026 20:03:09 -0400
Message-ID: <20260426000309.54959-1-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

kconfiglint reports:

  K006: config PHY_TEGRA_XUSB selects USB_CONN_GPIO which depends on
        GPIOLIB, but PHY_TEGRA_XUSB does not depend on GPIOLIB
  K002: config PHY_TEGRA_XUSB selects visible symbol USB_CONN_GPIO
        which has dependencies

USB_CONN_GPIO was introduced in commit 4602f3bff266 ("usb: common: add USB
GPIO based connection detection driver") with a hard dependency on GPIOLIB,
since it needs GPIO pins to detect USB cable connection state.

Commit f67213cee2b3 ("phy: tegra: xusb: Add usb-role-switch support") added
`select USB_CONN_GPIO` to PHY_TEGRA_XUSB to support USB role switching via
GPIO-based detection. At that time, PHY_TEGRA_XUSB depended only on
`ARCH_TEGRA`, and both the ARM32 and ARM64 ARCH_TEGRA Kconfig definitions
select GPIOLIB, so the missing explicit GPIOLIB guard was not a functional
problem — GPIOLIB is always available when ARCH_TEGRA is enabled.

Later, commit 0d5c9bc7c680 ("phy: tegra: Select USB_COMMON for
usb_get_maximum_speed()") added `depends on USB_SUPPORT` but still did not
address the GPIOLIB gap.

The select can force USB_CONN_GPIO on without its GPIOLIB dependency being
satisfied if the Kconfig dependencies were ever restructured. Make the
select conditional with `select USB_CONN_GPIO if GPIOLIB` to make the
dependency explicit. This mirrors how other drivers handle optional
GPIO-dependent selects throughout the kernel.

Assisted-by: Claude:claude-opus-4-6 kconfiglint
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/phy/tegra/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/tegra/Kconfig b/drivers/phy/tegra/Kconfig
index 342fb736da4b1..f0734415fc94c 100644
--- a/drivers/phy/tegra/Kconfig
+++ b/drivers/phy/tegra/Kconfig
@@ -3,7 +3,7 @@ config PHY_TEGRA_XUSB
 	tristate "NVIDIA Tegra XUSB pad controller driver"
 	depends on ARCH_TEGRA && USB_SUPPORT
 	select USB_COMMON
-	select USB_CONN_GPIO
+	select USB_CONN_GPIO if GPIOLIB
 	select USB_PHY
 	help
 	  Choose this option if you have an NVIDIA Tegra SoC.
-- 
2.53.0

