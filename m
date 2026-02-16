Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA5FB2E3397
	for <linux-tegra@vger.kernel.org>; Mon, 16 Feb 2026 18:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771265495; cv=none; b=f7SHs5V54X6WZQSXptD4zpvBqXxnZE0A5vJR8KQhEyNlEeQLmSs90S7c7/Vbd31BzTizOm/bfHDsTyYhnqLZux2YFa0FHAyFrdA7Qmb7JVepVy30Q1pHrVqWipSfLYtQl3MMEunsUi/OWWvvG38yHhSObHLHb7W9eUFv53rOu9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771265495; c=relaxed/simple;
	bh=pQ+drPsuGyEfd8K4gyjmdhI7nQ2Z+6Gl3lG1hRjSv2Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JeJh7hxfL4wkBOpYep8aTDS6eGMvTps5Duk/rdF9xNXrJPIWruiEI+d+LWnYTlWwGrS5ag4BEYfb8rCgqndcEcYro0lrGsxrGhdtKhLpuXebNIiidmg5QpbUTN7O16KqcW7hwS4968YmM9hPpEbZtVcHyzQoMAal1uVAmps+LjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=g56neX0x; arc=none smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="g56neX0x"
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-127380532eeso8719067c88.1
        for <linux-tegra@vger.kernel.org>; Mon, 16 Feb 2026 10:11:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1771265493; x=1771870293; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S5xVuS52Zc4kvewurxT2EGZa1uCwREaSBUWVrZ6Swkk=;
        b=g56neX0xHVmwJ+0VCG+jsR3XBmSjnzK66MP4cKFFjs8sovggdE/HpX5yVXXEVqSC+q
         m1kwJhyiiCjGAhmGKWZ7Ie7J6aiFFAKkucDyhGCXyzIoosmGaKvUsTg33r4BJogZdaxw
         o+Wul7VSdOK+osCl7X7VNe+eBgncj5XeNw0Ss=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771265493; x=1771870293;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=S5xVuS52Zc4kvewurxT2EGZa1uCwREaSBUWVrZ6Swkk=;
        b=QsbYtEp4iwIs78KI2jKBgZd2K7Dr42J7MVvQFk2eYiTItBW7DjS3dXHskWDK3tsH3D
         utosQkwwfzgXLA7iyYiSou3fuzwjZqK5vBNKX2yS1kalNSA/YGH6+oQ+u9oatGo6PZeS
         +dpie2qRqtnCGF8rSgGu3hK6kDXehYow5wFJL2oe/QZldciFYi7JGUVSVDCvsYKdrGW4
         Jei8o2van+Die9oP4Gmm4t13gxZkzzNewXmMd25b0JS7JHJCXOIXQ9X5ea9Jam37Atzd
         dxdIOHSp+pwt5L62a0NR6ruoaqxJ2Qwy2fgXddqTPD5dhM3H84DYsjy5KW9xEzEzwcy+
         KPXw==
X-Forwarded-Encrypted: i=1; AJvYcCXueW9QTuvGkL0IRWu8YXvI3qYiAbS4qehE/qKWitz8bWOaDEdHn4bJ6OqB7BpEkuzV6D7ZK9elezAz/w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyr+09KsaChePOP+D169q9sIKlzVAaN3OsCfAjKQCXJZqYpMOA4
	ntKY6kP3IppFzmKxXy9xhBIpv2N1ssm7OiEc55gQiqj0WMYeW3APfhvmPkG9oZSzLrh2v90UUFN
	ROWQ=
X-Gm-Gg: AZuq6aJ8xyKT3dzUnOzGdMltz3IEKLlHcrHzKsUrj3nVqkHysYJoyYpz/alq0sICud3
	hugsNhbTzB5/+UMD7e/bD5Ue+zWgOXqFKDasvoi0Ih5EBsipGf/+A0S3T4hRlIlWnxnpXPw2JmB
	/sOlpNWXd8SQV9RIBsVISpy1JNQ5nOXQMWHCjpORidKw0+X1Ij8MoThLYsxh+8pG3Eo0AtLPxDM
	2YfqywbREWBYg0to7rE7ns4O4cRe9wys45RoQIF9fnT17lU9ioe7YmbP39s/AmugsS3G754Aj0H
	lg1qW2NzlN6LPNFICcf5VAwpTdu3ldko/zOevnjSs1nfWV+PI0tbfjBXLIic/hWAJxqqr34bUTP
	HwzLFwy1jTJ1+z31EPaPSNy9W0WFuqOuluq1oa6HyzhzmO2IZztMsYiGPfEW5HsxIXccpubr9yT
	diJIybgIp2prXU3ueivfduAD0mq8HQjgp/bvP+twJ9T5GofkP+rIriGDgm2VZ4XXoDmdhJw/2/N
	cJFu4RBCws=
X-Received: by 2002:a05:7022:6a4:b0:11e:353:57af with SMTP id a92af1059eb24-1273aed430fmr4704181c88.49.1771265493018;
        Mon, 16 Feb 2026 10:11:33 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:2953:dae1:1e39:73b3])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12742c64282sm13724326c88.5.2026.02.16.10.11.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 10:11:31 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: jassisinghbrar@gmail.com
Cc: Douglas Anderson <dianders@chromium.org>,
	jonathanh@nvidia.com,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	robh@kernel.org,
	thierry.reding@gmail.com
Subject: [PATCH v3 05/15] firmware: tegra: bpmp: Use mbox_ring_doorbell() instead of NULL message
Date: Mon, 16 Feb 2026 10:09:42 -0800
Message-ID: <20260216100943.v3.5.If1255977439f4cdbb3193f73f90a784566254f15@changeid>
X-Mailer: git-send-email 2.53.0.273.g2a3d683680-goog
In-Reply-To: <20260216181002.3475421-1-dianders@chromium.org>
References: <20260216181002.3475421-1-dianders@chromium.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As per the patch ("mailbox: Deprecate NULL mbox messages; Introduce
mbox_ring_doorbell()"), we want to switch all users of NULL mailbox
messages to use mbox_ring_doorbell().

This client only ever sent NULL messages, so the transition is
straightforward. We can remove the call to mbox_client_txdone(). The
call didn't do anything for NULL messages and it's now officially
documented not to be called for doorbells.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

(no changes since v1)

 drivers/firmware/tegra/bpmp-tegra186.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/firmware/tegra/bpmp-tegra186.c b/drivers/firmware/tegra/bpmp-tegra186.c
index 64863db7a715..c45ea66aabfb 100644
--- a/drivers/firmware/tegra/bpmp-tegra186.c
+++ b/drivers/firmware/tegra/bpmp-tegra186.c
@@ -84,12 +84,10 @@ static int tegra186_bpmp_ring_doorbell(struct tegra_bpmp *bpmp)
 	struct tegra186_bpmp *priv = bpmp->priv;
 	int err;
 
-	err = mbox_send_message(priv->mbox.channel, NULL);
+	err = mbox_ring_doorbell(priv->mbox.channel);
 	if (err < 0)
 		return err;
 
-	mbox_client_txdone(priv->mbox.channel, 0);
-
 	return 0;
 }
 
-- 
2.53.0.273.g2a3d683680-goog

