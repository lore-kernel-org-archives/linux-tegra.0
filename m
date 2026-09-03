Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3E7D4B0C87
	for <linux-tegra@vger.kernel.org>; Thu,  3 Sep 2026 13:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788443571; cv=none; b=SZBkM+ZOwlfzltvFdP6Z1MOevSCT4GmSCPGrOyiHukqknsgvCbDgWg+qamKRkI4DUamUlEuNKT+Tx2tul8rmQ3nHCEE70aEXDq+HCv6Se4cgbPVOnRIFJWZgMblXN+tyvlyZUiLj7phT09WES7ve9p5uFeItUQa80pp200JZ21M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788443571; c=relaxed/simple;
	bh=A9tFXtu0XWRFcdfwCqDHDr5yuN/58LVPsyUpMIW1Ps0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RCRAV1hI+ybucyOczLnE8ql10hYM8fcTTeDLUdadiav9/4sgbix7CFgH7BwWRcnuvjBdAFiQwpaHpETbNpL6I4mvDETnAPrxwTujYYiTzWQ7Sy9803yUbPBiNzlHsPY2d/6qunwOJwQwT3KpaPLK8mX4Ftr+hw/p+QXoqKGdHfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BxDtd7Rr; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BxDtd7Rr"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48441a2ba14so2202975f8f.1
        for <linux-tegra@vger.kernel.org>; Thu, 03 Sep 2026 06:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788443553; x=1789048353; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=csh27SRclgEY3hCLE8xf3YTKQW4fhH5v82nkgEIQKps=;
        b=BxDtd7RrTkSLcDHlzFqae6piLIxi8lklen/ukPmCL4yQ08H/IOd+MDidvLFiQ0me0f
         QKMo5JLGhZS6WRMECBXIIr+ke0mUNF+6ktCQby+V+un0exzlbpJB62RmaUAqRWjp8EHK
         WI+FRUHf7dg30Q99Lpd6ffB3vhlaRo/cQcKzv7pDhCxC8nS4TTtLB1gI0u/tY23P/Vk0
         LmIhZ4NhcIdUtpNuwk+wGLYd/ZJqAEFY1/TEU1nShT9/1AVytLb6UvqYJwYykXmat3oI
         77w8rcJhceYhR/SRuv5uX/xGvaE8EKQGJv6NP2O7Po2oHow+sNnZG/mGNU3osD2uw8xU
         6VuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788443553; x=1789048353;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=csh27SRclgEY3hCLE8xf3YTKQW4fhH5v82nkgEIQKps=;
        b=UCzMyrbdihH/3cFhrAPAD6IfxTDioh9MwIiNc42lulg/2pEXesU78KLnLL6Lad2KfL
         X1EjWGoApLNmBO8Cvcns19HXo8F8jBFDmMwAxLBx490Np81F1GxSFLiJ1i1YgfzJ9ECB
         EatMsSMZ85zaoihSEdLPC+Z/JyZ1TPOXn7r2gNebrRksmgmiOB4gcAF9eelqT71A7MfH
         lYgFA/YmZfvwSKnReiD9xRMfWNi7qzIcQriHhyd6MNVA0K8MEIats+Uek5b5rpEqd+zq
         Qzf6KNZo/TfkF/epaTvhSFMOugWLimnbJAmxmdUaUyuZ6Z5OtNK9Vl+9zJoHqd5X1ueX
         tF6g==
X-Forwarded-Encrypted: i=1; AKwUvBxCOGhgkg30rDfb75i5Wf3jLwTi/pzLM9D3/PP49A4fMyziBIkF7S56AJIoNf85/Tzbpfa0Y4+aDZky2A==@vger.kernel.org
X-Gm-Message-State: AFuF++nw3SmRmPNzSUzd2NR18mh4DrFhsLJi94tY1WLxmRW2QBd0MXCO
	q4RekSKBX1glvYyt9SwGJWzzRgfK9o3g/8osn2Ea7wJoX1bU8s8Km0Q6
X-Gm-Gg: AYBFou0NR35C8be9W6zUem83QPaiQ8MR7n2BqJ9DuTTM3oZ34nueInIWvYALEERePeC
	IxwmGqIo+N5HQGuem4tE30JeQ93fuJ0aygunLpdphEnmY+Rkm4mU6NFIQkHLLd7371kUfdJhWfJ
	5ulD2JFibHepc4O+R/cDfkptMPeSqDiJXum/DpF7+nL453vE+VOPqDKROyltHxA7n2ShbWABwMo
	+lacH21f16zftCwfTxUMZ7eavZ9i0sCA+wocB1ROwC0ePNECGqlh0kFJTERmEH1Yc4PTrnIwNFJ
	PAA0Fd/eB4psnLtQuQ0CtsqOAzNmqD3nRtPjVYuOluVAB8UqUKUfcyBqFoivp2aWi7UOiQ/HcIQ
	vtpDxAiLP+042aKf5Mf6V4xbIZBF0jpxLHy2eW0KXUI7QqcGjDbrim+qySS736DWQTAEd4znO0R
	+Kf2tk+lIDTcJUoL/ajvuU2qnJGKeW2IDxt2v9HRdIHtZnOEIQb0RSg4+ZaSReCGlDG2Hsckg06
	VdeWmRB8/l6xd3VH2Y2TTTNYfAMgdYpWrCn8dmzPxnlH3j8dy0uul/eDyyRpQ==
X-Received: by 2002:a05:6000:178e:b0:483:3695:6ea6 with SMTP id ffacd0b85a97d-48488f1b111mr21280968f8f.20.1788443553101;
        Thu, 03 Sep 2026 06:52:33 -0700 (PDT)
Received: from chubuchnyi-ThinkPad-P1-Gen-4i.tail30ebf2.ts.net ([158.173.155.197])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448ed2edfsm13597771f8f.23.2026.09.03.06.52.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 06:52:32 -0700 (PDT)
From: Aleksandr Chubuchnyi <chubuchnyi@gmail.com>
To: Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aleksandr Chubuchnyi <chubuchnyi@gmail.com>
Subject: [PATCH] MAINTAINERS: add Tegra CSI bindings to TEGRA VIDEO DRIVER
Date: Thu,  3 Sep 2026 16:50:58 +0300
Message-ID: <20260903135058.2598642-2-chubuchnyi@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The tegra20 and tegra210 CSI bindings are not listed in any MAINTAINERS
entry, so get_maintainer.pl does not match TEGRA VIDEO DRIVER for changes
to them and reports neither linux-media nor two of the four maintainers
of that entry.

The entry already covers the VI and VIP bindings, and csi.c binds to the
compatibles documented by both files. Add them as well.

Signed-off-by: Aleksandr Chubuchnyi <chubuchnyi@gmail.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index fc320b373..e4f50fe24 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -26924,9 +26924,11 @@ M:	Luca Ceresoli <luca.ceresoli@bootlin.com>
 L:	linux-media@vger.kernel.org
 L:	linux-tegra@vger.kernel.org
 S:	Maintained
+F:	Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-csi.yaml
 F:	Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.yaml
 F:	Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vi.yaml
 F:	Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vip.yaml
+F:	Documentation/devicetree/bindings/display/tegra/nvidia,tegra210-csi.yaml
 F:	drivers/staging/media/tegra-video/
 
 TEGRA XUSB PADCTL DRIVER
-- 
2.43.0

