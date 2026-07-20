Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A152C379C5D;
	Mon, 20 Jul 2026 06:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784529080; cv=none; b=p08h9mV7hnXNrYUfHv0UXY2jQhpno+ZejgjD9ncnAthFhNpGiFk/YZLQaWdX6+ZfyGAtXtuRLiLkPcK7kqylxDZn6S5UuKx0GuT0JCY1OAFxvrfrMVl7g2K3xqNP8DUgLt8TUdGjOJ1gSaZu7hyeUyaD+4CKqO0Kz0LWTOpAs1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784529080; c=relaxed/simple;
	bh=RbA0CGgTm2dPyexj3MuGmmYeAx3UJ3Q2g4NEHT98CMI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ScJV+CjLvhFobO9XrGqwSr9mc+AOlEKlPiFQw4cKjY4GOPAxqqtBOVRDJCYiMEYE5kCb3BT8GgOBOBktJ7q7gXYiRrYJqfshCwwPJDI3HPwGyW04zjWf8My47bh1BGXBgUOymLM6FUt2DyIp/ddGbHiDnccokSQCcOFOVN9ZN7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZsnbZIs6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZsnbZIs6"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0C4DAC2BCC9;
	Mon, 20 Jul 2026 06:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784529080;
	bh=RbA0CGgTm2dPyexj3MuGmmYeAx3UJ3Q2g4NEHT98CMI=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=ZsnbZIs6RPf1y6t/EmMA1rhAZ/gQYUT2boOwbQzfyTQnr3XJp8EdVZdgJi4rztGYO
	 meitTKnlPIaS8Rdeoo1H79j3nPaV8VYvjzdTI3iEeBz8mCf6P953KhPId8YaErcqVa
	 aHPXtbClGzO2K5zQONz1Aodpkj2dhbGg1tLNx0U/wcBUHAtoTzw6KN5pjLVGJTzzWV
	 C/OTeJGSiKXSwtoD02wIjEUvT+agG+X3lyuvWSP3Sn/uhjqeWEdk8SdnrsjprCp6iA
	 eirkVb8BbE9yuzd1q8fpIETlauosvRoSlDcngT1YssnyJuUAGavexTKZdsVvUXstXa
	 4RW2IiNEA5XoA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D60CEC44521;
	Mon, 20 Jul 2026 06:31:19 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Subject: [PATCH v2 0/2] soc/tegra: pmc: Add Tegra210B01 support
Date: Mon, 20 Jul 2026 01:31:14 -0500
Message-Id: <20260720-t210b01-pmc-v2-0-ca5317f8507b@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/1XMywrCMBCF4VcpszYySUpTXfke0kUSp+2AvZCUo
 JS8u7HgwuV/4Hw7RApMEa7VDoESR17mEupUgR/tPJDgR2lQqBo0UotNSXQoxTp5Ia3uW3fBFus
 aymMN1PPr0O5d6ZHjtoT3gSf5XX+O+XOSFChcb0zjqHXamtswWX6e/TJBl3P+AAITFjWmAAAA
X-Change-ID: 20260713-t210b01-pmc-1a3f8b908044
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, devicetree@vger.kernel.org, 
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Aaron Kling <webgeek1234@gmail.com>, Azkali Manad <a.ffcc7@gmail.com>, 
 Thomas Makin <halorocker89@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784529079; l=839;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=RbA0CGgTm2dPyexj3MuGmmYeAx3UJ3Q2g4NEHT98CMI=;
 b=lAgndM4mFFZanRZ404++Hwgv23HpqhOvVx2DjVBkSK8zl3PqTC14qdJhqzRgeaHRIAMVLAGj5
 VERRe8azdtVBrN/rMUOUrFJEMH1qfI4IU7KbK9Zf0E0Db/4ypIopkEb
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
Changes in v2:
- Address sashiko report and drop duplicated structs
- Link to v1: https://lore.kernel.org/r/20260717-t210b01-pmc-v1-0-bf776be8b3a7@gmail.com

---
Aaron Kling (1):
      dt-bindings: soc: tegra: pmc: Document Tegra210B01

Azkali Manad (1):
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


