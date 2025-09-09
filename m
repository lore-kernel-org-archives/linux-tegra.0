Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9272632039E
	for <linux-tegra@vger.kernel.org>; Tue,  9 Sep 2025 11:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757417351; cv=none; b=J8tW5hnFhnNMRM/0wLm6PqZZzW0Q+iP3bzito6b6/HhU8e6kl+weazYeWduY71kH7ElGuAxeEk0vNSfWjARj+Py7v3fDJBZ4oz0kFcqAPUL2Y09lAJOBEeklLOHVJTPD6SkX6urKDXhb/3cqsEY/ZmbeH4urkeTbjD6mYTtZ3j8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757417351; c=relaxed/simple;
	bh=3CoE1GJH0VwHBAmjRypgbLmKrahNnnzJwlvIYSMZLLs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WdVyAIUSatvNMPBe3nuY3fMeWzPJgd7plgF4+hbk68vLou4LDSenVdUvAp6no/BL+qn19skkSKcd8Do9zZSsvd3HUZ30uEnnuhwG0FjfJZdrtCVk3pPCS/QQVQK8Koeg47izzlqrqQI7j5qAekm/2H8W5i8Qf2Cdjha0Hafk9oM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ajjgklbf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ajjgklbf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3FFCC4CEF5;
	Tue,  9 Sep 2025 11:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757417351;
	bh=3CoE1GJH0VwHBAmjRypgbLmKrahNnnzJwlvIYSMZLLs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ajjgklbfyqCxUzpEeMSG0OaFQCdOVcvb49CkLyqaLVYji2rEl4JzOUQ4CW2uLNZra
	 wF/BKTtmfhiDAB0sGPhPStlynah5ndKOA+oB3fJmBX+mhlpf8iIU4pP/2ONTqPId7o
	 F405ewBTzvtjZTvJok83jCSbi5dNxw3iqNi7uKMFIYceFP8rBR3uB/w3T0H7dxgxBh
	 PsXKcL3iyusiJWfC4btMx3BuX9/N1/d+FI1vTmrjnaBiBa59/AzFfv35AAWqU5RhgG
	 L6Hiiu03iOlzsfNLgH8IxtM9A0CGHi0N1gwxWzM/K1Z+1Bh5ruv4TckUTdw/0z4lhs
	 ME0WDyso4f/Iw==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 09 Sep 2025 13:27:48 +0200
Subject: [PATCH v3 29/39] drm/tegra: Switch to
 drm_atomic_get_new_crtc_state()
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250909-drm-no-more-existing-state-v3-29-1c7a7d960c33@kernel.org>
References: <20250909-drm-no-more-existing-state-v3-0-1c7a7d960c33@kernel.org>
In-Reply-To: <20250909-drm-no-more-existing-state-v3-0-1c7a7d960c33@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Mikko Perttunen <mperttunen@nvidia.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1494; i=mripard@kernel.org;
 h=from:subject:message-id; bh=3CoE1GJH0VwHBAmjRypgbLmKrahNnnzJwlvIYSMZLLs=;
 b=kA0DAAkTJ1/OGaI9vnYByyZiAGjADy7I6+diAXHsN28gtnB0wp8P/wzfOhucQkVWSr4aZLdaa
 4iVBAATCQAdFiEE5BxWy6eHo3pAP6n4J1/OGaI9vnYFAmjADy4ACgkQJ1/OGaI9vnaT2AGAn2iK
 GpMzgmcul2IAkBLOSjdAm9QnVYtVwICcsUDtM74iffNwuHghCahtqFDZxU6VAX9kkPhKszWCZxs
 oSR1riIezhrgU3fvgOjUIIFyq9ouHOVDNYqRloqFn7yy+uWxENTc=
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

The tegra atomic_check implementation uses the deprecated
drm_atomic_get_existing_crtc_state() helper.

This hook is called as part of the global atomic_check, thus before the
states are swapped. The existing state thus points to the new state, and
we can use drm_atomic_get_new_crtc_state() instead.

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
To: Thierry Reding <thierry.reding@gmail.com>
To: Mikko Perttunen <mperttunen@nvidia.com>
To: Jonathan Hunter <jonathanh@nvidia.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-tegra@vger.kernel.org
---
 drivers/gpu/drm/tegra/dc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index 59d5c1ba145a82f62c1835da574867084da98106..0f80da3544c9b3a239c43740c05f007711bc728b 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -1031,11 +1031,11 @@ static int tegra_cursor_atomic_async_check(struct drm_plane *plane, struct drm_a
 	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state, plane);
 	struct drm_crtc_state *crtc_state;
 	int min_scale, max_scale;
 	int err;
 
-	crtc_state = drm_atomic_get_existing_crtc_state(state, new_state->crtc);
+	crtc_state = drm_atomic_get_new_crtc_state(state, new_state->crtc);
 	if (WARN_ON(!crtc_state))
 		return -EINVAL;
 
 	if (!crtc_state->active)
 		return -EINVAL;

-- 
2.50.1

