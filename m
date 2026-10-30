Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793373303;
	b=dOiagjNa+kMTe6yi3dN24/DE9GxEWXvVHLd1SVrS88SOBm153J0Rwomm14Wx0mKyZbRr
	 eHv7XeUvk4e0ySeYDb9dayCJRMcSOZpDd5BfqdWt4AY+GHvzyGEspvHniyntVDZYyA9D8
	 2m85L0LZskOlvGtHcPYTnjlS7kCDXaMEER2h0l5gBDje1cjNvVrR6PeDu0Al0ZVoWy2QR
	 CqPViOV9VWHsJvRFKncUYoW1b0/qGQO/GFn6vMoKLl3DA5LWjuPrhcZhPAEkX431PN+x8
	 MW4gQx1jQGzi24uSIrdk1Ex7VoaZXLrHFkcNU4ADeDqBAcI3JaK+SjZSYlCke3exl3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793373303;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=hMrj50O5M9HuGtsiblFoWMD3+CFD0r4aVgzrG/AH8IA=;
	b=STWPBBvrbGnzvLbwm3Q7VtNMyBM6Jgq0pKUUq1C30lp8NevpoY0gPBvv7mH4p7ZWNFuO
	 bBLkL/Da0Z7+UduFyquM8lJrr1QXvGG7lp4ORPANT7pMFQCQ1csoSHXChJmFxfATnEA/T
	 9tmgkdkBH2MM9XwpeG8TwllnFB0RlbU40B3zWmVcN6Y5O2S+EKMwjN/tQh3x1H/b7DEb7
	 RSeyfhuQwNxRXlvb5MVJ25RFehvOmPu4pdhyyVpU7prMuRJ/e35Stq9vUYd2CXm49yo0k
	 j8tG8zZPElNpPWQToE7XeonAo23n9ZYsDB2Y8uu03E7fa7dhvc05s6ayeo/zKx6XUUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="c59/S5Fs";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9848606A31A
	for <linux-tegra@vger.kernel.org>; Fri, 30 Oct 2026 15:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=c59/S5Fs
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CB711F000C1;
	Fri, 30 Oct 2026 15:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793373302;
	bh=hMrj50O5M9HuGtsiblFoWMD3+CFD0r4aVgzrG/AH8IA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=c59/S5Fsr7PS4vGB+fS5cbH25HxU30Fb5bKd8zvqNasORr4r2ALhktvZg5UtJalXr
	 CkRtMwLz07HcgibHLHKqMd/zlYgjDFiCffDZhf1C/c8mT1AY5SLux3L8xPNQK09xy5
	 92f6cPMI/xV55awpxRHiVe//QZHJX5L93Mjpf4xwmAQv5POu+OIVg4UkeED3fOSYuP
	 xafDoSmzzaachPDjNR4RgzcUn/DqntceiP4QpaMCV9ydjUacdV6Yhh2G8Yy75pyGMZ
	 11v6sDYaJsXJW5dRJuJ+aVMoRxcdq1xmhA21+0V19ZqlVNVBVny2EaGLbYpx/JZByW
	 kei+M1ltJGu4Q==
From: Maxime Ripard <mripard@kernel.org>
Date: Fri, 30 Oct 2026 16:13:49 +0100
Subject: [PATCH v3 19/37] drm/tegra: Switch to
 drm_atomic_helper_connector_create_state
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
Message-Id: <20261030-drm-no-more-connector-reset-v3-19-30e71d92c327@kernel.org>
References: <20261030-drm-no-more-connector-reset-v3-0-30e71d92c327@kernel.org>
In-Reply-To: <20261030-drm-no-more-connector-reset-v3-0-30e71d92c327@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Mikko Perttunen <mperttunen@nvidia.com>, 
 Thierry Reding <thierry.reding@kernel.org>, linux-tegra@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1277; i=mripard@kernel.org;
 h=from:subject:message-id; bh=2aer9JPCC/W3NhlaM6l1g49/HiQe2srZwVXORFQooNo=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFlPtqi+mByXGb3+pn2pgNqlzyGbbiz40JOhXVzzWaVC/
 GJ0+BXejqksDMKcDLJiiixPZMJOL29fXOVgv/IHzBxWJpAhDFycAjCR3X6MDbP4rgYETjh33GBW
 jFdiypYtkTvmKT7y+nZS2bn8Zql5zprsRz5F7+LdJyhb8mZ6z16jytiwgu0tx8WEN+XNKqfuRSi
 a60rZ5pZa6Wq+eJTA+Kx1xo2/ha969OSnx1wrX/UrtT3k0DMA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

The tegra connector implementation uses the deprecated
drm_atomic_helper_connector_reset() as its reset hook.

Switch to drm_atomic_helper_connector_create_state() instead.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
Cc: Jonathan Hunter <jonathanh@nvidia.com>
Cc: Mikko Perttunen <mperttunen@nvidia.com>
Cc: Thierry Reding <thierry.reding@kernel.org>
Cc: linux-tegra@vger.kernel.org
---
 drivers/gpu/drm/tegra/hdmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tegra/hdmi.c b/drivers/gpu/drm/tegra/hdmi.c
index 0d2c0ab0a63e..f414dd514543 100644
--- a/drivers/gpu/drm/tegra/hdmi.c
+++ b/drivers/gpu/drm/tegra/hdmi.c
@@ -1131,8 +1131,8 @@ static void tegra_hdmi_early_unregister(struct drm_connector *connector)
 
 static const struct drm_connector_funcs tegra_hdmi_connector_funcs = {
-	.reset = drm_atomic_helper_connector_reset,
 	.detect = tegra_hdmi_connector_detect,
 	.fill_modes = drm_helper_probe_single_connector_modes,
 	.destroy = tegra_output_connector_destroy,
+	.atomic_create_state = drm_atomic_helper_connector_create_state,
 	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,

-- 
2.55.0

