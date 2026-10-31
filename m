Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793423700;
	b=OEieKXPP0tQnhAEMXe4M7yBatYdNEBZRLTpjugvBUD5BvuDTp5A+XKRSzSeiAmXXaYEn
	 ZUPbBeGuEt512GbBzQtrBQCMFlymnfWTyIGWOZhZlXA+u6qRurMzTDNLWDzBUex00lyew
	 gJhPMo1vs7wsJVRqXYacycw8uumGD4ORegB+ESIyFpnrIGRHOMWRrUUVNECfAeCBsyjUR
	 UcCS9JCciRpkSQQNWBbke9QCYsDtwxQYJMzmRbd498zoZ9IkMm8aQxYF4K4Cd2ObHB21x
	 yq/Hyw4e8tTg6TjhGXLRNfN5q7/+mhZkBm4j25opJ4NNaITtLJTu4TB5q4JUw0Uux5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793423700;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=BBuI8GbK7I2rZVu3DyJr0WlSlWPuOWJHWuOqPUTFLms=;
	b=g7/ySkFEpf6oTqdwB758VPTfVzONI8t4jGuwuyZwdO+NXaPGtK99wP8IEV+AZGA+oy1W
	 W9itZLtXxRinvQ/2OaK1BIZaZgWZZqdrd06o/WhxQzWQkyxzlxQbTLL216Db2WWlwEkg0
	 G2AteUtvoY6gjxyTWMpdgFOXL5PVSmBDyLpJoeQ86GIAWV8FF0spA/icEvvh+Qh3JrCw0
	 5rjRWMbGMqxPDccVxK/qa143xXHLkYQisI8BWiGgFg2igRBN+pFaoYyCxyFU14wrQLV3l
	 QjYf+pYNIPB7ZB4TNaPnrbfP2TczJ+1+HG5Cq7NYD8WoSKNs6mWf+aniZc5Af0pESWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JWDA+WnM;
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDD84606A320
	for <linux-tegra@vger.kernel.org>; Sat, 31 Oct 2026 05:14:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BDD84606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JWDA+WnM
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3ab752f6244so2074272a91.2
        for <linux-tegra@vger.kernel.org>; Fri, 30 Oct 2026 22:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793423699; x=1794028499; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BBuI8GbK7I2rZVu3DyJr0WlSlWPuOWJHWuOqPUTFLms=;
        b=JWDA+WnMMH12lHiudOQ/fEdIv/tWVSEeKrrVSFX24lrZNuiVTatl70OAjfbS8e0YhJ
         1zTGmz5uRYSXXXa8cyBpzpXo7pYhMBmYIq48kuC1bcrd07f61aXw1iS/5XSvPwF107BT
         EilCUPRxb9/loFmfx6Z0vFr4oKvNbTHgIEee9Hdu8CvmWj0LAWl+90zUA4q96gNSRPEp
         Jm6Mv4UMDNL/1HWv3ifq8pI8d5A8ifjE+xUTHEAIhTx6GZ28snul68rBx+7m1CJblV11
         uIePHpi1Ln4HFyoHEDkzBOA8uZ57X1SxraUsnPlYz7w5rTR+ciPMMNI0ARr9Le3wKmoN
         bCqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793423699; x=1794028499;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BBuI8GbK7I2rZVu3DyJr0WlSlWPuOWJHWuOqPUTFLms=;
        b=FaGbQtxV/d62dUt4zgNqGc+vTz+SwHzCqWV9Qhc3WPmPB8oNdv2+CrECX5TPXQ/3im
         ES058XiZJjLfhEm4pe2JCp/8LeKUKkpZJzL03+2vS6jzO9s0tpN/G0xyyQJT3/cH5pV0
         UtImLjq9gU6z543lQoy3ltGWJqAJai1WCx7jCCxp1meVfQ4swy8axZi+67CWClT9n4AS
         JmwnmfoVL8ViIxcRJv71rCRx1rZohu4AUH9QqNjyd7hmT8oj7AOkvWnnxI+PrS+kBnwk
         X19NUmmjFBAytjX5U2FJ2o1qSBWX37gp5VtWL43IYtN9WmkFpyKKpO/Ywqan00BLk9Pp
         IHbA==
X-Forwarded-Encrypted: i=1; AKwUvByaS1e1ntHzQ6dZOzReygAsJ3C4E19Gx5ITM8j467FAMqFILO3h8QzpgQAZGzTI9KDHGS1VB6xj/vwiXg==@vger.kernel.org
X-Gm-Message-State: AFq9FYKG9xA/fAgN1EiNGe35GZofcPlklIShBSd3B973YdG3Lr9HqbWD
	2+mxN44mnMoH6LTZxKplyofq4pyAwBU07Y7aTFEoTGf83QdLtIgTbp4Z
X-Gm-Gg: AYBFou0b085NQbQE9ZoimnFw2w6WOG0sHZKMcIFcGTdXGXkLBz4lxyuFRKlH9bG4dZP
	0HKV+lECjffw88U2iht97eOT/GJl/lfHXTRHsWi3ZT/3+cnaN/JfpCPI8FwOY2hAyNUH4RLDXQv
	uaNX/YXfMe5R8LL/wQ9966XaCjiLhV+nzS+uGimsCQSeC7JKUaROsVAq7nJ4+fgX+W4eokPKSHP
	B+PwBAlBNdNEbh7c6IvX/EWEa6Vqg02W1mqfuPMBWXtiORwz1ac28c+/cYZ19WX0GwUuFRSrll5
	bKvb3lV/SbtbQFRM7gqQ7aEECdwi4MZo7uLr89AV6noZREOZYfSoFNPG8BRTr0b/+9SB4WgYFbD
	QGJC7eUEUW2i9fIVEt3V2eL7/gTEcytSsNDC3SbHu5iTyAjyYYii/SEALgl0y4tb/EYsRs+0AUX
	aqbAnLD4A2p9Eej8r1eB/QEiIC6BvG6kImjWnm0YzewRz116bppnp6T4hGmLS0zSu1aKPNGZ7Oc
	NPxjY3qaZVyauSLm0UlsBoVM2yit4Rz6YLrAbeeNcbtGWO/gPtZ4WVp4OUc0HwhdClUIXZ5jH8M
	Zxy/U9PLKK2OP90DX+OStBMJ
X-Received: by 2002:a17:90b:53ce:b0:3ad:6090:a190 with SMTP id 98e67ed59e1d1-3ae89817b01mr3689286a91.41.1793423699053;
        Fri, 30 Oct 2026 22:14:59 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae845df666sm6216305a91.14.2026.10.30.22.14.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 22:14:58 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com,
	thierry.reding@kernel.org,
	jonathanh@nvidia.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	tiwai@suse.de,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH v4 4/5] ALSA: pcm: Refuse to open a disconnected PCM
Date: Sat, 31 Oct 2026 13:14:29 +0800
Message-Id: <pm-pmb-a4703edca61d34aa679b-v12-b75145090f6bcd7cf145-4@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <pm-pmb-a4703edca61d34aa679b-v12-b75145090f6bcd7cf145-0@gmail.com>
References: <pm-pmb-a4703edca61d34aa679b-v12-b75145090f6bcd7cf145-0@gmail.com>
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

An open that found the PCM before snd_pcm_dev_disconnect() can still
attach a substream after it, because nothing in the open path checks
whether the PCM was disconnected. When only the PCM is disconnected, as
on an HD-audio codec unbind, the open then succeeds on a device that is
going away, and its file delays the remove until it is closed.

Mark the PCM as disconnected under open_mutex in snd_pcm_dev_disconnect()
and make snd_pcm_attach_substream() fail with -ENODEV for it.

Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
---
 include/sound/pcm.h | 1 +
 sound/core/pcm.c    | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/include/sound/pcm.h b/include/sound/pcm.h
index 1cf511f8d880..04f58c2ec5c6 100644
--- a/include/sound/pcm.h
+++ b/include/sound/pcm.h
@@ -548,6 +548,7 @@ struct snd_pcm {
 	bool internal; /* pcm is for internal use only */
 	bool nonatomic; /* whole PCM operations are in non-atomic context */
 	bool no_device_suspend; /* don't invoke device PM suspend */
+	bool disconnected; /* disconnected, no new open */
 #if IS_ENABLED(CONFIG_SND_PCM_OSS)
 	struct snd_pcm_oss oss;
 #endif
diff --git a/sound/core/pcm.c b/sound/core/pcm.c
index 064df4cd3b50..567eeff23095 100644
--- a/sound/core/pcm.c
+++ b/sound/core/pcm.c
@@ -897,6 +897,8 @@ int snd_pcm_attach_substream(struct snd_pcm *pcm, int stream,
 		       stream != SNDRV_PCM_STREAM_CAPTURE))
 		return -EINVAL;
 	*rsubstream = NULL;
+	if (pcm->disconnected)
+		return -ENODEV;
 	pstr = &pcm->streams[stream];
 	if (pstr->substream == NULL || pstr->substream_count == 0)
 		return -ENODEV;
@@ -1101,6 +1103,7 @@ static int snd_pcm_dev_disconnect(struct snd_device *device)
 
 	guard(mutex)(&register_mutex);
 	scoped_guard(mutex, &pcm->open_mutex) {
+		pcm->disconnected = true;
 		wake_up(&pcm->open_wait);
 		list_del_init(&pcm->list);
 
