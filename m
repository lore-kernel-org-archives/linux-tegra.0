Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F7FC314D0A
	for <linux-tegra@vger.kernel.org>; Mon, 19 Jan 2026 12:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768827048; cv=none; b=BnOiSmqgiWJEJnaKfc8mmOF6LkA5ncinBNkiP6CE47XYMw1xLHd2SZqHsuG7oJ1kn269vbiDkeagSLLTbg7W2+lMxvBO2/aUYlKFU3hQWo0m71BZ3aDEq+b83nAj/DTo9FeDx8rf4BvRX59mkz7ZReK4gpfJjC7z/syZgl8yeKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768827048; c=relaxed/simple;
	bh=mFDSWjULiqNb4gYo6mmddAEfUmh3dS6FOXzRW85kLjw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tamr9ey6cK1qghYTedfp+16oaezmQY+ywENwx9SGfAKm0iMXKPjCht0mPwHptQSYCOH1jNyvlYQJdrVKT2joOpe/FOqUz7ZAjJDyDD5eLSE/LdvoJx+w0YCWovs5B+xIylStuZMWAckpJcOq+FVLIX78md6juWntWV48PhxrSt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=idC4crhL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="idC4crhL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D700AC19423;
	Mon, 19 Jan 2026 12:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768827048;
	bh=mFDSWjULiqNb4gYo6mmddAEfUmh3dS6FOXzRW85kLjw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=idC4crhLYbxoscVFDse2tbGOEbsjK3e9NFbSRSsalnTZAsewRqY8XTTj6+qOeYnKq
	 CRg8OEJOg5orxYcBKRUnbACJEtcSun4JPowYvtsvKmsE1jtfrFK0EXGdwjMy25UftI
	 ASDKkDkGzvCasLT/71PluJz5tg3ee9dg/U3Wxvhe9rVO+Fvxuk4E2JPXfG4lylLJDE
	 kxR2lVsQSlIU3m3c3wuEB7/LEZut+D1juqebOD2+IOzJII/WjZW5FaH8lDZkHNudUS
	 rGoYZuHtz3qj6NcgwSfXU/9Q6kJnjxVg85+kLQE9Hsoo6oNZVNr7kIUbZOaITUCeWQ
	 Mu0yFA2UTkcWg==
From: Maxime Ripard <mripard@kernel.org>
Date: Mon, 19 Jan 2026 13:50:09 +0100
Subject: [PATCH v3 13/15] drm/tegra: Switch private_obj initialization to
 atomic_create_state
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260119-drm-private-obj-reset-v3-13-b931abe3a5e3@redhat.com>
References: <20260119-drm-private-obj-reset-v3-0-b931abe3a5e3@redhat.com>
In-Reply-To: <20260119-drm-private-obj-reset-v3-0-b931abe3a5e3@redhat.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Mikko Perttunen <mperttunen@nvidia.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2438; i=mripard@redhat.com;
 h=from:subject:message-id; bh=mFDSWjULiqNb4gYo6mmddAEfUmh3dS6FOXzRW85kLjw=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDJl5GvVMx0X6r8bfz5ldbM4SqNLVym3Xwvhi/zfuQ0VJ6
 0SYe7Z2TGVhEOZkkBVTZHkiE3Z6efviKgf7lT9g5rAygQxh4OIUgIkw7WJs2Ln4nJiyj4TJZJcF
 8Xo3DnsefZ0UkP/lr2Ubt9zEfBvFQJX+Dysv8LuoC3AkP05dePEkY8NC4zvf7y1UUZtsPuWLt9b
 HRuvq8085b4RHhnmJikw2rY1cf90k3Pfvl7jwgq+Xle4tSAAA
X-Developer-Key: i=mripard@redhat.com; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

The tegra driver relies on a drm_private_obj, that is initialized by
allocating and initializing a state, and then passing it to
drm_private_obj_init.

Since we're gradually moving away from that pattern to the more
established one relying on a atomic_create_state implementation, let's
migrate this instance to the new pattern.

Signed-off-by: Maxime Ripard <mripard@kernel.org>

---

Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Mikko Perttunen <mperttunen@nvidia.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-tegra@vger.kernel.org
---
 drivers/gpu/drm/tegra/hub.c | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/tegra/hub.c b/drivers/gpu/drm/tegra/hub.c
index c924ffba409426cdc8719b208c74908d0e9fc544..e8cc4382532fffaea99020755ad78d3252613c26 100644
--- a/drivers/gpu/drm/tegra/hub.c
+++ b/drivers/gpu/drm/tegra/hub.c
@@ -823,11 +823,26 @@ static void tegra_display_hub_destroy_state(struct drm_private_obj *obj,
 		to_tegra_display_hub_state(state);
 
 	kfree(hub_state);
 }
 
+static struct drm_private_state *
+tegra_display_hub_create_state(struct drm_private_obj *obj)
+{
+	struct tegra_display_hub_state *hub_state;
+
+	hub_state = kzalloc(sizeof(*hub_state), GFP_KERNEL);
+	if (!hub_state)
+		return ERR_PTR(-ENOMEM);
+
+	__drm_atomic_helper_private_obj_create_state(obj, &hub_state->base);
+
+	return &hub_state->base;
+}
+
 static const struct drm_private_state_funcs tegra_display_hub_state_funcs = {
+	.atomic_create_state = tegra_display_hub_create_state,
 	.atomic_duplicate_state = tegra_display_hub_duplicate_state,
 	.atomic_destroy_state = tegra_display_hub_destroy_state,
 };
 
 static struct tegra_display_hub_state *
@@ -939,17 +954,12 @@ void tegra_display_hub_atomic_commit(struct drm_device *drm,
 static int tegra_display_hub_init(struct host1x_client *client)
 {
 	struct tegra_display_hub *hub = to_tegra_display_hub(client);
 	struct drm_device *drm = dev_get_drvdata(client->host);
 	struct tegra_drm *tegra = drm->dev_private;
-	struct tegra_display_hub_state *state;
 
-	state = kzalloc(sizeof(*state), GFP_KERNEL);
-	if (!state)
-		return -ENOMEM;
-
-	drm_atomic_private_obj_init(drm, &hub->base, &state->base,
+	drm_atomic_private_obj_init(drm, &hub->base, NULL,
 				    &tegra_display_hub_state_funcs);
 
 	tegra->hub = hub;
 
 	return 0;

-- 
2.52.0

