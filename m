Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794825176;
	b=jrITQQHfvYhkCPN5fbNAVgg9gqg88CW5oTjhkKpoM/qq+DuloT4UjtirR/uMD3SQknfd
	 zcqjrRDUAsf/yu04H0QaG2HooNsgKqBgLwPeChIbMY6t6kxcKFl8zaX0b8qgNN8pmA/Cm
	 b0DPW2A/ZSDWe7QTqIEOqVPBqPr+5pcfEgL278ClpWFZ37+7JOj00yHmQ4iSz3GARL4zP
	 XBPgX43ZN467bOuTkiEHOcZVEejRYAHlyFUjNDOQi5IOntzagBs1eE9sZDv48Rs/3ekHO
	 E6kun3LZfPy3AvAMHVwr3MlP9siHoTCn7HOJxsOLEcG19uN7k8wek2vh7tdSS6o8kxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794825176;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=XGlVbRtaTnXWzANGObeu2EjzWI6NpTfSibHuyiKPESw=;
	b=qb6SbUgnykOP8fKuZZnd9ZxgqN0IZ7eKt7un8mLn7OtWXrS7Oq/wWWlHNTTw7Va5QdPD
	 FEO5kruEocy7Z7Go2NRnUjRHI9tGSc8Efe1ogdElqAYG/aO/e7TANLhSq1PvE1WHFIjic
	 3Dt3GlLFrdTXO7MmVt0HQ4JyIGtqU7rfbql23WFvhM8970toi/84KtRAosQbSgwud5sTI
	 bTq2Zb/4W14Bsed7z0e0BNt+fB4Z+rFYXUF60tdNH3RnBr59yFlVN9QfNr+2SXDtofJ8b
	 STduSm0zZ0RjVtDvJ4JRfQaCsnN8kbIqrxueUe2GfzvoU1csPBhQJjfG8tKSQ2zarrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KqNGgXZJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C551606A333
	for <linux-tegra@vger.kernel.org>; Mon, 16 Nov 2026 10:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KqNGgXZJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D9C51F000CC;
	Mon, 16 Nov 2026 10:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794825176;
	bh=XGlVbRtaTnXWzANGObeu2EjzWI6NpTfSibHuyiKPESw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=KqNGgXZJhi0K1mYvjwRBggOOvEKs7GyoMP4Nnobquz/9GSw0JsiKHZviduywU9dIX
	 NXYVftH3ePqB6kautcPwico7eI5CApTFXrxsAxT9zIR0777V+dgrO0HNxHrgPmmSVY
	 +zjQE+v7dBQahx34Q0iLkgwF1kH50Te+igPC0cf+9j30D+s+4KhTKF9e2ChOjjpjfF
	 Y53vyXPGRcmeA6K2s6hJ8sxeQAlekhIVR/F0B4ouJUXCbwGN7C+CGdVSrnkAo9xUv7
	 0qWyX/koKbkLClO1EZvWjrXKg76gFVVkunEPrIN1nemdIBx/9ziBfeMGMxars5k43x
	 WhJdGxBm+R13A==
From: Maxime Ripard <mripard@kernel.org>
Date: Mon, 16 Nov 2026 11:30:53 +0100
Subject: [PATCH v2 37/64] drm/tegra: Switch to
 drm_mode_config_create_initial_state
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-drm-no-more-config-reset-v2-37-0bb471f4d1e0@kernel.org>
References: <20261116-drm-no-more-config-reset-v2-0-0bb471f4d1e0@kernel.org>
In-Reply-To: <20261116-drm-no-more-config-reset-v2-0-0bb471f4d1e0@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Mikko Perttunen <mperttunen@nvidia.com>, 
 Thierry Reding <thierry.reding@kernel.org>, linux-tegra@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1481; i=mripard@kernel.org;
 h=from:subject:message-id; bh=9KfsryBfQaevH9S5YYvx2NCrkjUqvlYAFlaU0VCpQaw=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFm/bgcUsKzl0eZTc3m26rn391QxIWOtJ0xz89+dEeti3
 JxuL/G0YyoLgzAng6yYIssTmbDTy9sXVznYr/wBM4eVCWQIAxenAExkgRdjvedqkynr99WVVavO
 0Lou/qrEZPnnoFWZ8z/08Pk93dpq5N4+NV1irrF7+Tnme5pdJdcXMNZ78FYotIZGih725X52YOY
 6p73/pldksd5t45Zv8tlana4WU6ec9bTXMom5sM5b593pAgA=
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

drm_mode_config_reset() has a dual role: it creates the initial KMS
state at probe time, and resets hardware and software state during
suspend/resume cycles.

Since the two roles need different behaviors (notably for objects like
drm_private_obj that must persist across suspend/resume),
drm_mode_config_create_initial_state() was introduced to handle only
the initial state creation at probe time.

Switch to drm_mode_config_create_initial_state().

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
Cc: Jonathan Hunter <jonathanh@nvidia.com>
Cc: Mikko Perttunen <mperttunen@nvidia.com>
Cc: Thierry Reding <thierry.reding@kernel.org>
Cc: linux-tegra@vger.kernel.org
---
 drivers/gpu/drm/tegra/drm.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index 324480c87fb1..9fdb9e70eb0a 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -1243,11 +1243,13 @@ static int host1x_drm_probe(struct host1x_device *dev)
 
 	err = drm_vblank_init(drm, drm->mode_config.num_crtc);
 	if (err < 0)
 		goto hub;
 
-	drm_mode_config_reset(drm);
+	err = drm_mode_config_create_initial_state(drm);
+	if (err)
+		goto hub;
 
 	/*
 	 * Only take over from a potential firmware framebuffer if any CRTCs
 	 * have been registered. This must not be a fatal error because there
 	 * are other accelerators that are exposed via this driver.

-- 
2.56.1

