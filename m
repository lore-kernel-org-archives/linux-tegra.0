Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D6583D544;
	Mon,  9 Jun 2025 04:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749443084; cv=none; b=i5InU/ltil2XR8dn22N5SsKTQZNg4QTotwfVg4dUJx0uOEzgZqT+TGQoOpposUKKHLwTgKzUCtJTlfxm7K+nUK9TXOJhl/VRhA2x07c6SwBkWZ7kxqv1ykl94bhgdezNVhqwxOmdUfFpA82oR7BWoXjwJao3tx/fAbC/+QH1DA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749443084; c=relaxed/simple;
	bh=nA4pr8rR8GdTPJG1GEj2FJ2dYpGn+ljhMBTSZXnCjfw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=mqXz1osUcMFvKce8Nt6oyGYvJp0bhQHKoRvBVz3TcujWPz6I4uV6q4bV+c0ErEM2cim9HBc/oCooZ/Cjvx9skdDmCjEub7R/vzQk2GFJazu1/YjrEISABuLImLAqJJQAoQHi/GSJUUoqKJvSbR+Wshu85/qxNnXdSPgnL4agYpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cVcxzpDu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cVcxzpDu"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 35AF6C4CEED;
	Mon,  9 Jun 2025 04:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749443084;
	bh=nA4pr8rR8GdTPJG1GEj2FJ2dYpGn+ljhMBTSZXnCjfw=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=cVcxzpDuEraFhdpW7J67sDmKDDlbT3xG796Wbx1mHcjKH9fM42tQoyXNAcuTxnkFe
	 Q92amqZ8H9L3RcKTvvNn/ytyEYe2POutaO0oR9JrVtmgg1xEABqOFSTT63K7olUkdy
	 WhW/BhZ6x/DGU0n4W3UjHITjSMw5p63aV7vyt3A0WfNfwJc26jo+Gvb6UK1SP7wFDg
	 uTdINLnQJmRUFE/dXrVF8TtfPwEpOFQFJArbOBDUmo2J+nr7Rzq8bnjHAyD01OdgAJ
	 StsvpyGiZ1CxuXMiRut6KDlmAbfBUxybrvbC5evhTJRA/Vvnpz67q2baxMWOaEZL7E
	 1kwNq+MLS9blw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F598C61DB2;
	Mon,  9 Jun 2025 04:24:44 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Subject: [PATCH RFC 0/2] arm64: tegra: Add NVIDIA Jetson Nano 2GB Developer
 Kit support
Date: Sun, 08 Jun 2025 23:24:34 -0500
Message-Id: <20250608-p3452-v1-0-4c2c1d7e4310@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAJiRmgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDU0Nj3QJjE1MjXQNTS3MDi+RES0tLYyWg2oKi1LTMCrA50UpBbs5KsbW
 1ABmodlpcAAAA
X-Change-ID: 20250513-p3452-059708ca9993
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Aaron Kling <webgeek1234@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749443083; l=606;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=nA4pr8rR8GdTPJG1GEj2FJ2dYpGn+ljhMBTSZXnCjfw=;
 b=3whLJDhEmZEwU8CgXuejrd87bVi5K1GSxA2ybAQz6muihICLk3igRj4rBsRDHAJUSejhtoOZs
 lKQcri3FujqByhHbo5T43vkhqLy7BhYxw7ZvjIKUHsSHIcUq9AXbprh
X-Developer-Key: i=webgeek1234@gmail.com; a=ed25519;
 pk=TQwd6q26txw7bkK7B8qtI/kcAohZc7bHHGSD7domdrU=
X-Endpoint-Received: by B4 Relay for webgeek1234@gmail.com/20250217 with
 auth_id=342
X-Original-From: Aaron Kling <webgeek1234@gmail.com>
Reply-To: webgeek1234@gmail.com

Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
---
Aaron Kling (2):
      dt-bindings: arm: tegra: Document Jetson Nano Devkits
      arm64: tegra: Add NVIDIA Jetson Nano 2GB Developer Kit support

 Documentation/devicetree/bindings/arm/tegra.yaml   |  5 +++
 arch/arm64/boot/dts/nvidia/Makefile                |  2 +
 arch/arm64/boot/dts/nvidia/tegra210-p3541-0000.dts | 43 ++++++++++++++++++++++
 3 files changed, 50 insertions(+)
---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250513-p3452-059708ca9993

Best regards,
-- 
Aaron Kling <webgeek1234@gmail.com>


