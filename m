Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED3E23FAE0A
	for <linux-tegra@vger.kernel.org>; Mon, 11 May 2026 13:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778507853; cv=none; b=YxM8usTNSgnNDE1XGfXGcolIKd8kGUIbXXy4ILO9lM1yK0EcqtszAJMBiBfUg68el95jK2EQDdmsds74GnjD2BSzz+O+Q/ds28n2Vwd2ASF68u01b3xWDGsyZfimxk9i2FumHobkTBbB7VwCNlUnRWHLYyMYamVuNWOI+IqKIc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778507853; c=relaxed/simple;
	bh=ibm/ZDHMWfIYB/a+JVogHL3zgQTqT1cxj2txge0qJK4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Zx23GpFCbbpGxKqnEZIleHidfgglkR6s1yBFHVrpla0tNcsgK4smWywWKzW3WXTmoN2VPz9hdbsrhZEB69TgohThvtFh+adFZtWMjMayOC2FMOfzOAWntZS8KPENb0BeKT9qr9oKCs7sIfwnVWX2XvyK/ucvUFm1vd3AiYT8S9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Oqztsxt0; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Oqztsxt0"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6746d0b2b4aso6544804a12.3
        for <linux-tegra@vger.kernel.org>; Mon, 11 May 2026 06:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778507844; x=1779112644; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+yZ2RV9klSfc79KrOIT+9nKykbDSPRLRaZkXlnlwwJM=;
        b=Oqztsxt08VSED0yBq9y7gCvbNeIQsWzh6qCP6bEWpOdaH42iP9LOw/D6fGAQi8O7pP
         8+T/5rP9lXkGXz2utuy3yO0zDbfmXhzJypfb6BgwM6PSQX0GCpNEM14v5BFNjmOov3Gn
         vxaPdFefs6gvL0p3aCWOocLQqQo5BTYQrDwktwEq8VWzDpzN8toh2+prb+Ng2NNrP0xz
         XhX00H0+39dIbVI/dH+NyThiFKEqNozZZR3B+4A0iu+cG+u6cxhhiHfjz21bwZ3E+ghv
         4ZmQ7dgxb+4CkXeqhSUYaY50vct0v3vg3gyhxjPtxPBDVISq/a2x1EKKCpekXefD/C50
         KmJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778507844; x=1779112644;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+yZ2RV9klSfc79KrOIT+9nKykbDSPRLRaZkXlnlwwJM=;
        b=HLu2yBV5peT8jOcN4R6OaVPRksrEqRmRaOOTUEceoM7XFQa+saVVAiFuuPPL5G7cef
         1MsxCxd4i3y+nvwVQKpnx79i5IlWVLhMJe8HfVL0XUZ726wJtEhwCCn6LVDBouiXFzZW
         QRQybho6CplzmkXCE/X2lfK21wpJUgo+jkSV1yZM3AbbHyXKguLrizYA2RBT/P+eurvY
         pmDTdU7nC0QrB/LqCH1LjPW8GEaqysk5fjSShWppHkkodwmL9Ys9jj74AKWKL0t3XxMH
         WFO+gez7qBxxAos0XkVjoOd0gcUGKVpDpKQD4P/5ur9pXqD9ldkBOZbmPjY5d0H2Ya9k
         bdWw==
X-Forwarded-Encrypted: i=1; AFNElJ/YKRTBijnEEu0zXM/CXfpdDzuoGtTzUUVZx2oAaSr5UpizkfO8KaD7MxCJRv5gAG2XzuBnZ+7TzHD/Lg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4VNNxfNcyiJjbrTJN11PkQokGWwcX9wHbIRnICGs9UwRn2AEX
	lNwg09nODBMA4oLCfqepyVH+yOGkdQ7pPWXK4Ko+wgOpldxDh3yZvRXW
X-Gm-Gg: Acq92OF4mOoFSZS7e0StubLOaH1AdDHSsyPGIykkOHNmjptl3uFbEYHVDYMYvJo/yLr
	sPXsHj52moANikh8Xn5Im0Fxmv12WjTC5nD+qxCVusy4SVp8DceS46z3weV4O7YmzmoKwycqT//
	WfgzlzrRTGRfufq654QjPIWtSXot5FQ00I3lgyXIVJsYsOxoVFf48sxWsyhPSEEOiiaD6zYB1RD
	5DCEbDZcY8f7wYGNFzuLy/OOF47GkV2mFX3Oa/Z0dMdBfKeOrQ7Y0fm5RV9JQnQBmoQwn2eZXV0
	5NAJrwTiAj3IKxc1XLcxQRtx1wH81JbUe5ujK106fAL97qvoB+F1fND4A2iwJYRDo1t7kCFQTwX
	MvkVPaVZItWpPKf5tqpl4JFGLnFH9AeW5EISH5aZjRkNVaRWiG543KcwiOtOGZHATnWxIuvmPsl
	fKXVJmwH7oQx58
X-Received: by 2002:a05:6402:5297:b0:67e:2498:dc7e with SMTP id 4fb4d7f45d1cf-67e2498ddc9mr9228829a12.11.1778507844261;
        Mon, 11 May 2026 06:57:24 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67ef0b3b904sm3685357a12.1.2026.05.11.06.57.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 06:57:23 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Peter Chen <peter.chen@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-tegra@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v1 1/6] dt-bindings: usb: ci-hdrc-usb2: Document nvidia,external-control property
Date: Mon, 11 May 2026 16:56:56 +0300
Message-ID: <20260511135703.62470-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260511135703.62470-1-clamor95@gmail.com>
References: <20260511135703.62470-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the nvidia,external-control property required, for example, for
USB lines in HSIC mode connected to a modem, where the modem requires
precise control over the USB bus to properly enumerate all its stages and
intermediate devices.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
index 691d6cf02c27..a13c1ef49a57 100644
--- a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
+++ b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
@@ -75,6 +75,13 @@ properties:
     type: boolean
     deprecated: true
 
+  nvidia,external-control:
+    description:
+      Indicates that the controller is configured externally and that the host
+      should not attempt to touch it. Usually used by a modem which requires
+      precise bus configuration.
+    type: boolean
+
   ulpi:
     type: object
     additionalProperties: false
-- 
2.51.0

