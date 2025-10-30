Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0405F287265
	for <linux-tegra@vger.kernel.org>; Thu, 30 Oct 2025 19:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761852014; cv=none; b=XuDMv669OdgkYXQMzLZAR19OOO+figyrdBIE2lzQWNU9QF2LlQ6NBAZFcjvQH/yS3xVM56JOOPKZuXISHUJQplqvVLJDhwuw+N/PJijT+GVGGYRin2bRtRgQz76+B6alT9zRAgjTOuo+JdWtEWz71fRG3Bpmxw+lC2P3l5YZKrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761852014; c=relaxed/simple;
	bh=uvGLWAD7YvNIuJ0MvRPzwUPKzwhryoM8bP/baMyhO9U=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=jwOLDHktl+gAZf9FhFC9oUddQhosI4oPfgnQ59dfbRRGwEVDE/83WgFMoSjvorrZUkGgTDMb2sEtcH7kgeWjBIAEwCBEEqkL7g7zAWYP+uwBBUUapvf6dB1GisbHn9smAhhNGfv1ucUSixYvGyqOqkSnZXRDsQfN7mLD52n3OPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nBpvSfer; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nBpvSfer"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3ece0e4c5faso1488193f8f.1
        for <linux-tegra@vger.kernel.org>; Thu, 30 Oct 2025 12:20:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761852011; x=1762456811; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0cyBTO8M8YFuORRFk75Qrt/oRKDykE19qoN11SVtGXc=;
        b=nBpvSferuyTDDoJ9t9XaMAaxevPEM7jVDmKIYiak4ShPC/WVeR1sew2fQqRARW8Hr0
         82DL/PDhaBYgslROyorhz3VOu5p+dtAXaPkE/nOWEexY644t4JsUDYYJPoua7n184QMB
         +CkYeEg/ozgWjk3+fUGyQdafl5qksCjsdt7cerc68Wcr7W+lge1OMLwpWOXNO2VSr28b
         k1iSBL8jEisFbmHU+NpXjjXe9KeRGkBrDy4dGizwcud/ttDAys5xpiBVFpn7SniC4Efx
         9CTRztRm999Rs5x+zfHJwr/75e6Q5rre3YBenMt1Q4BNKOmoLY3YjbmwTG9EDYhcqZGs
         eA1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761852011; x=1762456811;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0cyBTO8M8YFuORRFk75Qrt/oRKDykE19qoN11SVtGXc=;
        b=YXQx46IkZ005NNqQXwX1HL8sn5Gd6a5r4BPVg1BVCx4+if0Rlq/IZ3/qKD5Ugo3omW
         k58KhKNFMIRXvorvPFjpLIGWYZ+lX2Xu3D4OM9gqvNlKv2rZ9jHZ/A4rIyRv5TV5B9T/
         ZRopX1KE6o3qaCbco5KV7KFVwFTcv1DSWfqwLQtQtKCVTeA52RMAt6DpHpKdscRBfYTc
         0kQSxebDrtqZolkdYC7K/+J5nehCw1Y8lGiDZKqtQi/MJP+ng53JkSbkPDEmSJLUbvKh
         bUWbj4wEj60lDoayWPWDyjwYB6HOuYNhmwQO05oOXR7O993j1G+RHZ6Y5x+alHCxZZ1M
         uXcQ==
X-Forwarded-Encrypted: i=1; AJvYcCV12H1VigZ0QSLbOaiRh9/PZJ789Fg+sQAyTQNLu0cYeQ4t0nTwlBvuIgfnGE/apwObIIZ0PzDOulGWcQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7ecXsunmr/yd9QEVe/aL9NdaoE/N6AwmjkdSmY/ek+yUJthaT
	qBZdXw0W0T8sRmGvf8/ueMESj+FhjT8jncFrWZl0LdeXoA/OhTs2DlsP
X-Gm-Gg: ASbGncs5gNQQ7E737dhtVwWtjhlfN/m8areOTbWmss+rU+OlPtFXvvL0qcJHLxD8Uf7
	TgBGrhVWIyJoGYiBENTbd0jRhdImKUzmI7wiViWzUGNUGVHIL1fKKOKVZB3BpMruwy+GBDH+x4S
	hvBA/Pk7CwH73ZCyqoH6itM3fYM2E+wBVpMgEZhQlUntaOJ3vBfFij3xJX1+RpfXElkAMcL3YO1
	t4y2RQTtvMNYi+i1TPick/ZJ/KyeTNCid9Ool3edOboE74HlCPtcv37wO1sTM2YS8TaP9IfOBTA
	ArNyPePRHqlNiR/6ZoAnbnXbEhj9EwuVwJj8hg+YbIbOMAP2k94aqMRzQ4K9vyJDkm0i0jbQxj3
	CglWUtjCTf0Lce6WbEsMpmcrAbTn7kdlEX97A62/xVWdW3JEhDujQmoJu/3SnaesHAoQ66ovVAp
	fqis7l+ro7MmywHnDhh9RSM72XQ8osRBTsu9NkujTeYBKnHHCGtSD8IZiXnW3t+P8xTxbuuOc9v
	oHtKok=
X-Google-Smtp-Source: AGHT+IEpSsbR8IVq5Rq4mjP5qqKpcNZKCRQg0psZEZaYxRf2iVNkAiJuhW6XE1AiPQEiDp8LTtGU9A==
X-Received: by 2002:a5d:5f87:0:b0:428:55f2:be4b with SMTP id ffacd0b85a97d-429bd6a4c29mr760402f8f.38.1761852011071;
        Thu, 30 Oct 2025 12:20:11 -0700 (PDT)
Received: from localhost (p200300e41f274600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f27:4600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-429952df473sm33477601f8f.42.2025.10.30.12.20.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 12:20:09 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] arm64: tegra: Device tree fixes for v6.18
Date: Thu, 30 Oct 2025 20:20:02 +0100
Message-ID: <20251030192007.682116-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.51.0
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.18-arm64-dt-fixes

for you to fetch changes up to ce121914f38aaa59504e20a1a625e5988fc6ead4:

  arm64: tegra: Mark Jetson Xavier NX's PHY as a wakeup source (2025-10-16 11:49:08 +0200)

----------------------------------------------------------------
arm64: tegra: Fixes for v6.18

This contains a simple fix to mark the Ethernet PHY on Jetson Xavier NX
as a wakeup source so the device can support WoL.

----------------------------------------------------------------
Russell King (Oracle) (1):
      arm64: tegra: Mark Jetson Xavier NX's PHY as a wakeup source

 arch/arm64/boot/dts/nvidia/tegra194-p3668.dtsi | 1 +
 1 file changed, 1 insertion(+)
