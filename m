Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A6F31531E9;
	Sat, 31 Aug 2024 10:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725100233; cv=none; b=GdXWZYQNISThYyPNDrIYAMImowHsy5tDSfHYSjeISeaWZUM5B/Ko6AHmKBUVibOwqxSK5VCdFJS/uwR9GirpZji53rxd9/3xz2hKaOIv9Rpcr10xovKNe8RHFste45WoxvJxYqrE1lhbUTUsBIKRdBbsDQYzfa2aktqhd0IaKU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725100233; c=relaxed/simple;
	bh=6SWTTgTAzp6pqg4Vm4RZubkX3UCuusQwF+vJGG/x2vQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UvPkXUcCSJoaAMIAtXmxREHlp+YVPJyZ8+tKcNyHFzCMO4yhPfPSccv8K0KfVUO3hP4311+oO6uNEr4tD1ssPjVSAuWDX4gcPTW22ecJtlt8FBriH3lGMcJzAIGqbmKJLt6Ez0rCvak7mIRAfcbQOxYsoh4jUukIU6ZWbAYx120=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QEffq0MX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QEffq0MX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5E1FC4CEC0;
	Sat, 31 Aug 2024 10:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725100232;
	bh=6SWTTgTAzp6pqg4Vm4RZubkX3UCuusQwF+vJGG/x2vQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=QEffq0MXDsWJWK5sRvImQL8mf+7JPH7FqWXdrsgY3Cd7NXJR8fmTHMuusiYMGnyhC
	 MHZRnQPI2BQBNzCli8vVmgh+dEdC0uxBsz/fRD4SJemPO70j2WI5R14ofbm4VjUpqj
	 kjhuO/TmLT2Aem8eyujuJ1mvRbendpbr22r/NmZB8VHlPSpsUMXOsVwaG1aQ4wijVU
	 RybOdpY2DoFelEtVjQyRLTVrH9HyaFC1lbjOm1n7PKyWOTl8dYcRCY4yp8Qh8GHVki
	 ymaipbd5WA6OB41R7ckuL0rn3ouJJGPlz4pdjabaARYh6JkylN/XBqkaD8dQdf/vUx
	 XFfHdhi7Y3qYw==
Date: Sat, 31 Aug 2024 11:30:21 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: Kousik Sanagavarapu <five231003@gmail.com>, <andrew@lunn.ch>,
 <sebastian.hesselbarth@gmail.com>, <gregory.clement@bootlin.com>,
 <herve.codina@bootlin.com>, <qiang.zhao@nxp.com>,
 <christophe.leroy@csgroup.eu>, <thierry.reding@gmail.com>,
 <jonathanh@nvidia.com>, <nm@ti.com>, <ssantosh@kernel.org>,
 <petlozup@nvidia.com>, <pshete@nvidia.com>,
 <christophe.jaillet@wanadoo.fr>, <ulf.hansson@linaro.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linuxppc-dev@lists.ozlabs.org>, <linux-tegra@vger.kernel.org>,
 <krzk@kernel.org>, jonathan.cameron@huawei.com
Subject: Re: [PATCH -next 8/8] soc: ti: knav_qmss_queue: Simplify with
 scoped for each OF child loop
Message-ID: <20240831113021.08a9010a@jic23-huawei>
In-Reply-To: <598efadd-da27-0be3-6d1c-dee50e71c811@huawei.com>
References: <ZtCapIwWZolY7oMH@five231003>
	<598efadd-da27-0be3-6d1c-dee50e71c811@huawei.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 30 Aug 2024 11:24:14 +0800
Jinjie Ruan <ruanjinjie@huawei.com> wrote:

> On 2024/8/29 23:58, Kousik Sanagavarapu wrote:
> > Jinjie Ruan <ruanjinjie@huawei.com> writes:  
> >> @@ -1080,17 +1080,13 @@ static int knav_queue_setup_regions(struct knav_device *kdev,
> >>  {
> >>  	struct device *dev = kdev->dev;
> >>  	struct knav_region *region;
> >> -	struct device_node *child;
> >>  	u32 temp[2];
> >>  	int ret;
> >>  
> >> -	for_each_child_of_node(regions, child) {
> >> +	for_each_child_of_node_scoped(regions, child) {  
> > 
> > Are you sure using *_scoped() is better here?  Since it seems that we
> > need the memory pointed to by "child" in cases where we don't go into an
> > error path.  
> 
> Hi, Jonathan, could you help review this code?

I don't understand the review comment.
The reference counting before and after this patch is the same, just
with the error path handled in a simpler fashion and the scope of
the child variable reduced.


> 
> >   
> >>  		region = devm_kzalloc(dev, sizeof(*region), GFP_KERNEL);
> >> -		if (!region) {
> >> -			of_node_put(child);
> >> -			dev_err(dev, "out of memory allocating region\n");
> >> -			return -ENOMEM;
> >> -		}
> >> +		if (!region)
> >> +			return dev_err_probe(dev, -ENOMEM, "out of memory allocating region\n");
> >>  
> >>  		region->name = knav_queue_find_name(child);
> >>  		of_property_read_u32(child, "id", &region->id);  
> > 
> > Similarly in most of the other cases in this series where a similar
> > change is done.
> > 
> > Also FYI, as for dev_err_probe(), I think I covered all of them in this
> > file and a patch for it is currently sitting in ti-drivers-soc-next.
> > 
> > Thanks  

