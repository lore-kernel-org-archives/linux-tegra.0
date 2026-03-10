Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41B6C39DBC7
	for <linux-tegra@vger.kernel.org>; Tue, 10 Mar 2026 13:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773149334; cv=none; b=W4BWfo6q2TVKh/PQanE/jleeIavP1Ms91XyFXAJydBVaths2t8z9acg8T0aFgoPe9TXB5iljMh6PWmLwpRqfGlkAE83Gj+dWMX975cQThxtRB2qVX+krdNS4q2caHQF3y4QXzJRXsgOx0XSHjNJvaFYvg3LZHjVglImUGuj8UKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773149334; c=relaxed/simple;
	bh=EWnh4f2+RIW4bcHVktrYqbSMYyn5qgnqLofinbb6yTc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=lC0ejLXEJVIIvmBBbx55LX4JMArjU0ly87n3288heTks6ZVKqV2YqanEit4mDUEWMFb7ICyG5L/PGvysQwwKfmesSXHIqKnu+C3Tv0PbhwyZfAKwb6UBc1Ig6rqHFwl++QbHN2nLNumXROyF16TihRmaj/CK5ecK3Gj0CgKinrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dq8Tpjgv; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dq8Tpjgv"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-48534b59cf3so21538755e9.2
        for <linux-tegra@vger.kernel.org>; Tue, 10 Mar 2026 06:28:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773149332; x=1773754132; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R4oxDm5JlYl3LzaRTTBNVDKv5682/k8Rf+qU4xWLObU=;
        b=dq8TpjgvOXlf7KUO5308Up88omHXT2m1Qj8n2wookRiG1ZMWL0QKCI8Rc2aVngMRGa
         P+yPWM9NMimqcTnSY4001RCD4HIqTzFy5PIPZi3EYZLAjNJGxmbQdPtpZthjxQKtKmkj
         P0gnekoNIGo9EnRloV9BqUOaG53CugjltbRcDVDG11jJqzxvJd6xiWAMaEgGPDd5Dkqf
         4XaIZaVQtpHu3PZOFzsFmPF40VE1oIQZkIISUCtwiLKjPsPG7LwGXt1KSRLFZZcnUFZG
         8ubs7gpS+Mqjyn2SiOZHjC49kWr3lkebAANfuEAjRXi4ar0DSwIXqbF9cg8uyxTBZPaV
         eRWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773149332; x=1773754132;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=R4oxDm5JlYl3LzaRTTBNVDKv5682/k8Rf+qU4xWLObU=;
        b=LUULdmD+ErIJx6Uw7fbde5s0ZnN1Gal8cQ9JDz4RiABap0/fAaYcI+9530P4lB80X0
         2peLTfkOr6b8PLh+4WosfyfSLFBEVVaGHbCfrlxjM1p50snY3oKrpS1MfkZFpRk5o9fC
         tU+Lfimgpg0Pbw/M4z48jd9c1cS7iIyzJSJspsHKvXzGJ2tGBErND6eFnBlYnH1hKGGm
         umSNhkwsuzOor1qMBlqxjNWKWzpbLlP1PC7MRKZ4DsqEKGJynW7N6/Ejw8TNBDl2+x/1
         n2y6JGPZPGsrHIWh0aWK+kNb7WVGEKGphASJTUia1VwA+4liAb3pTyW3qEMUcH2Sc0Zq
         hODA==
X-Forwarded-Encrypted: i=1; AJvYcCWXZOJljMSH3Du5jvcauACycTzNvuzTj1vdvv06vSUpJMmnr1Z02aLqrb4LmhacXsEU4rOupNGGz+H+zg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzPcg2XR2SnWWDLmFvtCOha/m3buqUq9booqvw+gyegj9u1MEOI
	tExuxtrMKggsvkZB49He/FBOe8bXYejn0XrhKjsxNCXsRxo5p80mczxsgJMA9UExl1c=
X-Gm-Gg: ATEYQzyJSUk/A3Omhtef2qLf23LRAkUjgdB9zk67XbVJ2lOPx7GnM+pp2likd9r466T
	sibzNyNYxvAq2IjXRPp1HL1euQYszxmWmZQw1gllU1H7DI0BWBZFdNeu8lQw0DANWXZufgFkG1K
	3SV8ArOqxKm95MWqCzWszFB26YUKt4dAheWzXWfOCa+I12Yju8jyPUNpktInoNYjO02wVn/UtyE
	pqWDA70uQLLMqgsaTx6m/hXrDgGSYR6Efn50jKIclzWdyLu4tC1zGypY/mAuqB/wFzpKmP6FU/p
	7I1/77twzwg+2Ynj142vcsHr/3DNXcRdCLQr5eV8MwKlNDAW57TZ6G44C972a12Weu79EP/wHUp
	gaOridfN7zi+lxbJIIxvEQmT/w14AAkRxQFCSmX0NFGgTsF2Csy3Huh6xX87goLaz1lVMxmE5Yi
	fXGWAHcYmYITmXk171Hcr+3KbMoo2Ar4Y6cDY41oGmT8s+
X-Received: by 2002:a05:600c:a08b:b0:485:3fa9:358c with SMTP id 5b1f17b1804b1-4853fa943demr86976805e9.17.1773149331476;
        Tue, 10 Mar 2026 06:28:51 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541b6f6e6sm132464235e9.10.2026.03.10.06.28.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 06:28:51 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Douglas Anderson <dianders@chromium.org>, Sam Ravnborg <sam@ravnborg.org>, 
 Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
In-Reply-To: <20251204060627.4727-1-clamor95@gmail.com>
References: <20251204060627.4727-1-clamor95@gmail.com>
Subject: Re: (subset) [PATCH v3 0/7 RESEND] Add support for panels found in
 various Tegra devices
Message-Id: <177314933067.2052605.5030496259952095113.b4-ty@linaro.org>
Date: Tue, 10 Mar 2026 14:28:50 +0100
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3

Hi,

On Thu, 04 Dec 2025 08:06:16 +0200, Svyatoslav Ryhel wrote:
> Add support for panels found in various Tegra30 and Tegra114 devices,
> including panels in Tegra Note 7, Surface RT, Surface 2 and Ideapad
> Yoga 11 T30.
> 

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/7] dt-bindings: display: panel: properly document LG LD070WX3 panel
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/3efe01ff79041fe64a6f6637191b69abf310fd0d
[2/7] gpu/drm: panel: add support for LG LD070WX3-SL01 MIPI DSI panel
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/3efe01ff79041fe64a6f6637191b69abf310fd0d
[4/7] dt-bindings: display: panel: document Samsung LTL106AL01 simple panel
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/3efe01ff79041fe64a6f6637191b69abf310fd0d
[5/7] gpu/drm: panel: simple-panel: add Samsung LTL106AL01 LVDS panel support
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/3efe01ff79041fe64a6f6637191b69abf310fd0d
[6/7] dt-bindings: display: panel: document Samsung LTL106HL02 MIPI DSI panel
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/3efe01ff79041fe64a6f6637191b69abf310fd0d
[7/7] gpu/drm: panel: add Samsung LTL106HL02 MIPI DSI panel driver
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/3efe01ff79041fe64a6f6637191b69abf310fd0d

-- 
Neil

