Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A873521A4B5
	for <linux-tegra@vger.kernel.org>; Fri, 25 Oct 2024 15:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729868761; cv=none; b=HiZQlFm+fjpNvZtYafvCYTMM98m0JwIDr54dFq04QMMby8eUnt4KWDmI1keMeIDJyLfBWeVfeSBCR+yfr5mSEBRxnTJfs52fditvio1rG5XEE3nidBlMcOdT/9DiKiFLxs6JKq1wXSrPbr/dP+8XCy8372SDvcQ0eQHp+pdJC5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729868761; c=relaxed/simple;
	bh=4yUalD770YGcCi3aC/tYZ/6aDhy4qrpg2LX3Mvo4ljU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MlRc1YAx2CEp5EmMTqtyhWx5pKHQbI13p5Euv3g/gSfl+hYRFKXt796wfwGjYYnsqOEM9PjB4Si0awXzE8xoyuBz0yk3mkRLRll7Ijyt1bvEkFKuXiEAcvXeZ1yT73iqNGQqGIiTfv/bB1OiBTwq1V2TQYscB3+gbg/JEOR6r3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bdSRI/Hq; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bdSRI/Hq"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2fb50e84ec7so18503961fa.1
        for <linux-tegra@vger.kernel.org>; Fri, 25 Oct 2024 08:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729868758; x=1730473558; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i3N7tIFZ/AxOAsyxDDEDsOJgBWk6XC0sx5+hvyvRCSE=;
        b=bdSRI/Hq7Ahx8pPh1EANeGcYC4xwrpmfSqjPpTUTst7K588ptyRrM/Uwjs4Q1TrJUY
         MvjGlFv2Rp2CnjV1Krm5ewfMvgouevzYyTaEZZy7DPX3EYsr25uhdNJ2HBlTEY9rmkRH
         V+om1bg4S92Rp3N7VF3SU52DMYmfhkKE8ifmsNUZP5yhTCL9tSfHB7Nl3Xe4hv8zz8G2
         uUmdgzJ2pBUV0squs6rSgQ6JYTZ+6jbYx2NAQB4lPAsf/LNzPPABuigGxXS3KrBL9HkT
         ei3Dtqo86OJWHvLpj3GxEk70CMZppyJ3LELYSNPru7EFRnhlsq3JtRdL34kdh6yT3ete
         nJTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729868758; x=1730473558;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i3N7tIFZ/AxOAsyxDDEDsOJgBWk6XC0sx5+hvyvRCSE=;
        b=JNAToN4YCAKKiU4KxSna/PoNcQGsOLnARMo0Txz4Opxn4avvpONoxck88/8Y2VfH0n
         ex0aFkzsseb9W6ZMSSIE7ZR2wtAqm4XAnyzJAb0kfMO3AbvUhdY9HCWpws2R2O8rwRaV
         e/HmdhkDyQuSuL7hxYtxEu0FFGr049JaSAco0xTEcosEvbHDxLc/aJjKn2gaw5A0K202
         fENwIfNBhLIdy/pi+xE8hcY+mnDuQR430j8uWFuRsKpDR+0vd3rlvesnKoMtW6WRljXQ
         g5OnQGNgnMIxs7dt8uoeeOWbQ4t/MTpSPaU9sdPOJMZKxhKmOHTgH0zPwxaHamwR2OW4
         sVMg==
X-Forwarded-Encrypted: i=1; AJvYcCUktrHt8jiKA+KIw93wPRng3bh4G8jJ9YzqlN5QZmTihpOmTlRrle8jiOU77bMK36r2pRj3voXye8zjPQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxQopk7FsaLOQc8N320+jJAM4d05/CqeXO/cz5ZwjZpZf4ESjIX
	znrg5Cec8moHyg2BkcFq+TnwwAIO4mIv0dsa4TVC/wqPoepvfxFO
X-Google-Smtp-Source: AGHT+IFrsZWEoyBnhS3RPaZ5Zmw4dvGHO73/aCwUsgK5sZG6dgINNxsk3Az1YMPxmoJf6izmtskC8g==
X-Received: by 2002:a2e:a9a4:0:b0:2fb:2b5d:215d with SMTP id 38308e7fff4ca-2fca81c1cc1mr40595521fa.7.1729868757321;
        Fri, 25 Oct 2024 08:05:57 -0700 (PDT)
Received: from localhost (p200300e41f26ec00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f26:ec00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4318b57b472sm52204835e9.43.2024.10.25.08.05.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 08:05:56 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 2/3] dt-bindings: Changes for v6.13-rc1
Date: Fri, 25 Oct 2024 17:05:52 +0200
Message-ID: <20241025150555.2558582-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241025150555.2558582-1-thierry.reding@gmail.com>
References: <20241025150555.2558582-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:

  Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.13-dt-bindings

for you to fetch changes up to 1f451e2493a66345aefd13490d058e46dc25b459:

  dt-bindings: arm: Tegra234 Industrial Module (2024-10-21 14:53:37 +0200)

Thanks,
Thierry

----------------------------------------------------------------
dt-bindings: Changes for v6.13-rc1

This adds documentation for the AGX Orin industrial module.

----------------------------------------------------------------
Dara Stotland (1):
      dt-bindings: arm: Tegra234 Industrial Module

 Documentation/devicetree/bindings/arm/tegra.yaml | 5 +++++
 1 file changed, 5 insertions(+)
