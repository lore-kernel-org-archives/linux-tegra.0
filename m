Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB3B113AD34
	for <linux-tegra@vger.kernel.org>; Wed,  5 Jun 2024 18:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717610441; cv=none; b=emtlKl4y9ruMwrDABlL5u7QQJXrSnBhUU3x2wjhSLXn5KDuMHKiaTZeCE+gS/YNUH04jKBbDYBdnkrXFJzOmv1wbGIUSk4c2EhvKA9qWvDyc3zwKSf7/hokhxrpenqmGYCB6H5yyX0yhxvpnE02Ab6YfauvGVYZbrLZniZENTFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717610441; c=relaxed/simple;
	bh=W5M28gmX2P2bsv2kzALbrb00qFmArQmOjGRUC+k0KS4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=JWaL5QkNFqqr396Yxj4oznsIy4y8Rwytqup0BoERT2lGhd94WgJAGMDf4nrCk/hFH8rwPUlRV1M7i0+8wm+xyX/BtaBaEYndDirvELPU7vQjtBj+kGINxfD2oDotpvPMfCG+zn3kUOmezlW/VDn7iCfuYBZIgQtM30QE3N0nVpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--joychakr.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BoWahOKK; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--joychakr.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BoWahOKK"
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-62a23864df0so561047b3.0
        for <linux-tegra@vger.kernel.org>; Wed, 05 Jun 2024 11:00:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717610439; x=1718215239; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=+5/Bg969zZ0eVFu5myprHh5fQqxMXbek8nDgGOBzWoA=;
        b=BoWahOKKkJ1D7kfGtrnP0cUxpIrNaZ2suLddLewzR2oz4u7CWziBpzwFHQ+ftzncIs
         eFtpB/1H9zyQlzicoMJtoEWPK3DPjQzpefAzkEwD6qaiDFV3B0gWZlDhSKPFv0kyzLES
         mK3VwWf9UebiINpOs4Y5YKaafb1YFVHMwQk3QrRe8v5CIiNxI1jeF5dttXUDVWoM7CnG
         Marjrxai/k2CObkQx8B/L/3vNKpz1bxj4bvREXGRI3sEGkj1WJCLGHIzNySao6ORHqDb
         qzF5yPhaXQSrvk1jdn3p9DrUhYQfLvZ2MNZglt0siqP5RZkjDQWbJGwgpmIA/iYYcKMP
         XYxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717610439; x=1718215239;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+5/Bg969zZ0eVFu5myprHh5fQqxMXbek8nDgGOBzWoA=;
        b=GghF2oL5tpAfUXaqY9NAw6rbp4aoToj4BaChD4alSTvKjyW9i62PPg0oqDkrCPNe7x
         lLyURRLc/rX4XRpik+82SMBFOkeTBRXAcUr/6jH2ucCSLau+QgCMJdhY4UmOFqrhETUq
         ystCNS9b3XPbnKtxDaSH4LkpQJQWhavs27PTs+3W66k32eu2u0ueHV7DjbE+3oUOi+G0
         8oF9XybN56A3jxpaZ1dvY4jKl9VF1i2Fi2gMOEFR1aSSnERKB4V5fZhEFlGd/uGs6s4Y
         npHUEAggUg4+p+nPrWHuYVgSCcXMQr5C0mxsydD2v9paOtwbXSZxczNlBovwqZTPBaH3
         91kw==
X-Forwarded-Encrypted: i=1; AJvYcCWgW06AyXFSu7yuS1YuxYtfEHHBGYDQ3l9VrpCbOYw5okkCtSrkeBN9/IID3axTTk82UFjZrHjCEl7zgfEj1XcCIGFta3SJiUqgT1o=
X-Gm-Message-State: AOJu0Yxj6rPTTLxNdZR9W/Q4oo9iYGIsBbDxLhGxFxJG++cZBLZAhgAg
	xLYdaen+3og7bqIHynaFZCpL7rzIQNYQVETyzFCVBFy4v6cgTkugDAPeg3VRfVv7pip45zWCKvE
	HpJ0gdFKB0w==
X-Google-Smtp-Source: AGHT+IFfzGEzBdG0mJIzkY83NzFi7HVUzu/maRQ4zPj2TdB+TSZFtwNCtZCm0+GEQSlNaviP1mxKnEiXfVn+VQ==
X-Received: from joychakr.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:6ea])
 (user=joychakr job=sendgmr) by 2002:a05:690c:d90:b0:62c:efc:38b7 with SMTP id
 00721157ae682-62cbb4a22a0mr7561267b3.1.1717610438615; Wed, 05 Jun 2024
 11:00:38 -0700 (PDT)
Date: Wed,  5 Jun 2024 17:59:53 +0000
In-Reply-To: <20240605175953.2613260-1-joychakr@google.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240605175953.2613260-1-joychakr@google.com>
X-Mailer: git-send-email 2.45.1.467.gbab1589fc0-goog
Message-ID: <20240605175953.2613260-10-joychakr@google.com>
Subject: [PATCH v1 09/17] misc: mchp_pci1xxxx: Change nvmem reg_read/write
 return type
From: Joy Chakraborty <joychakr@google.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Lars-Peter Clausen <lars@metafoo.de>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Bingbu Cao <bingbu.cao@intel.com>, Zhihao Cheng <chengzhihao1@huawei.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-iio@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-mtd@lists.infradead.org, linux-rtc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
	linux-usb@vger.kernel.org, manugautam@google.com, 
	Joy Chakraborty <joychakr@google.com>
Content-Type: text/plain; charset="UTF-8"

Change nvmem read/write function definition return type to ssize_t.

Signed-off-by: Joy Chakraborty <joychakr@google.com>
---
 .../misc/mchp_pci1xxxx/mchp_pci1xxxx_otpe2p.c    | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_otpe2p.c b/drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_otpe2p.c
index 16695cb5e69c..817382c342d3 100644
--- a/drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_otpe2p.c
+++ b/drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_otpe2p.c
@@ -117,8 +117,8 @@ static bool is_eeprom_responsive(struct pci1xxxx_otp_eeprom_device *priv)
 	return true;
 }
 
-static int pci1xxxx_eeprom_read(void *priv_t, unsigned int off,
-				void *buf_t, size_t count)
+static ssize_t pci1xxxx_eeprom_read(void *priv_t, unsigned int off,
+				    void *buf_t, size_t count)
 {
 	struct pci1xxxx_otp_eeprom_device *priv = priv_t;
 	void __iomem *rb = priv->reg_base;
@@ -159,8 +159,8 @@ static int pci1xxxx_eeprom_read(void *priv_t, unsigned int off,
 	return ret;
 }
 
-static int pci1xxxx_eeprom_write(void *priv_t, unsigned int off,
-				 void *value_t, size_t count)
+static ssize_t pci1xxxx_eeprom_write(void *priv_t, unsigned int off,
+				     void *value_t, size_t count)
 {
 	struct pci1xxxx_otp_eeprom_device *priv = priv_t;
 	void __iomem *rb = priv->reg_base;
@@ -214,8 +214,8 @@ static void otp_device_set_address(struct pci1xxxx_otp_eeprom_device *priv,
 	writew(hi, priv->reg_base + MMAP_OTP_OFFSET(OTP_ADDR_HIGH_OFFSET));
 }
 
-static int pci1xxxx_otp_read(void *priv_t, unsigned int off,
-			     void *buf_t, size_t count)
+static ssize_t pci1xxxx_otp_read(void *priv_t, unsigned int off,
+				 void *buf_t, size_t count)
 {
 	struct pci1xxxx_otp_eeprom_device *priv = priv_t;
 	void __iomem *rb = priv->reg_base;
@@ -264,8 +264,8 @@ static int pci1xxxx_otp_read(void *priv_t, unsigned int off,
 	return ret;
 }
 
-static int pci1xxxx_otp_write(void *priv_t, unsigned int off,
-			      void *value_t, size_t count)
+static ssize_t pci1xxxx_otp_write(void *priv_t, unsigned int off,
+				  void *value_t, size_t count)
 {
 	struct pci1xxxx_otp_eeprom_device *priv = priv_t;
 	void __iomem *rb = priv->reg_base;
-- 
2.45.1.467.gbab1589fc0-goog

