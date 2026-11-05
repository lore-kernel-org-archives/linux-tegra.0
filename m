Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793887877;
	b=w5VOwmUwm7/zFNGYQ1o58mSWw0yZWfu/P1YnItYYr76Yo3V5gDDEY3GmLHCWWNpP1Fte
	 8k7Ni5TXCU5eqvRjhUpPBNxWsHVESqbokD3j5ijlh30aZz3arst9NibAxPmOZspvAtp+n
	 QvnDPqHF8IWoz5OnjjYcF+3jJ7MK7+77WB7IXZHZGm+XvLNUtvviZ3KUOyKZ6oZjDwuLI
	 1J42vAtb320hdbHVQopJ7KLtJilK1Hub/5vL6BEk7ZfZBcpm2RHJICcHPLdNvRDbtPCpy
	 vt29HGSmPgXbkgLzmFuXl6rIXYNIPyrH0q/vl1cIe0/GwOSthsmFKJG+wXKfyVKUkkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793887877;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=0LKJPCh1TWc/DqS2zQ/OLmPDuaMukdm/iy+0DRDtT+M=;
	b=aFNwG5y04tASw23p8RbFwLE9xEjkEbL9GecOm5S9C7njoSwpnN6ClmnOZodkyW/rKlWR
	 ASRLYMycObsDeRwX+OJzIv/VmL6SKsNLJ1Q9YFGSjgefbhqirKZoQ/ojp6kxyDNSegLTE
	 l72Sa7zsISfyCtpAGkEMrRetoxI0/Baubdtu9bx2d4qTTdluZKzE22iqgD+GfNVjQbJbB
	 5cN2WGr8DbgbFCoKk3GtQJjtXUQ/+ZY7JTnEuaFzWdB8dxIv08dl1aZEpMRe7KZBdt0u2
	 kop8PObffYwXqd7Ita7/XLcW0yO2j9t6KRXiFgzYeA26bpaDuszUv6T/2i4R16zLQTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mnnvjwux;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAE95606A31B
	for <linux-tegra@vger.kernel.org>; Thu,  5 Nov 2026 14:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mnnvjwux
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 423FE1F000C1;
	Thu,  5 Nov 2026 14:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793887876;
	bh=0LKJPCh1TWc/DqS2zQ/OLmPDuaMukdm/iy+0DRDtT+M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=mnnvjwuxnODPPHOYeIKR6AojvGQ06pBTRmyvorYO4nUCw6oBSotK7GyraEbi6Q7C+
	 HpM/9fh6X+zNwrlVKeVIywpfXwVEJkG3oRPincRc8dqk7hKPixcMDSP+jVktcp1eEN
	 smKLJr6Ss7RNAWAsRltI5SVIaL+HtM17uYD67FPAX6DF9xw8RcRWikxLIcNg+fOnKA
	 CJvPxfSn6SMaOFapkSPNriAm6aV/yOjtuZ/FOjufwKJoI9EL6OBvMB+57xVbdv7AIo
	 rgw/l+VqYNVt6Fk+mR4TBoqnl8Kwa30jfumXDIXBNcuHzYdx9hUIxp4ah8NvkTUl3t
	 Bi7QIZlwKs+8Q==
From: Maxime Ripard <mripard@kernel.org>
Date: Thu, 05 Nov 2026 15:08:10 +0100
Subject: [PATCH 53/83] drm/tegra: Switch to
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
Message-Id: <20261105-drm-no-more-config-reset-v1-53-763560c2cc3f@kernel.org>
References: <20261105-drm-no-more-config-reset-v1-0-763560c2cc3f@kernel.org>
In-Reply-To: <20261105-drm-no-more-config-reset-v1-0-763560c2cc3f@kernel.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, 
 Mikko Perttunen <mperttunen@nvidia.com>, 
 Thierry Reding <thierry.reding@kernel.org>, linux-tegra@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1194; i=mripard@kernel.org;
 h=from:subject:message-id; bh=5awi8HP4r9kVyKSa8V1a4QlD/EsWjb0kM2OXkegqfvw=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFlvejffduc813TqwIuVRsKxetNSd1eKSUfHhy8viBX57
 ff5xjvPjqksDMKcDLJiiixPZMJOL29fXOVgv/IHzBxWJpAhDFycAjAR4TjGhv//X3MYRjn82le+
 e9aGsw5bi943GK//KV9d1Lt1tffRVNbCOT6u9Uf3vW+oL/Ku0VDuZqwzmeewITt+SYvxzZurHFb
 PNs17zLqQwVXgc59A3HcNniP+rrs6PvNy9rG/qDDVu8v25ywA
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

