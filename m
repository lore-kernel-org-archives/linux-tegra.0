Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795604915;
	b=ED804fuHGsxGBa5uZp/DEKY7pxpvOqA4LFHhDXt0HdmYBhJ1UZdqSEpeFnL28uDVTLOI
	 fcw46j1MZxnYvDAe9vIjrttRdGmPj/H5JNiv11DM+vJjM6rmVfo7Q2Q8CazqU9H4cqyFp
	 scTojZk2QlfNJ4Lz2XLyBjfv1pSFK7RvHW9qTGD1zaTn4qssULqqW55WSgaeXD9BvEg67
	 k8ieRqXjuHzrJ7ujEbLq2Jy4tQXuvJBN77tMEDMWnyl0TVk38qc7IFft0Rdo1A2Dr6T7D
	 WQKPoK1NfpagyPMCgqOP7k/FYEq6xYof73a5YF+A2dscvvz1z5F1a1DsjaHig96rT6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795604915;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ttE+DnIFRwVAU5oqEO22iJJyxTTgqP9uAtkgNos0KTU=;
	b=dEdM3cezLX0UkVYpdcYKFcPI573+MVYxPh1AxhFQSIqtTCdYD/Imjp4Wy0P82FZYSZIX
	 cbcP31uUjlNVIbAOqHvJ8vQKRiO3ayxJ9mVXaZptz3ObcXB7Z8trOsB55Jve9dBeX+cW0
	 JEo46qQeWw8C4cuvykkKqxXml0jcfUKIe5lU0w1tTJYTr6X2nhcyzT1xyVKzeMA+lGGzJ
	 c/CbnD+3tgKeusqxNif3vdbldI2MxRX4qDkUsHfjxDF4kYj+dBVoJMpJKwWkH5SmM3x7w
	 NkoKKT0rWVCZ7TRXsfNNitEDVVBnLki9t56+fA03Iem6d3hOEB3rzrv/WAlyYHpTPjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i0bNxsSA;
	arc=none smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4BC660A2627
	for <linux-tegra@vger.kernel.org>; Wed, 25 Nov 2026 11:08:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4BC660A2627
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i0bNxsSA
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c4cac7a7d3cso826364166b.3
        for <linux-tegra@vger.kernel.org>; Wed, 25 Nov 2026 03:08:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795604913; x=1796209713; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ttE+DnIFRwVAU5oqEO22iJJyxTTgqP9uAtkgNos0KTU=;
        b=i0bNxsSAPplSF+i2uVIupdpJeDL3eQwMimBa5SA/vIBsjUjtyplTG1IbQi84i6RNzn
         eNJXmub6ECz8KADD2Z613PQxYJ8exBoXN/Q97KmKMinzdBrLUFTknRMnPhZv4RFpE0sV
         gx5IsxnFZnMjvyNvP3qTVrrY/R8egr3FfytWbFARFy6gtcjtbi9r28PraAtW78aSLXxp
         HeiPDwzxwYh06EvSFUxA7d/gfL+vgM83dM6YSPsCr4DWO0m+h6boQKpSwYHTJM/0EXgr
         1yh7WOfJHhnNXICMltD52PM56luCEKeJeNCnd2RGhfIi6/d7kBiNT3qVwvWErFuduhNS
         Z6ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795604913; x=1796209713;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ttE+DnIFRwVAU5oqEO22iJJyxTTgqP9uAtkgNos0KTU=;
        b=NqPXA38nBtI7ndCO4S0vze4+6/U2SHa5u2t+P7te6cvnH71KrVl7y74Y6QHZJicLNo
         YhaN1IRcN8Iyl4xXiDpt3H31Ge5DAocIpP/r+c/E/7ind2KHIpu8WTJXPOu4idquMAUx
         mY0s+ivn/1dInCipXIexJyVYO63hNAxpCZrGP0ihMQWifJT97Wy/OuDErDRvD4V/l2gL
         1DZ4zX2bPUeWxR+R2U5SEQ/ptHLw8TrCr5nwpNQ7QnfAPUVIG/W4e1/dqK7fzycDylgR
         CppIYWlQb24HZk4Hb/64q75EPsKTQTZC4LLPD/oDMF05QC7XsSvOQPPdsEuCBk/9Z3+D
         J4pQ==
X-Forwarded-Encrypted: i=1; AL+hErFhAPfnJvOEfPYniwKHOHd+9Jxs7CMmA9col/Ybi02aH2cvE+XFRzup8YHW4GToNi55KhGIhaKwtjrdOA==@vger.kernel.org
X-Gm-Message-State: APuU4Z98HZyQFG+8Aj+tSqE74YYeOlXAER+Po5q5Wza3lKZOXEi8NVuK
	VBDaMTG5m8uDqJCc0c1YbYiGBdyrbdSlqg+Z5Chh5YBppRQpNIE1oN3H
X-Gm-Gg: AZFdTZdavFHUOsAdzVqg2xDHERED9HojIwAPwquUDRIxCTTCOPA7RaQd/QXcicoXJAQ
	FUwoLSNCspvxDiIoGawm4BC0lEdY61A94sZ/+CCf7VcGcCUnk457wymyzMGnNUwklZRDtlk3SEE
	XGssRrZsjnczc84FsPS+GY62twoisv0eYkjGTgDTjEETfjGAf2CUTBHfVnI/87Gv/skmh92KzCR
	2cTafoqU2SurCwWO6ItAeluQuVCbFQT7muyXa1vB0TiZhhFH9M3oGmNii15/xBrfMIJnVYV0keo
	RWrEIgAxKrizSlBw64iHHAPj/ZYzLoEo0HwSrb+vct+knkhQcy/mLYJysPxhe0srgIZcQkHcbMu
	WmR4aBT0udOE2uYfnNU2ptrsZLyAzrGSQrspjAXB+lP1mYGjswkpjFMblumlBykWKf01voXtHYp
	SdpQA4CsOV+d16fHaCzJloyCkhf/GZzrzmZvLtcJLGsEsFISdNt2vJeI00GhPYk/u1pOxhVks8s
	iWkXpJvlTBXLLP2Fh6Ap3FM34T9hprXwHuY8xetO0yvrNb8ETRoDFnS858ZazLZAsxL2B1hZgGX
	x7IAOE2uUtkRifX3BcVh2ICKbASTK5bo7PK5yw6Guu0sP1748SUQtyAO8fGsmBcGkva9suyqaVM
	BK0GwqqSkpw==
X-Received: by 2002:a17:907:c641:10b0:c42:e6c8:e494 with SMTP id a640c23a62f3a-c513ab47855mr991039366b.37.1795604913063;
        Wed, 25 Nov 2026 03:08:33 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513acfeda1sm654562066b.6.2026.11.25.03.08.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:08:32 -0800 (PST)
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
Subject: [PATCH v1 09/13] media: tegra-video: vi: Configure capture format locally without subdev calls
Date: Wed, 25 Nov 2026 13:07:46 +0200
Message-ID: <20261125110750.223628-10-clamor95@gmail.com>
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

Simplify __tegra_channel_try_format() and tegra_channel_set_format() to
validate, align, and store the capture pixel format locally on the video
channel instead of querying or setting formats on the remote subdevice
and allocating temporary subdev state.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../media/platform/nvidia/tegra-video/vi.c    | 81 +------------------
 1 file changed, 4 insertions(+), 77 deletions(-)

diff --git a/drivers/media/platform/nvidia/tegra-video/vi.c b/drivers/media/platform/nvidia/tegra-video/vi.c
index 4a0742b514a2b..f2de3aeb05bbc 100644
--- a/drivers/media/platform/nvidia/tegra-video/vi.c
+++ b/drivers/media/platform/nvidia/tegra-video/vi.c
@@ -340,82 +340,23 @@ static int __tegra_channel_try_format(struct tegra_vi_channel *chan,
 				      struct v4l2_pix_format *pix)
 {
 	const struct tegra_video_format *fmtinfo;
-	static struct lock_class_key key;
-	struct v4l2_subdev *subdev;
-	struct v4l2_subdev_format fmt = {
-		.which = V4L2_SUBDEV_FORMAT_TRY,
-	};
-	struct v4l2_subdev_state *sd_state;
-	struct v4l2_subdev_frame_size_enum fse = {
-		.which = V4L2_SUBDEV_FORMAT_TRY,
-	};
-	struct v4l2_subdev_selection sdsel = {
-		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
-		.target = V4L2_SEL_TGT_CROP_BOUNDS,
-	};
-	struct v4l2_rect *try_crop;
-	int ret = 0;
-
-	subdev = tegra_channel_get_remote_source_subdev(chan);
-	if (!subdev)
-		return -ENODEV;
+	struct tegra_vi *vi = chan->vi;
 
-	/*
-	 * FIXME: Drop this call, drivers are not supposed to use
-	 * __v4l2_subdev_state_alloc().
-	 */
-	sd_state = __v4l2_subdev_state_alloc(subdev, "tegra:state->lock",
-					     &key);
-	if (IS_ERR(sd_state))
-		return PTR_ERR(sd_state);
 	/*
 	 * Retrieve the format information and if requested format isn't
 	 * supported, keep the current format.
 	 */
-	fmtinfo = tegra_get_format_by_fourcc(chan->vi, pix->pixelformat);
+	fmtinfo = tegra_get_format_by_fourcc(vi, pix->pixelformat);
 	if (!fmtinfo) {
 		pix->pixelformat = chan->format.pixelformat;
 		pix->colorspace = chan->format.colorspace;
-		fmtinfo = tegra_get_format_by_fourcc(chan->vi,
-						     pix->pixelformat);
+		fmtinfo = tegra_get_format_by_fourcc(vi, pix->pixelformat);
 	}
 
 	pix->field = V4L2_FIELD_NONE;
-	fmt.pad = 0;
-	v4l2_fill_mbus_format(&fmt.format, pix, fmtinfo->code);
-
-	/*
-	 * Attempt to obtain the format size from subdev.
-	 * If not available, try to get crop boundary from subdev.
-	 */
-	try_crop = v4l2_subdev_state_get_crop(sd_state, 0);
-	fse.code = fmtinfo->code;
-	ret = v4l2_subdev_call(subdev, pad, enum_frame_size, sd_state, &fse);
-	if (ret) {
-		if (!v4l2_subdev_has_op(subdev, pad, get_selection) ||
-		    v4l2_subdev_call(subdev, pad, get_selection, NULL, NULL, &sdsel)) {
-			try_crop->width = 0;
-			try_crop->height = 0;
-		} else {
-			try_crop->width = sdsel.r.width;
-			try_crop->height = sdsel.r.height;
-		}
-	} else {
-		try_crop->width = fse.max_width;
-		try_crop->height = fse.max_height;
-	}
-
-	ret = v4l2_subdev_call(subdev, pad, set_fmt, NULL, sd_state, &fmt);
-	if (ret < 0)
-		goto out_free;
-
-	v4l2_fill_pix_format(pix, &fmt.format);
 	chan->vi->ops->vi_fmt_align(pix, NULL, fmtinfo->bpp);
 
-out_free:
-	__v4l2_subdev_state_free(sd_state);
-
-	return ret;
+	return 0;
 }
 
 static int tegra_channel_try_format(struct file *file, void *fh,
@@ -439,10 +380,6 @@ static int tegra_channel_set_format(struct file *file, void *fh,
 {
 	struct tegra_vi_channel *chan = video_drvdata(file);
 	const struct tegra_video_format *fmtinfo;
-	struct v4l2_subdev_format fmt = {
-		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
-	};
-	struct v4l2_subdev *subdev;
 	struct v4l2_pix_format *pix = &format->fmt.pix;
 	int ret;
 
@@ -456,16 +393,6 @@ static int tegra_channel_set_format(struct file *file, void *fh,
 
 	fmtinfo = tegra_get_format_by_fourcc(chan->vi, pix->pixelformat);
 
-	fmt.pad = 0;
-	v4l2_fill_mbus_format(&fmt.format, pix, fmtinfo->code);
-	subdev = tegra_channel_get_remote_source_subdev(chan);
-	ret = v4l2_subdev_call(subdev, pad, set_fmt, NULL, NULL, &fmt);
-	if (ret < 0)
-		return ret;
-
-	v4l2_fill_pix_format(pix, &fmt.format);
-	chan->vi->ops->vi_fmt_align(pix, NULL, fmtinfo->bpp);
-
 	chan->format = *pix;
 	chan->fmtinfo = fmtinfo;
 	tegra_channel_update_gangports(chan);
-- 
2.53.0

