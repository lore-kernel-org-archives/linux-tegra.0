Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8793388E51
	for <linux-tegra@vger.kernel.org>; Tue,  3 Mar 2026 08:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772527376; cv=none; b=YRlOMkMrZicBHCqXMvtbGUyMp4T0iZPr8yKadXHbGizKNuARhu/33nok/vZl/f8jHKRklSL5aqPm1HKviuKJpLAkV1SPXHVeO/AUxuKw5fAUApKh3f02YQN040R01Lw72aQWcjo0k89fPveohaWM7UQw4ZOlv5csN02ecz0yXbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772527376; c=relaxed/simple;
	bh=IzB8EsMSPw3QzBXaG2KwfOAPPaeXySttkLghuqSdNAs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RH0QwKmMdQ8UeZfHL72MhX8AAgwpahuQQR61nv1fxgFWLYW6JZ5QbA8SCwW8x4iGOQdsBuVBrTcGW/aOYMIHSflTNlElZKZKU3XkF9m/8d6XmXTyBkx0c2F1SIG9FkZijTQkHKYn2HCvjglWkf8GKVwMGDZ2mX5jdtFwcAkMzm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fc/g0y3x; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fc/g0y3x"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-389e268a9b4so83264081fa.2
        for <linux-tegra@vger.kernel.org>; Tue, 03 Mar 2026 00:42:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772527373; x=1773132173; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pid8l3oxr/AZHZz4pdBIzX1rDMW/6jLdB7pjgw7arVo=;
        b=fc/g0y3xFpyycAlk+OdVU8lkyJNTqGYwYHpnSi6QusmaAarrZEcU/4Tzd7nEosXujm
         eJa1nP6Z2U6lj79dL0rZKSwIK4Sjc35/kRMAC6Cfz7KnZns72eaUYWaNiw6sKjs4vAO1
         wTc0yFtrztfdp/6sjx8Yz4BrSLstmGjH2V1fe3G2W+Bq8V21TMNEIu+i/WuGzuFjmBlC
         b/aCWfS8nkZHDfZKC8naZBKJgQwqGkz+SbekRRUd3LZ8UJAsS8NPCpDt4uuQQKupqygJ
         RbRBYOYW2givMifxNR5cVgQeN5MFXIWJ3AXr2xBRtYnFTp8o73FnPwSPD+DMJ/BnvdJJ
         5zGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772527373; x=1773132173;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Pid8l3oxr/AZHZz4pdBIzX1rDMW/6jLdB7pjgw7arVo=;
        b=Du6qeff7G0j9m3nlNQjX1dcBylLTwl2tmv19Mn5953dcjW6Qhvat2gVnOAyB2PFOxE
         lgFfq0e/6DZJ6Ok8ApK5fsL03rz/2PGgcstQ2K1bA3RuiSjRgyNiX1JKHCstMjVMuEdn
         gaiuMzbTAlcBsoqbnsvPNE1gCB13/hxVOdUsvl4at1ID6+9p2zK4adM31ZSVoADx7s7u
         aairX4aMRzsqa/BAe2BVGMRudf0X9j7vjVb2SLJM2PcnNQyggK5rqg5zwCn/BsWufGBj
         UVSUiTZkP4S5s5cOKjJ8nCLzeBdKYtU13PBZGzmukoQvpDZOL+BZ2wCMmS0+WQfAr4sR
         I60A==
X-Forwarded-Encrypted: i=1; AJvYcCXiDqrLvh2C+iUOfll3jtv/s6MChrAtuM4N4vj1RnrTauFwYE91VhskItxyK0OjGjI5LSvE4/7M1+eMAw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwCtJlqNgFUyQTNswEXDj/wv5A1wDAzXrYSQlCgcNVU2LzigHON
	vfhm92vc643sx9bpOMXTuBmfCtzRBaAoYC8adIIwBiHYs5Zeql1UMmJf
X-Gm-Gg: ATEYQzwk8Z5PWkQYEd4aY+ndQnfitVveogNHprrsABv1su3LidYTgbzZU9GcgXRrKeM
	7P3csBdPRBnK1UeA5ho1aHMdeDVHZnaeQUqdIIiUoEsCFoM7/lUqB8642obDNTO+Y+qeTdyDRTO
	HFuYVb/Dn3LPYL922ioPlXdWJ6N+KLS97zzPYcVSTP0YW3ZXoAN3v2TM6U1Sqr750NIlibbcRk5
	nlTe+OMhe1hZdWdpUrgBjnammUrVJAOqlef4QWMF4ohEbhF9OrZZZ6lrIw2tsd+bag7goHRdVLD
	lEs1+58ccoOrdEgbdqe45pDrMWPDzcPWEUG2TtBlHxMaKsVLcH+58IkC2zrdk6542l49AK19MWm
	ZXCXYc3LjQfJeZ+T2pF43JWHQR0rK1pvQQVWIdd0YpZou/JjP2iPI5fd8qXsNbJNZ5dkiU+7W86
	Ai15BO10jG7SrF
X-Received: by 2002:a2e:bc1d:0:b0:38a:957:a125 with SMTP id 38308e7fff4ca-38a0957a856mr72649181fa.18.1772527373025;
        Tue, 03 Mar 2026 00:42:53 -0800 (PST)
Received: from xeon ([188.163.112.72])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-389f30227a9sm32599471fa.42.2026.03.03.00.42.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 00:42:52 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Thierry Reding <treding@nvidia.com>,
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
Subject: [PATCH v7 02/15] staging: media: tegra-video: vi: adjust get_selection operation check
Date: Tue,  3 Mar 2026 10:42:25 +0200
Message-ID: <20260303084239.15007-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260303084239.15007-1-clamor95@gmail.com>
References: <20260303084239.15007-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

During __tegra_channel_try_format, the VI (Video Input) checks if the
camera sensor driver provides a get_selection operation. If this operation
is unavailable, the crop is set to 0. However, if the operation is
available but returns an error, the VI currently fails.

While this works for simple cameras with a single pad, it creates a corner
case for sensors like the mt9m114. This sensor provides the same operation
set for both IFP pads, but returns an error when get_selection is called
on an unsupported pad (such as the source pad), causing the aforementioned
behavior.

To resolve this, if get_selection is implemented but returns an error,
try_crop is now set to 0 — treating it as if the operation was not
implemented — instead of returning a failure.

Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com> # tegra20, parallel camera
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/staging/media/tegra-video/vi.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index a7892036f29e..e0961bc0a017 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -476,17 +476,11 @@ static int __tegra_channel_try_format(struct tegra_vi_channel *chan,
 	fse.code = fmtinfo->code;
 	ret = v4l2_subdev_call(subdev, pad, enum_frame_size, sd_state, &fse);
 	if (ret) {
-		if (!v4l2_subdev_has_op(subdev, pad, get_selection)) {
+		if (!v4l2_subdev_has_op(subdev, pad, get_selection) ||
+		    v4l2_subdev_call(subdev, pad, get_selection, NULL, &sdsel)) {
 			try_crop->width = 0;
 			try_crop->height = 0;
 		} else {
-			ret = v4l2_subdev_call(subdev, pad, get_selection,
-					       NULL, &sdsel);
-			if (ret) {
-				ret = -EINVAL;
-				goto out_free;
-			}
-
 			try_crop->width = sdsel.r.width;
 			try_crop->height = sdsel.r.height;
 		}
-- 
2.51.0

