Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793423704;
	b=iPlUduaqBZLOVFSzJB15uMDK7rL64RLi+RyI7cpb8pbo1Qlvx3QUcvdUEZyCA27MzpgV
	 mTzWW02w1uav2U5qfGX5ic29iv4rp38kdGS4ZNS9Y6bPjkovvbzLJtEZ30qMNBUo7Ajse
	 p7gHm4u5su4UPVUlO7T8x0g3UeMI/6xxa0V1QDgJ6026wfsIpDD/RzNf4TiBfDNSbmc+z
	 P6RhU0hG4FhiFgXCaaf6BFDi/89gddu4HBIw0/eu6ZQWSrtNjA6CCg3FZk0ExXoOO3oCz
	 wPfGTc8a01fyWFCrk5ScDrbomkOu2EGoLuvlIcU04Yb+mfZQoVN3Te3or0iwm2Wi5Qg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793423704;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=lxmVrZBFe7Tii5Gnvpbpq9C2PBprHphcGv9dlcFYOrA=;
	b=p4WTmcdpEhudJoaEZsoq/03L1HMkKrumkmMK2DwWexWWpsSOqryiIJe3C53isaUZR6yt
	 0+QkXg/FOV8hprTZBB77CD+lM94o7D7bS3/YUiCn10ynVRgTGA/79mzWNuwuCZ4wdTacy
	 79P/YBrk+g405U3OBlUYeQuww4B+2Qp9HxHo5lpg6+DAKeP9AEe1NAf2nEq2bluHuSDn3
	 lm37MKDaASA57UtazUGebg0tA5iHKOs9IbuTsZvvS5Ou2UyWDOm6d9q74aijXSzaPQHh/
	 pmRBIoHVTIUGwxKKsc+qqY9TV12bjSzT8HngK/x52s33OVFgEuQfnpkbZ+kmh/WQH8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LQ3LKg4T;
	arc=none smtp.remote-ip=209.85.214.169
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1BC5606A31C
	for <linux-tegra@vger.kernel.org>; Sat, 31 Oct 2026 05:15:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1BC5606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LQ3LKg4T
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2e9d7791b00so10984975ad.0
        for <linux-tegra@vger.kernel.org>; Fri, 30 Oct 2026 22:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793423703; x=1794028503; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lxmVrZBFe7Tii5Gnvpbpq9C2PBprHphcGv9dlcFYOrA=;
        b=LQ3LKg4TwJ0RS2hjAVD++TUZItD1wQYO618Qx7Jwky16mAxmI3QaiZrpiI/SxUQPJM
         75BzzcyxuRo8g7x3xXGmGPI3qVJ9ejB2UMhGuBw1cHt23FEO6Q6NxdwhtGf6EAYWOYOc
         bbKZ98w/GEm61N5tVw8ay5tRULWnkQkzP+MAV4kZGPnRL006J3Hb46t1LauG73ODdYSA
         9YX+lI1rtQxO5GpSeVjmH2zTtekAB0O4wvllQiKEgUh0tm+tRGsazhcDAGWa3knGbSFL
         8/FAJ0U9N06h2PF6JfDn0JqAR926J/hx3VY39596Rls+r2/rDt5WCdz8zeTVQt3Bo9RP
         3JkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793423703; x=1794028503;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lxmVrZBFe7Tii5Gnvpbpq9C2PBprHphcGv9dlcFYOrA=;
        b=kHkllo0A9NI/jZ6uePecmb485lzIUS/hoSWaBiJoxfMEW8AHVdLFZWs4mIF4HjGpc8
         PDuKQFwiIbYH3LVecGg4ZvGNXZkwVh0p2j13pbleunpXxW9q2CkSQidxVLzVt4XSO3l8
         1/rD3E+rRXm2R7IIDRQ+67UV3oFM93LMhpyeBUhV/DlRNkm4A4S35SFJwHq5Ujrad54V
         XYoRBpqs3CUCufa7PfpfvE2VqJuRngK8a9sosNTeEvaOjTF5+khxtMygBtiMUAgoRTgk
         eLUylOE6I1SfpJsHrWDZbcfjJdL/23LCgnfl3P/CNnDccTiGyAo621XOn/uBqWp2F78K
         y1lg==
X-Forwarded-Encrypted: i=1; AKwUvBzXrE11DJeVyZlEnQWj7b0yEJJpCNFynJ1BDW0xfYTq6Y8D/Zoe/KDw4L7dCwzcduVfD5gkcasEn61ybw==@vger.kernel.org
X-Gm-Message-State: AFq9FYJ3ido0LXN0TI8NCx21gpXZbxivHpC8HJVsUUh0zsk8dWtx2H2e
	l/lh+yngBdmh5wdo9Q4bghqeywzx6lmdPxCjFFi3zytkT0hGosdqlk+L
X-Gm-Gg: AYBFou2uck+/w3WmKh9YXwC/OVvQPJtZJpfKizxFV14eRe3G+ct9sFaB9f+P2Uujpq1
	ByKd0qES65fexfDdZhB5KGd5v0AqNrBmuuO4zzANTjs2ArTGj9LeqB9bBAPyn0BYHQmEmI4chdF
	FJAWT723T68TwkWCe8VFdZyi1GGbu8NFFlEKt3+g6YMTrSGGLqTKtehVTNkXT3b1Ehti2+tM6kc
	mXGzFqXBpDtbC2tC7g4YoPNjW9sCXVTW77JS2Dzu5HdbTVTIMUNcsQc+/WSjlH24jJYzzst0OfY
	nG/OxElb+mh8RDIKjxuzTNMe8cmnlOS1KW84YNdW6Q6DRchdXf6ZkAP3ufpNiiwe3emNVYkYALL
	yF/IvPE8ZQynfgETyg0mAOz601eOgTQzYvQ1ozod8qg4YX3V6rNul1IBFeTdQR65wcd6AwDz79d
	h5F9+ZkIhfBG+4Fsox1i0HIgvQmIqq8JXTulDqwGqVpOGJO6IfshLwwFdap3ymGZFKTWCr6wHqD
	LyLA4AOgZGJUhhHHeZbSWFN+rHDQSbrDUJXUn/agj+AdFOBHTEq/8quRfaVj+6Surym7yKTfPx8
	a6Nf/O1viuxgJfYOM8KUpyDx
X-Received: by 2002:a17:90b:28c5:b0:3ac:8897:7b9f with SMTP id 98e67ed59e1d1-3ae897a8842mr3196174a91.43.1793423703089;
        Fri, 30 Oct 2026 22:15:03 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae845df666sm6216305a91.14.2026.10.30.22.14.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 22:15:02 -0700 (PDT)
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
Subject: [PATCH v4 5/5] ALSA: hda: Wait for the files of the codec PCMs before freeing them
Date: Sat, 31 Oct 2026 13:14:30 +0800
Message-Id: <pm-pmb-a4703edca61d34aa679b-v12-b75145090f6bcd7cf145-5@gmail.com>
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

The codec remove waits for codec->pcm_ref, which only counts the streams
opened through the HD-audio PCM ops. A file uses the PCM before that:
snd_pcm_open() takes pcm->open_mutex, and an OSS open walks the setup
list of the PCM, before a substream is opened. snd_pcm_release() also
still takes pcm->open_mutex after the close callback has dropped the
reference. When a codec is unbound through sysfs while the card stays
registered, the remove can free the PCMs under such a file:

  PCM open                           codec unbind
  --------                           ------------
  snd_lookup_minor_data()
  snd_card_file_add()
                                     snd_hda_codec_disconnect_pcms()
                                     snd_refcount_sync(&codec->pcm_ref)
                                     snd_hda_codec_cleanup_for_unbind()
                                       snd_pcm_free()
  mutex_lock(&pcm->open_mutex)

Opening the PCM while the codec is unbound and bound in a loop triggers
it:

  BUG: KASAN: slab-use-after-free in mutex_spin_on_owner+0x94/0x2b0
  Read of size 8 at addr ffff888005d52a58 by task hdatest/90
  Call Trace:
   __mutex_lock+0x16a4/0x24a0
   snd_pcm_open+0x230/0x600
   snd_pcm_playback_open+0x5e/0xb0
  Freed by task 94:
   kfree+0x2e5/0x510
   snd_pcm_free+0x9d/0x150
   __snd_device_free+0x121/0x370
   snd_hda_codec_cleanup_for_unbind+0x219/0x920
   hda_codec_driver_remove+0x1a7/0x2b0
   unbind_store+0xd1/0xf0

An open can also get past the wait and call into the codec driver after
the remove has cleared its state, which ends in a NULL pointer
dereference in playback_pcm_open().

After disconnecting the PCMs, wait until the files opened on them are
closed. Do the same on the probe error path, which frees PCMs that a
late probe may already have registered.

Fixes: bcd96557bd0a ("ALSA: hda - Build PCMs and controls at codec driver probe")
Suggested-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
---
 sound/hda/common/bind.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/sound/hda/common/bind.c b/sound/hda/common/bind.c
index de867f34f290..66949c4ff21f 100644
--- a/sound/hda/common/bind.c
+++ b/sound/hda/common/bind.c
@@ -84,6 +84,20 @@ int snd_hda_codec_set_name(struct hda_codec *codec, const char *name)
 }
 EXPORT_SYMBOL_GPL(snd_hda_codec_set_name);
 
+/*
+ * A file opened on a codec PCM can use the PCM until it is closed, also
+ * after the PCM was disconnected.  Wait for those files.
+ */
+static void hda_codec_sync_pcm_files(struct hda_codec *codec)
+{
+	struct hda_pcm *cpcm;
+
+	list_for_each_entry(cpcm, &codec->pcm_list_head, list) {
+		if (cpcm->pcm)
+			snd_card_file_sync(codec->card, cpcm->pcm);
+	}
+}
+
 static int hda_codec_driver_probe(struct device *dev)
 {
 	struct hda_codec *codec = dev_to_hda_codec(dev);
@@ -152,6 +166,8 @@ static int hda_codec_driver_probe(struct device *dev)
  error_module:
 	snd_hdac_device_disable_unsol(&codec->core);
 	cancel_delayed_work_sync(&codec->jackpoll_work);
+	snd_hda_codec_disconnect_pcms(codec);
+	hda_codec_sync_pcm_files(codec);
 	if (probed && driver->ops->remove)
 		driver->ops->remove(codec);
  error_module_put:
@@ -182,6 +198,7 @@ static int hda_codec_driver_remove(struct device *dev)
 	guard(mutex)(&codec->bus->core.codec_bind_lock);
 	snd_hda_codec_disconnect_pcms(codec);
 	snd_hda_jack_tbl_disconnect(codec);
+	hda_codec_sync_pcm_files(codec);
 	snd_refcount_sync(&codec->pcm_ref);
 	snd_power_sync_ref(codec->bus->card);
 
