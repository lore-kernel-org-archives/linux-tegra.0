Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CDCB16F271
	for <linux-tegra@vger.kernel.org>; Thu, 24 Oct 2024 06:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729750434; cv=none; b=spX6fmXIUkRgv1Xs/l+JhDxzuZhvBG3IBtERb4HRogBeYQYl4htB8VX92FP8qSqxK0lE40Pv/87nSfQEYtQgpQ0ZNbHXOap5NpzuSn0qX+Q5CvTjjL3UtVgYIop0yvUVOrn5wNNDqY+uLmEpLAdhFZZcoPRrqtoUznn+YD7UqZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729750434; c=relaxed/simple;
	bh=bx6oz5UN0v60eFR0Ae6VB5459qU8Yv/1xhOqtqjDU/w=;
	h=Date:Message-Id:Mime-Version:Subject:From:To:Cc:Content-Type; b=ngTq2zZQowZ2UKP9LatJNbZamU3cLtEiyh7n6azIVsnrwAYX1PlkvoJyBRycC/1+SMy6PFKF8kUMVbozHNWdFFfljif18DifWPmM32cRUXb5pORMyM5MiXOWRHh5UlCVg8qsZ3zgde5txinQtyluK1NTfb/qV3SFZc+lejCn0ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--saravanak.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=v7TnAZac; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--saravanak.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="v7TnAZac"
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-6e0082c1dd0so11561407b3.3
        for <linux-tegra@vger.kernel.org>; Wed, 23 Oct 2024 23:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729750431; x=1730355231; darn=vger.kernel.org;
        h=cc:to:from:subject:mime-version:message-id:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=55/hvgYNWdvBpZX8vS6a0ZNEj9vu+ZIZIEdADHyK4mM=;
        b=v7TnAZac8G5rPsf1wpI6ch3JtkuWyEDFEudT09tUlL0icZ2WUign1gwnW3zxZpqqew
         PR/gqI9WRp/Z2korFEv3zSeV4w1apQHuF1pKyFA81IADHm6i3FFumjYQwn2u9LwXYunz
         ph6fIVJjkrkLjbp9n2MbZcxgfe9Lr0sUjNq4QnAVPMaglGiLhdz3s95P0TvfaMtIYWHB
         p7lytQVoESBoc2FBfYWCGPfI5JkvhP7iNsTSOzUWiNRh9O0x8uY5PtJ+MWKoCkMLr8N0
         /MhbJUHCvQMCJUuXl372wgwJukYufD8NFE17371wjPHkUSihOlfhYHR5yNHWPwViCmM+
         BCMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729750431; x=1730355231;
        h=cc:to:from:subject:mime-version:message-id:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=55/hvgYNWdvBpZX8vS6a0ZNEj9vu+ZIZIEdADHyK4mM=;
        b=QaHcrLPzm5IG63sSPBUe868qG/8GQsn4UUiEN316llyt4Mp8qYEfzi3fSKJeyPOSY4
         5ZCRXTGR61VNZTnKbP3sIW5cvYd28zLoW6t6DuCcNhg9vQRJSmX3AoFMKWV/qOIWF48/
         HqCFxKDQeiiWn2XcMYvPb5Sjxn9v7pVum6NTC26HolMHqTtT7lxfVpuhI6vImtzIaFR9
         3ip8tcoEI9BCzVSM+PcBSaIW36EgOTYNbQqddKY9Tisqw5YWPlCC4efnlyk/B4VBuVzk
         eUekP0yzQIxbpfquqIz0xZ3MvO1l7zhE9TOcqqYaVNbVIWXSWKx5iW4JDt3TmDQmROnU
         FlHg==
X-Forwarded-Encrypted: i=1; AJvYcCXYb58qTt3/E7iWAueq4BELAvmfEoKJMO+xhY08ZUgyMwmXTjfEKrid4xIauhY9CbkBz2KH806Jr1puwg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywofq273gfmf6djpRW3k0cA7njP0ny5HXR9zvih5pB5YXv2AFFt
	tU8fJUuf/lOHBO3oPBoiyxgq5jJiLPS+XXnyZV2mdu2E7/Wuign8OzUU5MnP5SdkYASeVjodUry
	8PRHOua2PWi1KGA==
X-Google-Smtp-Source: AGHT+IEjm5xZ8oWEf7u6//TA4Kt5HjH6iFnxvFJipXmVy8asdr1VaVjmTPVebbvVpJLKuPZgRMsL7ilkx4vd+j0=
X-Received: from saravanak.san.corp.google.com ([2620:15c:2d:3:965e:f81d:c9fb:b352])
 (user=saravanak job=sendgmr) by 2002:a05:690c:7082:b0:6e7:e493:2db6 with SMTP
 id 00721157ae682-6e86632ee4bmr196737b3.3.1729750431239; Wed, 23 Oct 2024
 23:13:51 -0700 (PDT)
Date: Wed, 23 Oct 2024 23:13:41 -0700
Message-Id: <20241024061347.1771063-1-saravanak@google.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.47.0.105.g07ac214952-goog
Subject: [PATCH 0/3] A few minor fw_devlink fixes
From: Saravana Kannan <saravanak@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	JC Kuo <jckuo@nvidia.com>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Saravana Kannan <saravanak@google.com>, 
	"=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=" <nfraprado@collabora.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-phy@lists.infradead.org, linux-tegra@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

Probably easiest for Greg to pull in these changes?

PSA: Do not pull any of these patches into stable kernels. fw_devlink
had a lot of changes that landed in the last year. It's hard to ensure
cherry-picks have picked up all the dependencies correctly. If any of
these really need to get cherry-picked into stable kernels, cc me and
wait for my explicit Ack.

Thanks,
Saravana

Saravana Kannan (3):
  drm: display: Set fwnode for aux bus devices
  phy: tegra: xusb: Set fwnode for xusb port devices
  drivers: core: fw_devlink: Make the error message a bit more useful

 drivers/base/core.c                      | 4 ++--
 drivers/gpu/drm/display/drm_dp_aux_bus.c | 2 +-
 drivers/phy/tegra/xusb.c                 | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

-- 
2.47.0.105.g07ac214952-goog

