Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41045242D73
	for <linux-tegra@vger.kernel.org>; Thu, 10 Jul 2025 09:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752138272; cv=none; b=mR/3z0r96nP5OPWLlPnqCITwLbaUNp/aA3kWfmeC2ehnWJSWwFdveXyEwSM31u1KzjZLT4+Ski7DpApqJe8oDiGBTbfQTCSrlwVl4aYqIJ8SAvam1H9KBVeRYNHpAUnPiSaPhUKIGpZu6MIwKvJmSsag32lb7WGLemuOeRQ4n1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752138272; c=relaxed/simple;
	bh=UHq0Bpn2ipr+kaNHbOBnceI/82zqPsegalrxYbyF9JQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k5P0Fj2Atlr7C9HUBTDcB0sZngOAdyWfjzX30anUD2XHQG2T/eBjq+/ppITY4FeVhTJiE8HxiLvQl/Z6ca24otjRxnGziGoZvTtXTNaDRkGSHC/pgnfPJOHM5Ixkp/TkYMbDRS9tyBtaMazQ7VMXVacJXHF4eamHz9x06TXxm0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=q2tHaLO0; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="q2tHaLO0"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2357c61cda7so100525ad.1
        for <linux-tegra@vger.kernel.org>; Thu, 10 Jul 2025 02:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752138270; x=1752743070; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DjeE3o0RxHj2yfYkiiw6nT6qNxm9Jz3LUgLh8cuza0U=;
        b=q2tHaLO0JwJQ5bongibZo+qyz5ekqZ1B7+ZzIl0Hp0cgpT5tCUtLQpWoRNxrqXHaDq
         XZZHx2GAI39rw2fndy91wknVr0WpnqxZb0bxbClc7KTYC6/MeO/BoZrOewWVhivDG0+a
         oKD9CO5eqrTUl5rBBU/DQAvf49ZC8LA/IMDuesfvoBZeMdElfxgDlV1V4ufNveRGeA83
         Yu8TVlY0uT3zodR+kOCQIEXMzYNklpjFXG6Ji5BfAkXSnwG26yXGhEFS61mbYTEUg2Gf
         q3EQjzMfjynI0a7gfrivfWN2cy6nGAX3fZfofoLKnTzvOiDQqXuWtL3MBfgen5tb9Vmh
         3XuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752138270; x=1752743070;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DjeE3o0RxHj2yfYkiiw6nT6qNxm9Jz3LUgLh8cuza0U=;
        b=fIBwSTaO5Eq0W4jqlMq4KJt4AY2VK8yc2nGhzOir7XNvj/uS9ZdWx6i41yy6pQk6B9
         w/Q6ydofC6o7C8a2AsPdDBusCd0Gm30gGLu1Fs0Mp38cj1HpWG67zhcfklYD1L0Pei9o
         x0Pf6ftThk7pTT4NY58QZNpJ/s8Oc2pdZCQqczpYYF2hjwX+ZmnGjqeoKSTKk1EjJwyo
         j8uyxg36la72CtMcdvpxX7RhZIFF11SwvH1Sl3ZscC7i+x18rZX6hTx9mpH/y7+ttfPo
         ALQfzVH7PChP5IR5MwPyHk8YH+a7yFm1Y6itS71hMxd59zR3XF/N3fESYEjdJBCFzzMX
         bg3g==
X-Forwarded-Encrypted: i=1; AJvYcCW6vYSH+qAGfkZgLgAKceDBhEDepL9ctMPm0T5Sv7zv6JFQ0TylDJDpb29ITDmkB4grvXnqN+q48B8u+g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8u7cHdn6gBegBZfqpDS/2O9gBK0vzqOEVo+RC7j1J12Kp0FBW
	Jhv2NEZ+QkLNtFzOwj8ZKpxTDT2Rc5ZycER5hdCs1Bk5jcobpjQCUsSWvzCWaR3bcA==
X-Gm-Gg: ASbGnctQU7FJhD+xTceA0iu4UD22VebjkQf772xzlm6vbqH5dse4Ix6GU8nhN65Gm7N
	P6shYG+U0MaGmB1/cXqSlKaM2RG2w6dSEcXuewZ2g9yioBmG89Xg5/4I1CPWFZf34AFoZ362IBI
	PhvnjJ4tUA/CeZQqtMEVGXdQrZPjrozzsxd6SvPhmDKk2p/B098wFpvxmcqk2iBWDzzMB0EChUV
	VMLjn2x57Hu1mQZ4oGNMQSnkZEtqYsB7nhXGQGErwKiWENR+1d+NXRBza6mAdDotlAgf/6qH/qT
	WKSdNWKC4yLiwai+j+uIdDWnMUpSW9TITO4Pd0wImq2tB0x8cilTLDCTTfWpxNCjTRJUw0hLHJ5
	yehB/tKzOpue/0hkQ9ceZ
X-Google-Smtp-Source: AGHT+IEUCwoHbQmo67knPJ74PmLn5sw1tOh05zzgGXqHLIH2hLihrsg/DC4THre9sZfOvA98I9mneg==
X-Received: by 2002:a17:902:f547:b0:215:65f3:27ef with SMTP id d9443c01a7336-23de372b90dmr2361415ad.12.1752138270075;
        Thu, 10 Jul 2025 02:04:30 -0700 (PDT)
Received: from google.com (232.98.126.34.bc.googleusercontent.com. [34.126.98.232])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9f49502sm1369146b3a.115.2025.07.10.02.04.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 02:04:28 -0700 (PDT)
Date: Thu, 10 Jul 2025 09:04:19 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Nicolin Chen <nicolinc@nvidia.com>, kevin.tian@intel.com,
	corbet@lwn.net, will@kernel.org, bagasdotme@gmail.com,
	robin.murphy@arm.com, joro@8bytes.org, thierry.reding@gmail.com,
	vdumpa@nvidia.com, jonathanh@nvidia.com, shuah@kernel.org,
	jsnitsel@redhat.com, nathan@kernel.org, peterz@infradead.org,
	yi.l.liu@intel.com, mshavit@google.com, zhangzekun11@huawei.com,
	iommu@lists.linux.dev, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-tegra@vger.kernel.org, linux-kselftest@vger.kernel.org,
	patches@lists.linux.dev, mochs@nvidia.com, alok.a.tiwari@oracle.com,
	vasant.hegde@amd.com, dwmw2@infradead.org, baolu.lu@linux.intel.com
Subject: Re: [PATCH v7 27/28] iommu/tegra241-cmdqv: Add user-space use support
Message-ID: <aG-CE0jUxK4k1FMb@google.com>
References: <aGRmaOORg-YDfncY@google.com>
 <aGRozoIDIlgl9H9x@Asurada-Nvidia>
 <aGR55PUBnwb8qT8U@google.com>
 <aGSBTpY0nkdp2TTL@Asurada-Nvidia>
 <aGSNmf5Q82xEbDpX@google.com>
 <20250702180541.GD1139770@nvidia.com>
 <aGaXqwzfLwsgCH6n@google.com>
 <20250703175532.GF1209783@nvidia.com>
 <aGbQipeSn0aZnwZU@google.com>
 <20250704125012.GK1209783@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250704125012.GK1209783@nvidia.com>

On Fri, Jul 04, 2025 at 09:50:12AM -0300, Jason Gunthorpe wrote:
> On Thu, Jul 03, 2025 at 06:48:42PM +0000, Pranjal Shrivastava wrote:
> 
> > Ahh, thanks for this, that saved a lot of my time! And yes, I see some
> > functions in eventq.c calling the iopf_group_response which settles the
> > CMD_RESUME. So.. I assume these resume commands would be trapped and
> > *actually* executed through this or a similar path for vPRI. 
> 
> Yes, that is what Intel did. PRI has to be tracked in the kernel
> because we have to ack requests eventually. If the VMM crashes the
> kernel has to ack everything and try to clean up.
> 

I see.. thanks for clarifying!

> Also SMMUv3 does not support PRI today, just stall.
> 

Ack. Thanks!

> Jason
Praan
