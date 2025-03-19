Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98F94211711
	for <linux-tegra@vger.kernel.org>; Wed, 19 Mar 2025 07:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742367955; cv=none; b=LSBo5trKye47TTn4YPpLASPoI8YcT4Cioww9HpKpMWFdHyDJcGWikO3jeR5E5KjXdMQOX7AQz28N+sxCc/i+cCMYzf3iDYVVH5mzMlmOyK+wH4sXz6URs2nXwEJst4Jl/ZX6c3h02AkTwHaQz1CN6HovZWAOma6IHyzBlxwly/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742367955; c=relaxed/simple;
	bh=NHmVxf51ccPygdho6qBOtOezUpa9NGhtd7AYhIOwcjY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UJX/AIeqq3UwowEALH44Y+nvnuwQROwBG9R3lv3NA5J9pGetxN7D0i/W777e4EM0wTxdYHXwgcx0g7v/gmN6zgb0hLTpi21mnDgM1nj+UHZ5spiRu5ynpACg0HzwFYLDbGUlVkuhlVToFQcmlAfMirEuPu0AvDknRY7kC9wtrR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=A6JEIqll; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="A6JEIqll"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43cfe63c592so45746255e9.2
        for <linux-tegra@vger.kernel.org>; Wed, 19 Mar 2025 00:05:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742367952; x=1742972752; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hWcdnlxlz3RiOr5CYldhEXdBAGdjzbvGPeO0bYglxBw=;
        b=A6JEIqllxDnqhkdDdhnqnJ+zjkzBHlqwhgKtSbeo3D7e/DO9CscKEgUYoJ3tRoSHTv
         sWnKfVNZjH9a4YsFKxSabRuwzLNUXsXb3eDEAHj5JQT1Nk7cP65B8RL5Mg4SvteG5V2c
         PouK4Q8uncax/OXIiI4LUtwty6htzmy8SJdgEjJkJ9HB3NQUZ/3DO5/5WzsmsZuwe2qM
         NIlMpL+SRMKQMAeoLIZnKdbEWh5BtGIG9oZz1RqitcNxIB4YFTvv2NFS4nMd7DIU/QO8
         MIZCF8eK+RyctZvInXcrUQxHiDrgDGSlaA3Uau6FQygnhH81HDLC8sR/1KWwbhMjjLBp
         BfkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742367952; x=1742972752;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hWcdnlxlz3RiOr5CYldhEXdBAGdjzbvGPeO0bYglxBw=;
        b=YCemujZ6gdn3uIsL/k1OfnbVN5Ysl/SBGE5Rv/nO9DYc+//aU3sIzdp88GFGvOkTlS
         TQc6gH4+lciY+2YLIIHUaJmydmboz6LbeAJ3y7Rk4spjj3554XbIwTMbIWW0gPjhmfK+
         QYZuUwc0akcCHfIbvrQR9DGZJNaVJeCBnBk7yo/jFvxzt3f6henYrdF6D/H9Y14W0pOy
         BF6QGXBeIlQ6qhx6oXnaSbXqbzQ3NCiZSw1wfnFmSXkAWFdH5YRwJZHuwt806hTqHqfY
         kGH7IbmHuGvjt+Kx/iMxrQpXq+MbAznaUpuTDl4Qq5nyub8+pzgP+kojuU0qTaH6pQiV
         SZIA==
X-Forwarded-Encrypted: i=1; AJvYcCUZEfQBDsU4m592YQYNpC8eI5qqExl8niaEW5LeRcI9zLRegka/2oJH5/QwG63EzLRl0Z7JVcxdnc7kgA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwrsNrbSImjdwGic8Cd+JF6zzJF1YskdRMD4CKqmquanpV6NX8J
	gPbT2EAUH4v1UzmxDQvKZBdEhRRz4lvPAfa5zgbh0rHPuOd5mKMSJnoYcLWRGyM=
X-Gm-Gg: ASbGncsn4qwEFgkY3SY+hVImyg2RZn9DpnV2DZUgNfef1k57z6AUK5GRm75oR16pwJ0
	nQJOaR1DlS9Sb40RaBQvIQVpNBDerJvcZVhg6gMAtYxaNJFtqSAqbg7bQZiPUZegcZxX/dk968u
	8sg2L4MbJb4NNJ9kTS1bf+VVaWXzYzK6dd9D26yRSUWgpcXRSVB3o1toCDTRtEzLU0CRrw7dNSO
	3oHlURSF8W5Ulg7EOHvJOiQKE14xC1+ZQzUpoUw1G+QVMhBryoz2VV+yPvCW6SZroepJIRnXIJ6
	5F7nU8pzIiNMhNzyJisP6H60BcSCImmo/Ng9DrZxkBqe09Wz3PSaGvTELb6Z
X-Google-Smtp-Source: AGHT+IGk01nY8D5vZYwPJQciTgqBS35i2lX2QwN2d+aG31PMswpzNbfMSH2RxcqCh5zyBjomgO3hGA==
X-Received: by 2002:a05:600c:1389:b0:43c:f6b0:e807 with SMTP id 5b1f17b1804b1-43d43869a32mr8416005e9.31.1742367951811;
        Wed, 19 Mar 2025 00:05:51 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43d43f331dasm9816055e9.8.2025.03.19.00.05.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 00:05:51 -0700 (PDT)
Date: Wed, 19 Mar 2025 10:05:47 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Prathamesh Shete <pshete@nvidia.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>, Peng Fan <peng.fan@nxp.com>,
	linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] pinctrl: tegra: Fix off by one in
 tegra_pinctrl_get_group()
Message-ID: <82b40d9d-b437-42a9-9eb3-2328aa6877ac@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

This should be >= pmx->soc->ngroups instead of > to avoid an out of
bounds access.  The pmx->soc->groups[] array is allocated in
tegra_pinctrl_probe().

Fixes: c12bfa0fee65 ("pinctrl-tegra: Restore SFSEL bit when freeing pins")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/pinctrl/tegra/pinctrl-tegra.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/tegra/pinctrl-tegra.c b/drivers/pinctrl/tegra/pinctrl-tegra.c
index 0246acba7703..11ecbd6a9b2a 100644
--- a/drivers/pinctrl/tegra/pinctrl-tegra.c
+++ b/drivers/pinctrl/tegra/pinctrl-tegra.c
@@ -306,7 +306,7 @@ static const struct tegra_pingroup *tegra_pinctrl_get_group(struct pinctrl_dev *
 {
 	struct tegra_pmx *pmx = pinctrl_dev_get_drvdata(pctldev);
 
-	if (group_index < 0 || group_index > pmx->soc->ngroups)
+	if (group_index < 0 || group_index >= pmx->soc->ngroups)
 		return NULL;
 
 	return &pmx->soc->groups[group_index];
-- 
2.47.2

