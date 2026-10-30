Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793369474;
	b=Xgcyk4aNz4b02IZarOpwRsmeyGUSywXLXg7IOXVtim1Dc7FAE4tLsdiIGG0fxydm40AU
	 3UUIw6TYnp0JxYjPn/y8JSahUSpnNNV6drHWH2Jkpr9SLlaVLmPYBIaRNqVVsVgJH/wfb
	 eyrQtVByvTbmeh+NvWVouWZQy0eo6fCiUokiDw+n8d/ocseTmAfvlLxwIB1RfIepqsT8N
	 dMrCcRGHLGL+XFasSK7nibWoKkTVYV07XOrfWuM+/Kvgkm57WOKaChqwG2jLdk7JGoqtB
	 svd7HUTWfv6JTds7kF/UOo3eETFk1Fp8qNRStzPSHrncYCSZL8SWQBy0oFl0NiR0GmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793369474;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=NxR/awAg8Lbmvyx8ZkJ/r/NDRgHyQoxm+nUAvFr33xU=;
	b=OKHW+ZU9a4S70tPQh8M/+XxyIUYb3sYBXLhPgIUZ2M+w7tqtnZ9318FsoBPaKSkkr2uV
	 5bEvtFQVCUc5Cp3/zuzv9lHaELXtXasZF9aUMiaB7BizA3n+h1FAvRvLkAGjY3y6eYrKI
	 SIMopts9MPGrVvzcRsaGMf89h+BCZb3dA5cEds4eXjlgpQt37SZu1D26/dexkKFETGY/I
	 ITTO64auqXid9IlSTxc2aQ+sARY0QGgQ8CfP63nGXJ/AB+7N07xB3FCOoEaaAOoLWKudK
	 FDxi0uEc1/I4Ohh79JgX3bx0XTp0pJBHbU3cyJLML2PtKB6MdChxjcO/0NkxO6UCGDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HLn8e5eO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9F35606A31A;
	Fri, 30 Oct 2026 14:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HLn8e5eO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A77FD1F000C1;
	Fri, 30 Oct 2026 14:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793369473;
	bh=NxR/awAg8Lbmvyx8ZkJ/r/NDRgHyQoxm+nUAvFr33xU=;
	h=From:To:Cc:Subject:Date;
	b=HLn8e5eOYRbHzGJJlWZ2vCuXa/5W1gk0WdcIyIl7pGxDrysyQUT8Cl8obMhUG74A6
	 xJQz9lewjS3J6z3MYL0YBb8bjl9YyO5y1uqkSVuHfLGd1R8dfp0B+XR9fqrp5QflcX
	 QlJKkB+z/wmBhtsLrwFcDHazfNTPceDqVAeiESWYqlCes5F5WckvvqihTil6sKBp0E
	 N7OvMD0+w4YlAjhlYkC4gchmflS0jjrjkeV/2Fecx1YyWqQxFx9x5A1x7VoyfMBpn2
	 S9pbfAwZxDneF4fluYW9SCQqLd5QmltDs836sI2pKzeM8gvJB1XYMFLUcven/xd6Er
	 fqw5nZ6s73heg==
From: Thierry Reding <thierry.reding@kernel.org>
To: Thierry Reding <thierry.reding@kernel.org>,
	Jon Hunter <jonathanh@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>
Cc: Sumit Gupta <sumitg@nvidia.com>,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH 1/3] arm64: tegra: Fix address translation on Tegra264
Date: Fri, 30 Oct 2026 15:10:59 +0100
Message-ID: <20261030141101.845044-1-thierry.reding@kernel.org>
X-Mailer: git-send-email 2.55.0
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

The TOP chiplet has a region of memory at the local offset 0x20000000.
This region is currently unused, so remapping the non-prefetchable, 32
bit PCI region through that region works fine. However, subsequent
changes will need to make the actual hardware within this region
available, which then causes an address translation conflict.

Fix this by moving the interim translation address (note that this is
purely used for address translation in the operating system and never
used by the driver code) to an unused region of the chiplet's address
space.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra264.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra264.dtsi b/arch/arm64/boot/dts/nvidia/tegra264.dtsi
index 5ab34cd09a3d..ddcc6d3ac9f0 100644
--- a/arch/arm64/boot/dts/nvidia/tegra264.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra264.dtsi
@@ -3420,9 +3420,9 @@ bus@8100000000 {
 		#address-cells = <2>;
 		#size-cells = <2>;
 
-		ranges = <0x00 0x00000000 0x81 0x00000000 0x00 0x20000000>, /* MMIO (512 MiB) */
-			 <0x00 0x20000000 0x00 0x20000000 0x00 0x20000000>, /* non-prefetchable memory (32-bit, 512 MiB) */
-			 <0x00 0x40000000 0x81 0x40000000 0x00 0x20000000>, /* MMIO (512 MiB) */
+		ranges = <0x00 0x00000000 0x81 0x00000000 0x00 0x18000000>, /* MMIO (384 MiB) */
+			 <0x00 0x18000000 0x00 0x20000000 0x00 0x08000000>, /* non-prefetchable memory (32-bit, 128 MiB) */
+			 <0x00 0x20000000 0x81 0x20000000 0x00 0x30000000>, /* MMIO (768 MiB) */
 			 <0xa8 0x80000000 0xa8 0x80000000 0x57 0x80000000>; /* I/O, ECAM, prefetchable memory (64-bit) */
 
 		smmu1: iommu@5000000 {
@@ -3582,7 +3582,7 @@ pci@c000000 {
 			dma-coherent;
 
 			ranges = <0x81000000 0x00 0x84000000 0xd0 0x84000000 0x00 0x00200000>, /* I/O */
-				 <0x82000000 0x00 0x20000000 0x00 0x20000000 0x00 0x08000000>, /* non-prefetchable memory (128 MiB) */
+				 <0x82000000 0x00 0x20000000 0x00 0x18000000 0x00 0x08000000>, /* non-prefetchable memory (128 MiB) */
 				 <0xc3000000 0xd0 0xc0000000 0xd0 0xc0000000 0x07 0xc0000000>; /* prefetchable memory */
 			bus-range = <0x0 0xff>;
 
-- 
2.55.0

