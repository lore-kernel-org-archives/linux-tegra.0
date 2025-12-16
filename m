Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5499325736
	for <linux-tegra@vger.kernel.org>; Tue, 16 Dec 2025 10:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765880592; cv=none; b=WvjI4ZeibojAuXq0PKIVVvBvcopEwAdEDyIPdlBF5QvdMZJOcb9tM/PHU1/A4CyNWFPkp48gllTCHZDPdg6iINkyYM6s5f5mfW5b636sN0nhGbihpPczQbcrPlW2LgQz2aRA25uk4sJgIW5WlOpLI9AdrzcGH0/VZxA4+C8ah/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765880592; c=relaxed/simple;
	bh=UT9DY5CCLckA8L/X6WyKzdgV+pJLPEZiuu//aLyXHiw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=JmVFSQf/ULlyucRK71iTmlwg4v38GxlgjyDn1QEYxtO+K3jA0Eqp9LsmlKEmAZJAAJvd7Rjcw1hM+RhNhO+ZmUtew3EsPsjSRrcmgrnzIScpBFzMp/12FmzEXklLXwR04kgJ2dDhveOPothbCSHwn4bq2teNcA//2DJKdb9r7Gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CJbUKkcN; arc=none smtp.client-ip=209.85.128.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CJbUKkcN"
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-4779a637712so29537905e9.1
        for <linux-tegra@vger.kernel.org>; Tue, 16 Dec 2025 02:23:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765880589; x=1766485389; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7WDtCUommDCsmx+U/Szem2TR0e9IxHNpK+A96g18W4A=;
        b=CJbUKkcNRTeRlqwsQnRtme8/8gEE1C35GonMGxCR1h2pAJUVHbgThQMgMjmwuY/fdE
         BGnePsvPOQFxfQCPAg7zJdthrCYd3xhLUDD6PWAtGUUx0j1bgP54uCyeYoqeBieUZNIk
         N+l1yOnQyzOABPmwG/WDOAhCAR3GOGizRVZ356oEBs3kcpwQ3CVCWRPE5/hT2NkCBkcS
         OZAA6RxwN4MsmIyJoA0dYhE99iReg/vnpHfL13RdWFbAFsmBsQlDoAcCSmNK0mWx5exX
         OTnMDEGozQB3vtLXJI3ZLnceNM7zYRziZKgpWL0Cy3yjpb7LllxvYOkTm/IztD7f2y9g
         8o3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765880589; x=1766485389;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7WDtCUommDCsmx+U/Szem2TR0e9IxHNpK+A96g18W4A=;
        b=Nmh8/ljUZFPoU90yxRIJ97aXuw7JzELD5WhAGuWc8ztg2FCJvDCLY8+z1FUom/C8HI
         RA6Pgx/qwTvOSGqcXI1WDybxtfeJH21n8zAWS+p/JvPxiWcC0OJN4bkO7oDvPuBoAuK/
         YuFJo+oWNDcH6bq2LZTxRLaGk0lfETPHeeftvskn2cnn3pnl1TzRcRJJT2GFbV4hLQD0
         g0z9Bgb5giDm0eQZjHDpSHmzaaEBK4gClKYW5l8UIrxQzjEDM/1q1IP3gQHK6BZl1OQP
         bZQL02lHS+321hzmCIIz6JUAnksD5bWozVORM9TH5/mkrBzyX00UPimKlw5vTsFqu8K5
         XwkA==
X-Forwarded-Encrypted: i=1; AJvYcCUkyH6I01+0cyZpZk1dKh+ZxTX0YvhsXt8vi/yfACHSBDaqpvIq/S8V9JJ+T8ezX0hHpfGboerhXKTmPg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2ynETNjjgusD9Nx4az7F0MexrsULawTXkp62lRH5dzCYoKUxX
	EYZgoePtQtI5VgWwiXRuik9DcoCvaMiGoPcdAqGAVvL3ks0lyt8OJ7/m6c3drhPVv5I=
X-Gm-Gg: AY/fxX5mWeqdZDDhCt+leda4g0oXV0da2jtFDz/QZjlc+5Irn0KzCf2OOcUPTRXYkix
	GkM2i9cBWQnaMPqYL6PlWfs6DDefOn8wvIDIcwDVQjm4iFcgS/87wsawVfo43yMudZmQ+kSaMp5
	8RM5hwYPp5Eqmi+VYLVCQfx4EEQQEteTLq37jnVr2E8kTyvODYg2vnEE34hCLZSfW2nqNwWMqG0
	FW2OHKZZJY3N7X8dl+GJdj1/qYa0DKU8dXFlxizY3Rffw6YFSIYTilQlxSrrxhyf+VGilQNi7f4
	Jv7pE22JcsLTTkkmlBjL5xt5HasyrmXmT2ZQzTz79DtB5LZKgi1lnrKG3rcqD5o7P8cU1c7G58Z
	PuxsthU8MXVMWEogOT13KvpsOvLYHuBK2KuILqymR2U0ZYPALGTKiDNT7eQnq5JV6PmJZyF+i0c
	vYO9IO/ZTc5NNgukUg6KYPOOanUlHw3HY=
X-Google-Smtp-Source: AGHT+IE5XhIX7FjwoHBOlG97LHD5zlw8YKyqlXpbrt0WFyJR9XjjoioKL0v+cIUn6C9Jtz+qyGN+0Q==
X-Received: by 2002:a05:6000:178e:b0:430:f449:5f09 with SMTP id ffacd0b85a97d-430f4495fb4mr10395685f8f.20.1765880588937;
        Tue, 16 Dec 2025 02:23:08 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-430f984a268sm14996292f8f.1.2025.12.16.02.23.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 02:23:08 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Douglas Anderson <dianders@chromium.org>, Sam Ravnborg <sam@ravnborg.org>, 
 Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
In-Reply-To: <20251110091440.5251-1-clamor95@gmail.com>
References: <20251110091440.5251-1-clamor95@gmail.com>
Subject: Re: (subset) [PATCH v3 0/7 RESEND] Add support for panels found in
 various Tegra devices
Message-Id: <176588058797.2230787.9159942064311142294.b4-ty@linaro.org>
Date: Tue, 16 Dec 2025 11:23:07 +0100
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

On Mon, 10 Nov 2025 11:14:30 +0200, Svyatoslav Ryhel wrote:
> Add support for panels found in various Tegra30 and Tegra114 devices,
> including panels in Tegra Note 7, Surface RT, Surface 2 and Ideapad
> Yoga 11 T30.
> 

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/7] dt-bindings: display: panel: properly document LG LD070WX3 panel
      (no commit info)
[2/7] gpu/drm: panel: add support for LG LD070WX3-SL01 MIPI DSI panel
      (no commit info)
[4/7] dt-bindings: display: panel: document Samsung LTL106AL01 simple panel
      (no commit info)
[5/7] gpu/drm: panel: simple-panel: add Samsung LTL106AL01 LVDS panel support
      (no commit info)
[6/7] dt-bindings: display: panel: document Samsung LTL106HL02 MIPI DSI panel
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/06fb75e2d12ee2b24129acacace044a0ddd2000d
[7/7] gpu/drm: panel: add Samsung LTL106HL02 MIPI DSI panel driver
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/ac488854890165b55a973dab7247aa2deea9cc02

-- 
Neil

