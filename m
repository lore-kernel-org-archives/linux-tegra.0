Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF8CA246786
	for <linux-tegra@vger.kernel.org>; Wed, 21 May 2025 10:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747824517; cv=none; b=p+97kfrtdapTlqB53WIIvtWCrn+bniixTgCgHKlXgVE1KiJeeGnvAb/DfLSAIFa30vI16PsCeoe5jmouCqEtSaoNuDaQ6vfJ93O0ah3+nIGXowWT7CGhTQLc6IOQ/3IT3BdYqmRu8h5PogJ9oj+zhN8cArF8YQKtnNHog8cIaaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747824517; c=relaxed/simple;
	bh=zPVzcQ0wTxrrLosGxnFrsJYeTgPP4pLFOuxsLK0tQi4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U0/NAmcptCIhkKuaojTGvJKh/eX28dvlY2mayuI+221TAJmE7e/vrJIPAtvNDpSH0DSuv81Xt2VoX4WVHKXm3G0edzYW93gZDspFb/47uJlUhw7YPFUVOTp19EeVOx3Cxprzt+zh6hciLxc99Z314EyVzhXxAdRDhTQ4Ijq/aAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TWmo0PFb; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TWmo0PFb"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-231fd67a9aeso35469295ad.1
        for <linux-tegra@vger.kernel.org>; Wed, 21 May 2025 03:48:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747824514; x=1748429314; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KCVWhmhVUwvSreyj85yNDnhSC1O4ImPSH+cKpWIfIvs=;
        b=TWmo0PFbGW/+u+YBHCF0aIFcD79Rxb6H/XY7PWwXeUbdec5sxkaJvoyXvyXr+lT+Vt
         xmOc4laQaTr/iPFU2fdf56pr/sHvDM0Xk2Oxr89sswftvo/viMQDgyGL5MirLcsSKrRI
         0zAEIdHpxD1gNVWwvWFUXrECi6P+tkwI4qBay4zmlEg08chOHHuNYXqykR6iVpE9zXn9
         2v3A0+bgfjm+PjYXOT2g7A7IhJwDIUJCoWKrlkIhbjdaQcIuKVWEKZLUNlKsDlEvBuvl
         b1IJ8bLihi6PqIpAkb5+Li4l99bv+kizHXQkPRuTbIz34SKps6Hg7c0V3oTdmltl+NdA
         gSpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747824514; x=1748429314;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KCVWhmhVUwvSreyj85yNDnhSC1O4ImPSH+cKpWIfIvs=;
        b=by9sl5cvJ/n5PmgKwG6PdUbEKCPagKENeT8ucRelZkHsMkBuhTkJIEonN7e1xZsg29
         /ZhZyepf3/uTUykofNX0Lzcy6o6FVY9E3nDD+C8TBS6ciw+yGmmKYPyKsCozaOYM1N9l
         7tf2GLA3R8vzYa/vL1oiKpayBLAinTUijmagUv4L6qtx0zheawYB70qtzi0O5q6PAUQQ
         TGZXrki5yocQEYGvp7KIgPfRY/IL/qvLnfvKnq48lKiT+hLUsAZE+Rg8ztWP6ISgvYSG
         /NYoW2HjrZp2wcpsIZP44w8Qbxt13u8dLo0NjzzQBMEUsa2sGe+t6tSglzq+xOZ25EPM
         d+bg==
X-Forwarded-Encrypted: i=1; AJvYcCUFU0jOEUXSVgXfyNHew0UCDhBjPTHDXKjb6l1gfnvfbRBKraw4vXP8EJVvVz+sMRqaBe/bimsDutFnWQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyRV5qHWdf3sUuN0DD3rY5JRTHX3SLfc9mDk4ibG7ASUjhcKuvm
	bq5qaxUf3WtZI2+ySvg3F6bUqNcZE2rCdb1pSJRrm0nKmkVs2GeYOSUvj/jZRI7649Y=
X-Gm-Gg: ASbGncsDVtHQ0wdSiSfChz5qe3VS0xKc8i1ZeTR687iAK+rxcn645Ca9FF0TnumwgPw
	CVo+0jcMJ8a2tmH67pYqfH9WwvBh3W+t57YYXRClkoWRGx+E2BrN8jjls15E5mCni96NMkRH4ti
	BMTcpFe8EC1b3JfPiKviaghqYxksrr+G+zAWf3qejmRC8+w76yY8XNe3cOl8hEHQJoRnckXLCFi
	Jxjelx+XKQVT/naAi7nUBz958gvfHnH4YJXu0iXjmt5X7ODw40s4Xp4PoSsRvS49nY1emeqdndS
	h9P5A0Scq9bK3xd3izC6bGrV+PFEB43oLWG/6xaBm9iiU3PEUowy
X-Google-Smtp-Source: AGHT+IGdd5dXeRvluDlCSAr/KcDBCCa0Jpvf2y620qpFkldBXh7b0d+mATtYjpGqsll1Ytp7og51QA==
X-Received: by 2002:a17:903:2ec3:b0:215:a2f4:d4ab with SMTP id d9443c01a7336-231d4b05c54mr265369065ad.7.1747824514174;
        Wed, 21 May 2025 03:48:34 -0700 (PDT)
Received: from localhost ([122.172.81.72])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4ac94a0sm90907755ad.2.2025.05.21.03.48.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 03:48:33 -0700 (PDT)
Date: Wed, 21 May 2025 16:18:31 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: rafael@kernel.org, Sumit Gupta <sumitg@nvidia.com>
Cc: Lifeng Zheng <zhenglifeng1@huawei.com>, pierre.gondois@arm.com,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	linuxarm@huawei.com, mario.limonciello@amd.com,
	yumpusamongus@gmail.com, srinivas.pandruvada@linux.intel.com,
	jonathan.cameron@huawei.com, zhanjie9@hisilicon.com,
	lihuisong@huawei.com, cenxinghai@h-partners.com,
	yubowen8@huawei.com, hepeng68@huawei.com,
	linux-tegra <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH] cpufreq: CPPC: Support for autonomous selection in
 cppc_cpufreq
Message-ID: <20250521104831.6a3qfhzrwf2mcnyu@vireshk-i7>
References: <20250507031941.2812701-1-zhenglifeng1@huawei.com>
 <98c87824-2c77-4ae3-b466-badd8e8187ad@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <98c87824-2c77-4ae3-b466-badd8e8187ad@nvidia.com>

On 21-05-25, 16:13, Sumit Gupta wrote:
> 
> 
> On 07/05/25 08:49, Lifeng Zheng wrote:
> > External email: Use caution opening links or attachments
> > 
> > 
> > Add sysfs interfaces for CPPC autonomous selection in the cppc_cpufreq
> > driver.
> > 
> > Signed-off-by: Lifeng Zheng <zhenglifeng1@huawei.com>
> 
> Looks good to me.
> 
> Reviewed-by: Sumit Gupta <sumitg@nvidia.com>

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

Rafael, since I have already sent the pull request, can you please
take it directly ? Thanks.

-- 
viresh
