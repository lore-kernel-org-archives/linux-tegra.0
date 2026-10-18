Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59B5C2C026C;
	Sun, 18 Oct 2026 22:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792363577; cv=none; b=CjFQC5b8u2lZo6NP1uBeBjMBrE5c6REKk1VpOyCOTBVzgmjlhLKv4tTzAW9X+cDFTav7ZCwgOfD7WppAZIDqtD3/pCzHfwBJrdIbrmCm0AnpRRRh9xR8/dyjSwZoshADfDxAbQ4dwdkPB5git3TZQHhwo4rep54p+EktIzSSScI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792363577; c=relaxed/simple;
	bh=0QkKYb6ZtfqiYDcJ8+nXttwgzcc41SFsCPQGNK5/zk8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=me/l94fkctvmztAyA0Rzo2fS4VaJ6gRlqZ6p4YP0Thf7Gd5qU6PzixR5ukHGE1M5V/CWsWyclghLlDG+dnUwgm7mOBWBRRgS4lZrtNdap3cOslA5253DpHTtBpTy838TQc8XsRkf0GI8kS3Xvcc6w112g8qOxmYbznLZu6cH3qM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QOVpPITJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QOVpPITJ"
Received: by smtp.kernel.org (Postfix) with ESMTPS id E93FFC2BCC7;
	Sun, 18 Oct 2026 22:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792363577;
	bh=0QkKYb6ZtfqiYDcJ8+nXttwgzcc41SFsCPQGNK5/zk8=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=QOVpPITJl1sndm4BUGroQj7GTqHRSsAd0UAPibAAylgGpUos7qqTNQDahdkeALta9
	 ZSEfJDn5K/0ailpSBa7s+bCFFS6BztHXYAlIbuLC8VBagGZ4Dyc+6kC/4BWalFTBBU
	 8E7kJtXtB6zm411S2ILlJblRjUX1sX7rdc2vWa99FjvuCjOlWCuxGtMhiu5WQcdW1I
	 E6gA8sGS85t6I06QqJOGFNLD193Jn7FsiQLkEE/XOBI0jxoxhCtrkSnPtGfkhmuuuu
	 H6C98yQUj9qqD61lDPBHpdtXKwVRpRLYxQJCbkazwJyY3jEIDqncJrhgrOfxz9ZMvn
	 C/ZiRGF5By0lw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3982CCF2C4;
	Sun, 18 Oct 2026 22:46:16 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Subject: [PATCH 0/2] clk: tegra: Add Tegra210B01 support
Date: Sun, 18 Oct 2026 17:46:04 -0500
Message-Id: <20261018-t210b01-clocks-v1-0-d9e980925925@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDc0MT3RIjQ4MkA0Pd5Jz85Oxi3SQL82SjFBPLVAMjCyWgpoKi1LTMCrC
 B0bG1tQDxAdpfYAAAAA==
X-Change-ID: 20260714-t210b01-clocks-b87c2d49e028
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Prashant Gaikwad <pgaikwad@nvidia.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Aaron Kling <webgeek1234@gmail.com>, 
 Thomas Makin <halorocker89@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792363575; l=1600;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=0QkKYb6ZtfqiYDcJ8+nXttwgzcc41SFsCPQGNK5/zk8=;
 b=hry8Z7XbaJ+BB6BZqq/7DY52Zq1m8bNJbUmRhv+U7jhl3xlX5VYIoY2woDWt7x5vKfUZkG7X+
 xg5xXVZr+GhBlynIkzqyqip5WSjNlwFaQd5LajouWA1M8TsHG2pOb7S
X-Developer-Key: i=webgeek1234@gmail.com; a=ed25519;
 pk=TQwd6q26txw7bkK7B8qtI/kcAohZc7bHHGSD7domdrU=
X-Endpoint-Received: by B4 Relay for webgeek1234@gmail.com/20250217 with
 auth_id=342
X-Original-From: Aaron Kling <webgeek1234@gmail.com>
Reply-To: webgeek1234@gmail.com

This was originally part of a larger Tegra210B01 support series [0], but the
request was made to separate the patches. A review was given to the
driver patch, but as the comments all also apply to the tegra210 clock
driver, a request [1] was made to not de-sync these. With no response to
that, this series is being re-submitted without those changes. There
have been some updates to fix some usb handling and to address other
issues found on devices during bringup.

[0] https://lore.kernel.org/linux-tegra/20250720-t210b01-v2-14-9cb209f1edfc@gmail.com/
[1] https://lore.kernel.org/linux-tegra/CALHNRZ_1pO99n_P-TLXTKqX8Rz=Q5-d8jsXV+HaM07f7FZ4jsA@mail.gmail.com/

---
Aaron Kling (2):
      dt-bindings: clock: tegra: Document Tegra210B01
      clk: tegra: Add Tegra210B01 support

 .../bindings/clock/nvidia,tegra20-car.yaml         |    1 +
 drivers/clk/tegra/Makefile                         |    1 +
 drivers/clk/tegra/clk-tegra-periph.c               |    3 +
 drivers/clk/tegra/clk-tegra210b01.c                | 3524 ++++++++++++++++++++
 drivers/clk/tegra/clk-utils.c                      |    5 +-
 drivers/clk/tegra/clk.c                            |   19 +-
 drivers/clk/tegra/clk.h                            |    6 +
 include/dt-bindings/clock/tegra210-car.h           |    5 +-
 include/linux/clk/tegra.h                          |    4 +
 9 files changed, 3564 insertions(+), 4 deletions(-)
---
base-commit: 2efb7a11f1aa4d2dc285fe2680cca22cb9f72f64
change-id: 20260714-t210b01-clocks-b87c2d49e028

Best regards,
-- 
Aaron Kling <webgeek1234@gmail.com>


