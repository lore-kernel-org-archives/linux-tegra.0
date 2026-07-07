Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ACC73F1AB2
	for <linux-tegra@vger.kernel.org>; Tue,  7 Jul 2026 15:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783437876; cv=none; b=TlNuVsG6R7iBi6IegnCudpTo/E7O7R/pQsXJX2rR9u0kT/mQ9WgIQKGzu31j61TARPF/SOp2uu5LlcmGA0Oz62BhKdI1W88dhTiWh13KMWNB85lvR1WverR4sH/y1q2dqslQEBm44HPcpSE6HWqy7ypgXynh7eVak0tAuMLm1l8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783437876; c=relaxed/simple;
	bh=CL1TWI09q6rHhesaHDbX4V0SqZsT9mM7aOBFw0VS9zE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oV5mU70YhM1w1aMLGIRXyiOLXGURj9LArs63wtO4dsNhiy6H4EMHR/fsutZVPXWwgKw8KJRDn+1QQ6Gi81w557Ksh4iksdnhLHlgyberPW4elibc1TlPVKiNzPrJFVRWTi9OXNbMQxZsQBOjzleFY7pc0ywV9FjQKAPMpkcs4so=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VcoFtfkF; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VcoFtfkF"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-847921eed4aso5921740b3a.3
        for <linux-tegra@vger.kernel.org>; Tue, 07 Jul 2026 08:24:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783437873; x=1784042673; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5PiSvPUBbt45pXI07lt7UBDjYJzi7dkwQwjZGxzED6A=;
        b=VcoFtfkFbTm8LRW1UQ/8Y1H17yfEPp1Sst0cgumrlTsrXl0O3c1Ti9Ar43B/983xVf
         Hzqmj7HcOMjsvzvYiOgf7DNaaAubYqWpcDImqr8clqf3pK8rt1q3FrjW6ESX+BHDhiHZ
         iwl/5//GWC9YcmELRRCvilzebUvmZue6iZKTDXMwZzY0atW8nJ4rF6vfM/DSarpIcG/O
         81uWZuAzOCA8I0hXFEWmClSkIRUl8HOa1+nFjiFfKlbEXPel3xov7rNwuvGXvJTqe+Iw
         S+YF4DJvePazTjfGOw7CG355jvux1Hp1PtmTOJ3sOqmG5MHnZOwHIdtezlXJgGMmP3qO
         v4YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783437873; x=1784042673;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5PiSvPUBbt45pXI07lt7UBDjYJzi7dkwQwjZGxzED6A=;
        b=ZxpSlo3/662HrSQG5YrzWUYt9pL0erDTHGAsR/NXF59j1D0nUqpXy8R+JrzkqZk7ui
         VZ51xarmuQKXazmldsNK74ofgA0YGX7Lw1nsjgxDnivsHcyLxT+BReo2tQmd/maFQNf8
         wJ40LkkDP1eTscOvVjOz1U/KyEncC0O0kAyS//ju9FsMZ9TQ/DQlY9tEkyWeODcBbO25
         leSc5ML4yRe5YtbJZ9GVhSeuxHYdxAjc7sWm0HORb1VCKTlCKwy26wmeRxCZW1dyyzIS
         HmKFAf+E4BOGxiv80fF+o6orGv0MGSuzrU5esYYDVowj5nWKhXbGf7QVS5exCXHBGhrX
         xDRg==
X-Forwarded-Encrypted: i=1; AHgh+Rp3tf1afu2fpMAtxwGAzrATs7oh7EO++k1Z3x2vxHabhedW+RKFEzbepqpS1qTgUUDJ9V9N+F7Vg7bbnw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxbMxm89oQw74Xlwc6/7RA9jRVflhTnikt4OGAS+AqtEHkqmMOf
	tDHhqLd1xFbrfW/RuVFG5051ogqQhS1zzg17rXJ3Y3VW8aiA/czxfo1O
X-Gm-Gg: AfdE7cnqiJainoHE8DmLp7Fly/OR0mSXq/qW9FW98+NcAft0jLLU2ExPBsVhhOVMMUh
	9+0LBYmT354JwLeRKSG4gAT9Thsu6t/pfXA+hRy9LuqSiYQDObYgM3AopQtCJzmjmYyBxp//FP5
	3XI9XS/kxKVr14Ub5HBEYE+26d2A5p3DgGAm2bz5RrICActm/9mcpo41rerFPpxKmRsQ8yDC3nc
	Co+dCwYRsFUI2ZPPQrdoftYa0Rf9277//Cr6EM0etEi57laqKcduY96Ghww5D+qJl2xAytd0ntc
	dqTDhWipgNIoB5306gF78UceqfeOAo6vM+DUL2ad0ajmAwYShvpP1QVxIN6QfRMaJXG46C+Eq5J
	0cihMc7hyMPgasOg+msYdfH8Aal6ZWmmFstN5gTh8O4gJlFt2lvA3zz+yPI4oHBypBfo2/kmu8d
	FSwBwACXsWixcZ3qZPDRBTATdh8/NZ/r64tg==
X-Received: by 2002:a05:6a00:3288:b0:847:893f:2d0c with SMTP id d2e1a72fcca58-84826c1edeamr5779113b3a.5.1783437873353;
        Tue, 07 Jul 2026 08:24:33 -0700 (PDT)
Received: from Alvin.tail8ccd9a.ts.net ([49.216.173.166])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6d7c142sm5652726b3a.45.2026.07.07.08.24.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 08:24:32 -0700 (PDT)
From: Hao-Qun Huang <alvinhuang0603@gmail.com>
To: Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hao-Qun Huang <alvinhuang0603@gmail.com>
Subject: [PATCH] staging: media: tegra-video: vi: fix probe failure on skipped last port
Date: Tue,  7 Jul 2026 23:24:25 +0800
Message-ID: <20260707152425.571254-1-alvinhuang0603@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

tegra_vi_channels_alloc() iterates over port nodes and skips those
whose reg property cannot be read or whose remote endpoint fails
v4l2_fwnode_endpoint_parse(), leaving the negative result of the
failed call in ret. If that happens on the last port node, the loop
ends with ret still negative and tegra_vi_init() fails the whole VI
probe.

The same defective port earlier in the ports node is skipped silently,
so probing succeeds or fails depending on the order of the port nodes.
The CSI equivalent, tegra_csi_channels_alloc(), returns 0
unconditionally after its loop and does not have this problem.

Use a separate variable for the per-port checks so that only fatal
errors end up in ret.

Fixes: 1ebaeb09830f ("media: tegra-video: Add support for external sensor capture")
Fixes: 2ac4035a78c9 ("media: tegra-video: Add support for x8 captures with gang ports")
Assisted-by: Claude:claude-fable-5
Signed-off-by: Hao-Qun Huang <alvinhuang0603@gmail.com>
---
diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index 456134a9e8cf..f461e117305e 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -1257,6 +1257,7 @@ static int tegra_vi_channels_alloc(struct tegra_vi *vi)
 	struct device_node *parent;
 	struct v4l2_fwnode_endpoint v4l2_ep = { .bus_type = 0 };
 	unsigned int lanes;
+	int err;
 	int ret = 0;
 
 	ports = of_get_child_by_name(node, "ports");
@@ -1267,8 +1268,8 @@ static int tegra_vi_channels_alloc(struct tegra_vi *vi)
 		if (!of_node_name_eq(port, "port"))
 			continue;
 
-		ret = of_property_read_u32(port, "reg", &port_num);
-		if (ret < 0)
+		err = of_property_read_u32(port, "reg", &port_num);
+		if (err < 0)
 			continue;
 
 		if (port_num > vi->soc->vi_max_channels) {
@@ -1289,10 +1290,10 @@ static int tegra_vi_channels_alloc(struct tegra_vi *vi)
 
 		ep = of_graph_get_endpoint_by_regs(parent, 0, 0);
 		of_node_put(parent);
-		ret = v4l2_fwnode_endpoint_parse(of_fwnode_handle(ep),
+		err = v4l2_fwnode_endpoint_parse(of_fwnode_handle(ep),
 						 &v4l2_ep);
 		of_node_put(ep);
-		if (ret)
+		if (err)
 			continue;
 
 		lanes = v4l2_ep.bus.mipi_csi2.num_data_lanes;
