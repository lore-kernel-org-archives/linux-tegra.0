Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E029170810
	for <linux-tegra@vger.kernel.org>; Sat, 17 Jan 2026 00:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768609903; cv=none; b=CBZZ5JBGMVv5+KVNJXbt9vJhjKY6iLh1GxnKmjyfA1QZMdcCSEDdO/TArpS1hxiypYCZjsYwjTqyovLhd1nT0rVuFrGMAPJazDj6HSa5bh2hUEGX5OMbS11dHV1turB9lTsNxERpzYlWUvVipDE0UHMpswVUZJagM9vDN364h6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768609903; c=relaxed/simple;
	bh=oYQI2hBpIRcvGtuZTojZuoMSi1NBy8aQgzTCzObvMzE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XEdRmMyiq1pjBxw6qxFEJnkpl6Mnpfj+vP8lA6+UPrj03bJPqqL3Erli14Di82gJB59Lhpo9wjH07ptXT7bLkLT/2akBVPfwCO72QNF2l+FCpyBGlqj5thpYXEk6o257mPOYIQbHXnbVIjKZgwyHB2t+2PxizTCorxaiIeZD/JY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z3wNVdwy; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z3wNVdwy"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4801c314c84so14068375e9.0
        for <linux-tegra@vger.kernel.org>; Fri, 16 Jan 2026 16:31:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768609900; x=1769214700; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iFv214rAmnxy+ZWfqYzxoI4aXe7hA3FW0xG43u2wRxw=;
        b=Z3wNVdwyvc69g3580tyf5fWfsc14h+xc/9Vg7PNDraGOG69INSVBA1CzQxPpB4YuJ3
         PKbJ2HX869tVWnNxczVuxy5XUMmrKH6RCTC74NzjWEyITJ8wsFDhSwVO8qFXS3h0nF9l
         zLlMXJJKycuP8R6ewUNsbElXbltaxzQP8B/ylWOmQA8B4ETt5tcgPQQS8iPBTAyRGshV
         y6qj+5YBywUuBf+KdejltrIIANh5VXj9HpnpopRWsjGMjwmUrClqhnzR5GegrUfbYKUf
         EH5Frf4yO93if/0XcU64VQiyErG2KMsxhElv0qzt8UDUcQ+yUMVwWYeaxNCTnnpLrYHq
         Z9KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768609900; x=1769214700;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iFv214rAmnxy+ZWfqYzxoI4aXe7hA3FW0xG43u2wRxw=;
        b=WULKC58nnuZts8FjuDtVNdFrBp2AZA+pfiGtz4r8UEYVyYoK5anOLDLEDh94stc/Nz
         gvqkeOiXME4JUidYGlYeEEMqc4k/IMK7YWhFVoNxzp8nmvGlXIirM0g0D0e5I/TXkBAg
         uS+s8Be3iC85nSIkHDS1+9T09VvGwzHMMJz+mMXzr0Ktm0ab/DepZcIwvUCf4qrWHMwX
         3qHtzpv7QpnywdammoOIKdEvE3SpJGh44EEPmuj4Fhzt9+R84yz2RVUPkRLtCLLd0/yW
         OQwjryhkXjKB6Hnlv+ivbwT0MvP6zqddJJbnrC+RkzPXUxZUL3HjsSB8RNdcuT6e8tLH
         MlAQ==
X-Forwarded-Encrypted: i=1; AJvYcCV//emQWuhe1coplClXxKtLYI4Mo12FUJS/EpZZW4VAAPw03Ve3Ipj04JorfiEoj+K6ecXik206Pt+z3g==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywnk9CQeAYmQHdC1uVCoS2r5WTq7pjNuu8/bnLcjWlP9ndghGu5
	JV3e75vc28hDV/ReeBeNpxwpdVtvd2bim1mytfIcEib+53n8sH3puWpf
X-Gm-Gg: AY/fxX6tv8aZJN6DNIGy7M7v9wCC1Awsi302420D5S9fKYFsK84ql6R35gzgSDrw6pb
	Xbo73QsN6qfNXosbSkTXg6lxE3GF2JTNfPXUp6m6OOaW0op1Gra0phCeeudmgdkFN2Fr1l+fgA0
	odxWvBgWx/pYDyQpYlxFlWTC5QTl2b37xJN0n4pv0uSLxK7ah+tgLRslSPyJuGefREpEjGnUf4G
	8K4RJLA+qlvZ/+54sfibh8gP87cpE2KXNXWcTwGX8tM66vAO78yxOYzBsqC0i40O3xB5XaLi5QP
	q2lYhMC2/YrpG6QFRsSBobUvB7KlWt7mJQVx5TtEBWuMmx+3EVC4So4CjMK5XxjTwHBU6T035s5
	YbMgfa/TqvHOlTMcXuqcdv+7Ov3JkusYClZYjgjJURfVHmwUwa35x/q5A8AofL3UTkCQhnZ/dt7
	6f/7bjjf3Y7WWuwqVzuwSeFM2eM6q150mkhhwBneFUzTEk9t1VlFhbI8MnJii3ki8ccohNMen3a
	GJ6zRM=
X-Received: by 2002:a05:600c:3b9e:b0:477:9a28:b09a with SMTP id 5b1f17b1804b1-4801e2a5861mr63784045e9.0.1768609900200;
        Fri, 16 Jan 2026 16:31:40 -0800 (PST)
Received: from localhost (p200300e41f0ffa00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f0f:fa00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801e9fb193sm27730315e9.6.2026.01.16.16.31.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 16:31:38 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	=?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>,
	Dmitry Osipenko <digetx@gmail.com>,
	Charan Pedumuru <charan.pedumuru@gmail.com>,
	Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
	Aaron Kling <webgeek1234@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: (subset) [PATCH v5 00/23] tegra-video: add CSI support for Tegra20 and Tegra30
Date: Sat, 17 Jan 2026 01:31:35 +0100
Message-ID: <176860988748.1688420.11717122647073678.b4-ty@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251022142051.70400-1-clamor95@gmail.com>
References: <20251022142051.70400-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>


On Wed, 22 Oct 2025 17:20:28 +0300, Svyatoslav Ryhel wrote:
> Add support for MIPI CSI device found in Tegra20 and Tegra30 SoC along
> with a set of changes required for that.
> 

Applied, thanks!

[04/23] dt-bindings: display: tegra: document Tegra30 VI and VIP
        commit: d262d030baef287da33344a932639aab5f913c3a

Best regards,
-- 
Thierry Reding <treding@nvidia.com>
