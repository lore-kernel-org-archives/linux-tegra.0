Received: from mail.kapsi.fi (mail-auth.kapsi.fi [91.232.154.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2E682206B5;
	Tue,  8 Jul 2025 12:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.232.154.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751977115; cv=none; b=R49WTqYI7dSYrEjAknWtvwL8cYOXDMbJl0EjoybrlmN8c1lHf15saAaszF78AdWMJMESGwxAqGDrKvU2LFug3Ra3Da1v6iGBbHNW16poSLITrsz6nSWyd4vusLM7gJZkFvylXVJSemW0n8fVHUW6/SgGuy6ytYa7eWp35Kc3sQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751977115; c=relaxed/simple;
	bh=Y8xP9SdKZLP3je4LPIUIBHgdiASDR0ILUs1BEaZPbm4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=F/+FcIYqsBoZcpcotjbcVRr2b0nuvY50q85QnaysXJvoRRj6dyz/VFdQegHk00uZkWq7FPDL1kEy07KKVPmyCrr8249azaTDmgwLTGbrhXa6/j8w3Ghib/s5szizVT11J6B+09zHfDUvjQBLI9ApxjbDf2YPdoYb4wRtDYceG0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kapsi.fi; spf=pass smtp.mailfrom=kapsi.fi; dkim=pass (2048-bit key) header.d=kapsi.fi header.i=@kapsi.fi header.b=m3sJDprV; arc=none smtp.client-ip=91.232.154.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kapsi.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kapsi.fi
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kapsi.fi header.i=@kapsi.fi header.b="m3sJDprV"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
	s=20161220; h=Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=8bA1fIZoxmI2vdgHJBtDrQp+hI4tTUxQ2x0sAD1aEPc=; b=m3sJDprV7VZHfn82zBvK+jT12s
	wWc7w2h4nQpN2SfPw0KWFeTXTVEOyo00attfAG5exm5/qPNcS/WiH2tqrnIqk7OUfvE7JfMk22M0w
	mE4ElSLBZzhnX5uVVZrb4rirH5A8ufUgfU+Le0J2IrWGJDTJhIqDW1o5bmOMa1quhS5aSdhGuwMkR
	PHPbfC+LFzpnfvhEEyM1hgUukj5lofkn1boWPana0GURbaobd6J8dUBeqpB4YVFCsxmyEzNAz40Hj
	53EhFOXd8ajTkoz/g9mEbzi+8jaHEac36CEXXsB3jw2m8wB6SKmI5T5BFH6bzPuGSEYSTNrZh6PqI
	dMBVdinw==;
Received: from [2404:7a80:b960:1a00:5eaa:b33c:a197:a90f] (helo=senjougahara.localdomain)
	by mail.kapsi.fi with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <cyndis@kapsi.fi>)
	id 1uZ7HH-008UTB-3A;
	Tue, 08 Jul 2025 15:18:28 +0300
From: Mikko Perttunen <cyndis@kapsi.fi>
Date: Tue, 08 Jul 2025 21:18:08 +0900
Subject: [PATCH] gpu: host1x: Allow loading tegra-drm without enabled
 engines
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250708-host1x-allow-no-subdevs-v1-1-93c66c251f03@nvidia.com>
X-B4-Tracking: v=1; b=H4sIAH8MbWgC/x3MTQqAIBBA4avErBuwKJSuEi20phoIDac/kO6et
 PwW7yUQikwCXZEg0sXCwWdUZQHjav1CyFM21KpulVYG1yBH9aDdtnCjDyinm+gSnE3jnHaNsVZ
 DrvdIMz//uR/e9wMDsUXDaQAAAA==
X-Change-ID: 20250708-host1x-allow-no-subdevs-f84bb7b48aa7
To: Thierry Reding <thierry.reding@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Vamsee Vardhan Thummala <vthummala@nvidia.com>, 
 Mikko Perttunen <mperttunen@nvidia.com>
X-Mailer: b4 0.14.2
X-SA-Exim-Connect-IP: 2404:7a80:b960:1a00:5eaa:b33c:a197:a90f
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false

From: Vamsee Vardhan Thummala <vthummala@nvidia.com>

Add support to register host1x devices without requiring subdevices.
This ensures syncpoint functionality remains available even when engine
subdevices are not present.

Add softdep for tegra-drm to make userspace interface available
without module autoloading through device tree entries.

Signed-off-by: Vamsee Vardhan Thummala <vthummala@nvidia.com>
[mperttunen@nvidia.com: some rewording]
Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/gpu/host1x/bus.c | 12 ++++++++++++
 drivers/gpu/host1x/dev.c |  1 +
 2 files changed, 13 insertions(+)

diff --git a/drivers/gpu/host1x/bus.c b/drivers/gpu/host1x/bus.c
index 344cc9e741c1357420240467754fd151926b3bd5..723a80895cd43bde840adf8d26812e82d12385ab 100644
--- a/drivers/gpu/host1x/bus.c
+++ b/drivers/gpu/host1x/bus.c
@@ -471,6 +471,18 @@ static int host1x_device_add(struct host1x *host1x,
 
 	mutex_unlock(&clients_lock);
 
+	/*
+	 * Add device even if there are no subdevs to ensure syncpoint functionality
+	 * is available regardless of whether any engine subdevices are present
+	 */
+	if (list_empty(&device->subdevs)) {
+		err = device_add(&device->dev);
+		if (err < 0)
+			dev_err(&device->dev, "failed to add device: %d\n", err);
+		else
+			device->registered = true;
+	}
+
 	return 0;
 }
 
diff --git a/drivers/gpu/host1x/dev.c b/drivers/gpu/host1x/dev.c
index 1f93e5e276c0835eac2f713ffcd60a9db8db2c21..e1a9246d35f4b7685dd828c53eaf3910a5ef739e 100644
--- a/drivers/gpu/host1x/dev.c
+++ b/drivers/gpu/host1x/dev.c
@@ -821,6 +821,7 @@ u64 host1x_get_dma_mask(struct host1x *host1x)
 }
 EXPORT_SYMBOL(host1x_get_dma_mask);
 
+MODULE_SOFTDEP("post: tegra-drm");
 MODULE_AUTHOR("Thierry Reding <thierry.reding@avionic-design.de>");
 MODULE_AUTHOR("Terje Bergstrom <tbergstrom@nvidia.com>");
 MODULE_DESCRIPTION("Host1x driver for Tegra products");

---
base-commit: 58ba80c4740212c29a1cf9b48f588e60a7612209
change-id: 20250708-host1x-allow-no-subdevs-f84bb7b48aa7

