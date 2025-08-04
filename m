Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B4D22236E3;
	Mon,  4 Aug 2025 03:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754277279; cv=none; b=MAsFQB0NBNrNGppPqPQPWTKfs7AJJAFuHoNGnHnWefudjWJAop1HR9BfGZ760i9VOqq5C2Ue8Smm0PBmov/yVeD1Eccf9xa/4lBqHSOc+o3C7Vc7DaooTSIdJLIlL3wbP/h2uVxZvAqQIJAwKKQzwNajRCComqTV3G4Zzartajo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754277279; c=relaxed/simple;
	bh=6blx5Pta5wm6VaOJOfM8nH6FZqZiPA8Egow+M9tJ9z8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rw+uq262181mQP/MtQA3NIO626d4us64DL30OcjKWHhXkJ/YIhF9bL1eQ7/lN8M5z/xphmmXTou9klagD+RVWvPx/a7iqwBDWuE7DHr4DLA2p2zht/d5kaZZFE6gaEBbqFLlv11gk5iwViwfpUS450yn9Er7OcQIkkLM5I+D+nY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZM+1zd8p; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZM+1zd8p"
Received: by smtp.kernel.org (Postfix) with ESMTPS id ABD69C4CEF9;
	Mon,  4 Aug 2025 03:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754277276;
	bh=6blx5Pta5wm6VaOJOfM8nH6FZqZiPA8Egow+M9tJ9z8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ZM+1zd8p2PkvuUHd/8YbRazFJ4VP43WB9cLeQm2caNGj++byFwzx0zou8t7oovJkJ
	 LwBR+IXchH16+BI4bjm5mZLKQw3qHnW7+yjDAYidKoJB6kASxsiFlekqfLb0vLUCaa
	 76Ny6NE7N1qSF4FvsEuo1S/Y/dtfO8QEdeNPIWfS2Gwm0WyGDduqtPphZ7itQoUcNT
	 ftqPMsTveahtA7HiwhCZLoupKtDlS29yRjTjQOOYa5sXmTOdeGxcl9pjAhJP3ryQdN
	 0CIx+ckbOTh7uOJsphCzLHwbMJQa+GquqCAoC2zUnkcK6NVp4mVHmL1B6faNxlxjFj
	 1I6cRL7lQHUng==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97968C87FDB;
	Mon,  4 Aug 2025 03:14:36 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Date: Sun, 03 Aug 2025 22:14:31 -0500
Subject: [PATCH v2 2/2] arm64: tegra: Add reserved-memory node for P2180
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250803-p3450-mts-bug-v2-2-6307125408c3@gmail.com>
References: <20250803-p3450-mts-bug-v2-0-6307125408c3@gmail.com>
In-Reply-To: <20250803-p3450-mts-bug-v2-0-6307125408c3@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Aaron Kling <webgeek1234@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754277275; l=1045;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=iKGwJkv+2DaR9Ac3nn/wKFaNZ/LKBHDd/IXGJTxQu0c=;
 b=xg7Tonp4QiDC2xLgrdd+TxuC6mRXpiNHfSkLhB58/ThEwJI8z7lGPbUzpLRdW6Kv1nC04b0DQ
 4CwJRzn5q3BDHxnECbOJ2FvKrEKEXpzYI5qF+c9NFbK+c24FUfhoQLw
X-Developer-Key: i=webgeek1234@gmail.com; a=ed25519;
 pk=TQwd6q26txw7bkK7B8qtI/kcAohZc7bHHGSD7domdrU=
X-Endpoint-Received: by B4 Relay for webgeek1234@gmail.com/20250217 with
 auth_id=342
X-Original-From: Aaron Kling <webgeek1234@gmail.com>
Reply-To: webgeek1234@gmail.com

From: Aaron Kling <webgeek1234@gmail.com>

The Tegra210 L4T bootloader ram training will corrupt the in-ram kernel
dt if no reserved-memory node exists. This prevents said bootloader from
being able to boot a kernel without this node, unless a chainloaded
bootloader loads the dt. Add the node to eliminate the requirement for
extra boot stages.

Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
---
 arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi b/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi
index 9b9d1d15b0c7eafd3895f02db1bc747d7cc8923c..4a3ed10bde4f084477b10bb50be007da263088e9 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi
@@ -17,6 +17,12 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+	};
+
 	memory@80000000 {
 		device_type = "memory";
 		reg = <0x0 0x80000000 0x1 0x0>;

-- 
2.50.1


