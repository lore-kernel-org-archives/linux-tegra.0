Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794323986;
	b=Asw8OXsOmrrINYaaXWX8Kl64dRSGX9fbufEocjc5xhpyzZ2FHZ2eZWFXzRye9ISOAxJ6
	 hndbg+o0AyTyBimIvmfmWaMxvEh88fmFNBLzES7PcwMqat4eebbQ9jrJy1PnftlOMi4GK
	 1WE9Bru8yC2inuDrdrnFvvleiqKvJEiSsccqMq1mKQRh7C8DbdN2JmqBCsOWlMWbWxF3l
	 UUO5SXmTCTaSj5SzF4e94epOVKAQyy5T+i9f95jN9TlDhdb4vv/CDEIfguuHCZnc1HCdp
	 j+b2tsVD6KXdWDpoB0NYWv6RlVj/zrOqkI+mT9Y4J1I08r02AA1OsdK5zYHV2VT1UjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794323986;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=vw+Sm29EKmh6vxXYS1fsgbyUW0UkMpXvtgu2IpAMZBg=;
	b=Kzd+isnICX+CLboMxB8BRMgtdyWjsKfqDgFksVCs5/kVei3FDVq7dmQi8lEuU+FZBDHJ
	 lDCjT89bTgGgQMq65etPyqiiJoBXjy4x6Gd99r9lAv7ANtEj050/Npsmdb0dpzPnMbzIJ
	 GJMuTQBGLwkTM+Igh5LSQigg1Uo6z53frHTn61WyHL1QajkAy4EuJ5K5ai9/rthy1g+4n
	 749w4fr6ih3TKU2j+Gq39NGl/Ig4PVkYEMuErf0TPzW7etRRYd9mngF2LefKBvShJuObJ
	 3mFLLKF7CSCtgvyg2V8T9Oa2GAzYx2ROQO3msLMIWtogtDQeN1Ilri9VCmalRbsaFYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WWxGLdhd;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1919B606A325;
	Tue, 10 Nov 2026 15:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WWxGLdhd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FFF61F008A1;
	Tue, 10 Nov 2026 15:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794323986;
	bh=vw+Sm29EKmh6vxXYS1fsgbyUW0UkMpXvtgu2IpAMZBg=;
	h=From:Date:Subject:To:Cc;
	b=WWxGLdhdnvUp5ozzbMFW8xQGEtEgMUYUtlbHQ8YSvLMrCB+ncOtYTkRUAoFWU/4fU
	 WAoud7ydW48IbgbIUo3KrSPGMVvwdLgN5TI99dOc5PU22diIn1HmmnyjYadu0fdSQ4
	 kx6ln1yeJmKWBH9AnIqTptb0t4/6df849kwxDC8HoAe41CzawBMmCyJ4KdgQ5yv6HG
	 xyETxH8Mk7fLEFDKhDWY8aNjyXzFg93x6JLdqCeyDMu2sWWRfiZQ5z90ONB3lSd98R
	 qn0VDSNa81i7n1qrfGysycJJCfdw3ZqhxoYEovovc4wBG/P5L6EaP1q5C5p97T7wSb
	 tpO8UYspkomBQ==
From: Joshua Crofts <crofts@kernel.org>
Date: Tue, 10 Nov 2026 16:19:32 +0100
Subject: [PATCH] drm/tegra: remove redundant
 pm_runtime_dont_use_autosuspend() calls
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
Message-Id: <20261110-tegra-remove-dont-use-autosuspend-v1-1-f37453d0e441@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAM282oC/x3NQQrDIBBG4auEWXdAXZTQq5QuRH/TWVTDjIZCy
 N0rXX6b904yqMDosZykOMSk1Ql/Wyi9Y93AkqcpuHD33jvu2DSy4tMOcG618zBwHL3ZsB01c4q
 xuDWUNYVCs7Mrinz/j+frun4AVNANcwAAAA==
X-Change-ID: 20261110-tegra-remove-dont-use-autosuspend-caaf082f8c2f
To: Thierry Reding <thierry.reding@kernel.org>, 
 Mikko Perttunen <mperttunen@nvidia.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Jonathan Hunter <jonathanh@nvidia.com>
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Joshua Crofts <crofts@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794323983; l=2088;
 i=crofts@kernel.org; s=20260422; h=from:subject:message-id;
 bh=SnI+N7txK0nH0+D5PhtVQb+nK0hSZ/+p+Aiy7l9vlAA=;
 b=9Md2mmwu3sxNtki6GtqxGx9DVSTPwD7h5OscgFinHHLX4YxuceVb+/sj0Pi1rRZA3bM2FJX3U
 GHaMlTERtaNDnlJB1RIHzue9+bvV5bG5CcOcJH1Qo2jECevJyEOzjd0
X-Developer-Key: i=crofts@kernel.org; a=ed25519;
 pk=Xd+UVoRPiiI0K3LHQ2XIcXmO0jvVuFTv9eTx3lgBphI=

Since commit d1706f9da9f4 ("PM: runtime: call pm_runtime_dont_use_autosuspend() on reinit()"),
driver core is now responsible for undoing any
pm_runtime_use_autosuspend() calls on driver exit.

Remove the redundant function calls.

Signed-off-by: Joshua Crofts <crofts@kernel.org>
---
 drivers/gpu/drm/tegra/nvdec.c | 1 -
 drivers/gpu/drm/tegra/nvjpg.c | 1 -
 drivers/gpu/drm/tegra/vic.c   | 1 -
 3 files changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/tegra/nvdec.c b/drivers/gpu/drm/tegra/nvdec.c
index 18a8f6e4ced083ee94cf1611223b7ef507e0b7f6..98a94423b0e2099b9f8330f73dee8f534564078f 100644
--- a/drivers/gpu/drm/tegra/nvdec.c
+++ b/drivers/gpu/drm/tegra/nvdec.c
@@ -212,7 +212,6 @@ static int nvdec_exit(struct host1x_client *client)
 	if (err < 0)
 		return err;
 
-	pm_runtime_dont_use_autosuspend(client->dev);
 	pm_runtime_force_suspend(client->dev);
 
 	host1x_syncpt_put(client->syncpts[0]);
diff --git a/drivers/gpu/drm/tegra/nvjpg.c b/drivers/gpu/drm/tegra/nvjpg.c
index e302a8d1f6e7fdbcd7f14881525b4a2e1a422361..09679bb0c75767ff1471134a478b5985b2c0ee5c 100644
--- a/drivers/gpu/drm/tegra/nvjpg.c
+++ b/drivers/gpu/drm/tegra/nvjpg.c
@@ -82,7 +82,6 @@ static int nvjpg_exit(struct host1x_client *client)
 	if (err < 0)
 		return err;
 
-	pm_runtime_dont_use_autosuspend(client->dev);
 	pm_runtime_force_suspend(client->dev);
 
 	host1x_client_iommu_detach(client);
diff --git a/drivers/gpu/drm/tegra/vic.c b/drivers/gpu/drm/tegra/vic.c
index 3c2b1ff55deb7f407d2a5995a5dff302cf37f7d5..9648c3d0176bbfd9efbb3c49c8bd9c74e3df9d0e 100644
--- a/drivers/gpu/drm/tegra/vic.c
+++ b/drivers/gpu/drm/tegra/vic.c
@@ -205,7 +205,6 @@ static int vic_exit(struct host1x_client *client)
 	if (err < 0)
 		return err;
 
-	pm_runtime_dont_use_autosuspend(client->dev);
 	pm_runtime_force_suspend(client->dev);
 
 	host1x_syncpt_put(client->syncpts[0]);

---
base-commit: b3dfbde62cf1981c4638939c159dfd087b7a72e9
change-id: 20261110-tegra-remove-dont-use-autosuspend-caaf082f8c2f

Best regards,
-- 
Joshua Crofts <crofts@kernel.org>

