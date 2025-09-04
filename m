Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFA6F2367D5;
	Thu,  4 Sep 2025 16:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757003578; cv=none; b=jWtNvUGa0FzPMaMxd6IVrsM4uYvfeTlyQX7907YXu7Zy0GKzuxOv7FxQto3SYsxmrK5TpWDShbnpFmB2WxMJvZOxgksu5jelSTOmpyuZrbUan7K+vh0uwfGyxeIn1Az6sszWbkG3lOWfsL6oGSA71P1kzsJsTdPyK8P0AwPtd/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757003578; c=relaxed/simple;
	bh=ftKz9areG2UXCgl+WK5xyzkQ+YD2dzkonvfl/9Vsqjg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VZAeUEoXsB305Pgmd0BpCS+loAtDwujfHEwwU1mNBI7U2Hm5+W7mECu5BJYfHfUJsIjRV6z9ymr3dDPlA5gaZOGHQqyEY8TqaIAjnPvJY0fyGEOIYwEfG/FIVmYkMAdFtxAkjY7695+NFs5YwQCYJhxjZ9sP4+H4CVsGWalbnb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fCnxLFl4; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fCnxLFl4"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-55f76277413so1432644e87.3;
        Thu, 04 Sep 2025 09:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757003575; x=1757608375; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QUje5wP89tT0Hj1u22w+i/aM61oGNZhqQpvBrkRMKsc=;
        b=fCnxLFl4/CnSdvD5CFXexGA5kOL9fCpvsyhdElvcXtsnUzTK+YTP1gEe9cOblkK9Jr
         8x5KNYmLcysbReGQbRyuHHnPB0kYqHgggREkhW1HI7nAqQ8714tOZdeONAK+QRDxdYPW
         M2TqmIBHz3VWUVcQ1wfBMCHoyp8pfXbZaAe/dH9ehVidMel4qGLMwgzB/DyZ+Y2kP33l
         qP/fuIAMGMv2dNXpxDgfkrKDUFVLkqLINJV+PpYmnTWqJh63WgUpBc73ygCBeE/GRrJp
         MDkhgXT1xVoF95ouC8dWTPApUqeMmFHgcwCtfcGfCGmjX7YN5HuwWXs8NSDL7bdYDWTG
         D4TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757003575; x=1757608375;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QUje5wP89tT0Hj1u22w+i/aM61oGNZhqQpvBrkRMKsc=;
        b=A6WHvqOwKFik3mqTTZj2xyvMNbf0qohm0w39jGVdaBrQ9XKeV5pzJr+oz6gJV+KOA+
         kUUPssvY80OpPhsoVc+2+kXtEqGrSkgFKTguYJPGjI5oMWN31Vsrif3mL1Wq1tfchCsJ
         HVY1uPJ2604Jw8wqr36wKwPGN3X2jw9sfHJgypZ6Tm9v6QQb4oPI1uztQG6ou1L/iMMp
         WennRP+PfOZl78Bs9wi+Nl13BniZFt7yXHCikv+ee5alDlIu36xxje0DkZKvewuBkSPV
         U0nwZFvAnTDRBJvFKyvhfG4+c0EIHaLGlmoYYeEpiP2cs7H+bLEiicQhbTbWRCqlcvkC
         fOGA==
X-Forwarded-Encrypted: i=1; AJvYcCV7D8Dag/2drJHjyH6wceEXfpmxvyCTf8d/ZgFQKNNi6ViPENNEzC4uS7ZAFYoJwtf22VDskPDiz43ZOG8=@vger.kernel.org, AJvYcCVIPp0YzL6JexJUFNyWVoUwW2E0wFaFVw8VXkpoLr3rJoF0Xdm+mNLcE52xjJQHei/t1FbznePJz5+bDhI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxkcZqAJAT/zqX9sMXdmnWUo2/+EGOkV2Wv14nDwpMHSLbBoWxY
	emPFbx1+f/DG9oU8E+67MiNnPkxG3XZYiheoc+NyQ3oRdwwVoBR9Py7DkRvhlw==
X-Gm-Gg: ASbGncs6oF0vX5IvDZb9fZDrJkGQVmI35idVDOYJWe3E+JpzO2d1Bz7hrRnzRPAo/8p
	pnrZ683b8xFxiZv+6ankqm4yvTuIUYcTifRflFcBgz5o0vRfOFp+y9yugHV8MdJQ/r2oCqKAgmQ
	Ac3Gw/xBrE9b26jR06eNEBOB6bWDkul0+6a7OkboW2AnePrURtds1UV5qHWP0n7VLfEgAx3J9C2
	UQkeljGk7Dgg9PdYSkM1P4mylBs1+FaRJVCm8a9PDMMMl5+f9SDwcvKK/pGL2xmYDfepWiuy24L
	uHJjsfeopvgISBOzpDrkYirc3H68iG/boojkzbNdas9Ib7PLWO91jiCCt/5sQGJ+f6Kcjm/Q+ZJ
	dr5Hdz1X7dTeSJw==
X-Google-Smtp-Source: AGHT+IE3ejIeTzYeHjE6eJ93hwOAa5tQhO9o/cvdtTz+DDjTMDPLMA3fA/DBwy/bDcJhAywC+fg5+w==
X-Received: by 2002:a05:6512:689:b0:55f:43ab:b214 with SMTP id 2adb3069b0e04-55f708b1ce4mr6857818e87.15.1757003574708;
        Thu, 04 Sep 2025 09:32:54 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5608ad45889sm1272978e87.138.2025.09.04.09.32.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 09:32:54 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Dmitry Osipenko <digetx@gmail.com>
Cc: linux-usb@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/2] usb: phy: tegra: add support for HSIC mode
Date: Thu,  4 Sep 2025 19:32:36 +0300
Message-ID: <20250904163238.238105-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for HSIC mode into phy driver. HSIC mode is supported by
second USB controller in Tegra SoC and is used for connecting modem.
Linux kernel has support for HSIC mode in the controller driver itself
(Chipidea driver) but USB PHY part was missing until now.

Svyatoslav Ryhel (2):
  usb: phy: tegra: use phy type directly
  usb: phy: tegra: add HSIC support

 drivers/usb/phy/phy-tegra-usb.c   | 304 ++++++++++++++++++++++++++----
 include/linux/usb/tegra_usb_phy.h |   7 +-
 2 files changed, 278 insertions(+), 33 deletions(-)

-- 
2.48.1

