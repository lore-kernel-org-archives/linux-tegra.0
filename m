Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 479FE3D410D;
	Fri, 20 Mar 2026 23:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774049913; cv=none; b=OiyIvp135OoBfmtn1ikuTojqNYALfO+hEiWNRd9ifMhWwxQ53sA1378QXksnuLRDrsSQl/ZvxaOjD4pFPdVlzQOEXL/Lc3LieUs7Gem4hWJnBm1fk7Mjs6K0L36CMAqWjKtxwjtABUHQux2erCmueNx2DBE5D9WGC0mthipDQeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774049913; c=relaxed/simple;
	bh=6z/5iW3DDFKVaCfX37ORzpSWLPIYAUgVqmAvTxZcUJs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kxMKh/d8rJrmnVw0oMKtrFu5+9Q9iI+bbTvBm3JTJD+wGPYYzOdDVnBpLvrq/KNb7GymGJbtKS/daBIwXC8/UvLNGASpU52gQ4WOokmXOyQBDUL/aJ3AM7LTSBGJqufhL1SkGOGOWwHenNLKWXW9BuIQoKHhd7QvxsWe+lHB+4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZJY56epN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZJY56epN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E0C9C4CEF7;
	Fri, 20 Mar 2026 23:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774049913;
	bh=6z/5iW3DDFKVaCfX37ORzpSWLPIYAUgVqmAvTxZcUJs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZJY56epNX5IWkpirUVgTtWNYLe0gq1CWDSRz8WhT1BXU6j2ToMWwSDJ6L+e+Na0qw
	 jjW0TbKMxgfBIZKS8HZqCH1pY2KFef4FN4Sbq4vLYerCrAzShSHpMPNK8lH+egpMrW
	 Xav44I8QDCMheTp4YnnkUNlnUym9S+ZNMqKNLnIO9YbcpPXZaWEkw6i7R8rGKDOOGZ
	 /nGrwiP4IfIHm6+Et/DrasxMDnGiFuWI1qW+ovpyLz5FhAkT8v6Kj64hO0yqv+/JiT
	 8a3WGQjqCkFHlCHDncAzliS8bbLEQdUwYsWL6+oUECV8jSHvwd5M2cIeKgyes2IBo/
	 XBTi/PI8qF+RQ==
From: Thierry Reding <thierry.reding@kernel.org>
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jon Hunter <jonathanh@nvidia.com>,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH 2/2] arm64: tegra: Add FUSE block on Tegra264
Date: Sat, 21 Mar 2026 00:38:22 +0100
Message-ID: <20260320233822.2578569-2-thierry.reding@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260320233822.2578569-1-thierry.reding@kernel.org>
References: <20260320233822.2578569-1-thierry.reding@kernel.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>

The FUSE block contains a number of registers exposing information that
is useful for certain drivers and/or userspace to read at runtime.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra264.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra264.dtsi b/arch/arm64/boot/dts/nvidia/tegra264.dtsi
index 8dbce25dfa3a..efb4d21aa4e3 100644
--- a/arch/arm64/boot/dts/nvidia/tegra264.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra264.dtsi
@@ -41,6 +41,13 @@ misc@100000 {
 			      <0x0 0x0c140000 0x0 0x10000>;
 		};
 
+		fuse@1000000 {
+			compatible = "nvidia,tegra264-efuse";
+			reg = <0x0 0x1000000 0x0 0x10000>;
+			clocks = <&bpmp TEGRA264_CLK_FUSE>;
+			clock-names = "fuse";
+		};
+
 		timer@8000000 {
 			compatible = "nvidia,tegra234-timer";
 			reg = <0x0 0x08000000 0x0 0x140000>;
-- 
2.52.0

