Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8910A42B72D
	for <linux-tegra@vger.kernel.org>; Wed,  3 Jun 2026 20:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780519451; cv=none; b=pk1nVnSPZUS1+5Wx4XioIanS/DCYYSJWZkBVg29L5x9THz6CGtlrGzlDWNmw5v3PC+vsdFPNq/ILYXJJ4555/SB+x8XH8n5tT3FfBzV5zaAMew8jFm9XDo1UL9yvvZtW8hJuGu4fo6ydCdCK2It9PvIhfsVFcxp9mtx+oj/x/FQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780519451; c=relaxed/simple;
	bh=amPURw1JjZfEDUE22gJ+bKOK7PktxrSxr1SHV7K3oHg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NPr1JiseAqwhPrtn7QneSJtkUVQHMgwBIigSXm9pdKHCT24Njh5NixAbjeKQ6s54hrZuV/BUXAImh4cFy+IbvUP4lnPjs1oP/ORoSAlb8PZPL2lcIBdqsLemqerzlRsam4n7nvuz8FpOSvf0F/mysyLdTu5RKfzBe6uo5H8ORUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I5RL9D5u; arc=none smtp.client-ip=209.85.167.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I5RL9D5u"
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-48650c78e09so823180b6e.2
        for <linux-tegra@vger.kernel.org>; Wed, 03 Jun 2026 13:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780519448; x=1781124248; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RIMHRKZ1kbgwP55bGp0c0OQ+sOxMVw/a+CoqATe1mLs=;
        b=I5RL9D5uhEAyzv9tsLU2FeMJxU9b/Bi54IP9i0s25oEq6IkiWt3wMeW96YdViiZypi
         QMTIfabDlD9IQcSkCES6tGRHJCNrtRBNrjOHnnPlJ/rj5W1jTuO6uLKufTvl4AhxTqo7
         HHLnF3x5Tc0jfyBsXetMUqdSMKBGyxxWWxaH/0Fxu7TNYRsN8DF5+39ZDetxVDUoj+aj
         Hrj1Wj5gk+XtMTrUaFqaNvmniHVHDe8VQDaEc6hHWz5RWWMF+HWNYmlCo6upyjKMbdR7
         ONK99j3x4hqqOrJTg/ylUFHJCtQP3tqpSsAyqCUEWI5aWdqpjnpuxkEjC6/0zfMXyf2i
         XkBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780519448; x=1781124248;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RIMHRKZ1kbgwP55bGp0c0OQ+sOxMVw/a+CoqATe1mLs=;
        b=lUfIJbb/dkMO3o9A1YXiycJJAC+HcEMCBOpCUiuti1tFYNoPfDJtDL1rHggihUjpN4
         OUk9DRnuoQJklLbxbZb3p5sKgGZWbRmQlrHRHDSJTrFMqgymaOqTNFbSPYW/EJT8tLUI
         ++9BpQ8fyduv1r1a7dgKE0RlAF/oRHP7biFNbIwQMBkPeYOUyK7Lt7BEhrW3nRTygI92
         me7eNNMquT8ixUbwirWHqSuoj/SXSxPY2CTbxG3acszwbz7SJHvnQIqgadbVYUUiOqS1
         bpKfbJk/uz+SEJDhfPoIN9/47lYYCStVLZsPJnho29hMWQPT1oQHiBpqoXdIX/WqO8aq
         uZLQ==
X-Forwarded-Encrypted: i=1; AFNElJ8KMlZYNnGHC/hRXdUqIu4Om3hGMNCGQFBVI7YW/kwqOIw+AFl+IiH/2NEnR/nHGdxJZWTM6I5/jrOjfg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6sr95rugMj2i7ToIS6ckS8OvSsc/+hi4mHmbvrnGZXsPTEWP2
	rxjHoOfhVyTmrDW7y1qeeM3AXGPedzKezahoxpx5oCaqWBEw0miPgrOw
X-Gm-Gg: Acq92OGPya8H9TIzazeZpKP90q/zdFGJ9EMnFYoGy3SNumMuRfeJc5nv6viZfteccwc
	eR5b5ytsRCA8lOC/v2F+TycFGmS7YhIek2wmgE7PvWtaJRSYEJGnZAuKJ05uCpeTMVFvjkGvTOr
	ljAPE/CsJRrlUnTVt/K6n9blv3l1dPxqRj4hrX9pMo1zAGPKwqACEyBPFRGdP9dsicomb5YxSHn
	nWbtuDiScb1E8BJtIS/hmS35lS49rn3r01Xl6xQZJrWLAIlP0jxCXOfsBKC490JrjqBZy9cVq32
	XIe0DExVPcaad03K+05gtI/a9erVjmM4DCdoCB9RDbCviTZt9btHvxWk01Fefgu62WIWCzkhWDU
	hEtZ5FkRWNnDg4rkV/kM6vWc97laf5zGP5beMFrVhfVQlpwxQOeJZ5lFLOXhUw7kZOq6CP/zHcw
	0H0m/axt2v7TaK75mHDagzHTqbXXLfVf+F/8L6kLnEgu9kRcMRrQ==
X-Received: by 2002:a05:6808:1783:b0:47b:bd7b:10d0 with SMTP id 5614622812f47-4865aa81a6cmr2841639b6e.13.1780519448489;
        Wed, 03 Jun 2026 13:44:08 -0700 (PDT)
Received: from [192.168.1.71] ([2600:1702:56e9:4b40:e3a9:78c5:641e:a58c])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4865b5a5a64sm2667962b6e.4.2026.06.03.13.44.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 13:44:07 -0700 (PDT)
From: Akash Sukhavasi <akash.sukhavasi@gmail.com>
Date: Wed, 03 Jun 2026 15:42:21 -0500
Subject: [PATCH v2 4/4] dt-bindings: input: remove obsolete
 matrix-keymap.txt
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260603-b4-remove-redirect-stubs-v2-4-c8c19876ab64@gmail.com>
References: <20260603-b4-remove-redirect-stubs-v2-0-c8c19876ab64@gmail.com>
In-Reply-To: <20260603-b4-remove-redirect-stubs-v2-0-c8c19876ab64@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Vladimir Oltean <olteanv@gmail.com>, Simon Horman <horms@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Lee Jones <lee@kernel.org>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-input@vger.kernel.org, 
 linux-tegra@vger.kernel.org, Akash Sukhavasi <akash.sukhavasi@gmail.com>
X-Mailer: b4 0.14.3

matrix-keymap.txt has been a single-line redirect to
matrix-keymap.yaml since commit 639d6eda3b80 ("dt-bindings: input:
Convert matrix-keymap to json-schema"), which introduced the .yaml
schema and reduced the .txt to a stub in the same change. The .yaml
has the same filename in the same directory, making this redirect
unnecessary for discoverability.

Eight instances across six files still reference matrix-keymap.txt,
forcing readers through an extra hop to reach the .yaml. The stub has
not been touched since June 2020. Update all references across input
and mfd binding documentation to point directly to matrix-keymap.yaml
and remove the stub.

Signed-off-by: Akash Sukhavasi <akash.sukhavasi@gmail.com>
---
v2:
- Patch 4/4: corrected commit message (eight references in six files,
  not eight files), Sashiko review.
  https://sashiko.dev/#/patchset/20260529052246.4934-1-akash.sukhavasi@gmail.com?part=4

v1: https://lore.kernel.org/all/20260529052246.4934-5-akash.sukhavasi@gmail.com/
---
 Documentation/devicetree/bindings/input/brcm,bcm-keypad.txt    | 2 +-
 Documentation/devicetree/bindings/input/clps711x-keypad.txt    | 2 +-
 Documentation/devicetree/bindings/input/matrix-keymap.txt      | 1 -
 Documentation/devicetree/bindings/input/nvidia,tegra20-kbc.txt | 2 +-
 Documentation/devicetree/bindings/input/pxa27x-keypad.txt      | 2 +-
 Documentation/devicetree/bindings/input/st-keyscan.txt         | 2 +-
 Documentation/devicetree/bindings/mfd/tc3589x.txt              | 6 +++---
 7 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/input/brcm,bcm-keypad.txt b/Documentation/devicetree/bindings/input/brcm,bcm-keypad.txt
index 262deab73588..33514eba0c9c 100644
--- a/Documentation/devicetree/bindings/input/brcm,bcm-keypad.txt
+++ b/Documentation/devicetree/bindings/input/brcm,bcm-keypad.txt
@@ -59,7 +59,7 @@ Board Specific Properties:
 	  subsystem (optional).
 
 - linux,keymap: The keymap for keys as described in the binding document
-  devicetree/bindings/input/matrix-keymap.txt.
+  devicetree/bindings/input/matrix-keymap.yaml.
 
 Example:
 #include "dt-bindings/input/input.h"
diff --git a/Documentation/devicetree/bindings/input/clps711x-keypad.txt b/Documentation/devicetree/bindings/input/clps711x-keypad.txt
index 3eed8819d05d..5f4514c0cd5f 100644
--- a/Documentation/devicetree/bindings/input/clps711x-keypad.txt
+++ b/Documentation/devicetree/bindings/input/clps711x-keypad.txt
@@ -5,7 +5,7 @@ Required Properties:
 - row-gpios:     List of GPIOs used as row lines.
 - poll-interval: Poll interval time in milliseconds.
 - linux,keymap:  The definition can be found at
-                 bindings/input/matrix-keymap.txt.
+                 bindings/input/matrix-keymap.yaml.
 
 Optional Properties:
 - autorepeat:    Enable autorepeat feature.
diff --git a/Documentation/devicetree/bindings/input/matrix-keymap.txt b/Documentation/devicetree/bindings/input/matrix-keymap.txt
deleted file mode 100644
index 79f6d01aecaa..000000000000
--- a/Documentation/devicetree/bindings/input/matrix-keymap.txt
+++ /dev/null
@@ -1 +0,0 @@
-This file has been moved to matrix-keymap.yaml
diff --git a/Documentation/devicetree/bindings/input/nvidia,tegra20-kbc.txt b/Documentation/devicetree/bindings/input/nvidia,tegra20-kbc.txt
index 1faa7292e21f..460b64d332cd 100644
--- a/Documentation/devicetree/bindings/input/nvidia,tegra20-kbc.txt
+++ b/Documentation/devicetree/bindings/input/nvidia,tegra20-kbc.txt
@@ -12,7 +12,7 @@ Required properties:
 - nvidia,kbc-col-pins: The KBC pins which are configured as column. This is an
   array of pin numbers which is used as column.
 - linux,keymap: The keymap for keys as described in the binding document
-  devicetree/bindings/input/matrix-keymap.txt.
+  devicetree/bindings/input/matrix-keymap.yaml.
 - clocks: Must contain one entry, for the module clock.
   See ../clocks/clock-bindings.txt for details.
 - resets: Must contain an entry for each entry in reset-names.
diff --git a/Documentation/devicetree/bindings/input/pxa27x-keypad.txt b/Documentation/devicetree/bindings/input/pxa27x-keypad.txt
index f8674f7e5ea5..a727d66eece4 100644
--- a/Documentation/devicetree/bindings/input/pxa27x-keypad.txt
+++ b/Documentation/devicetree/bindings/input/pxa27x-keypad.txt
@@ -10,7 +10,7 @@ Required Properties
   interval for matrix key. The value is in binary number of 2ms
 
 Optional Properties For Matrix Keyes
-Please refer to matrix-keymap.txt
+Please refer to matrix-keymap.yaml
 
 Optional Properties for Direct Keyes
 - marvell,direct-key-count : How many direct keyes are used.
diff --git a/Documentation/devicetree/bindings/input/st-keyscan.txt b/Documentation/devicetree/bindings/input/st-keyscan.txt
index 51eb428e5c85..fd88f40faebf 100644
--- a/Documentation/devicetree/bindings/input/st-keyscan.txt
+++ b/Documentation/devicetree/bindings/input/st-keyscan.txt
@@ -17,7 +17,7 @@ Required properties:
   See ../pinctrl/pinctrl-bindings.txt for details.
 
 - linux,keymap: The keymap for keys as described in the binding document
-  devicetree/bindings/input/matrix-keymap.txt.
+  devicetree/bindings/input/matrix-keymap.yaml.
 
 - keypad,num-rows: Number of row lines connected to the keypad controller.
 
diff --git a/Documentation/devicetree/bindings/mfd/tc3589x.txt b/Documentation/devicetree/bindings/mfd/tc3589x.txt
index 4f22b2b07dc5..a6d356e90f42 100644
--- a/Documentation/devicetree/bindings/mfd/tc3589x.txt
+++ b/Documentation/devicetree/bindings/mfd/tc3589x.txt
@@ -48,11 +48,11 @@ Optional nodes:
  - compatible : must be "toshiba,tc3589x-keypad"
  - debounce-delay-ms : debounce interval in milliseconds
  - keypad,num-rows : number of rows in the matrix, see
-   bindings/input/matrix-keymap.txt
+   bindings/input/matrix-keymap.yaml
  - keypad,num-columns : number of columns in the matrix, see
-   bindings/input/matrix-keymap.txt
+   bindings/input/matrix-keymap.yaml
  - linux,keymap: the definition can be found in
-   bindings/input/matrix-keymap.txt
+   bindings/input/matrix-keymap.yaml
  - linux,no-autorepeat: do no enable autorepeat feature.
  - wakeup-source: use any event on keypad as wakeup event.
 		  (Legacy property supported: "linux,wakeup")

-- 
2.54.0

