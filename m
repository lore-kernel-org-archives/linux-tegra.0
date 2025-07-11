Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70753258CFA
	for <linux-tegra@vger.kernel.org>; Fri, 11 Jul 2025 09:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752227830; cv=none; b=d3X935owted9OIC1pM4L+GEM6AQx16F9rx0DcrwFuEP4uu5Tg8Urjvc6EO8Qvv8sAKXmMPBYUvJZeDjtGgpeuLE3YAKyK0jUD5Vcqm/oB3EtudNCKfi8V80UKjY8GQM9VGxlPp4Y32dUKk6PkW6VpiuGM4YpWn126PdbKU0IVEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752227830; c=relaxed/simple;
	bh=CcCFu81EIf/YY/BJutLKyo09SLthVV/6DIU00FEEjUU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dW6xf58YgmLp5K9haYMqfsezkFtGcO+CkxNG0WochRjy9AzazkCaDpoBb4eIvq6EO2C2bD+cbWcCEHYRS2mBGZY4YN8YmllQOoBW3jlLbwNY2Mx0tErJPGuTiQEuRbX1w2kXAcDnCJju1MDkwdQbC6F+5ZVqC7qhOEcUvrwdWwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SsrFIhsZ; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SsrFIhsZ"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-23dd9ae5aacso105375ad.1
        for <linux-tegra@vger.kernel.org>; Fri, 11 Jul 2025 02:57:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752227829; x=1752832629; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=034zD2t8+j7QVlHQTTa3rHmzt0sqsL2Mdd151xEc278=;
        b=SsrFIhsZcmjYKiuhtqGdElOvp4l+++ZSKFHZ4k8VTWpB3d3JZvGAilwD3laej5tM0Y
         r8QjfSb7vTqSlWINRVzpRw5XhLREMXFYsC7YLTNmDZqBwX+MywyIz8UuGrf1w//LUs0/
         xWbWoacN/KMtpTBwjjrU2ygKmU90yjfKEB+fbkXVprbm7UXDawjIPP6DOah0odSj+VNm
         R4eoHYcS7+MmX2vDQM8tfZ8e9mZrnRGOoTALbzFdiU7JkLMOMDP1teFgCCD45MhcohOS
         BpohdkprnVEMQeLOeZzoNhv2K3m2/ZJsiFvcAXwsbgG/8MLTavEHeWCFPS67/J/B5xTo
         2eYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752227829; x=1752832629;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=034zD2t8+j7QVlHQTTa3rHmzt0sqsL2Mdd151xEc278=;
        b=AbLoUhhpm0s214tK3tIP+FZ5MfIpX/nErIHiTx6dzzAfjehh6b06Jgk3QbGKmUumMd
         yrI1YZmGFGI0GyS49BSgtqvikcVQJoMK+18ZWZCawQ63HMi/bC3YjqD3pB8mPXxUIFcl
         S5Q/RCKFCVL9zucdVYVdan9iBHHrRh5EHYBP7DnJ+KcmW2xKBLe6CIjTA0lsHnNK4b+a
         553DuqlgyhjaxLay1nrpt0HjwIrGGPuhI13ug7fGPvgk9KTE7+OUU7YEYgweqbJSRS5j
         nzlSpFh8YzbYFBDJ0Q0QAUltghFxSPrAIO73NYafPIGvfphlZ5rIKvo0EJFNuXW7BoXY
         rOQQ==
X-Forwarded-Encrypted: i=1; AJvYcCUuN4kzFxbWSZ+nMCYquKEIIh7nABggJpzBNrSfGIurXfkAwKzHCXiMoONOhlYXSpM27fBEOE7l+BrMVw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzkxZ4DRKpEAFiYTXaNe+nWR7oeGiIlRNz/oL8TNQZ3mLZfjiKs
	k5t3a3633yfLhyY+nYyo86bedJL4t+n5BuEFcdyaCLyHA7ezeoydU0tprs85xn6cJw==
X-Gm-Gg: ASbGnctMkguydNR6bjKsKKY7cyayS8uAY0o/wA2w40z8J0bbgag2wZbpdY4/NFyTVMB
	mTwZNkcyWlhSQvbqJrDCSY3mixnEnOK7EmyUD0eFEktKG6WgQhgnLJq0T10Q6q9+N0By4TFLi4+
	LKdVvQ3DN3o+e3onzKkSW6i0zQBL/hjxK757tUfDSy7MdXuznAp7WXhSsu2e62VesoE8fXyPraO
	jsMYlCoGL6eZ3d70EVJfROQwJjLUf/yq4dKQDUKg7pP8viPioX1wwWioGH5B2RYYYuxFVRp4m9C
	Yg3e8AOtzAr+qTV1I3D8fzGncRE13XLHwq9TErcTsvzJi69GBrEDkTeJmo7sXT2waN8ftvhBDrc
	Fx2IZ/uCO4v2Z2q9RAhfvSDRQ23z+ekm74IHCCDAjxvXOOtvPBcyDRVrs
X-Google-Smtp-Source: AGHT+IG6OJdkdwVAu17LyTkPAnvBK7l4yng4G46N/h54a/NCPDtWUMAP3Y1SEP2980Km3pvxW+HZDg==
X-Received: by 2002:a17:903:fad:b0:235:e1d6:5343 with SMTP id d9443c01a7336-23dee273e89mr2500075ad.20.1752227828514;
        Fri, 11 Jul 2025 02:57:08 -0700 (PDT)
Received: from google.com (232.98.126.34.bc.googleusercontent.com. [34.126.98.232])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31c3008a610sm7731211a91.20.2025.07.11.02.57.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 02:57:07 -0700 (PDT)
Date: Fri, 11 Jul 2025 09:56:59 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Nicolin Chen <nicolinc@nvidia.com>, kevin.tian@intel.com,
	corbet@lwn.net, bagasdotme@gmail.com, will@kernel.org,
	robin.murphy@arm.com, joro@8bytes.org, thierry.reding@gmail.com,
	vdumpa@nvidia.com, jonathanh@nvidia.com, shuah@kernel.org,
	jsnitsel@redhat.com, nathan@kernel.org, peterz@infradead.org,
	yi.l.liu@intel.com, mshavit@google.com, zhangzekun11@huawei.com,
	iommu@lists.linux.dev, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-tegra@vger.kernel.org, linux-kselftest@vger.kernel.org,
	patches@lists.linux.dev, mochs@nvidia.com, alok.a.tiwari@oracle.com,
	vasant.hegde@amd.com, dwmw2@infradead.org, baolu.lu@linux.intel.com
Subject: Re: [PATCH v9 22/29] iommufd/selftest: Update hw_info coverage for
 an input data_type
Message-ID: <aHDf6w1gFcNKNtGc@google.com>
References: <cover.1752126748.git.nicolinc@nvidia.com>
 <f01a1e50cd7366f217cbf192ad0b2b79e0eb89f0.1752126748.git.nicolinc@nvidia.com>
 <aG-fZv39ci6yip3z@google.com>
 <20250710153202.GO1599700@nvidia.com>
 <aG_togvop53dLSZM@google.com>
 <20250710171216.GR1599700@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250710171216.GR1599700@nvidia.com>

On Thu, Jul 10, 2025 at 02:12:16PM -0300, Jason Gunthorpe wrote:
> On Thu, Jul 10, 2025 at 04:43:14PM +0000, Pranjal Shrivastava wrote:
> > On Thu, Jul 10, 2025 at 12:32:02PM -0300, Jason Gunthorpe wrote:
> > Alright, this was on the `for-next` branch when the head was at:
> > 3e2a9811f6a9cefd310cc33cab73d5435b4a4caa
> > iommufd: Apply the new iommufd_object_alloc_ucmd helper
> > 
> > But I see that on `for-rc` [1] the fixes are merged.
> 
> Yes, Linus discourages back merging rc without a going forward
> justification, like following patches need the rc patches. Fixes some
> bug is not a justification...
> 

Ack. Thanks for the clarifying!

> Jason

Praan
