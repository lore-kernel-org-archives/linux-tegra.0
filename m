Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 710A04A3D25
	for <linux-tegra@vger.kernel.org>; Wed,  2 Sep 2026 14:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788360146; cv=none; b=iEw6vDMelBP4FQxQhgbzose4N5rxjZj7jdH7A28n5TVPehesQu6M7h/iYRE55sVeaqOMx6q2g359pfJYvtHdzCGg2yZx/rICZyXU1fkuXgEtc3g0e6Qqx0UwNOHIu+nbtDRDArX7dtIl+y5GOXPe8N/1+cA2IibKHTIifwt2L9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788360146; c=relaxed/simple;
	bh=HY3EUmF0OVkvSxA17GS5fENFSvG5egTXdWmQFNs89ig=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X+TJ5EUPHZpIGqKWu9awOV6j6CD/GQPsMUQ/pMyoaJzJy6ey8uE9gw/QmkIUrDyLpdC9y7vlF2Qqoovkd+iNx74/3xjZCKhALBV1XMbpnevG6sgfF0WJVo4Rkb5lIyyywKsN4UWngMwAsIVCBDSqdatLR1dE7T+xdB+LPkWfXBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fcOsIFTe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fcOsIFTe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74D1E1F000E9;
	Wed,  2 Sep 2026 14:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788360145;
	bh=an4umKo+Bh59ebGfbYc5zbL0SFYFxG48Z2iMJcATkK0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=fcOsIFTejFXKYiMFg5MX6/lzIDSQmb9R+ELEAIcwTW58NI4zkp76ugW1lBGWXqfId
	 CFYaWJfhwS25hVsmW2lWoYiW/xg/0G4LJ6ARn+M7f3rqi8VS/2Db/5mGPe4KYrSiS0
	 ZCim0ejyLT2FKFH7VWyBxn0SNicgx9k2f2v90yGD/ZxyzTtINcpBhGuFIrIBnMirCN
	 wkbtVvTdfdHQaoGYrHyVdI2r+K7+GvG7rspvhtCeI2TkmO7rszkMUMHpYLtRaWnWsD
	 tgqPHYukcK6NjKfUwIeWhGHyI0KjJuJB7Cm1Dx4tlMw+4c0JijnCP5wuu6R3OJUYU6
	 XL044M1XEANYg==
From: Thierry Reding <thierry.reding@kernel.org>
To: Thierry Reding <thierry.reding@kernel.org>,
	Jon Hunter <jonathanh@nvidia.com>
Cc: linux-tegra@vger.kernel.org
Subject: [PATCH 3/3] arm64: Fix up cooling map names on Tegra210
Date: Wed,  2 Sep 2026 16:42:40 +0200
Message-ID: <20260902144240.766879-3-thierry.reding@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902144240.766879-1-thierry.reding@kernel.org>
References: <20260902144240.766879-1-thierry.reding@kernel.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>

Cooling map nodes should be prefixed with map-, so make the necessary
adjustments on Tegra210.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts | 8 ++++----
 arch/arm64/boot/dts/nvidia/tegra210.dtsi           | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
index d78b9bd45df6..6db23cc7ce7a 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
@@ -1968,22 +1968,22 @@ cpu_trip_passive: passive {
 			};
 
 			cooling-maps {
-				cpu-critical {
+				map-critical {
 					cooling-device = <&fan 3 3>;
 					trip = <&cpu_trip_critical>;
 				};
 
-				cpu-hot {
+				map-hot {
 					cooling-device = <&fan 2 2>;
 					trip = <&cpu_trip_hot>;
 				};
 
-				cpu-active {
+				map-active {
 					cooling-device = <&fan 1 1>;
 					trip = <&cpu_trip_active>;
 				};
 
-				cpu-passive {
+				map-passive {
 					cooling-device = <&fan 0 0>;
 					trip = <&cpu_trip_passive>;
 				};
diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
index 9cc4c89dd1d6..99fefce41476 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
@@ -2164,12 +2164,12 @@ mem-shutdown-trip {
 			};
 
 			cooling-maps {
-				dram-passive {
+				map-passive {
 					cooling-device = <&emc 0 0>;
 					trip = <&dram_nominal>;
 				};
 
-				dram-active {
+				map-active {
 					cooling-device = <&emc 1 1>;
 					trip = <&dram_throttle>;
 				};
-- 
2.55.0

