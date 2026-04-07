Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52B113D0915
	for <linux-tegra@vger.kernel.org>; Tue,  7 Apr 2026 17:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775581405; cv=none; b=NixFDYTrLxiG8whPWEkIn2SwzAk6Xh0mPUCVWLfAYBjbqytT47k9B7nK0rbgHM0VmEq61cO5SId2xtaZ+k/aWPMrjfFx6rVcKzOxaOEMkf2GVVCNiQjdE7TIBrB+JE9ArNIaBzkbf6nc6GaXnvlGva7I243TUjAA/DSr6arLDBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775581405; c=relaxed/simple;
	bh=yS7fLPfpixS5ANKUpz+8IbWfPa7J2Jlmh+GVNICRquY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=pR8irovR/uaRRvPI85goBawEU9ugwZAgfQB7h+fWnYNNtQXnhKBhEoGE33eMVmVRlcb1LiQq6QgyD7FG7jKIogduAyTJryMDodFCkVgjey4cI+J4SYU4I1I7QY/08OMTRHJJCCSoCEESHYioa2m3y5MN2ymfGXc+YdTJoRij3JY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bz9AiL+t; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bz9AiL+t"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2ad9a9be502so34092855ad.0
        for <linux-tegra@vger.kernel.org>; Tue, 07 Apr 2026 10:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775581404; x=1776186204; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=USinWtrK9cNysHqIyf7r5O6B/9/TrlyTmryTw2WVrbs=;
        b=bz9AiL+twoSLeq+CzPPAgwn4mWno8WWwjt/NBjC0PvxmAPk3tfCLAF5FpfgNQzdGCn
         7JBHv/wyjnuE3m6L7Bc1g0vJmZsKEsUTBA+Uj5KknjQBrH8d0o54ncQQohhx6SxNqpbv
         EpsYeenlfUqc58p85pTdptppS8hk8TQOxqYFkc8+4ON2uQhDM75w4R0eSI4Z+9MFfvyt
         FdIAXzb7vbkzq07NSr2syksKv4NCNFTz7cbWWSAl9k7C4bOiMmD9Wfg/+M7fwCl27CG1
         iEyQeNcLYqIEMqjZ9/0vJ4XctDEA2t16QsrZlO4VyHiGf36lAuyT4aLscnSOxsbVp0CR
         2wIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775581404; x=1776186204;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=USinWtrK9cNysHqIyf7r5O6B/9/TrlyTmryTw2WVrbs=;
        b=mGwle1bc9MIwymcFrxLNgJSks0OWB06knjZsh0I5ZDFO4cxC/+Ct/0Itebi+8GOJTI
         o46AAmAZPGTE/QaY/OflG04U/SBePqM4+Tm31aZftVIc3nmB48rZW0G32fZLphO/to9z
         CP1f12itzYaq8J9ZbMSwug7Lpj9RFQtYLaNJXyE7OcC4nYsDixtv9PrNsYflIn++U61c
         Lwx4U+D3HGkWa06a2FkSgNrwVGRKzLdDpKaTSDJurUVojBAc9tRhpf7dw7NMO49Th3df
         XW/JugccCE7crofh1iXqAFvKGfgXwjvDmVzBeZbR6eDsPEqZ2NLe2CXaBYNVT6NyeKlh
         gPsA==
X-Forwarded-Encrypted: i=1; AJvYcCV51Uyp9ziiLj6HaBFEk74aXjwvmIQ0Z1KKbKk2dIDUxSh2AKvwC0wTpoWzg6s1Oew1YpsL4d8dJZ5EVQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwDsWjehoiooiItKTTG15DgQ9INXJD9q8z/Xxbmbsb1Nkq+vax/
	9Tx+xaHtRqkH+5xJULispEE/RzCq/XY4PTaYckw7tdndYZVUoJ9oCNAq
X-Gm-Gg: AeBDieuorFY/Yc5TxW7baGgvPI7WEDI18iER782v0TrmLUVJlev/tuCs3lalKShnfUh
	933B91r4m/0fMN1bJWJfsW303AdZyUmFU3AO/e9mxS4upyyBOnikhWT1Q2KxEnVPM9iSSxObLgd
	7/gfVp/Gr2b7g6dSPRnA7FJgEkXl90zs8jYR0rXmq85y4C0tnWw14GqGy5S6QR8lc/Ovb6WgzDc
	K9bCS4ukrV0hmNU2V5rMSp0mXakGJkJ/QyXzD9TnVT/gFhqKd5HPNEXByDOBh2AfiHHRkkJAIqW
	lgbFxlLOOXz1eiC+0uNAcO30vL11h85q2PKT+7flu5NmswelbS5n0ymgfmGqtYTUGkykO2dZECf
	0DvnRopG9zVin0G7QAtMSUiED4nkMDUEexpP+kKKINX2XYaMDWsPuV3fb1HeBLFtnl6a2YishiK
	lmlNFvgpVaHHpTVTl4LLgBZBFDSYUmFmUqpnSH0OlpOQMdjaCiSV15X7IHnoimpcBJddRNMY2hE
	XWzxLTEc+l7S386n/ht11DsKmkSgeJv3AeqhNpgimVRTiptO8HYFDyD6Q==
X-Received: by 2002:a17:903:3c47:b0:2b0:67a7:5c4b with SMTP id d9443c01a7336-2b281802d24mr196869375ad.28.1775581403501;
        Tue, 07 Apr 2026 10:03:23 -0700 (PDT)
Received: from lorddaniel-VivoBook-ASUSLaptop-K3502ZA-S3502ZA.www.tendawifi.com ([14.139.108.62])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b27478cb4fsm196617905ad.29.2026.04.07.10.03.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 10:03:22 -0700 (PDT)
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
Subject: [PATCH 0/2] ASoC: tegra210: simplify byte map handling in ADX and AMX
Date: Tue,  7 Apr 2026 22:33:06 +0530
Message-Id: <20260407170308.100238-1-piyushpatle228@gmail.com>
X-Mailer: git-send-email 2.34.1
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
is dropped from both driver state structs.

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

Patch 1/2: ASoC: tegra210_adx: simplify byte map get/put logic
Patch 2/2: ASoC: tegra210_amx: simplify byte map get/put logic

-- 
2.34.1

