Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 214E04A2A75;
	Sun, 18 Oct 2026 22:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792361029; cv=none; b=Me6WDoO3e0epfXm7KA7qciy8zfW2o9vY3mGsZxUaE+pb6RHlqUNWi2eSvRH4iAF4FpLshcI/d8O+RahZ/KFi9AoD92FbayWTvDKiFZtt0UxcuLXsoHV83EXiEA4lk9Moh/1As/T3h/gqHTYrnP0srHoggUngqe1VFfP0rqr2jnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792361029; c=relaxed/simple;
	bh=/ZkFDHhCvy2oQzPTFjq1CB7IWK2vavXQ+ak/ihrM1Dw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EnsBmvYmhTs1YqfMgIV1nwVaI3kAq71s2oPLAwBCYGwaAGTWjC9g3YUlnWg6m0w8DS+Y5jxDIHVUG1oYIqFQIRggbjQVDsjmf++PCll6oUzVpjn5QOgplLdWk3stxkU8bNS3gk1Jto7DCg0AavUvpaB5y+icmmdnMKNQUr3PgGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CH9OL99F; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CH9OL99F"
Received: by smtp.kernel.org (Postfix) with ESMTPS id C9679C2BCF7;
	Sun, 18 Oct 2026 22:03:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792361028;
	bh=/ZkFDHhCvy2oQzPTFjq1CB7IWK2vavXQ+ak/ihrM1Dw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=CH9OL99FrOROdiIShLDRqP2PSw3RTDAwWV6++kKaz5uAZbDC0a46h3DVLZBf3GjpN
	 MlgX7fBJiEfNbvNAvK0qhaUBaKkKF35J1l2o+uzEfKocz/Vtd7dCa7+LpwPPAJogdl
	 08mmJndEXwcFcGHLMKsYaziQgO4BS5aZKDB57YeB6b4uEgSjhokIfCbPjpItiz/Qc1
	 hH3Wc/0AyaXC2I7XLXENmHI2E3tskKZNohI+s2MVt6vMfW3XtS+PpTrf0GQCqHghpi
	 7pJJmw1/e0vCaZ7H/B16VYXg5sLEnmcXh6XWM21uqNNvsWccuhYS7llPf1pTHwu7oL
	 wAQMRooehW3dA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACF79CCF2C4;
	Sun, 18 Oct 2026 22:03:48 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Date: Sun, 18 Oct 2026 17:03:47 -0500
Subject: [PATCH v2 2/2] drm/tegra: Support YVU420
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261018-tegra-drm-yvu420-v2-2-512889103ab4@gmail.com>
References: <20261018-tegra-drm-yvu420-v2-0-512889103ab4@gmail.com>
In-Reply-To: <20261018-tegra-drm-yvu420-v2-0-512889103ab4@gmail.com>
To: Thierry Reding <thierry.reding@kernel.org>, 
 Mikko Perttunen <mperttunen@nvidia.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Jonathan Hunter <jonathanh@nvidia.com>
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Aaron Kling <webgeek1234@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792361027; l=2166;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=zCXQRgMgGrE/4Z64BHhTFEWRbQko1sGdhPQ7CQ9cxNY=;
 b=9/d6cCKyKcBy1HzraYGCfzSBU+a/AboZeVFNdP9190xrnLIVlklda/Eaif4IjIie/Ny8L8erO
 RKLHg4mM3HqBR6Cxa420WDz6/i6si7J1Mkzh271+J3SHVegzL+NX6FS
X-Developer-Key: i=webgeek1234@gmail.com; a=ed25519;
 pk=TQwd6q26txw7bkK7B8qtI/kcAohZc7bHHGSD7domdrU=
X-Endpoint-Received: by B4 Relay for webgeek1234@gmail.com/20250217 with
 auth_id=342
X-Original-From: Aaron Kling <webgeek1234@gmail.com>
Reply-To: webgeek1234@gmail.com

From: Aaron Kling <webgeek1234@gmail.com>

This format is used by AOSP for video playback among other things.

Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
---
 drivers/gpu/drm/tegra/dc.c    | 3 +++
 drivers/gpu/drm/tegra/hub.c   | 1 +
 drivers/gpu/drm/tegra/plane.c | 8 ++++++++
 3 files changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index 39c2e920d76a6..61e155ecbfcb7 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -1282,6 +1282,7 @@ static const u32 tegra20_overlay_formats[] = {
 	DRM_FORMAT_YUYV,
 	DRM_FORMAT_YUV420,
 	DRM_FORMAT_YUV422,
+	DRM_FORMAT_YVU420,
 };
 
 static const u32 tegra114_overlay_formats[] = {
@@ -1309,6 +1310,7 @@ static const u32 tegra114_overlay_formats[] = {
 	DRM_FORMAT_YUYV,
 	DRM_FORMAT_YUV420,
 	DRM_FORMAT_YUV422,
+	DRM_FORMAT_YVU420,
 	/* semi-planar formats */
 	DRM_FORMAT_NV12,
 	DRM_FORMAT_NV21,
@@ -1349,6 +1351,7 @@ static const u32 tegra124_overlay_formats[] = {
 	DRM_FORMAT_YUV420, /* YU12 */
 	DRM_FORMAT_YUV422, /* YU16 */
 	DRM_FORMAT_YUV444, /* YU24 */
+	DRM_FORMAT_YVU420, /* YV12 */
 	/* semi-planar formats */
 	DRM_FORMAT_NV12,
 	DRM_FORMAT_NV21,
diff --git a/drivers/gpu/drm/tegra/hub.c b/drivers/gpu/drm/tegra/hub.c
index 6427155ac4fdf..f176badfd922b 100644
--- a/drivers/gpu/drm/tegra/hub.c
+++ b/drivers/gpu/drm/tegra/hub.c
@@ -51,6 +51,7 @@ static const u32 tegra_shared_plane_formats[] = {
 	DRM_FORMAT_YUYV,
 	DRM_FORMAT_YUV420,
 	DRM_FORMAT_YUV422,
+	DRM_FORMAT_YVU420,
 };
 
 static const u64 tegra_shared_plane_modifiers[] = {
diff --git a/drivers/gpu/drm/tegra/plane.c b/drivers/gpu/drm/tegra/plane.c
index 757bc552809fe..0771a6cce8984 100644
--- a/drivers/gpu/drm/tegra/plane.c
+++ b/drivers/gpu/drm/tegra/plane.c
@@ -433,6 +433,14 @@ int tegra_plane_format(u32 fourcc, u32 *format, u32 *swap, bool *swap_uv)
 		*format = WIN_COLOR_DEPTH_YCbCr420P;
 		break;
 
+	case DRM_FORMAT_YVU420:
+		if (!swap_uv)
+			return -EINVAL;
+
+		*format = WIN_COLOR_DEPTH_YCbCr420P;
+		*swap_uv = true;
+		break;
+
 	case DRM_FORMAT_YUV422:
 		*format = WIN_COLOR_DEPTH_YCbCr422P;
 		break;

-- 
2.54.0


