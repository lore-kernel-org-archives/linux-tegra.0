Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7C263A4535
	for <linux-tegra@vger.kernel.org>; Mon, 13 Apr 2026 08:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776067409; cv=none; b=CUpRip5+z5ccTtWVzXDjulI4RUfMLHxa7tbdSCAeW/NAa3YQfxvLrynA7c2rfBFkj/kVp7hMYB5dSII9RfR/0QgpbI7b+MBKkTfLu4KQGv3vWINptS1KJw9YDvNz/WnnfSV5ZfBhs8V5pAkFG4h8YL4PCcPhwgGETJuVSNKy+2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776067409; c=relaxed/simple;
	bh=wAPCziRy3gqwNYDXtdaW7ysNJai/VXJp9vLcAm4gnsE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qTT1RbH9iAdtU2cqBtMMZggXvIwkKDEjqiv3q/ASLcRSmSYeYp2zsJjjzvH3FF2NHaLh1BdB4jWISjtE9uzeMnfZVClmM7yWZDOjCRBFIUTLiIQ8rBOzTWKRVSnQcg3XhAaPFZjCSewoa+bvVZm4nXg/cZmFlouLPULt+oeQpSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CMmWv0N2; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CMmWv0N2"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-488d2079582so35606475e9.2
        for <linux-tegra@vger.kernel.org>; Mon, 13 Apr 2026 01:03:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776067406; x=1776672206; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FdslTYfHiFdLBysZXJi70hRjVM/Tx0Yks32sBf4zOMo=;
        b=CMmWv0N2LkqUZ+GdzdOIWJ9f4WUHdMtzWEXZmryjG5sI+1p8RCVHpJrP7Vk2u05CRz
         OR8eHq4KPb6+8apkdcYIXTVT9xul/iMQ0jjzLnfIbcvn+fAWTCLLENgpcBMbY+VB+wjB
         vghwXedtqYtDrEv83f2hZZz6y+TNKlbM1r9Ze+P527Wo/1t2Hyz4ndxPrSZjzQ45eFq/
         4EtsPR4vplEMLqqCxgfK/Ke2R24VcN4neDM16EpwhxL8Z/P7KcXDERnRpiSSzSNuYbMb
         WJLg2V3FMyI2qPDh1UABxr6cuZUc7dnD7Q9MsbGvWhDwo5Mhks17Qpu7bLXvR9lsU0D0
         EvKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776067406; x=1776672206;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FdslTYfHiFdLBysZXJi70hRjVM/Tx0Yks32sBf4zOMo=;
        b=L1tDAz6ozPkgbZQGuWUSocAO7A1U5KLuCK8K1oLCP+B5AMfc+AdsQk27rzjuhSbw7G
         XnsYG5KfZFrpEBxc312VvcRQVq6o7uT+nMXjz5B7r947TYSTPaOkwrzKUmkiKR7Au7+C
         q5O2bKEu8MwTYQZv8poKKeP6RxZkGxVG4KoAtIhFkbJ3+iVOCkbeIAe7oFN85KCVKxob
         sEVWy0yfwi4V7GCGSavGxvY1VnpU8hi6hRF/b0YUCOofWBYpXsNiWNKlyS9JYFDDCLUu
         7TS/TMl5Yu3nvM4+CmIhsGX050xTyVnscSjoBKT0YAvNE45lyAmaqzT72XWMQ8jaRfP7
         f3aA==
X-Forwarded-Encrypted: i=1; AFNElJ+T6ntKtYm1Xz5gflPxuXV0873H5yDWcuSrgr3x5hLfD+oNInoTVCzKT6sruD3KmKHyHjc3sA+w88HQiQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzouVGcSb5HHZ6U8IlfvDw5h8XgEKHHsrpwvDwULuz8IzFQb8z9
	IZj5zlHy5Y0vksj8C7sUn5Ara8vyupwdNo5Dd1UiTgEDP2Xgd31Q/DIx
X-Gm-Gg: AeBDieugCrNfVTb2j1BsQdhmENrsqAWN43k3Xl4pCz0KHtapNu8yGNdJdoFqLJq7NY+
	YuqskXLSkHpSk3eMRdFZuZ1hr5AzZp4TMWr1tYuUvBdD4032jf7Jnvm061x5VdPu+PcURQ93Iz6
	NVK5wtfc0tlkXXtrQ+d0qKSClLBflsdZgSJQsaH0UC6jp6CoxjLOIyikT9BsulPF6BuL1jus9xw
	sADxxbt8p9I5PuiYKnIDrP0WLsWbk25oH3hEMG+FcG0Emk+BqycLDrCHFJTX6jDwrY8qpMcqYfI
	VSU3aXvG6kVPD4p/l7B2MxUkYoIvvrCQnvMLjkGlXliZLRJV9lSqr66KYZ/k1n/+9pPJReqJTRv
	cXJHq/bNGDofAuqX7dyIurlS++L18vID9FO2iEkN6Kvg0ngTdfdxJTSxfeJP5mgtSQN6GOf+159
	bCpiC06fE1MWtd3ZXKHtU=
X-Received: by 2002:a05:600c:45ce:b0:488:a8f0:35bd with SMTP id 5b1f17b1804b1-488d67df745mr174646595e9.8.1776067404611;
        Mon, 13 Apr 2026 01:03:24 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d5d703c1sm89816805e9.3.2026.04.13.01.03.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 01:03:23 -0700 (PDT)
Date: Mon, 13 Apr 2026 11:03:20 +0300
From: Dan Carpenter <error27@gmail.com>
To: Hungyu Lin <dennylin0707@gmail.com>
Cc: thierry.reding@gmail.com, jonathanh@nvidia.com, skomatineni@nvidia.com,
	luca.ceresoli@bootlin.com, mchehab@kernel.org,
	gregkh@linuxfoundation.org, linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: tegra-video: tegra210: ensure PHY is disabled in
 pg_mode stop path
Message-ID: <adyjSM70HcX5cq9s@stanley.mountain>
References: <20260412163600.29925-1-dennylin0707@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260412163600.29925-1-dennylin0707@gmail.com>

On Sun, Apr 12, 2026 at 04:36:00PM +0000, Hungyu Lin wrote:
> tegra210_csi_port_start_streaming() enables the CSI PHY regardless
> of pg_mode, but tegra210_csi_port_stop_streaming() skips disabling
> the PHY when pg_mode is set due to an early return.
> 
> Remove the early return so that the PHY disable path is always
> executed, ensuring consistent teardown.
> 
> Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
> ---

The obvious complaint is that this patch needs a Fixes tag.

The early return is suspicious but I don't believe you have tested this
patch.  It would be better to not send untested patches like this,
because there is a risk that the author wrote what they did deliberately.
This code is six years old now, so the original author has probably
moved on to a different project.  It's not necessarily that easy to
review and test the patch.

On the other hand, if someone from Nvidia wants to Ack this patch
then of course we'll merge the v2 of this which has a Fixes tag.
Just wait for someone from Nvidia to respond before resending.

regards,
dan carpenter

