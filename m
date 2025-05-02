Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF1D82417DE
	for <linux-tegra@vger.kernel.org>; Fri,  2 May 2025 10:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746183120; cv=none; b=LHSivPp5qSFvV2PSX9uCBNH1NbnlOdmWkepCVAmwAxMfE5OYzhLUlFnx/FSE3UGw2VGSTW2d1b2J/wx2C0VDieG0I4J3+gT0ekfY+61Wbx6fZ6nbgE17jDQ6P9DGtCjcVCod2yFo6iSOpfBL2thwFNdCdwAVlR6t16pOXHP6vIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746183120; c=relaxed/simple;
	bh=0uPHl+JKsAOJ9sDRh8lKshqI4ciquTUm5Xwj42FnyZA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L/zLeedqdb1O991FknjZni1SElaV4otbCbV1gbLnsAh/4alUxvsGHVR6SIPor1iyME+SlHVYQEfvSEB6pF2GaC6KTZ54sa1/gMjnQgLs2P6EDOp1WQJEf+893WSY5id2zdogSojxfteKs5PStaQkVKfaDpt1Fz1as3W9yqKd2Vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LIoKqBSK; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LIoKqBSK"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43cf58eea0fso7342655e9.0
        for <linux-tegra@vger.kernel.org>; Fri, 02 May 2025 03:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746183116; x=1746787916; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aRdXs5rbhlDN2keohW+Yxv/pOyDwK0v6kHn5yhxOBCQ=;
        b=LIoKqBSKLVHEr2RA4zwNREMNg80Id2AI8IyX5vjoGk3TeOPLT3eqUqcGKJTEM8StgS
         D4TNGAvhLDPS+5aEprtXIQvAr1Y6MwzgCLLV1PAFEv1NnMmIBSGWu5MENq1CaBGMFbZa
         DY+zujf+6HXIO3v1wy0lkSgDyDBZ/bqMqFejpXGvoyTOEtR8S6eNCfmGA6XRoWmvfQKB
         jdKlHF1x3C6O4L1elYsgtYF50MCntuoruwBD6074uOpNb+qyUEMzPwwexrJ5Ir5Vgonb
         xP4GCtMp0mnBYJVJ3KlJ0g2LsM9l91lzZB3OCov7XRDfJfgw2reonEocyF6PUlu9Wa5l
         blaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746183116; x=1746787916;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aRdXs5rbhlDN2keohW+Yxv/pOyDwK0v6kHn5yhxOBCQ=;
        b=tDrrgTQE0Kktt0rHQsuezh4VMNajlL3s8EtAy6znDz2sT5Ab0VxnohFTnBX55Xs3BC
         kH2mf/xK1N0ZmEODekevivLoBlekei6bv0fq9vrU+sVBzsLUgdEbtoXq8m8CLBS2CwEI
         D2mVfL2aGwl1VahOTQwyil+Qp6e0n/7CRbsjo+BYTR2XUNe19VFeW5xzcW4FzT4Qu41m
         lrv4LOxchIYICWNIcJNyAMkG9U/YARCXNvKaElDM/eCoK5B4R8EiyeQGaWvhvidYvlZJ
         fmYPy87WDbXYXb3jwbY7cKQkW6ubP/ZLfQ9cK8tkHjpYm33LgE2oOAOA47dfsn4scs/q
         omIQ==
X-Forwarded-Encrypted: i=1; AJvYcCWZcYs0v2b3yT03QJB/2K66wKCGXDVkGTRZBEK11Fate/Hi+2Hg0ImAuvbMFZNMyoy4ESwONpAIzyHV6g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzyY+wGXu7+ejfoPhQYE9s44I9iptvznOow0cVibdr0mQROZmMb
	F4QzeKxWqXtqGu28rQpgdztb3cYInVk0tT2V9IfUiqLUb36fPhWt/nBfLOG/G1I=
X-Gm-Gg: ASbGncu7xTENem7H4bH8eCZ8odI2SmsiXIzwN6r8v1YwuOQ+GAxSsREMq0/klLE+BB6
	MIrik/qGppA+ddg8DIEdWGHqnHB+GxdW0Mj1loEmkyFnagurqy/RWB7d+HNiJK+JZnajf6juhm5
	gaDglVuNGbBIi/ET+R6JMAxfTvX6L4G+BgQQz1lKRPE5sIxIpOAIeAlb1KTy0Utdx73gQ4CsFYL
	E5xkKCAFxVqjJ10rBBKYLxGqszYnjpUj118/pIrk38hLmMm4uVILI1ngnJbowWs4+nkG+MgEzWk
	HdS+uPgJeWaeTQGe133hYpSIW0mHBfB7yWJhfJiODw5sa8pE59fpoEQbButoasQW6GOgi1M6SeT
	X3HQ=
X-Google-Smtp-Source: AGHT+IFRnGNbLPkos0AOjKBTxhwusA6Jdyu+EXTCwoVRh0zl7lML0HixTtNT14lxd6CpT8T/JzkcOA==
X-Received: by 2002:a05:600c:8218:b0:43c:f616:f08 with SMTP id 5b1f17b1804b1-441bbec1835mr18848105e9.8.1746183115889;
        Fri, 02 May 2025 03:51:55 -0700 (PDT)
Received: from mai.linaro.org (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b2ad76a2sm87172035e9.6.2025.05.02.03.51.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 03:51:55 -0700 (PDT)
Date: Fri, 2 May 2025 12:51:53 +0200
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Robert Lin <robelin@nvidia.com>, thierry.reding@gmail.com,
	tglx@linutronix.de, pohsuns@nvidia.com,
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
	sumitg@nvidia.com
Subject: Re: [PATCH v7 1/3] clocksource/drivers/timer-tegra186: add
 WDIOC_GETTIMELEFT support
Message-ID: <aBSjyZJ0__ctBa-4@mai.linaro.org>
References: <20250502043727.396896-1-robelin@nvidia.com>
 <20250502043727.396896-2-robelin@nvidia.com>
 <aBSOJTlQUUnFIEVr@mai.linaro.org>
 <af0e0ab4-89d5-4f77-86c7-90d2bc3e13dd@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <af0e0ab4-89d5-4f77-86c7-90d2bc3e13dd@nvidia.com>

On Fri, May 02, 2025 at 11:16:17AM +0100, Jon Hunter wrote:
> 
> 
> On 02/05/2025 10:19, Daniel Lezcano wrote:
> > On Fri, May 02, 2025 at 12:37:25PM +0800, Robert Lin wrote:
> > > From: Pohsun Su <pohsuns@nvidia.com>
> > > 
> > > This change adds support for WDIOC_GETTIMELEFT so userspace
> > > programs can get the number of seconds before system reset by
> > > the watchdog timer via ioctl.
> > > 
> > > Signed-off-by: Pohsun Su <pohsuns@nvidia.com>
> > > Signed-off-by: Robert Lin <robelin@nvidia.com>
> > > ---
> > >   drivers/clocksource/timer-tegra186.c | 64 +++++++++++++++++++++++++++-
> > >   1 file changed, 63 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/clocksource/timer-tegra186.c b/drivers/clocksource/timer-tegra186.c
> > > index ea742889ee06..8d5698770cbd 100644
> > > --- a/drivers/clocksource/timer-tegra186.c
> > > +++ b/drivers/clocksource/timer-tegra186.c
> > > @@ -1,8 +1,9 @@
> > >   // SPDX-License-Identifier: GPL-2.0-only
> > >   /*
> > > - * Copyright (c) 2019-2020 NVIDIA Corporation. All rights reserved.
> > > + * Copyright (c) 2019-2025 NVIDIA Corporation. All rights reserved.
> > >    */
> > > +#include <linux/bitfield.h>
> > >   #include <linux/clocksource.h>
> > >   #include <linux/module.h>
> > >   #include <linux/interrupt.h>
> > > @@ -30,6 +31,7 @@
> > >   #define TMRSR 0x004
> > >   #define  TMRSR_INTR_CLR BIT(30)
> > > +#define  TMRSR_PCV GENMASK(28, 0)
> > >   #define TMRCSSR 0x008
> > >   #define  TMRCSSR_SRC_USEC (0 << 0)
> > > @@ -46,6 +48,9 @@
> > >   #define  WDTCR_TIMER_SOURCE_MASK 0xf
> > >   #define  WDTCR_TIMER_SOURCE(x) ((x) & 0xf)
> > > +#define WDTSR 0x004
> > > +#define  WDTSR_CURRENT_EXPIRATION_COUNT GENMASK(14, 12)
> > > +
> > >   #define WDTCMDR 0x008
> > >   #define  WDTCMDR_DISABLE_COUNTER BIT(1)
> > >   #define  WDTCMDR_START_COUNTER BIT(0)
> > > @@ -235,12 +240,69 @@ static int tegra186_wdt_set_timeout(struct watchdog_device *wdd,
> > >   	return 0;
> > >   }
> > > +static unsigned int tegra186_wdt_get_timeleft(struct watchdog_device *wdd)
> > > +{
> > > +	struct tegra186_wdt *wdt = to_tegra186_wdt(wdd);
> > > +	u32 expiration, val;
> > > +	u64 timeleft;
> > > +
> > > +	if (!watchdog_active(&wdt->base)) {
> > > +		/* return zero if the watchdog timer is not activated. */
> > > +		return 0;
> > > +	}
> > > +
> > > +	/*
> > > +	 * Reset occurs on the fifth expiration of the
> > > +	 * watchdog timer and so when the watchdog timer is configured,
> > > +	 * the actual value programmed into the counter is 1/5 of the
> > > +	 * timeout value. Once the counter reaches 0, expiration count
> > > +	 * will be increased by 1 and the down counter restarts.
> > > +	 * Hence to get the time left before system reset we must
> > > +	 * combine 2 parts:
> > > +	 * 1. value of the current down counter
> > > +	 * 2. (number of counter expirations remaining) * (timeout/5)
> > > +	 */
> > > +
> > > +	/* Get the current number of counter expirations. Should be a
> > > +	 * value between 0 and 4
> > > +	 */
> > > +	val = readl_relaxed(wdt->regs + WDTSR);
> > > +	expiration = FIELD_GET(WDTSR_CURRENT_EXPIRATION_COUNT, val);
> > > +	if (WARN_ON(expiration > 4))
> > > +		return 0;
> > 
> > Each call will generate a big warning in the message. May be simpler
> > to add a pr_err() with an explicit message.
> 
> I prefer the WARN. This should never happen. If we do change this, then
> dev_WARN() might be more appropriate, but I think that this is fine too.

The function tegra186_wdt_get_timeleft() is triggered from userspace
via an ioctl or sysfs. The documentation process/coding-style.rst says:

"""
Do not WARN lightly
*******************

WARN*() is intended for unexpected, this-should-never-happen situations.
WARN*() macros are not to be used for anything that is expected to happen
during normal operation. These are not pre- or post-condition asserts, for
example. Again: WARN*() must not be used for a condition that is expected
to trigger easily, for example, by user space actions. pr_warn_once() is a
possible alternative, if you need to notify the user of a problem.
"""

I understand it is important to check the return value in order to
have a consistent result when computing the remaining time but that
should not trigger a warning each time.

[ ... ]

> > > +	/*
> > > +	 * Convert the current counter value to seconds,
> > > +	 * rounding up to the nearest second. Cast u64 to
> > > +	 * u32 under the assumption that no overflow happens
> > > +	 * when coverting to seconds.
> > > +	 */
> > > +	timeleft = (timeleft + USEC_PER_SEC / 2) / USEC_PER_SEC;
> > 
> > Did you check there is a macro fitting the need in math.h ?
> 
> I had a quick look, but looking again, I see we can use
> DIV_ROUND_CLOSEST_ULL() here.

What about 'roundup()' ?

> > > +	if (WARN_ON(timeleft > U32_MAX))
> > 
> > s/WARN_ON/pr_err/
> 
> Why? Again this is not expected. I think that this is fine.

[ ... ]

-- 

 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
