Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF5FB21638C;
	Thu,  8 May 2025 06:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746684465; cv=none; b=g2ld39DWQDZ8I6gdCUczjBB8q3FZJ81PBZT/ZXAZP3ghkXK6YZdLxcYVGrUDFJ9k8tTNvg3bSaPuc9cXhRSNA7YwqVsKpelGcpu9wN9s7zaxPPOs4sR68KHCWOBPt7WaI7q+LXV8JS9ZmFiGLBwAUnDkYzREX1YcyFqABRxgzlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746684465; c=relaxed/simple;
	bh=yi88OJK5yR59gz0QB+OegU7xAAvdm64svetJl4b8fk8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sgAi+5pWZtsU1ZtG9hP2WTByIMwEDrtZH4Jq16OSV7q8MxMi1SNmXFay12BWl5NG+Jo3xS7ti9iH+6LnrZ79xaQzwR0gvjh2k+1qZ5UIkadiCkSnSLINKk/+VulraWnyyNCKxMfhOqanscdsOqUkikZPVjZ/Wza1K8UYRl21T+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lAvw9cQn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lAvw9cQn"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 58C4DC4CEF1;
	Thu,  8 May 2025 06:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746684465;
	bh=yi88OJK5yR59gz0QB+OegU7xAAvdm64svetJl4b8fk8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=lAvw9cQnohd2Ft89FwlkPqeOSCa4N5MM7Qw1YSGGMltxZZWfcJ0HQ9OFVELQyJ2ko
	 N/ad9ALb068NAb+Q2UqpNB+lvOtwCedz2PkWYCurzRYfdrvbS+Yw/bvKRH0jq11VCN
	 2UyZfXJeSITcb1TVolv2kpfqQ9rXofXYawYdRsrqaiJYcZ+Jy+olYXIi77OxS0dHQ5
	 bK/EYkh0f8DxHChYYPQS7AJIA1O6YmpBQfZilyOhI7R75qtA9lh23IJkJcLD0AiUaK
	 MtIM5WxX8uAjHfynAIRN1T5+TMNmXExm8g7fkbsuLzHApzOxe7VLGuEIgn+z3+dkzs
	 N7TZoBkR5EmiQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A980C3ABC5;
	Thu,  8 May 2025 06:07:45 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Date: Thu, 08 May 2025 01:07:39 -0500
Subject: [PATCH v2 2/4] dt-bindings: memory-controllers: tegra210: Allow
 fallback compatible
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250508-tegra210-emc-dt-v2-2-d33dc20a1123@gmail.com>
References: <20250508-tegra210-emc-dt-v2-0-d33dc20a1123@gmail.com>
In-Reply-To: <20250508-tegra210-emc-dt-v2-0-d33dc20a1123@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, 
 devicetree@vger.kernel.org, Aaron Kling <webgeek1234@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746684461; l=1131;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=5IbR1bmo6NLdZ9+ATxenwM0aRIdwm6/TcE2oX1FSILI=;
 b=uBUYKRVk2hA7/8KefqSsKjzmXcReRWWGodF8KPbEmLzvsiEG/GsU0LUyg5Ix+wD9tUlaLvEKO
 1AxodFDoXUIBULjrjc1nNLgXLxPto/QPazlqIhal/GEPCOb79gneVLK
X-Developer-Key: i=webgeek1234@gmail.com; a=ed25519;
 pk=TQwd6q26txw7bkK7B8qtI/kcAohZc7bHHGSD7domdrU=
X-Endpoint-Received: by B4 Relay for webgeek1234@gmail.com/20250217 with
 auth_id=342
X-Original-From: Aaron Kling <webgeek1234@gmail.com>
Reply-To: webgeek1234@gmail.com

From: Aaron Kling <webgeek1234@gmail.com>

The nvidia,tegra21-emc compatible is required by the Nvidia Android
bootloader to copy emc training value into the kernel dt. So allow this
as a fallback compatible to avoid needing to change the driver.

Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
---
 .../devicetree/bindings/memory-controllers/nvidia,tegra210-emc.yaml | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra210-emc.yaml b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra210-emc.yaml
index 78e3417d273a329b77bf2f61de41b29017be56d3..acae6c8a6c0ab9ceaddf00342c933499350568eb 100644
--- a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra210-emc.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra210-emc.yaml
@@ -16,7 +16,11 @@ description: |
 
 properties:
   compatible:
-    const: nvidia,tegra210-emc
+    oneOf:
+      - const: nvidia,tegra210-emc
+      - items:
+          - const: nvidia,tegra210-emc
+          - const: nvidia,tegra21-emc
 
   reg:
     maxItems: 3

-- 
2.48.1


