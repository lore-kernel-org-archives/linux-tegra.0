Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3730C4D8CE;
	Sat, 18 Jul 2026 00:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784333828; cv=none; b=NKthh8Ux/+hv98I0cIK8PwbY7uWIjkFL3RKtHJfF57eaFrT4yu0Sci9Fam3kDSrQIlaS+XBAikaXojxi0xyOkMEHYFDQjbAOzg+RVtAa7BVqv+IuWRgYiudk++EJ7FQ+2VLLVtntEIOnlbzPyX+GLysax0e1QCO+sUs6sMBDE2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784333828; c=relaxed/simple;
	bh=idEUgIvEhKFyitcr4yu2xO7SOnzf9HxwpzJ6GhZjMT0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=VtLm4VSye9tC4qnEBSYnAtbf970KAJRgLtx+eRr72nJrRzMHDfeIJK9gNtQfpk/fMswQofApsVjqp7bcOuHdh5sAZrs8uAHs1fn8a2bITiHeF+xqXDPyK3/mjaJtRc0YbMJ/bj40k3AALdSHdWmlAvxot2CWInawkI6YSjKzBKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=duiXdGIA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="duiXdGIA"
Received: by smtp.kernel.org (Postfix) with ESMTPS id BD997C2BCB9;
	Sat, 18 Jul 2026 00:17:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784333827;
	bh=idEUgIvEhKFyitcr4yu2xO7SOnzf9HxwpzJ6GhZjMT0=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=duiXdGIA4oYx2tbTQAL7NjHMO6hV6zVIOJMM39h56sUSWsYhGlRD7xX+2UhkgjbTe
	 2hjZyFwrcNkmn2Y53X8xcc00TReIqu1mUCg243t0oQ+YzsDWfG1JJSWuYJrQoxRHuW
	 TO/qYrZpgRkyQz1uZkCx3q8sQZryvlbp0uMXr9kYtKfOmbl/Z5f7pKseAKer4oF6lF
	 Ny0Ec7QsSRSFTXqhRSoQZn2546ogtByJ9ByObIaaedinJAqZx6BX+3gEYeRsTvrWqk
	 6NeAKXx2pXgQ1+mvSKoViaGejZOm87mVVe0+VMLgvNEIRoydVWjjtdMtu0sL+UhiUi
	 Z3v7Zxu0HjpLw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FD8CC44520;
	Sat, 18 Jul 2026 00:17:07 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Subject: [PATCH 0/2] soc/tegra: pmc: Add Tegra210B01 support
Date: Fri, 17 Jul 2026 19:17:01 -0500
Message-Id: <20260717-t210b01-pmc-v1-0-bf776be8b3a7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDc0Nj3RIjQ4MkA0PdgtxkXcNE4zSLJEsDCwMTEyWgjoKi1LTMCrBp0bG
 1tQA0+aqjXQAAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784333826; l=674;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=idEUgIvEhKFyitcr4yu2xO7SOnzf9HxwpzJ6GhZjMT0=;
 b=IZk2RGK2ULeVK0wkVXw9gWWJ1MJImxmvzIUBjTKGOFhUOcdTKJoEalHZgoWb5sWKZF85dpRC6
 2RlNBAouNlwBR5r0vO8hMJoOF7Ilbb+64ePl3U6pmrYv12CxtyaJgcu
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
Aaron Kling (1):
      dt-bindings: soc: tegra: pmc: Document Tegra210B01

Azkali Manad (1):
      soc/tegra: pmc: Add Tegra210B01 support

 .../bindings/soc/tegra/nvidia,tegra20-pmc.yaml     |   5 +-
 drivers/soc/tegra/pmc.c                            | 160 +++++++++++++++++++++
 2 files changed, 164 insertions(+), 1 deletion(-)
---
base-commit: 1a1757b76427f6201bfe0bf1bea9f7574f332a93
change-id: 20260713-t210b01-pmc-1a3f8b908044

Best regards,
-- 
Aaron Kling <webgeek1234@gmail.com>


