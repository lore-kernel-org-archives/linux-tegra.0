Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D77DF13AD26
	for <linux-tegra@vger.kernel.org>; Wed, 23 Apr 2025 13:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745413710; cv=none; b=pYRg/ox9Jbq/D8ZT6TuF/3bkxzxqUVT3NNptWlesj/1wSDhzJbNfR7SlgL6QwFB4JBiqwDIq1WFjCx43NX+P9YP4nob2NnGq4ZqVCltexscHGIl6EqDS/PE0tViN+n+oKBkAlQvHrnfZcir251cZIYqFRqJjL1lAi/B/FbnC544=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745413710; c=relaxed/simple;
	bh=V/euKjCcP+EuEZclJHRJqQhL8BiXIhmeGbSZ3k59g8o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=f1Edkz/meV4fB/EQt7DI6ZSeG4laUq3aYHkHUsKkgNmLc1aEFGQaqM3Ozey9nZBD7Axk00NOZAwJThjgTHrCJPeZLXfBaz60aEyzSujoVR53a3GNVaAN1t9cOfFPZDZ0FPGBCeofj0vSEmDNYYSZ+LmcCmZakdJ98PjuGdCdwl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SJzUmGty; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SJzUmGty"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3912d2c89ecso5324381f8f.2
        for <linux-tegra@vger.kernel.org>; Wed, 23 Apr 2025 06:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745413707; x=1746018507; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5aKGWU/nxQJ1g/GQXjmzKsRQAC1mEWy7RzAyyaBKhic=;
        b=SJzUmGtyqzzENuVu84/gZk73SHdxNhwQToDUfBYEUBJ/yFZmEfZ6yIkSdIhVLRyqnP
         52V7TYA52s6nu3Y5LbqZoKgeKertnyzdz1lQCPOWPcEVXzcsOCRp40AZksCoVNaL5joI
         1ELg0C6/4QP/RjHdPcvrWeipHyNTjyRfNuxH06c+2S/gdpx2n9Tx5rbOZWgpshgkRqWy
         bNuJTTgF61hxrYYIf4KKiASwZEdkVCHPC/bgv0l24ypnLgtgaBcbpeytCuhnAVJxZ9dU
         86CMsMi+rP/ycDizRebXzJopVIdokBt3d2KQ2JPnTLHRePco0IFIY8r8pYt5KY+jmIcl
         JLCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745413707; x=1746018507;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5aKGWU/nxQJ1g/GQXjmzKsRQAC1mEWy7RzAyyaBKhic=;
        b=C5guK3y9RkfbPBfsCLwBeb0Ygl4fx/tIHGNTcU1JNN10rsWIP7zVRwC1nx3+lCK/yq
         N3pMQkcKDvB3kj2EkviXZYlzljO01evExhcVW3bS2wenF/nid2J6YqBtfpAo4sFTDfyw
         6M/t15S2dBU4Dj37+L0Hf8LKQVxDexbkBL+NHiFenRPU1LDDJo/3ve15ZFCfZLrdqbQt
         ALT6BO70RZS59OWy4+PsDKjVDglMtzWzCM50heQlk3Hirv9McP1skA66pqlgEvD/4bMz
         T9g6I0KI0LFiiyJDNkNFt2TI/6/W2u7vQmjOSHavFP3cJX8HkWXe5MvyFzP7Bn27raqi
         3llw==
X-Forwarded-Encrypted: i=1; AJvYcCVtVwqkdcle3yjMDzByVC7Lz7wS8m4Y3d2IgMj3Ov7e9xNw4fIj7vbHUa+SAN5yevdk5mNfrFJbM0D4Ug==@vger.kernel.org
X-Gm-Message-State: AOJu0YyfIz25xh5lQantCi+EPqHZqToLjLLUYHlFWJDvvnGoctTjzVFl
	OPxedDScdsj7UFtt8aHP9tPlGrYyPebDm3sH8gGta0bnt1/kAXuFBFDXeoII8M8=
X-Gm-Gg: ASbGnctzktFiCbF1DJYYzvDsCm/IS2VE9fAhRQnNCqusCVxWvRvtOIoyKfCl8HfsV0R
	NbDN7MOXB+QBOJn4REwodNCTCbR3ISU0RV+7JeTwNuJO8PepiaBb6AwIX479Uj/IpyIiIbaZhyW
	jjfP9pPYc704UkAXxYEAU+9Gf1GFwnjL9ILP4SozMxB3ex+cjZcaa5JcEbzC2tJrhtD0nfVzIKQ
	WXGvAF8nyYe0WVzIqXIVEaNv4uz2ObUBJjdaRx0hCkHH4lRYZ51+o/2gg5Cmm5rhQsQ4VFb9be0
	YGzSpJi24zon62s+//7/ge2I+uarhojZj+1h0EApYW705dYE4ukJMx9D
X-Google-Smtp-Source: AGHT+IHFDE6RSxpVFbftFmRUuMMe1z1mFI84VXLmNBo24gUTBGerWwkyU/8c7yGJzERf6IPYsxhjow==
X-Received: by 2002:a5d:64ae:0:b0:38f:30a3:51fe with SMTP id ffacd0b85a97d-39efbad2f6emr13262250f8f.42.1745413707142;
        Wed, 23 Apr 2025 06:08:27 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39efa43330esm18445115f8f.21.2025.04.23.06.08.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 06:08:26 -0700 (PDT)
Date: Wed, 23 Apr 2025 16:08:23 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Wayne Chang <waynec@nvidia.com>
Cc: JC Kuo <jckuo@nvidia.com>, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-phy@lists.infradead.org, linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] phy: tegra: xusb: remove a stray unlock
Message-ID: <aAjmR6To4EnvRl4G@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

We used to take a lock in tegra186_utmi_bias_pad_power_on() but now we
have moved the lock into the caller.  Unfortunately, when we moved the
lock this unlock was left behind and it results in a double unlock.
Delete it now.

Fixes: b47158fb4295 ("phy: tegra: xusb: Use a bitmask for UTMI pad power state tracking")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/phy/tegra/xusb-tegra186.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/phy/tegra/xusb-tegra186.c b/drivers/phy/tegra/xusb-tegra186.c
index cc7b8a6a999f..23a23f2d64e5 100644
--- a/drivers/phy/tegra/xusb-tegra186.c
+++ b/drivers/phy/tegra/xusb-tegra186.c
@@ -656,8 +656,6 @@ static void tegra186_utmi_bias_pad_power_on(struct tegra_xusb_padctl *padctl)
 	} else {
 		clk_disable_unprepare(priv->usb2_trk_clk);
 	}
-
-	mutex_unlock(&padctl->lock);
 }
 
 static void tegra186_utmi_bias_pad_power_off(struct tegra_xusb_padctl *padctl)
-- 
2.47.2

