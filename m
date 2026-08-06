Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 744F93A6B8F
	for <linux-tegra@vger.kernel.org>; Thu,  6 Aug 2026 07:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786001473; cv=pass; b=hkfC0rkW8uCTV6gWFEe6HJoqA8rUMOV299fz/sY27Fdle5+G+yvxX5fnozOg11fDVJ/9nbZ4YgHuP0/CRBF3GeZppjHxp1fKYR0PR+MNmgFLfU0JnMSr0kx+BBXRtYRk9YSSzhA3710Q6sUfccEyUiKNxG6i4s2WCfKhmL4LLDM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786001473; c=relaxed/simple;
	bh=cCy8hNBytO7JCihs71pSJO8ASKujFEFLUhGTIu5VSac=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xxwa21YspIXFVGBWe1Nv00RxJREb7yhBLD+PBhxLvTTlgvVlgDFqTPHSmLbO/TdYcKUyn9S1GYIVagPWLoqZmS3pTeA130U101drkPu/ALjuEuYNCwNgVfSkOl1H8HfIUN3de5r/KJEMOpgMVKm83qVmcZCWK3Fzokdb1vqkWdM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SoMB823g; arc=pass smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SoMB823g"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-84a4d8fd6ecso2306552b3a.1
        for <linux-tegra@vger.kernel.org>; Thu, 06 Aug 2026 00:31:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786001461; cv=none;
        d=google.com; s=arc-20260327;
        b=Rl7WrlSEFTfgWM2tVTDut9X4fgl1Mc+FtKfw8R+cA2f52YsCD5bg4tDcC19IEYJ3qp
         D+6taEbkeXaL8ExyM8VFD8I1Ofi4rLVu3rpmUzpgMEyeop5sKr7l0fXx0u6hQAGYg5KH
         0uyaeHpEleit5oCte6e+MWSDYnHWOTmqqy0F+XnhU/0oQuJ34SIWLc1O1u1HEgZ9zDR8
         Qs8V10Cu8IipnTWo9WTYiRsRBS9jMJZ4MDGMxQltPB8LPTFRLucAToJFsu5eMDTJULw+
         vLvu6Bgqtf7c05ANN0vtZXmd1J7HNl2FlOwU4W+PKbnXx52P115KnUFHyY+uqGlaT8Xv
         0BXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=cCy8hNBytO7JCihs71pSJO8ASKujFEFLUhGTIu5VSac=;
        fh=XAahXVvSqhZ3Y7nQQKdexAoBqy083IKPM3ULF68TVJE=;
        b=N+L3eXRUGo3cvEvYPNuMgnOa4lBl5Zb/DJcLDgCCwPwb1qWcvuzAKr5D2UF7hDeD+u
         w0YTPYr2RSRza8sPZkdTYZnzkGu9aMwrngxISLwrkcI5Ntsr+SVf+JKZKTgJKPRIczKp
         kCdSqj5gAcCZm9FAf1oQv6zemZ2yeROqGK8Wgj1EYpFKELY9VukdII1mUCryqN4bnF8b
         Rnk0PpC8ssljpEiRQKdT5n9uOG5uh38f0/uKtg0iX+zkH/l2OduD6lui98TA/PVhGdbG
         4+lDbNa3zosTFSFRG9wUHezQ6nbxFhz3/9pm3ZB3n2oJcfHg3QYNcWOeUyHT4tp62ORm
         EdrQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786001461; x=1786606261; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cCy8hNBytO7JCihs71pSJO8ASKujFEFLUhGTIu5VSac=;
        b=SoMB823gkJhh+OfcBaYymZmx6Dbb6UwyzCs2TfcHoQYe1SXaO3XvR8MrkQx4qWGLI9
         AL5tDcRGFFgVkIVBSYinB/WRKVOJtXYE+inAFxDHwOyEC+mKRR+CLl8RxmNPCts9C6kQ
         V91MwnvXe3i4OG5ha8yVHvj6oIwjCfOKFrxJZ5xI9VIOSdkvrtbpuFyDYJODZYgmJQPI
         NF3qk4w8RHwgvMpRF2cT/t9Ojj6DKWy8rHOOc1tB2EdaEb0MSnR+AFxVktGEVgeKUtZP
         OjMgfX3zy4CLDJFwrdHFK2HqIc/B5FauRzz2gc4iZKcX4nYFYvboDfyv40PTxJWiZr3/
         TnFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786001461; x=1786606261;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cCy8hNBytO7JCihs71pSJO8ASKujFEFLUhGTIu5VSac=;
        b=P+vQJDuanZaHWj3Maqd0/gaQ16a6mRdC1vhc2OufFuhK6/qrELw0WmutUWV6ImGaSz
         NYJroR2yiQ3crdC6YCl7RstrUnHPURY2uBVo5AEzpKngsOgBS7gPGJI7XaerDm8dvq3+
         XP6UQtKOSPY3Kd0p1OE7MziprHRZvdBCkRfxjozFoPARz/snelaPmp/a+xmUd464fVrW
         kjW7Q5EZIiE5yr+EUFMrSq0zdS9nWG6+tpYTiA7p879kGRncPpIW+p5WrgSL4+zXSOmG
         zLi7IHYJ+Nm5WbxNKiuBluRoVJCOkDGT4icDbpzAiW/kAF3Ufm2naP4RkqHpbg9mjUlu
         9u/Q==
X-Forwarded-Encrypted: i=1; AHgh+Rr3pdo/KuNACyA0a7DSF3ote/LpkPv7VqRJzXKlPRQ8/pCiNhhBLfkfE6hzXrb2ByoyGDdB05RIfQVMMA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzkTRwOu9Q+O1lvFg9LHviB8VsruvUmDjKj5mOJ6Y7pZePui06w
	My9FFHAeSJdyhy1vWjKA42xNKgHGoE2U5jItg/TFhZj8023b2Wf40L1/jZdW6UVSMHBhTTWyw0J
	9SCRj6RNWK5YBLrcZZ0SWl3BHnDqKE+I=
X-Gm-Gg: AR+sD12iuQyWYGxFhRI1Qmlk342s6caiD46z2JPvC4kOc8Ki0Yx0NvEO5q8sO6wHDoJ
	sccu5awkfKX1q8P6+6h03iZVqGeKUt3kormq74oNpJ/84e3HwQVXT9MPrdPv7756AuRBfzXRUTh
	5OSnCeSgOZUnTBZtA5Eq17o8aogEr20F6By9d6CgRGZRF8xD2e0bG7i0wR20RghWeJ0YdETZXWl
	AAt3h2ur6QAiA2mdO8PgSLqGnFy1VPwJd6E/rAuYDTsznJI7pcUXvPA9evxr4nuhFK6NSOt0dS8
	Xlg/GNixcQmK/cd3f7RqEHnH9QneHk0ines1e5CmhCMR5LM968Rawgg9yYvyqHAj9Tuy1bJYH0C
	aljvStzhtgfCyt70mR17drQmWuC0ygLW8iMbWvmD8ZUPvpBCw3GcOtvgA
X-Received: by 2002:a05:6a00:10d3:b0:845:36a0:9eb2 with SMTP id
 d2e1a72fcca58-84f2e13a5ecmr13832406b3a.34.1786001461253; Thu, 06 Aug 2026
 00:31:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260806063933.27331-1-phucduc.bui@gmail.com> <2026080654-glass-swiftness-7068@gregkh>
In-Reply-To: <2026080654-glass-swiftness-7068@gregkh>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Thu, 6 Aug 2026 14:30:48 +0700
X-Gm-Features: AUfX_mxyG0a57Dzpk39ihaHkRqHzR600KbxPXBwJyNP8FCTm6REQEj8d067Yt1o
Message-ID: <CAABR9nGBLoRdHUp_a35E-ASa6RzMu=z8GXDjPYw-ptAPfZ94kg@mail.gmail.com>
Subject: Re: [PATCH] usb: xhci: tegra: Propagate -EPROBE_DEFER from IRQ lookup
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Mathias Nyman <mathias.nyman@intel.com>, Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Greg,

Thank you for your feedback.

>
> As before, how was this found and tested?
>

I found this during code inspection while cleaning up probe functions in
the Rockchip ASoC drivers.

https://lore.kernel.org/all/20260806052136.21034-1-phucduc.bui@gmail.com/

platform_get_irq_optional() returns a positive IRQ number on success or
a negative error code on failure, including -EPROBE_DEFER. The driver
handled positive IRQ numbers but ignored -EPROBE_DEFER, continuing
probe without an IRQ instead of deferring.

I only compile-tested the change. I don't have the hardware to test this
path at runtime.

Best regards,
Phuc
