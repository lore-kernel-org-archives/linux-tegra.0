Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794586729;
	b=cKoHMKdEGVbYk3igGQeYGH4UUadU/4XZq/gSF2ZWw76APJu3GH486hctMdF0ybfP7eeR
	 eV30HVr9lFYhh9c7eONmojn08/kJAmeZMBUuHPfXKDYZkV6gJlZmuuKbptc4tLJuDPrwz
	 CgfR7eZt6wOXkoeNNMTk3BM+s6R3La9jJZgWGRhDzIsAYj6rsczJeMOquENR2OMNzm4Sa
	 cnlqBrwY3/VUMDTY02iDTW+OJbEt/WjiNGtS5dRpTjaORL7jXI/408wu2eqWG6dTXc9FL
	 WlObe9jGwT3nFO9qxJw1YKYnDgkBCyTXf33zX2aOIL1rcTpssQxb3b2cGGphmFoew5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794586729;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=wB38b6je5TukLZG4QeKQmlwzA/Ycxh9nT5Bea008608=;
	b=YwVc1gcUV//icp7vUmvQaYgbYlchpCRpamzs99An27vdx2md7/PRM1GUrczCwj0wtBqG
	 9JqHfi8mdKcy9ibpWM7ABB1Q1JaZaQGYcPhDzPsrMAwDzN1hztIBXbRAW1heqcEnV+CL9
	 nyazZ/89Lyy9iVnOrEpc/KK5OPwfdosFKINGyysNGTbvlgmb2q1ksi8uBTJNItxmW2QoC
	 JtxleJrwAZtlO0eScqd6b8/EwQ+3v6e0XVWZ7mSNTy2JdtB/bJjWTawFJxeZbMNAlAXC8
	 K5ehjVQP4JXVR5DCRM3Ad4orDWRsDMB6XWxT2TPjB8LbGUWImlc/7QejAz6LyPP6v0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=At09PamB;
	arc=none smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92298606EB87
	for <linux-tegra@vger.kernel.org>; Fri, 13 Nov 2026 16:18:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92298606EB87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=At09PamB
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c40f29667e6so273645466b.0
        for <linux-tegra@vger.kernel.org>; Fri, 13 Nov 2026 08:18:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794586728; x=1795191528; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wB38b6je5TukLZG4QeKQmlwzA/Ycxh9nT5Bea008608=;
        b=At09PamBlx0mgZ8wA1mn4FX0b8cMAl3wGpEtI5vUsyZVLZyLykijn6m+GBgHgmaz3k
         N5Lo76AHNSxg4Qh/mPhuczNxLbchBt9gYHFcLUj67NOD8u4MARnPOl3nJDJAZ7gABrOk
         aeyH/buHFumDJ/xvVZBaKjF5ueH6dBa8X5qoVlK7mgs7IkaoAUxDM5msSqZvSzxUpqnr
         gLXGN8g2/2+nmIQWofHRVcSR2Og6UWJX9G0RtZymvfi1lAnnf3q8yQ8T41Ep8PpFBmDu
         P/KCpvPP58K3MFtcs4kVVsNbubB6RKywoF+xivcSAJQj3YBXNjii7VJY1TMK8EevsSBk
         umwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794586728; x=1795191528;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wB38b6je5TukLZG4QeKQmlwzA/Ycxh9nT5Bea008608=;
        b=uhRH8e54PfoSrpmGGPZwSKqBJs5iDj3LcZlQ5UsQvSIcuiIVz1SPWfdXPmMyN1Ft77
         /fP9SZ3LVpJEgMAsV3ZPac5F7F7pkfFJxKorHCsx7rqcTbcQd7rQ3MPS3/Q9D/jt7dUl
         jT1DZgjQZM1jPlzS2nz8xGS7q7XZFs8n3aM2/VvVl2h3EfR+6jXEcXMApmpQPehXfqfx
         F2tgMjLFPr33Gwb5a1UpJR+DrFHOTsCHBoItwrTe8kWCgPoymxeBAkR8StZLOEmzIWB2
         Cc/lzD5wzMlWPadnzTRdlsvmZxkF9SBhyrtviE5IPyNQxBy37Bt62pj9gDZ3wwPWqHH0
         hVHA==
X-Forwarded-Encrypted: i=1; AL+hErHO8ygMLI2ChUcDjcPJn1A1xQqVZ9mF+J71PFb0RMNt8MoxSXgGIIctI/w0kCn/VCLeiXsmeNm7nnQPEg==@vger.kernel.org
X-Gm-Message-State: APuU4Z/aWGu80qbfy/cLFTvh+fzTU+iEa2Dr3Aq8E81WATblnPPQbj7M
	1h8k5zPJlh09PanO/aA++HLKPR0LHVCfVL2WEK7ZCV6jxOSwjn/jEYrS
X-Gm-Gg: AYBFou0Vid7dfoldIGKJRoEh7V809UxfHbW36dsFORGc+vSPbn0bqICtqH3BvAo6rxy
	J695DXvf2YJyIJVi3FhtIRcS7Ky/7sFKEfe/jmHqMnVlqT9sPMPwRzdz2XyT6C9p9RCysi29g7v
	Ha8+hWlmx0/B4ru8BUpDMgjx9YAEfwhxP/1V5GRsJvJQCcMjj5NNjeq1W+Iae28ThhBLAKZQep+
	wkrSndQ3sgzJBGfSaA1T1AfiuAPHxCWC+wKw7JCR+sW+clG3qZDndRzvA1v0yuQl2QqsRHr67Yn
	ZDQ2wuiQpR8ueb+QOKO2HByoD9jvSwuKPuH5uobM/cLHJBdFcfGo0XGHFoTodr4/TmHljhMG4U6
	FFnYnnrKMOZgKPXYe0bk06upDDUa9svQuVuVtvnsU2vVdq/3cvrfbU9wuRpPsLXlzHe2cQZc9p6
	vd/ull6NRWm+aXiMmpTc2H/oqNdEGs8tzf0JUGEQl2ceuUxocOQ85YDHjRbj69CL31ZokoDSQxB
	oPO/VIg8fIXWl2Va2I4bgHi2DjyDLha8MTAzr3YN97w5R1GBOSnmMpJu0v3FcYFUPrRuCI5yDrt
	Ypn26Z8bjKoR5cMeMWqkitZaL4TWuRi6rZobLZkvcKfUCmMKT4WXlMXkVY+P3XbJMiVc6oCN+oz
	Mubg+Teg9dw==
X-Received: by 2002:a17:907:c09:b0:c49:9231:5518 with SMTP id a640c23a62f3a-c50963d4f29mr272520066b.21.1794586727949;
        Fri, 13 Nov 2026 08:18:47 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b24b88sm122297266b.16.2026.11.13.08.18.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 08:18:47 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Cong Nguyen <congnt264@gmail.com>,
	Faisal Mukhtar <mukhtarfaisal03@gmail.com>,
	Dan Carpenter <error27@gmail.com>,
	Hungyu Lin <dennylin0707@gmail.com>,
	Hao-Qun Huang <alvinhuang0603@gmail.com>,
	Yury Norov <ynorov@nvidia.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v1 04/10] media: tegra-video: vi: Switch to media_entity_remote_source_pad_unique() helper
Date: Fri, 13 Nov 2026 18:18:13 +0200
Message-ID: <20261113161819.36847-5-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261113161819.36847-1-clamor95@gmail.com>
References: <20261113161819.36847-1-clamor95@gmail.com>
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The tegra_channel_get_remote_source_subdev() helper walks up the chain
to the initial source. It blindly uses pad 0, assuming it will always be
the remote source pad. This may not be the case for more complex multipad
devices — for example, the mt9m114 camera sensor with a built-in IFP,
where the source pad is 1. Switch to
media_entity_remote_source_pad_unique() to specifically retrieve the
remote source pad.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/media/platform/nvidia/tegra-video/vi.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/nvidia/tegra-video/vi.c b/drivers/media/platform/nvidia/tegra-video/vi.c
index 12eaa89304e84..a96ef26af89eb 100644
--- a/drivers/media/platform/nvidia/tegra-video/vi.c
+++ b/drivers/media/platform/nvidia/tegra-video/vi.c
@@ -187,9 +187,11 @@ tegra_channel_get_remote_source_subdev(struct tegra_vi_channel *chan)
 	if (!subdev)
 		return NULL;
 
+	entity = &subdev->entity;
+
 	pad = &subdev->entity.pads[0];
 	while (!(pad->flags & MEDIA_PAD_FL_SOURCE)) {
-		pad = media_pad_remote_pad_first(pad);
+		pad = media_entity_remote_source_pad_unique(entity);
 		if (!pad || !is_media_entity_v4l2_subdev(pad->entity))
 			break;
 		entity = pad->entity;
-- 
2.53.0

