Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6455C364943
	for <linux-tegra@vger.kernel.org>; Mon, 22 Jun 2026 20:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782161607; cv=pass; b=Npjj1Ge++ORg1FtZ8vI1flotubr4x3qJ5gP8PDftcLUmJEcGqDupeFMhOCqAAb+h8VUc+IrsNfRl9Z+rLSFbiITd6Dt7GQnbVz5uuVEe2eSMNz6oWUnnUQzLO/cTP42hB/dSaxfnC81CAJ7Lm5W4EQ3I8i74n/pUvWYEmV88p60=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782161607; c=relaxed/simple;
	bh=IZlqlcNSuHxNQBV+rgdvf1lYfxlb8gM/yqEc6e36sNE=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=E9FzdObYYOWUyd7tFz74pJB4taaLPzdNvqgCwuGwkqTpN5Q+2+iS3Q33NqZVKJsaGPEmPBZuZW72uMpg/ovni5PwYFV2MahVUl4gXrAExyPp96lcOB9EqjwglA1W+bFIjw7gxk4pcz9eLDjkPdIRbcJv9Yq1rrBlh1qU5lDMHi8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HbW/C39M; arc=pass smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HbW/C39M"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-c892a0ef503so3069995a12.2
        for <linux-tegra@vger.kernel.org>; Mon, 22 Jun 2026 13:53:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782161605; cv=none;
        d=google.com; s=arc-20240605;
        b=Rto2fQPEhPg3DKOL5cfefmx/JLNzbeb7l3XrX/7oukVSbggAjVm1gq/TSgZ0zHgshb
         eqgEFisj6m3+0kTYzrCwldf6Fjn0Bd9uVOY8ayVRxNdgTjPfNHhEiWZRD/SAFC8UK84q
         3HswEG7ZUn6u9p9Lm9FlM2GMPDSBlYyKrVGyEJokTT+Nu9x9vcbTiIvMb0lwy7yCbbis
         nrRnVh/TvTKqr4PLfenHaYc6a0n2fQcMt1l4/PulOTtk7Ah42IdvMQsr3xzOWui1/r5G
         lVCY3GN7DBjk19AgtQzTlmX/rlsaT3n9479ecLRciUq5+uPdsTSwfJk5zAcWcG+fQ5TO
         WJPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=GP/vWkYY7RvVodKNR8gjRLk5ZQ95sE3bc8VVgjZKt5M=;
        fh=pjZWSol2iQurn9W8aVG/oQeaxKvlw2mcvbr13ABRPPc=;
        b=h8PUM+nm64DJy4vssd0UrDYkqcT1SPL+rD8I7X+XiNPUGQdYlJHYxoV6ip7QM96C49
         gdaQaWbda4nMAeVq2rJ6jhNcfn5PmEpV534y1bPBjd0JAVueT2iCVYD5eENv3L3Mph1S
         mCxJxG5Fj94eeq1QWm/TT5N4M5hRBzs17AHZuRfi97gWI61cNnaz+jGQvFvQlbR5vX0e
         mtoLDbbpyrzqPzbJ7RFrwl19LVRerKvQGzt3C+1xdDuzXijiU3QQUNv3uO+Y4hcFxs6A
         HFwEyT3alHxVak8IuSprjcU2XMTC19kf1byozsaWJTejckd3+7mUkRyZWFMMl3kFNz+l
         HLjQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782161605; x=1782766405; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GP/vWkYY7RvVodKNR8gjRLk5ZQ95sE3bc8VVgjZKt5M=;
        b=HbW/C39MrTZBcWqZbqgnpVmxcE/gzyZiFfTdWPLDPfEmy1pX40yTBHgW1ylXvIka85
         jex7BcWtodwkSJGeWBTDs3fMV0H4O8xA66WingNI5iV/6j1o2oYqVBPkzjr42dBn5Fhs
         lFPQzebU+1WCqLkxL5gWu6/pADI3x13wyrWK3pkXPt+Hrug3WLEdhGbwS4pE9lsK060C
         9ec9maGcRjwZi4N3//PMIay2/Ijnrf1Nh/GGGG0gwbi5D41QBMeV2rxerfPAb8gWZ+W3
         nOAKyAXyyIO1qtk5xhwa90k9pxBKGsuCHhh7sbPyRicWC78Lk+NKXoxe0eT9+V6iu5MY
         dbKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782161605; x=1782766405;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GP/vWkYY7RvVodKNR8gjRLk5ZQ95sE3bc8VVgjZKt5M=;
        b=ipR0Sv35LsKtAbwCMLP/S68x1l2ScUz2jJBt/dJTKuVBr1omyvbLno3+avyIJUP+1O
         AvEBTRpqBUfbXuppZXqFAjm/Lzro8J0hOJukim7ykyP7+u3/ci37xXVLTDZgk39M2Xhd
         o5IP6jRqf2/JZpnniIBp6mx+iOsDwD2uqKE6CS75OOm8QJx0eU6bsqiutFDm7cXgl2CX
         NApkYXFEArckPTpDR4TbCmkGPb2YzLJDQrRtMf5/oNfl4X83L4iiy9IpLIjW7JytrKA9
         32hLbV5I5b9CHZmp9AvTJ6pSAyy+zD1lfWUlUVIX9Zi+Yn38WhjfXJdLhSIsyk2rTF9f
         VONg==
X-Forwarded-Encrypted: i=1; AFNElJ8E4MXXSwwyxxQrowgnwZsoXCcneRPDjryPrUbHJiU76OKqi8h1dyJMBfYVxKvGhI0vKTHjlaPae6qSXg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwN2+jl2z+kKxMbgfcovLbiPOfYANOe0B1w6mNdD/+oj5PYwoGb
	YPvllSyBUeWtJ3E8k22SWWyi3erNeTg2e+UePVPlS51pe8pFZQkBz0PF7tLyHZSTIdSX3YitPMN
	ZdX6VRV2UJ35+E6AtQ2/oxcfb8MLpKzU=
X-Gm-Gg: AfdE7cmyTAE4pZjBpFps2LUmAFf5jPsWRDWWDAHfcAsBvyS9uQ/G+lQA6KjoKWRa8MK
	f5NoHYD3cN7OJJ0mZ92KvnigrXfJvpTv7mIfDHa9iyHpc7FHp2zohbI4+8JZmcWUNBinpEgA1zv
	UtjdFkvg4vqCGNTf/GPZYgrfjblJr95xD4Kdphb3N22hrg4FAJwhTnx2FH0JCKuWYG7Lpke5dkT
	ImCEoaSubT1+pNuf3pwgl5xjh4syBnTHok+9YU4+oTFqcyq/xJWHAWt+VUeSUXeKJmOy3tfKwSp
	sDFNehyF1vJBlGD6IDzC9IIx25cuz1bkOScGcTEmZC9IDAfX7FdBJUQNlszL6FiAyqzz0oiIsa3
	IkHupEA==
X-Received: by 2002:a05:6a00:7493:b0:842:614e:cc8a with SMTP id
 d2e1a72fcca58-845508671a0mr13997611b3a.28.1782161605504; Mon, 22 Jun 2026
 13:53:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Xin Long <lucien.xin@gmail.com>
Date: Mon, 22 Jun 2026 16:53:14 -0400
X-Gm-Features: AVVi8Cc_3MAGXc4qVj_tNP-2UqZ0Z21x-Vat7MlydZ4qTJDzcP-wTktbrkXRRew
Message-ID: <CADvbK_ds7751V7_ss+GbDCjje4UigT2DY+31KO-5o5zP0mnJdA@mail.gmail.com>
Subject: [ISSUE] crypto: tegra - a call trace is triggered in debug_smp_processor_id()
To: Akhil R <akhilrajeev@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Thierry Reding <thierry.reding@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>
Cc: linux-crypto@vger.kernel.org, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

[ 3968.199051] BUG: using smp_processor_id() in preemptible [00000000]
code: 15840000.crypto/897
[ 3968.199061] caller is debug_smp_processor_id+0x20/0x30
[ 3968.199075] CPU: 1 UID: 0 PID: 897 Comm: 15840000.crypto Kdump:
loaded Tainted: G        W      X   ------  ---
6.12.0-131.1473_2053543615.el10.aarch64+rt-64k #1 PREEMPT_RT
[ 3968.199080] Tainted: [W]=3DWARN, [X]=3DAUX
[ 3968.199081] Hardware name: NVIDIA NVIDIA IGX Orin Development
Kit/Jetson, BIOS 36.4.1-gcid-38375079 11/19/2024
[ 3968.199083] Call trace:
[ 3968.199084]  show_stack+0x34/0x98 (C)
[ 3968.199091]  dump_stack_lvl+0x80/0xa8
[ 3968.199095]  dump_stack+0x18/0x2c
[ 3968.199097]  check_preemption_disabled+0x114/0x120
[ 3968.199100]  debug_smp_processor_id+0x20/0x30
[ 3968.199102]  xfrm_trans_queue_net+0x30/0x100
[ 3968.199107]  xfrm_trans_queue+0x28/0x38
[ 3968.199110]  xfrm4_transport_finish+0xec/0x278
[ 3968.199114]  xfrm_input+0x60c/0xd90
[ 3968.199117]  xfrm_input_resume+0x20/0x138
[ 3968.199121]  esp_input_done+0x2c/0x50 [esp4]
[ 3968.199130]  authenc_verify_ahash_done+0x40/0x58
[ 3968.199135]  crypto_finalize_request+0x3c/0x90 [crypto_engine]
[ 3968.199142]  crypto_finalize_hash_request+0x18/0x30 [crypto_engine]
[ 3968.199145]  tegra_sha_do_one_req+0x4c/0xd0 [tegra_se]
[ 3968.199151]  crypto_pump_requests.constprop.0+0x150/0x2a0 [crypto_engine=
]
[ 3968.199154]  crypto_pump_work+0x1c/0x30 [crypto_engine]
[ 3968.199157]  kthread_worker_fn+0x100/0x2c0
[ 3968.199161]  kthread+0x114/0x130
[ 3968.199164]  ret_from_fork+0x10/0x20

These commits show that crypto_finalize_hash_request() and
crypto_finalize_skcipher_request() must be called under
local_bh_disable(). Maybe the similar thing should be done to NVIDIA=E2=80=
=99s
tegra crypto driver to avoid this warning.

56ddb9aa3b32 crypto: stm32/cryp - call finalize with bh disabled
a853450bf4c7 crypto: xilinx - call finalize with bh disabled
7f22421103c5 crypto: gemini - call finalize with bh disabled
dba633342994 crypto: amlogic - call finalize with bh disabled
f75a749b6d78 crypto: sun8i-ce - call finalize with bh disabled
b169b3766242 crypto: sun8i-ss - call finalize with bh disabled

Thanks.
