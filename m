Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1613917DFE7
	for <linux-tegra@vger.kernel.org>; Thu, 31 Jul 2025 21:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753996968; cv=none; b=iXwd5pkYUWEstJV/tB5iDmcYBp5VBqtDhGnxyyxQ85n54yqNO97wyf/+JGQIUJPo69oJ4N04KpuqNpuE+dlIp8E52aItsD8fEFKc/mrl1RM2n5JnBkEwm2r8mpuTdpMVO+V9mKXMih/qvYtIx/h0x/HtnWU01whiERkpdjC5kXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753996968; c=relaxed/simple;
	bh=h6uPXWKE4LGLvz9j7oE3cBkxKmNbvJCKBz0w+rcFDM8=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=B7mDLtMqmR5AX5ptp1siPXyUR7qggOK4DgXyL7g/DQAhwwy//NvYSxuM/5E5gMdzBvppDhHqT9wU71AQUTAijqwqe3uQD6Zudgz4BCHLvhEFITr2o8KTuuUyxXrKKN6gYYm0R1LnDShbV5IB+JjMuUHnpcjS4Fr8ayBC2mCrlJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FSu5FCBq; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FSu5FCBq"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-32b5931037eso11235031fa.2
        for <linux-tegra@vger.kernel.org>; Thu, 31 Jul 2025 14:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753996964; x=1754601764; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=h6uPXWKE4LGLvz9j7oE3cBkxKmNbvJCKBz0w+rcFDM8=;
        b=FSu5FCBqWtfAgtoYo7Vv9MKw/ziayGtTx4WrPbIbiKKml09wPtLZdjUxl5Y/9XOADT
         4e/oi3hCPWPex/fKPZuzwoZpBhBpm6xIfWAqyKQiRvxIEXma3GigEGjlEUhceYnz4zJT
         sGhBMEaH0QdmfIMZmfurqc7fbRng+Y4E4SlRLukwGDwWeHnGuBefCgdpWB0epMXPhre9
         jkK93a1PYdSyRIEsosI903k6oiyMiB0m2DdX2KwaQrsn0CzGMNnFr8zhnihr3S0FfMyn
         DdAkaAKzNstzkGuNqz3rXuGITs1aBzzqtT3fZd4kbDKRQ/ODFhTBjjla5ZSN0WruYYfU
         Wi4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753996964; x=1754601764;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h6uPXWKE4LGLvz9j7oE3cBkxKmNbvJCKBz0w+rcFDM8=;
        b=MBAOyMqfrnIztmZKWFlrRLvDG9yGBEl0cnsozyyIjHlt0ZYgdZoDG8j3LrFXzr3058
         WYETwC56WKFXF536s00fLRMGmQ0v7AKzViW6+DjHAm3koHJ8PcKck+i5hAEals5EVbLE
         vhQz5e//HWMVR/fpsq9cmQ6LOCJuqF2Xk3DQ6OCV1yXImGcZzvN0PLYAK26+ejZ5DKo7
         x+CCRz8h7Jd5wfIB3CdO5Pc0oM3cmL1VaYcdahsle1WzaBx1MDqFWVuHeNDGxm2Ooilj
         1vjiYhEhz1UFOW2bsdLkK0zECC73K8GgPYBb16/U/2jMDQl6ClKRyuNpglmbpxy9uzVv
         pVyA==
X-Gm-Message-State: AOJu0Yw2b1DDMt6Ny8rgas948Yw69+PxNwFdJ4RjZW4wzShlUev7jasQ
	Ii3RAb+PdftfaY1eEpEVP9tq4oVnBbqu1i7k+rdP+hhCjVpGoqLL3zNtGpivLQsDu0NhO8aiI8q
	JlOOnxj8o0ae6jZngGNaKff9WomUpQEj2RtYNey8=
X-Gm-Gg: ASbGnctjpAY88qfE0m/NPCKvt+XDNiJKVq2bhv41i/vhP4XHou7vBvnAHMt4/uscZKl
	dpi3p3ErAzr39tydUrB+55T+s1sZ444mAiJ9fdvIA/r8S1fmc6yyYndqEGf1jOhAKvJqsP0+EsO
	MebTv2ElDW9Uzvd/gTWTiNTmeUqjdc5a/mrgPC0B+0x1MdRCWVT7cYDEyMZ/0ENhtJtKkETFde8
	cjRaAnioKxccMMO4Q==
X-Google-Smtp-Source: AGHT+IFR6MXPuUAohjjneuFFoh6ijwnnepA/iCQSQzF4KjwvxAQl0MBWkVqRYgrPIskVgC+b8wamfMMz8mM70lG5WwA=
X-Received: by 2002:a05:651c:1109:20b0:32b:7149:9396 with SMTP id
 38308e7fff4ca-33224c5ab93mr15066521fa.41.1753996963687; Thu, 31 Jul 2025
 14:22:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Aaron Kling <webgeek1234@gmail.com>
Date: Thu, 31 Jul 2025 16:22:32 -0500
X-Gm-Features: Ac12FXwOWR21dz0MR18VJUE0137D3QGw9RQlAUvTwo3Lga2XN_wAlbMc_DtTIfw
Message-ID: <CALHNRZ8uHmx3nqpg1-F6RCprDavx3nY55en5gJds54RU8MDR5Q@mail.gmail.com>
Subject: [REQUEST] Release Firmware to Match Current Driver Support
To: linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

This was originally discussed on the freedesktop issue tracker [0],
but there hasn't been a response there in 6 months. So I'm reopening
the discussion here.

* Nvdec firmware. The driver has been in the kernel for over three
years and there's still no available freely licensed firmware to use
with it.
* T234 vic firmware. The driver has supported the arch for almost
three years and freely licensed firmware still isn't available.
* Nvjpg firmware. The driver is awaiting final approval, probably
worth it to release the firmware with everything else.

* T194 nouveau firmware. This does not have driver support, but there
has been some interest in working on it. Making the firmware
available, even if it isn't merged to linux-firmware, would be one
less blocker for someone that doesn't work at Nvidia to work on
support.

Aaron Kling

[0] https://gitlab.freedesktop.org/drm/tegra/-/issues/4
