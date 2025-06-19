Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26765221700
	for <linux-tegra@vger.kernel.org>; Thu, 19 Jun 2025 09:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750326565; cv=none; b=I7VV53tBNyUseaEJ1zmWgX4y7mFJpWxdhdyloqqzc1630ythBVNZEaMSMPvEa0lFICOwRHPieS2yyYH0iRU3siJmdBBKJVLj0F91e29rbCgjQ7zaRmHV0SmPNpHZ36RLctutXCOyWHkW0MkRk/lXiGZcM+qjz+6XzPTDkKJ1R84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750326565; c=relaxed/simple;
	bh=3LkyeQl0t9LM+cj52xpO+Ax9lI0k6dCYkCdTOXS+hWU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q7C2OBZA+k9Lar2EslzUEgHbi402qmXXwyAVs7WYC5MbF23VrsrQZCqT/vWfHpDWrFGHDCwgjN6xK76PHT/qLNSMyqKT1IzW0L49Hsw9BuBsf8mP5ek48R/+utuHysElID6Sk629YFNxixV92dSWFH+n7pQZt+FspZxzzwpH0uM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PQuxVCDT; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PQuxVCDT"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2348ac8e0b4so111165ad.1
        for <linux-tegra@vger.kernel.org>; Thu, 19 Jun 2025 02:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750326562; x=1750931362; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=17oxjeeFsHFeG65L770MNpFPAUdse/NuAwqFBcFBF84=;
        b=PQuxVCDTgWhORmrR+ZAqjQ151mrOTPmBYrhmS4vovM/Nv9PEbDz5t34HHCFxijI9mm
         AoMwwDmkKo7sRjAXRm+uY3T2oYCPYKgFcSinlh8ag8XezsLHtXaU4ROr172WILE2I2nh
         ojyGe5tOmRmNybjbv4b4fgAPKZmUyHZ+fdvxRxA3nV/IFiiChxuqEtta02niY+Yb5SFD
         gRXS7ufjGxEeqozweC/UNHMlOneORaNGmao7JGAXogXkL98bHE5d6d4UN1590tWvtyKy
         aK6+/3lGwzf5Rg3tqr3pSxypnkcKFixHGe6YdvqF0jl1c/IS71kwp+TGLb/j3tZoqcNV
         YQgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750326562; x=1750931362;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=17oxjeeFsHFeG65L770MNpFPAUdse/NuAwqFBcFBF84=;
        b=idWfAlgUMKrp/SaNYLEIgTSIT0at9gORWuVpCn5hMovA/pw1avXdH0n8xf/vUpwmvW
         KrnleFm/0debnOAIPT4DhUy3MYeF7hshCp5JbodxkOs4wMswO0rL5OWWLx8bVN5YUpZ5
         PEN8jEKf0AOQ7dSqwEfxeCeEBJahR0TDS4eOUTaGk3GMoYxc4wTxeRKy9t7hUDK8rL7q
         p+MfFKMAxVomeZVcEtKmdQ+RK8W0l20bbVW+yo4yWNrxPxea5WEDvRSlHJ7bwCh1z0FX
         FovXCvfpZBYZA72h6Hv6jRURwCx82r9SiiCKvfT1fXbiG2MXXpxAi5wAzjEVsmfH3ssa
         vXDw==
X-Forwarded-Encrypted: i=1; AJvYcCWtZwHdRnENTV39DFQ9KGm27RBRjaDraMXCoSsIqJglXF2psjZ33GxU979nVBI5ydBC5+Llr3pcbAvBRQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwT65S8sP+3UHpqQ1IO9FyABGgIZi29Yjh0nrX15F5hefbS/T+l
	BninTyyRCrtFI7CT3E9oVdL5iBj+DVR4dAwDrB/QVQ0+oT3h11Wxgjv7ChCnd7D1yA==
X-Gm-Gg: ASbGncs0OdxazjvvY/GM1nNou9Z7YUU6KafVdA1IQhPSGkzSiEXLAiwYNIBKGoNqg8M
	EzNdaOO18VN4XbOyq07f8hL9BcnUYCxA25Ry/dhk3Orb7iw0zQawWwBKczK/OYmhAuuNEA7k2xe
	aSrvNLmOaHdB/ZFOhFzhzYALbJbHnnu2U6qzeJ5weGQZDLa2rDQc7n2fKl6cZJ9uUXGWJSnPXgP
	f7SQdbartd9nRgngI8C5mZYv13a6Bblf5eMR39hvJ4DvwKl3gbJgv0zJ1ehDu7HVsrwnVkqpHw5
	H04e+N4xx/gU8teDChFyp4wqGqndaWHbwwYtMAbWFgG4xrRoTZY+/Uk+M7+awCXZ9m3ICVn4tHO
	tmW0GWqLBr32R/RFCPPoX
X-Google-Smtp-Source: AGHT+IEuCYASVN8j1eZMJIcAvoBEAqstpKSSgGIYZ2iYQuSQhTyrI+a8+/330LWZVAAW9AYW4syqlA==
X-Received: by 2002:a17:902:fc46:b0:234:bcd0:3d6f with SMTP id d9443c01a7336-237cdfe9619mr1746815ad.1.1750326562236;
        Thu, 19 Jun 2025 02:49:22 -0700 (PDT)
Received: from google.com (232.98.126.34.bc.googleusercontent.com. [34.126.98.232])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365deb04a6sm116435595ad.178.2025.06.19.02.49.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 02:49:21 -0700 (PDT)
Date: Thu, 19 Jun 2025 09:49:10 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>, kevin.tian@intel.com, corbet@lwn.net,
	will@kernel.org, bagasdotme@gmail.com, robin.murphy@arm.com,
	joro@8bytes.org, thierry.reding@gmail.com, vdumpa@nvidia.com,
	jonathanh@nvidia.com, shuah@kernel.org, jsnitsel@redhat.com,
	nathan@kernel.org, peterz@infradead.org, yi.l.liu@intel.com,
	mshavit@google.com, zhangzekun11@huawei.com, iommu@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
	linux-kselftest@vger.kernel.org, patches@lists.linux.dev,
	mochs@nvidia.com, alok.a.tiwari@oracle.com, vasant.hegde@amd.com,
	dwmw2@infradead.org, baolu.lu@linux.intel.com
Subject: Re: [PATCH v6 07/25] iommufd/access: Add internal APIs for HW queue
 to use
Message-ID: <aFPdFnKvus57cGOU@google.com>
References: <cover.1749884998.git.nicolinc@nvidia.com>
 <64145b184a0fa7c9b60532c9b475a51625edb77c.1749884998.git.nicolinc@nvidia.com>
 <20250616133719.GC1174925@nvidia.com>
 <aFDSNYOTToFSbFA2@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aFDSNYOTToFSbFA2@nvidia.com>

On Mon, Jun 16, 2025 at 07:25:57PM -0700, Nicolin Chen wrote:
> On Mon, Jun 16, 2025 at 10:37:19AM -0300, Jason Gunthorpe wrote:
> > On Sat, Jun 14, 2025 at 12:14:32AM -0700, Nicolin Chen wrote:
> > > Now, access->ops can be NULL, to support an internal use case for the new
> > > HW queue object. Since an access object in this case will be allocated by
> > > an inernal iommufd object, the refcount on the ictx should be skipped, so
> > > as not to deadlock the release of the ictx as it would otherwise wait for
> > > the release of the access first during the release of the internal object
> > > that could wait for the release of ictx:
> > >     ictx --releases--> hw_queue --releases--> access
> > >       ^                                         |
> > >       |_________________releases________________v
> > > 
> > > Add a set of lightweight internal APIs to unlink access and ictx:
> > >     ictx --releases--> hw_queue --releases--> access
> > > 
> > > Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> > > ---
> > >  drivers/iommu/iommufd/iommufd_private.h |  8 ++++
> > >  drivers/iommu/iommufd/device.c          | 59 +++++++++++++++++++++----
> > >  2 files changed, 58 insertions(+), 9 deletions(-)
> > > 
> > > diff --git a/drivers/iommu/iommufd/iommufd_private.h b/drivers/iommu/iommufd/iommufd_private.h
> > > index 4a375a8c9216..468717d5e5bc 100644
> > > --- a/drivers/iommu/iommufd/iommufd_private.h
> > > +++ b/drivers/iommu/iommufd/iommufd_private.h
> > > @@ -484,6 +484,14 @@ void iopt_remove_access(struct io_pagetable *iopt,
> > >  			struct iommufd_access *access, u32 iopt_access_list_id);
> > >  void iommufd_access_destroy_object(struct iommufd_object *obj);
> > >  
> > > +/* iommufd_access for internal use */
> > > +struct iommufd_access *iommufd_access_create_internal(struct iommufd_ctx *ictx);
> > > +#define iommufd_access_destroy_internal(ictx, access) \
> > > +	iommufd_object_destroy_user(ictx, &(access)->obj)
> > 
> > Use a static inline please
> > 
> > > +int iommufd_access_attach_internal(struct iommufd_access *access,
> > > +				   struct iommufd_ioas *ioas);
> > > +#define iommufd_access_detach_internal(access) iommufd_access_detach(access)
> > 
> > 
> > >  struct iommufd_eventq {
> > >  	struct iommufd_object obj;
> > >  	struct iommufd_ctx *ictx;
> > > diff --git a/drivers/iommu/iommufd/device.c b/drivers/iommu/iommufd/device.c
> > > index 9293722b9cff..ad33f1e41a24 100644
> > > --- a/drivers/iommu/iommufd/device.c
> > > +++ b/drivers/iommu/iommufd/device.c
> > > @@ -1084,7 +1084,39 @@ void iommufd_access_destroy_object(struct iommufd_object *obj)
> > >  	if (access->ioas)
> > >  		WARN_ON(iommufd_access_change_ioas(access, NULL));
> > >  	mutex_unlock(&access->ioas_lock);
> > > -	iommufd_ctx_put(access->ictx);
> > > +	if (access->ops)
> > > +		iommufd_ctx_put(access->ictx);
> > 
> > I was hoping we could null the ictx to signal internal? That didn't
> > work out?
> 
> access->ictx should be NULL for internal. It should have been:
> +	if (access->ictx)
> +		iommufd_ctx_put(access->ictx);
> 

Ohh sorry, just saw this. +1, I too believe this is better than relying
on access->ops being NULL.

> > I would at least add a comment here this is filtering internal that
> > doesn't have ictx. Maybe a little inline 'iommufd_access_is_internal'
> > is appropriate. We'll be sad down the road if we need ops for
> > internal.
> 
> Yea, an inline will be cleaner. Will add that.
> 

Ack.

Thanks,
Praan
