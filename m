Received: from mail-ed2-f16.google.com (mail-ed2-f16.google.com [74.125.228.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 373514DEC3E
	for <linux-tegra@vger.kernel.org>; Thu, 17 Sep 2026 19:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789672862; cv=pass; b=YeJTgyQ/Mb7Cx9ENDvoUBU0OX5eZ5M+jRGjSqE7XlzGnrHA8GCA2MlSt0sKEceS7ZNpM0d+hHONxuMKLKiNdinN7hZKzHr3Pq+TP+RAUhXez5aMAOVYf4fu1rt2aBddo/gYBTCGBgmUVnGeX9BtGFiqhG08iI+DQD47s/NFMwpU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789672862; c=relaxed/simple;
	bh=b9QDa9jgDjFjOwt4VJXvXKJT/NU+qXv7vzZtc7dxTcM=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=jIJTr5arpj1FcU2TyCnred8PAs6sYUY+ipNCp0IohTyUjRNPNyyohd80kMJSFdd++mjCkGpRJtoWLJ9XXr6cJmLj0htH3l957zdoKx4N4UeD+bz5mAaDjg9cLE4fKw/J5h74nmB/IkAwRoLsi1hJOIJ6q/GmohF+/nJZiP19gFo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pD7jIUHs; arc=pass smtp.client-ip=74.125.228.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pD7jIUHs"
Received: by mail-ed2-f16.google.com with SMTP id 4fb4d7f45d1cf-6a9984f9adcso2080518a12.0
        for <linux-tegra@vger.kernel.org>; Thu, 17 Sep 2026 12:21:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789672859; cv=none;
        d=google.com; s=arc-20260327;
        b=hTvBl5vBdMCCW3ZS0Utj5QiBA8ibMVGPMotv1CGlkGwQOtVUaROsSgMG5OTlEZa/WI
         10sFoQ8lvp7muujuS+uBHcOA6T7W1HsHbKDmhq11SrZzfRYzOAMp/exyJAWlwDBzZaau
         l9s/5/UX9lyOQA+BtJY5cWc85gZ4XTnaKvVRLO3mgQIa8b4Bxc2gzE8FES6s8j61ewuB
         6k19s9hLG854KO5U9e1Wq43YbkmDMLn6wi/4qzl2AP0cpF52KiiC+Km4ALl76uygbr/U
         h/9rMujBuYWRQACbAMd/MuuwHdwbm1jftN3mw4DkySJFoFZV+iJNuc5h7xVxv5iZlRPX
         61XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=J/A6MwTJDB3NeP/eALr2ie67LMze+zYTRsIK1+3o4Qg=;
        fh=2Iw3lle5Sud008q1lCMn/upJ6yNElXow7UQuRtX8U4I=;
        b=pX6HtAfc8i3HsKRkvZQO8gZ2/LhiLRtQUbLQUVWNRRvRXPk6uTLsxPCVgIs8kcJlk8
         UF2Nh0eDpg0qTQgukFDtiWUNI2E0a3coeZaQla5+OhpeLe7qVSIWM+SzwBrhZ4O/4UcZ
         InCktjZXILBzBIrRboE6+VNvwQjjHrDNrC91I6l+9cgEN6dlNPlm71MkZMe528mnzDKX
         GnptYA3MpPfHYRLTL1MhE3UZPz6f7zC/ueu/Txg1eQj/atGHTxiXMyDZjB4J+Iv1hXQr
         VlByQpwFPT1qYic1Nqz1S4v7ptfgw9oV4oZlstPsfnbj3GQHRb+hBqlfwf5+2Qq/AUc7
         JUwA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789672859; x=1790277659; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=J/A6MwTJDB3NeP/eALr2ie67LMze+zYTRsIK1+3o4Qg=;
        b=pD7jIUHsle3TBiQoOzuUuhbnc+dlnQP5N2AZvLOedAR4lMChd273hY8o7AUmPzhsol
         uV5bXZS6hAiKHkyg3X+pOTxqUlH5dXzSibYAvDdvIO0xBeG5QNViygc00le4zhHLkM+l
         KCyVOYuca+XdgxtPgRQqVvHynGK0AJxoLVx4Ki2JCnP5eIR9JBSxMbBbJZVSAmbem7RW
         R3Su80xiNWQrDpPBbXoGtm08CAk5kcIrWiSRhSTXhl0Bw9xKVETuV6cVKskBRyr7+FPK
         GNuR9Lax0UecR2pXSkqOPwSf/gDtmQ/227u2U5Ep5FJxMjxHyg9YoVgSadcyUlntB7rx
         wFTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789672859; x=1790277659;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=J/A6MwTJDB3NeP/eALr2ie67LMze+zYTRsIK1+3o4Qg=;
        b=vLUu8jfNdXBiGmgQSZ9WsevTP/SESXfy71xG4/KeIWyya2dYhuTZRPFaiWGJdrS4Iw
         NgYIugGLmlZ3QiP1xFWqtKHE5861Ohhq5LMldzxv2YTSdKY1tJycGkCyD0tjKwnGrKAr
         02tugeWi2tBFb0ZhXXGi3n2EdVld7qKr6mehwCym/76QNI8f332WpXtHDSau6T4Y03S+
         62rfpQ0Dw+BjZVAr+xPgmvdy1X35PmM6O6iEJRPVpis+E9T0huM1CA4GZu5ysDWqFbW+
         kH/yyI3NJryJ2DFlfs/lahQ9fy4PS+DTIyyD0HNhYR+mm+PNV14oY/bXoizu3o3wOpp9
         eWAQ==
X-Forwarded-Encrypted: i=1; AKwUvBz+T7ALwLFF0iD9TevSbsbdOzVAcvc/U8zXMJ3nkMSlgOapg645whRrt4iofIFog5l0y2isuJuC/1GAOw==@vger.kernel.org
X-Gm-Message-State: AFuF++kpUtZf2sIk6Ac5AqSoWC4apY9gIUjU6ZQT/H6r8LemPVjDR2en
	gOaeXlboxljqxVJ33/1VbEYu317/ZW/aOjsTQLDdWI8yJkqZ8EGhM6+s6ZNByKPd0SD7+ZyymMF
	QHhUjqj2f+IJSae7xz3J3sbbpWqu6wQ==
X-Gm-Gg: AYBFou0GKabKKFzKqXk7ceQy7+Fd48jzQdq2EAg9Bo7eNIhWLOWhCmrDAqk69Nc4ZJg
	XRcGagCzJUqoHeI4oIPO3CM06hhzlaUR80RAXvyX/jQdW5E1rDMKLF0T+/x77uHPlNJwiSGqJhR
	85lYaeN9l8J19NnloaRRepC5m1gDtkUifwb8sQL0NpBWSQ6SHh2ia3gBsxNr37pGAAlagT6YOXO
	leF0i8GaYw/kupzmS58F5yksEvWjzKzdPEjI5kaqryWhLDNki+l1grSTiRvCgscjJW0LVdeaQCV
	5dpVKMpLt+xi7P/QiLlb1eOGbJ8g7PgpN6k3kPCYBukqY0TEw/bMCb/IPQ5aqTIatphWDZ/9gmZ
	yqRmh10Dela3OVjwru6QC2ks3ZOQzjxgNRfRnz5tRVRqPFMSDmmjSPzYH3IjLzU4Snm4Z
X-Received: by 2002:a05:6402:234e:b0:6a9:bc61:7f80 with SMTP id
 4fb4d7f45d1cf-6aa22418ee6mr5676940a12.27.1789672858973; Thu, 17 Sep 2026
 12:20:58 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 17 Sep 2026 19:20:58 +0000
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 17 Sep 2026 19:20:58 +0000
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Myeonghun Pak <mhun512@gmail.com>
Date: Thu, 17 Sep 2026 19:20:58 +0000
X-Gm-Features: AcwNN1WxTWOhjEb7bBl6eypOV0BHfRXqW5W6uIymGwW7YeDpfpFb9TiYbq7J4Ek
Message-ID: <CAGEsz8F2eKsmV_tymO+9UD5xkS_tWhZo-b9Xom1_SiKuc-BCqg@mail.gmail.com>
Subject: [PATCH] usb: gadget: tegra-xudc: Disable port reset work on removal
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Ijae Kim <ae878000@gmail.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

The port status interrupt can schedule port_reset_war_work to handle the
Tegra210 port reset workaround. The remove path does not cancel this
work, so it can run after the PHYs and controller resources have been
released and access freed memory.

Disable and drain port_reset_war_work before tearing down the controller.
Use disable_delayed_work_sync() so that the interrupt handler cannot
queue the work again while the managed IRQ is still registered.

This issue was identified during our ongoing static-analysis research
while reviewing kernel code.

Fixes: 49db427232fe ("usb: gadget: Add UDC driver for tegra XUSB
device mode controller")
Cc: stable@vger.kernel.org # 6.10+
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/usb/gadget/udc/tegra-xudc.c |    1 +
 1 file changed, 1 insertion(+)

--- a/drivers/usb/gadget/udc/tegra-xudc.c
+++ b/drivers/usb/gadget/udc/tegra-xudc.c
@@ -3926,6 +3926,7 @@

 	pm_runtime_get_sync(xudc->dev);

+	disable_delayed_work_sync(&xudc->port_reset_war_work);
 	cancel_delayed_work_sync(&xudc->plc_reset_work);
 	cancel_work_sync(&xudc->usb_role_sw_work);

base-commit: df2908090cda368b01ff43709f51890076c56157
-- 
2.47.1
