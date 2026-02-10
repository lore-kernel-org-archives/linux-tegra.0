Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com [209.85.167.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88F00341648
	for <linux-tegra@vger.kernel.org>; Tue, 10 Feb 2026 09:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770716969; cv=none; b=TlOjTtIZzRZbRZfUQMXpjK4cVQ9QiIdAxdOgTvo8Rgjr6F3K25kqiLMA8mcWJMzPLYLHz/oObnFQPR++nc5MWPdSvYkAZH0gLbC+4vh1uC1nD0CmRFL5jmSt4wXpHYblUDSDKBi9RAfdaRtjzLLHCYH+jTTM7aXQ0fLDKTtFj2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770716969; c=relaxed/simple;
	bh=UUaAifV8pKmY/5z3VMyzUPljTU1pUhWWb1wDaHx/g7Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Oaohc9RcYEGom1GdJN8xOqX7Z3iUaN/9HksBklgbGuHbTmJCA3/EEPxf47XByf7pgBlTi9s4NXe6Hh1klSWl33CKGKftHM40F1VvXfqRr1t2EI6FeLDVqtJndT9CQ40H49/ZnsJKEnDHW4jgy/HtbzyeK3Aj33vOkCWozRNE4SQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RorJjAvl; arc=none smtp.client-ip=209.85.167.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RorJjAvl"
Received: by mail-lf1-f65.google.com with SMTP id 2adb3069b0e04-59e4993e008so607785e87.1
        for <linux-tegra@vger.kernel.org>; Tue, 10 Feb 2026 01:49:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770716967; x=1771321767; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5XThuayVTw6ykMsIyLNH4e1i5wnYl+TBF/gMfeuCJW0=;
        b=RorJjAvlyLGMQS3wsJrJHkbdJSYtBCpUXtUawufkNTlnKEbX4EmH3Ar5bW+z3RKVvh
         IEGmPvsR8fOux5mmK4bY46NnipR2xcCm/BTaJnR2cdlm1Mi28/9M4lP8cCHheZ6Pxkee
         2qj5BFBtSALRgGkB4+byFpaWYfHpYZkgP6eEVKwjnEPpQyWDA3yRpwkRKtE7n7Pb/G/E
         t0Mqo5kyb/ZVGIwpVmof+UK51ow2vo6WjYGvavg082B87Yxp+ePSNGj4wrVDqHaKSSWz
         1YoLwFBJZmsfJ5Wa735iOMQzVN2r6gt3olgvGr23dZLlDC1F4LsAbfER5u3gCV15A1Hp
         U8xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770716967; x=1771321767;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5XThuayVTw6ykMsIyLNH4e1i5wnYl+TBF/gMfeuCJW0=;
        b=XF6rNFpH9NHD0f1PpbrQyOYtIoi+vN6SYdZmq47phgg10bpgz5GZj4hs5wPvix7wxj
         u4DEiF3PuPj7q8VglUUKbqMKP8a+g5WcsWbOtuMYFtH8ISxfEZ5Gj5vWY4zl8kQbyek2
         BwKXycpzx/Fwz1Pd8CtHl+6/fc+iC+bVvcBBKHW0q4fws0ARzMXNIHak7x/C8v9YP9AU
         2CP0c+ONeLUfKQtdp8H4Vhfu8U3xl/juf1vhr1HqJf/rkGZVQHQiZg5Wlf7MEWkgrWGK
         PW/5ky0mKa/lcMYFA7IisFcMt5zJ03hqIQ3cdy6YXG2Yb64Q92HKGYD1sZFLCKeF7yNn
         5CXQ==
X-Forwarded-Encrypted: i=1; AJvYcCXtB5vhjKaVFX5fRX60kO+0KkT0PdTePUS+Drv1Tm/VORaKzu1vsj+0JPExgYSvNQGarmp0B7Zoaz3+fw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4Iy0xBomwF1wZMrhFssY2BgxOIV/ibjpWien/qV2LTFuLAwlU
	cqQiPLRwdmnrsg4JAUMLmhMtZB80ZSIu1JGu1pPhnPjptBYZ12ec0Xia
X-Gm-Gg: AZuq6aImYz0X8GaZkBbcMm0tBZnhvmef6bzcLMN9uUTQhNTIjdl55lowR+/TdTA+z0R
	+mr9LKHjh8qjByVgEvgwywx1qSAHnJlHXm2SHC80yStX0x6QrTVbYd+yNXuAH4vyvAWIV+X/t/+
	SZWP1V7oPU0za+oGQRMZoBRI9Zq823Co5wYjaApxfWYMenLS4eMpVNO686AJo7eYKU4K7KNYbbw
	bBr1M5jy4/yci0l6J3yQtgQHPVTK6SyQA+Vz7tv/14YGqMvqmy2+NA6wc1CK9i8vp8sNI2s9W1v
	XIgh9Dk/nf8ajPRok+xKG1t5orAEtOepKoSEQ+jj0Jc0Shyc3QruCUi66+ly0P4wsFYBNmtsaU6
	wjNKOrYBIQg08OkBqMTWY9nIJ9Ys99vAYL0CvJ4yK7oB2OsNMowPCpLthycFYmo95rU9QhQtfc0
	nX4SYPqMCcKDyB
X-Received: by 2002:a05:6512:3da7:b0:59e:92e:7d07 with SMTP id 2adb3069b0e04-59e4515a360mr4728661e87.24.1770716966455;
        Tue, 10 Feb 2026 01:49:26 -0800 (PST)
Received: from xeon ([188.163.112.51])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e44e231d5sm3191691e87.81.2026.02.10.01.49.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 01:49:26 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/2] ARM: tegra: document Tegra20 HDMI port
Date: Tue, 10 Feb 2026 11:49:06 +0200
Message-ID: <20260210094908.14276-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document port which can be used in the HDMI to model it using OF
graph.

Svyatoslav Ryhel (2):
  dt-bindings: display: tegra: document Tegra20 HDMI port
  ARM: tegra: transformers: add connector node

 .../display/tegra/nvidia,tegra20-hdmi.yaml    | 13 +++++++++--
 .../tegra20-asus-transformer-common.dtsi      | 22 ++++++++++++++++---
 .../boot/dts/nvidia/tegra30-asus-tf600t.dts   | 21 ++++++++++++++++--
 .../tegra30-asus-transformer-common.dtsi      | 21 ++++++++++++++++--
 4 files changed, 68 insertions(+), 9 deletions(-)

-- 
2.51.0

