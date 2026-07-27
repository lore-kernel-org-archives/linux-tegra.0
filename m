Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4082F376465
	for <linux-tegra@vger.kernel.org>; Mon, 27 Jul 2026 14:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785162065; cv=none; b=PxksrJLrVxMK93NRP4uL+jsBalMvnwExQ87dF0yfC8XdCBnCWoF3ZWkYxDI1XniHek0KedULtQ2R9xhTAr5SOKDnP8oG4xEcEnyx759zRCqkXYTTwCfqyhPxkMc9JdslA64FjxB7hSEKubf8hOjo5C4Sm/Tr4d11otFSmvDYMVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785162065; c=relaxed/simple;
	bh=c9kamtxeZK7dkuST6nX73rNFYrjOycKlzsHqFyFlQxo=;
	h=Message-ID:Date:To:Cc:MIME-Version:Content-Type:From:Subject; b=NeoIpWZN4ADZURFVFlZvrnSUIdL90gy106Wd5eQvV3qxDKXhndkr8azlbh8eHYp5AR9+OVw4p7604L7muOsE83Z4K95Hv9jxzWMFvxp5MPRc2jXjsoj6OKLgYgT74aHPPnzUp0+W9UvZvLYYZm9/92ijkS3kN3mLFqOUT5gN3A8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j8r9RJgy; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j8r9RJgy"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-38dc4553f62so2664151a91.0
        for <linux-tegra@vger.kernel.org>; Mon, 27 Jul 2026 07:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785162062; x=1785766862; darn=vger.kernel.org;
        h=subject:from:content-transfer-encoding:content-type:mime-version:cc
         :to:date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nVpghhcuxKhGyEPXRijDOdAxQjgTj39oRcqWienm+DY=;
        b=j8r9RJgyYPc53lIQHRGNhHIlscugAeRoS2vZ0CVtoViTX8bn+zQazm9XDiRxxXn9QE
         R2u43e5q32WnQLI89FQzKYjd9v1DTk/IBPtBasHW10MtwuHPpMjJaRK1F/suMRfCPo8I
         HVwY+B+tNs9iOexHd01aO7gN4DsYyiSe/hGy3Iz04GufYs5uMzt8kPd8IRka/hrkCq8S
         PVkxtx/O6lXxZ0tkCN5pkIQU9iCzuZ9XHaIttA16IMM8lKuPvaaStwQ2hKbmMhmJFRA0
         hfSeZQjPvHeDUK0T82GSJHsFwd1pruUYkHP9k59yGuagDjrx59TDaP047z9Wx7/WnDBt
         tpMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785162062; x=1785766862;
        h=subject:from:content-transfer-encoding:content-type:mime-version:cc
         :to:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nVpghhcuxKhGyEPXRijDOdAxQjgTj39oRcqWienm+DY=;
        b=kQl1Jq6bC/kgqkL/ahmAdQQXL00zxrj6w7xv3L7AMouu61rQ326DzxOheKAbOueWmB
         fIniAIW5EZANvoB+Zem/6tf4clAITL1KMlCO+O0t8bms6b33qqqIE6xlwx5nzO9nv/tr
         /CY/2zeQkY58FQ1acFOHwYOInZbYom5ZqggeRuHQ8yFSglx9BNpW+NK/WLdwepsUwne7
         QywwvgDvgjpDYp+Vs0qIQuOcSizQe9VCwI8tyjTVRrMcQUTDTbPEgeHG/O+xa/MOlaHH
         7pfvY15OoLdFbxJy3371Cyyxb85e9OTASgV/F2Pz/aLZBNpsNNa/tOQURILOaFRvXPYH
         2PwA==
X-Forwarded-Encrypted: i=1; AHgh+RrnsSJnLll+MWYxwwmwUaNtWuZtrdywb+aDH7loND8ixj6x7w+J00K6ZfsALVBU2Fem8IaDpn98Ij6WVA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyCk3yIFPWewWkFn+STudWyaD0KrOxbmeLC6594EHmElTi14HeO
	CreSNblJ+n9T3VNcm8gHEyWr4//pykFcP02UyU9dh9/AwEptcVEI4CEt
X-Gm-Gg: AR+sD13EC7aJtvx0ZUNnGKy8oA21yKeYTtWZr0oIokxQGqiZNkTS2iZbJpW1gxcdJ9z
	Qw65EEuMRiPawVmjCnyGueOfk9k2j2/6Tj8wbPGjjAV+qJk6KaBkIpMzF9yoY+wE4Rhm+AuszfC
	09TmnbcP+u/WQzssm4wv2gxzexbSrv8iDawmg4es+UWd9/ReH2gKVAhGwxYEnOKovYLgIU11hMh
	0+UU0lDN407+jldMuJRpff8P+8c7ArqSFImEJ/2+PSST+/lo/Y9rw+lfFhLNvtkyIIo1C7QgJZP
	mjJNvonXSxsYOWdTDiBSSptGEEVLrrpeMEsX/WLqwFtW6NT+EQuWTG0ViJtdPMreaHe4G7W7ru2
	xH0GGtOG7umC2mvNv3qCmP8k06bcLeKq922y/mlpvbV6SHQibiFsCQMKl1RUuw9jZshSi6By0sZ
	E7t/npderrgtrGqNxbOQ==
X-Received: by 2002:a17:90b:37c6:b0:38e:1497:af5b with SMTP id 98e67ed59e1d1-38f293cd077mr7722235a91.1.1785162062437;
        Mon, 27 Jul 2026 07:21:02 -0700 (PDT)
Received: from tv2_send.eml ([101.9.192.104])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f041d5f78sm5117163a91.17.2026.07.27.07.20.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 07:21:02 -0700 (PDT)
Message-ID: <20260727222056.26262.alvinhuang0603@gmail.com>
Date: Mon, 27 Jul 2026 22:20:56 +0800
To: Luca Ceresoli <luca.ceresoli@bootlin.com>, Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, Sowjanya Komatineni <skomatineni@nvidia.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org, linux-tegra@vger.kernel.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
From: Hao-Qun Huang <alvinhuang0603@gmail.com>
Subject: [PATCH] staging: media: tegra-video: vi: move port parsing into a
 subfunction

tegra_vi_channels_alloc() needs two error variables because its loop body
mixes two things: ports that are skipped because they cannot be used, and
errors that have to stop the whole allocation.

Move the loop body into tegra_vi_port_channel_alloc(), which returns 0
both when the port is skipped and when a channel was allocated, and a
negative error only when allocation must stop. The loop is then a call
and an error check, and the second error variable is no longer needed.

No functional change intended.

Suggested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Assisted-by: Claude:claude-fable-5
Signed-off-by: Hao-Qun Huang <alvinhuang0603@gmail.com>
---
This is the cleanup on top of "staging: media: tegra-video: vi: fix probe
failure on skipped last port", already in media.git/next, so it needs
that one applied first.
 drivers/staging/media/tegra-video/vi.c | 92 ++++++++++++++------------
 1 file changed, 49 insertions(+), 43 deletions(-)

diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index f461e117305e..09eac34a7813 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -1247,17 +1247,54 @@ static int tegra_vi_tpg_channels_alloc(struct tegra_vi *vi)
 	return 0;
 }
 
+static int tegra_vi_port_channel_alloc(struct tegra_vi *vi,
+				       struct device_node *port)
+{
+	struct v4l2_fwnode_endpoint v4l2_ep = { .bus_type = 0 };
+	struct device_node *parent;
+	struct device_node *ep;
+	unsigned int port_num;
+	unsigned int lanes;
+	int ret;
+
+	if (!of_node_name_eq(port, "port"))
+		return 0;
+
+	if (of_property_read_u32(port, "reg", &port_num) < 0)
+		return 0;
+
+	if (port_num > vi->soc->vi_max_channels) {
+		dev_err(vi->dev, "invalid port num %d for %pOF\n",
+			port_num, port);
+		return -EINVAL;
+	}
+
+	ep = of_get_child_by_name(port, "endpoint");
+	if (!ep)
+		return 0;
+
+	parent = of_graph_get_remote_port_parent(ep);
+	of_node_put(ep);
+	if (!parent)
+		return 0;
+
+	ep = of_graph_get_endpoint_by_regs(parent, 0, 0);
+	of_node_put(parent);
+	ret = v4l2_fwnode_endpoint_parse(of_fwnode_handle(ep), &v4l2_ep);
+	of_node_put(ep);
+	if (ret)
+		return 0;
+
+	lanes = v4l2_ep.bus.mipi_csi2.num_data_lanes;
+
+	return tegra_vi_channel_alloc(vi, port_num, port, lanes);
+}
+
 static int tegra_vi_channels_alloc(struct tegra_vi *vi)
 {
 	struct device_node *node = vi->dev->of_node;
-	struct device_node *ep = NULL;
 	struct device_node *ports;
-	struct device_node *port = NULL;
-	unsigned int port_num;
-	struct device_node *parent;
-	struct v4l2_fwnode_endpoint v4l2_ep = { .bus_type = 0 };
-	unsigned int lanes;
-	int err;
+	struct device_node *port;
 	int ret = 0;
 
 	ports = of_get_child_by_name(node, "ports");
@@ -1265,46 +1302,15 @@ static int tegra_vi_channels_alloc(struct tegra_vi *vi)
 		return dev_err_probe(vi->dev, -ENODEV, "%pOF: missing 'ports' node\n", node);
 
 	for_each_child_of_node(ports, port) {
-		if (!of_node_name_eq(port, "port"))
-			continue;
-
-		err = of_property_read_u32(port, "reg", &port_num);
-		if (err < 0)
-			continue;
-
-		if (port_num > vi->soc->vi_max_channels) {
-			dev_err(vi->dev, "invalid port num %d for %pOF\n",
-				port_num, port);
-			ret = -EINVAL;
-			goto cleanup;
+		ret = tegra_vi_port_channel_alloc(vi, port);
+		if (ret) {
+			of_node_put(port);
+			break;
 		}
-
-		ep = of_get_child_by_name(port, "endpoint");
-		if (!ep)
-			continue;
-
-		parent = of_graph_get_remote_port_parent(ep);
-		of_node_put(ep);
-		if (!parent)
-			continue;
-
-		ep = of_graph_get_endpoint_by_regs(parent, 0, 0);
-		of_node_put(parent);
-		err = v4l2_fwnode_endpoint_parse(of_fwnode_handle(ep),
-						 &v4l2_ep);
-		of_node_put(ep);
-		if (err)
-			continue;
-
-		lanes = v4l2_ep.bus.mipi_csi2.num_data_lanes;
-		ret = tegra_vi_channel_alloc(vi, port_num, port, lanes);
-		if (ret < 0)
-			goto cleanup;
 	}
 
-cleanup:
-	of_node_put(port);
 	of_node_put(ports);
+
 	return ret;
 }
 
-- 
2.43.0

