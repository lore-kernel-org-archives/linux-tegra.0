Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEE0A19AA56
	for <linux-tegra@vger.kernel.org>; Thu,  5 Sep 2024 13:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725542703; cv=none; b=Op8D1xQQk2olWNsAZvkPdSgByY6OZu4cxlaCRoeuvyXf3mlENHQSCP8bO2zhFnH7pJO7Cda+u3yfG7zrAQ1mAKs5oqeY+wvku0MrsAA01VNqKn1DrNmrMUdcF1kFokZ7gVhgsTA/NFyIJp1M/rU0yGPGyl0RFa7CAgQbD6EYb3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725542703; c=relaxed/simple;
	bh=zDCA23YGQ/Y69ta8sNwCokd06k4hwHincXxUa2TuAnE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FZQjQgR6tdu6xlfONrkplWOFDZJuXEMcF3Mc2yHfTmUF1e6bmezlrmayLTk5nnNMVZIVIlVK0VdMEv+TrA6dxYzHsYTF45xPKYl0NmQnbf2GyDSWRXkGRSTlEKpnJ9Cv39aHuhva6cD405E1QZ8Qh22GpelSKNkDl2RcsPZ0G1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=lSSjlIv/; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="lSSjlIv/"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-7a9782651bdso153710585a.1
        for <linux-tegra@vger.kernel.org>; Thu, 05 Sep 2024 06:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1725542701; x=1726147501; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QQZ/prAHSJzNYvQ41aDnul/jxJL4VTE2Yg49JItkgwg=;
        b=lSSjlIv/kEBtZ0fWhJpDDd1YSsjQ0Rht569jS4gXVTeK5zSf9itPQXrXh+0qUbNARF
         mh0iI94b9DyGnMeCY8ZWkYI5D+wg3Iv3QgdHeY9z5+ZlQpiOidcqL+6hw0ZU9o81Z0Xi
         //9Upe0abhCT7McHoF2eHePzfJTtxh2A39/LWL8hAr6e5/0faDTuUa+oiN0EqxvSnb/W
         eCnjh+5aPEXl0VpEnMYvW5aU3R/uoO+5rD0D+l6h/C8iEZA3uIj09Aiig/i55FdGhxLV
         /UqLcOyZdvSMUclXCEcd33aEOJadB3nrtB7JKgmdH8clDbMbqp5ABmc1WMtSdr2xjZtU
         c8tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725542701; x=1726147501;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QQZ/prAHSJzNYvQ41aDnul/jxJL4VTE2Yg49JItkgwg=;
        b=SHqbfdsY548wDk8ysvZw8t2uqIIamVmrO5RnyvRMe1eumwxGkvqySRO+IfKoGCBpPN
         p7yeU+ZRjYMVatYuN1x1z8zQlu2ozz8F2UGyf9wAJ/cCuy0X0XoH+lbfnKUgBPoJ4ol6
         GDKkN3vlEEMgojWVyVYcBsmVuSDsBm1jwwhbT5p31ESC9yZAMCT6cObPbDZb+xHWzS3w
         16Itnyml3E5hHI5b774zbjmOFre9h5RdQWn+CO64TCMzDF9OisSJ+Fx6OZD+Z0jurPTL
         WMG0AFZT2HRmv1ZQFncdWtgg49LJOPw9ZPRMd2cqIY5IG8HFNQ+r1YsP42S8FsL/hEyr
         QgTQ==
X-Forwarded-Encrypted: i=1; AJvYcCW9g7qylSlRwNx8KzEhfWfa3qEPmeCBo3hKYTce8AahNgR7IVNW0mOML+ruYAUBlajTeRPHFYdWXEBHxw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyCjwrX6sFraj/U89M7zsARVaBkM3puEAEXltzGVM1/V6qnK5Ui
	+rKlM6HX5qF0RgVKpJn5Qh00nn3SORDLqZ0vc2TgLiwZVEne+S0zXIp0In59jBY=
X-Google-Smtp-Source: AGHT+IEDu6pY51+TBXvcoJ6tFwe8exqs/WY3csyGmyVmQ8kYoFXlzHQS0zH+YsMUz1IR39QgtqrhaA==
X-Received: by 2002:ad4:44a8:0:b0:6c3:6799:dde3 with SMTP id 6a1803df08f44-6c5191197b4mr91124026d6.23.1725542700794;
        Thu, 05 Sep 2024 06:25:00 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-68-80-239.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.80.239])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6c5201dff49sm7525176d6.15.2024.09.05.06.25.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 06:25:00 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1smCTr-00CTrV-Rv;
	Thu, 05 Sep 2024 10:24:59 -0300
Date: Thu, 5 Sep 2024 10:24:59 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Lyude Paul <lyude@redhat.com>, David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>
Cc: Lu Baolu <baolu.lu@linux.intel.com>, Karol Herbst <kherbst@redhat.com>,
	Danilo Krummrich <dakr@redhat.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sandy Huang <hjc@rock-chips.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Kevin Tian <kevin.tian@intel.com>, dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org, linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-media@vger.kernel.org,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] drm/nouveau/tegra: Use iommu_paging_domain_alloc()
Message-ID: <20240905132459.GG1909087@ziepe.ca>
References: <20240902014700.66095-1-baolu.lu@linux.intel.com>
 <20240902014700.66095-2-baolu.lu@linux.intel.com>
 <a43c31da6a6989874eb0998dc937d7a611ec542c.camel@redhat.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a43c31da6a6989874eb0998dc937d7a611ec542c.camel@redhat.com>

On Wed, Sep 04, 2024 at 03:06:07PM -0400, Lyude Paul wrote:
> Reviewed-by: Lyude Paul <lyude@redhat.com>
> 
> Will handle pushing it to drm-misc in just a moment

Did you just take this one patch? 

Who will take the rest of the series for DRM?

Jason
