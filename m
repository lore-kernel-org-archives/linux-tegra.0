Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FAE0480960
	for <linux-tegra@vger.kernel.org>; Tue, 21 Jul 2026 10:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784628686; cv=none; b=Ft9nO5IjhhhgLBVoECP7rD7fgCaqGtCSIEWc8nVNf8ALbcp9VxoxTSOvxn1yXgMjZPsJsLj7ZuPZpezlfjYC/b2jIZgniV+gTSGKut5SnPID6xI+9k+U41qrZsa4hA7leWsL2vAmMrN3aIXuZQZtFxClQ34Is8C8kObdePDyfCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784628686; c=relaxed/simple;
	bh=gXNJqaf+zTctXL5WLgdpGYeFG2qxNG2Vh2hV85r/k1Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IB6837v/4b92uWQlH2AfNmikFbAQUtCnjjHWLf+5wtYbVFn2tApxNsBMTcivIsL4DTXQgD7AVFAGAZY0anu+VxzF5HEAnlTTbJwJTwzRnfbFgG99JPdevWqi5Qay4HWs1tvLjqZVHlGccvKPPesInZADLeHzCcoz/RcZgXiovnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=svj53zPm; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="svj53zPm"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4954a9e8490so19734065e9.1
        for <linux-tegra@vger.kernel.org>; Tue, 21 Jul 2026 03:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784628681; x=1785233481; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GL48HhqEqA89OWX1SNNRwvNWdwLXSktQBg9CSPlO8sc=;
        b=svj53zPmGgsQQomAM3SKz6UktBhgsIGXco8OB9gm3mNaz6nHxY40tQ4guxNVLTpfQe
         H0lTG50dg3E32tm8/migoqNTnthSUTkzMfyFMBPvKL1xd8ox3XaXEiIIBhsL2lOzEGGX
         ty1dmNwyXK8Pt7v7pgIv08r2ReTQcWJFs6IlfjQqukmMG+eEyb1R6SYVnk8eW/H1mfJH
         9VzXYOYQAGOj8lIX2MdOyWzpdGQRsDRjEwAxnDRLSUt6mvfHgoe8RLi3EYO5hvvKlDBP
         w2UtU/DWmqJJ+7dJDXkdlvzbedwhAkh25lx1PyHT9edwH8el8J+wA5llqtcIUUdDuKpd
         TqTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784628681; x=1785233481;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GL48HhqEqA89OWX1SNNRwvNWdwLXSktQBg9CSPlO8sc=;
        b=g/yTNHQzE50D1u3iDuuGHWQLvaKQVuXb8rIg6vNt+1pZ9vKNmSGU84+1bYLrb96xu0
         fzZAe9K/0vtA5SXTYWOHK19gIkEAAj9PX6gIebMHEdBGXGyFWQkEXTjyLtruvHGNFG3X
         tgEkQ6I3xMpmVRCVpDmg4kQNpo6n1XxhONxXb305RB4XQTidUYKLO4hd9M76wp8l4Rpj
         bcvkiAU2x4H/gUwLgXqD1DdOufMm24KzxV4TbDc5hiUPDKGTPZEN4qn0h3r6fUNvBmaC
         ImnYqogZ/XAsUiuJRF7oXKWCgf0Eru6QHdpVivWL4xCNmZv6HyBLAAP7/c2CttOxteNb
         hOpw==
X-Forwarded-Encrypted: i=1; AHgh+Rpopq/DdaGIopmMU9NPtdVMUZtfPbItOz78qxJfclfw6IjHbfP0NbZpXsHEp74kqsYxLVBwnQwg2jD+4A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyuUuVRIBcBDmi6LQ206Kk4HsgsiveWW0SoJlbFkTX37WSBaGdM
	NaRoigyn1Q8bDSxWz0j9yARnIHu4X3NoNXmbmI5Ev+jQl4oFHpkqePTn
X-Gm-Gg: AfdE7cmGTogoz0drzjKi19HFgaHXp0gWHZcwRY4s1eUtvSLKFE0wjjw0CTFQO61qrFr
	+xJ+PHNoEkbw7m8KgbOo3Nsl/YGcruK1rhWYmOT0Ac03k0M9ZBgSnFG83bV1mQlwPiBTo0hhBVM
	uflG7EqGCaHNmqw0rAZXXy1k6Sj5bszix/EdWmkHi3CNLt3DjvlvrtOnPMIz8cOugFAiWp0aflM
	AZ99N7YAQkAKpMuxxX1cbDzbXrzkrR2ro9G0G/k9549yC+ESraOybHP8HjlhboMkjgARTsrLsEK
	eke5W9owIbizBv4LM0/yL6yeBS+U1+g/YwYfCs4Cak+Ioi9UiI+3vRPRLUMFIiWEJlF4obJj/Lv
	hf8NPrloAWPMGutouiQtzlSdZ/gps1Nf3idQryOMexmWCXsq76rL4yqo0wtre1UbS/r2hq1OYP2
	bJmjYuwUKn+cyXekMbJGxufyY=
X-Received: by 2002:a05:600c:3b0a:b0:495:6022:5a23 with SMTP id 5b1f17b1804b1-49560319f6dmr71655465e9.19.1784628681221;
        Tue, 21 Jul 2026 03:11:21 -0700 (PDT)
Received: from xeon ([188.163.112.51])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4956547319dsm57127085e9.5.2026.07.21.03.11.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 03:11:20 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 10/10] ARM: tegra: tf701t: Add chosen node
Date: Tue, 21 Jul 2026 13:10:59 +0300
Message-ID: <20260721101059.451699-11-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260721101059.451699-1-clamor95@gmail.com>
References: <20260721101059.451699-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add chosen node since some bootloaders may require it and add stdout link
to UART-D to simplify getting kernel log via console.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts b/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
index 0d182fa5c1af2..1b9839a855610 100644
--- a/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
+++ b/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
@@ -26,6 +26,10 @@ aliases {
 		serial2 = &uartb; /* GPS */
 	};
 
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
 	firmware {
 		trusted-foundations {
 			compatible = "tlm,trusted-foundations";
-- 
2.53.0

