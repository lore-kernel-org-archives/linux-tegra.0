Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F9DE37FF5F
	for <linux-tegra@vger.kernel.org>; Mon, 20 Apr 2026 22:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776725782; cv=none; b=fnq16oI000tVPG3CgemlbTjX8uAl1UvsdigfS3JzZtLYfhezuZ1SuCd0EkSCBNndIYLvw2WdMtmqHnYxW9tZhVGzpjnJ4J7KsLSIu5OLT2FdjKkef0fmjJfWeKWHMnZ2TcaACpYXUc8AoOEdS0BzfKkWM4f9bLf52IQ/S7mM0yM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776725782; c=relaxed/simple;
	bh=HxETj+r6/c62h5v/ZQo9q8wwwtXio08jZSnj3FSr8os=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z9+iEyngu2ovbIqP1uno4ZgP+qLks5Yrqe0eUGejBYjhWb6WV0Ink4GatQims5BlKXxh9CRyHu5XtWxhgIj9QLdHX/Z4XS/w0uisZYEVL7R9blJFpmT4z7NxnCceTVEIn0gzl7/LznCeiD/JffrklbdlIZh+JUncyhK5UzHM8S4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=m6OruEcU; arc=none smtp.client-ip=209.85.167.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="m6OruEcU"
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-4756e74f8edso2526728b6e.1
        for <linux-tegra@vger.kernel.org>; Mon, 20 Apr 2026 15:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1776725780; x=1777330580; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HxETj+r6/c62h5v/ZQo9q8wwwtXio08jZSnj3FSr8os=;
        b=m6OruEcUV+RxxHF5bmojsdSMXPifizCGbcAMnOS2vyEEt7WMtoiS56hMGC+2tTq5hI
         cWMSBHKYq9h6Wdcm3WdUvQRzfdpKFE642w0IgAOy6u1YQcc/VCFDcuDcxnPFeBTXAzKj
         atlGe+MmH87ibnTn3g2loYlYCq7dpEUxdFDMq3Vebt2uWaS5hLtTP3X9bQqFXSaEq2pf
         RRbZhC7fK9J+KaWi6z7LblGXj1DPAfKnp4dbRahnfSRuuNHggTmdhLd5X5+5HOBQ9J8T
         DRlo/GSJGKfqA8c1mRC0RfbUXTmRGsOD0YZjstgKZ3Mk915kiDhKi/QIo7sE4l8jZaUj
         y5+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776725780; x=1777330580;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HxETj+r6/c62h5v/ZQo9q8wwwtXio08jZSnj3FSr8os=;
        b=OLzhXEFKxLsSUoG0H2B8oBQggvE6O513uaaxkoWBgNk+mdFX9bTIo/7GlIDxqtZgGx
         4smnzkA+pReOnOlFLIDF0YaWBqHSzW7mq63I50+Ljg7Ppi8JwQDf7k8K+9ICannU6OWR
         dQYjAL7TZVLgykPr7UfNQpOUyEGigP0ymXCV5d1u873dhCUWq9ad5wnblu81RrQ6tVnX
         jo0tc2Mz3cUnI1OsrBG+3tGlYnh9LUL/3hFD6PjlZZyZ1QnexoXGlnfA7jXFdHPSUTgi
         0BhPStdGXZCH0a/g4eSyznY6UuP0a+wfvTLLO1p/ote5mgphuNAkJw1y18qBn85ezBpe
         CIJw==
X-Forwarded-Encrypted: i=1; AFNElJ8rdt7ySECHQSNIr9tIPLO1jLAx8hpvCUTxcxPv1r6AF+biR1c1YDSN5QcJTFYtoB8I271mApaGPY6m/w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzeuQoewrfqlq7OI5/1Thl7Jt8/fOadLc9Bkzod/E9ap8iu9Ouv
	W0NSTKNkUDfSFMvPiWj2609qs2Hwf3AcJjHoTUwgzjHeElYMP5RHAaYQmlXc6ZTjCP8=
X-Gm-Gg: AeBDietgRm2ocsVjLZWLvXuhhpLrWAlKXjUFdBSnp7NmRtvJXK+aaIhtrYRlf9ciEXz
	oBoSYNbDEIwy1QzkygQ4vbOJ/rF4bL0zNOLq0om0/hr0IT8wVIRa0O2JhyyI4+HTvzEHGqIIGyf
	Y/UqGStUOe4kdjTCOuz0iWqSj2hG0fO0rt2Qhao/TssbduKSniraP57uVtWFsYQs4/TlGlj111x
	xfweSFl9ob0TuKlxJ7dEt2ldCR1qCP1n7fFBq/D0JzAGlHrY+fkd07aBKRREINl4o+rP2LdeQaK
	5nrkTxiXFRQBxCzu/oSu98mfrkjSLKnbIkVd9/f6fVVVg0lJoXyiCeW2oSzZGyHXm/raOLWKSET
	1h6Eds60udlDHwBwpyHvXILCfUfv9C0jjy2jvZxpa1yqsDsgeKM1UzEXmwXP9bSmdPHHdLkVKj2
	0/imvu7GND
X-Received: by 2002:a05:6808:448a:b0:479:d2d3:a399 with SMTP id 5614622812f47-479d2d3bdb0mr3331712b6e.15.1776725780355;
        Mon, 20 Apr 2026 15:56:20 -0700 (PDT)
Received: from ziepe.ca ([130.41.10.202])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4799fc19273sm7702863b6e.0.2026.04.20.15.56.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 15:56:19 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wExXO-0000000F7qQ-3pLG;
	Mon, 20 Apr 2026 19:56:18 -0300
Date: Mon, 20 Apr 2026 19:56:18 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	ekansh.gupta@oss.qualcomm.com,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>, Arnd Bergmann <arnd@arndb.de>,
	Srinivas Kandagatla <srini@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Bharath Kumar <quic_bkumar@quicinc.com>,
	Chenna Kesava Raju <quic_chennak@quicinc.com>,
	linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
	dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
	iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Subject: Re: [PATCH 1/3] drivers: base: Add generic context device bus
Message-ID: <20260420225618.GP2577880@ziepe.ca>
References: <20260414-computebus-v1-0-4d904d40926a@oss.qualcomm.com>
 <20260414-computebus-v1-1-4d904d40926a@oss.qualcomm.com>
 <2026041418-volley-composer-6363@gregkh>
 <c4f21420-c299-f161-2bf7-c9b79ca15037@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c4f21420-c299-f161-2bf7-c9b79ca15037@oss.qualcomm.com>

On Wed, Apr 15, 2026 at 11:04:26PM +0530, Vishnu Reddy wrote:
> Looks like the device have specific iommu configuration (via
> of_dma_configure()), then using the auxbus or faux bus types does not have
> the bus notifier calls to iommu_release_device(). Please correct me if I
> misunderstood?

I think the general feeling is the open coding of_dma_configure()
calls in host1x are not desirable, it should only ever be called from
bus code.

If you need to create struct device instances bound to the iommu
somehow this needs to be much robustly designed than wrappering the
host1x stuff in a new bus.

Jason
