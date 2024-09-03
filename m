Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 060531D54ED;
	Tue,  3 Sep 2024 07:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725349704; cv=none; b=YUJOMyuDtz4jRzx1rXp3qD0sz3mshZxFR/5bXSivglvNmcJQMJdq4Pv7104k0WO2D7cb0zFM2XwErOdw4TIAb9CQ7CfhZZsttuBmtNdEFSUhSkN5XUGH5qQgncO7kT5cUjgIFOgMfL/c9KAnSUCQoZoaSAl+hcyk3V65+l6CCKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725349704; c=relaxed/simple;
	bh=lu0ydB41xdJlQYMtPwPCiKlgr0O59PQnYbE1HTcFdRI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Hff8ALf1q1lsiYgEHtc5khYQhaaP7NdR8PDfaDHplNMrj/yOrh9laOmqbqA5vaeJocxMAdR8jX4zdP5a3cU1v6+tmcCLmqVWfNjvFmFmUzC/Ep4Qs50T5/4bd2f57lF1NN5qcZpWW6Iog2yiRIhOkQiX+ao8Z95JJAv2p4JCIQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=i29OWv49; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="i29OWv49"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=f+J10
	oItTOqQZZV4SrY5/O50CQ/Gfr/QJfWRwqmvI0w=; b=i29OWv496JpbtuD4zmZwM
	WAxy1vruOkfWx6FxXw2x8n0Lmr4NbzuBeCEsinHESckQJsWI37FB/OUNuTTAZNix
	EmXkXpns/r8/JPElcEO/tNlMNToVrdkhGvJjnACJ2y69nFg/Dny4WG5YPa1jf5dC
	/iUvEGs2PmtA/itGXAkqLw=
Received: from localhost.localdomain (unknown [36.33.36.240])
	by gzga-smtp-mta-g1-0 (Coremail) with SMTP id _____wDH1ycxv9Zmn+RlEQ--.23416S2;
	Tue, 03 Sep 2024 15:48:02 +0800 (CST)
From: Qianqiang Liu <qianqiang.liu@163.com>
To: thierry.reding@gmail.com,
	mperttunen@nvidia.com
Cc: linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Qianqiang Liu <qianqiang.liu@163.com>
Subject: [PATCH] drm/tegra: output: Fix 'Uninitialized pointer read' issue
Date: Tue,  3 Sep 2024 15:47:22 +0800
Message-Id: <20240903074722.4328-1-qianqiang.liu@163.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDH1ycxv9Zmn+RlEQ--.23416S2
X-Coremail-Antispam: 1Uf129KBjvdXoWruryDJw15Zr48GF4UKr18uFg_yoW3Crc_uw
	1DXrZ3Xw4qgrZ3ArnrAw43ZF92vrs7uF4kKryrKr93JwsrX3Z8X34q9r1fZF17Wa47JF9r
	JFyYgF1UZFsrKjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUUSksDUUUUU==
X-CM-SenderInfo: xtld01pldqwhxolxqiywtou0bp/1tbiYAVPamV4I+zPkwAAsO

drm_edid may be passed to drm_edid_connector_update() without an
initiated value

Fixes: 98365ca74cbf (drm/tegra: convert to struct drm_edid)
Signed-off-by: Qianqiang Liu <qianqiang.liu@163.com>
---
 drivers/gpu/drm/tegra/output.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tegra/output.c b/drivers/gpu/drm/tegra/output.c
index e6b5863fec71..49e4f63a5550 100644
--- a/drivers/gpu/drm/tegra/output.c
+++ b/drivers/gpu/drm/tegra/output.c
@@ -21,7 +21,7 @@
 int tegra_output_connector_get_modes(struct drm_connector *connector)
 {
 	struct tegra_output *output = connector_to_output(connector);
-	const struct drm_edid *drm_edid;
+	const struct drm_edid *drm_edid = NULL;
 	int err = 0;
 
 	/*
-- 
2.39.2

