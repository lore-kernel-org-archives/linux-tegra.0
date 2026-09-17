Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB06426738B
	for <linux-tegra@vger.kernel.org>; Thu, 17 Sep 2026 00:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789604318; cv=none; b=ZAs6JDTXNQ3ese91q9/ZjJygIN3B81EDpqp75/B0YMksVDIBw5hEfK/6tTU0w8fd03ZTi5pj+P03SIevUrKr0mHrw6Z2qw/WdU2hSpbhPuSvzGgaj/ckAwj2aJIb7qxo6QFirbDcO/tSgjm3rLOnwpM58SWI9qDIVx8+TUpDfEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789604318; c=relaxed/simple;
	bh=6fAFzKjGOs5MMaEbCXRUxSDGT/eRcDztc5yywoAoJqo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FzbZsQ5OXXkxcE/xJHHumoSgJcNspG5V61030aHU7lzetHrZBGn3cX1fb7kkStc/cX/73CpU3AKlqfXYoDBYkYh01xEThb8Byxhv0jrU4cOK+ssUh8xGb4DdXD+8fYPVbqiAsAWZ5RdnFqaqgSI81WWkz7UM6no7UqgbouvFeF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RAV8aa7A; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RAV8aa7A"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-396ccafb752so222459a91.0
        for <linux-tegra@vger.kernel.org>; Wed, 16 Sep 2026 17:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789604316; x=1790209116; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0cTCpyN0z0cXc2EHBJAXjzM+CijmtaeMcdcQxKV/JVQ=;
        b=RAV8aa7AMT6i+BRDxbMkLFuGRWJ9u06rTSalu77NOKGFE9H9jCK9xFg2S6GLyomhvw
         6TDJPRJzxaAkN8etudK4taIgSr/4ESDVSsDp1nTkK+uK4VvunGK4PtB6YBMBdI8Jje07
         gcQSR1iGDbMDtOFyyTrfrh6jBDc+z1FV70IXTgxI4MGF+ditQvWOumsI8xPVfnJi3qw5
         PUZf3AHwhLWOYyPbaLj9g7AAW4HiOWz6+8xrmNq2SiwH2muvHojihQbhcq0Wittbz29x
         jLyhNj3Ff0C9otD4r6X3uAYlxKGJ4bETYn/86Tihx6xQbZnrudw+iy6RQz+fWPMHQxAB
         VVkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789604316; x=1790209116;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0cTCpyN0z0cXc2EHBJAXjzM+CijmtaeMcdcQxKV/JVQ=;
        b=vG2LWtae9ODIduZMPdaOaKFkYNeeCDfLh99+Uy8DCgf44aE/ZV9cJb3LiTnxkDDWlr
         E3GsNKba47nmFnYt9goQ//udDOM9QCDMaQMakm9pdKvTo3nK1JdzLTVMUZwiSdIMEgP9
         +Ua3CL3C0Kx/aisM/KHXFlFkDJxfPqBfDkcjjUW2bdZoCHjxsKkGjZRnPIdNPqMaAmFw
         jomI/mxCThmviCx52dPw4Dd3pLPBxIeAorCuW3oeUd1zIxPephFfoSaayVqzZxXuWXi2
         nO+IVJ+ce8wR76i17bSB/h4eGpIM7J2zUkMLlDfakWMeoEPq87uSzazp25yPw52DBacZ
         j6Nw==
X-Forwarded-Encrypted: i=1; AKwUvBxI+ifaMJwH0LWzixeLkAfVhgRwUpSRHCAxTrI2UKaZSUbpov0Iy577ZwpgrBPHa6If1K5bp8Xrzl0mWg==@vger.kernel.org
X-Gm-Message-State: AFuF++mYkupJX7GPQ7920C2o56+k6CXM12H/HHz63CoyURbde+pv2+tM
	FN+XtF5uj9Y8v/44fpzi73AFfGnd4lxF16xJFzKjtQmS50fEMtGxgyvk
X-Gm-Gg: AYBFou0Sc14EUDRF+sM21zTbQEWgZkYd8ApQW4kHf0kVt/0gb97SRLiyxfk3NVmtsie
	Qc7tWr9PERhqceND7vfqF6Wys8118H+2NWbH3uALjSCzZxP+kuxgY3NlRZ9eUSnZ3FkGB2R1u7D
	9fvoIAXi6lCONVqsHNruO6LWpel+HGqgOg87UmCrXKUEn+2otoQaWqGeL1FuIiiJ3riqNi6Fuj5
	IlbazT19c3mopS8CgXTlCV7irWtqbp3XPK2akpEHEb3Yhmmqyy9cbzXbNLR6THuCWcW5s2tYTv2
	cAMVdWBM5zcbqcAL1K5bVgWsYximace5xlTEpR6ptGYtKUesrPq4VldvtsP0hWQZ1LyXBSQ8M9b
	zq9rCBnjKW70tBJVA0icloX1yVtdr2UcQr8a5ke2iP06gNHaDOfTtlm+k6uryt8QAo6UqiBLN0Z
	ASbKVB4evPelZSdY82vf4seYbru/y3QJaaySzWjlBm+nkQgXC6SeOmPwGMHDEVJN8mfPnIaieAQ
	w8f1I/D7OCK
X-Received: by 2002:a17:90b:1811:b0:39d:e54c:8658 with SMTP id 98e67ed59e1d1-39e1e250230mr12801977a91.5.1789604316059;
        Wed, 16 Sep 2026 17:18:36 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e362e9402sm1661040a91.15.2026.09.16.17.18.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 17:18:35 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 16 Sep 2026 17:18:34 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: David Cemin <dcemin@nvidia.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH] watchdog: sbsa_gwdt: stop the watchdog across the whole
 system-sleep transition
Message-ID: <b17e7387-0de1-4b41-8955-6f66965a1126@roeck-us.net>
References: <20260912182107.1156221-1-dcemin@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260912182107.1156221-1-dcemin@nvidia.com>

On Sat, Sep 12, 2026 at 11:21:07AM -0700, David Cemin wrote:
> The driver stops a running watchdog in its own device suspend callback
> and restarts it in its resume callback. That leaves the watchdog armed,
> with nobody refreshing it, for the entire early part of suspend entry:
> userspace freeze, kernel thread freeze, and every device suspend
> callback that runs before this device's own. The same window exists at
> the tail end of resume.
> 
> When the watchdog is already running when the driver binds (started by
> firmware, 10 s default timeout) and any device stalls its suspend
> callback past the timeout, the watchdog resets the system in the middle
> of suspend entry. On an arm64 laptop platform this fired on about 7% of
> suspend attempts in a randomized suspend stress run (9 resets in 124
> suspends, with the watchdog reset status set in the SoC's reset status
> register). Two elimination runs confirm the mechanism: the identical
> stress matrix with the watchdog stopped produced zero resets in 118
> suspends, and with the first version of this change (notifier plus the
> original device callbacks) applied, zero resets in 198 suspends across
> four runs, where the baseline rate predicts about 14. The version here
> keeps that mechanism, removes the device resume callback and adds the
> locking described below; it went through a further 120 suspends (60
> s2idle, 60 S3, randomized order, console recorded through every entry)
> with the watchdog armed from boot and zero resets.
> 
> Stop the watchdog from a PM notifier at the *_PREPARE events, before
> tasks are frozen and device callbacks run, and restart it at the
> PM_POST_* events, after everything has resumed. The driver state (armed,
> stopped for sleep) lives under a lock shared with the watchdog ops, so a
> userspace stop or magic close after thaw cannot race the restart, and a
> start requested while the transition is in progress is deferred until
> PM_POST_* instead of arming hardware nobody can refresh; the transition
> is recorded at *_PREPARE whether or not the watchdog was armed at that
> point, so a start between *_PREPARE and task freezing is deferred as
> well. The notifier is
> registered before anything can arm the watchdog and its failure fails
> the probe. A suspend-only device callback remains as the final guard for
> a device whose probe overlapped the *_PREPARE event; it has no resume
> counterpart, so nothing re-arms the watchdog during device resume,
> before PM_POST_SUSPEND. The initial hardware state is adopted under the
> same lock, so a firmware-started watchdog discovered by a probe that
> lost the race with *_PREPARE is stopped at once and armed again at
> PM_POST_*; the stop path is idempotent so the device callback remains
> an effective fallback whatever the ordering.
> 
> Fixes: 57d2caaabfc7 ("Watchdog: introduce ARM SBSA watchdog driver")
> Signed-off-by: David Cemin <dcemin@nvidia.com>

After thinking about it, I concluded that this is the wrong solution.

First of all, it is a solution in search of a problem: Simply increasing
the watchdog timeout to be safe would solve it. If anything, if the default
timeout of 10 seconds for this watchdog is not safe, increase it to a safe
level. However, a system requiring more than 10 seconds to suspend should
really set a sufficient watchdog timeout to prevent the described problem
from happening.

Second, the patch leaves the system unprotected during the suspend
operation, which is arguable one of the most critical operations in
the kernel. On top of that, it _is_ arguable a problem affecting all
watchdog drivers. If we'd want to do anything about it, it would have
to be in the watchdog core, and the solution should leave the watchdog
running but ping it from the kernel while the suspend operation is going
on. However, even that would require some timeout because we would not
want suspend operations to stall forever.

Thanks,
Guenter
