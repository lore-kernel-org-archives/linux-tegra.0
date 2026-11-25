Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795604909;
	b=xFxVGckVSEGuW75VlALstYW0St3ts9KgrEwObTAhPwAceNxS5+fJA6cW8MuMNKQs2nZ8
	 gopD7OMLMGdbENZRTnlMUOhyEVI1QFWTrs4XJEdpExkpedZzgfzct+J+A+c7b6WFT6Ezi
	 /VeAJwvKbcSjdpBtSaxYW8AXHQkkRjsx9dyHYbSpab3rJGWSSDS0X1YhUxprLixBFKmUY
	 zs6btA+5J9YAZYhJXwPW1JxIDBHzt1wkvROIB2zTIerVx7B2gtdj+NxLxnweZcE545wgL
	 A+RSq7p2NHRNj5e+NDXXXDw3y+JRtqa7AGikXpmKkFrimI1tJuXGlHX8Dfn3lugWK6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795604909;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=FbeBc8Xjd8EXP+769RalNkVenzdVJuq6UafMvhubpeQ=;
	b=COB+FTz2953yUn8PI1aBcySfBXM4GsxWJSYoZxSphLR2TEMkPNrV/IjubJ78937icdEO
	 NsUclGVhz3CYRYtXPf8/yIagihrALHjojYpC5+cKVi4VfpE7dHWyFnWkMILon7do2A+Pf
	 iHi+7uPGkiRlFejdb07Zev6dbp1OMtmQP1d35F8uwLyR/Yi4INSCc6o7L+tIClPiJ83uv
	 /1S1ttedqAPwY3IxqiBGfjHCqYbXx3cc9zSP6BOPN1EVLsr8+srKdimO/jw7hPyruLlrg
	 3IlP/JlH0w02m7DCyot3DTaeFya1yOF0Mhh7vNVPrfqRo3iKUgy0k00JZi/EVeHTgNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CHz5TOqV;
	arc=none smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5A30606A68F
	for <linux-tegra@vger.kernel.org>; Wed, 25 Nov 2026 11:08:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5A30606A68F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CHz5TOqV
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c515319dd89so49669966b.1
        for <linux-tegra@vger.kernel.org>; Wed, 25 Nov 2026 03:08:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795604907; x=1796209707; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FbeBc8Xjd8EXP+769RalNkVenzdVJuq6UafMvhubpeQ=;
        b=CHz5TOqVYPuX2mfZeJtdw9oCoXrqneAWxSeSJv9oYAuXBhwKY3Zw/rVi1CYbwu2u/Y
         z1nx+NS3szCEfEjP+f3PnnoyTj0jDh1RStWaSSEpjF82/BjaaHXy5b0vFXoA4jP0Tpwp
         KAF47GK5DtIW5bJYEosSqbPo3pDu6G0rgK83lbrhbBH8YKUrc5clfLF1o5OXMRlUVnfI
         rdFB4GabdnYOrP9R1L555kAr1OwUTw6sUlqu1si3LJ7GFc0V8tErRUjsbatbw2SW02wK
         NDhSfnLmeNkmJ+Lu9y1AMne99AtJQUiFaP62WXWG6azy6n4eR+qrFtWCtzHZAoH0BjqB
         ZB3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795604907; x=1796209707;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FbeBc8Xjd8EXP+769RalNkVenzdVJuq6UafMvhubpeQ=;
        b=tryMpCqCHuOE5+fzqxdHU7WxMEzZXflQq0wAD3tVpgox1AW4J7YCiYkzX+tm02drlK
         UlRy0hMx7stj9Ix//YzWL91V50Ok+qHPg8/yRMs5sxFA6ICQaID9ZvnHG5TDyraxEUEF
         2lw9PngKUmom6hSXbSRfXyFHv+9IiNQNGPazl7BhiSCCF8DXe17gnOVZtqipM0O01pp3
         dwh+bgO9RWqwseKVziNlP0Jc+OBv0T2O2Y7qMJ8j+YZPBnJEaLnptBr0mSqy1K1PEW8l
         CJG/hSEmEu40lmo0DbS9gCSGzTMbovgY7G/EpokE3nIYVl4/hStFBEZPCtqmM4TtEZZz
         Ke0w==
X-Forwarded-Encrypted: i=1; AL+hErErTfy+Rh0TcizYzchM/f++MvOHJArxSqFXkt8cMk6Wbt1MJVxB/xRSWqs0IKag6vm2Qk3h/Eu2/Fz6yA==@vger.kernel.org
X-Gm-Message-State: APuU4Z8kvvg/mEWeD7ilHjbFc98PbJoOx/a1T8qaDZCyJMjdFDeVdCpJ
	bPUVRTSAOD3QuJ2R6uJ4Q4+dmMnisN+aVmDj4LUfXJ184XBS71cKmb3b
X-Gm-Gg: AZFdTZf1Lr25G2s7a5riYiaC8wivoX7vnhIgjBo2Atw4Igw/XDoAPGg3IcS9dhwjlsZ
	umBuiA+RFH2tO2Hxfzk788Lh4o5m5B3lFaVzPoiCwfjMazl1G+05UgNE6zRxBVqxQxotuFDqVU3
	A6nnSORlesX7lRIDLpbmHw++GZ9R1yqZ6rfBhwXi2dEIIaUVQIGfbmEm9kszHvbzcKSjA8s+LJF
	rVi5P1RlxppZ7DPqLoBANJdruX2Z40e0v0A8Kbv8YGuPexWeZW8ZutwBWh8QUKtQoppROQ+Yipt
	1iwmMP1EabuR0FpbIuOsZYGV0K4snzICIH4eeZSKL+K9L3ZIhr+DouJiEdPuG+YV6eVStmOecCP
	2G2TjGANUyAvkOox0vhxnCW0cOP82haJU0w1UfsjkaqY35/YUHNdKBZDOOX5103TGZ5DwmmySum
	l0H3Myymsd/0bycky32oXoxvDexTkS89qeyJk+RWp95TJ63UJq9Qzdxb2wUZ3t1FllUhHKDTuyn
	FJOk+q9WUFrsZjE/VaEm3sTgRA16Szq5u/GDlnwJ7T7Hy6DrvoHZMSMKUJx3I7kS/3Q94XqgSnx
	cCyTCoLiCsjWeejNzyWDu4SVt5oDLAOkAbMxRuhgQQdKR/xW6/7Mpwl+psOP7nHOhOxChKsOUYo
	BmOSv7UhPgA==
X-Received: by 2002:a17:906:115a:b0:c1f:983f:d8a with SMTP id a640c23a62f3a-c513a89ec1emr1095743666b.24.1795604907065;
        Wed, 25 Nov 2026 03:08:27 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513acfeda1sm654562066b.6.2026.11.25.03.08.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:08:26 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v1 05/13] media: tegra-video: vi: Implement link_validate for video entity
Date: Wed, 25 Nov 2026 13:07:42 +0200
Message-ID: <20261125110750.223628-6-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125110750.223628-1-clamor95@gmail.com>
References: <20261125110750.223628-1-clamor95@gmail.com>
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add tegra_channel_link_validate() and attach it via
tegra_channel_media_ops to chan->video.entity.ops to verify that the
remote subdevice pad's active format (dimensions and media bus code)
matches the channel's configured format during media pipeline validation.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../media/platform/nvidia/tegra-video/vi.c    | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/drivers/media/platform/nvidia/tegra-video/vi.c b/drivers/media/platform/nvidia/tegra-video/vi.c
index 376f53f44b90d..5b38bae648686 100644
--- a/drivers/media/platform/nvidia/tegra-video/vi.c
+++ b/drivers/media/platform/nvidia/tegra-video/vi.c
@@ -558,6 +558,46 @@ static int tegra_channel_log_status(struct file *file, void *fh)
 	return 0;
 }
 
+static int tegra_channel_link_validate(struct media_link *link)
+{
+	struct video_device *video =
+		media_entity_to_video_device(link->sink->entity);
+	struct v4l2_subdev *subdev =
+		media_entity_to_v4l2_subdev(link->source->entity);
+	struct tegra_vi_channel *chan = video_get_drvdata(video);
+	const struct tegra_video_format *fmtinfo;
+	struct v4l2_subdev_format fmt = {
+		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
+		.pad = link->source->index,
+	};
+	int ret;
+
+	fmtinfo = tegra_get_format_by_fourcc(chan->vi, chan->format.pixelformat);
+
+	ret = v4l2_subdev_call(subdev, pad, get_fmt, NULL, &fmt);
+	if (ret)
+		return ret;
+
+	if (fmt.format.height != chan->format.height ||
+	    fmt.format.width != chan->format.width ||
+	    fmt.format.code != fmtinfo->code) {
+		dev_dbg(chan->vi->dev,
+			"link '%s':%u -> '%s':%u not valid: 0x%04x/%ux%u != 0x%04x/%ux%u\n",
+			link->source->entity->name, link->source->index,
+			link->sink->entity->name, link->sink->index,
+			fmt.format.code, fmt.format.width, fmt.format.height,
+			fmtinfo->code, chan->format.width,
+			chan->format.height);
+		return -EPIPE;
+	}
+
+	return 0;
+}
+
+static const struct media_entity_operations tegra_channel_media_ops = {
+	.link_validate = tegra_channel_link_validate,
+};
+
 static const struct v4l2_ioctl_ops tegra_channel_ioctl_ops = {
 	.vidioc_querycap		= tegra_channel_querycap,
 	.vidioc_enum_framesizes		= tegra_channel_enum_framesizes,
@@ -836,6 +876,7 @@ static int tegra_channel_init(struct tegra_vi_channel *chan)
 		 dev_name(vi->dev), "output", chan->portnos[0]);
 	chan->video.vfl_type = VFL_TYPE_VIDEO;
 	chan->video.vfl_dir = VFL_DIR_RX;
+	chan->video.entity.ops = &tegra_channel_media_ops;
 	chan->video.ioctl_ops = &tegra_channel_ioctl_ops;
 	chan->video.ctrl_handler = &chan->ctrl_handler;
 	chan->video.lock = &chan->video_lock;
-- 
2.53.0

