Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1841121B195;
	Wed, 22 Oct 2025 03:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761102684; cv=none; b=qY9iOhj1gTKgbkTibl3/usklczO1FnzZXx4wNDiqMHBobmE1LhmcVCYj3NnL/aXoSk9WeaGAERw85ZmdE0YgMDIB2+GfOmPlWfd3YhtZG4n7wlQuHacLAU1ErmX7dqbVILnAmntzl93oJjOgETyAHNyei10Pj1P8K5S8TqctPj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761102684; c=relaxed/simple;
	bh=J3joio7QLYgqlTYEASCEXu7uQck3iJxX3gB8UvFLwo4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=rUhwyDPmylptx+UmFT60dTGBtMOUGRR1oWTehiObEDc6MLSyYx6kNpjAUhRKI3tRoLawTEQIpbP8cHFoLtTtHbaj1CaoiGpRnYmXjUdmVNxYSMa6RXHFiWNR5hNJTnONzbO0MZvo9gqNv6EIg8oNk+J0yyVQBaQ5nEy1A4CHuuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F2gWudvl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F2gWudvl"
Received: by smtp.kernel.org (Postfix) with ESMTPS id A8798C4CEE7;
	Wed, 22 Oct 2025 03:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761102682;
	bh=J3joio7QLYgqlTYEASCEXu7uQck3iJxX3gB8UvFLwo4=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=F2gWudvlYx5xBhl1AFiBuuq2up7dDBCjrE/U2qNgt07yPH58kgqkod4dHKyaRlgyx
	 sY/QDvEJkTnPd6q0+KNKdSuqtDg7nKL9/bOEPI/FFH4Kiv7OS8CXnoxQ5fLgXB8+xW
	 dc++dgqBWw1owkVwcpufja3KmKtCUklzAM0tqU2K96HJrgIs43keIVZ3eFW/sqEdne
	 BM7RDfPnEpWmb+wbn8hWasRds6UCdVdVk3FgOxi7dGOFYKuS6e1vzgh4KED7G2GTc3
	 mgHYKnkaaYfwmo+VFNUiKGIy8E9lDVd7QtAjUMWhs0gnKj2ePcjjWYG9fRSqDb/0az
	 WMRyZC8feyz8w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D540CCD1B9;
	Wed, 22 Oct 2025 03:11:22 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Date: Tue, 21 Oct 2025 22:11:15 -0500
Subject: [PATCH v5] soc: tegra: fuse: speedo-tegra210: Add soc speedo 2
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251021-t210-actmon-p3-v5-1-e1ef5e93909d@gmail.com>
X-B4-Tracking: v=1; b=H4sIAFJL+GgC/0XMyw7CIBCF4VdpWEsyM4ClfRXTBcJUWfQiYGPS+
 O5SXbj8T3K+XWROkbPom10k3mKOy1zDnBrh726+sYyhtiAgg0AoCyFI58u0zHJVUlkEUF2wyK2
 opzXxGF9f8DL8OvHjWd3yG/9s3xwoWCRZ+JbcAeeVOSxSt3DukO3Vet9v+oCvLrP0yzTFUo+II
 QQGS2pErYm1C2DI0ahgBAOojfcuODG83x8N0R9P4wAAAA==
X-Change-ID: 20251021-t210-actmon-p3-3810039d81e7
To: Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Aaron Kling <webgeek1234@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761102682; l=2079;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=MW8HFEQS9R+lPS9/S1KOlskDpwqUZBJBLhRfvIhSwIQ=;
 b=yWz3YwMw+bcDfQX1L+ueM+/Hyb7SfKE3PywfHQxpycJ9twMvzt9NPJP4u+8wr/tEV0lzwPynB
 dItkF6oCM1ZBMcNqIwok9eKEX+9YUjDQP/l0kxPRqt2Df5iEDoX0eCD
X-Developer-Key: i=webgeek1234@gmail.com; a=ed25519;
 pk=TQwd6q26txw7bkK7B8qtI/kcAohZc7bHHGSD7domdrU=
X-Endpoint-Received: by B4 Relay for webgeek1234@gmail.com/20250217 with
 auth_id=342
X-Original-From: Aaron Kling <webgeek1234@gmail.com>
Reply-To: webgeek1234@gmail.com

From: Aaron Kling <webgeek1234@gmail.com>

The Jetson Nano series of modules only have 2 emc table entries,
different from other soc sku's. As the emc driver uses the soc speedo to
populate the emc opp tables, add a new speedo id to uniquely identify
this.

Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
---
Changes in v5:
- Split series
- Link to v4: https://lore.kernel.org/r/20250923-t210-actmon-v4-0-442d1eb6377c@gmail.com

Changes in v4:
- Various cleanups in patch 5 as requested by review
- Fix a couple typos in patch 4
- Link to v3: https://lore.kernel.org/r/20250906-t210-actmon-v3-0-1403365d571e@gmail.com

Changes in v3:
- In patch 5, don't fail mc probe if opp tables are missing
- Add more mc bindings to patch 1
- Add patch to use tegra210-mc bindings in the mc driver
- Re-order series to align patches within a subsystem to each other
- Link to v2: https://lore.kernel.org/r/20250903-t210-actmon-v2-0-e0d534d4f8ea@gmail.com

Changes in v2:
- Assume 64-bit dram bus width in patch 4
- Add dt-bindings patch to document the new properties on the
  tegra210-emc node.
- Link to v1: https://lore.kernel.org/r/20250828-t210-actmon-v1-0-aeb19ec1f244@gmail.com
---
 drivers/soc/tegra/fuse/speedo-tegra210.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/tegra/fuse/speedo-tegra210.c b/drivers/soc/tegra/fuse/speedo-tegra210.c
index a8cc3632977230fbfda0f8c3bfa7b7b25c2378fe..06c2bcbee5734207e3ebacb4057da2195f85321c 100644
--- a/drivers/soc/tegra/fuse/speedo-tegra210.c
+++ b/drivers/soc/tegra/fuse/speedo-tegra210.c
@@ -97,6 +97,7 @@ static void __init rev_sku_to_speedo_ids(struct tegra_sku_info *sku_info,
 			break;
 
 		case 0x8F:
+			sku_info->soc_speedo_id = 2;
 			sku_info->cpu_speedo_id = 9;
 			sku_info->gpu_speedo_id = 2;
 			break;

---
base-commit: 211ddde0823f1442e4ad052a2f30f050145ccada
change-id: 20251021-t210-actmon-p3-3810039d81e7
prerequisite-change-id: 20250812-tegra210-speedo-470691e8b8cc:v4
prerequisite-patch-id: d32dd215b54ac46086377c1ce2c8d53d746690c9

Best regards,
-- 
Aaron Kling <webgeek1234@gmail.com>


