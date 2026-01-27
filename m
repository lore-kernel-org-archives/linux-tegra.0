Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BCAC283FE3
	for <linux-tegra@vger.kernel.org>; Tue, 27 Jan 2026 16:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769532197; cv=none; b=nsJZyAaDn4Li9sSoZo1ZaieWw7vBhAeKS8QgUhQGW5xJNkqZy6h6bX0BZK8+Xce0xRUmaVSK9wo9cW3Xw6beY5k+0E3HF6rax/GgVOgb8eh8uexbU4Z2+lJe3btp3FyOrUMRcbq00MIkzZuIZgL5j34eFrgsjfoeNe6Su5L4DUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769532197; c=relaxed/simple;
	bh=jvSrjyI0rNYJ8C8R56pXxeLDoon1cGjhsNLYQXraWfE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=jorhsJB9rlx+nf2A6R55In61wc+yL9DcFcEWYOizPsElfykzDNYQAetDMgfM6otiBg26Sp+aO2WggtAYD9O/5zr3k9Srf6x9dsLMBNFsJydvHR7a0oJitxqBSn4viCHYdRWvRz+FhhHE2XVYxkWkI09ZmFcyu59rXQnVH+itrN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RznIej3N; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RznIej3N"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-81f4f4d4822so2984031b3a.3
        for <linux-tegra@vger.kernel.org>; Tue, 27 Jan 2026 08:43:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769532196; x=1770136996; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rbJqSdTvAPwaCOQOYdwmWizDI5ckJvr5N6HEdUxLGI0=;
        b=RznIej3NRfWf9KLz5nDkX+LCRIBu+8M4dPvRJEKgk1yTH+ZAeWaCRxSq/+AHgpNZ5E
         R+GrhEO62F8UIMmPR3vK7AVRxnosLEmC3Bg21YOtl1QJLWkhH6mBYY0uEYrJq9XC/M2L
         3tg2U0wn99vNLQDQNM0JYMUCR5WMU8L4oNGVw0agrLuwXXqOvJJOLVvIue7fKm3wzxMe
         24p8pVH2Zxqssi/K52a/xSATjnuILLX+A9vCuSvYmh6Ls0cdsK//j+BI6y1p6YhqGyq3
         1Se1YAE0vZ/cM5jHbJDJf5AYJPNEL78M8iBZTLPUSOEPm/DLn5F5rT5qFRH1xqqgnLyz
         UplA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769532196; x=1770136996;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rbJqSdTvAPwaCOQOYdwmWizDI5ckJvr5N6HEdUxLGI0=;
        b=dOB9+eL2dfa+hqT3+PD3BY7bTgST7WZD+v8fvLbweebEEPDER+68Qr5dVKjtEd2L8O
         Q5FTMvHnolKw7lumoxY0QPfDqv58Ri+NL2vE/sxs9F9/FsoeD9Ht4eGgNVQwmqJHCPpi
         +D002ugN3mxzdDr+4EK5m0Gin0gA90PW5Wb2qAG1Zmp5l/18sUwNcPJBtwNMkEjJdZJD
         B3VpRuVM9M4eW2qvs/HESR2zgpZW5wIQ4vjnvYcgZs+DX9Fd8icUDiQAFf6i1Zvm/AUi
         U2YOLNGiZgsEshAZo/tXkm7tzOx3msKcsnP1wWYiAvKv4v1iIGsQ9znJ4xfa15qmFH/9
         eA6Q==
X-Forwarded-Encrypted: i=1; AJvYcCUyA7HfhCA62ur/yOnuUHx1or9r+nJ3oQj4Rpzy7Zc630Gp/j7I6D4ixoo3N0wsc+MIN56EBSII1PjuFg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwfmHZKndMpbpzAW2luxu4/2if4+5FMPumFNiLUjloVZM1IFD6m
	ZcSXgphmUWrYQJULFJhbmQQkpdSIuPHLRLQh1VKI3w7Jcwc8RY6G564F
X-Gm-Gg: AZuq6aJOKEceKtnCXmjs3ORxTOvek8+xnX6Owz5JlfoNUjhfx0KIuIEJlwiDCMLceDn
	jU8udbGgueW9milBRu8qkfo8bG7pfU+vixMLkQLyB3fyhwYhLijJf6Tpze2D9i0JM5n51euKGGT
	6MjRvYNFGK0p97XCHNQQP8BYTQMniGtvjIyh0YDXWrPlk7ZSeVJWDDbrNQZ09u1mPX4hMN1vIjn
	bgU3XvGOjU9i/hJQ80EjCdrbId4Lj+ZwPRgYWK7GR7Kks2t4iu0SrLiJ+kSlKMYThGhLGxVSbYZ
	HqkesgMhi5DeU2OiKzr9r+rQFClrBbGAb1ZaJl8nexinMg+TxXmQ4Efo0d7ONLVcQGs8HiDFFdZ
	//71b0L0ckgDBPCFTrDho1olxH5HQmWiLi6mRjdjCltw5LXToWUFdZkiQdeSs6+DA6m6P+LjJ8d
	vpSiT3YsL5z2OXxjie+6S3ajA=
X-Received: by 2002:a05:6a21:6813:b0:38d:e87c:48c8 with SMTP id adf61e73a8af0-38ec6546d38mr2069349637.60.1769532195656;
        Tue, 27 Jan 2026 08:43:15 -0800 (PST)
Received: from junjungu-PC.localdomain ([223.166.246.160])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c635a1307a1sm11187307a12.5.2026.01.27.08.43.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 08:43:15 -0800 (PST)
From: Felix Gu <ustc.gu@gmail.com>
Date: Wed, 28 Jan 2026 00:43:10 +0800
Subject: [PATCH] drm/tegra: dc: Fix device node reference leak in
 tegra_dc_has_output()
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260128-dc-v1-1-a88205826301@gmail.com>
X-B4-Tracking: v=1; b=H4sIAB3reGkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDQyNz3ZRk3VRjS7PEJFNjC5OURCWgwoKi1LTMCrAh0bG1tQD4XkIUVAA
 AAA==
X-Change-ID: 20260127-dc-e396ab5384da
To: Thierry Reding <thierry.reding@gmail.com>, 
 Mikko Perttunen <mperttunen@nvidia.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Jonathan Hunter <jonathanh@nvidia.com>
Cc: Thierry Reding <treding@nvidia.com>, dri-devel@lists.freedesktop.org, 
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769532192; l=1230;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=jvSrjyI0rNYJ8C8R56pXxeLDoon1cGjhsNLYQXraWfE=;
 b=zAg99uNto1mob2shUsiEV5w4TAfuo/rwrqM+hVIS9lQ63dW5WkF0SDAfWkvE+yX7MT5qx765p
 W/5FyvToi+QCrFPSeh2AtelSmLjoTdDxfD3R9Qr8tLWnFjjJVJfMcVN
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=

The of_for_each_phandle() macro increments the reference count of the
device node it iterates over. If the loop exits early, the reference must
be released manually.

In tegra_dc_has_output(), the function returns true immediately when a
match is found, failing to release the current node's reference.

Fix this by adding a call to of_node_put() before returning from the loop.

Fixes: c57997bce423 ("drm/tegra: sor: Add Tegra186 support")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/gpu/drm/tegra/dc.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index 01e9d5011dd8..9bf6c008a5ea 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -101,8 +101,10 @@ bool tegra_dc_has_output(struct tegra_dc *dc, struct device *dev)
 	int err;
 
 	of_for_each_phandle(&it, err, np, "nvidia,outputs", NULL, 0)
-		if (it.node == dev->of_node)
+		if (it.node == dev->of_node) {
+			of_node_put(it.node);
 			return true;
+		}
 
 	return false;
 }

---
base-commit: 615aad0f61e0c7a898184a394dc895c610100d4f
change-id: 20260127-dc-e396ab5384da

Best regards,
-- 
Felix Gu <ustc.gu@gmail.com>

