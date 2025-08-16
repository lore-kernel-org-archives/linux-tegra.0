Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 735BC1F3BA4;
	Sat, 16 Aug 2025 05:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755323659; cv=none; b=XIx/x+bV0iSbl7GByRRU7uwB+HOgzav23qZgXxbo9HgICqlMYxWvdsxKwqBPMxrWH/DFDutYMa0VIYU9aFV1jNszUwoSEKSD8NeAZ1NIGvvr3AodTJe1cfEnjATzv11O63pN4ZtoWz920gTpA+Wx7jDx/KBloIr2xjfXSZqQUko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755323659; c=relaxed/simple;
	bh=AvZ1tRJrWp2wAn5vw7e080Dg1m5RoZeyyJF5BYFUrZg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eJ5BBO17c0C65wG0dP6KT1xEBP+uLZhGBLE7DSz5VkKBJnJvXCFV8DzycRmnGiiyZx23VVipqfC/GaI5KNKfRA8wCrJ7FYFXDufKAZ+P9029Fl3g+2yiqTDpBNEJ8jVyd8uhdTSbA8bJ+C0logrNeVOUt+P67pnAl4FcShm/Izs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a6+TDVpp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a6+TDVpp"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 23256C4CEF6;
	Sat, 16 Aug 2025 05:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755323659;
	bh=AvZ1tRJrWp2wAn5vw7e080Dg1m5RoZeyyJF5BYFUrZg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=a6+TDVppuLfi1C80sUnKDDoOQTXF0LMKB2s3TLmiV6osTmB/FoUMmurlvekkEaBJO
	 IyhtVqiE30EfE9CUBkWSP+l5jiXcj3UactIJKqHmg1hxzyXrWNLBwbo0VmG+WNcrMx
	 zPYQ+ptpK4/dBiqsKO8uglHN0ZMn/qZlcrK/qspIQNcU5VzJhFCwNjzqIw512aOeV4
	 gFhQjr7P0sNbLhbq+pCksu9LcGiPWOeD9G/PilccTCRlGCYki/kLIQK7Z+03BvasR9
	 Wteotm572S7Sxuqk7l6Obdc+2RMRFwmzrGC1WSd73TitC0OwrpGRrEfrgDBsF+O//l
	 dBIAAHvK/Kzjw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18034CA0EEB;
	Sat, 16 Aug 2025 05:54:19 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Date: Sat, 16 Aug 2025 00:53:35 -0500
Subject: [PATCH 3/5] soc: tegra: fuse: speedo-tegra210: Add sku 0x8F
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250816-tegra210-speedo-v1-3-a981360adc27@gmail.com>
References: <20250816-tegra210-speedo-v1-0-a981360adc27@gmail.com>
In-Reply-To: <20250816-tegra210-speedo-v1-0-a981360adc27@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Joseph Lo <josephl@nvidia.com>, 
 Peter De Schrijver <pdeschrijver@nvidia.com>, 
 Prashant Gaikwad <pgaikwad@nvidia.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Thierry Reding <treding@nvidia.com>, Aaron Kling <webgeek1234@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755323658; l=976;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=pWQFdNwG5wqAUfrAYFEYhFd3g2VQZFhe1CBj1AG4N/Q=;
 b=hIQ9qJnm6qDoO0yAW2MX7dJ374+oXSQkdsje8YbYZoXPkHMerXkpgbxMnshwM0GU9PBkgI/FV
 +Z4KGZDvD4WAS1Ei5l804K8fZ1T7uKGLAjZhSgq6U1WrRdUaGAJbSxB
X-Developer-Key: i=webgeek1234@gmail.com; a=ed25519;
 pk=TQwd6q26txw7bkK7B8qtI/kcAohZc7bHHGSD7domdrU=
X-Endpoint-Received: by B4 Relay for webgeek1234@gmail.com/20250217 with
 auth_id=342
X-Original-From: Aaron Kling <webgeek1234@gmail.com>
Reply-To: webgeek1234@gmail.com

From: Aaron Kling <webgeek1234@gmail.com>

This is used by the Jetson Nano series of SoMs

Fixes: 579db6e5d9b8 ("arm64: tegra: Enable DFLL support on Jetson Nano")
Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
---
 drivers/soc/tegra/fuse/speedo-tegra210.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/soc/tegra/fuse/speedo-tegra210.c b/drivers/soc/tegra/fuse/speedo-tegra210.c
index 909fdf8fcc9d9f5ac936ae322e7a73dc720e5ab6..1cdd70c59c0753e602709f9179c0ab67d1b8f5e3 100644
--- a/drivers/soc/tegra/fuse/speedo-tegra210.c
+++ b/drivers/soc/tegra/fuse/speedo-tegra210.c
@@ -99,6 +99,14 @@ static void __init rev_sku_to_speedo_ids(struct tegra_sku_info *sku_info,
 		sku_info->gpu_speedo_id = 1;
 		break;
 
+	case 0x8F:
+		if (speedo_rev >= 2) {
+			sku_info->cpu_speedo_id = 9;
+			sku_info->gpu_speedo_id = 2;
+			break;
+		}
+		fallthrough;
+
 	default:
 		pr_err("Tegra210: unknown SKU %#04x\n", sku);
 		/* Using the default for the error case */

-- 
2.50.1


