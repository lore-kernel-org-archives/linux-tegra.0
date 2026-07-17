Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A95E3A83A9;
	Fri, 17 Jul 2026 23:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784330388; cv=none; b=JynoxqJ3jLGExxYLGk29Zk8hQ29wtptGxnlOmfrXPMrVtvyET8K4T9PHitamsg6dZKz7/+6/TBWR2uIRGo3zq8t8UvSfkQeHsuqrnncIT92K6eo65yjV4KSj8JakuvsMTAyZdFXIwSLLJkZWbIcwO6Q5U3CzWu+jnLJJKkEx8aQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784330388; c=relaxed/simple;
	bh=FbqPy5P9Xc3Z4JsoqF4B+01S7cCgssaMQOs05ToYWP0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=WIsJG8FnB5iAVzaMRAOS8VtPqUuL27XMqnSKzty+j2BuNmyJTXwNscWQ682+afQfxcKanrLmGe9kVBI3s/pH/d5Em4oECMbiDqYvqBsL9+pfAv8omydRzgJ7+8m6NGpjwUDJfM8xrFh7sq4bt9bt1lU9olMzRGG9gtnLuzLucMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VpHFW3gM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VpHFW3gM"
Received: by smtp.kernel.org (Postfix) with ESMTPS id B9E38C2BCB8;
	Fri, 17 Jul 2026 23:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784330387;
	bh=FbqPy5P9Xc3Z4JsoqF4B+01S7cCgssaMQOs05ToYWP0=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=VpHFW3gMS1ShJnv5gSlYElPqJSFqY7Yl7P5zfR4xDLORyOISJxov8FHLBlZxaC+nL
	 Itof1JyKbxgkpAk6LqwrQClrxVX77W45H3BDHVlbhd4r/ZfVQeuM0X2lgUCA2vWyNu
	 o0Da5qcBGXb9cufLvMh3fqI/rKDVacXo/WGd7ytMiyZhALe3N5dpCICYpEq+YzMqbw
	 eZCcHfO8ImfWsNErPhxu/vLJdxIqkPr+QheMCR+NU503TL2KSFcGBopKLsj621/TDy
	 0a/rCHa+PGZNzOxjkr+FTtBxJt/AE8bkTHMEUMjAxdUcr54kxA63hPG0P3zWrcj2QZ
	 olA12JXnn5Uvw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FE05C44515;
	Fri, 17 Jul 2026 23:19:47 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Subject: [PATCH 0/2] soc/tegra: fuse: Support Tegra210B01 Speedos
Date: Fri, 17 Jul 2026 18:19:39 -0500
Message-Id: <20260717-t210b01-speedo-v1-0-f04a8bd4d997@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MTQqAIBBA4avErBNGjYyuEi38mWo2GhoRhHdPW
 n6L914olJkKzN0LmW4unGKD7Dvwh407CQ7NoFCNaOQgLiXRoRTlJApJoNkmH7TT1mpo0Zlp4+c
 fLmutH5NZuWZgAAAA
X-Change-ID: 20260714-t210b01-speedo-07f8cd3b3aa3
To: Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Aaron Kling <webgeek1234@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784330387; l=761;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=FbqPy5P9Xc3Z4JsoqF4B+01S7cCgssaMQOs05ToYWP0=;
 b=nFmANYjb4rlcXhedBQuEbeQRxCa1g7KKrvLXdy5WGIVPuNnFIfcj7zHQIPOQqwnOJAH6vbTND
 GK4pRj28ClUCJVb+2h1xY9ixtzBTQJQrfRqVtUznHW1wUCnWif6Rg61
X-Developer-Key: i=webgeek1234@gmail.com; a=ed25519;
 pk=TQwd6q26txw7bkK7B8qtI/kcAohZc7bHHGSD7domdrU=
X-Endpoint-Received: by B4 Relay for webgeek1234@gmail.com/20250217 with
 auth_id=342
X-Original-From: Aaron Kling <webgeek1234@gmail.com>
Reply-To: webgeek1234@gmail.com

This series adds support for the b01 fuse revision, then adds speedo
support for known Tegra210B01 sku's.

Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
---
Aaron Kling (2):
      soc/tegra: fuse: Support revision B01
      soc/tegra: fuse: speedo-tegra210: Support revision B01

 drivers/soc/tegra/fuse/fuse-tegra.c      |  1 +
 drivers/soc/tegra/fuse/speedo-tegra210.c | 22 ++++++++++++++--
 drivers/soc/tegra/fuse/tegra-apbmisc.c   | 45 ++++++++++++++++++--------------
 include/soc/tegra/fuse.h                 |  1 +
 4 files changed, 47 insertions(+), 22 deletions(-)
---
base-commit: 1a1757b76427f6201bfe0bf1bea9f7574f332a93
change-id: 20260714-t210b01-speedo-07f8cd3b3aa3

Best regards,
-- 
Aaron Kling <webgeek1234@gmail.com>


