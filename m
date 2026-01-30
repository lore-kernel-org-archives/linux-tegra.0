Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD2FB37F0F5
	for <linux-tegra@vger.kernel.org>; Fri, 30 Jan 2026 12:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769777403; cv=none; b=q7X+ZxjHqK38QW2u5lWbpV8O6wG6ZJdEFIVS5SMYO/3/ir+a/hiak9qyIB706jattSq8oSYVooifRKZYFqrd5xHutE3fQfCXYWNGp+WT/yim4lHBP/mMH7VvoSbg6xtDkmwASVhr7UEpZgDNn90UXow5Gzas2JATRBzaFtrVTJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769777403; c=relaxed/simple;
	bh=4Y6GlT1FtG8VTSEqElibSSfmV/oqQEBBF3NI80Dhu3w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s49782BFdZGSVLJbCIoVnotKqKX6RxzAz9j0MCeMCb2jp/KuKXrQQtf+DolUd8xVpTBHrfv3FIAKODEeOXhK+TEuPO8IoaGzWRAXhYldC+bwMVK90xRrb7JAZZ4TwdVjyVNwBc9J1tKkyNvFhFeBFJLocu4/5TSmmTWC/Pj2/uI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LyJ/9VxK; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LyJ/9VxK"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-47ee76e8656so27479515e9.0
        for <linux-tegra@vger.kernel.org>; Fri, 30 Jan 2026 04:50:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769777399; x=1770382199; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5ZTvAgzsdLyPVb7r9icvoh5jhK/kCdwgL9RfYNjUTH0=;
        b=LyJ/9VxKH8qG4HIkajVqD+yx8jJ34L/TPUKCDM5oTP8QdBExhQ2HFUfNkzvM/ynTLQ
         Nc/GG1r0L8w5mOwzDzCMSa05SI87FacWcIdEi51vGRQGTopwyrUb6DsXZMEVso4ge6l0
         pDB0vz6r6GAY8L2RE70H7a2OcoBnv4rKz5ewy3eUq8fck92eF9sKoaq9lrocFk3NzdkZ
         95FdMhhVi0Fg+glk3Ac7uldmaAnNFwv3GnxhkZjP2iYrEyG7PWS9rl0zcB8LA1VlR1iR
         gov8P3jrWxWNX5mV9Gl0LatjHECTNa6R2cMwZX1ZIKGxx/2dPyRWQGQaszTDRX1slLw3
         OinQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769777399; x=1770382199;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5ZTvAgzsdLyPVb7r9icvoh5jhK/kCdwgL9RfYNjUTH0=;
        b=R8cnQb4+vyCxCZDQ3KmG3NmKpuhGIYkRMNnpLXKqhOqN5Feb0oAcBDnaLCgTDPf4fW
         onsLEXAv5oiqbobm194Ew/ay/o2FZT75+g4WiE9j485N7DPmr9ujnvrDzpCkE91jgJl3
         DFSWRbKAS+W7xHuBZ5pbWIHCOPB35eMSDrxEUcrVTtdK0s92SVhnWMT9woeIU8s1sRwH
         luh1MSPYGEpO2ZCC5jFNqeEko2LzVSRmwr2vE/dLfbUtpoOSHYELpeiT/U0qtUtyj3oc
         9kYRmXnjorTp0q8nBopi7WyOn5r85nUfQrl9QD7qoVI6l5LL111mvsMRVB74juzHhByb
         HL2A==
X-Forwarded-Encrypted: i=1; AJvYcCXcULs3D5k9+mfoBRNGaOSJ3PJ9f9c7HP4xHHHWbkrng7kEZUhww3nbko3NUFAP+23175RkMEO8mQC0kA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyXGl27LetZD68ITy1W6bOHmQUkjSNdN+HBSt0VTrN5x0XG01TO
	/F5Lg5Tew+9SyEenQsB0srYw8jCSASinlgI1qQ1KlGHh4xECKO/1iAMD
X-Gm-Gg: AZuq6aJXpRV7oi9EH6A3EswzBGJ782aqNcFXyZTqOzt5nwlOtKsjbY84sfPEahr/jzh
	PSy7CjPK66ydXbCwrfRa1y/WrrbIH5in+eBHFUFq4+8gSnYydLbmMLbX0WU+7BpCzMBPhLPP4ON
	BkyfhUyQSEpKsZRUu/dV8uRV8+agf3uANjOBtJIjcYmxHKtyUCXtJGf8LyyqPXS/Tk7jdOIsjT8
	OpPeeGE7jUt8jeRb61ZPTE+eE1O/VHGYKeD8UjnaOsjzVGL2XnyupbzFVtfjNtLFBHZWVeYJPXf
	KnNnOZouprXkYBj+lPbkbq6T6ufdCjvEfrbg4LePv98OK9QHCJaCa5lG28fTVlwnW7ww3XfRzml
	Xal0cWAYFnPKOKbQ01Z7e6kI+PY0iYwyt1YDEl2U/I0uuOHNlTy66m2facWDiCjgh6sC6wCvHhq
	ZJ
X-Received: by 2002:a05:600c:a08c:b0:477:6374:6347 with SMTP id 5b1f17b1804b1-482db491ef7mr36328755e9.22.1769777398808;
        Fri, 30 Jan 2026 04:49:58 -0800 (PST)
Received: from xeon ([188.163.112.49])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10e4757sm22738783f8f.5.2026.01.30.04.49.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 04:49:58 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-tegra@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v6 04/15] staging: media: tegra-video: csi: move CSI helpers to header
Date: Fri, 30 Jan 2026 14:49:21 +0200
Message-ID: <20260130124932.351328-5-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260130124932.351328-1-clamor95@gmail.com>
References: <20260130124932.351328-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move CSI helpers into the header for easier access from SoC-specific video
driver parts.

Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com> # tegra20, parallel camera
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/staging/media/tegra-video/csi.c | 11 -----------
 drivers/staging/media/tegra-video/csi.h | 10 ++++++++++
 2 files changed, 10 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/media/tegra-video/csi.c b/drivers/staging/media/tegra-video/csi.c
index 3c3f6e3fd1ec..894583d48b35 100644
--- a/drivers/staging/media/tegra-video/csi.c
+++ b/drivers/staging/media/tegra-video/csi.c
@@ -20,17 +20,6 @@
 
 #define MHZ			1000000
 
-static inline struct tegra_csi *
-host1x_client_to_csi(struct host1x_client *client)
-{
-	return container_of(client, struct tegra_csi, client);
-}
-
-static inline struct tegra_csi_channel *to_csi_chan(struct v4l2_subdev *subdev)
-{
-	return container_of(subdev, struct tegra_csi_channel, subdev);
-}
-
 /*
  * CSI is a separate subdevice which has 6 source pads to generate
  * test pattern. CSI subdevice pad ops are used only for TPG and
diff --git a/drivers/staging/media/tegra-video/csi.h b/drivers/staging/media/tegra-video/csi.h
index 609c5952e050..2b4d586d3845 100644
--- a/drivers/staging/media/tegra-video/csi.h
+++ b/drivers/staging/media/tegra-video/csi.h
@@ -155,6 +155,16 @@ struct tegra_csi {
 	struct list_head csi_chans;
 };
 
+static inline struct tegra_csi *host1x_client_to_csi(struct host1x_client *client)
+{
+	return container_of(client, struct tegra_csi, client);
+}
+
+static inline struct tegra_csi_channel *to_csi_chan(struct v4l2_subdev *subdev)
+{
+	return container_of(subdev, struct tegra_csi_channel, subdev);
+}
+
 void tegra_csi_error_recover(struct v4l2_subdev *subdev);
 void tegra_csi_calc_settle_time(struct tegra_csi_channel *csi_chan,
 				u8 csi_port_num,
-- 
2.51.0

