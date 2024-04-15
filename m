Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B081A15B578
	for <linux-tegra@vger.kernel.org>; Mon, 15 Apr 2024 19:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713209682; cv=none; b=PJDxPGW1hvyr1pmOniQlDkawb0wm2XGUXg69SIXUErhflVOlfHHZ09JBv6fIpM3VjB70emczgrDuNxZJWWrnt40yunproyUPo5FGtWDnrx52H888XQ2k6i2X3uCaCFBSykDv438RPK3sx1Q1Kp2y7JfjkVQ5nRSwDGflN61ISog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713209682; c=relaxed/simple;
	bh=ZU3FVdGesXLn5Tghd6pW0dVrnY1rgwS3JWG+FuKO0Qo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NhaUI9nu3CP8fUl5/6BDNs6K388XNAm8wmdgu+Tkl+rqIFVDBKHnVKbOuImzU7I5XI+u40gGVKmdkXxjPu1efRiDgcJML+pqxHZ5KqiGLM3JWpv/uxsnvLYVw2+tVy9uG40qMkUumkE+6ExS73dNoDERZ946MpuxmIAqcUsdpVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=RT2Eje2S; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="RT2Eje2S"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-78d778e6d3cso329906585a.3
        for <linux-tegra@vger.kernel.org>; Mon, 15 Apr 2024 12:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713209680; x=1713814480; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hx47X/CBEUsxAKiiRrHT5ksgFdQJWx3yIi/EXUgSCek=;
        b=RT2Eje2S7mExkzPQVOFs0OLWidGNMqi25p4XYRUCfkYdoDxKWGQmBCsERqUavHq3SP
         IWbtKPeYMp9eO8u6HcuK895QbTuiliDr8zSxmsp5i+DWIiVDnBybsSMu29dSDWz/Oz93
         iF92DEeu1S5zqYzY1uUQjoinJnbg2l1NmC/aw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713209680; x=1713814480;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hx47X/CBEUsxAKiiRrHT5ksgFdQJWx3yIi/EXUgSCek=;
        b=J3wagki0UMJ6bTZ7/2rW8lt/rS11BkAe79hPhlqseav4RsFhizU3/KgeWiqwc+BtAN
         dxyjDFnpLVxNCquOEdusABcYlQc043a6tfpQ+cBTURem2P64Isd67d0TTGpLQF/Eh+od
         AwMl0RnYaAgythhGRDA6PcQ2k6/xdOhpM6m1k4en7bHOs6UQwGq5K4wWsiZ1gkXXuO/g
         wr1lp1F6RH+Wc7AlsH25cBvh6HOYKBrnIKWZ9izkdWbCIiv7/KHfInKeEmT//aZ0KBB2
         UXLToqWN8YgsPRlVpRUpm6sVErGhWUvADghnr2NdLpEqP4ekfxQ3mgL0C1Og8BmmVF5v
         hmQw==
X-Forwarded-Encrypted: i=1; AJvYcCVoeV483n7Kg1i6kiIpkVkokCJH205N+WlsBsai/M6BkOa7b13yiO48X6jDtmW22j26FBURWr72nTfy5gejNCTmEW2thO9XxsyHniM=
X-Gm-Message-State: AOJu0YwM6pppnmEs6UiELQpvGmuavLWjl1dioBL4GJ9rhwOgFZjOC120
	hT8nlT6rDz75cQHXExIUsG6xNKYRJhM9QZxcO/meftTt11tTq8jpy46uvKC2Sg==
X-Google-Smtp-Source: AGHT+IEmAtiOSDGP5pc0WLRzcDyQrYD70pzi958Nl6f5COykB700BmbE9taYsEHtf+WGDgg2JrZfiQ==
X-Received: by 2002:a05:620a:2443:b0:78d:6b72:b45 with SMTP id h3-20020a05620a244300b0078d6b720b45mr14283622qkn.1.1713209679634;
        Mon, 15 Apr 2024 12:34:39 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id s26-20020ae9f71a000000b0078d3b54eb76sm6718055qkg.78.2024.04.15.12.34.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 12:34:39 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 15 Apr 2024 19:34:28 +0000
Subject: [PATCH 11/35] media: s2255: Use refcount_t instead of atomic_t for
 num_channels
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240415-fix-cocci-v1-11-477afb23728b@chromium.org>
References: <20240415-fix-cocci-v1-0-477afb23728b@chromium.org>
In-Reply-To: <20240415-fix-cocci-v1-0-477afb23728b@chromium.org>
To: Martin Tuma <martin.tuma@digiteqautomotive.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Hugues Fruchet <hugues.fruchet@foss.st.com>, 
 Alain Volmat <alain.volmat@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Sowjanya Komatineni <skomatineni@nvidia.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Hans Verkuil <hverkuil@xs4all.nl>, Sergey Kozlov <serjk@netup.ru>, 
 Abylay Ospan <aospan@netup.ru>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Dmitry Osipenko <digetx@gmail.com>, 
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
 Sylvain Petinot <sylvain.petinot@foss.st.com>, 
 Jacopo Mondi <jacopo+renesas@jmondi.org>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
 Pavel Machek <pavel@ucw.cz>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev, 
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.12.4

Use an API that resembles more the actual use of num_channels.

Found by cocci:
drivers/media/usb/s2255/s2255drv.c:2362:5-24: WARNING: atomic_dec_and_test variation before object free at line 2363.
drivers/media/usb/s2255/s2255drv.c:1557:5-24: WARNING: atomic_dec_and_test variation before object free at line 1558.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/s2255/s2255drv.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/media/usb/s2255/s2255drv.c b/drivers/media/usb/s2255/s2255drv.c
index 8e1de1e8bd12..a6e450181fd0 100644
--- a/drivers/media/usb/s2255/s2255drv.c
+++ b/drivers/media/usb/s2255/s2255drv.c
@@ -247,7 +247,7 @@ struct s2255_vc {
 struct s2255_dev {
 	struct s2255_vc         vc[MAX_CHANNELS];
 	struct v4l2_device      v4l2_dev;
-	atomic_t                num_channels;
+	refcount_t		num_channels;
 	int			frames;
 	struct mutex		lock;	/* channels[].vdev.lock */
 	struct mutex		cmdlock; /* protects cmdbuf */
@@ -1550,11 +1550,11 @@ static void s2255_video_device_release(struct video_device *vdev)
 		container_of(vdev, struct s2255_vc, vdev);
 
 	dprintk(dev, 4, "%s, chnls: %d\n", __func__,
-		atomic_read(&dev->num_channels));
+		refcount_read(&dev->num_channels));
 
 	v4l2_ctrl_handler_free(&vc->hdl);
 
-	if (atomic_dec_and_test(&dev->num_channels))
+	if (refcount_dec_and_test(&dev->num_channels))
 		s2255_destroy(dev);
 	return;
 }
@@ -1659,7 +1659,7 @@ static int s2255_probe_v4l(struct s2255_dev *dev)
 				"failed to register video device!\n");
 			break;
 		}
-		atomic_inc(&dev->num_channels);
+		refcount_inc(&dev->num_channels);
 		v4l2_info(&dev->v4l2_dev, "V4L2 device registered as %s\n",
 			  video_device_node_name(&vc->vdev));
 
@@ -1667,11 +1667,11 @@ static int s2255_probe_v4l(struct s2255_dev *dev)
 	pr_info("Sensoray 2255 V4L driver Revision: %s\n",
 		S2255_VERSION);
 	/* if no channels registered, return error and probe will fail*/
-	if (atomic_read(&dev->num_channels) == 0) {
+	if (refcount_read(&dev->num_channels) == 0) {
 		v4l2_device_unregister(&dev->v4l2_dev);
 		return ret;
 	}
-	if (atomic_read(&dev->num_channels) != MAX_CHANNELS)
+	if (refcount_read(&dev->num_channels) != MAX_CHANNELS)
 		pr_warn("s2255: Not all channels available.\n");
 	return 0;
 }
@@ -2221,7 +2221,7 @@ static int s2255_probe(struct usb_interface *interface,
 		goto errorFWDATA1;
 	}
 
-	atomic_set(&dev->num_channels, 0);
+	refcount_set(&dev->num_channels, 0);
 	dev->pid = id->idProduct;
 	dev->fw_data = kzalloc(sizeof(struct s2255_fw), GFP_KERNEL);
 	if (!dev->fw_data)
@@ -2341,12 +2341,12 @@ static void s2255_disconnect(struct usb_interface *interface)
 {
 	struct s2255_dev *dev = to_s2255_dev(usb_get_intfdata(interface));
 	int i;
-	int channels = atomic_read(&dev->num_channels);
+	int channels = refcount_read(&dev->num_channels);
 	mutex_lock(&dev->lock);
 	v4l2_device_disconnect(&dev->v4l2_dev);
 	mutex_unlock(&dev->lock);
 	/*see comments in the uvc_driver.c usb disconnect function */
-	atomic_inc(&dev->num_channels);
+	refcount_inc(&dev->num_channels);
 	/* unregister each video device. */
 	for (i = 0; i < channels; i++)
 		video_unregister_device(&dev->vc[i].vdev);
@@ -2359,7 +2359,7 @@ static void s2255_disconnect(struct usb_interface *interface)
 		dev->vc[i].vidstatus_ready = 1;
 		wake_up(&dev->vc[i].wait_vidstatus);
 	}
-	if (atomic_dec_and_test(&dev->num_channels))
+	if (refcount_dec_and_test(&dev->num_channels))
 		s2255_destroy(dev);
 	dev_info(&interface->dev, "%s\n", __func__);
 }

-- 
2.44.0.683.g7961c838ac-goog

