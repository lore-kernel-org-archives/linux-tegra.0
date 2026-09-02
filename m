Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF2FB4A3F16
	for <linux-tegra@vger.kernel.org>; Wed,  2 Sep 2026 14:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788360143; cv=none; b=R3kf2bo2jWUajVu0CfGMmv2EyvG8dRV6TvpQgMijV+KB9Ysp7ruPgHRtOjWUeT5wQLphua4Znsk9raPaVP/4tzORetuT14KfRydScA2wZaFzPG8kcHVOLFQG4dG8CvG5tjOIxDCzbTzp3su55j1AYFnAhuXtOgvot8D+AWlEeOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788360143; c=relaxed/simple;
	bh=nH4z9AChZ+zdJHJUQaAR4jhPlgbDKl/nsR/n0pae1pk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YTD6H9VsIXWW60ER7TOrcn4RrgjJdCM3n8c+GoTBb4tFW6D34GSRHgj9yKyzxlKXBH3h6eXg9UjIiz6aD3AVgzo25HW/YnnjmsM77tcuwQhBWN5Udgp3zmqE0f74T8dDaoeqLM1cVmYv1rHNz15BTZAygdeSFlBOtZTlJz4XpBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZrGg1nJA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZrGg1nJA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF5771F000E9;
	Wed,  2 Sep 2026 14:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788360141;
	bh=5I4KnjqT+lKqe3jrfg/srps4drFBbBkJBzU6WMQaQvc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ZrGg1nJAHY+RDOqfZXn1LBjQGWpEx1B1Wmee6rUhUo2kyyY7fZImaBaOkFZm+FyPJ
	 v7MkFwuEo+K56qdK/QrhPTyfhUlRTpIbZLZPYqiwHTvl2A1heNUGhXcD21gfN3MqF3
	 R+kbFCzWuNNzsNkD7VCQTwCwMMboo/390IQQ7AOBNd5WeSHpbkYNug3zoEwQ8B3YaS
	 VvjT5/npW4jzZ6665tbYbPHx8FaXdPJ9t3ZT0PuCD+nHOyXUnqETcBUZK0UQ54SEFo
	 IS93ZGCWYUNjv3xXbs9JnbbqMr+Vqxu1Lkicnwc7HWFz+HgJzIp7057PYCsj53wcdl
	 SXTwsqPR+7KCQ==
From: Thierry Reding <thierry.reding@kernel.org>
To: Thierry Reding <thierry.reding@kernel.org>,
	Jon Hunter <jonathanh@nvidia.com>
Cc: linux-tegra@vger.kernel.org
Subject: [PATCH 2/3] arm64: Fix up cooling map names on Tegra186
Date: Wed,  2 Sep 2026 16:42:39 +0200
Message-ID: <20260902144240.766879-2-thierry.reding@kernel.org>
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
adjustments on Tegra186.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../boot/dts/nvidia/tegra186-p3509-0000+p3636-0001.dts    | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra186-p3509-0000+p3636-0001.dts b/arch/arm64/boot/dts/nvidia/tegra186-p3509-0000+p3636-0001.dts
index d9aafe053112..4b2fa1a49f05 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186-p3509-0000+p3636-0001.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra186-p3509-0000+p3636-0001.dts
@@ -1176,22 +1176,22 @@ cpu_trip_passive: passive {
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

