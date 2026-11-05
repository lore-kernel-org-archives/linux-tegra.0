Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793892806;
	b=aByIMLREEjs6SxPTisKKc+48MMA39Ng/7DmKO4wCSXNM3Sp/6/BOkw1F4jMFHjuuqkxM
	 dVifjjZmp9V2yBk/YjZry2x2pwnmQVUzwREn5jqR/3SPqSrOCxV4bHekm3gOwMMIR31xy
	 fUA87edtxdNB0wFeCnqk2s1uxaUXuxwTLCRkoPMbbiI9ApMRGyh3bszkRpxvaRMsHSitL
	 UA4f5xBEB2DeMlLA51maVh3KL8WKWJn2eiUqDkvlQY+ruHE6eiDSPa3RZvSTJ3AOyf4jF
	 WhjS3FJ+ygNKHlfCz5gH+73J0WyWCjRHxndA1OScA5+D7IlPFZS62BWoMLKwd/e5/wQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793892806;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=0LKJPCh1TWc/DqS2zQ/OLmPDuaMukdm/iy+0DRDtT+M=;
	b=qrYLls4C3i/g1ltNtoezYY2/K/rGrL42gy/67SM0n8lp3bgDXKqKWnsxKnK1zqz229Ap
	 I7KOWLIk2bHfm1mY8L0GjhRdPAU7AxvVs5kuGPK1Sq3Mou3c0fpZ15thF4c/KoQhnDdK8
	 xQo2ukHEai5UTnq2gjHD0KO5jLsFgJWAVCfyvthiXrgv8uTR7oLEqkC33PHFPn5SS2Gqw
	 cVv3c+v3KmdzRqT9/4rrqqMPNg36hbs1dQ0JOlzOrjuQZA/l5Sxjn5+8SuBsmHsAMMVFE
	 CBOTf+xVp3VsiGIhFhKu4Ilhpsoxm+yNYBOhFFr1AKcvlVm1Lnc1xCZxOSMegTGze4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HMR4ZTnu;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3E23606A32D
	for <linux-tegra@vger.kernel.org>; Thu,  5 Nov 2026 15:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HMR4ZTnu
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55A9E1F000C1;
	Thu,  5 Nov 2026 15:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793892805;
	bh=0LKJPCh1TWc/DqS2zQ/OLmPDuaMukdm/iy+0DRDtT+M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=HMR4ZTnuKd8WTyOJ5+bwYwo18Yt7GiSp5QzhjkJLloQ6SbmMvb2qkhK7vz1uP5uNR
	 u7pJunqSRHQLQ+JaNXlXa1+RRBBed+oeafaL/RRwTmjciu4b0ZedQpglSL509dtPoT
	 8S81mpi5l7f+B7STntTmDoc7C8IW6UzObmZYB3UKsLpgAeohxN6/ggVA8dO0GEhUnt
	 JXGiH6IdPhQGeleZWVVEKQfGj1QgkUtnsbTGsp1UDvkHu+3HvVVxcnDtTM5vmHF6KZ
	 nt6dyqYqMnv7sejJOwhfluatsJCb/MaOo6Zi4+9auFNf6QN6PTLS+y1PjjLJMs4KRU
	 W/8gY2wqChmoQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Thu, 05 Nov 2026 16:30:02 +0100
Subject: [PATCH RESEND 53/83] drm/tegra: Switch to
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
Message-Id: <20261105-drm-no-more-config-reset-v1-53-1f58d1e33380@kernel.org>
References: <20261105-drm-no-more-config-reset-v1-0-1f58d1e33380@kernel.org>
In-Reply-To: <20261105-drm-no-more-config-reset-v1-0-1f58d1e33380@kernel.org>
To: David Airlie <airlied@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Mikko Perttunen <mperttunen@nvidia.com>, 
 Thierry Reding <thierry.reding@kernel.org>, linux-tegra@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1194; i=mripard@kernel.org;
 h=from:subject:message-id; bh=5awi8HP4r9kVyKSa8V1a4QlD/EsWjb0kM2OXkegqfvw=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFlvFnxRsPVNPhN8Y0/675gS75Czh5O6D+1SmdHxNEd4n
 env53/kO6ayMAhzMsiKKbI8kQk7vbx9cZWD/cofMHNYmUCGMHBxCsBE9r5kbDgtZMjrOl9IUyeU
 oSLOxrXLc+rrPsHlkWJept+D56zlDktofCbNUrPmwZJuZodl14P/MTZ8m3lxl9//lRuPNOZPsWO
 Piso/z9isZ833mC+PZV4P16EJp3Vu/3ususCxoSm1VHKj4BQA
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
@@ -1246,5 +1246,7 @@ static int host1x_drm_probe(struct host1x_device *dev)
 		goto hub;
 
-	drm_mode_config_reset(drm);
+	err = drm_mode_config_create_initial_state(drm);
+	if (err)
+		goto hub;
 
 	/*

-- 
2.55.0

