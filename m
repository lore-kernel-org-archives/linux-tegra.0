Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793369479;
	b=ObkLC7apK5SQcU5jDohfEzEDWTXmXUe7C9qU2F4uj7DIAfkJawiXR7Pg9EzUhlQiQJgP
	 BtP8xmpqmrzANBV3w91N0evby2I+h97haP2ukdv9xd9Xdfrb8E64VGl7uK2wRrJYD1zh7
	 WvoYYJDDuyG6ENMFlXl0uoouaW1lhaWFnvD974jo++J+yVcojLTgmlIffNMi/k2hjnaYg
	 /lcJU/gSBgb08Cwxf6qIMp2yjVVhqFv+6ypq9P0wF9Wd6GjMh0XOrVjoKYui4aNaDV81r
	 a4MZGZnrqm/ajRu/c8Y3OfudxkGNASwf7UhgcxzvizZoe3KHWNotSeRyY6tN5R8yVMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793369479;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=QuaHbrVd9CbB207gj15tc3d6NjOME7QCc3OB1+QzGho=;
	b=aaQ2UGBrRVqIgVXRe17zAasryrMmOtE2JkKGlKNsFYnqEY//yXRWNqbiJ/HqQWwCobW/
	 xnvAOt+2R7MiXexuTVGDjk8nk2alEvmhZkNCnPK0n39vNf1PZcDk+SUEQMnncG6POef39
	 xUY5hJBlqWrscxkZqs5BLw06KBEMWAxYTY/xV+bAZFCilS7lUUxvmH77+hc8S1/43YXwF
	 zfaTlDmjFjA+YFLjc+KRdvvfXTo4SNI+iHzXs6M6mTVaMnIfqZOB2shKuSEadK5gh5jZv
	 fMVChM2RoP5praD2GFZah6H+FO8Xoy6iPc9TiRdI50zELwZvYdgtfC8Ky7kwXgmVGnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="W4QA/IXz";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4949B606A321;
	Fri, 30 Oct 2026 14:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=W4QA/IXz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 566A61F0093A;
	Fri, 30 Oct 2026 14:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793369478;
	bh=QuaHbrVd9CbB207gj15tc3d6NjOME7QCc3OB1+QzGho=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=W4QA/IXzZDc4EXBdcpCsyOlY6QVwXykp3NcVlnh+a97JDRcNTGqLxJ8m3i6HIb09i
	 g9EPP2dxYOIY1+EfXr+0r8k5FH5zF7K+pyhbhxSEmjUQ5WKIYt2fBX/bk4GCAKnyeM
	 zed4udjfGGIWXYSAVXQGtx0HXWTxva29eKoo9/5H7aHoDfzV1iWIPcGmwDZYG2uwt7
	 v1fsY6mDpz3wVJ786GgHMBOKoZrvh3IU+aw50KgRomwpk2dNpC3ZiVg4kzIPyoc4sl
	 XentXf6d/bmMhNV7OsgHq2pMYaV0YUy6iElGXR6OyJ5YN4UMcBZX7+gxlMRiAUPe9v
	 AuXmdMsXgAJOA==
From: Thierry Reding <thierry.reding@kernel.org>
To: Thierry Reding <thierry.reding@kernel.org>,
	Jon Hunter <jonathanh@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>
Cc: Sumit Gupta <sumitg@nvidia.com>,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH 3/3] arm64: tegra: Remove PCI ranges from VISION chiplet
Date: Fri, 30 Oct 2026 15:11:01 +0100
Message-ID: <20261030141101.845044-3-thierry.reding@kernel.org>
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

The VISION chiplet doesn't have any PCI controllers and therefore
doesn't need PCI related ranges for address translation.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra264.dtsi | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra264.dtsi b/arch/arm64/boot/dts/nvidia/tegra264.dtsi
index ea2e9adff6d9..b7f6b649baab 100644
--- a/arch/arm64/boot/dts/nvidia/tegra264.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra264.dtsi
@@ -3996,9 +3996,7 @@ bus@8180000000 {
 		#address-cells = <2>;
 		#size-cells = <2>;
 
-		ranges = <0x000 0x00000000 0x81 0x80000000 0x00 0x10000000>, /* MMIO (256 MiB) */
-			 <0x100 0x00000000 0x00 0x20000000 0x00 0x40000000>, /* non-prefetchable memory (32-bit) */
-			 <0x200 0x00000000 0xa8 0x80000000 0x57 0x80000000>; /* I/O, ECAM, prefetchable memory (64-bit) */
+		ranges = <0x000 0x00000000 0x81 0x80000000 0x00 0x10000000>; /* MMIO (256 MiB) */
 
 		host1x@1200000 {
 			compatible = "nvidia,tegra264-host1x";
-- 
2.55.0

