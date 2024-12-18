Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF305126F1E
	for <linux-tegra@vger.kernel.org>; Wed, 18 Dec 2024 02:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734489874; cv=none; b=o6844Avt3QJFeQYAmwf8iHfFNQ+p4wEsXLAmAcARZurM3xvhi3LWX2kAhgCjHV6BiAZCXfVCiomzyMKM+qjJnFqJBd1psPLpYOOq36FJ4OwMd+cEmPqwheqfjuS9xnlCNj/wCXg7Ek4K1eezc44gBgXY6+C/7nMLy41t9ZDRv6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734489874; c=relaxed/simple;
	bh=GENCROprsD76feshP6Pd0iRpMCWbe08bVlP7Y5isDYw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=IyqPMJhzZlWfUgZGde+Vl2B+7kUgweVUo29HXPKbUmAR0le5iSmog8cAWa40HgOnG9qEIIt5v+lCOgUnvuJOew7RmUB99MIn4eAF/CobRK+e3a9+sWEiM2LZxsqOsDLFYrEuGDzOIvghHP83RRNeaDk/9PyftvnGLUxomSET4QU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=pf.is.s.u-tokyo.ac.jp; spf=none smtp.mailfrom=pf.is.s.u-tokyo.ac.jp; dkim=pass (2048-bit key) header.d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.i=@pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.b=MNc1VZRS; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=pf.is.s.u-tokyo.ac.jp
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=pf.is.s.u-tokyo.ac.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.i=@pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.b="MNc1VZRS"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2161eb94cceso40362295ad.2
        for <linux-tegra@vger.kernel.org>; Tue, 17 Dec 2024 18:44:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com; s=20230601; t=1734489872; x=1735094672; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WK3IYQHMPXyHReN4RZlWtf9ewev4V/lP1Xtm7F9CSAw=;
        b=MNc1VZRS3n9qtgA28PmzmCsjowbv4n35DxZU0KQMrLtCVdpW+6xU6nCMiZvdtRiPY+
         elPN5JbyKkMHqpFRXCAe4M9oxWou8voOFJG1JElaFvHpNMvGQAfJPBCkl409rMkLLiwV
         FYHS1YIOz+6gDhJH4wJL0dMtIsdWbvCd2bJAu/qnTz9N9LDDVdTJIpbWLixZ5ngIKLCK
         ASS56HB8fbcJCSjSNsr2V4YsA3LB9QXWIwfZ18KN+C5Q6Q+XpqJhs7OM/cZe82GLQXTz
         nfYG1m6ov5H/u9g/hJ6iCDte3IVmdjWBoSHHsaJTipf1l5kcKAVRkBuKcPmOoJtcdM0A
         nD9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734489872; x=1735094672;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WK3IYQHMPXyHReN4RZlWtf9ewev4V/lP1Xtm7F9CSAw=;
        b=Bi/GQxe2ifKdbe+s6o5YMUOH70wFbAGdT+k+7Ws8FcWmwetQTzkJq3kSSZx/UKRCTz
         S4+8Ro1z5+k6NBoQrlW0BDJJtPDvtSMI2lyyDz0CXDVWrIabUzARvzSktBhkYr/Cfs/O
         PKa0+YGff0SifC7egBb+GUrCinhHcXGtgv2seRCOinZWQD1KQlQy0DYBcLI5gslypQju
         Fwn6AmJE+o7fX3ldjZAN8I/E60WQxq7+5Fp+YYML+icKsRaUeB20taP3k3ireYjPOwSz
         hsgIm5N5AoAqVD7A2/st+2F6v7aVuYd2MiC2FwliRthd5OxhphuUqjHoCqa/hhBD5li6
         LiNw==
X-Gm-Message-State: AOJu0Yz/t+a8d5Hb2HXR9ZKbN4tLKWb8klagiWKnTp0JdQJfNF9ZJjDu
	O/1Ri/7gBO7HL9cDm+Ewr7jLkctiE0ur/AAD1bN1WCHw+DFwtVFtvyzgMoGlL5s=
X-Gm-Gg: ASbGncu3wFe42Co1EpuDEyZKYGa3WFpaBoMSY3rlr9PX3tlORRQ7d4oLFRIfGYd9dN9
	lv+Rnhlco9QxIhk1G97QqDcTN3Jr1wg3t8rfqUcfY+XnDudBNbU5kYUMTbNYCbsihy6mKJoiIhH
	Y4WqnWEYUWMU5rNOZ2Wm9GpMr05IFlq4RupY97Z/KId3/FT0p+x6+Cwev749hRK8gQfGvOvGvyO
	H5KJX5wIZGafHHty9oSg/FuxoeKGqePCWL9KXyqmGJxeB2/ISfG/9fyMlqlacoLFhRq4P6ms0qN
	DshC/DIFehyHNz5HnhjL+1nasucET13eJ6onQ0aGF58=
X-Google-Smtp-Source: AGHT+IHZGLfKxZPr06D+RD/a9uEZ78MBrs2fHC8A9lsigeKBab26GdXGQFTvvruhezvKacRvBZoYFA==
X-Received: by 2002:a17:902:d50b:b0:215:6816:632e with SMTP id d9443c01a7336-218d725bf5dmr18168695ad.48.1734489871889;
        Tue, 17 Dec 2024 18:44:31 -0800 (PST)
Received: from localhost.localdomain (133-32-227-190.east.xps.vectant.ne.jp. [133.32.227.190])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-218a1e64085sm66229375ad.233.2024.12.17.18.44.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 18:44:31 -0800 (PST)
From: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
To: krzk@kernel.org,
	thierry.reding@gmail.com,
	jonathanh@nvidia.com
Cc: linux-tegra@vger.kernel.org,
	dan.carpenter@linaro.org,
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
Subject: [PATCH v2 0/2] memory: tegra20-emc: fix an OF node reference bug in tegra_emc_find_node_by_ram_code()
Date: Wed, 18 Dec 2024 11:44:13 +0900
Message-Id: <20241218024415.2494267-1-joe@pf.is.s.u-tokyo.ac.jp>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series fixes an OF node reference bug in
tegra_emc_find_node_by_ram_code() and utilizes for_each_child_of_node(),
reflecting the DT hierarchy.
---
Changes in v2:
- Split the patch into two.
---
Joe Hattori (2):
  memory: tegra20-emc: fix an OF node reference bug in
    tegra_emc_find_node_by_ram_code()
  memory: tegra20-emc: reflect the DT hierarchy when finding OF nodes in
    tegra_emc_find_node_by_ram_code()

 drivers/memory/tegra/tegra20-emc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

-- 
2.34.1

