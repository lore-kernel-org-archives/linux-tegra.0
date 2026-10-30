Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793369476;
	b=d8vR9EywA8DzTJql9+/Al0qf+KWjuDlI5tLO/T3Fr9bVzx8oyQc9eIWmtmeEucxlbipC
	 rVpPlZpQ+yB3APRvIcwT8p8mbW8CHX1s1mh43rpx3SEL17GLul015w05yiIrMHOzuzJ6s
	 5TlbKLVfwlerMUYa4+2DdsjwJeOFTsbP4i4G5iq9aK7YT1tBwCCND57FaaGbSeDaH7w1F
	 3sCOkUWSNmJvEssHxSGnPx6jBCHa7rK15ZdkpAMOHX1fCDoyvlQwPbbwcHBS1KVAVe3bF
	 FkWWDuknKyBt/+BY4NGjpbTcpLnOolPowsnOSPl2wBYUc6EpuozLGzk3keuSikSXRfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793369476;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=S8xAdX1gEursIdaMSBYXTSBc0BUi00s7A+k824xIgcM=;
	b=hmrJVliLNmnR5y/YYhM7PfwxQkJjhknEJkDrjdX2EvjF62PHRXeOc6mIfRWKCI1YUq9u
	 rdgszygc0tajlq0U5umm2ZzIMqBovqrPmx3spBBgelOgGdnl20PCDcTGoh8OKqdX2xCk6
	 y/jel7+IZdqnb3f5D4Tdr3IxJYfh4Lol6ZlutsOcV1ARH/2pelXIVPCnq1kIZkAayDN1F
	 Q1iowi42eiS2c2vEMbkGlGmsnkww2EQp2ApGBd6kKKFGlnCfyLrOmpHnUeNFiSV8yOEgw
	 ArnxMpjMgsuntrPhB3sbiX3DETu44a4B22pd/iTMtkNPSiAP5pGhU/1zIoV3XWmmMhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=l2C1Fyc9;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D875606A31A;
	Fri, 30 Oct 2026 14:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=l2C1Fyc9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 880351F000C1;
	Fri, 30 Oct 2026 14:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793369476;
	bh=S8xAdX1gEursIdaMSBYXTSBc0BUi00s7A+k824xIgcM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=l2C1Fyc9K9Tihi71R+tSFPkHEmMTBomEdi3ZJaUG0o/TYLBGMg9TRpg3rOKbkOpHO
	 G/jr7SGpWwkEXZEcB9LtEUmJCWmfiCM9KCoBrXHo5scpyNRHtOswVGujee+4i9WX3I
	 KoE1KPV7qO9h5LnESjg6w0aTHPG7aXduRBYns972V3cFnkjcATEHvYPtZNKRRjVa07
	 16Ss1MmJxO7bC7WgYLaWSPmhsd6iEm5nnvjYY8dTdwM/vHL6j3gV4TFBdjvveyvu0B
	 M69jsbYCmC/KnmdDdxlRem79EiyeiPunDaSOuLYhA29kY/4zDs7G6xgZoRIWSCU98s
	 Kw9iZg4WfcK9A==
From: Thierry Reding <thierry.reding@kernel.org>
To: Thierry Reding <thierry.reding@kernel.org>,
	Jon Hunter <jonathanh@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>
Cc: Sumit Gupta <sumitg@nvidia.com>,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH 2/3] arm64: tegra: Fix memory size unit in comment
Date: Fri, 30 Oct 2026 15:11:00 +0100
Message-ID: <20261030141101.845044-2-thierry.reding@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261030141101.845044-1-thierry.reding@kernel.org>
References: <20261030141101.845044-1-thierry.reding@kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>

The non-prefetchable, 32-bit region of PCI addresses in the UPHY chiplet
is not actually 1536 GiB. This is a typo and it should say 1536 MiB.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra264.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra264.dtsi b/arch/arm64/boot/dts/nvidia/tegra264.dtsi
index ddcc6d3ac9f0..ea2e9adff6d9 100644
--- a/arch/arm64/boot/dts/nvidia/tegra264.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra264.dtsi
@@ -4105,7 +4105,7 @@ bus@a800000000 {
 		#size-cells = <2>;
 
 		ranges = <0x00 0x00000000 0xa8 0x00000000 0x00 0x20000000>, /* MMIO (512 MiB) */
-			 <0x00 0x20000000 0x00 0x20000000 0x00 0x60000000>, /* non-prefetchable memory (32-bit, 1536 GiB) */
+			 <0x00 0x20000000 0x00 0x20000000 0x00 0x60000000>, /* non-prefetchable memory (32-bit, 1536 MiB) */
 			 <0xa8 0x80000000 0xa8 0x80000000 0x57 0x80000000>; /* I/O, ECAM, prefetchable memory (64-bit) */
 
 		pinmux_uphy: pinmux@82e0000 {
-- 
2.55.0

