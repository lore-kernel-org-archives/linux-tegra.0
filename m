Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75FEA1B29AA;
	Thu, 29 Aug 2024 15:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724947124; cv=none; b=m/Q3jrV5G8fQM3wX8eHKQGdcNinBSx+QxfuPH7fCnLQO4Tizqwl2QQuJd0uCau9yMJciZGTJMYivEkiTFBSRZK2aGj0TR5zGCS/CXnMTaPs2phSzf0dFqZ47qP9T7sbwjaU/jOkeJD/qAa44VLi9OhddWrypQEC/4kKQwCGkVR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724947124; c=relaxed/simple;
	bh=f7QkdqLQNpv165OxQ70XV8bsOdIVoKcfW1VXLeNbzt0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=feYTvddsc62LYTaBTB2ZKzh+BNFdO5s1gPYil/SaxYBlprPMN+tQw2jRmS9jqKd4ME7F+eZCY64okVPg4tnHCC5QVBHnDzyRyzZplzlcPNf/yi329HItp3+8xJ3DXQqA6W2Eje7Tdayaa7TmMjP9hTH4peAxABURG3KoLp2pqSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lLMaJwCv; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lLMaJwCv"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-201fba05363so7252845ad.3;
        Thu, 29 Aug 2024 08:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724947118; x=1725551918; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lhPD/kfMojMsiZuoWrSaNbTJbgUBxkxmEH5S95zw+WE=;
        b=lLMaJwCvs4lF4AtBJaKobMlzDjjx/vQ2s3PEanVHnouSyd7FFvbvdEex7WtR8HobuD
         Hx4qhyaXJbG1JFqbnTPdyEHVj3LFKugbzAqajRS6i1WClsohtGPSIA4wSMETiXGywamR
         OlO+ZSeMbzkaqeKPyCiIamaEd5FkrXVWeivm5HhSdG91FLNaB05rJfFjpeJ9qcD/X54N
         I/z+zt1uIH7HJwr7X/K08gdqzqXMbOeCZc3VgambNSgJ//b5C4TIdVdb5/4hbTG1n21F
         yy+cjQOa0LiYTGMDHr+jSeWbuw7tZNEpX3LCJB2iw1wgxswUisiFd1zAbuEk8k+x4K8x
         EJDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724947118; x=1725551918;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lhPD/kfMojMsiZuoWrSaNbTJbgUBxkxmEH5S95zw+WE=;
        b=oI/wulStuNGPoLfYqAsamYxa0YxpSeuT/43SvY90nN3Sch+Gwy3dk9fCjwb5+gHOMy
         4llkgvqFymDjnITdpupEhIE3mPxSiltEJGRU9aLsqLIuLVLH1pkNyfXpBxjHoPUfmNFR
         pydyijHAgS+aFVR3ZjHX2Bg8rov6LZu490XZdcbOGmfthvnrwo/TVz+JmWPFZzsyRh5N
         YPDDNgNTcJT9IEQssrmSmfZ9C1mfS+XUTBFLGiBlePt0PeLFRmMju2g1LqR6t8vfRHuO
         imOi+hSpi/WSje6p9aPnc3QCJ9zUzAo7fhupqRNh5RIKIJugUqkEgL6P6fVSLdLTmXmz
         BlmQ==
X-Forwarded-Encrypted: i=1; AJvYcCVzi6FI/+7XUpGJpskTeHzizl5vFTF8lnUvNAOrZ8aPYBAo+8Sde2ee4obfAP/tMq5A/JPaz6M48j16w2U=@vger.kernel.org, AJvYcCWlu4eS44dyM0lDOrBBBBFZaRgo/7YS+oCmutNrztCBu+jKd27vx94GAm0xJixMkebLR4oIr6sROenNgTk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxLRhCnvn6iootwpQoT6npwiFtYuiMgGqCZ6hkNZaFrYA7pz9/r
	hP4QUsZP0pWv5TLwBFrrCPrW8u3T4sV6HCMgID5RGbeJYDyhTX5Z
X-Google-Smtp-Source: AGHT+IG1iOySf3RBBJ3oZsxcckYR+heTF1O3pcq0NqbDD6cG8BqQV54k0HoaRzIYQMYUSXNS5l1OAA==
X-Received: by 2002:a17:902:d2ce:b0:202:4b65:65c0 with SMTP id d9443c01a7336-2050c3a9497mr33986965ad.32.1724947118265;
        Thu, 29 Aug 2024 08:58:38 -0700 (PDT)
Received: from five231003 ([2405:201:c006:3236:1c28:fa2a:bb62:6e9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-205152b3546sm13110165ad.17.2024.08.29.08.58.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 08:58:37 -0700 (PDT)
Date: Thu, 29 Aug 2024 21:28:28 +0530
From: Kousik Sanagavarapu <five231003@gmail.com>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: andrew@lunn.ch, sebastian.hesselbarth@gmail.com,
	gregory.clement@bootlin.com, herve.codina@bootlin.com,
	qiang.zhao@nxp.com, christophe.leroy@csgroup.eu,
	thierry.reding@gmail.com, jonathanh@nvidia.com, nm@ti.com,
	ssantosh@kernel.org, petlozup@nvidia.com, pshete@nvidia.com,
	ruanjinjie@huawei.com, christophe.jaillet@wanadoo.fr,
	ulf.hansson@linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-tegra@vger.kernel.org, krzk@kernel.org, jic23@kernel.org
Subject: Re: [PATCH -next 8/8] soc: ti: knav_qmss_queue: Simplify with scoped
 for each OF child loop
Message-ID: <ZtCapIwWZolY7oMH@five231003>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240827114607.4019972-9-ruanjinjie@huawei.com>

Jinjie Ruan <ruanjinjie@huawei.com> writes:
> @@ -1080,17 +1080,13 @@ static int knav_queue_setup_regions(struct knav_device *kdev,
>  {
>  	struct device *dev = kdev->dev;
>  	struct knav_region *region;
> -	struct device_node *child;
>  	u32 temp[2];
>  	int ret;
>  
> -	for_each_child_of_node(regions, child) {
> +	for_each_child_of_node_scoped(regions, child) {

Are you sure using *_scoped() is better here?  Since it seems that we
need the memory pointed to by "child" in cases where we don't go into an
error path.

>  		region = devm_kzalloc(dev, sizeof(*region), GFP_KERNEL);
> -		if (!region) {
> -			of_node_put(child);
> -			dev_err(dev, "out of memory allocating region\n");
> -			return -ENOMEM;
> -		}
> +		if (!region)
> +			return dev_err_probe(dev, -ENOMEM, "out of memory allocating region\n");
>  
>  		region->name = knav_queue_find_name(child);
>  		of_property_read_u32(child, "id", &region->id);

Similarly in most of the other cases in this series where a similar
change is done.

Also FYI, as for dev_err_probe(), I think I covered all of them in this
file and a patch for it is currently sitting in ti-drivers-soc-next.

Thanks
