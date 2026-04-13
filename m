Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF2DB3AC0E7
	for <linux-tegra@vger.kernel.org>; Mon, 13 Apr 2026 10:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776075916; cv=none; b=Lzwjyy1K8iaCkIlfR81IS0wvU+mX1icWQzJavr8HualLc73+tCuW3woKsZB70KAXb/i2z59iZgH4tss1nJVOWGEJHMnRwzjatuU8ZZTnUMdzNUVPdwavcGaPLjpqxKRycQJEn1H3/0da0xdrpHTqzEExL+jcySy0JIuaAhPvvqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776075916; c=relaxed/simple;
	bh=tirnI60t2LsfBYva0tZOm3rtvSohyY6FmeFwIA3hr7k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rWdx3U2NZcQkfKimkel1q7rMsbnkl4Hb+lEkZUsW0+J3jAtFha8qmI/IH9jXNWawsJCWNmAEN9lMWs7gBzYi1zaNZkolusTy56pzBBIp4hO2c6XyW03r63A4qHezv5T+5dQdvtXkungnGtk2T4logcVVs5nYqfby1DSyvzZXjCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AUMmMlJr; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AUMmMlJr"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-43d73352cf2so848905f8f.1
        for <linux-tegra@vger.kernel.org>; Mon, 13 Apr 2026 03:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776075913; x=1776680713; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pFl65q515usiQqNs+3hHpKzGMqiV4DMQZG4ZKRqr8MY=;
        b=AUMmMlJrrHFDFUPjq0Lc2w9dijwVi+vgrXIgX5K77I/fAx0oVXIIvNblLOU+4CsfCc
         h/K3I43wWaadzEaXt2Y0R3++dJy3QseQVbAUC3HaaS92y6YoqUL/tens1xcq9nyqMnSI
         SHuvHGcnV8+4jjR1cN6CNt1A2J8SneX/65QcF3fj4nrfn50d2LU71jVZBltHkspxTKf7
         k7/OjzKxvRJ1VkOM6tPoS1N8TAQwqZYdBUzt0tvzrnbaXF8s3P+SOKgNEltqjJfNP88a
         N5e1dzzKnIym6tPQiYMjJiKHVLiWoxObKNGgyUaiT1kreKgDOvdj0Vo/naiXL2SoKAUo
         odLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776075913; x=1776680713;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pFl65q515usiQqNs+3hHpKzGMqiV4DMQZG4ZKRqr8MY=;
        b=ZYk8iGKq5Wu+CHiZD9D9iPo7SERsnll6AeDOB6/DJNMbPI5AhARgpKFnBBIcbsNq3B
         kWvkWHLNCaR+ETz1cP7M/HfIx8+dImsNODcl4mUCW5NMqhXrbc7mmVhrUb74EPvXQNCw
         BzBJ9FNk6/I+hxB6cZBovBMFHnNl4hsJc6dtq/ZaxG1VvZP1esiIeowRch+O5Abyi79Y
         rmvFjIk/+Q5hcrsU+2KyvucAAfElz3RYoU4Dx/UEt4U42N4gY6X116KHDg6F4A644Hgh
         n3ELMJO2gkldKhF2REOOkz885YdwotFChbnoBoearq6YcZ3ScH3jfxTM4CIJbV7pg6ZA
         d04A==
X-Gm-Message-State: AOJu0YxnCjgR59NxoPSOJ5vbiY+O42kcrkeY++YGKdkTOHiYJTJIjp3n
	a4xd9U8m9xUNnGUYFb1Mgcqr8ffL5FROKvHetdWsGpzcTV3N5RwwgYXB
X-Gm-Gg: AeBDievZiFqxyUOKKi4dDLIzqn/TADavlGdLUuGguznaWVZCqqQtpsn5QoiJF90Xq9s
	cRMWBeb3QzJB+HOu+5to3Mn0RbQDJrpuLsVaYvszXKQR1uDjowXIRSuHLE0/zUM+27hd2ouud3H
	WFbkeIsDErFeFBXJKB8ewlGyzboBxhoJKNzExvtKtt+rdx+ZOGnnD/s3bR1uYMUxEtGRKYXhlwi
	4RYi2ix31Q2drQ6m6g9XbxR7FFoyUDy1kR72xykMSVIKh1SPDrvmxt+mCah5naEszVH51+uH3sr
	IzF7cc5XfDskxyqvZQmWEpK0enHq67DDnlFE+vFhS6BfJgCRCakSHX5VpJcJA7F27SWWu6iORYn
	b61H/bMGwZdJXhWjTWj43/w0VcLNv//9zWatXMFXKh+ya7f9UX3YSmnR0WmKQZT4qwSATAg2zAu
	Dm3HH5nVOjZen7HD5Tr9A=
X-Received: by 2002:a05:6000:18a8:b0:43d:71b:204b with SMTP id ffacd0b85a97d-43d642cd3a0mr17848829f8f.39.1776075911391;
        Mon, 13 Apr 2026 03:25:11 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63e5c981sm33173904f8f.33.2026.04.13.03.25.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 03:25:10 -0700 (PDT)
Date: Mon, 13 Apr 2026 13:25:07 +0300
From: Dan Carpenter <error27@gmail.com>
To: Alexandru Hossu <hossu.alexandru@gmail.com>
Cc: linux-tegra@vger.kernel.org, marvin24@gmx.de,
	gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/5] staging: nvec: fix pm_power_off teardown in
 tegra_nvec_remove()
Message-ID: <adzEgwPBTTFVKBdS@stanley.mountain>
References: <20260412205057.386856-4-hossu.alexandru@gmail.com>
 <69dcbf4a.050a0220.1d6d81.c4df@mx.google.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <69dcbf4a.050a0220.1d6d81.c4df@mx.google.com>

On Mon, Apr 13, 2026 at 03:02:50AM -0700, Alexandru Hossu wrote:
> On Mon, Apr 13, 2026, Dan Carpenter wrote:
> > At this point, we're unloading the driver so nvec_power_handle is
> > about to be freed. Is there any benefit to setting it to NULL?
> 
> nvec_power_off() dereferences nvec_power_handle to send the power-off
> command to the EC. If pm_power_off somehow gets reassigned to
> nvec_power_off after our driver unloads (e.g. by a re-probe), the stale
> nvec_power_handle would point to freed memory.

I like to believe it's impossible to reprobe a driver before the
rmmod has completed.  I'm not going to check on this, I'm just going
to take it on faith.  :P

> 
> Setting it to NULL makes the potential failure mode explicit rather than
> a silent use-after-free. Since we are already inside the if() guard,
> the cost is a single pointer store.

So the bug here is that we're racing an rmmod against a poweroff and we
trigger a bug.  And the fix is to change the use after free bug into a
NULL dereference.  Both of rmmod and poweroff are privileged operations
so you kind of get what you deserve if you do that.

I understand that it costs nothing to do the nvec_power_handle = NULL;
and if this were a new driver, I wouldn't comment on it.  (Although I
know other people who would).  But for a new patch, I'm just not sold
on this.  It makes the patch more confusing for no benefit.

regards,
dan carpenter

