Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48CEF2EA173;
	Tue, 28 Jul 2026 02:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785204013; cv=none; b=LXMLxhzS0jXgYWawd7MtK9TsYRDuzoFLQWUoDKqMG8B4q0FJROaxOF6DR5E6kGcX/LKox5IvIhLaQqqqnKDpzHgWtfZab28sK1Vvc0bayHMmKd+s01ScwHE+LeJ56uedQwX46MTa6I7KOq17MCpzULjtY5cSmyb4ra3aQ2829PU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785204013; c=relaxed/simple;
	bh=tXSaf6D+4oT/tivF4Swhyqm9z9vxCocGJRBBgGLQTGY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ea9u3H+YBhBYJaMhbqP/yelb6YOfIpQyjKLNRZt1igqZSFRLlP8gKQKzovkUecuYXSZ1a02pOLfz5fSkTZm93H4gaUmmJFZkkWicKHSb5dzDi+9QAV199y0jDi25pBVwho//OBdbv69speEPnhggdzNRGeQm7WZM+smgFWpPlK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OlMGAE+O; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OlMGAE+O"
Received: by smtp.kernel.org (Postfix) with ESMTPS id D5013C19425;
	Tue, 28 Jul 2026 02:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785204012;
	bh=tXSaf6D+4oT/tivF4Swhyqm9z9vxCocGJRBBgGLQTGY=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=OlMGAE+O6Kb5JKYzQAiml1u63LW34EreNAtZsaLzDZW50am3ccxlymNaI6EzodGC/
	 UjfSYZJMMp1SASf9uGu/JwVJa+kg4f+Kvt2XAv8EpEUW2UUhZUymZKu64Lmp7CT9UU
	 14K5dqUA3b9W4ZkQthzSlSVEQyQK+otikHY3m20HCsN8c5jYnWw6SzuTiqPYF1q38D
	 0PtI4EgA/hui5KeFGEC6PVLritXFZQlq/8JJPXDKix5M7MbR3HcbzlULED/jKNCLAP
	 6ymA7ibsGRtMui9co5dJAEzQKuFM3rwpbK+2BMHiyQzY3de3W50aEGW0a0cepAqMFH
	 TnJiLBrOfmexg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD941C54F4C;
	Tue, 28 Jul 2026 02:00:12 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Subject: [PATCH v4 0/2] soc/tegra: pmc: Add Tegra210B01 support
Date: Mon, 27 Jul 2026 21:00:09 -0500
Message-Id: <20260727-t210b01-pmc-v4-0-af68a21cd746@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/13MSwrDIBSF4a0Ux7VcNck1HXUfpQO1mgjNAw3SE
 rL3mkAh6fAc+P6ZRBu8jeR6mkmwyUc/9HkU5xMxreobS/0zb8KBV4BM0Ikz0MDo2BnKlHBS1yC
 hKEgWY7DOv7fa/ZF36+M0hM8WT2x9fx08dBKjQLVDrLSVWii8NZ3yr4sZOrJ2Et9ZDkfLszWqF
 AydLAH1vxV7y49WZMtMqWsElNLxvV2W5QslZc9KHgEAAA==
X-Change-ID: 20260713-t210b01-pmc-1a3f8b908044
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, devicetree@vger.kernel.org, 
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Aaron Kling <webgeek1234@gmail.com>, 
 Alexandre Hamamdjian <azkali.limited@gmail.com>, 
 Thomas Makin <halorocker89@gmail.com>, 
 Mikko Perttunen <mperttunen@nvidia.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785204012; l=1353;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=tXSaf6D+4oT/tivF4Swhyqm9z9vxCocGJRBBgGLQTGY=;
 b=AH/OGdp3UY0CYqiLuqD6MN6kK/40jUp7poCfRHz0xzfIcsKLLPjuE1iujCHpMsJLMi+LuIQOV
 AgVrQrEvr/sDmoed7WZE4BnJOxpjmWBwaHlzmoI8y5UXcHJnY+67Yny
X-Developer-Key: i=webgeek1234@gmail.com; a=ed25519;
 pk=TQwd6q26txw7bkK7B8qtI/kcAohZc7bHHGSD7domdrU=
X-Endpoint-Received: by B4 Relay for webgeek1234@gmail.com/20250217 with
 auth_id=342
X-Original-From: Aaron Kling <webgeek1234@gmail.com>
Reply-To: webgeek1234@gmail.com

This series adds support for the Tegra210B01 SoC to the Tegra PMC driver
and documents the new compatible.

Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
---
Changes in v4:
- Add venc to powergate list in patch 2
- Link to v3: https://lore.kernel.org/r/20260722-t210b01-pmc-v3-0-1c5b970788f2@gmail.com

Changes in v3:
- Update patch 2 commit author and sign-off tag as requested off list by
  author
- Update patch 2 commit message to describe the powergate differences
  compared to t210
- Drop sata powergate in patch 2
- Fix has_io_pad_wren value in patch 2
- Link to v2: https://lore.kernel.org/r/20260720-t210b01-pmc-v2-0-ca5317f8507b@gmail.com

Changes in v2:
- Address sashiko report and drop duplicated structs
- Link to v1: https://lore.kernel.org/r/20260717-t210b01-pmc-v1-0-bf776be8b3a7@gmail.com

---
Aaron Kling (1):
      dt-bindings: soc: tegra: pmc: Document Tegra210B01

Alexandre Hamamdjian (1):
      soc/tegra: pmc: Add Tegra210B01 support

 .../bindings/soc/tegra/nvidia,tegra20-pmc.yaml     |  5 +-
 drivers/soc/tegra/pmc.c                            | 62 ++++++++++++++++++++++
 2 files changed, 66 insertions(+), 1 deletion(-)
---
base-commit: 1a1757b76427f6201bfe0bf1bea9f7574f332a93
change-id: 20260713-t210b01-pmc-1a3f8b908044

Best regards,
-- 
Aaron Kling <webgeek1234@gmail.com>


