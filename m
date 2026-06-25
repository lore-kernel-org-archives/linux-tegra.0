Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E1EF32B13D
	for <linux-tegra@vger.kernel.org>; Thu, 25 Jun 2026 08:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782376266; cv=none; b=VdtZwJ+CM870aotg0B8xXdxgtGcDs1XKwvAavJ2sVB3Cajw4XswgXQey6YgriXZtGRWwIogk2nedAz2rjaZuzJ7vrKXKgaZEpBCqYhSModKp3gqod+A9srwZv7KzfRwuxahIcQ59Q7bJ+uHAtWDwGa+SFy5fCqf32sNI+3sVQjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782376266; c=relaxed/simple;
	bh=BNG/Nt3+CmK9Hyh4BW3hQ4JifMYdLAzHQ5ZifotMSIw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=UihxeKg3lBArFL6igGJP/r2GlQtlN+mTTpC2peKAxYVfHY4P/p/pkf8cTmnaFZ0404gCTklqUDVpJU3AZKkQClYg6DSdcPb1W4wM+O7JFT779RBRrGg+L0OtIyM1M/MC4mN1Pp+tODNRnZETkFLXOVHW8jB1YH/bktmfhZDN3Co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UMjgh/iD; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UMjgh/iD"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-39ad1d2555aso1789871fa.3
        for <linux-tegra@vger.kernel.org>; Thu, 25 Jun 2026 01:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782376263; x=1782981063; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tIxTISlKz5zUY/5EeJFoGXkyj7v9D4tIsE5w4iprCUU=;
        b=UMjgh/iDhc66XPjTHTkVbLtVtaN1n7Povul80tlU/5fjW1pTtSDsk8KiIoqR1xtN6E
         6C7GcsJAeeAEzyyd8uh/jvokZ8xfDBqx9zgGN4A212HmQX/20kCDws64dktlei0z1aIi
         iKBrUbPdTR9iYobMul1ZekRAxV60yJnkj3mKvHEL1kWhAsKr2AIBPHWkCUKlPk1KyWk/
         xUkPZ1XozMWWestuZ4fbFyd/pmjAUTwRxFKXW7nGD5KuFwueTag581ETkOU/wr2hrlrG
         7MWQnvjsrPecfjjOKEVpNDGGslzqaXcR56rSi9xJVLGv0AyPQhXKnPB8mft5cyH5OYSp
         56NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782376263; x=1782981063;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tIxTISlKz5zUY/5EeJFoGXkyj7v9D4tIsE5w4iprCUU=;
        b=pAYtMvT8yx86x8UWhXHqE0Waxhl7G547wB4rwI7z7QZwIY/m+RpWFb/svjViKkDIs3
         j7Ge6NuDg8vH0OYzx44o/5X/pPICDv+O3R8llcYtrNhupzNVV+JBtbZ8puwNZhm/WNV2
         4wPSSFiHq/HVaA0Eg5HcJn/tLjRcPpOxxNMLsdVSMwwHBcfcGknwU3/XlPxMusJUeIV5
         6l7vJ8EWabIzlhraVQG6ykVBrFDbF4djxxar4KJKVJ2qG1M5aSe4mJB9WokYXTNxIggl
         bAbKQZk9gd4FR315v2NxV29stsM9fBocNFnpX0JFYllCgNF/KiLr1zvfQP+gKU98v4Vi
         kzlQ==
X-Forwarded-Encrypted: i=1; AHgh+RpfQLniukcrRppkw9R49Qioo185jWonj7WGdAUa7RNr5jFLnX6dZbA8etjQV/IQ8rhvNN4s27g9wlLthg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyItWqum71x/bKavjPV0vz61NHoSmROJ5poKcuiypAiqHStWQyZ
	YKXh+Z7I9RZd6VIJ5+weuAEDd7LyqVWYn2/Xs1sTWmwxKQr13kybw9i7
X-Gm-Gg: AfdE7ckvNO0S6wDxv0YGOraL4sQLozIDCE7TSFA+A0APPf3KN1OOwFEf7uhMHV3I6LD
	zLKXF5Pwzu8Fm2ORldjF4No4Qi9u3uf0X2bjub2MbaFpF0+G+J8oOGhkTsbfMAoyHn3j8BRlVPZ
	VZ2wYkLLT7zt0ZY85p85rC77pZO0kp+q6paPDfUzRJaCR0CSkQEQjk1UFJsnD9cQFl8lm4pWJST
	CGu6Deh6DZt74mQiCmfdj+Ryd64DP/8lGDVRZSlBpsZSYIVg1cGWEXHPMeApadZYcCCl3neoMCb
	YbherGc2LoBQaRCvtn/bg7/OVz22u0O+7/2/JwmaR5wW7pZTWbmMmcrcw1r2a9c01Fzl1iTmopf
	doRSU4dc4I3tZk7TJPihH1GJ6oXl7ZB0ZuyIcxrPYXTKAWOJrbRILd2d8NR+rG7SsvBzka4gHVv
	rP/NFU6mrwkB+xLjD4HGeo3Iv8/Xu2OsTgIw==
X-Received: by 2002:a2e:ad12:0:b0:396:954c:3536 with SMTP id 38308e7fff4ca-39acb937087mr3503671fa.28.1782376263385;
        Thu, 25 Jun 2026 01:31:03 -0700 (PDT)
Received: from xeon ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39ad317dfc3sm620731fa.31.2026.06.25.01.31.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 01:31:02 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-clk@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/1 RESEND v2] clk: tegra: support 48MHz clock for pll_p_out1
Date: Thu, 25 Jun 2026 11:30:51 +0300
Message-ID: <20260625083052.65405-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

UEFI on Surface2 sets pll_p_out1 to 48MHz which is not supported
by kernel and causes BUG() early on. Fix this by adding 48MHz
clock support for pll_p_out1 along with 48MHz support for pll_a,
main pll_p_out1 descendant.

---
Changes in v2:
- aligned with downstream 3.4 kernel for tegra114 logic
---

Dmitry Osipenko (1):
  clk: tegra: support 48MHz clock for pll_p_out1

 drivers/clk/tegra/clk-pll.c | 1 +
 1 file changed, 1 insertion(+)

-- 
2.51.0

