Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795898915;
	b=U1dsAzGw5clOCLddZCAyQTN84Yw6qc3rF60JskprgVk81F3UJ1xTGWClnMEHunNY4TZN
	 A/m0UAB8/2S+/VwYmDXSkcuXPhClmXFmaQfU5iuWE369YDw0WdjWiotL1iZk1eeevfYwT
	 YbAOR7lFu0/eFKEhk8c6ZQUU7yXVrfXTXVqTsIA66LLuT2HLMEnTM4pejyvDC35MyfiAI
	 8J38vbvlQ61EzF33jY1P7t6AanRmhOr66j5zY1/O13oFDShFa8eXkx9t8FsWq3aWhWEHn
	 kInjrBNtGzS/UJKBu2nVZZEnF17FwiGUzvLe2SjDxb8Kg5BT2xbYdmKuejLJQQA/D8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795898915;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=XVztpYI+IAxHS20TnkitbBDyDx4NOgpmM8N+fLMfxko=;
	b=l6v50px8VFlJ/dHMasc0vit9TJ9uyppMCFNyrTeTDCAaNdTogAaLj3Lh3AZWR39NAHC+
	 tNxkPSNe7x9kQrdqP7miq6jjPnjH5uihaUvtyGawArbcNnfM7B6x7arM/ZYQnJmuBvhd0
	 3heuDWdxtr18LuG5sn++GqB8+ClUDH2HDn/zBRCj7Jj4yr/aLrkkUvujIzBoD9pF/JhLY
	 vSOaSsI1F8MkAUXg7bjcL6q9Hk7C2c3CDeImuANYWPyL5L0czLbMYj40qqUpT5RB++XeF
	 5rq3TzO1VdxFb7PybUx+DlZAZOnovQquMtsEosKcd39pHoAW5UP8AsjI4LBp86sdL6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RyagCw6e;
	arc=none smtp.remote-ip=209.85.208.54
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C483A606A323
	for <linux-tegra@vger.kernel.org>; Sat, 28 Nov 2026 20:48:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C483A606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RyagCw6e
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6bb06dc1fd5so7347322a12.1
        for <linux-tegra@vger.kernel.org>; Sat, 28 Nov 2026 12:48:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795898913; x=1796503713; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XVztpYI+IAxHS20TnkitbBDyDx4NOgpmM8N+fLMfxko=;
        b=RyagCw6e50AUN1ez11I28oJHQqqmg/XNWM5Mrs0tgC+nNKQEFQMbXloz2ct0U+CscG
         qH7vH5ZOXqhlsANZr2qXC8qCB/MDB2Owr8rea4ulCqQ2bExnWM18AjZM8xUEPVHQuMZj
         +V3RojeIBO9WeVoYHq/kvEnNwvl1WBmMKjQFYV09Hsfwe4M82bS/mqvu0hTTltprwibz
         /L0Nxo5xEYuYERghtX7mhoJkTjWzcQ48kmTj0ZjLaw7IOUuD4JrdocgKxdvh0wXvaRid
         VVzani5qesUUgR701jePqbhXSVwChLJzLerEYejGrmjAvRAfdJSjcZ4x2u1ZV9pdISVY
         zx8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795898913; x=1796503713;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=XVztpYI+IAxHS20TnkitbBDyDx4NOgpmM8N+fLMfxko=;
        b=PYfV5JvJD86B09THiH0bKZGys92Heu/frbgzwkHXLPsYmYeynDI1ddYqVIvFyykrPe
         i2YGw4jFj23IG11SABGloyLoM40gneWPjKJ37Trmfy86XSZF1O7jWCWqL9yD9N0jQ2wi
         tnqluegFx74JHpVfXs/iSOofAY47ie867HPtZUIzv/el65PN3MatbZBdT7zCssIXl9xE
         UQxvwqG62qHYZrwXFGVM59ajhID+7yptIt+YW9Z9QhyuE7eWX7EdBnCDlioXu2ca8Qps
         323MXai9KOmY8f/SYCDb+ojFRkfNCkjMYkGOs0ieQzBMHyKzqKbBl/zUb4qG3xQJAicf
         KxvQ==
X-Forwarded-Encrypted: i=1; AL+hErG1bLKzd2S3O5OX/WSMraVkeH60zkChy4EnjpPTWTHX9DiFC94tsuCslTkLgtM3HbfTa45hTwG+W25cYQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z8oHeEM6vUPCNueQs3AnDM2qnX/F4HGQC5OOZZD/YgsN9A7yyp2
	yRLqxIdAdWLmRjm1k6BDnNA0SwKU64ebB9J5KseCoh5Hem8/AKfVaHeI
X-Gm-Gg: AZFdTZceT8Uvy/mNE2a3BaA2Qpel6SaqosErSigx6X2Vw/vVAMWq52fEE9utdvV4yaq
	uQQMYBk5CxuN5+tFcIWhYcSfsA57w5yh63jIIhc4h9Ng1bu1H0rFANTDft5kRAyXLO5vajmG+WU
	RyepRPwiKT4kQl+5VW18VjTcPKX6gqzsR5h7gi86GbzK1q7MrhS1g8+Yf6Jtu1j4+eIQE6dfV3M
	ZRTW6uZGEnWm2VE7T6UORp2WzKyM4sow0ZymNSd55ok8KVPJNUIuCjTyugiVa/8QsZFrfHu+Kte
	8ZYlM5q+nIJXswHZLgB4KmRJEAov8fFfVNElOlgpyND18iunystSTQIlTaM8OcivZhqf9W8Ngye
	27ttultHLE+V9ub0HrrsMb6iZi5KMiVXXMdyQrlJOJFCV0p9LDszOhbbRfgL3630KYGMmd3ma2L
	6ib1oJQne0yziM8rv+JF2eZvz5vEQWbklHjGM7/+o7yZ8h7hFm7eMdrlUwUI++H/Zg6kYQlvlrr
	yZh5G4EVJoclJrgoDudFgnatLpQrzcx2Ub10bx7q+WTDNNGaEpoiI8mI3/wJmeP9KXE5w4bf/xC
	Gpfxi5Poq5/n29ypZj8KGAz8U4m5bK0P+pbWh6NDSpO2wrAaRQJl+TKrlLjZ8Q==
X-Received: by 2002:a05:6402:1e8a:b0:6ba:b1fd:6e6e with SMTP id 4fb4d7f45d1cf-6bab1fd70a4mr14686626a12.31.1795898912726;
        Sat, 28 Nov 2026 12:48:32 -0800 (PST)
Received: from [192.168.0.15] ([2a02:a312:c59b:a180:251a:f25f:80fa:af1d])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba7b9570e9sm10798524a12.36.2026.11.28.12.48.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 12:48:31 -0800 (PST)
From: Artur Kowalski <arturkow2000@gmail.com>
Date: Sat, 28 Nov 2026 21:48:21 +0100
Subject: [PATCH] drm/tegra: gem: Fix mmap of arbitrary physical memory
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261128-tegra-drm-sec-fix-v1-1-81b9ef6d3185@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/yXMQQrCMBAF0KuEv+6AiVpqriIu0mRSR7DKTJVC6
 d3Fdvk2b4GxChuiW6D8FZPXiOh845DvaRyYpCA6hENovQ8dTTxooqJPMs5UZabj+dKlXNuT7ws
 ah7dylXk7r7fd9ukfnKd/hHX9AZQa8zR1AAAA
X-Change-ID: 20261128-tegra-drm-sec-fix-3598acf641bd
To: Thierry Reding <thierry.reding@kernel.org>, 
 Mikko Perttunen <mperttunen@nvidia.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Philipp Stanner <phasta@kernel.org>
Cc: Thierry Reding <treding@nvidia.com>, 
 Simona Vetter <simona.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org, 
 linux-tegra@vger.kernel.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, stable@vger.kernel.org, 
 Artur Kowalski <arturkow2000@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2770;
 i=arturkow2000@gmail.com; s=default; h=from:subject:message-id;
 bh=E1/Nc4IBmGC0o3h8MMbqBqavlkcy2FhQqp6eK0QTzMc=;
 b=owGbwMvMwCVmYeTc/TaVxZzxtFoSQza3nWSR7m5j65qHQmanVLPWLy7xd79kxRZef1o7QuvOG
 ym7RruOEhYGMS4GWTFFFrOHQl945nm93/ByayfMHFYmkCEMXJwCMJG6q4wMvZst/nu8ehwnY2H5
 xSk2ZGlG5vk5R38kazHcP3l6UXnDM4bvTn7rNczt9//yiHZqNSkw26bZGpT5NMY8z3nrOZmybfw A
X-Developer-Key: i=arturkow2000@gmail.com; a=openpgp;
 fpr=F60710C8D69E03A01A2801CD87A47D20C2709637

__tegra_gem_mmap() has no handling for imported dma-bufs: this driver owns
no pages array and no CPU mapping of it (bo->pages and bo->vaddr are
NULL), and on a platform where the Tegra DRM device is not behind a
driver-managed IOMMU domain, bo->iova is left at 0.

Such a buffer falls into the !bo->pages branch and is passed to
dma_mmap_wc() with a NULL CPU address and iova 0. On a no-IOMMU
configuration this maps physical address 0, and the following gem->size
bytes of unrelated physical memory, into the calling process. The
mapping is created writable, so a local user able to open the Tegra
render node and import a dma-buf (for example one exported from
/dev/video* by tegra-vde) can read and corrupt arbitrary physical
memory. On Tegra20 RAM starts at 0x0, so kernel memory is easily
accessible using moderately large buffers.

drm_gem_is_imported() must not be used to detect the import here: it
tests gem->import_attach, which this driver only sets when the buffer is
mapped into a driver-managed IOMMU domain, so it is false for imports on
no-IOMMU platforms -- exactly the vulnerable case. Test the
driver-private bo->dma_buf instead, which is set for every import.

Cc: stable@vger.kernel.org
Fixes: 49f821919bb9 ("drm/tegra: gem: Remove premature import restrictions")
Signed-off-by: Artur Kowalski <arturkow2000@gmail.com>
---
I've seen drivers handling this case by forwarding mmap call to the
exporter, but its non-trivial so I'm leaving it out of security patch.

Patch has been made with help of AI, hence, per security-bugs.rst I send
it as public. I have working reproducers.
---
 drivers/gpu/drm/tegra/gem.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/tegra/gem.c b/drivers/gpu/drm/tegra/gem.c
index f76af733ea79..3ed9e8918e57 100644
--- a/drivers/gpu/drm/tegra/gem.c
+++ b/drivers/gpu/drm/tegra/gem.c
@@ -581,6 +581,19 @@ int __tegra_gem_mmap(struct drm_gem_object *gem, struct vm_area_struct *vma)
 {
 	struct tegra_bo *bo = to_tegra_bo(gem);
 
+	/*
+	 * Reject mmap of imported buffers. Don't use drm_gem_is_imported, it
+	 * always returns false on platforms without IOMMU (e.g. Tegra20).
+	 * Without this check such a request reaches dma_mmap_wc() below
+	 * with a NULL CPU address and bo->iova, which is 0 on platforms without
+	 * a Tegra IOMMU domain, mapping unrelated physical memory into user
+	 * space.
+	 */
+	if (bo->dma_buf) {
+		drm_gem_vm_close(vma);
+		return -EINVAL;
+	}
+
 	if (!bo->pages) {
 		unsigned long vm_pgoff = vma->vm_pgoff;
 		int err;

---
base-commit: 8d7fe9885c62fc9a95bf55d9db244d9672a8aadc
change-id: 20261128-tegra-drm-sec-fix-3598acf641bd

Best regards,
--  
Artur Kowalski <arturkow2000@gmail.com>

