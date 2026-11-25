Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795604912;
	b=WuwGXKDVocr4GAczUgtT9ZfNRcCSgv99iqxJP37V7kd1ohMXw6zdamPmDzNG9QjDOD7K
	 iUX4/qEV8v8YXcNMQ6Y0p+BU7HUVbp3Eldj32mPXW5qyECdTBIxKdYFbweq8zezu12rJb
	 KUerzmNuId2sJvKiLxIMSKk9/geGR60mqqboLKAOh9Ey2hp2L3AnHTQVD2COX4cIBqkD+
	 UcMuUI8VZnDy1iYNlPuNrefrIWvmXLkMfl2oASyUPBsZf841wbVVv3F7zQsKREmeZKdgO
	 1qxtQ7ZYwzeUbmLTXqLJaopvNCkVxkhH7VetLyZZoDzC/1z3JCUfD6bwYzlPY0TFrDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795604912;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=LbKQrYeSQQjIG8o4PeFfuBxBDq4T+YpBKC3L5X8LsTY=;
	b=q42IsPDdPy+jClHOu0k3cYM5f0C1frlcQyF4EwAQl2WQmoE9DWKeMai9zsT9RxQom1+F
	 tIhSJZV17lFwVBgqG7zRXXvReh0188SMcKYvTI++IhU/EdpT5kPJeL3z2o59bnUDG62Oj
	 vcbw5+xgUJCsxIMXoDkrei0sZUNynFIXmjVA2CGnQycp7ziCfPPdT9LmNi7tYfBeJ5mC+
	 QWFpbx9Vc0IuYt7fRtZTWFH8tNZ2dXKKbZmew9SVVFrzMGiRt1rSiG0uPvcQfPEuUpVjh
	 F6ZMNumyxbbjdVYVXNVMNPnTDTuU+cNBbGwCbEIsMPEb0Mr/UOOtZPVd3zm6uZ/ADjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jDl04GM0;
	arc=none smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1EEB606A31E
	for <linux-tegra@vger.kernel.org>; Wed, 25 Nov 2026 11:08:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1EEB606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jDl04GM0
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c4d427836e9so763895666b.1
        for <linux-tegra@vger.kernel.org>; Wed, 25 Nov 2026 03:08:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795604910; x=1796209710; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LbKQrYeSQQjIG8o4PeFfuBxBDq4T+YpBKC3L5X8LsTY=;
        b=jDl04GM04SUvczo1Inokqv8zZl1+LPyhzAvzrssrJVHMKh5h4HAtetz5THXEN9r5Jl
         23djp7SiAZKlGJ4msE9uSBT7Vy4yf3Vl2P/5w9iaVr5b/O0p58q1DTB7zFue0Rcd435W
         zDgdn0wg91yg+0r1tZhw/UJEE4wHT9QYY5VJApULT++uryUXC40omFv6GxVSWvh83g4P
         C89jpRezO0P3Edi3WQInmgAfTZGCXX4Xd6GXJ5BpAegvevJsaPas5TySxpkasLb/5JuG
         RQ/1usTNG7/my5XvbZZ7ALJ1sr/Gw8ew/4LwvE6kBHjJT9M8P8JYrshgkoQywQ4hTa/e
         is1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795604910; x=1796209710;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LbKQrYeSQQjIG8o4PeFfuBxBDq4T+YpBKC3L5X8LsTY=;
        b=nAqwXkarmGbZnIiD/xNESqGxscu//lfry5BsQZWnM99ExVnskPQDk3jmNrk8vX6RAK
         HzSvrDc6AusUSFZZj0e/BCOUmR7iPieUkvTUXTELeFJ3JCOXbOYOZAAXxqBNWpj93azL
         OeGfM+AqGfqDMu3SysUL+IymK8kDfqoV8Q++9GLDvc3Dzt77+pHKdLX6E3Da17LNv0B/
         M/jFfuKN2FlGSMdqM7KxxIdyaiBjikZIUgXsfX1N6UgD7KYIeLrDyZz+h/HDmI2jChAP
         Eyz8zmmPIJxAJ8RM/5t8TtOBSe5hSyhvF1Msldgz8XHy2Wvev/wtkHpf9bFUIq5l3u9W
         1lXw==
X-Forwarded-Encrypted: i=1; AL+hErFCcPUED1IrTtL5kuezVG6XrwsP7ko14oq13djGMqIePyvyDlbO2FfLkWAYZd43NveOSho14qEBQUyqrw==@vger.kernel.org
X-Gm-Message-State: APuU4Z8rWd4vOV+pwc1UWLjGAK8OEQnafNvOJf1ZItYqpc7V7Y1Pjf8F
	k2ZkIhWiDhq9zQsnq1HWrdHvIZnVCEpf2DPSCqCR0Tfsrpo+YUy/y/u2
X-Gm-Gg: AZFdTZeGtMP3UhMtWrqq0703Rw1HA8AnCpAllWRMIsmQHEb0w65MW6Q85vvdD8THQ/J
	10YQpFt4bOGER2REB/7GoxCzdTMc74mw9Z07O7NfHRIXOtkXWyxAvIxyaRJFK6px2whUCcDJdUi
	xi773IH5vG4hiGYT6psAQPxXQf/SSNI4ZpHHy1I0+xzhtPNpC1JJ8rSO11CkvScys1eHpFDxn5Q
	05mdXUU9sz2YdNH1Wrwqoywfm977OWaXkOVBLWoXhQcH+wviL3Lwsm7W+thXJNYk2S3jmsns9Nx
	4v4+HBYlj4ULRWnS1SyC6m1kB5AiAHPLl81AX1pjSeacVu9mQaA+3z1QafqdZLI5gSxb5SyfM5/
	Nuq4Dn3I3pMeU62loZuzDfv9bVshQmsTWwY170cJH/ECGQQjQZbEkSxUvG6MCu5KLxOgL1LpPRo
	TznBfR5QY3/T//d7qTvXyCLFaU8mL2ydKQx43BePbkBQX6L0GjGw85bQ1YRRef5DHK4IXDhTUAX
	1a2sXtgta/cluh+NVjw5B8Aj4cSH9GOJsjBSUPyl0E7IyVP/GRquLWoGmlfA6l7TcUxcP3l8Sbi
	OTBA135KbsVk2XhXRKqPPlzUczjW2l7F+o1fDFabj5S6eWuJwb28EcVzQfRDXNiCbCXE6iRXQhe
	DTY/8mM0pJQ==
X-Received: by 2002:a17:906:5593:b0:c40:91fb:b76 with SMTP id a640c23a62f3a-c513ab48008mr1115543266b.33.1795604910057;
        Wed, 25 Nov 2026 03:08:30 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513acfeda1sm654562066b.6.2026.11.25.03.08.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:08:29 -0800 (PST)
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
Subject: [PATCH v1 07/13] media: tegra-video: vi: Report stepwise frame sizes instead of querying subdev
Date: Wed, 25 Nov 2026 13:07:44 +0200
Message-ID: <20261125110750.223628-8-clamor95@gmail.com>
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

Update tegra_channel_enum_framesizes() to return frame sizes supported by
VI instead of forwarding enum_frame_size to the remote source subdevice.
This also requires switching to V4L2_FRMSIZE_TYPE_STEPWISE with a step of
2, since Tegra VI requires sizes to be divisible by 2.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../media/platform/nvidia/tegra-video/vi.c    | 23 ++++---------------
 1 file changed, 4 insertions(+), 19 deletions(-)

diff --git a/drivers/media/platform/nvidia/tegra-video/vi.c b/drivers/media/platform/nvidia/tegra-video/vi.c
index b523750725254..ed3e1e91baf12 100644
--- a/drivers/media/platform/nvidia/tegra-video/vi.c
+++ b/drivers/media/platform/nvidia/tegra-video/vi.c
@@ -311,29 +311,14 @@ static int tegra_channel_querycap(struct file *file, void *fh,
 static int tegra_channel_enum_framesizes(struct file *file, void *fh,
 					 struct v4l2_frmsizeenum *sizes)
 {
-	int ret;
 	struct tegra_vi_channel *chan = video_drvdata(file);
-	struct v4l2_subdev *subdev;
-	const struct tegra_video_format *fmtinfo;
-	struct v4l2_subdev_frame_size_enum fse = {
-		.index = sizes->index,
-		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
-	};
+	struct tegra_vi *vi = chan->vi;
 
-	fmtinfo = tegra_get_format_by_fourcc(chan->vi, sizes->pixel_format);
-	if (!fmtinfo)
+	if (sizes->index != 0)
 		return -EINVAL;
 
-	fse.code = fmtinfo->code;
-
-	subdev = tegra_channel_get_remote_source_subdev(chan);
-	ret = v4l2_subdev_call(subdev, pad, enum_frame_size, NULL, &fse);
-	if (ret)
-		return ret;
-
-	sizes->type = V4L2_FRMSIZE_TYPE_DISCRETE;
-	sizes->discrete.width = fse.max_width;
-	sizes->discrete.height = fse.max_height;
+	sizes->type = V4L2_FRMSIZE_TYPE_STEPWISE;
+	vi->ops->vi_fmt_align(NULL, &sizes->stepwise, 0);
 
 	return 0;
 }
-- 
2.53.0

