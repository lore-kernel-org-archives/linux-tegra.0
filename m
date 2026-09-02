Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50AB54A3F19
	for <linux-tegra@vger.kernel.org>; Wed,  2 Sep 2026 14:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788360140; cv=none; b=VuanCZz2ik4tpJNhSkhv8fHbaxpisscRzOlhZ9emhiGRngWmL6VrXK8WjFLxNmRAEugyusL+B4FiPsUTkcwzjeX7sOfi/UJcPZRG6FmNt4SMIgObijZvW7xoOhLIK+nfo7HchV7GtvKMuxjCCD5KDEze20TVhKg8LUO9HviZW4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788360140; c=relaxed/simple;
	bh=MKerne+DvJCiCBoWzV81SyttAjWUSkEPGcztxa4m90E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=L2H1qwxIjAeyJXH0aQCn+8pqeD5o1DM4SSik68iQnShMYfO2f3xrNOibkR4331fMyLgLeLMTFhYqsWJ+8PnD9bQkdWSyx9up0j7x6jQZSoSqYHyZshtMI1oBHpWKzm+mOI/qexB4oUy3Q3Ppa+VVoH5Ad5P00K6jhX3zYr6rVhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fpB+EzC3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fpB+EzC3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F8CB1F00A3A;
	Wed,  2 Sep 2026 14:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788360138;
	bh=W4hAYSFuPRhIRGyKJ9ACX8Yttv+HABRvc7uoH8IdRu4=;
	h=From:To:Cc:Subject:Date;
	b=fpB+EzC3XwotQKM9AK+/vwJxKk2KlPcqrXYikhr0StHP+/nvuX8wPMb4VCYsO2I6S
	 QdSBk7W7SNslGSj/vowGM+V9+wQNTlFDx3uWNitqXEX6oiPbigpchHQM0p4uDBEPuD
	 sI9GugcYr0UGOw8a3NzhdW+qlOMCsQObP7E89SFl11PFszLJi0IeVARqO7TgdbrZ+8
	 yncUS/wc+YTU1gzgZE3xdoxx2pwbvDRIvLMfH2ASehuiulWwu9V/A2/6eUKFGkQD9H
	 SZ7lzEExRPjD76FmOT2fWbUoJzP8i6/2dBmbImZFoPPar0U+Owld5VXNUKwEOV8Mz6
	 3d0RdCtckZRbA==
From: Thierry Reding <thierry.reding@kernel.org>
To: Thierry Reding <thierry.reding@kernel.org>,
	Jon Hunter <jonathanh@nvidia.com>
Cc: linux-tegra@vger.kernel.org
Subject: [PATCH 1/3] arm64: tegra: Fix up cooling map names on Tegra194
Date: Wed,  2 Sep 2026 16:42:38 +0200
Message-ID: <20260902144240.766879-1-thierry.reding@kernel.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>

Cooling map nodes should be prefixed with map-, so make the necessary
adjustments on Tegra194.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts  | 8 ++++----
 arch/arm64/boot/dts/nvidia/tegra194-p3509-0000.dtsi | 8 ++++----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts b/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
index 5462200f1176..478464464bcb 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
@@ -2450,22 +2450,22 @@ cpu_trip_passive: passive {
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
diff --git a/arch/arm64/boot/dts/nvidia/tegra194-p3509-0000.dtsi b/arch/arm64/boot/dts/nvidia/tegra194-p3509-0000.dtsi
index 6f4879c49da2..569d181b2ad2 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194-p3509-0000.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194-p3509-0000.dtsi
@@ -2433,22 +2433,22 @@ cpu_trip_passive: passive {
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
-- 
2.55.0

