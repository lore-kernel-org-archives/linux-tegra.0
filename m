Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FB84314A98
	for <linux-tegra@vger.kernel.org>; Sat, 23 May 2026 08:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779525037; cv=none; b=TZQDRdMCk8OvolAsEQ3QI+rb+mqAGGnkCKNNpVnC6H2bNciRgejDXPXlRpC+6kw5ryLorrw2yjw3ZZa+m3Kg59pB7WCi09GjWn4ooRkXKSOCEEJ2W+WSDOq58Dx8yZpWGp/kGzyFpAZfH7XHgI2Hhtg40R5XRpYFF9ERAm3QZiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779525037; c=relaxed/simple;
	bh=fEm494wmzT4RCYgvTiN2RENvJG88iZmHcUw+ah91irA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=dEqdGbj43KXno8b9iHL6mrx0Ze5bZ5whZvyftkY64IyHrxc+yutET2mAsxcr1nC3Aqy9Lqgl/Q+KnBJQQwS4h9Wvg2GK6D8kTPnCqKZU8fz+jlnEeZRXWbzYMrq3u1R/9TIVGNJRjbK//2mWg+QqEBqOP5jayd9eV9NeB3wCe3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M7c9W00v; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M7c9W00v"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-67c4aaf76ecso12986463a12.3
        for <linux-tegra@vger.kernel.org>; Sat, 23 May 2026 01:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779525035; x=1780129835; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=By6RxEVxkPMqf6JEO4j7N7w8dmHsRgJCqXPPkFDGEcI=;
        b=M7c9W00vYOZfjhS80p9r+xQ6/II83qBp3ghEm4PXDN1BIw9kr/jAL/3BtzV4iXN2yl
         cLrg8Tkzggkc6lgpnA0WoAlGu+tawJXBmLeqlTTACw4mD3X4CU7d/x9hQZ1DeNE2rYSq
         J/0VQ+v3LpsDyvXG9ZJA32dPNeeOgyjuIDh61fL3SnHWFVYNM2z73NRI1+biW92B2PjF
         /CT+IJgqD6OANK2n/QtxXVY1NppOzuBA4xapXZU2o2rEh742Wx69GFhPdra645i+jNuI
         i8z3y6V0qJbLHcjqPmHGW5j+7mcR2fGqNmlEmpqw4pPMVK/cf6XR75dDAXtphEXR6k8A
         YiwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779525035; x=1780129835;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=By6RxEVxkPMqf6JEO4j7N7w8dmHsRgJCqXPPkFDGEcI=;
        b=YGB/+jDFQH+R0NLttQt3Z5MVN+1fI7lX0t7fzcNHEoTXsLscAI97H4L1ScIwSgKhUd
         RwyWbrOoqd0ZtYPUrwnW9kUr8DvtXKoU27n79+Qi16Gwt7JK062TobyHc2Dr+dPaOliP
         juu1ixgOc7PTlo4dYP/dVU112S7ushPJtup9pA3kGWw14rHBdMzRa55xIv2qX6LOgb/D
         /iMEwgAzvL/zNMPmB/fhIYmpqiuYEX7PQh4SxejJ0OJeFgcvxO3uYIxnoc0shW2T1V/u
         XCZ3OtakIdoiQp5QmWPTYEoOboYBF20tzBTNUANOEJrGtwofs2oLlat5/kiEwNV+DfHp
         4l4A==
X-Forwarded-Encrypted: i=1; AFNElJ/h5B8ZFkN94zParCKRDSNneEhn5BkDjKTfbjHEYZg8wmk1nvbmGsiJAWRUzdvG1AuDuoEj+pnnWX0BGQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxzdCSIkTkByn0qgtvU+dmJlbzXwOpXjI1ZrieeVPZTIrQj14sS
	YuH132W1EA5MNOIyg2JY3ik+FUGyfI1a/1zvq+9vEa0BcDCrwELvKbKn
X-Gm-Gg: Acq92OG0rNx/FOpwcayJrEDLpO0T/9JF9tHcrLiQVHWe/cg5Oo0AiWx3vTPextzMT2I
	2EO+KQ5N85hakX9OCNdYt4uMPJ/NB5Vg2UUEX/+UKjBev3M6js3EL9Dm4CPYjQCnMbr/JjSOeNA
	pDHnzfkd3AwcTyOigY+k4CQNckOL1PXv76KMevRWuJDjI2lbH7SCkj5FL2kOS27Kzet+YXpyZ0j
	tU/clzXdOFJVcFISF33dGe8Ksiu49snnUf52mry8T9T5pUnLiNlWVT2/hrU/rgi3WMopmf3L/yh
	0lu/W+WS+5kYvfIWsbP9xmaO1yCiJasC7cmr1bMIRINKhpbipAtaHKL5FoO7Yh2AgE0oSwJ0EF6
	kO0UepOdktfvBiItuPwbEj83iWjyc8NAes2el/FOEjqER1YTiFPdymEABxJA2BvpYFrCyLX/P0p
	HodvFX7rXUufvY
X-Received: by 2002:a05:6402:4015:b0:672:64b:c97b with SMTP id 4fb4d7f45d1cf-6889c94e8d8mr3738190a12.26.1779525034751;
        Sat, 23 May 2026 01:30:34 -0700 (PDT)
Received: from xeon ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-688bb62b6dfsm1651856a12.30.2026.05.23.01.30.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 May 2026 01:30:33 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Peter Chen <peter.chen@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Xu Yang <xu.yang_2@nxp.com>,
	Peng Fan <peng.fan@nxp.com>
Cc: linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/4] usb: chipidea: tegra: Add external control option
Date: Sat, 23 May 2026 11:30:08 +0300
Message-ID: <20260523083013.46372-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Patchset adjusts the Tegra-specific portion of the Chipidea USB controller
to allow for the disabling of automatic PHY and USB controller
registration. This is achieved by adding the nvidia,external-control
property/flag. It does not affect any existing configurations, but it
allows the USB line to be registered or deregistered by an external
device — in this case, the modem.

Since Tegra USB PHY holds clock gating for controller PHY cannot be
handled by code Chipidea mechanism.

This patchset is a part of larger series aiming to bring XMM6260 modem
support for Tegra devices:
https://lore.kernel.org/lkml/20260511135703.62470-1-clamor95@gmail.com/

---
Changes in v2:
- separated Tegra USB into its own schema
- tegra_usb structure moved into tegra_usb_phy.h
---

Svyatoslav Ryhel (4):
  dt-bindings: usb: Move Tegra-specific Chipidea USB properties into a
    dedicated schema
  dt-bindings: usb: chipidea,usb2-tegra: Document
    nvidia,external-control property
  usb: chipidea: tegra: Avoid controller/PHY init if bus is externally
    controlled
  usb: chipidea: tegra: Expose tegra_usb structure

 .../bindings/usb/chipidea,usb2-tegra.yaml     | 95 +++++++++++++++++++
 .../devicetree/bindings/usb/ci-hdrc-usb2.yaml | 22 -----
 drivers/usb/chipidea/ci_hdrc_tegra.c          | 43 ++++-----
 include/linux/usb/tegra_usb_phy.h             | 15 +++
 4 files changed, 131 insertions(+), 44 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/usb/chipidea,usb2-tegra.yaml

-- 
2.51.0

