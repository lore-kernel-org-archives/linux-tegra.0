Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3250E363C46
	for <linux-tegra@vger.kernel.org>; Thu, 10 Sep 2026 14:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789052346; cv=none; b=C4Mz9Uhe/k5Bcxa1pHVzj0QbFcGBPmqtaGBOwvg+tGKgXEECNgqBeJaXFPvfWDxdq39bZUm23lfTK1Pxafi/TeMxgtxtu/22zJNfOnQpCuIKDj2i0U/LUxY/QjgrAEPFapELZ4rfRh6hZxdhhkslsKxYq146jTg/InfA1rhlb5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789052346; c=relaxed/simple;
	bh=cbOTBvMZdiO0z8skHNW7txvLuuloKSvOYVBoDwBmD3g=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=V02VBmVx2Bgyokga8HjGid8dli3whCDe/Kb7oYexCe5O9x1RndKwXSS0FLUbglB0UTcTPMOJLboGYQyFrY/lR5qe1MKJaJqANoctKif0MdjqqpiChAHvUZ4HvLrL0VJcspcOYFjRw1zu5XxmDb9ALcDsPh9G8OUMwFS5DTnxjbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=D8oZUizZ; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="D8oZUizZ"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2d91ff7d9acso62549785ad.3
        for <linux-tegra@vger.kernel.org>; Thu, 10 Sep 2026 07:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1789052344; x=1789657144; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GdmwFMR5HkV5nVBcu9kXmR8/I8xftYUv5DQ3F4F+sIk=;
        b=D8oZUizZoJ+lQXyfSbVWCek0H9hfmVXt0ckaJZRp1uc+m7CRl6TCVc4z2npBqb5W62
         BhVAbjRcgAXXoPJVy81RD4Ny1i097ThtOBfANNFEBaN4jOk+heIi7FGYPgiWQIAHQ1Cv
         O4wb/xN4LJWUIv6sTMpFHziXSvuw1zWj1G6MxA0HZYfFJ4b9snn/y7qktC8Z4F4Mdzv/
         WlesadqvpokG2qXXid6dE6pNfy+o26kW8o/a0WjwSa9ciERpc8qpHniubm0de3Dz748R
         bYHGriNZ3ssKgqKFQRsEbjWIE0X2GVeYZmTCVZqTv5Nid55lJ5VWVSGyacrXQn++zXpn
         t+lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789052344; x=1789657144;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GdmwFMR5HkV5nVBcu9kXmR8/I8xftYUv5DQ3F4F+sIk=;
        b=ELvVjRfsyHL3mIMWANeNQibQVYPWB39p0TMypdJ+nIdWD6GMSLRgVhSQIsBhO8ABXR
         9r5BYXomNKlMPKML6gUa8eaRJhQ7yoFBgUQnsnXwlknAClEeMbjryOqAz9yrPU67bPcU
         owsHrNZbPDxLyU6kreXBTpp0ZWLcJk4NQbW5922FubnxoiS+3tpJ72QCIyQzF2jiTEzh
         X6htQMaj9zuF6MlxOK6FFDvxgz3aLLR3hVULybG4bjqRwTJ35/G/LMqHP9wPxTSEw2lx
         biXdrTLZhQTdQ/fDKwTi7AvABCJx5LjahH9FJK7Le+7l3bxbrcaSBb/UL/qZcE32VH3M
         GZWg==
X-Gm-Message-State: AFuF++m8tsLA65RNm9Hpsq6VJwzlnkx/cYElmB0GjvGOLeKF3sA2FRFV
	EKoswKSwwqzPe1b25j4VcbiEMrFAXunRi9iiWypjyfO4KcGzCVU2JLChp+xq028sq1SBdzXf/Gw
	kZNz3
X-Gm-Gg: AYBFou1GF49u+64dP3+91FCUT6ajm/xqiV4ENdY7n7ezmzvXtUel+DMx6m6OCYuwgmW
	QtKVjfjdPtFp3sER5dllLq2cBsuWp8LjS5VjipE35+9OR9fA+ku2bggebVIEbB7mOsxukiGkV3a
	Yqe+h0xq/leZs5PEgOK99v7jLKhcy0hnctXMLwZ3e37/kfqCUpOekQ0CN25kNSUZmJSzZ5bUKVX
	lP2fyCXXvGUA+U6SnZ/tsAGjGKXdhwVIhSPWRQpQ4yfMF5F0po2Bx7KLkUO7I8ZrN5OAJHSaEYG
	yXtn+BlYG7yVEU/+LQU8JVA7p2uYzC5pDVycRuD6bULKSXqmxsC03v+wzGgAG4QXDbZqdSJuwqO
	hHpmiQErJZPt5Rm4uwFPa0GFg3JhPrNlpLeiVYKBuJHi7UVkRROq9AGSOUjKuymyBq6nYXremnp
	rglMaK+w3/oBabjHzPZY3tz0svHT3DzMhgA7iy7K1mjAhNF1tABs9Y6AJifBeEiec=
X-Received: by 2002:a17:902:d4cf:b0:2d8:d4dd:24c0 with SMTP id d9443c01a7336-2db17743db2mr557466685ad.21.1789052344257;
        Thu, 10 Sep 2026 07:59:04 -0700 (PDT)
Received: from 41049dfc76e5 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339ac24d7esm83419266eec.15.2026.09.10.07.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 07:59:03 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [REGRESSION] tegra/for-next: (build)Lexical error: Unexpected 'x0' in
 arch/arm64/boot/dts/nvidia/tegra2...
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-tegra@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Thu, 10 Sep 2026 14:59:03 -0000
Message-ID: <178905234343.3919.16985173968804561026@kernelci.org>

New build issue found on tegra/for-next:

---
Lexical error: Unexpected 'x0' in arch/arm64/boot/dts/nvidia/tegra264-p3971-0089+p3834-0008.dtb (/tmp/kci/linux/arch/arm64/boot/dts/nvidia/tegra264.dtsi) [logspec:kbuild,kbuild.dtc.lexical_error]
---

Log excerpt:
=====================================================
Lexical error: /tmp/kci/linux/arch/arm64/boot/dts/nvidia/tegra264.dtsi:1589.23-25 Unexpected 'x0'
FATAL ERROR: Syntax error parsing input tree

=====================================================

When fixing this issue, please attribute this report according to the
patch submission rules:

Reported-by: kernelci.org bot <bot@kernelci.org>

For complete logs and details about the environment used, see the issue
on the KernelCI dashboard:

- dashboard: https://d.kernelci.org/i/maestro:dab98231d02e2c7f510e811ff57f48cf9a60463a
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git
- commit HEAD:  3eec0cd4c9a8caab67a4a0090e5a7ac342f04636

# Builds where the incident occurred:

## defconfig+lab-setup+kselftest on (arm64):
- compiler: gcc-14
- config: None
- dashboard: https://d.kernelci.org/build/maestro:6aa2b90d20239ade901c00e6

## defconfig+lab-setup+kselftest on (arm64):
- compiler: gcc-15
- config: None
- dashboard: https://d.kernelci.org/build/maestro:6aa2b90120239ade901c00d9

#kernelci issue maestro:dab98231d02e2c7f510e811ff57f48cf9a60463a

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
