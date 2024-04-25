Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 315D139FD8
	for <linux-tegra@vger.kernel.org>; Thu, 25 Apr 2024 05:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.232.154.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714021393; cv=none; b=l5G/DXmrBylxsGi76K8D7SilHC/6I8cn4jICDRC2fw2EK1EAaa76ZztVjETc/O9QJ8vrn8Y7Uo8IMcyEwl8yzewVhOEbfKtb0Dxc/txLcztOtnJXZSt2GCiED5eMj7vq3sw6UB99UWFKhYo5WRQ5A1dBOCPajzN3ZvgYL3ZWD7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714021393; c=relaxed/simple;
	bh=4LMatE/e96/w78B1lH+T1uUWbPMnNlUiLoXDZ+fgZbU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=e19FH24ENMWzIIA8xocgsdsuWr9hlT9Mx0TVas2Jvpd9B+a1h064Lv6hFRp4xh/yyCLqqb9AuDiFKkFMA3q/5pkvtA7wWMbK4/r/bGV6TnWay7izgFFBKcwNo/chjirZEp04Td4nXSP5sYXtmZrSGIzMFV2sNoleajb4259uu44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kapsi.fi; spf=pass smtp.mailfrom=kapsi.fi; dkim=pass (2048-bit key) header.d=kapsi.fi header.i=@kapsi.fi header.b=Lfk+m1ii; arc=none smtp.client-ip=91.232.154.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kapsi.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kapsi.fi
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kapsi.fi header.i=@kapsi.fi header.b="Lfk+m1ii"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
	s=20161220; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=AxK20Fe5cUhFubbOTeK5/1a5AJJBuw88+EhiESfmRa8=; b=Lfk+m1iiCAiflQUXzoAK/N1O7Z
	hVpd46LSD8Y+7ezRVZ9JxxZlex2THwqHtV6feiS85lQJZdXuUhEJH/YgOPhuvM7iuA03EktDiTqro
	kibGoRBeWFmG9AnFs7AqmfCcXiHUY1FC823clgv6+KMaKDNh0mRAwgZrM4EdhsISHAyEcVjw7yzv9
	MCWqPp7UG0+bbX1oI5JDldXyIzqiO/HDs3FbjCZbUl8518DwXciNPV6lyvvDChqpNHYriailnhoBG
	JwzNfCezOwCbTKVm4Zd82iJEXrz0KuFIL9Tj5cJZiT5g+cdTO7IPSR9A8vvUHGuvCeCJckJL0NZZ7
	GG0/KCxQ==;
Received: from 91-158-25-70.elisa-laajakaista.fi ([91.158.25.70] helo=toshino.localdomain)
	by mail.kapsi.fi with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <cyndis@kapsi.fi>)
	id 1rzrG6-00Fmla-36;
	Thu, 25 Apr 2024 08:02:59 +0300
From: Mikko Perttunen <cyndis@kapsi.fi>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Mikko Perttunen <mperttunen@nvidia.com>,
	dri-devel@lists.freedesktop.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH 1/5] gpu: host1x: Fix _writel function declarations
Date: Thu, 25 Apr 2024 08:02:33 +0300
Message-ID: <20240425050238.2943404-1-cyndis@kapsi.fi>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 91.158.25.70
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false

From: Mikko Perttunen <mperttunen@nvidia.com>

Some of the _writel functions in dev.h had the r and v parameters
swapped. Fix this to avoid confusion.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/gpu/host1x/dev.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/host1x/dev.h b/drivers/gpu/host1x/dev.h
index 925a118db23f..53af0334c6e1 100644
--- a/drivers/gpu/host1x/dev.h
+++ b/drivers/gpu/host1x/dev.h
@@ -173,11 +173,11 @@ struct host1x {
 };
 
 void host1x_common_writel(struct host1x *host1x, u32 v, u32 r);
-void host1x_hypervisor_writel(struct host1x *host1x, u32 r, u32 v);
+void host1x_hypervisor_writel(struct host1x *host1x, u32 v, u32 r);
 u32 host1x_hypervisor_readl(struct host1x *host1x, u32 r);
-void host1x_sync_writel(struct host1x *host1x, u32 r, u32 v);
+void host1x_sync_writel(struct host1x *host1x, u32 v, u32 r);
 u32 host1x_sync_readl(struct host1x *host1x, u32 r);
-void host1x_ch_writel(struct host1x_channel *ch, u32 r, u32 v);
+void host1x_ch_writel(struct host1x_channel *ch, u32 v, u32 r);
 u32 host1x_ch_readl(struct host1x_channel *ch, u32 r);
 
 static inline void host1x_hw_syncpt_restore(struct host1x *host,
-- 
2.42.0

