Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AF9E23BCE0
	for <linux-tegra@vger.kernel.org>; Fri,  7 Mar 2025 16:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741364619; cv=none; b=Rhv2VJaMI3kz2Vte4tnZ2HzV5Ilx38+LUq9Fy1JeqxhPndlp2FylqxWFKFfq+eOko8qckuuLcXG/RHPEjlAo0DgvAhO3/B6mKYP6l/8FJrD9+VrjFf9PufcoW6r/rlnR5/IjEHKOVtfLBWVV74/+C0C8E/8uJKtgcw8g+gX1+XY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741364619; c=relaxed/simple;
	bh=r5MarquICTszAhxnmdhb6rx3NaXRVJ3u+/mVlIeOe7k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kXVNzAcdogRdJl9ngWelkYsy8oyIBFBwHd8bfKGrWs4wd/E95e632udgvoodx4OKBhU9pkJqkXBmMWSDI04m9rMvKcxN9wksRAbLhS5aWGOA+YAA5zAYi5TJiM6KpqdAdDvldDEsS/La8GyFC4qktjxYtPs76qyViVg6WP+8cos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R+uoVSs5; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R+uoVSs5"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-390f5f48eafso1128283f8f.0
        for <linux-tegra@vger.kernel.org>; Fri, 07 Mar 2025 08:23:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741364616; x=1741969416; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bC3W5Jgyz8sK+kS8zy3FrVrbANi0rcZdKDzcMLG0QyM=;
        b=R+uoVSs5FvdTMyhtNmvFzIoboZOv4ohzTRWLW646/heCZ9styPUVk5+Ystwevc2OqP
         eLl31dGw1JUU69VDyQeKhNy0EwboUsxL1b8bcMYN4NWfYiOYMv5SVBaCPTJctsE4wbT2
         4o9//VF5ai1eS3MFd//kI0YbjKzk4NfZJapEzSrJFGgAy6/7jQxxsbC8BtoCc1g5Qfcc
         vJif3QkwrTwaCMmN8Z9Y6iHtVcn5nNhSHl+pyVLFvZaiKPg5uC/20WKCvZsSg42Lm6b3
         Wo5D6BXBq85PtMEj7ICyv2GQuYSVktwHAkhmbsZ/TT4fVuwA0ffWHDOv2kvdJ2Jo+8BL
         WDUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741364616; x=1741969416;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bC3W5Jgyz8sK+kS8zy3FrVrbANi0rcZdKDzcMLG0QyM=;
        b=PUnr5h2RWqhpXjw3ZX3EuYLQzOv9/IbjXt+3b0hzstOOILi+9EOfVGaKYvKpPahRGZ
         6vvKjJrEjfhbzLjbfV6iz2CsCdwmswA83t7tngwdL6u15asr46aQka54tm/cUTJBnS7X
         FYdgDLdt0oOoG+E1nN6xG9x4hju+no3uAl4Z2eTV9uWq+0Uevl67Bq1YRT+CDYs5PCb1
         eA2z/JoZybqx3blGWwruA17lhWJfve0+6syhDcfOyd7MKYDiqRWA4EI+uKjyB2ho8ZoD
         GLf16qRtd3eSft0T/GhehDJNw8Rf5vo5L7c3mhGnO+ixUkB/wvGiTPr1dcTrWRxJjrEL
         ryoA==
X-Forwarded-Encrypted: i=1; AJvYcCUZ4NEk3QnPSYSl5eVhHyeMrn9BdPK2gdPRpkZf1h0xMH1tzgU3C5F7qEvf7e1lM0plNxV92UBxmz6k3w==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywwsx1lYyTlmfIkMjvocw9rLOcRC7aI4KYzYHDRNoqlH7Js37TS
	s4SxJKghDCaf7+bUQn2FyOQtu4iKx3EoIjStj6VG9YLQ9i8a63KY
X-Gm-Gg: ASbGncu4y04Iu1w/pbXxg4jOy8NH9OXnwIc4EWlmHcqNbmiH/YDKF/q3tIPuMJ1qzPt
	c+k0/nmL1VYzma9KZGrF5FUHCMQfpfmmroALsyRm8gm+T5Y7jOP3es5Hoprw+wu7Bzl+dhtGrH9
	UhMuxoFzypF2tqtpzKIKjZYDyEDqKgY1LvjxCVvOjmVKPqRTKkYGzzMFms7UdqzDyEAvFC2v667
	1mKg5oUnsURC1rB7M+Kzq4xh3IJWyLWUD2fB1WkLN0k40JdI9ghLN9V9K8fQvr8V10VmCs1leVt
	zmFDyQUskBtSZm2LcG6otIj13pY0HH0mtsBASdVEu+KDIH6KOm/b35Y2pUfDQVq91VjT5N2argi
	6l5v+o0hhF4/JrATAFrF1ay98MXV9YIie4oRD
X-Google-Smtp-Source: AGHT+IEebjr3w9CsyhbfSL8ojkUic5W+TW8hWHGIa3t/IyTg+mTMNhqyhq716AMCymk8pTN/S5VM6A==
X-Received: by 2002:a5d:5f45:0:b0:38d:d9bd:18a6 with SMTP id ffacd0b85a97d-39132dc545dmr2401035f8f.42.1741364616020;
        Fri, 07 Mar 2025 08:23:36 -0800 (PST)
Received: from localhost (p200300e41f3a9f00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f3a:9f00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3912c01567fsm5706991f8f.41.2025.03.07.08.23.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Mar 2025 08:23:34 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 2/5] firmware: tegra: Changes for v6.15-rc1
Date: Fri,  7 Mar 2025 17:23:28 +0100
Message-ID: <20250307162332.3451523-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250307162332.3451523-1-thierry.reding@gmail.com>
References: <20250307162332.3451523-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.15-firmware

for you to fetch changes up to 27321c788b3aa238af3c3234dc722a30b62d8dcd:

  firmware: tegra: bpmp: Fix typo in bpmp-abi.h (2025-03-06 20:02:26 +0100)

Thanks,
Thierry

----------------------------------------------------------------
firmware: tegra: Changes for v6.15-rc1

Not much to this except for a simple typofix.

----------------------------------------------------------------
Zhu Jun (1):
      firmware: tegra: bpmp: Fix typo in bpmp-abi.h

 include/soc/tegra/bpmp-abi.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
