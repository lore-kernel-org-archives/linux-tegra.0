Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CBFD403EA1
	for <linux-tegra@vger.kernel.org>; Wed, 22 Jul 2026 17:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784742511; cv=none; b=emfSgMQ/SKpET9RmXDM8C8wsGRaShc2P8fVaAlYloSe8FZuAl+P7jPTRaudtCmwNRtwwZJ5iLPyDMbYbLxtH4t19LdM8r01yPWL6RujR7WeflSBworGlq9jkGPIEOok7VNU9TC85gEbvT31b1qh66I38GK1Bk+dgA2IQrnNs6K8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784742511; c=relaxed/simple;
	bh=uNGdvVlUjbyCtzw+OUV8NYc8KcS9DKRjygI7lgJTIX4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DamdJemA3whYnvzgjTQbKURGzCvPIO/RbdiunuFhLzFsgjmnrEJBC+2PBidP1rG/AMN2mE+yy8balqLSYM923Uz8LA6q26NqZ+cjjnDnnXbTcyNK42j8HkLWrgjAFW5KqeaPer04f18jnfaWy/vuViD2207hs6QqFtpSVeRmTEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s68STE1d; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s68STE1d"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-4798bea72f9so6874648f8f.1
        for <linux-tegra@vger.kernel.org>; Wed, 22 Jul 2026 10:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784742501; x=1785347301; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KR6U6loUN0XySvO98LQDKeYmAr3LHM2/q9hDv0i3JqQ=;
        b=s68STE1dLUSRIWV2WOI/pOzCh4ktKDXNBtcfcjX3ByEbL1ONjdfoSsEa+mPJOOKYjf
         nNGdliJyej8LI0dkMeVqZBNx4uZd3YvFT0Lv056Mrd4jVkyG5N5MXsSDbBeb/t0bDTDH
         w4J085bUE0MG1nsAiqpsabnBvTCb1HcD5fNkpt7XrBCzcaH9x0/5apvE3EAbCFb6P7x0
         Ku6XVTbWp8lT4qBEFMnbX9bTJmMXXfuWjc6C831fxsCnMKmlMXjVUmxAgKw01zlejfaB
         g+mtnQsrc69cimOwE0bjGQRiR9nDzFy+huAjYs1UPlmmogI74o1oDoIZx0vY1uR8y6AP
         ipVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784742501; x=1785347301;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KR6U6loUN0XySvO98LQDKeYmAr3LHM2/q9hDv0i3JqQ=;
        b=sq/y7ichYFyKGW9aP0Z1neLt6qw980xMwFc3Y3lTb6bmZ8xsJXewN5XO7vzGVrdFQ1
         OqQ0L27rGaHe+cohUSup0wEteB3z9gq5lF/sWthPCTe3A0ItW7wRVGPZKm1C0pXYEzbP
         K4IiieeAvIw80z7G7hZr6Ws2xtR4epf9Aw/mWn+EPIktg9JtixwefF5GCzWD2qCmCSMb
         uXOZxr/yVNJKJxoGb+CL0Dxfz5mhLfv0DsopRtaV8ONK5nJyev3Tb6sNZC23pJBgccHy
         QO013NHQNTjoVtUmSjeJXtoMVZYALeapOoIm+RuTfNOKNWEYrokVVW9n8y/vvJE8ibhB
         dEJg==
X-Forwarded-Encrypted: i=1; AHgh+RqtsqcrNixU2JwdZeBZDV3/wNG78pt04MV0aWAMPKEoEYo5j71AlItmpxEI3gQ47PedmyTo6M1XcNa2nw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz83QnX2GH3ia2KtrRuJc+qlnKsJD0k3yX9hxrRK/t/N3LnrYee
	woFf99XvUwMttd+yHEJsfRcMAdg0fkVT8C/FQEV/zJaTJyba46tThjrG
X-Gm-Gg: AR+sD1291VhW099ZWK0ZTH31oTcL3iWkq6i5DdrijetqVUfElKh8kBUJBf71q+1A7pq
	nvxuXJqOUgkQbHs01sX9tnGK8o2m4lHIQHAeF9vOUX3uKRquRer0/ybcWIfFEfk+GF9qFeuduIz
	Q6PbKRl1yFsiA2lLcOQjd8stWDVtHA4d2ahN5edWtnUesa31xQXeS//rmtYyx1H5eHXw+v2yyPR
	GOVtQQgh7FPDsV2L8ly0SupBgudk6YAXBGJ+vKexopTRf+tT0ZDaP2iL/E1JwVfI3WSjvB4k4fa
	xmZEliBF4VDV9ipjLesdeiV3eJGm5e0dfC7mMQ7LnA9f/C0qJ0Phgp4lpAJ87IwI8VAY87Z8Jt5
	62uD09w73MjEBVe18uAlzbJaWcgIGYZl0/SfPh8V3aTX9KGp7nZvrDbhdndkHDvdNwzjPQ7mwTM
	L3qKqV76w+9W2mEw==
X-Received: by 2002:a05:6000:2910:b0:47f:697b:de65 with SMTP id ffacd0b85a97d-47f88656f9bmr3595507f8f.60.1784742501403;
        Wed, 22 Jul 2026 10:48:21 -0700 (PDT)
Received: from ubuntu ([103.196.162.15])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85bd77a9sm7455278f8f.14.2026.07.22.10.48.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 10:48:21 -0700 (PDT)
From: Faisal Mukhtar <mukhtarfaisal03@gmail.com>
To: thierry.reding@kernel.org,
	jonathanh@nvidia.com,
	skomatineni@nvidia.com,
	luca.ceresoli@bootlin.com,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Faisal Mukhtar <mukhtarfaisal03@gmail.com>
Subject: [PATCH] media: tegra-video: Fix length warnings in tegra20.c
Date: Wed, 22 Jul 2026 22:47:22 +0500
Message-ID: <20260722174722.413123-1-mukhtarfaisal03@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Wrap long function arguments under the starting
parentheses because of line length style warning
reported by checkpatch.pl

Signed-off-by: Faisal Mukhtar <mukhtarfaisal03@gmail.com>
---
 drivers/staging/media/tegra-video/tegra20.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/staging/media/tegra-video/tegra20.c
index e513e6ccb776..eb1fc5b7e2cd 100644
--- a/drivers/staging/media/tegra-video/tegra20.c
+++ b/drivers/staging/media/tegra-video/tegra20.c
@@ -552,7 +552,8 @@ static void tegra20_channel_vi_buffer_setup(struct tegra_vi_channel *chan,
 	case V4L2_PIX_FMT_YUYV:
 	case V4L2_PIX_FMT_YVYU:
 		tegra20_vi_write(chan, TEGRA_VI_VB0_BASE_ADDRESS(TEGRA_VI_OUT_1),  base);
-		tegra20_vi_write(chan, TEGRA_VI_VB0_START_ADDRESS(TEGRA_VI_OUT_1), base + chan->start_offset);
+		tegra20_vi_write(chan, TEGRA_VI_VB0_START_ADDRESS(TEGRA_VI_OUT_1),
+				 base + chan->start_offset);
 		break;
 	/* RAW8 */
 	case V4L2_PIX_FMT_SRGGB8:
@@ -565,7 +566,8 @@ static void tegra20_channel_vi_buffer_setup(struct tegra_vi_channel *chan,
 	case V4L2_PIX_FMT_SGBRG10:
 	case V4L2_PIX_FMT_SBGGR10:
 		tegra20_vi_write(chan, TEGRA_VI_VB0_BASE_ADDRESS(TEGRA_VI_OUT_2),  base);
-		tegra20_vi_write(chan, TEGRA_VI_VB0_START_ADDRESS(TEGRA_VI_OUT_2), base + chan->start_offset);
+		tegra20_vi_write(chan, TEGRA_VI_VB0_START_ADDRESS(TEGRA_VI_OUT_2),
+				 base + chan->start_offset);
 		break;
 	}
 }
-- 
2.53.0

