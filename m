Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A17C91448D5
	for <linux-tegra@vger.kernel.org>; Sat, 23 May 2026 06:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779518900; cv=none; b=K3lFPwV4IBox1gZohI+ewFDSUI+jMjstiUJoYzFK1M1JIXuxo+cX0mD1tBQVoc+YZUDuUv7tbInZ/XA1MBBVtUGukohdKd4MS9jaV/9Cyz7bIvNyO9gHN5oZuKyzKLLVMeEKV/MlZidgA+sGsWkPHIYvIPwM4GoL09Nl1AqJPyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779518900; c=relaxed/simple;
	bh=OhJBIZtPSl37iTCor/8pHea1pmiMgmwQ3W0MWlsm5UI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=D6rGDaWFYTjV137t7fSHiqW2WG+7/SO2+o7KTFvrMGmAaI9qFeWT1klhgBsCXQ15iqPYR+ZPoy9dp5X8lcUWklsmcFeGJD7rMT9hB99SQhVdrBbqxhaHfKjqtRi8XuZdI1wm+0O/ZTbBZ2jcjp57iV6Q1r7/ob6Pwtqqp4VRcas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QUQ1ShLF; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QUQ1ShLF"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6870ad8072eso4337538a12.0
        for <linux-tegra@vger.kernel.org>; Fri, 22 May 2026 23:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779518898; x=1780123698; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cvbKAQfeepNA8bbLBATd/Y6PlNgiV7+B2hbMPq8f+ok=;
        b=QUQ1ShLFbRsDHw/iED4/qX5BTpySdMzjsXNV31xtfjUo6zXlGLLBtVUYs190B3/4Tk
         OzoHLiXlYzmE6os926HGB0SkFPh1y66N604yIAxouff8qO5oDg9dM2r2y+E0l5rNGfQ5
         +IameCPWAe7DqcoeLu7Pb5Ayg9DAIrgNgoAUGAL5Flf/kOcDuGMf5l/HyKaACnB1eWYp
         B1vqnFruOW5Wq9jXV12y9dEMRwJrCxSYHlRMkfW5vOZKa3V6xHW052ADz1YTVMvyOLny
         1T8+GNMiIZC8IlLdv8BjIh967DPw95NhyNzO/jrLPW4tY0v8ch0CqVk3GjEzXierfPvL
         UNag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779518898; x=1780123698;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cvbKAQfeepNA8bbLBATd/Y6PlNgiV7+B2hbMPq8f+ok=;
        b=DPuyx0isLmdZw5HB1oWVyVTw6YIbV0JXj51gbdv3UaYZ3TjfS2qzLgs/hZ5H5y/Vvt
         tMhQHJUMBO2lrKkTkuIxkqYJtJ8+AJZ+55lQpjl4RzyQRlvRqV/UvW4Glr0D4wLO5ADs
         mQ9BPHG/48+gYEbPX99i3JGbgbm8frJSLVAU8vJqhZAMg+SJp0wn3g34E4dJqR6XGtNB
         5PbAcLMFqjdrXoEc3uFcMMofgnBZMIQbOg1cvON7k7wA7AibJWXgmacsULnd9BgR9RO7
         ThrSnfkbxjofH9Jq6U8p+h79lOBOhB2dAXg9i0m0q4WY442xfJggZmWIg8swW5J/mTfk
         ey+w==
X-Forwarded-Encrypted: i=1; AFNElJ9sFfbDzg0yfInPgCH4hOJoIkJKwblsDsqls60bZlkFcuIAQxS1M1mBhpnUvA1UE1uPi5kbxUY+DtC+4w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzmK+nhdmjTpYlOMajvKCWgJtzD40bz681iZSeR8YcMsqjC10zy
	gZJpCtcJm1xeyG93yUZBTcCm8PfN3e3yt6e6rZDMhH+R8L381IzY32yW
X-Gm-Gg: Acq92OFXykEEngekgCOCTggB5GKCFRNssT8LELVM724IflFwITTbRWGGqVn1VdBdqIZ
	HRPFhHVowSk4hB2rbnb6iO8delDdXy95vGSf493PnNMEStsGycc6ig+OEnlXmfZcGg+UeOdpW/m
	M5+4L9BIpUdw1vU2yrqaoJRCJ2QAJEPkqsPwOyHot/8m3JIBl7/RZ8iODSNSt+716Fg3L9sNPhk
	PxcF9n7lLjZXEFoOuBrg3NC4eTqHfXGXNbWpaPztOfmfEQpb+KydqVRAUE2XKXQ7BVC14X2qjuH
	8byqtARL877AyVHWk5PELgbboQN/KGhnAxo2PVAYmR75wvSYUK8kEDeNRmaRizrJ1rrJLo+d5j/
	Et8wV6cTZmbouvUzwZ5Xgc/q4kZnHwYQtl1kcssXJC6WjIBBSlXM6h51MO3PXV4Fsn0XJAKAwVn
	NqAj68IRd8HrQq4+VByFgn0FA=
X-Received: by 2002:a05:6402:4049:10b0:688:e2f1:bb2f with SMTP id 4fb4d7f45d1cf-688e2f1d224mr1253439a12.5.1779518897892;
        Fri, 22 May 2026 23:48:17 -0700 (PDT)
Received: from xeon ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-688bb62b6dfsm1532272a12.30.2026.05.22.23.48.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 23:48:15 -0700 (PDT)
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
Subject: [PATCH v2 0/1] staging: media: tegra-video: vi: improve VI graph building logic
Date: Sat, 23 May 2026 09:47:49 +0300
Message-ID: <20260523064750.35553-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
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

