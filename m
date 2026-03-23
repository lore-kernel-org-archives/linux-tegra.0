Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 385473B2FF0
	for <linux-tegra@vger.kernel.org>; Mon, 23 Mar 2026 14:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774274622; cv=none; b=iWjYX+QbewkSbl7swwLwsPzWyeZOnuQRAz1Jmzws0FUIMchT2cGWNIbG69LPIHCE0q+fJZqJ1+pAL84patHyF8GwKlGWym7yTx0DHQblCObKMb/T41x6KuqOSkgJ3S1nSQUGp6YUi/gmENsLHPibP4VNf6PsuPXzpU8PNiSWe90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774274622; c=relaxed/simple;
	bh=+8e7Mg0HqnH60zkD62yuOYrS4xcoRBXsctMqa484QyU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fGMAeOJvsM+p7kkPkC4Ta9Y6Gamm/sFyOlzVuUq0cg3TYiJZ/6qgaoaseihx/kgxNupI6XA5yGSW7wVTKIYHh9Ez6Toqd/Ui+kAd3fyb8VQNghRFQlcmcF+oXXYw44U0PVVg5GWLG6tOnlOUNur2YvEbKGur7oS2oeUbFqJp10g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gNuPcMcn; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gNuPcMcn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774274620;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EmvoSlI6zhEDXgvnhN85AXx/F1wuELhxcozcM5H9OTc=;
	b=gNuPcMcn6B+awu2yUConfjfyprRynsz99muhxqPLDQ/icwqY0zIGWpaXSitsO7jCEr8o+X
	6MV1JB+vzcI1pQfszGxp51uKlxyy5mRp7fgJ+dvRzvpeO0g21m7SAIrBJbrltTGbsuPIzB
	fO0oUEoM+ElZ5i/S4zzwzB7nPxTvoJE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-32-gsUjN832PZmlDU302GXfzQ-1; Mon, 23 Mar 2026 10:03:36 -0400
X-MC-Unique: gsUjN832PZmlDU302GXfzQ-1
X-Mimecast-MFC-AGG-ID: gsUjN832PZmlDU302GXfzQ_1774274615
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-439f5c57c52so123611f8f.1
        for <linux-tegra@vger.kernel.org>; Mon, 23 Mar 2026 07:03:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774274615; x=1774879415;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EmvoSlI6zhEDXgvnhN85AXx/F1wuELhxcozcM5H9OTc=;
        b=CL+WA5D6jwewXMC9SPyke0Q2CwTrZzyzJYik88Tfo2q/AIWvKgZ1a5RJy4rr1p308k
         +auLMYqKeai8Kzm9ncWOhQUeWNCnIGISPnChp9YpdCcTF9WqJs8w8IMwzygsxM62XMxw
         jmUym+enq4ol1HF6MTc3dckMO3Ff6oURTvz9OaPiGYkUBuXD5fNs4Nyow4DV69GxFi+i
         n1M7kSe52CVVkfEi8uAM6zeQ4m33DNl06rCSPQGoeMDT5LaydGs63oFW19zLQASIIMAJ
         VpRAvQqs4HVLkJ0dC/CVFVn27FOaFxPfzDyxC3jtMKI7XdZzdCfUc7LjMacDyvK2dgeb
         23Iw==
X-Forwarded-Encrypted: i=1; AJvYcCVFs+t4F8GFETo6f2VpzFfCRUB2xuITA1veMnF/OJ2sXiUBFJcJ04xbh2xdJT6/O2j4ziqv+GWoJryQIg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyjNZb6iaSE6rXV0kQiS2XOz6IP+/L/XDMgU3WsUO/iwBvQkCvL
	2Vcq8EQ8kEhjx89JTkQCCAt4Zh1otN+JgwtXUqq6ZTrp3aD1jxC/HrWfN8olnaRXRsyuGSdHffT
	4OyzsmjhPNvemUqIUZ0K+xLFaFZPrvZZ/ZSe6vgbk/+T3ZCrRaYqxUreHSsSYLvFe
X-Gm-Gg: ATEYQzzgpgdLV2Wuk9OPmX5Otc8YhkrS8IF3s+ov4T78x19IwxykSTvS7FCPJ3WIH9O
	yAeyUVFRQfM/zjwNbV1eqUQESqOZoFh600EqqyZ4YaBkjgqivS4i2Opa7KNUKBvd+s8k1e0NKNx
	IhTAm9h06omQ5JNo9SFlHs75q1lakRaBfo3dbXNe1adWs6KrYX0D6ZcBTYjX5Qqj4WWlXtqZtsD
	0bLQtq/OC5jCptRlIrlyqgcKHRnQm15/VtOb4GLOFoJtsLcUvdZqkhC4igbB3XEOxeQjmAGfcyT
	MHiBDAw6DRy2fSmTC4SkqUjVRpiZzT1lDdKRgd+o6qKOUty8WwDfZu+ZMVr8W/EXw3/ogqKgdYk
	6bJTyVnFlaNHbOmBU4XEnyzR8SpRJkO3FbaPy0Nm4McsGUBTsCN9M66fymRsHL2TIwfI9EQ==
X-Received: by 2002:a05:6000:26c4:b0:43b:4aba:8f35 with SMTP id ffacd0b85a97d-43b6424e48bmr18732382f8f.12.1774274615003;
        Mon, 23 Mar 2026 07:03:35 -0700 (PDT)
X-Received: by 2002:a05:6000:26c4:b0:43b:4aba:8f35 with SMTP id ffacd0b85a97d-43b6424e48bmr18732291f8f.12.1774274614356;
        Mon, 23 Mar 2026 07:03:34 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874? ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b64703c27sm29923424f8f.18.2026.03.23.07.03.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 07:03:33 -0700 (PDT)
Message-ID: <a3e212d4-78c6-49d0-982a-2baf9b0ddfd7@redhat.com>
Date: Mon, 23 Mar 2026 15:03:32 +0100
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: eric.auger@redhat.com
Subject: Re: [PATCH 2/2] iommu/tegra241-cmdqv: Update uAPI to clarify HYP_OWN
 requirement
Content-Language: en-US
To: Nicolin Chen <nicolinc@nvidia.com>, will@kernel.org,
 robin.murphy@arm.com, jgg@nvidia.com, kevin.tian@intel.com
Cc: joro@8bytes.org, linux-tegra@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 linux-kernel@vger.kernel.org, skolothumtho@nvidia.com
References: <cover.1773361875.git.nicolinc@nvidia.com>
 <9ef47d0db2d7b8207fef1ef4437de6efa08565b6.1773361875.git.nicolinc@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <9ef47d0db2d7b8207fef1ef4437de6efa08565b6.1773361875.git.nicolinc@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 3/13/26 1:36 AM, Nicolin Chen wrote:
> From hardware implementation perspective, a guest tegra241-cmdqv hardware
> is different than the host hardware:
>  - Host HW is backed by a VINTF (HYP_OWN=1)
>  - Guest HW is backed by a VINTF (HYP_OWN=0)
>
> The kernel driver has an implementation requirement of the HYP_OWN bit in
> the VM. So, VMM must follow that to allow the same copy of Linux to work.
>
> Add this requirement to the uAPI, which is currently missing.
>
> Fixes: 4dc0d12474f9 ("iommu/tegra241-cmdqv: Add user-space use support")
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric
> ---
>  include/uapi/linux/iommufd.h | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/include/uapi/linux/iommufd.h b/include/uapi/linux/iommufd.h
> index 1dafbc552d37d..f63edbe71d542 100644
> --- a/include/uapi/linux/iommufd.h
> +++ b/include/uapi/linux/iommufd.h
> @@ -1052,6 +1052,11 @@ struct iommu_fault_alloc {
>  enum iommu_viommu_type {
>  	IOMMU_VIOMMU_TYPE_DEFAULT = 0,
>  	IOMMU_VIOMMU_TYPE_ARM_SMMUV3 = 1,
> +	/*
> +	 * TEGRA241_CMDQV requirements (otherwise, VCMDQs will not work)
> +	 * - Kernel will allocate a VINTF (HYP_OWN=0) to back this VIOMMU. So,
> +	 *   VMM must wire the HYP_OWN bit to 0 in guest VINTF_CONFIG register
> +	 */
>  	IOMMU_VIOMMU_TYPE_TEGRA241_CMDQV = 2,
>  };
>  

