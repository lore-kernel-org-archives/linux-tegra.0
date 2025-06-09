Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20401246789
	for <linux-tegra@vger.kernel.org>; Mon,  9 Jun 2025 03:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749438557; cv=none; b=Gf/sKeyVWvEEsiCe6pjALymnW3KdqAkVlwXNp8OxAE9MpOthtMvVtVgbWYkeEsaLFE2YDyoThcGkhBzk9qKb3GrzMxuPb1v0mWkTWIibRx7caiRzUT6/Rmc3rC1C14roDoDt/Hf1njJP7av1OffwQYo/calqxJQ0F8OONdrb4PU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749438557; c=relaxed/simple;
	bh=KII6ThsHrFR0MZOEBIGCKQlpsxQ2gXIhyRw5r9eyv5Q=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=H0HFbRACcRve0jAvlcCgq4dMCC+wTUsJV/tpBX0QUeFyZ2Iie+NsNTPTzzIEIPpsYBCPEg9Qda44dJOn9WFTYzstCbvYbLKGXw4NI7eeGrzsZ4cwqu3pGPBEbB02hfKVTqrTo8w+08riRGymThzuiE0A41gD3rS5wwqDQ0J3+ZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PxUf+Y/b; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PxUf+Y/b"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-553241d30b3so3560444e87.3
        for <linux-tegra@vger.kernel.org>; Sun, 08 Jun 2025 20:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749438553; x=1750043353; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vp9bW5+iE/Xm2g3bcTDWAPYnK2L65sPGkWKo6XuozWM=;
        b=PxUf+Y/bb18Cp2hyFFJUHS9AtKAtY8zUMVghFME5VhgCGVO3hsrEBnmXv9V/EzP7+O
         CG8MwBfTD40HlSWvclS14nFFItnLUFAH+AV2++qf9A5AmjS+Kjy6C3f7KMyUymyJXJ10
         S58ybXzwLMQb19aS/xBLv2mEV3SM13l/iMx1tTKahU54UFZcZG0GIYBNnrc9aKv9x+rS
         YV3tFdS+l1JftYBCo2oBT9HZDbY4YUEgmz8vOq+0nqwyXXr4edpv2hjhcH+frAPgax12
         YgzE3uVKdpNSLwP+npgHW0w9ArliNybOHXEZS8kpW8Oai9nqw+7YYUAvfKyUy5MjdXQ3
         DntQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749438553; x=1750043353;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vp9bW5+iE/Xm2g3bcTDWAPYnK2L65sPGkWKo6XuozWM=;
        b=pmZvhxDgAK8eWrSLFDkVJpX/lIhpaN2JXThRFC9aCpcTov0CyMrtG7qXvQspLLZrj1
         4hlIeFzCCJNfwbTZ9bDGMqvRKZgx2gZ5/fJYm7Dg6YucoRNGgOs2PkPEfRB8HvAs0/qf
         oF0uzJGCpgItvwXx5xSvWBjKao743fvEAKRJqkefVSFgI3JkoJZV4mpkA3m2kuspyVtD
         3QQMFPCCPSdNd6m4QBkrGerodkciPynrXRFSLwW/DJWvpyPfbBECTng2HGtw5I/e7FzJ
         DJl2ie0Z6dkp1AvEgqZ4v35j9DYW9dwdUC/ryZ2aAcNg9yHiZj3sG1qq6yEZsCUyqJN2
         13ew==
X-Gm-Message-State: AOJu0Yyqipqp7Iey3/gD8uhxF937+W5So2vuEZZWLC+0GFF9YkkPuEn+
	GMO7HN6EaCtZXwUhN1dd7oxjLHcyPRtvN1hPfdM9tN8t6T48dMvB7FXEuu8tC5ZnN1oQBzZKh76
	iqBHLh73z9JaSxGCINOluc0viYlW9x8Z+800i
X-Gm-Gg: ASbGncsiwmMnU5TRvW6o1yCEGeK8nn+A1jKtSV9G/afivXRArWeF7ekQegdzuqy7G8p
	rZf0op72LW2+7qjsFCo2wXPujK5viEkTCKxQRKvoBTGYV4wLPdp9f3fRzQSrUMJrtHrYPHx2Up9
	NAKBPVHLGTnerttu0v2g+9SxklS86xnELTiwa7MkQqLyY=
X-Google-Smtp-Source: AGHT+IHecKhCgkOy3Ts+IExm1cxxXOhBaW4jDg2gD9qfaFBZy1Uan6POeNnA2FL9phx4BLwZFdyv5SL225KkQJr+IUc=
X-Received: by 2002:a05:6512:3d28:b0:553:65bc:4231 with SMTP id
 2adb3069b0e04-55366bee1femr2590697e87.21.1749438552755; Sun, 08 Jun 2025
 20:09:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Aaron Kling <webgeek1234@gmail.com>
Date: Sun, 8 Jun 2025 22:09:01 -0500
X-Gm-Features: AX0GCFueNoG0oSdBEKHj09JhaThRBuC4fjCfbAQB1PkoQKUu849SYrDXQ0WyqyM
Message-ID: <CALHNRZ98_gh5dKw_GoayG4ieU3TWYAFFt29=495g4+dNLzwjbg@mail.gmail.com>
Subject: [BUG] cpufreq: tegra186: Denver cores do not register
To: linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

The boot logs when using the L4T r32.7.6 boot stack without u-boot show:

[    2.648162] cpufreq: cpufreq_policy_online: ->get() failed

I have traced this down to ndiv [0] being read as 0 for cpus 1 and 2.
Prior to "Share policy per cluster" [1], this would also fail for cpu
3, one of the a57 cores; but with the policy for 3 being shared with
0, the driver no longer tries to read its registers directly. This
issue has existed since at least 6.1, which is the earliest I've tried
to use Tegra186 on a mainline kernel.

I've tried to compare this driver to the downstream 4.9 version, which
does work as expected, but I do not see any differences to the
register offsets being read. If I hardcode ndiv to 35 for the failing
cpus to match what the downstream driver gets and what the other cpus
get with this driver, scaling appears to work properly. But that's not
a proper fix. Does anyone know why the registers for cpus 1-3 aren't
read properly while 0,4-5 are?

Sincerely,
Aaron Kling

[0] https://github.com/torvalds/linux/blob/19272b37aa4f83ca52bdf9c16d5d81bdd1354494/drivers/cpufreq/tegra186-cpufreq.c#L117
[1] https://github.com/torvalds/linux/commit/be4ae8c19492cd6d5de61ccb34ffb3f5ede5eec8
