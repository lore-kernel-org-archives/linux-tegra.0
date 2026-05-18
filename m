Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8D943C5540
	for <linux-tegra@vger.kernel.org>; Mon, 18 May 2026 08:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779093097; cv=pass; b=nAhRAAfMXI2AqT6ZoCZLGfM2KflJoA5G/QY30whBjb5Hj2JPbXuRnqbd3GbcWYtAPfe49vD2oeBVOinR9D217lpRKRZ2rlcTiZAOsjD9pPDU5u4Xs5zMQZ12OnYXCjPaIUS1jWxJzt4sOk7uL4eJgOE6Aj3LlL1PKI/68NpeTvY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779093097; c=relaxed/simple;
	bh=DXjBimITY5H7LtNFJ4WtXw2YFpJ3YRTyr396f3fYQvM=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=n3eULa6GL9NYrJCScze0JX8zMHFXyv4JVu5DHmQYF52SHW+ahL2Y59jGq2QQGGATBj08edikd2JsInudP/REYsK72wUiSNCN4iHIAKwHSm4x1hrhbuznncPi0MMBGNaCbXIN/Ut6X/1fJbyuXUGuAILXGSpYNNKbw3diMMNudWs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eAHsLhaZ; arc=pass smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eAHsLhaZ"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5aa1b2327c8so1744599e87.0
        for <linux-tegra@vger.kernel.org>; Mon, 18 May 2026 01:31:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779093094; cv=none;
        d=google.com; s=arc-20240605;
        b=B37iXDgcWWY9T0tIAycTHm2JDI4x/1XZX4LnDXSKst9myAIxOpifUeIQ2P8m8Zkc4q
         LG9uVCK+IwizNWmVe/LdYOxnhIbYik6My7DJ1vkkM5wyDOuX+Ch4IPtSHCTgH5AQrdTX
         b0lab3ZCj4Y+EzTL+n3+EDmFKEmomo9KOcT59KhUd3W70NS/lGRT26CEAnaLgyHl7aTD
         D5+vCM98uPQ3ZoTZO5F/5ZZijBHSy5xdap6lVzx/yJ46W3WB+Dx4d0BQmtKGQ4pBs3kg
         kZ6/HmvMBaWc4k1s+Fi3tY0RYf3g1Kr2JheBg0ouyNYgT3P+0gI2sQpCKpssXxgqB4EY
         L++g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=DXjBimITY5H7LtNFJ4WtXw2YFpJ3YRTyr396f3fYQvM=;
        fh=yQjIb99tcKtm8agL9zSj7Z/0x0oE6aV9NmGhhcDNAGc=;
        b=QTGSvlpX0UD+QNJqMxsvfafm6aK0UJkY9xL3Er7wS/8/O2cT5zXmrmA24ckWV4TZqD
         2uOQAIg+w7L1Cpegs2hA1TkkfuJzZMFr0gQ07oOSQ7whuiy6R+bG2QRcs2SLfJvT55Lq
         /rvi2UvR2D6q1Byx+nCZuXlm5pb/aord6fPD3ARW2b2sEeHjnXe4RCo1pKFfdrExFLLX
         y2NioObnziPnsAb2Uy68sObe/vvGa/Z1/u2t2W+LzMKt6vXxQnhwZho94ClorTWLBhkJ
         7xfk9Szq0TC8QAClvrRl5EaY6/PuTtXWLmRd6slgbXHJ84mj6dk/Hyt/JI6hlQk+ZUmZ
         2P8A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779093094; x=1779697894; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=DXjBimITY5H7LtNFJ4WtXw2YFpJ3YRTyr396f3fYQvM=;
        b=eAHsLhaZucNJjlC7OviZujk3OxxlWmb8Ac3Yv8ShFrQe0Yvfb3rR98if6F5Ds6lDW+
         LuNYHigCrh/wvyLc40t0AB4azxHvUsoEW2QpZ/i8SdCu9yQmizhRhP5Qi5ykta2jr+g0
         I4haHz1HO90sLMOa5v9Cpl54c0TSTJs8AjNBahrxx97bkz295piWVrmnps66R1KNyPCa
         ShD760Ailkrr4cFSGnpcCGmXnq/m9hGKk4l0r4npEJkNAvrUnottWn3PUk9t3YNfKIQZ
         RQUJExDr7W+B7sE078o3CCwBvwlA1UiXqjtANzdeaDJ/b5Puxpk/f0OX0euRGb77Cm5N
         af3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779093094; x=1779697894;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DXjBimITY5H7LtNFJ4WtXw2YFpJ3YRTyr396f3fYQvM=;
        b=X55oS7QFeeUOqFCeEZGopaQrMNxFPB+H2ifHP/jom2KOCgsgfMWAm6QqXTgJqENtRh
         3QXizohYY2nEf3rfQ6o6GPONo01iNFyKXkQfLtTCLwA7cg+55c1EzteHWoFu/C10LkRr
         BrOrwIdLh49qPZzTT2MLerBoVHlxKA4CkBdavMpFnQk2MP9VtT0ROLjfdxtL8VERhGtE
         YkIYFKwI9bc+Nct13ePGeeiE7+mPZhb9N24qL6uYzeu+kpgGmzHCQy0WYy092/k2qo8i
         H22sxBCFM/dPWOy7nHVVw0pkkREEg9+xllVFy6aigW+uozZhzK9ff0uupPP43wM0FZuv
         5w8Q==
X-Forwarded-Encrypted: i=1; AFNElJ+vFZjebrcCUJM4C5EyqqLpfRWmaBaNOivGDYiDWK8qLEp58jydp2P4B4KBFbmXH90VePPFqhEv6jsc9A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yys560WyQ/FrdUTq4QfWCt8EhUmvPBX3G/BgOvLnGz0AEYmtC4m
	9L82QdBSgtWCSQVnDhvF/0I5NdvkH65XHgTUonzmX5dQjZnC71SjUdQT/FP8q9EGai7XWGO0w/B
	Nsi2RCMRPIhDGwaejssFbEL9M0/SCMMWk/YQj
X-Gm-Gg: Acq92OEJiGAqRE1ITrJnGvjxRQP1Aa24ph85yeYdOhEmLzc2eXeEIPhReuv4Ervc9XO
	pJB153NpptIJ7q3/Z/cPlzUv+onP+qnJQfzsrW4Fz0BL2dXkUh1GwFbD3J1aqHvJKVWvLgH2m6x
	bXDMHaajuYDv6d43Qalbnl58B7DdowMxzVK3+deuDEwPeRQgcOvxsv5oGmeWV/UtIXjzgqfSQx9
	oAm2WK5c5r4V9KabSztWbguNY+BhzIX1mFMLIY+OZUWcC/aaQ6sRpy261uVyJXvlVi64UXLky7i
	mrFRJo24ACRNpbzDXdStsKSWvDM7SKwdcjkI7Tr2T0JSAALJ0JLP+sdu6F3WwmcmNNQr
X-Received: by 2002:a05:6512:3f1b:b0:5a8:eae9:a21f with SMTP id
 2adb3069b0e04-5aa0e740453mr3631424e87.41.1779093093845; Mon, 18 May 2026
 01:31:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Aaron Kling <webgeek1234@gmail.com>
Date: Mon, 18 May 2026 03:31:22 -0500
X-Gm-Features: AVHnY4KpCYio1aV1Vz8BRbe1LIMHiOSmZcRfNWgqeCFliaqtqIVBAe6gbMiCbPw
Message-ID: <CALHNRZ8ngy6dqcjpA5v6=opDyisivGztE32uvNS+VRsOGhuY_g@mail.gmail.com>
Subject: [BUG] drm/nouveau: Tegra186 Broken Rendering
To: nouveau@lists.freedesktop.org, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Tegra186 rendering with nouveau is broken. See the p2771 video
attached to the related freedesktop issue [0] for an example. This
recording is via a pikvm and starts from boot. The bootloader logos
are fine, but around 33 seconds in when the kernel starts rendering
the LineageOS boot animation, there is intermittent breakage.

It has been suggested that this could be the display clocks being too
low, but all the clocks with 'disp' in the name are set to max_rate
except for nvdisplay_dsc and raising that to max via the bpmp debugfs
nodes makes no difference. The rate of the gpc clock also appears to
make no difference, if anything higher makes the problem worse. My
understanding is that gpc is the only clock that the kernel needs to
touch to scale the gpu clocks, and bpmp handles the rest. This issue
also existed before I implemented gp10b pstate support in nouveau, and
the subsequent devfreq support.

Does anyone have ideas what could be causing this? Or anywhere further
to look to debug this?

Aaron

[0] https://gitlab.freedesktop.org/drm/tegra/-/work_items/10
