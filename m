Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793423679;
	b=SAxbvOPiF5taGXc4id4mXBT8uUAgp1bf/9FqscP5v5UBGzV1kU9Eyel+idgJlHFzxwBo
	 ViukNnOsiwcqsBLH0nnYOhohvfG+DUMbN4w3xB7AzlY5TXGabcx5pl7PE6dbSC5UGwGAW
	 +D+ToVWEMTnf4YnlmHuIthmbIyCUlYTcQKP6a7JZVCXgQutIbTuUFfvi96mbgT+GXFYsh
	 C3PuhiAzdcH/xaXvMfWVbMiD95yQjJgAGQldLVdrYt+WyDzlmDHMo+S0iEQ8vwjajOCLS
	 76ruaneFfkAV55+2fEzrUWGhQI9ou+QjsFjqck6GB74+EN/qD7GPk4KKo8QoV0sBr+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793423679;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=JV84msgXUJaDxvG1g2Xeu1J3+jfzXhZ4gyQkFLKAo20=;
	b=YvdSMEDzE0v8sBOq7RKG8SbG+tbnwNaE4EjILUyZtuTaoZ30HXyZa5ZK8UPahoic+95p
	 d31eFIUO2DJFUfIRFjmLO8Lcio+s1j800iy+DkUH6q0UnxiL963ylFPvF+QaUPeaQUe7x
	 HX75N7rWj8lyV7cFywdnzbS+j/Y7ZnC2gdNU3eRpoPFIUu7BHvFCG6P5fmEgc+ZBpFuPC
	 G992r1fyIGiOfcf8zdcrpV8QX22XI01d6RQx8OkT4KWibQ+BCcAfLR9pcAZNHAZYy44pq
	 PjazW/puBYEdYGWBrVLPS4LRLu/7qxpSw7HIHhnylkD/9eZvemQeWF+Kk4z+ZEtIQBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ILf6iwf8;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7EE8606A31F
	for <linux-tegra@vger.kernel.org>; Sat, 31 Oct 2026 05:14:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7EE8606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ILf6iwf8
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3a4b3ac8fb7so903187a91.0
        for <linux-tegra@vger.kernel.org>; Fri, 30 Oct 2026 22:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793423678; x=1794028478; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JV84msgXUJaDxvG1g2Xeu1J3+jfzXhZ4gyQkFLKAo20=;
        b=ILf6iwf8V/VJobhvhGdua6Qwd6lsSYAvzoTQnCNUwG2/1ESqujzI7L/t6oZx7WAe7M
         BtH6QUWd/bR35qMsw0KgMTvkoV7nMRhc9fB9R2LVDJtyjGx0lqjTTgLLbNvkKd6OiUQm
         aElcg+8ZaG2jgg6L6H4UU+g+8OORO8zgb1p/9IdSBvVlOwJRCpAsb6hqvgyPJdvZ8OXm
         QqNno2uRF1rNA7sS0H6DgeSpmrNzoASIFWyMl2D91UTC/1YDaIVPY2+dq4qqQHdt8PYW
         SfS6mHmboeSodbvO91acJ8lgGEoMEsDOJBhkDTI7kwRwsj4zR0Pgrq9t3J+0RlrIAnJR
         PFUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793423678; x=1794028478;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JV84msgXUJaDxvG1g2Xeu1J3+jfzXhZ4gyQkFLKAo20=;
        b=N57kKRaHbjSQvF89WL1LVH6OUHawMaWDX5KWFR6vt9bJst9QgcMt/qA66k77/+KrBJ
         DxcnHzkxYlYSzrsBln+6qvSmYQ2IJFf3l+zgGGUoTCMAVV23/5rkcELKWeKujMC4XdGX
         3d20hBX2CGm/tkkYrj/srqKw+7OMYMTmOm8GLuB1o0vFjiWgFhy0o3OcxuvVIKPH9FFw
         U8/TdYfbUs0GmnbAjJIA1gpdx4Uo/mq5e57EVa8+CqcDC8EZKWv9PRRaQLM5x8JaujHQ
         pYB0XgxLiZSBja33mFVHnuzNX7CS7+oLdBic6LUj8VaUusj5P0+jwAqHfJ0MCRcHVDoM
         rEKg==
X-Forwarded-Encrypted: i=1; AKwUvBypJkq+2Kf69+ZmQ5oOy/A2H+eu7vGIiacgqzoR/fYsCsOwf2LVhQN75WOy80h+hcZQHmPnPP3Qjc+ENg==@vger.kernel.org
X-Gm-Message-State: AFq9FYLYLoFVuU8K612MobfYvMoYoPpflJPacAe88ckkrRyBn2aUzGwd
	8bOmzD7uolQjNwzJ7tOGJwCFjYTBnQQ4BGNVQDO7jKdwnmqWd8AW0wuX
X-Gm-Gg: AYBFou3SDk8roaTZE7Eq5FrRnEeK4efdywKd/EgaQGcm0IK9vHtSGazLTqX4oauxbL3
	B2qDxe5HMV/XBiv/KWPiUokDMvQE4giN+8XCw7oRv77RDZAf8hmDnI2Ewjzedf4pFKa3nTQgPTt
	HcQPm17Lx2PINYrG5gNd0t4ZHX/sBy4Jtmeg1s46ocShNqsBkd5FRIgYfn2b/UjN/s/vlg9ZEfG
	HgaJh+wwmbZySPjrEcp+c6BEayWayS8RQlIX1OtUvuFyUnhgzVNFyS1+3eFvtx8+jbEFEu3sTsG
	74tkOwVv9Sw5+GBXhZS/nlB2mLl4ULoy9H1jqdlGFkAjufMNW0qucfNT39y4U0/i0RlY9UDHdEK
	9hrqDdke2N3U58SePXdc4iJEWDSlo3oIoLUvNWQ6BzcT0ZZQqeOyZ9WU7L/HSbh7dTPPCr0eLTQ
	KUfhK/JWHz51WfwQK1Ry2/BVQOoqJX9YqjzprqqcztdA/SOGBAodC9gcGR4wOBRFWYlNhADh8B9
	TlJg0Xn6FbOm2R1YFAEAVrBWECPj1YAzfWUXNThzBueUoTw51Opl8y1W6QAUlyJaTntnVZTENmh
	qpwAo09GGnGdatj5mrJBRfAf
X-Received: by 2002:a17:90b:4a83:b0:3ad:b86d:dbad with SMTP id 98e67ed59e1d1-3ae89747e27mr3500938a91.30.1793423678081;
        Fri, 30 Oct 2026 22:14:38 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae845df666sm6216305a91.14.2026.10.30.22.14.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 22:14:37 -0700 (PDT)
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
Subject: [PATCH v4 0/5] ALSA: hda: Wait for PCM files on codec teardown
Date: Sat, 31 Oct 2026 13:14:25 +0800
Message-Id: <pm-pmb-a4703edca61d34aa679b-v12-b75145090f6bcd7cf145-0@gmail.com>
X-Mailer: git-send-email 2.34.1
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

When an HD-audio codec is unbound while the card stays registered, the
codec remove frees its PCMs while files can still use them, and the
probe and remove of codecs on one bus can run at the same time.

Following Takashi's suggestion on v2, this version fixes both in the
HD-audio layer: patch 1 serializes the codec probe and remove and the
card registration on a bus, and patch 5 makes the codec teardown wait
until the files opened on its PCMs are closed.

Patches 2 and 3 add the file to the card while the PCM minor is looked
up, so that the wait does not miss an open between the lookup and
snd_card_file_add(), and record the device a file was opened for. The
teardown waits only for the files of its own PCMs, because the card
files also include the control device, which a sound server keeps open
for as long as it runs. Patch 4 makes an open fail once its PCM is
disconnected, so that a late open does not get a working stream and
hold off the teardown.

Cen Zhang (5):
  ALSA: hda: Serialize codec probe and remove on the same bus
  ALSA: core: Add the card file while looking up a minor
  ALSA: pcm: Add the file to the card while looking up the minor
  ALSA: pcm: Refuse to open a disconnected PCM
  ALSA: hda: Wait for the files of the codec PCMs before freeing them

 include/sound/core.h               |  7 ++++
 include/sound/hda_codec.h          |  1 +
 include/sound/hdaudio.h            |  1 +
 include/sound/pcm.h                |  1 +
 sound/core/init.c                  | 61 +++++++++++++++++++++++++++---
 sound/core/oss/pcm_oss.c           | 19 +++-------
 sound/core/pcm.c                   |  3 ++
 sound/core/pcm_native.c            | 37 ++++++++----------
 sound/core/sound.c                 | 34 +++++++++++++++++
 sound/core/sound_oss.c             | 21 ++++++++++
 sound/hda/common/bind.c            | 43 +++++++++++++++++++++
 sound/hda/common/sysfs.c           |  2 +-
 sound/hda/controllers/acpi.c       |  2 +-
 sound/hda/controllers/cix-ipbloq.c |  2 +-
 sound/hda/controllers/intel.c      |  2 +-
 sound/hda/controllers/tegra.c      |  2 +-
 sound/hda/core/bus.c               |  1 +
 17 files changed, 193 insertions(+), 46 deletions(-)


base-commit: a4311e9447bbb219044db38897f95be112f46a8a

---
Changes in v4:
- Address the unlocked snd_card_register() callers raised by Sashiko:
  https://sashiko.dev/#/patchset/98644
- Patch 1: add snd_hda_card_register() and use it in the controller probes
  and in the reconfig sysfs knob, so that the card registration is
  serialized with codec probe and remove as well.
- Patch 1: use mutex_lock() and mutex_unlock() in hda_codec_driver_probe()
  instead of mixing guard() with goto.

Link to v1: https://lore.kernel.org/r/pm-pmb-a4703edca61d34aa679b-v6-680f350d78e44f9de7a7@gmail.com
Link to v2: https://lore.kernel.org/r/pm-pmb-a4703edca61d34aa679b-v9-c4f3df026f28aea10fd1-0@gmail.com
Link to v3: https://lore.kernel.org/r/pm-pmb-a4703edca61d34aa679b-v11-d9186d19e8afb48972af-0@gmail.com
