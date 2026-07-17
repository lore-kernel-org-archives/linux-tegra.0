Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1842F3911D3
	for <linux-tegra@vger.kernel.org>; Fri, 17 Jul 2026 19:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784318363; cv=none; b=QoQpHkRw0lolhTiohJWCHrxdJWeEBjhGeU8oiKRftFItT/JmLKH2zruvkbLNh2ecn/2CUdd3L4tfccBZyAEyANRRti3XhjKNI3uO4pDmFkPO4GG71JrnwBwa/BFuFiQQZLBp6L5lf5JhteUcGZxeCT7F7dWEssAYVqJTQdBU5aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784318363; c=relaxed/simple;
	bh=LMQ7fUo3sorzck80ZDANF3wgbQwKbSE7cQhncLMM+/0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FkZuDWXZN+B9eSLnS7KkHuwEyCeskIKmOH6FHOfBBrBZDtGN2F7mf+UCU+pAnOY5yuXRwkUpPmvUjPJNtHBohHbpOQMfApAI/c3Jewch6iTpckzF8tBGIADcn0AnOwd4S2mLeeQRn5qgoEqJzQcoHrc/2Wl9WbCLKrl6wAyrV0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=a3W7GYED; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="a3W7GYED"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-51bfe810293so36963661cf.1
        for <linux-tegra@vger.kernel.org>; Fri, 17 Jul 2026 12:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1784318361; x=1784923161; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Qm69cNliseHLFEUcKlQjXlWgyg1L1lRsxj6GO+Nid2k=;
        b=a3W7GYEDEbV2fvImRDO1KYv+kg1MGa2nWGHCxwBO/w09J79inNMC3B3Yy3W0mZ4zsE
         26Egd6NORzeFDSPogz4DDN02zb90CELgJERppeHgzmPCZ8qMMdHYslk8Z2HzpfqCox+s
         ludYiZLfVsKxjDYAKjVgwxGjFpdghilv7hgKtnKJyMXW/vXGMoHWg9J1hex8US3Kpswd
         IZrsmbkfCWYtc5d8tAozo1P30kLhrrgbA2aw6Ahmu6aqyn29+lQjNKQEtgscPpP9H3VA
         JXOhzb5gVFuOttuFakbPz+N9fnJA/P7hlWfKNIyQx+JykbvlQCBO6HjywCFwEtE46UbL
         k6dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784318361; x=1784923161;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qm69cNliseHLFEUcKlQjXlWgyg1L1lRsxj6GO+Nid2k=;
        b=BxN+d6fVAZ38+OysIWqPRn+mczWoiFAfOiokq4X2y5lGCle38ihScefjHOtp6E8vQd
         m+RfFXbWxliXP6SSS9Y8lUgeRw/qbCJRd3yySayopIasZTveobwr3cJMHek1dEq00uYA
         XdOOAcTVkUWCeQ6xJ9D4MPmi8AMJzRAjQcLvMC5xoHHK5OzxyOplJi4sUGQhYmU7FxbG
         w5qbUW5lO7DVX9pwQzSQGz5qCb6TOXdx+V4PnsJmEnMmkm7+jZ+Xhk/M5L0+hOczY8OG
         kOpi9tJ/eDp7OOu/BvQjSjeDMrSlIVzzDuZa1/YXd4qVmjSmxtmb2o1guYwt04Q5U06p
         BOTQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq/k5YgQc44CqkJoWXVR1qaesTZYITlEVm8pnut/mWbKhsSFPRSbT07GaywfGmXLYv5swCDbQOwrYfu6w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxFbpWKQ+lUpXDo8K5Kdk517A4MM4BE6R7ewxIwOiaCB8stWFa7
	wqmPcUvb+hM2MsGay0zT6mwqxJ6o3sEihL0xvVzRMQvJ29WBVTnW0UWxLSgrPLWlX4o=
X-Gm-Gg: AfdE7clzbgP+7wh0sdfCc31B1EFVSYkYoVGlTG1GIKhynTBsJ8zQ/FdtSBS+Hbs9Kzy
	wXdV2WxyaO/527WihNHhSH0lcj1dbhVWA89fo6P08tL+szY3YmwMSC8ZZnm8fR9hMZe63BbFNTf
	uP995+mCLE00lzgH7yehcdwbDIA2HFzN8E+qCgW8oOwYo5sCp4FQpvHZ7uG7rpJqhkiISoyAQaB
	LFPyjxyTLAS2tSyqGyfafUoUwMepkghg9r4pZeK2Y9ST89pTbkKjHylyzAUr/+mGC1pfnM+32PN
	kzoTHb5fUB0tPhL06PZ0EN9V0uS+cMTkT6kMKkoVrzQyI5SriW6nlLX3hWU0eb5EihX6l7+4atV
	V+ip+3TSJeNb202NnhQeiWcZxS5t1hl/9ox0cRTyRtYZdubuZNK2xn6xWcSx9
X-Received: by 2002:ac8:5f87:0:b0:51c:1291:e68c with SMTP id d75a77b69052e-5213b148393mr36523971cf.30.1784318360897;
        Fri, 17 Jul 2026 12:59:20 -0700 (PDT)
Received: from ziepe.ca ([159.2.72.92])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5214ffcb2c6sm19444171cf.27.2026.07.17.12.59.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 12:59:20 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wkoiN-000000051Gu-1TIS;
	Fri, 17 Jul 2026 16:59:19 -0300
Date: Fri, 17 Jul 2026 16:59:19 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Ashish Mhetre <amhetre@nvidia.com>
Cc: catalin.marinas@arm.com, will@kernel.org, corbet@lwn.net,
	skhan@linuxfoundation.org, robin.murphy@arm.com, joro@8bytes.org,
	nicolinc@nvidia.com, linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v7 1/3] iommu/arm-smmu-v3: Factor out CMDQ batch
 force-sync conditions
Message-ID: <20260717195919.GB701389@ziepe.ca>
References: <20260714104202.1664187-1-amhetre@nvidia.com>
 <20260714104202.1664187-2-amhetre@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260714104202.1664187-2-amhetre@nvidia.com>

On Tue, Jul 14, 2026 at 10:42:00AM +0000, Ashish Mhetre wrote:
> From: Nicolin Chen <nicolinc@nvidia.com>
> 
> arm_smmu_cmdq_batch_add_cmd_p() carries two distinct reasons for
> flushing the current batch with a CMD_SYNC before appending the
> new command:
> 
>   - The batch's pre-assigned cmdq does not support the new command.
>   - The Arm erratum 2812531 workaround (ARM_SMMU_OPT_CMDQ_FORCE_SYNC)
>     forces a SYNC at one entry before the batch is full.
> 
> Lift those checks into a new arm_smmu_cmdq_batch_force_sync() helper
> so that adding another force-sync condition becomes a one-line
> addition. No functional change.
> 
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> Signed-off-by: Ashish Mhetre <amhetre@nvidia.com>
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 23 +++++++++++++++------
>  1 file changed, 17 insertions(+), 6 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
