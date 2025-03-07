Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AC1023AE87
	for <linux-tegra@vger.kernel.org>; Fri,  7 Mar 2025 16:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741364622; cv=none; b=ppDYv+UZJlm6yVRNXkM5zMYWp7k+eOO58yBhVFHA2nNFb8fn4MQkXetkcu1gFN/LJ74xQSweVw8F4iXLhd2jzLsE4w6T4aPcm+Vq9koXoSbw3kCzrQOiAyraa0XLWxkw8YQCURbQ/QwmvQDlwmt2ns2RImetkmhKCMwVhQE8YqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741364622; c=relaxed/simple;
	bh=JllnNiKS8zG3HJ2XF6CCeGT2FpX04hKkXy+JOLQltvI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=I/oIoHooWzhnRR4F+vv/vBNNgm1mXbErf3aF0JsezJwqKmQyr9KHjkY8CJkQQ/Qlr1cdPyk8FEQ3FFI54Boq2IQRBEN3U0FbazQZltjLaaiYNfWLEWrQUYX/0Z/Tbu2095wkNT3dyhrT9eiQSElmS3cFnfHPrjaKWAtL06OW6qQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cR9pstc3; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cR9pstc3"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43bdcd0d97dso12190295e9.3
        for <linux-tegra@vger.kernel.org>; Fri, 07 Mar 2025 08:23:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741364619; x=1741969419; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z1fJ6z5PudcapFlOuFM3afjcyHz5zpohcRH8pXTkbGA=;
        b=cR9pstc3XeR52eFah/mAZ7u34B1DJfjyumqcZOBmU9hb3mQ+L3umGI8EE17K+UWoqc
         QQJkjCABwtt8R034l6xg2FuRx0/wHKcYCvEAkcX83IXA92erBjSI1v/G3XBuHWwLUthm
         /lcAHg4BSHnr1nP41Bsm0fRc5kHsDnohrh+YPEV6rP62/4NW3TafH1I3i7KJ7RdZAfJR
         baAywSoXIHLBeyeg4LcGzsasO5bmLoWNQZUKX6ql0bxcBoFnHCIVADGL/Ep/4UPfo2Fq
         kdkSYBJistg5GQm5bY8Ej7qx4L5krjf9bmlEgynGSXIj+TAXEfO48kVRyYT4OPdLYLat
         hgRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741364619; x=1741969419;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z1fJ6z5PudcapFlOuFM3afjcyHz5zpohcRH8pXTkbGA=;
        b=q8J3LRp4Wvm2yQhenl+CstT7STDmmh66L+2yOoV0V8HyxXYHzdjhU7lizU9Kdg1Dna
         nOnuivG9ZPSRe6qgEp9roAIr/k3Wfq1ndSrGs9rdouT1qaykZbPuB055BbBbREZ3ofcH
         Ny364ydvvJDepqaZnD6zj8Hx0NvgEncxcRabGhYTgcaHyvRYnMZcdq1KVrOtbBtja/ao
         j0kLpvicF2ELeqFjfNXBf+/2VEuMQGRosvttgLfBFeZzTfpiKaw6Kn634V4qDF9Kso/I
         4wVn8u4CyETj0f5Wy8ISafY5WhbMCqz9BsZnQAKlebhjlfl9iSNDiFxu5puBS3tLjPjc
         Ky2w==
X-Forwarded-Encrypted: i=1; AJvYcCW8CWmPR4Zmq0y6wr6L5d1nM0w6sgkcTPSRgjIU1U4vnGFR4uli04+t5zxzbaDQFjWCs1Gm8A0Pl+dE2Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxO/WxfA2Al6vsLsEzTwCIZgwsz8hHRRADcKmcnqpB8WjksG9LP
	AR05aImHoFjRU9aeU10NWyspYgFXRpYOl7iXXovrI3KwxZ51QX12
X-Gm-Gg: ASbGncsrywgwlVYy7mclrrV9mxU5Y2yMFCFbcTJCR6G5m6N9Ol/14OBTOububCcGpVB
	Hv5YFSuf6y4H+Rg+e37IbAZz/KiakixGqTAVd7q6BaV+qfbeFRgX4dNDkvyGqhsfOdm7G4uHDJc
	ACEn7DpVk9CTUB2IyQIVCsL2ESI0Wzl07Jzov0R4zsWzoybtdMbUQWs4OnUvaWDYToI5s+yT4xo
	KAcnuEoRoRXppdmr/gswW65Eobh7R8xNoDXi3MA2+MZzbFxAl5HXtOIEW/z+etQR9v0u9nuFhIM
	y/6wREG2pv1F8l0QUN9FC1Kp7514uJjV4yg26Bn8ijlMfXuiuWYR6ujlPnJX5piTIRzG8c9i1LC
	7X20K/LC0kwUDKjApV4ZXHQwbyjZ1r7eW7iW8
X-Google-Smtp-Source: AGHT+IFkOj93xZE0jxlv4S0NKKZsz5OtPsjG2/EENZKtgykPA6URLC2WRnbzH6v95t7aU3xJAnq7PQ==
X-Received: by 2002:a05:6000:2184:b0:390:f971:4ecd with SMTP id ffacd0b85a97d-39132d957f9mr2154541f8f.26.1741364617951;
        Fri, 07 Mar 2025 08:23:37 -0800 (PST)
Received: from localhost (p200300e41f3a9f00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f3a:9f00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43bdd8dbb4csm55995825e9.23.2025.03.07.08.23.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Mar 2025 08:23:36 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 3/5] dt-bindings: Changes for v6.15-rc1
Date: Fri,  7 Mar 2025 17:23:29 +0100
Message-ID: <20250307162332.3451523-3-thierry.reding@gmail.com>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.15-dt-bindings

for you to fetch changes up to 294630d81ad65333e5d4ad3efcb82dcad6177e6b:

  dt-bindings: Document Tegra114 HDA support (2025-03-07 17:08:33 +0100)

Thanks,
Thierry

----------------------------------------------------------------
dt-bindings: Changes for v6.15-rc1

This adds compatible strings for Tegra114 HDA and Tegra124 MIPI.

----------------------------------------------------------------
Thierry Reding (2):
      dt-bindings: display: tegra: Document Tegra124 MIPI
      dt-bindings: Document Tegra114 HDA support

 .../devicetree/bindings/display/tegra/nvidia,tegra114-mipi.yaml          | 1 +
 Documentation/devicetree/bindings/sound/nvidia,tegra30-hda.yaml          | 1 +
 2 files changed, 2 insertions(+)
