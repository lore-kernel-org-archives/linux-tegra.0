Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2E9C3CA499
	for <linux-tegra@vger.kernel.org>; Sun, 26 Jul 2026 16:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785082990; cv=none; b=upetrD9mIwfP/ayIidfOfxBKb5CE34DzuxUqJxIvEM+KyZ+qwA56wBqjKeyitAumusmzPRtL3JIfqNNsHykwpIkPnuCvGIvqxLJo9M5qH9sOEGks1+qbzhzJSK+VkrcAhWkf9svvn3Rqv8rwqXJN3ie6T1GXYRuHOB/rwWQIzDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785082990; c=relaxed/simple;
	bh=dqXFXbXUVXKpMi3EZoVlEyKmreyknyy7Kt+mgq6gTXM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ma4vDTiayMQfqx7aL59i8VpkhgMKdpF/ipP9fpa5jXivFUTg90l2FSDKIQvfWxXN4dgvnN/Aozecsd4+CD4ZnSVVSes61kGxQ70ZPQv/PemcVQWzk1AQvDcA5P+5cv5VTDUn/MozSRz9jt7aVejKKbNgmZwUK7/DnT3FO60iFo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=Bak1hG+F; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="Bak1hG+F"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2cf50c6f235so23482725ad.0
        for <linux-tegra@vger.kernel.org>; Sun, 26 Jul 2026 09:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1785082988; x=1785687788; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FuXTk3sNqgjvfJDVodnQ6dQBc+GEb7krH4jOLDWR1sw=;
        b=Bak1hG+FBrVx+Ne3PG5zQVLBoJwXtyk41mVwmpP4efjiO0ntUbke7Zup6sfGPSnt2v
         +UqEROtTQVxefwtDQmSoo3Ul8S8tEH7yiP9BRb8oy1pWPgUqnVVHrunTu/kQtymfgnoh
         hDZj9ttmWXNcXPgawPxKLhtRmZ2baiI8R+/JjZ5M4mEaJS3GNQc3D1IgzYto+3I0KS7S
         Pt5/mCqS7PiLXGKmmFxNfn59ZtiZkLflsLvn3nXxhQGz2ln+1lrBhPSrh2F1fYx0/IgO
         pF3vRCcmbuzMXGN9wUeEQFUVE7BvI6Z+ZTUNZFRRu8oe6PA4evqLWd1JjeWTpLXMUGfz
         YuLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785082988; x=1785687788;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FuXTk3sNqgjvfJDVodnQ6dQBc+GEb7krH4jOLDWR1sw=;
        b=Eql3vglFM80cJx9vON0v8woGnF0+oY0a+r6w5I+7I6peBRLle/s/6tHyKiOIGEODHh
         B1F6b7qnXtU+0BNdadgHUvfn8J+OaJoJadVFt/1uL5fYjKadi8sm0Zx4cIpvPjN1vTsw
         KZm1d10p7WnRObBxqY80zAuh0DGW2BCw0duf/8udUkDeESP1w5kODrpD7APQt/eN3evV
         CKnusBzgx7PAdQgg53OdEZbLBmb+8mIl5JkTPCes5EeskFvOwEGt18nsws/HKYw7Yvt7
         LY+Kree0yDZ09tvSMe0uUbqtrvLbSdWy2rnSBEWdfQb8Gr05q+WLyw4yHqd5d1Uvwk3m
         Hpog==
X-Forwarded-Encrypted: i=1; AHgh+RpQRJGnmWHSkYxmRP3qt8oWrhUk+ycXF55ie2TB81i3OuA1mSZQdZICCF9X3w+hcT3r8L5Am1PHo/XpQw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwP8OL6DzFK9fOH9Y0aO44TQr+77zDereyEaWsLZnkhTwUjB/DN
	FFxCMA2qSQtnQTZvMt7JNnt4bq7SLzHEGBS9LrwHAy/uv3NA1KOd0SIlDFhYcQlBguM=
X-Gm-Gg: AR+sD10W4UjAZwSbXjmM10OZTnJlssuADMIjuS6LrP6UJglSQkdmDJl5LrUVQ7BYSug
	fHXK1M7oF1ewPkngXqIrO0wSpwMeoJnIOoYLbYfcl8mKkvLv4qtom0XyOq/Rt8IkQ+HexGVvKNQ
	jaBrqKjRpVYrJaGclmA041BCqEw5c1/5itY1uJQF3OIWT4xuBYozPoE93rhtoQu8CHDvYu3jXJL
	M7lOP0zWMEPl6DWKhq84jgDSBgcri+43c3Sw0k3kNHYB2wlAfXn06TgL79G7pAMqfKN6HAi8ajj
	1IjAKbKQPXZ8o4Ic93Pfy3saA+ingecxIpwOY0KOOpOFPrmiRcxMhTHsPgBPjVfB8UyXvqH62qd
	ZEfpNPmPd3WMOBduJtlsbNUoY/1RDGRixhVV1EHnPX64NTYWaNt0=
X-Received: by 2002:a17:903:4687:b0:2b7:975c:dacc with SMTP id d9443c01a7336-2cfde79058fmr52053305ad.1.1785082988138;
        Sun, 26 Jul 2026 09:23:08 -0700 (PDT)
Received: from ziepe.ca ([64.114.68.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde80f50asm21426485ad.77.2026.07.26.09.23.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 09:23:07 -0700 (PDT)
Received: from jgg by jggl with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1wo1d5-0001Tl-8m;
	Sun, 26 Jul 2026 13:23:07 -0300
Date: Sun, 26 Jul 2026 13:23:07 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Ashish Mhetre <amhetre@nvidia.com>
Cc: catalin.marinas@arm.com, will@kernel.org, corbet@lwn.net,
	skhan@linuxfoundation.org, robin.murphy@arm.com, joro@8bytes.org,
	nicolinc@nvidia.com, linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v9 3/4] iommu/arm-smmu-v3-iommufd: Report
 CFGI/TLBI-repeat erratum
Message-ID: <amY0azMCny2sHfX2@ziepe.ca>
References: <20260726081904.1408859-1-amhetre@nvidia.com>
 <20260726081904.1408859-4-amhetre@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260726081904.1408859-4-amhetre@nvidia.com>

On Sun, Jul 26, 2026 at 08:19:03AM +0000, Ashish Mhetre wrote:
> A guest with access to VCMDQ generates its own invalidation commands
> and must apply any invalidation errata before submitting them. If the
> host also repeats those commands, each affected invalidation is issued
> four times instead of twice.
> 
> Add IOMMU_HW_INFO_ARM_SMMUV3_ERRATA_REPEAT_TLBI_CFGI to report the
> CFGI/TLBI-repeat erratum to user space. This allows the VMM to expose
> the erratum to the guest or apply the workaround itself.
> 
> Use the raw __arm_smmu_cmdq_issue_cmdlist() helper for user-provided
> invalidations so the host does not apply the workaround a second time.
> Add arm_smmu_erratum_repeat_tlbi_cfgi() to query the static key when
> populating the SMMUv3 hardware information.
> 
> Signed-off-by: Ashish Mhetre <amhetre@nvidia.com>
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c |  7 +++++--
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c         |  7 ++++++-
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h         |  1 +
>  include/uapi/linux/iommufd.h                        | 13 ++++++++++++-
>  4 files changed, 24 insertions(+), 4 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
