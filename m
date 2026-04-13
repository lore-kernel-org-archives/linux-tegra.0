Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 812E61DF75A
	for <linux-tegra@vger.kernel.org>; Mon, 13 Apr 2026 10:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776076801; cv=none; b=tUn0HPhoKPVO38xk0Zhr+mmLU+DA+h/QlxEEA7R0hM++4vZ0KodVont3aswB5AIuVOzoI8wgsTY2oQkRb+5MkIwgE39n1bol7ZbRNC0tStKLoMeZIoLeefyp1HgNfB7ywX4ChE1j6QLeJo4rbFCSBQFu1gUsEMf85Z3YUtvsP8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776076801; c=relaxed/simple;
	bh=QNf9fYuRbV6pofyWiCvhwQ8+2qT1V/f57gWB0ktbdBE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LLMRJlst8DXP2V/yLaW8PGhvNFnGP4sALR8EK3l0yBETMpo4OuXr4OHCPj4wK9UQcj6eqFqQnTska3p8mWV/BHz567nJxq80Kn9QdyHujuQg9uznvKNf5y9IhXG0Uh/gMzQDHC+UrNBhJ9kBYeUAGGbt6KybeCRbvGHX37ISKXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eqdT1FPa; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eqdT1FPa"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-488b0e1b870so68077815e9.2
        for <linux-tegra@vger.kernel.org>; Mon, 13 Apr 2026 03:40:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776076799; x=1776681599; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=M3Qpde+l3zSHqtGuk+YhxsSmgAud6Ug9oUZZ4dBVL5c=;
        b=eqdT1FPa6Ut2tNUnkNpJnkSV/tu6rZa0ArpYF06TyntokdVZKHObCa6eMrpGvnJoaV
         PnlcGZdeiVPwHOIAU3WPweJpC2D0c6+0K+Jab0hvoZmd1efLiGelGOzV4vLOLccegk07
         H9YYjScQ3kxxmfnhDM3gkLV/71ac15IxOjT5hrUed3Ei9gQ4P1EnHi0sbfwphtotSOH1
         AmUF4mX3ml+SZfpNGO3RA83Yy85asDvUA11c6x35n31z1VGTjdo1wCvpl5L+5AhqNOQb
         wvC2E2MuncQ3SxNZW0ti99Ihl550yV98tp0J7A93WM6+Zwufd52FKllZ2wTLANJppnUS
         p9kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776076799; x=1776681599;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M3Qpde+l3zSHqtGuk+YhxsSmgAud6Ug9oUZZ4dBVL5c=;
        b=S1ATmU2F4FB4G/JLekd76brqItshUo0H6HNE9ZmGJ9EHr8+XpBnVCXZ8mWTkobL3ou
         BekF4r5aZeV9vg+4mcVDFomDfCaoLlIW5n4O4yB5f0LsH50Dd9PWrkWyXMfhdf5IKQx/
         XEpCOQZcALYs/IfU1w15PHDVaW7r9MVrJG/SKworJo39hsSPR2BnKRt9GIB1BKvS2NXJ
         oLaw4LoFIGXwS56jFTGjfpyclxfWPPwJKou70y20ktXpP3XPSGCw/DwGWfRTqsx9UMYl
         GcBMMTvH1xkv753hJhmxnWIytm+guq6WDSzTX5Vw9mpeFXCbageoW7unK4UVBq5PufkQ
         4iQA==
X-Gm-Message-State: AOJu0YxU6aT06TWEczicZYaDC51KdFXbPNHMRKingnAyCKdd53OHXHEX
	jaJAPE+2MXrT6xarrWpqTaqotSW0LO/MR3E3hfl3vdsy8NoSsGrCnyTO
X-Gm-Gg: AeBDiesv5lohz/nhe76Elbyqktan+skD7nd9wL/G3pf99G4DFpPLtA+8HbhyjMwt+u4
	3lujD80qIKvV9pHNLS7GK1F5m7mrnDDmnSuHBQj2bDM0olZHxHk6CWaZxY6Xs60lMmOSR6Jn09m
	jMS5cxkbJdwAY3m/BELQJx1d8KS67QqVmpPj9OuuMDAHn8v9HK8ENlUrFDPxSfkrfZaiFd5a7Rq
	qKGOP9xB8hTdCa7MTDpwRhzBI8+jPwFQ5clDW5CXTG1drn6v+66cnY87OphEw0HRdJ0zQAcyHmP
	1QWqTDUos4oMzNl2OEvvATd6ubmgvVm0G3WAVFrNhdX6ajH9ssfPK6+2nKYu29X0VAaLt4A7+OM
	/R+DMvEQjkZs8fX4T+1G5tqWxA9Pz0INOFybAp/gzsXyug0MgC/zlGXb6Rp+w4r3MW1/6VzYUhj
	5bgxLo/YZ45PApya6xF5U=
X-Received: by 2002:a05:600c:8594:b0:485:46fd:7887 with SMTP id 5b1f17b1804b1-488d67f9a73mr119380225e9.13.1776076798374;
        Mon, 13 Apr 2026 03:39:58 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d58bb830sm295312985e9.7.2026.04.13.03.39.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 03:39:57 -0700 (PDT)
Date: Mon, 13 Apr 2026 13:39:54 +0300
From: Dan Carpenter <error27@gmail.com>
To: Alexandru Hossu <hossu.alexandru@gmail.com>
Cc: linux-tegra@vger.kernel.org, marvin24@gmx.de,
	gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/5] staging: nvec: fix pm_power_off teardown in
 tegra_nvec_remove()
Message-ID: <adzH-qGdFttuP7uq@stanley.mountain>
References: <20260412205057.386856-4-hossu.alexandru@gmail.com>
 <69dcbf4a.050a0220.1d6d81.c4df@mx.google.com>
 <adzEgwPBTTFVKBdS@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <adzEgwPBTTFVKBdS@stanley.mountain>

I haven't looked at if you can actually power off a system while an rmmod
is in progress...  I feel like a real old grandpa when I say things like,
"Back in my day you weren't supposed to call rmmod on a production
system, the rmmod feature was only for debugging."

But the bigger picture is that linux power off is a mess.  There are a
dozen different ways to power off a system.  Here we have a driver
which just takes over the power off process by assigning a function
pointer.  Shouldn't we instead have a list of ways to shut down the
system and have a standard way to pick which is the correct one?

Instead of worrying too much about this one driver it would be better
focus on the larger picture.

regards,
dan carpenter

