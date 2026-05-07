Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7543137189B
	for <linux-tegra@vger.kernel.org>; Thu,  7 May 2026 09:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778145750; cv=none; b=mJtiFPRh5MK1OMiTatmHDbnf4Kpe82A2bxh2E05/cUNabAn/JVYTF4o+uEjmbC8SxutfcrXjRYpt+KwfJEOu8zg4LS0vigmeQ6zEvP0WCMYYfedkrIz5YrHerj5NCzRdEtgE3xBeKcDZMgLTSAzkXL+riHUDX7v/NnYV+SYO08g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778145750; c=relaxed/simple;
	bh=uce/fcdpqFl+5MjxJYMw8zKWV5w0xDAP2ZjzMhxpH6s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lSZPXjdoZfY6E51kXgok+ywgsVmDwPHHLdcMq/HSVO5ybZLPW5pZL0d9xPsR0LmE6xd4vJ9Br6vymvMm5QSTaghea6YqrSHHuOiwGq1Uju70EO0a0jbd8+O5gIRN6sAvFt1VV4eNnMymly7Q45yi3V4oFISG2hRwDyU7/TWjaXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CbATEu2O; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CbATEu2O"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-48d1c670255so77805e9.0
        for <linux-tegra@vger.kernel.org>; Thu, 07 May 2026 02:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778145746; x=1778750546; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ns8GiU7JpBrxm2tCxgyo0Vrbr/2PTrgnrkNgo2RuOyk=;
        b=CbATEu2Ogo3WwQZ0ab2SlOfB1LBmyE5Qg03esMzHMzdDZ4UYoZfwLTxbGrq8U7H1Rl
         NHFAzDkCnGUQO1p0uy1R5NsuHJoZbfXlvkPGjLO09PJmRX/np6hpkxB6ZtHsl/WruV4c
         WLaWcZLTa6aYH8yxXR79IsmNvEzYeb96RFf9e20hSEdGwh+9G4RfdFVLfo+i0HmXKu4f
         DXa7tB4j8jcyTgSZ9jpK0k38rWTxYeTbL1sWxRnHm4oBmGpQeBQ9YWOJDnYDj1OnzWb+
         /t60AD/LQmPjfLtDcWeP2m4anj1x3+mnOrmaxN3Aj7rHAzl0H99VNDF/6MBJFnPz5Tzy
         twFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778145746; x=1778750546;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ns8GiU7JpBrxm2tCxgyo0Vrbr/2PTrgnrkNgo2RuOyk=;
        b=MB+dc80BgV4OqCqVNCuCgNrwRV749hOxcz9qK7buLXX6GWLHoxqcsDLb27PiRLRML7
         7ElghQbcGeBecLJZUlNaXWnhdicRNjGgKUDB07hcrfAnO62D16FtNxS1L/f8D5qSsHN1
         +nUNdcowZmsp9s4ty5BDkSyImiN5COYdbXACKPPfvFIGYgOYQT8NpfWheqjRnW5L5+ff
         pS9XzWlLCroLK7BYFUoAsNPJVXphp3PzREIih8MjRlFN+z80SfgChp7bECNfY5T8CQ08
         N9PaUqf0vl6gTpQ9gwYkkNcWIi+ODpu4+bWfsvSacvsAfVQom8Qn28N6EckmQoNPpR61
         REzQ==
X-Forwarded-Encrypted: i=1; AFNElJ9rUnkGsHwOpxbE/3+qdzmk5R8uTFoiaZednyVhgnnkpSR4poNQ2rwzMkwJaST88A4VXktV/oUc07A8xw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwSOqUo2VLsuQNifnZ6XjcnUip0zPxAkwtZVMSnUJXFuWH4ofGe
	5XkdxkeV2+841qKnmYjreeSUlwDF2Ri1lFKYfPin86hE2XW0F/MAzoTa2jBgDGPziw==
X-Gm-Gg: AeBDieshTbRe7tyhrRCMTlDVT+N0a9IrVzXYrG7NwT5aRKRTmvcMfToSQYWczF8iGgg
	3Qly2D5lm5oxyg/3P2APTI/1HDTVRakI10+GXzKJuXaD5UQS9w+XXQyRi/5JCMPm+evnpEVgi/2
	VTcbf4cC5emxqi8uNGUeJQi7N7QDokEk+o5cCILdrlVdlCbgaQhfIP3nb4uV5tb96wxtnXKMRll
	wzCSqxpDNSuaadnj0DIJ61X20iZrnPDKLvVeaj4vtGK4aAaNRBC7l52wqF3p+x4aX0UMgd3ClKI
	zRFBRGyXnMRXWEsGEMD4ZK69EIZ/Nq7kDyBehVHFKJM2DnqbnqNw094t5diQdCGsLs/JZJPXnYU
	9py6sjZPmW33nl1VacSreCyUm/fAt7frXvgpBBpCqaqtwmcB1yZuEVCggHz1WKceBcQ35/hZE0r
	TxdnAQccrVXfnlIfaswngyRKJlalyrksQSDHfWN3MKc2pfzSzKArAMODrqS+FXHdUSREznv2x+Y
	essdA==
X-Received: by 2002:a05:600c:6c08:b0:48a:6321:87f7 with SMTP id 5b1f17b1804b1-48e5d64c0dcmr657235e9.8.1778145746114;
        Thu, 07 May 2026 02:22:26 -0700 (PDT)
Received: from google.com (8.181.38.34.bc.googleusercontent.com. [34.38.181.8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e538aaa0fsm135407645e9.7.2026.05.07.02.22.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 02:22:25 -0700 (PDT)
Date: Thu, 7 May 2026 09:22:21 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: iommu@lists.linux.dev, Jonathan Hunter <jonathanh@nvidia.com>,
	Joerg Roedel <joro@8bytes.org>,
	linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
	Robin Murphy <robin.murphy@arm.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Krishna Reddy <vdumpa@nvidia.com>, Will Deacon <will@kernel.org>,
	David Matlack <dmatlack@google.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>, patches@lists.linux.dev,
	Samiullah Khawaja <skhawaja@google.com>
Subject: Re: [PATCH 5/9] iommu/arm-smmu-v3: Remove CMDQ_OP_CFGI_CD_ALL from
 arm_smmu_cmdq_build_cmd()
Message-ID: <afxZzd7s2SobJwW7@google.com>
References: <0-v1-b7dc0a0d4aa0+3723d-smmu_no_cmdq_ent_jgg@nvidia.com>
 <5-v1-b7dc0a0d4aa0+3723d-smmu_no_cmdq_ent_jgg@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5-v1-b7dc0a0d4aa0+3723d-smmu_no_cmdq_ent_jgg@nvidia.com>

On Fri, May 01, 2026 at 11:29:14AM -0300, Jason Gunthorpe wrote:
> Nothing uses this, just dead code.
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>

Reviewed-by: Mostafa Saleh <smostafa@google.com>

Thanks,
Mostafa

> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> index b3ef001ce80d23..ef0907b1a2204f 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> @@ -290,9 +290,6 @@ static int arm_smmu_cmdq_build_cmd(struct arm_smmu_cmd *cmd_out,
>  		cmd[0] |= FIELD_PREP(CMDQ_CFGI_0_SID, ent->cfgi.sid);
>  		cmd[1] |= FIELD_PREP(CMDQ_CFGI_1_LEAF, ent->cfgi.leaf);
>  		break;
> -	case CMDQ_OP_CFGI_CD_ALL:
> -		cmd[0] |= FIELD_PREP(CMDQ_CFGI_0_SID, ent->cfgi.sid);
> -		break;
>  	case CMDQ_OP_CFGI_ALL:
>  		/* Cover the entire SID range */
>  		cmd[1] |= FIELD_PREP(CMDQ_CFGI_1_RANGE, 31);
> -- 
> 2.43.0
> 
