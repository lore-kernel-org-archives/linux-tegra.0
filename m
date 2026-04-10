Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 872913845DF
	for <linux-tegra@vger.kernel.org>; Fri, 10 Apr 2026 20:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775851541; cv=none; b=gi2mUwEn4KEPP2lzhlf++2N6pTHi3HlL4yajbogYJ8+xYCNNzUZ/jJgFeC1ENIY3NvGtzm0VbcJujFMuaxukUq7vAH3xYxbNFlmUUDLu4RT8jtVfvAh+sjT55VFGvMS2S7AlvgN4t+5LY7PL4I44LINJQy3/lKXEsMdgsIW3nnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775851541; c=relaxed/simple;
	bh=jYBaZSk47h49/UqT8e3PRQ67bwmqVz7cqB9iYdCKRk0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KKUUD1xm9RDo5AtelA1atCfajR7hgR7+Alb8dTugt6U/JebhbtNC87BGE2pSzOxm37AAvgGbh9RHBI1sINOe3kxVzbRkFLHD+2AYXPvka8fFvEGobu3fgPY/I5IoF80LeO3YMmOBZkhQzoEx/qQezTsjflwuCe7CIHlqwDgccf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UdcdsVAd; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UdcdsVAd"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2b2429f98d0so16419555ad.2
        for <linux-tegra@vger.kernel.org>; Fri, 10 Apr 2026 13:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775851540; x=1776456340; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wy1C3mjVH82pIZr4ZclKeuxKDX447EFpvhR4x2iEAno=;
        b=UdcdsVAd9LXtH6sXNs0AR91bj5d0EqTSFCw0cd5NfuDCY7ss2NWzYH1PGhIoL2fcN/
         aMmWNArWp3dTR0NcBy6RsE5MyObHLDXrizJW7L2OIWwwuSKyTdLN48MhGk9bRJrjlVC0
         9Dsf8cPtvknvCXSAN8yE3M1fjQqj+Mk/9eUCXrfKDnovPVDLMDnTgt0qt7EGq2MhPAdV
         9Ne4nqdxhVgwxID4wNYy/9cRpGxg2l0yvSLVr4ZdJt8PNF/anLVxmUcc7gdmXaIf0GRu
         ZAM642dibiw7+M/Vd2kThHriw2FoKEK65K1ccyenCMosLEGzwYKmh2ceC7IO2uPgB4Gu
         T0UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775851540; x=1776456340;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wy1C3mjVH82pIZr4ZclKeuxKDX447EFpvhR4x2iEAno=;
        b=Zp35FDVFo5a6SrGl2/MHpmQsse2Dzx+g6Osx8pJI4Pkn1we4lOfsliRdkvYsnu0z3d
         hs26MbbZSuqOdJ+gdKpga1Xg1nZGCeOSasM6Rj0rGnqcGinrSWTJFcfc3522f4P1aRJH
         ps/CwTQL1ZM+tsYI/kT5h09StY4HZFiOycXYPR4skKUIGdRXrH1cNDACjp7KcVf0OJpJ
         nyONKzOnG7nUNfE7/ePsOCwb2UNK6aD2gYKMkk0sQyW3wvKepWt51wxLLAc5oXAnGTF6
         jxCcxZVg8eFtK8iosmN8AqqerwhcWwB8qC/QTh0M28XBH13zkEsozX7FHEpy2N489T37
         rnWA==
X-Forwarded-Encrypted: i=1; AJvYcCXqJuMuJvbVfZ+gqS7at4+uEnRVgikg82Y4cHjOyuaAMXJ/0IG+4OH7PXgTr7vDhrL7RFIATxC9FnbyWA==@vger.kernel.org
X-Gm-Message-State: AOJu0YybXqiUaTrGyT46Itw3MLMHay8uXwB/MXqOj+DrM5SqYI+jZbbI
	wA9FAye7pGo91xQjUaKNAzJhioyMIPrpKheYS3nBAWFV78A57pDJTW+ts4ATWQGoC1I=
X-Gm-Gg: AeBDievwLVpSuJDTp3/Q8ZURN67KTitMZ97a6DQ9vZcRzAgotEaVbWSy6t4T8UdcS43
	uAGABFbFhlR8pM37+xggTpz6EhoENsmVR9onSc8kncE6EuBqfzVPloozWVMgP2nyYXBtMC3CnZX
	UPMSSbb3m6z8K+HBTJUZ1j+RCPwmVBls0sOMJL2/sqmKgASbyGx7SWmJ5QKXfpf3WybOB7xWB9F
	HBGkwYnX3BlPt3aLDhZU+P7aYlXeXYN2JOn7Nv2J2yIykT8Y0/vWYsCLxCVcxWmWUfsCtAM/Ks7
	gRCCIbPvV/76vhFxBcFHn73SLTmv8TVg7rdNtheubc3LXV38biDJjye2qzchE1qBHHMdUXLEzHx
	21s+2u9mcxe1hkiEnfWYFLVE+m1tCzrHIc/HUp0qu6LTBLKVkmDF7ndeIo+R1RoObNCXeByJlow
	k9XRTmzcuIvwJG15iHy9LM+zwXcMC3bjECKSBb+SVSUKhIgF5UyF/GiibezU2oIdztdAF++44na
	+EtSx3SkHdHsd7RIisWI0G34Bq+8N7gkptuH+Dj
X-Received: by 2002:a17:903:1207:b0:2b2:49a7:a5bd with SMTP id d9443c01a7336-2b2d591d9dcmr47814325ad.1.1775851539751;
        Fri, 10 Apr 2026 13:05:39 -0700 (PDT)
Received: from lord-daniel-VivoBook-ASUSLaptop-K3502ZA-S3502ZA.. ([2405:201:31:d01f:a107:5c92:b303:910a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2d4dabc08sm39569975ad.5.2026.04.10.13.05.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 13:05:39 -0700 (PDT)
From: Piyush Patle <piyushpatle228@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sheetal <sheetal@nvidia.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-sound@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] ASoC: tegra210: simplify ADX/AMX byte map get/put logic
Date: Sat, 11 Apr 2026 01:35:21 +0530
Message-ID: <20260410200530.171323-1-piyushpatle228@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Tegra210 ADX and AMX drivers both keep their "Byte Map N" ALSA
control state as a byte-packed u32 map[] array along with a separate
byte_mask[] bitmap. This is because the control range exposed to
userspace is [0, 256], where 256 is the "disabled" sentinel and
does not fit in a byte, so the two arrays have to be cross-checked
on every get()/put().

This series stores each slot as a u16 holding the user-visible
value directly, turning get_byte_map() into a direct return and
put_byte_map() into a compare-and-store. The hardware-facing packed
RAM word and the IN_BYTE_EN / OUT_BYTE_EN enable masks are computed
on the fly inside each write_map_ram() callback, which is the only
place that needs to know the hardware layout. The byte_mask[] field
is kept in the driver struct but allocated dynamically in probe()
using devm_kcalloc() with soc_data->byte_mask_size, and zeroed +
recomputed on each write_map_ram() call.

There is no userspace-visible ABI change. Control declarations,
ranges, initial values and handling of out-of-range writes is
preserved by treating values outside [0, 255] as disabled (256),
matching previous behavior. As a side effect each patch also fixes
a latent bug in put_byte_map() where an enabled-to-enabled value
change was not persisted.

The packed RAM word construction is also updated to ensure the shift
operates on a u32 value, avoiding potential undefined behavior due
to signed integer promotion.

Addresses TODO comments left in tegra210_{adx,amx}_get_byte_map().

Changes since v2:
 - Move byte_mask allocation back to probe() with devm_kcalloc()
   using soc_data->byte_mask_size; revert write_map_ram() to void
   and runtime_resume() to returning 0. Suggested by Jon Hunter.
 - Fix bits_per_mask: use BITS_PER_TYPE(*byte_mask) instead of the
   incorrect BITS_PER_TYPE(*map) * BITS_PER_BYTE. Reported by
   Mark Brown.
 - Drop <linux/slab.h> include (no longer needed without kfree).

Changes since v1:
 - Use dynamic sizing via soc_data->byte_mask_size instead of
   chip-specific constants. Suggested by Sheetal.
 - Replace magic numbers with TEGRA_{ADX,AMX}_SLOTS_PER_WORD
   and use BITS_PER_BYTE / BITS_PER_TYPE(). Suggested by Sheetal.
 - Add <linux/bits.h> include.

Patch 1/2: ASoC: tegra210_adx: simplify byte map get/put logic
Patch 2/2: ASoC: tegra210_amx: simplify byte map get/put logic

Piyush Patle (2):
  ASoC: tegra210_adx: simplify byte map get/put logic
  ASoC: tegra210_amx: simplify byte map get/put logic

 sound/soc/tegra/tegra210_adx.c | 85 ++++++++++++++++++----------------
 sound/soc/tegra/tegra210_adx.h |  5 +-
 sound/soc/tegra/tegra210_amx.c | 82 ++++++++++++++++----------------
 sound/soc/tegra/tegra210_amx.h |  5 +-
 4 files changed, 96 insertions(+), 81 deletions(-)

-- 
2.43.0

