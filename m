Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D67B11DF72C
	for <linux-tegra@vger.kernel.org>; Wed, 31 Dec 2025 12:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767184854; cv=none; b=NuLJDuY4Dvei15/eeI5IjinPSOCpZWWqHm8F+3Hm7jpx7hT6hCDQIr405brcS/0H6T7YZUf9uq2TFRC5gEtdITyRGvxuCHTgbfdwcpCXr8mWx4Iz7uxsoGy3SA16wAfohrGsgmoKRS03tTlWHKntLlX/2xH7a6rZXIu6K8Kw28A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767184854; c=relaxed/simple;
	bh=bpc64xTes/6DSqbbfKw7utwCw290qXBNArmOt6zd9U8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AullYykZEkuxhgXdg96lhPDZn75R2w6FDB3dtQMChwaWVq0mvY1rV+34eBxFGkoR7GhpSBLsUCCoQsFhfl6U48XFQOjZYqGI+/XDgtHkGyE47sWTAiCYyuNjKasGuvLeoQpMvPn5qIH9bWG23apphdUJzp7DY4qNr6lbkoO8bp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VbcwKfHj; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VbcwKfHj"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-79045634f45so18548507b3.1
        for <linux-tegra@vger.kernel.org>; Wed, 31 Dec 2025 04:40:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767184852; x=1767789652; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MMZ9zgZdVr3pbZQDIH7NpdxYpjnjDbphEYD5vgBclQo=;
        b=VbcwKfHjmJPyojiLD2Ehe76AtAOZ0xAOszb0e8C3Npgqv2EOB1vNL0VU5wMSzxqqoS
         aa31X+bxkM8AQhNNvcejoYiFuG2dlYCA83aPGnXj7y9QBQcUDMhwpVcv+YBsf3XHzFfq
         xVHWm0XbtfI2yr1DtUrywH5yKwY8nWBHl0QtcGTI92R0rWsifUkTrya6z01s6SR4Ovit
         q/Z77f4AglJoOzr+q9ARFgYHIO0X5zzWWtfeFnh+3mhBVrEt/OE6PJ6u0P4iPIRFu1tr
         5AoHxAJcbHhXoN6ttYiORUxrflhPh3uq6s/iJ+/uh3VbffmXRi5XDbDuIZ7fot+3/VfX
         xC5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767184852; x=1767789652;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MMZ9zgZdVr3pbZQDIH7NpdxYpjnjDbphEYD5vgBclQo=;
        b=qYUXQExDnQQ10gOpfrDbFaGi4EjeOsRLrJtFQcTkRTpqQImYsUkONHczUkE5HERtY8
         goUZAHF2AmLk0AwuTXDqsQ6zblCQ7vtZUmebJrfTg+1+yUzjLeTTkPXjF4RE5YjxRZaN
         9HkanwQt3aczErfxtmIm1fqFTaSQHM5ZJchyGO7nXjIRVfOjGfrPs6i7pyeO02d0TbFC
         7l7KXJcqwig0Ve9xnOSiYQJOu4rJk8cUEe9bl0vXetTn2n6uB6HFauctn+gy6qyLf/jc
         Cx/o17fFrlKVgZfzBkiLa1FoL4V8+Ml0seZEJuq9wwYsrlzTdtArqPdaOEgaVUD9BvqH
         bKlA==
X-Forwarded-Encrypted: i=1; AJvYcCXu9y+5S7qiN8jO4ggfO5t4CXX/dFOl+6WcHuRAczkKJJVfdFPqODSO4zO3Dq8fXmo6n9dZnOfRCGcMTQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzOa6ze7KwFULSh8zGepmbhRNyS8aH5b6O3nv7FRr84wgljcq6T
	aTOMXUsYba5GsDthg/JElcyBK0ouPIWb7rOIIWg48UifIaAAK8r3K5DO
X-Gm-Gg: AY/fxX5s7rHmg+fAteGq6tI/lU1z29LKaZmUqVMSKF7OJ4JwnFmH3Ge1UI1U+l2te7E
	IZD8nQx2V1BkqKQYee/TYzBRNILXgWEGPjYRzsh5WNu8tgZSrWl+Ot453lpzGKbYXF7/1bd4IUh
	W3KDVB3udllUZLmZqdkx2+4yhCsg2oTr1R+tIJVwbQ4F+NJJ9ARNJ2YdzR2ccPdPwk67umNec8V
	sRR5/Hh+4wWYjU56DkkmeBG/UAzkvcaQM93OGY2JRsEjwi9hpbT2JU+vdsYQM43zRO4bf2lASW2
	S9g5xj49eWNbiDZrYAcRlpn0vc1MZn9FT8LZ0834DwbPyDpc4mXPrJLelVmzT6ftLEidWUZ5nZV
	XQ3YXeo/46lv251ve6sE4O4FAc/Ja4NWP2SVn+Dhrirm57IJwKyJRrK92jW0XOWUrP0zqc6/+S6
	rswSr9MdqmaEZlMQtlUnqhA0i1mBX9GWViSTUI5N+RYGNPdRGPyHuh9qQDPUpdoHgaBIxczrwIu
	6jezz4=
X-Google-Smtp-Source: AGHT+IFrXQD2q7MyIixphdEVMQQUK0nDKmR0bPg/g+JbhcBEInhr1pMYlAHk+OMHNNhDorAD0CekqQ==
X-Received: by 2002:a05:690e:418d:b0:644:2c33:42d2 with SMTP id 956f58d0204a3-6466a85b6c3mr26405383d50.23.1767184851830;
        Wed, 31 Dec 2025 04:40:51 -0800 (PST)
Received: from ubuntu-linux-2404.. (108-214-96-168.lightspeed.sntcca.sbcglobal.net. [108.214.96.168])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-78fb43b2690sm137555257b3.18.2025.12.31.04.40.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Dec 2025 04:40:51 -0800 (PST)
From: Sun Jian <sun.jian.kdev@gmail.com>
To: luca.ceresoli@bootlin.com
Cc: linux-staging@lists.linux.dev,
	thierry.reding@gmail.com,
	jonathanh@nvidia.com,
	skomatineni@nvidia.com,
	mchehab@kernel.org,
	linux-tegra@vger.kernel.org,
	linux-media@vger.kernel.org,
	gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	Sun Jian <sun.jian.kdev@gmail.com>
Subject: [PATCH v2 1/2] staging: media: tegra-video: move tegra210_csi_soc declaration to csi.h
Date: Wed, 31 Dec 2025 20:39:54 +0800
Message-ID: <20251231123955.277384-2-sun.jian.kdev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251231123955.277384-1-sun.jian.kdev@gmail.com>
References: <20251229070125.98741-1-sun.jian.kdev@gmail.com>
 <20251231123955.277384-1-sun.jian.kdev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sparse warns that tegra210_csi_soc is not declared in tegra210.c.
The symbol is referenced from csi.c, so it must remain global. Move the
declaration to csi.h so users see it via the header and avoid extern
declarations in .c files.

SPARSE: drivers/staging/media/tegra-video/tegra210.c:1214:28: warning: symbol 'tegra210_csi_soc' was not declared. Should it be static?

No functional change intended.

Link: https://lore.kernel.org/linux-staging/DFCAOR6T9DPE.2MOL0K9O3HP1N@bootlin.com/T/
Suggested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Sun Jian <sun.jian.kdev@gmail.com>
---
 drivers/staging/media/tegra-video/csi.c | 4 ----
 drivers/staging/media/tegra-video/csi.h | 4 ++++
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/tegra-video/csi.c b/drivers/staging/media/tegra-video/csi.c
index 604185c00a1a..3c3f6e3fd1ec 100644
--- a/drivers/staging/media/tegra-video/csi.c
+++ b/drivers/staging/media/tegra-video/csi.c
@@ -835,10 +835,6 @@ static void tegra_csi_remove(struct platform_device *pdev)
 	pm_runtime_disable(&pdev->dev);
 }
 
-#if defined(CONFIG_ARCH_TEGRA_210_SOC)
-extern const struct tegra_csi_soc tegra210_csi_soc;
-#endif
-
 static const struct of_device_id tegra_csi_of_id_table[] = {
 #if defined(CONFIG_ARCH_TEGRA_210_SOC)
 	{ .compatible = "nvidia,tegra210-csi", .data = &tegra210_csi_soc },
diff --git a/drivers/staging/media/tegra-video/csi.h b/drivers/staging/media/tegra-video/csi.h
index 3e6e5ee1bb1e..609c5952e050 100644
--- a/drivers/staging/media/tegra-video/csi.h
+++ b/drivers/staging/media/tegra-video/csi.h
@@ -130,6 +130,10 @@ struct tegra_csi_soc {
 	unsigned int tpg_frmrate_table_size;
 };
 
+#if defined(CONFIG_ARCH_TEGRA_210_SOC)
+extern const struct tegra_csi_soc tegra210_csi_soc;
+#endif
+
 /**
  * struct tegra_csi - NVIDIA Tegra CSI device structure
  *
-- 
2.43.0

