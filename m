Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90062381AE3
	for <linux-tegra@vger.kernel.org>; Thu, 25 Jun 2026 08:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782376404; cv=none; b=RLyL6caNEqqmUM2Ag8M1KAl62JLOH6ouSCf3IM4M5pBM8QBtyB44kHfMvy10kT49Cx+y4q8xmJcWWNB0swi7Uw7NHhPMn5cglvqfNvVEGpFLC4yYwgGyk6xuSjdLjYp4nSKFyG8C9I9Q/0bwwOyaPMZQHb7LvTG7YHIoIKYcFsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782376404; c=relaxed/simple;
	bh=yzYq+YMs911nsc8Zsrb4v2SKDXhPnDYQn7AH6jg5xj4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EfZXNLrCTwUv205arwYaiBwYDLT5iU8butoC8kSTw55SAbmHY3kBOZl3VQMF3dVzdG6fAct2a5B3DayzZNC+IohcI71KH667RhGfToYeQ4mtb97eA3EtXBmEmXEVnRjGa0MykYXesgc6zoCVHbw8NMOEV7PqX1pnpl7ntQ+QbsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ceHVKQ1P; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ceHVKQ1P"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5aa7a7ad475so2279146e87.1
        for <linux-tegra@vger.kernel.org>; Thu, 25 Jun 2026 01:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782376401; x=1782981201; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+WUf+KF1R3dM0sjHR8vgf5CzVTyISRVGxCaO2Dn7tME=;
        b=ceHVKQ1PQQYA7NAwG5TAq2P3E5uYWSPg3AuuwhXF5ILeL5+Zx4HWm8MwTbu18jDuFQ
         PTWDspSmeya2I3hAfi+lvL4Mfr1lymSSaxhu4aQVjd6BSEpzd1W6X41fo4ImykyWHMwT
         1mgg8Ce/4B01QZeUBbxHcvqi6YSDi6R+i76AXzCehpE5pqkGYPUCtbEMETrZqe0Th2q3
         dpp55aUv79UQcXQPJ11JlhThhphy709flKyKk+QNkhmxs/xa/q+oEUCxCUFIDFDK3xr5
         dxIFDpsxINLkbIJcUQqdgjRpwOwYzobPiUNAFB8cTUeNHnHWWO+3laewO72Q69GX2Gi9
         U42A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782376401; x=1782981201;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+WUf+KF1R3dM0sjHR8vgf5CzVTyISRVGxCaO2Dn7tME=;
        b=b3F0m3qj5Y61Rrfvx0b+WLfHepAWID/rESuu385MhDDdQxBHNjDH3DSDbAb+ZfLlua
         d3Nfj7D78x7833+PF4JHjBHMU0GJw4aNgQu4TJp20R94dAj8qOCQW/stkOMWTPKbTCaX
         1wBurI5bby8uYcn2UbDErNxZYCPeutF+iA/D9s60wwvDQqQOasFMnZa+El0nW4z0QcZW
         LH3ogD3TrpqTmHnaZm8o3s7tsVQG/SqMWAMRmBQ0FqHW/lsPRC9W829ssW1+5SVqwtfB
         PQVO73UcYnh90UX9h1KG08yq+bZTs9+rtZgBaJMVy29vXzfYKUjwC6Nurqr7jVZP3td8
         HacQ==
X-Forwarded-Encrypted: i=1; AHgh+RorD1ZHYOE0B0sC5fTUX5sRusIGFmzriNCpnRlRssQXIZ586kYQJFq8TaFsa6zyRSsy1TZgJaaI31gKjQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzFxVCP/CKPhXg6EK0E+2H21HM0662fkYRjcZNEI7c7kaKRlRpo
	NuGSepxL446Gma14QLhjVUrdeDXlt2ldFSLf986qYVXyusoho9KTR1Nc
X-Gm-Gg: AfdE7cnYBhQSVzcV5frpK2idl3OvflxSWv8/AhkPA/9FsyTId9Lc/n+kVaEJWS69tBi
	wgrK0mUfvg+kiyrDaAOdbI8F9Sz2hpyZ7Qny4T/5j3li3NCRkaFXnE3QOAuJaJmLk8yYvANx451
	rMaIyKyF7SADZvwyFIIehezAqA0TtxkJQQ1e4kTmqFSnhDASIaqel9nmMYtTzLHioxJEaUbJ4Hb
	YqwTe/jRumkdWb7uLJ7BXeK8HOUGjd+RZeFUuz+E33RhL9u9L9rwZuy7IcFFTbcgYGtE0vRwg43
	Ll/fXUrFzX+daWIYk87I9FP32LxKu0plN1RYjrG4ce+3EpuN8G0UhIfXUHNAoX6lbtrAOwXlgTR
	FC2MhtaG6ffnpaJsmiO8CD10OrG+JZjFHGO5IzegRN3Iw2lyTxIP51XrEBhFSK1Y7BwKv4KU+gW
	STxsXsZJ2fyB9Aw//rTpUQwI9SJ/fTDNnE7g==
X-Received: by 2002:a05:6512:61d9:20b0:5ad:518a:61dd with SMTP id 2adb3069b0e04-5aea2062e28mr305266e87.46.1782376400784;
        Thu, 25 Jun 2026 01:33:20 -0700 (PDT)
Received: from xeon ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3999b1b143fsm40327521fa.39.2026.06.25.01.33.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 01:33:19 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/1 RESEND] staging: media: tegra-video: vi: Improve media graph building logic
Date: Thu, 25 Jun 2026 11:33:02 +0300
Message-ID: <20260625083302.71651-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260625083302.71651-1-clamor95@gmail.com>
References: <20260625083302.71651-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The existing tegra_vi_graph_build function relies heavily on a one-to-one
match between Device Tree nodes and media pad links. While this works for
simpler configurations, it causes issues when Device Tree nodes do not
match media pad link logic (e.g., mt9m114). Switch to the
media_entity_get_fwnode_pad helper to verify and retrieve the correct pad
linked to an endpoint, rather than assuming the endpoint ID matches the
pad ID.

Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com> # tegra20, parallel camera
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/staging/media/tegra-video/vi.c | 78 ++++++++++++--------------
 1 file changed, 35 insertions(+), 43 deletions(-)

diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index f14cdc7b5211..24e4bd438678 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -1468,7 +1468,6 @@ static int tegra_vi_graph_build(struct tegra_vi_channel *chan,
 	struct tegra_vi *vi = chan->vi;
 	struct tegra_vi_graph_entity *ent;
 	struct fwnode_handle *ep = NULL;
-	struct v4l2_fwnode_link link;
 	struct media_entity *local = entity->entity;
 	struct media_entity *remote;
 	struct media_pad *local_pad;
@@ -1478,70 +1477,64 @@ static int tegra_vi_graph_build(struct tegra_vi_channel *chan,
 
 	dev_dbg(vi->dev, "creating links for entity %s\n", local->name);
 
-	while (1) {
-		ep = fwnode_graph_get_next_endpoint(entity->asd.match.fwnode,
-						    ep);
-		if (!ep)
-			break;
+	fwnode_graph_for_each_endpoint(entity->asd.match.fwnode, ep) {
+		struct fwnode_handle *remote_parent __free(fwnode_handle) = NULL;
+		struct fwnode_handle *sink_ep __free(fwnode_handle) = NULL;
+		int src_idx, sink_idx;
 
-		ret = v4l2_fwnode_parse_link(ep, &link);
-		if (ret < 0) {
-			dev_err(vi->dev, "failed to parse link for %pOF: %d\n",
-				to_of_node(ep), ret);
+		src_idx = media_entity_get_fwnode_pad(local, ep,
+						      MEDIA_PAD_FL_SOURCE);
+		if (src_idx < 0) {
+			dev_dbg(vi->dev, "no source pad found for %pfw\n", ep);
 			continue;
 		}
 
-		if (link.local_port >= local->num_pads) {
-			dev_err(vi->dev, "invalid port number %u on %pOF\n",
-				link.local_port, to_of_node(link.local_node));
-			v4l2_fwnode_put_link(&link);
-			ret = -EINVAL;
-			break;
+		remote_parent = fwnode_graph_get_remote_port_parent(ep);
+		if (!remote_parent) {
+			dev_dbg(vi->dev, "no remote parent found for %pfw\n",
+				ep);
+			continue;
 		}
 
-		local_pad = &local->pads[link.local_port];
+		local_pad = &local->pads[src_idx];
 		/* Remote node is vi node. So use channel video entity and pad
 		 * as remote/sink.
 		 */
-		if (link.remote_node == of_fwnode_handle(vi->dev->of_node)) {
+		if (remote_parent == of_fwnode_handle(vi->dev->of_node)) {
 			remote = &chan->video.entity;
 			remote_pad = &chan->pad;
 			goto create_link;
 		}
 
-		/*
-		 * Skip sink ports, they will be processed from the other end
-		 * of the link.
-		 */
-		if (local_pad->flags & MEDIA_PAD_FL_SINK) {
-			dev_dbg(vi->dev, "skipping sink port %pOF:%u\n",
-				to_of_node(link.local_node), link.local_port);
-			v4l2_fwnode_put_link(&link);
-			continue;
-		}
-
 		/* find the remote entity from notifier list */
 		ent = tegra_vi_graph_find_entity(&chan->notifier.done_list,
-						 link.remote_node);
+						 remote_parent);
 		if (!ent) {
-			dev_err(vi->dev, "no entity found for %pOF\n",
-				to_of_node(link.remote_node));
-			v4l2_fwnode_put_link(&link);
+			fwnode_handle_put(ep);
+			dev_err(vi->dev, "no entity found for %pfw\n",
+				remote_parent);
 			ret = -ENODEV;
 			break;
 		}
 
 		remote = ent->entity;
-		if (link.remote_port >= remote->num_pads) {
-			dev_err(vi->dev, "invalid port number %u on %pOF\n",
-				link.remote_port,
-				to_of_node(link.remote_node));
-			v4l2_fwnode_put_link(&link);
-			ret = -EINVAL;
-			break;
+
+		sink_ep = fwnode_graph_get_remote_endpoint(ep);
+		if (!sink_ep) {
+			dev_dbg(vi->dev, "no sink ep found for %pfw\n",
+				ep);
+			continue;
+		}
+
+		sink_idx = media_entity_get_fwnode_pad(remote, sink_ep,
+						       MEDIA_PAD_FL_SINK);
+		if (sink_idx < 0) {
+			dev_dbg(vi->dev, "no sink pad found for %pfw\n",
+				sink_ep);
+			continue;
 		}
 
-		remote_pad = &remote->pads[link.remote_port];
+		remote_pad = &remote->pads[sink_idx];
 
 create_link:
 		dev_dbg(vi->dev, "creating %s:%u -> %s:%u link\n",
@@ -1551,8 +1544,8 @@ static int tegra_vi_graph_build(struct tegra_vi_channel *chan,
 		ret = media_create_pad_link(local, local_pad->index,
 					    remote, remote_pad->index,
 					    link_flags);
-		v4l2_fwnode_put_link(&link);
 		if (ret < 0) {
+			fwnode_handle_put(ep);
 			dev_err(vi->dev,
 				"failed to create %s:%u -> %s:%u link: %d\n",
 				local->name, local_pad->index,
@@ -1561,7 +1554,6 @@ static int tegra_vi_graph_build(struct tegra_vi_channel *chan,
 		}
 	}
 
-	fwnode_handle_put(ep);
 	return ret;
 }
 
-- 
2.51.0

