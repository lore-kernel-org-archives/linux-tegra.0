Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 638A7178372
	for <linux-tegra@vger.kernel.org>; Fri, 23 May 2025 16:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748016498; cv=none; b=H/bOe+a07vmSB1XMSFgHUld1wzsinKQz3p+xr+8RP9ZStN6B4hhAuvUrOVzhJw8CnC0mnLyWFaTYxlZ8v+2NviUFMZ5QJbPfBOcDkuzBle3HcA9kxmHv7we8nUINimSgL3pcnXLC1x6j5+7ldhAe7LkqOZYeU9ZkMDgNtIubs5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748016498; c=relaxed/simple;
	bh=sOSd52a5sFsFjNwgnP65YA7nbCno1YCXhcKexikeCZM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aGdpwpOfhcEciQRqo3tyW2RSZaBQq92UULJOzbzcqPcB59uf3HlUuRTw1Toh74PMm/2juqWEQuX2ElbQ45UtmnhE41tCLxgXh1puCxFvg+pN7su3kEbRx7WoiICo8EyxCAnDk2kxAxWZCuFSjbLouMzKkc4+RpQcoyy3xAx2rXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bzPNEBgV; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bzPNEBgV"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3290ae9b011so158481fa.0
        for <linux-tegra@vger.kernel.org>; Fri, 23 May 2025 09:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748016493; x=1748621293; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hGF7HsXVnOrqTUKvr0Dj/ZLjMe7xNdGfL36SW0iFLZk=;
        b=bzPNEBgVxyGsYJJ7eQHtLerihWTYCCEkDyX9cuKt6YisD0fR0xk5rhH4jBPfJz4Yeq
         7D1qaq3ekppC0wUGiz5vUdTM3U/DK6ZEJSD/CdPu82WFFoic4Se6SzyHhtftRwxdJRHS
         Qyk8WhHMjxUOLs8e7iq7sGzgVdE5S93I4Wtqqh4Ycuqi9x3s9ZsUV3dF9Jniqc78e6z3
         +nIzV+bzmraVqMJymNgxAWQ7nMU1E32dWgs55v0pA+JFdjzXs297pffPnOZn04a9ka/k
         +dpiJUuyzlgNowCeng52k8FD78fyigYaOzmMAPhTGVi0wffKG1y8vr7MfdSWZ9WByNon
         WK/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748016493; x=1748621293;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hGF7HsXVnOrqTUKvr0Dj/ZLjMe7xNdGfL36SW0iFLZk=;
        b=khuZxz+lLGv/S5lDLk89sb7CoLImK+6S+smyzupw4eC/a0OIHJGuHn6pKF5ewLaf0L
         Yl9wCiE146vmNR3zpAHTnegjgM2hFjjQjLUX3PRiBtoHz6lFw47DU/sNaw93bt4onryI
         ThmpflLzKbjOVaj31qZZGGDRqRC36noFwbHOCewLYSM0+fOv99QyhWWJQGg1UnK9q7w3
         xzWIDGbXan/1Zl//w0BMbWvRn0Lgp6jWTb9IrTzoFdA5LlPO2zCId1osIZirikb6R+s/
         9DyuL4q8TnSohbjzBS2ZL3ZA8gSsrRQNO/nSAabj6KnI6NWCJJU6PLB+O2848BmChBZv
         qFnA==
X-Forwarded-Encrypted: i=1; AJvYcCWCQr/pZ6f/N220b/7GRiaJx/kd/RiEmfuZ2m3OZjpFp9vlBpSrSyVARXIUV4yT04G7GukO+vcAFiDxJA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyTzqjTbAnvthR8Ajn0zyQ2dWR3U+6unLBcc8RSHoehlIv0zgwt
	FQe6XcyLyjs6sp+MkfuRXg2dBTB1xjjIGOi7hmib4OqFbnkAdn0gljSpip8G0sl7wlI987kzhsM
	vjpOa
X-Gm-Gg: ASbGnctoBNqm/fRpAz8SNinvh/alRXcxrrKgLISjt8YwVc/VDQJrZ3qpKji+tBElbGM
	zAENiTF9qbh6ixlsGbC/LzQjc9F6KbgnYscSgvJH/kDkJgyoDsu59ttBVqW3jPuudFucYhxTluB
	H478btBMZX/JLsiqxIuT6X9jht+xnfUwBOaXmwsnEkHs1uT35hAAcOlNUE0hxWNEVLOlEbB3PD5
	pZTlP6Kbe9IhMyU4h1L+dTFHrAonsIzHr7RlMOeYmHFJllGNV9Hu28eLT0THkqUViS+B30q5+2Z
	O/CbC0TXUYtJqm5RHfW8hSygy0OT69FiHKHhBMWqRn6tF6uRgOxbK4D2
X-Google-Smtp-Source: AGHT+IEgnqQ89pTDpIiXTK+5YoVr8iR1h5pIE/WFcVljNceH6shNrv9ACEId9Fo5qIq8B9APct4R0g==
X-Received: by 2002:a05:600c:3b21:b0:441:b3eb:5720 with SMTP id 5b1f17b1804b1-442ff0396b5mr274072555e9.29.1748016482352;
        Fri, 23 May 2025 09:08:02 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a368136014sm22978069f8f.92.2025.05.23.09.08.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 09:08:01 -0700 (PDT)
Date: Fri, 23 May 2025 19:07:58 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ben Skeggs <bskeggs@nvidia.com>
Cc: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Dave Airlie <airlied@redhat.com>,
	Lu Baolu <baolu.lu@linux.intel.com>, Timur Tabi <ttabi@nvidia.com>,
	dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] drm/nouveau/tegra: Fix error pointer vs NULL return in
 nvkm_device_tegra_resource_addr()
Message-ID: <aDCdXk98AhLBcWvK@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The nvkm_device_tegra_resource() function returns a mix of error pointers
and NULL.  The callers only expect it to return NULL on error.  Change it
to only return NULL.

Fixes: 76b8f81a5b92 ("drm/nouveau: improve handling of 64-bit BARs")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c b/drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c
index 0ca2dfe99676..114e50ca1827 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c
@@ -196,7 +196,7 @@ nvkm_device_tegra_resource(struct nvkm_device *device, enum nvkm_bar_id bar)
 	case NVKM_BAR1_FB : idx = 1; break;
 	default:
 		WARN_ON(1);
-		return ERR_PTR(-EINVAL);
+		return NULL;
 	}
 
 	return platform_get_resource(tdev->pdev, IORESOURCE_MEM, idx);
-- 
2.47.2

