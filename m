Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3D332853F6;
	Tue,  6 May 2025 17:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746551374; cv=none; b=TQEWSRw2NZ0W1qjPFwuHcUo260/ixzKP71IdzDSwzf+wUKC1Zi2cBUrHlC/cFoESUKF+etfrhItIgE2r6rP4fG5BJ66uPxvOX8O3Aq77cXjWEMVAgsZZu8g7WIs0eTMqsZDLhiRkQolTQKUbyB2MtutjuQuiFhz8CcAxJrYg0t4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746551374; c=relaxed/simple;
	bh=FNA2gsRQTdJsloAcS3RRSgVH0l+51ZiDBDeK6njOiz8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ZuAyxT+dbmUTMBx/NB9bSG4b8c+BGvZisOTIAylH8BdVou04A9JfuAVIArLskMzs9tmaI1sNyXbTwcA93/0DypanPvnz+4aMxOq/tV+LVp7aQN1P0PQpIanEsqse/HnsqQbTRy7Pura36DrSjBty682LsebFH8hB45sk9CVixIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bD8tec4A; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bD8tec4A"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4066BC4CEF0;
	Tue,  6 May 2025 17:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746551374;
	bh=FNA2gsRQTdJsloAcS3RRSgVH0l+51ZiDBDeK6njOiz8=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=bD8tec4A0etJw6u2v9BYQfdDu4z4+U8FKKfYI+sQQyoqCTwtGl5z91W4lkHQGojA5
	 VQI4JZTQyamjMzZyeRGfje0BkyBnHdLhEsf9xxIqSBBeUwFhd42sZLI/cENmB71L3q
	 zT7hBr7/SnEBJj8jcTU3BgOd/mzgBHI7JC3MrP0P0Sg5hWm9VrBH6AO9/l960amG2m
	 e/iGktH5Cki9ZlUUgqFkYlT9Upuq44FsjrYxP/WQMiQaFRbb/pd3cOTQ6zsOSC5Zol
	 SFrKnEDxjCKCs8oYAFHOWPOy/8m3VrdV5TYt4E92DHr8ymcbiwmLdoGIeroykSnuqr
	 9OX5kXOBB4GDA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C584C3ABBE;
	Tue,  6 May 2025 17:09:34 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Subject: [PATCH v2 0/2] phy: tegra: xusb: Default otg mode to peripheral
Date: Tue, 06 May 2025 12:09:16 -0500
Message-Id: <20250506-xusb-peripheral-v2-0-bfbe00671389@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADxCGmgC/3WNyw7CIBBFf6WZtWMKpSpd+R+mC0Aok/RBQElN0
 38Xu3d5bnLO3SDZSDZBV20QbaZEy1yAnyowXs2DRXoWBl7ztha1wPWdNIYiBW+jGtGIVrNLc3V
 No6FYIVpH61F89IU9pdcSP8dBZr/1fyszZCilYTehpXatuw+TovFslgn6fd+/RSnzeq4AAAA=
X-Change-ID: 20250404-xusb-peripheral-c45b1637f33b
To: JC Kuo <jckuo@nvidia.com>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Aaron Kling <webgeek1234@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746551373; l=1076;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=FNA2gsRQTdJsloAcS3RRSgVH0l+51ZiDBDeK6njOiz8=;
 b=+Y2xZC3OosSjaAuY4rTFVw/J7gz3zpQ3FqXfBcXxUM2W6VcJmlJ40WuayQMLyyTmMC4TMJ8RA
 SWaNIMRmfzmDzYzt0EQkphgtJmhgwPVpVdguGVVDKbzt3j7q+lCQC2r
X-Developer-Key: i=webgeek1234@gmail.com; a=ed25519;
 pk=TQwd6q26txw7bkK7B8qtI/kcAohZc7bHHGSD7domdrU=
X-Endpoint-Received: by B4 Relay for webgeek1234@gmail.com/20250217 with
 auth_id=342
X-Original-From: Aaron Kling <webgeek1234@gmail.com>
Reply-To: webgeek1234@gmail.com

Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
---
Changes in v2:
- Add new patch to document role-switch-default-mode in xusb padctl
- Simplify code change, per review
- Comment in code why device mode is default
- Link to v1: https://lore.kernel.org/r/20250404-xusb-peripheral-v1-1-99c184b9bf5f@gmail.com

---
Aaron Kling (2):
      dt-bindings: phy: tegra-xusb: Document role-switch-default-mode
      phy: tegra: xusb: Default otg mode to peripheral

 .../bindings/phy/nvidia,tegra124-xusb-padctl.yaml  | 33 ++++++++++++++++++++
 .../bindings/phy/nvidia,tegra186-xusb-padctl.yaml  | 27 ++++++++++++++++
 .../bindings/phy/nvidia,tegra194-xusb-padctl.yaml  | 36 ++++++++++++++++++++++
 .../bindings/phy/nvidia,tegra210-xusb-padctl.yaml  | 36 ++++++++++++++++++++++
 drivers/phy/tegra/xusb.c                           | 11 +++----
 5 files changed, 136 insertions(+), 7 deletions(-)
---
base-commit: 91e5bfe317d8f8471fbaa3e70cf66cae1314a516
change-id: 20250404-xusb-peripheral-c45b1637f33b

Best regards,
-- 
Aaron Kling <webgeek1234@gmail.com>


