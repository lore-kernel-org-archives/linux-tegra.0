Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DAF93168E6;
	Thu, 23 Jul 2026 02:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784774816; cv=none; b=CHLwOLM4BUHRCIX3s6Ktq1T2MBn5Ww7DwzFt3ySwH9lsvuZvNJO9KHbMKhOkGQ0WwRKX/EUy5KEbxYGSEZQujJqtu3BxdGDboCzD0Ht+yaj0ncN2faAw9S684IfeHd+na7VqNiNwLFVNDxuogL61q0jbbHfHvQ2blqYG7EZ9rDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784774816; c=relaxed/simple;
	bh=faEjHf4ruDkkziyomMoGKUTC/VdZjUyAg1H//yKJt/8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=h6+s2b8nuBYqp2G/hTwJYfJwkmzg4PmLWf8jOMHSQtR5J+lCZeBgZfgKJxBBC5E/5xehNHnplpG0uvmXZgpkVFsTfmoEkwsXEKQkrjQYUHUfvWsVeDl+viqtcleYihA3r/kyuLH7mQIsToKj5vmbN4nZWRNMTDkhCbePmKKa4so=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EfxtTzY5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EfxtTzY5"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8A138C2BCB3;
	Thu, 23 Jul 2026 02:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784774815;
	bh=faEjHf4ruDkkziyomMoGKUTC/VdZjUyAg1H//yKJt/8=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=EfxtTzY5o7Q2lgYbj0A+siHQE6WaGDpiE8E1pcyZDJMiYqCcn8qWOVf5jm4xM2o0i
	 CYUKdFBPfgVTxvV8tc2DXTuyUUYoDsQIupfbI3b9NIKzFRbz9Q0ZybJa1bXG9pgtVB
	 KAgneI378ZLqp8SWSnbquJuPIl9vxgWZ+PUXjOSf/Eb5Wnzkxze4nsMpPKtu4GO3fO
	 w4wImFhyf/J5twAfOfd3HgRZwcj93vnSueZEAhUpAvy0Je9lzwDeSvUAQAbXHGnd//
	 C1A0nolEFR01V8j3m+2WuKiOju9jFhXTyZBAUGcRtL2k1nPwShW3s0FvmEpgj/bC9i
	 A68UqUkvapQjw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 655F8C4453D;
	Thu, 23 Jul 2026 02:46:55 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Subject: [PATCH v3 0/2] soc/tegra: pmc: Add Tegra210B01 support
Date: Wed, 22 Jul 2026 21:46:46 -0500
Message-Id: <20260722-t210b01-pmc-v3-0-1c5b970788f2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/1XM3QqDIBjG8VsJj+d4X610He0+xg7UaQnrAw3Zi
 O59Fgzq8Hng/1tItMHbSJpiIcEmH/045MEvBTGdGlpL/StvwoDVIJDTmSFoQDr1hqLiTuobSCh
 LkospWOc/u/Z45t35OI/hu+MJt/fviJOTkALVTohaW6m5Eve2V/59NWNPNiexQ8vg3LLcGlVxF
 E5WIPSxXdf1B33zmgfiAAAA
X-Change-ID: 20260713-t210b01-pmc-1a3f8b908044
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, devicetree@vger.kernel.org, 
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Aaron Kling <webgeek1234@gmail.com>, 
 Alexandre Hamamdjian <azkali.limited@gmail.com>, 
 Thomas Makin <halorocker89@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784774814; l=1204;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=faEjHf4ruDkkziyomMoGKUTC/VdZjUyAg1H//yKJt/8=;
 b=gPAI8vl5OhnxdH0mKvveELbLTZtnhGVkqkRSQjswIYy2HKQ+RjIrDOyLRkbGf95sf6iRuZ3Wm
 s9IC82kdxzSA18UNzfk2Z0Nx89atls8aakSgXMKnhBDelQsLYyjM0Zx
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
 drivers/soc/tegra/pmc.c                            | 61 ++++++++++++++++++++++
 2 files changed, 65 insertions(+), 1 deletion(-)
---
base-commit: 1a1757b76427f6201bfe0bf1bea9f7574f332a93
change-id: 20260713-t210b01-pmc-1a3f8b908044

Best regards,
-- 
Aaron Kling <webgeek1234@gmail.com>


