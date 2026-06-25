Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 044613769EC
	for <linux-tegra@vger.kernel.org>; Thu, 25 Jun 2026 08:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782376400; cv=none; b=Rmsg4uLImg9qhxE9oFUR01yzAa3S+nBAJMLCrL42g61+erqAV16A44/1emor2voiIVlTlIWOscZLe2uqlBMgv7WNJJMws9KG5ozVK0AcopDgdIuQFfqF8epS+D1onuKaVVJAkP2/OOxciwmXq8JM8zzm7HRnRymEckCvnbCSg4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782376400; c=relaxed/simple;
	bh=OhJBIZtPSl37iTCor/8pHea1pmiMgmwQ3W0MWlsm5UI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BDsipWV4MjSCydHcCgTkZv3cntGV/Iu7MFuMKSOCoaxBpBM8Yr0XbxdNGNGxVnSrlukBYg60t7A9jECHGwxd1/HJFMyCTOJqCFq4dXQc42pKreuyxQ6U33jxyiIbdk9IHk0fJzhb67t1Z5dCMaXc9Z0r+UuRw0ddaKrmDnawVVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D9Uy7fNM; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D9Uy7fNM"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-3996c9eeebeso17307481fa.1
        for <linux-tegra@vger.kernel.org>; Thu, 25 Jun 2026 01:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782376397; x=1782981197; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cvbKAQfeepNA8bbLBATd/Y6PlNgiV7+B2hbMPq8f+ok=;
        b=D9Uy7fNMFgSZ75zj7hu/L+1tDOnFwbt/PcKsjfseWVp2j8/vpA39If3IFgnT4G6NFI
         zo3+L7+xyUSBQmVUnXPuUYrz3zWikOCWL+o7GV83AbAlKd2Hn1go0c6Ko7LJ9C/kXmoy
         LcdUt1+EmRg1FkWDBXH8bwPJVHQEDJ049uD2Mqg2/fOM94Ppk2Znl5+L+2CubPfKv/FD
         Mln59zJZeJoBH6AYxGDnEKeRHObKyv3w8ycU9ElMS/WCRrUg4u8h4/2tdxJzH42h8xFe
         LRrffcy/SK7Ibl2tn1QplfyBlPwWrtUGjZ628YxT9SU7n+Jq/xy1UqpnPy09rNQJUnKr
         aN/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782376397; x=1782981197;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cvbKAQfeepNA8bbLBATd/Y6PlNgiV7+B2hbMPq8f+ok=;
        b=BIfaMCSk7UkPqxaYZCBr//IGayTqKvbON0e5Q/vNLFXlBi1Q0r/dxK2EEYHiCUpgUL
         xTV4Rh+ehUhafrmWwf1rsLsk9Ugcwl+XqG74gToJYqNiyTVzfYNk6wAVd1oAc4WLfgxt
         4oyE0b3WlvWi7La/6/GTFkUn6WlGYGrWaxK7lT7k2qTMwwKHr4Lg6AAU6cLPzl1FnNXe
         wGvnAeErpqDbYPQaym+fKzkmBsiByic0hNAHyBdSUiScTGWdGZgfrw5WlZcKximZH9Z0
         UTiYM+m4z+N34BGptJF/0zjjPsbRwv0kzAF6Zc/qapqp1qwMt60KGusb+ceVcuoFqdqn
         TH/Q==
X-Forwarded-Encrypted: i=1; AHgh+Rq/UcCyKouA/uXuXXC4V98hzCxWy3uJDgQqryB5y3OdrJDiN5wrVYFlGNzBn2eayyTMvmGTct9LB7B+CQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyNoGg8+506vIeUKHce1seiKJfyA4Q46I1IejQWirnpI3Q/GzfB
	wxdmZGEn78VP8xqtx8IJCKCxyQfJQSL8LVWNSbbcGxY5bpUSWl0bmX5n
X-Gm-Gg: AfdE7clhyjuwszU5IkSGLY7C8/rastVo74ibgof8O9ZJzDHqm47YYy/H9q9V2dcTLYo
	xK9hq2k0o9RXOM2o/Z9sDoyZYYq0pE6ZodfuweURA28HEZS3O4E09tooksrdOTyZke495I0rE17
	VBm8Jss4eur7JrMrqUa09BTJHN2AAtKqUjzglXHxO+LoQU5vVtEkHkCv8EYISKG9v9NhL0dLhYq
	yHQSB3e2w/2ApykLBuUslUGFpSxoldq+ZXGVkVYS12HxxHNAjN9xaprXYQ8yuDPsq11UP0xuxaY
	Bdv1ntYpBG0ZzKIZ4HX7+kROgzHAUExSPAHdNitXGYgTDTT57bo9b+BIAbxektj0qKeaT5SELfB
	efs9rHPLOs9B7shQSxRUT4Vk0KuhtMySYYd5ZyuQm7rOJzzAY1Sj4mJDQh6fwjcpSoMoOGTXjyq
	YvrH3msQQqruHxJwjvCzrkdUPG9vxfXcMDHQ==
X-Received: by 2002:a05:651c:893:b0:399:83a4:4f2c with SMTP id 38308e7fff4ca-39acb635f41mr4003281fa.18.1782376397041;
        Thu, 25 Jun 2026 01:33:17 -0700 (PDT)
Received: from xeon ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3999b1b143fsm40327521fa.39.2026.06.25.01.33.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 01:33:16 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/1 RESEND] staging: media: tegra-video: vi: improve VI graph building logic
Date: Thu, 25 Jun 2026 11:33:01 +0300
Message-ID: <20260625083302.71651-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The existing tegra_vi_graph_build function relies heavily on a one-to-one
match between Device Tree nodes and media pad links. While this works for
simpler configurations, it causes issues when Device Tree nodes do not
match media pad link logic (e.g., mt9m114). Switch to the
media_entity_get_fwnode_pad helper to verify and retrieve the correct pad
linked to an endpoint, rather than assuming the endpoint ID matches the
pad ID.

---
Changes in v2:
- fixed use of NULL fw pointers in debug prints
---

Svyatoslav Ryhel (1):
  staging: media: tegra-video: vi: Improve media graph building logic

 drivers/staging/media/tegra-video/vi.c | 78 ++++++++++++--------------
 1 file changed, 35 insertions(+), 43 deletions(-)

-- 
2.51.0

