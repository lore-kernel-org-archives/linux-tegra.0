Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27C7348CFC
	for <linux-tegra@vger.kernel.org>; Fri, 25 Jul 2025 17:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753465647; cv=none; b=hzI6o6CV5HquK8RtamUauBeQkFydguHayB1Ua1ggDyP4EgpS6CphKQC1bz2azUm4TiWICFFyWYwHILjAWjVD4Kd/a6lV1IHGB22I0itwaYokLREW055xxbBMy3YNu4ny9M6J0b/cKc6OT1zOPsjnujIZzfPAKSRCwN+SEVjkWOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753465647; c=relaxed/simple;
	bh=9/9IGptpLwsFSnxB182Zg/p4chccFKhXUqIIQR5aytk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rRvc8KnEbFSVy/OI4lVmcpl18NQTKfqeY/HpXi+MmT01XL/rAMWEln64Nfzc1gXKG63gaHwGCaWR0nLhenkIkGazZ1DkDaB8nxEw6KF8cTOXrE/i7QF67HN7zOB60Li5Q2i0CC/bAzNp7NPcglcwEsC/j0vImt/8TGJb2hfzXu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IICHEsNd; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IICHEsNd"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-23dd9ae5aacso11895ad.1
        for <linux-tegra@vger.kernel.org>; Fri, 25 Jul 2025 10:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753465645; x=1754070445; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nb42As4a1Tt2TakmJwcUkP/IrOzz7ol8ZmDuilSE7QY=;
        b=IICHEsNdsuF+tsQCHp129l7z3NEfSJdgrzrsVXusp3893JyEzTsNWJjvhiQvL0ErvV
         QN0PedlPWS+FDkS2sY/AWdmZwR5ANL24/UWZp5TByoFVAXfZKtMyDpdLnyH8fRABOcxr
         2OkO0oF7/hxvr4ah6g9H/uexXY9WcPErlc00QGPXXyB/9jzRUO54Wu6UB+Z6KppW29eJ
         +1b6gBNPXWIZ04BM8QYB/yvcgKv++0hlrv74T8Hto0pyzMDNHRlGXK9T8bgGjYbsn+Of
         rSkhWPoizPMDtkZfWXA52K8XdYEQonYBfvnMYPMWxmKBUQyLaH+ITkupk4lAz9Xl9ShQ
         3zjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753465645; x=1754070445;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nb42As4a1Tt2TakmJwcUkP/IrOzz7ol8ZmDuilSE7QY=;
        b=hLuqsexfErPK3QrZub3+gfcnXpTKZ6jDmYyVdIHW2omOSvE6N3B27jSSVstZPEPUEA
         G1ZgQvGO4G7+6CeZy3eiAvCjX3lN3Af7aXGODkbrjxNOAhUxGpsGVlk0h34AvnSe7K0y
         1RTWzUEfKztslrkkVliMfyQmvaTnjj2dUvxkTUzGF1IqB41IDgeaY4Csks5nyqMrSC2X
         YWIPjH29r77tqvHuZbRW9lTnK2IK7NxYzWC1hkoY+MoyT4Yiu0IjW+MObYz1vC3WkWqA
         8S3wtc+lmZJNgOLFKWpzEGvQfgOaFd8c+drSIkQGoPwmxf9b4WAznZBlH9hBKKLEGIB5
         re8g==
X-Forwarded-Encrypted: i=1; AJvYcCXhtyG5pHks3FeBgP9U2aYjzjuPk2IsWHeVMXYNkJM1taPcdjYuprS8G3pL/RE2Vvf9BmVY1rq5ztiOTw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzkoM788T+fIfQgMN/JV0E3cA2mrpQJ1heWbYwAa9aJ2Tb746Z8
	bS0sj1gU+3jp6iugzQYQ4ZFlJzMPdm3p7RYtJMwJMF2jjy6ycQGG7FtRsy4SJ3S1UQ==
X-Gm-Gg: ASbGncshmR2LuFA4v3bKH+4CaXR055tXBLitEIZ3x1vtIuZNGKCJRx3adPSLHDc6tuZ
	b1hQDSSoc+PRzxm+BKkiV3Ry3Znv+rqFKrjDG9BgsU/Z8EA5HzD2c4oAHwHcs3yELHgXufjey/L
	8mEqMbA1wdIAeOkQFUgBDPn1KkrT3vPjxEh/0FeBMVfbqIjTJlUKkwmliCLUjzT9+8mRVDrNszE
	8Ez1s2iUWMGERj7gG/zEQky6Z6YhiZ8Z5u63Ayc33hs6MDqFrUljqH/U7TikIhrc3vW/v0/A2GD
	YT7np78Fs93sRto8DE5JukQ7FYiofLg1jLWAhwus6TZJfkcL4jW9MA1/vj1G8R+ICF/6CEdyc/2
	3fmwtxgeHDjf4u9rIOymQwSMDVaazR8oAhwMLbjxLM7t64rK+DiHFEj6k
X-Google-Smtp-Source: AGHT+IH6CzP73NhGeAVCvr5tnhQ0xcNucVsA1Zx6VNhDEe6MGsxi7hQ/IPtgDO+K7Qiu3C7e0YT0ug==
X-Received: by 2002:a17:902:e889:b0:235:e1fa:1fbc with SMTP id d9443c01a7336-23fbf677572mr113455ad.0.1753465644867;
        Fri, 25 Jul 2025 10:47:24 -0700 (PDT)
Received: from google.com (232.98.126.34.bc.googleusercontent.com. [34.126.98.232])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fbe537f8asm1791005ad.167.2025.07.25.10.47.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 10:47:24 -0700 (PDT)
Date: Fri, 25 Jul 2025 17:47:19 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: jgg@nvidia.com, will@kernel.org, joro@8bytes.org, robin.murphy@arm.com,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v3 2/2] iommu/arm-smmu-v3: Replace vsmmu_size/type with
 get_viommu_size
Message-ID: <aIPDJyuSVpqMV8sn@google.com>
References: <20250721200444.1740461-1-nicolinc@nvidia.com>
 <20250721200444.1740461-3-nicolinc@nvidia.com>
 <aIDlsUvF2Xbdelvx@google.com>
 <aIEkZoTOSlQ0nMKd@Asurada-Nvidia>
 <aIEwzM7mKUI8-h9U@google.com>
 <aIKd1owebUNQeN1-@google.com>
 <aIKqaGMMpsIuAVab@Asurada-Nvidia>
 <aIMR6xxR3Jdpy8kX@google.com>
 <aIOq2ysFPfZsNUix@Asurada-Nvidia>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aIOq2ysFPfZsNUix@Asurada-Nvidia>

On Fri, Jul 25, 2025 at 09:03:39AM -0700, Nicolin Chen wrote:
> On Fri, Jul 25, 2025 at 05:11:07AM +0000, Pranjal Shrivastava wrote:
> > On Thu, Jul 24, 2025 at 02:49:28PM -0700, Nicolin Chen wrote:
> > I'm agreeing with all of it, it's just that the comment says something 
> > was rejected in by the size op, which raises confusion as to why we're
> > in the init op. The init op rejecting something due to data corruption
> > is a different thing..
> > 
> > I totally get the point about data corruption, i.e.:
> > 
> > size op -> returned something valid
> > <data corruption>
> > init op -> rejecting corrupted type
> > 
> > Wheras I was just trying to understand a case where as per the comment:
> > "Unsupported type was rejected in tegra241_cmdqv_get_vintf_size()", 
> > i.e. ->size op returned 0, yet we ended up calling the init op
> 
> Is the updated one in v4 fine to you?
> 
> /*
>  * Unsupported type should be rejected by tegra241_cmdqv_get_vintf_size.
>  * Seeing one here indicates a kernel bug or some data corruption.
>  */

Yes, v4 looks fine.. but I was just trying to understand if the comment
was wrong, didn't necessarily need a re-spin just for that comment :)
Thanks for accommodating it though.

> 
> Nicolin
