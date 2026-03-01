Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B40B929D270;
	Sun,  1 Mar 2026 01:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772329325; cv=none; b=uYfW3jlw7F+9ElSoJ4kNuL5a4ahMcw4M4vVVsjl9ahQ3kyLRavfe+4aoeI392M/RlokLG0KF/M6huX49TLijcAwxnsi2SqVP/Sx7FZ6O6JVgMaTcqh7/SXJEFDb/2UXkMTvJH2hMjsZWj0Hfc00bu+zV2IBuPVVgmVWor4u6PQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772329325; c=relaxed/simple;
	bh=VxyYq8Jx4qYIfeFHDSxOCaGSvhwvKZVg65eLIr57h2c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jNJgJ8EWUj1liqT/WMUU9p8L5rvpipNH9UeejHBwrLm3+Hz8QmicYqmNVrWGCR4r8PbMmE9X6+JlAF4NlJgJZgt8np9pasqPmEuxn6STYKtuWd3foPBP16PSVlXJq1TYK/ajUlJYQhJNYjjeK/O0qLAjXj3WqMfltr0nV38lWt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m45p91ky; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m45p91ky"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D7EAC19421;
	Sun,  1 Mar 2026 01:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772329325;
	bh=VxyYq8Jx4qYIfeFHDSxOCaGSvhwvKZVg65eLIr57h2c=;
	h=From:To:Cc:Subject:Date:From;
	b=m45p91ky9lnmH5LWnr1dbb8xlqiQXKUNRoW58ZktYYAtCwIqdRt+3BhehxvjxGQQI
	 +LdAy8Aya3pJMk17zy6CKD4y46e7vkrscAJO7KGT++sCCyisDwEUIojnbeiNrhhaCe
	 Spx8zxZLjrcdwD6IyJlMp3hjMPYn5N0I/iRpgTNE14myP5E6N01JAJ1EIyndC6OsXe
	 1JQoRhTYPhk+SkWlP3AxCTIp10vxkGIN9PM0qCYcvbT2St4UYTZKUP3r8uSTA9MYOQ
	 881c2E+TtHTei/TpB/gHR+KsLZqXNBPlrGzrmVWRK6IALyoNDnE9zV9IuStzKn+XEZ
	 bdexNFm8BlYBQ==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	johan@kernel.org
Cc: Thierry Reding <treding@nvidia.com>,
	dri-devel@lists.freedesktop.org,
	linux-tegra@vger.kernel.org
Subject: FAILED: Patch "drm/tegra: dsi: fix device leak on probe" failed to apply to 6.1-stable tree
Date: Sat, 28 Feb 2026 20:42:03 -0500
Message-ID: <20260301014203.1703841-1-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-stable: review
Content-Transfer-Encoding: 8bit

The patch below does not apply to the 6.1-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From bfef062695570842cf96358f2f46f4c6642c6689 Mon Sep 17 00:00:00 2001
From: Johan Hovold <johan@kernel.org>
Date: Fri, 21 Nov 2025 17:42:01 +0100
Subject: [PATCH] drm/tegra: dsi: fix device leak on probe

Make sure to drop the reference taken when looking up the companion
(ganged) device and its driver data during probe().

Note that holding a reference to a device does not prevent its driver
data from going away so there is no point in keeping the reference.

Fixes: e94236cde4d5 ("drm/tegra: dsi: Add ganged mode support")
Fixes: 221e3638feb8 ("drm/tegra: Fix reference leak in tegra_dsi_ganged_probe")
Cc: stable@vger.kernel.org	# 3.19: 221e3638feb8
Cc: Thierry Reding <treding@nvidia.com>
Signed-off-by: Johan Hovold <johan@kernel.org>
Signed-off-by: Thierry Reding <treding@nvidia.com>
Link: https://patch.msgid.link/20251121164201.13188-1-johan@kernel.org
---
 drivers/gpu/drm/tegra/dsi.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dsi.c b/drivers/gpu/drm/tegra/dsi.c
index 175f5f9937b01..8ee96b59fdbc8 100644
--- a/drivers/gpu/drm/tegra/dsi.c
+++ b/drivers/gpu/drm/tegra/dsi.c
@@ -1542,11 +1542,9 @@ static int tegra_dsi_ganged_probe(struct tegra_dsi *dsi)
 			return -EPROBE_DEFER;
 
 		dsi->slave = platform_get_drvdata(gangster);
-
-		if (!dsi->slave) {
-			put_device(&gangster->dev);
+		put_device(&gangster->dev);
+		if (!dsi->slave)
 			return -EPROBE_DEFER;
-		}
 
 		dsi->slave->master = dsi;
 	}
-- 
2.51.0




