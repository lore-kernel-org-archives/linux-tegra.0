Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA05422686B
	for <linux-tegra@vger.kernel.org>; Thu,  6 Feb 2025 09:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738834180; cv=none; b=BEKMXHzesx/N8xOdVDNBQxvKzumbr1mlS8yhmhXEsOTiKboSNaX6lEHGPwwob/cx+8vlz5HCxJwbdr+ArWN4Q1igwM9sY/cGs1P9mFvscS/YL12c3yx0w8nZfhHVDnG5sHF/ckMx7X17Zm4Rd6ZhhaKHvCzPxV4BFPNSMLTm8Ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738834180; c=relaxed/simple;
	bh=EYcX+Tl80Sl7d+CDd9SpGmBn5rsXiLy+uE7dn71Jszk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f7pBws8NbWP10Nj8sRFTWDOOBAsfkbk0124sN2Tvt+0h0s4bKjLsvpOC+F6vntiFNHaeQD1PGLtLSbGhCTV+zOl5jxz6RsxANca0iAezMk82N1QvLVnx2ghXn9+wTul9DyPPMlO2JIgjmMfKosHGuoR9r6x+tqylqqdMxYgf1w4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IHQrJ32W; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IHQrJ32W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738834177;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KOagAZK7fofXxMgw0dAFRrT7sTcHKFQ+LQJsrXs9r54=;
	b=IHQrJ32Wa3Wy9ahAdbzxKsxPZ5sEKscqRjiGZ4z+TeVpIrGqKWkId/K8DVkkTGahUdOMZG
	e47tKBltyBTp32dBIHNCjxonDl3BlvpSme9gBp7ypcU9pg2SVksrb4J5Qc3dJvDThkJ42R
	eSsfhF/zmk/MgypgMG5rM90RQCtHfAc=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-417-Wutls0f2NJeI3xUMbrNoPw-1; Thu, 06 Feb 2025 04:29:36 -0500
X-MC-Unique: Wutls0f2NJeI3xUMbrNoPw-1
X-Mimecast-MFC-AGG-ID: Wutls0f2NJeI3xUMbrNoPw
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-38dbd36c021so222430f8f.1
        for <linux-tegra@vger.kernel.org>; Thu, 06 Feb 2025 01:29:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738834175; x=1739438975;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KOagAZK7fofXxMgw0dAFRrT7sTcHKFQ+LQJsrXs9r54=;
        b=HorGzh8Z7rKGTvzySAFgCDfTGIYpjMkyNLyke0EWS/77YpWbbHwUiAvVyD2RA7qprf
         ddUuxawe5Ulhv/nn+o3FchiT6bozROiwtb7aw++cwl9gLI8GlXaBml3CWMRGkocm8IIZ
         4QSKHfKrsTBBciqnXF4YZ8vx+ILYmOst2H6O5vWW9QhkR6eNZ5jiRbrbyfnMUyfb1gjK
         M1EmEOhad/7VtsTVD7aU7BW+IIS4fX/0DgCaNFhIQ617+m3+7Fc/8NXoHStL93pz1cAy
         p77gJvk9Krd1tVpliEDBT1wz2mdhZQLu1MfHBbAC/9Hs8WLwmbpblaaWTGQbbZixSv1s
         4wJA==
X-Forwarded-Encrypted: i=1; AJvYcCWpbRfUYI2JvmX0Bo+pwDhAebKyS2FBwD3t0cOSijpzSRQtu9CnIoHlR7xDlVG0T0yVfShR+iXjNgmUNg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yykqb4UMYbWZkVA+66Alv3lZL9bP2v6wBtO8p/Yshe6lBo8Lo7O
	vdTxLsLZIYZTt3t1Gk36ThrQAbb9RFqF53goRq+AWS4BXpwB0V2Lb6QMfWFOLgGQjQO1sxut58k
	n8pE7vENqDlL1ZiltGUW0K7zxyAZhLNV41crGO4jpYhga5lgl+83Gc5QmbooU
X-Gm-Gg: ASbGncvXM0xcfQv2uuZsA8jGrNf6DRadR17C9Na2KA6XNAqaxHFHdvoNKLGA2aY3YNQ
	YfVCeZivUB+se/Zzj4LVq7lIrpr764U56i1rgXIvskgzLkB860ens5YQxqiaTwWdCn9LQKFAsOn
	pmgwV+t+E9KejSNyTJGzT6DFaVnwd2JNExH3a4lbwoKmr/tbnAU2wtwbKSw1V77YRi5DcPJsk3u
	Zct36mnYYXOQpN4HvQIDYSjITDZ4cYuWkClUlCa8hke54H14qkIsss/e6CRU6+wekYywFVHC6wR
	XNmVYzwqdVGaZzuNsCKDP8WPpPrnC7RlxZIF
X-Received: by 2002:a5d:5988:0:b0:38c:1362:41b5 with SMTP id ffacd0b85a97d-38db486108amr4535900f8f.6.1738834175184;
        Thu, 06 Feb 2025 01:29:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEACMLPnRenHtTztqiW2IAcbQnqshOGTNeLp4rXCm+kaU1iNlAag5arspiSZQxoQu++qZxvNA==
X-Received: by 2002:a5d:5988:0:b0:38c:1362:41b5 with SMTP id ffacd0b85a97d-38db486108amr4535875f8f.6.1738834174782;
        Thu, 06 Feb 2025 01:29:34 -0800 (PST)
Received: from jlelli-thinkpadt14gen4.remote.csb ([151.29.128.176])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4390692a66esm53015975e9.0.2025.02.06.01.29.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 01:29:34 -0800 (PST)
Date: Thu, 6 Feb 2025 10:29:31 +0100
From: Juri Lelli <juri.lelli@redhat.com>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Thierry Reding <treding@nvidia.com>, Waiman Long <longman@redhat.com>,
	Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>,
	Michal Koutny <mkoutny@suse.com>, Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Phil Auld <pauld@redhat.com>, Qais Yousef <qyousef@layalina.io>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	"Joel Fernandes (Google)" <joel@joelfernandes.org>,
	Suleiman Souhlal <suleiman@google.com>,
	Aashish Sharma <shraash@google.com>,
	Shin Kawamura <kawasin@google.com>,
	Vineeth Remanan Pillai <vineeth@bitbyteword.org>,
	linux-kernel@vger.kernel.org, cgroups@vger.kernel.org,
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH v2 3/2] sched/deadline: Check bandwidth overflow earlier
 for hotplug
Message-ID: <Z6SA-1Eyr1zDTZDZ@jlelli-thinkpadt14gen4.remote.csb>
References: <Z4TdofljoDdyq9Vb@jlelli-thinkpadt14gen4.remote.csb>
 <e9f527c0-4530-42ad-8cc9-cb04aa3d94b7@nvidia.com>
 <Z4ZuaeGssJ-9RQA2@jlelli-thinkpadt14gen4.remote.csb>
 <Z4fd_6M2vhSMSR0i@jlelli-thinkpadt14gen4.remote.csb>
 <aebb2c29-2224-4d14-94e0-7a495923b401@nvidia.com>
 <Z4kr7xq7tysrKGoR@jlelli-thinkpadt14gen4.remote.csb>
 <cfcea236-5b4c-4037-a6f5-267c4c04ad3c@nvidia.com>
 <Z6MLAX_TKowbmdS1@jlelli-thinkpadt14gen4.remote.csb>
 <Z6M5fQB9P1_bDF7A@jlelli-thinkpadt14gen4.remote.csb>
 <8572b3bc-46ec-4180-ba55-aa6b9ab7502b@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8572b3bc-46ec-4180-ba55-aa6b9ab7502b@nvidia.com>

On 05/02/25 16:56, Jon Hunter wrote:

...

> Thanks! That did make it easier :-)
> 
> Here is what I see ...

Thanks!

Still different from what I can repro over here, so, unfortunately, I
had to add additional debug printks. Pushed to the same branch/repo.

Could I ask for another run with it? Please also share the complete
dmesg from boot, as I would need to check debug output when CPUs are
first onlined.

Best,
Juri

