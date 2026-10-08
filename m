Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBD59357D08;
	Thu,  8 Oct 2026 20:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791493051; cv=none; b=O5GaRZB06CqE0K4O+QDWiQLQhOP+14a5AtqACN74t1+41F+bkiDTakh/xYHt1ROb3OPi+MPlskpGzL4gsR6tN0mri5iX1YBKZLcKETK9jQcn2RNkGtqvV87TK4h0l35VRgP6/SpPdNwqjphv5MbpMOcPDFij3cNSAEVhdR44T+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791493051; c=relaxed/simple;
	bh=X2R3fkt9RuPxE9JCSn7LtflkpjPza9Wh3xPjFZ5Z2W4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=lvOEIFz9+/dCabSK0Gzy/lNxh5hEz47xcZPLBC0/CFJGYHLZ0kWYB6oRCRhcVcvPeNEJD3GrMgq7S2XYUra8IBFa4z5yRnaV1IH/ok52qhZa9v9oPX+2Ws/dn7rk6NUQb/+/PlqiZDH7eM2FLfQrKQN4ew+rCtDUzINKW0ZpQLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iIGp92zg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iIGp92zg"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7DCC1C2BCC7;
	Thu,  8 Oct 2026 20:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791493051;
	bh=X2R3fkt9RuPxE9JCSn7LtflkpjPza9Wh3xPjFZ5Z2W4=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=iIGp92zgaRVTaTqNzWJTdojlAmLULaxPnS1Yutofetv0AlrRXozkmcQFjBW+09ipv
	 VC879GJHnjGlGeaNv8XqlR5tKKorxsPhHglDPA66DTDhJ61b5Ko7BZ8y69voG3NSBb
	 IL9SCgEsfBPHcwwWmwHdkpmF1hxn3iIpEhMATgpDpSkudljsPOCS9wSSE79e4bg3G2
	 LCuOrNpcM4i25YELmlNCEkscErQyarJ1Tlswh91VF0laBUQ/QjnbN8U2Glu567osJo
	 ysLNu1UoHlFzX6pG97cb3lHbeKe7bp9boyOwCNhonIXLABAhkosMWXJmgN5269b0IJ
	 i2xREaxOJwLkw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60740CA6015;
	Thu,  8 Oct 2026 20:57:31 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Subject: [PATCH 0/2] drm/tegra: Support YVU420
Date: Thu, 08 Oct 2026 15:57:20 -0500
Message-Id: <20261008-tegra-drm-yvu420-v1-0-dc1c443c00f3@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDAwML3ZLU9KJE3ZSiXN3KslITIwNdw5SkJHNDE4NUU5NEJaC2gqLUtMw
 KsJHRsbW1AMB0Ij5iAAAA
X-Change-ID: 20261008-tegra-drm-yvu420-1dbb7140e54a
To: Thierry Reding <thierry.reding@kernel.org>, 
 Mikko Perttunen <mperttunen@nvidia.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Jonathan Hunter <jonathanh@nvidia.com>
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Aaron Kling <webgeek1234@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791493050; l=1112;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=X2R3fkt9RuPxE9JCSn7LtflkpjPza9Wh3xPjFZ5Z2W4=;
 b=A9F57GabAMH26MMYQWQKBrdO32IjHhYRWZ1SjhAhc5gvhOt812wLq3GDzyrlKIm8xNjEb3+LB
 XUrmuNmU+ByAd80p3rZ0BcOTISlPIeyAFsS6ijdxqrp3FR20C11NDPd
X-Developer-Key: i=webgeek1234@gmail.com; a=ed25519;
 pk=TQwd6q26txw7bkK7B8qtI/kcAohZc7bHHGSD7domdrU=
X-Endpoint-Received: by B4 Relay for webgeek1234@gmail.com/20250217 with
 auth_id=342
X-Original-From: Aaron Kling <webgeek1234@gmail.com>
Reply-To: webgeek1234@gmail.com

This is not directly supported by the display controller hardware.
However, this can be handled efficiently by just passing the chroma
planes to the hardware backwards and reporting it as yuv420.

The format is required by AOSP for software decoded video playback among
other things. An attempt was made to handle this in gralloc by swapping
the chroma planes there, but it wasn't working. This kernel
implementation is working and is more generic anyways. This has been
verified on a SHIELD TV 2019 Pro for the tegradc path and a Jetson TX2
NX for the nvdisplay path.

---
Aaron Kling (2):
      drm/tegra: Support swapping chroma planes
      drm/tegra: Support YVU420

 drivers/gpu/drm/tegra/dc.c    | 19 ++++++++++++++-----
 drivers/gpu/drm/tegra/hub.c   | 15 ++++++++++-----
 drivers/gpu/drm/tegra/plane.c | 12 +++++++++++-
 drivers/gpu/drm/tegra/plane.h |  3 ++-
 4 files changed, 37 insertions(+), 12 deletions(-)
---
base-commit: aac26bee2287c88af5be5a5ff96d783b19a28790
change-id: 20261008-tegra-drm-yvu420-1dbb7140e54a

Best regards,
-- 
Aaron Kling <webgeek1234@gmail.com>


