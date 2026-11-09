Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794250144;
	b=hONKoIcFsb7JMg4fACDwIMB6ucySt4N9ZkeO8mY4Kn94/qtRnWZuPHHQmRo9hHcDGGrw
	 JBh86r/8Q7w7/i/f44Bujxx47pIYojsm4jlR964dcXhHC2Rf6VpCp7hiawZ86CsmsLZV4
	 p5wIVF/cpIjsvzivv0In1WsBmLhncnDjfLlrLA4we5XQvmXlQQys20YQFrdVGLbvBD7R+
	 cejULr4xJ+bTuQe0n/5h3YOV6w1aepujXrBrosT7LYlTqdDPPTV4cNNkv2RSAeq/JR8wo
	 33QHTLmZmS3JoUCc2EJ8KJAIHItOUvMU/iyeGkDtTVOTQ4ot4Qkx0Ubfl/QfIywYuAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794250144;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=O+PQWQ9PbJFOCn9EB5efiBTAKX4GJUUBrxAtO9OF3Dc=;
	b=bjDdhsc9U4R/loslgPE/ctFNwe2jYw/RvjckXpXBvzkCXAvzWbc2q0xwePq1KXDXBPTn
	 +UJWHAw6fE8ae2yaf1QWb3yW/7zPNDqPT0P/qMcPZBSzzf4O4cOLz7uynvhbvH8y8pnYz
	 9ZAOdO2sY5ofk5wvO0ZRyDYSOjmpRwmZKjv2NIWFOzvgFV6LinaOq5qJq5mesGeISoBMU
	 j/9/0a1pXNOlkei3yTj8EAwix025BzuyrhR7TA3MO+PsUwF/vDoJQo/kUdJlib9Qe2ynY
	 4PjWjtZLtU5T+DA2ORt6LbpmVkh5zSj0jCLinPMwtxOhROR4oBNsV3VDP0YN/q1Comw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=PuTYdyOK;
	arc=none smtp.remote-ip=209.85.160.181
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20CA6606A330
	for <linux-tegra@vger.kernel.org>; Mon,  9 Nov 2026 18:49:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20CA6606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=PuTYdyOK
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-536c8f958d7so9490511cf.1
        for <linux-tegra@vger.kernel.org>; Mon, 09 Nov 2026 10:49:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1794250143; x=1794854943; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=O+PQWQ9PbJFOCn9EB5efiBTAKX4GJUUBrxAtO9OF3Dc=;
        b=PuTYdyOKu7rUl19nMbVLJ6he+g7v6e//cAur3W6t4momB8sYNUVcG6lgvYQzXWRQd2
         wePZJZy5/Izh8q/jhlELM4Aipu2Kq5puT9fASJ7I8RXck/tzsZK36x2w1kVB5L3uvFRk
         yCZ8eBzX92sdtZMINMf4iRP4iSymdt3sV7+lf2q+Dsmme4JB4gladVLELQlWGhTX5UO8
         5gjS4JxeWLhg0KwGwZu9rV52lCtsH+msY+e7JnZinD7YQ8GhOWkxw69O2Z8OZoKSY78S
         rg/ompvsongIANmOMkI5ZtERdMKe9Hsz2Yso7Bgyp2VgeTgP3bwtobBH8NpvH4k6adr8
         N8TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794250143; x=1794854943;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O+PQWQ9PbJFOCn9EB5efiBTAKX4GJUUBrxAtO9OF3Dc=;
        b=srK1Xvkw5cWX5wmc8xtVbfpU3yDkN8+XqmGJpNQ4OaO6F1MJo0OOp2pA6D6oSI9XRi
         8E2vGUr70DVTwtGF3Jvihe0OCkDui31PaCDZBoa/WFIVOODE354rXY9tePIkkk6tv8Bm
         NK4poqaVsMtQvg/gMJzx+x2At/y4+rGqK/WloBy2iZlF7OWfwiJvSDqdvV040iY+oCLO
         xxRSS+LsBv0ShUm0Hf6dOqVIbQ6zuntDrxmK030SCQ9jdKNt1g/49XsXw5PbESYMW/ZS
         1+40aj070JvW57VxZvyzL9MMzAnPKEi3oTN7KD5JpI9QFZxRPXrMXfoUfR75Z/agh/B5
         ReRw==
X-Forwarded-Encrypted: i=1; AL+hErH5TkOlcyl1YCMNSw4c99SMCidajSJ/r8xnSKPZYH0P2JIxfN/dpgasrNc23TSdZ0k0JK8rPap/xsfbQg==@vger.kernel.org
X-Gm-Message-State: APuU4Z8z40Yq0AOoItSkKJphPfH2jSpC1O7WeShpFeOiyHtw8OgnLBlR
	sOktCBVulY2sDOMeplaZIASLP7uluyswYvQq3BHNItZ4nriAndoDN6VsdwJ3Q8DqUBU=
X-Gm-Gg: AYBFou1X9egx99sf8l2Y02EdCO14ZouRgdQCQklQLKi30Z3BSJHgSa916F8OtsltQSA
	FWvPv3znFI7EmXLgtbWGGDXEPMY/1QxuYsxDhOCpU2WQkqpFNfabb5rrVlS0UUCqkoX+a7yYaha
	yVJwaPGVPp0jz5j2E0C6QWj/VpjrVexwQTUUww3meAzkrqB96rC4+NzgtOzRd9reyULGBE9uCbO
	vl9T6gDihGJT2qx2IoU0g0PYMP4H8r7l/CyNLyLBtR6wzhNzP5QEs1Upn3Z9TbpbMOA4PBvuzC3
	KdLyu2OqhkO2ABzYJZqfZKj8gKrnuwnOfj8jtSLdASRgzjRYHtE4JnJ39+mLQ+5JC2Gy0iVHXeH
	QpNyskZS2eYSubncoiSWZngO95XhQ/dtixMcFaEdQ4iXBcNeslhLYZO7SUCZSKLykTLQCwU9aoI
	M9n161ItfDuZWdFI0Qtk9wBt7T8cgjtgJQFxm50T/Rsy31zfei9CGn4mr9IxJwcpDpI03LWQnnu
	xlUZIYU7Wc5ncXoUjLOh/jYY0E7Aaah9bD4iN//GMKeyf4SJY0jA5VlHmsLf1Z/auQBI6Lc8uTF
	kF27NfTNdaZxAhYJvShaKe8qpOky5KMSM6L21Kg4fCkU/NsB+xhjh8GDjLYt0Qz4uYd3W2+UMTY
	e3OSbEwNS3nQ7DTYAz8OLTXYej/JVfi0=
X-Received: by 2002:a05:622a:40e:b0:536:3600:f0af with SMTP id d75a77b69052e-555253df92fmr3996711cf.7.1794250142846;
        Mon, 09 Nov 2026 10:49:02 -0800 (PST)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5550af60493sm3967801cf.4.2026.11.09.10.49.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 10:49:02 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xQUQP-00000002A6b-35np;
	Mon, 09 Nov 2026 14:49:01 -0400
Date: Mon, 9 Nov 2026 14:49:01 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Tian, Kevin" <kevin.tian@intel.com>
Cc: Jacob Pan <jacob.pan@linux.microsoft.com>,
	"Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	"iommu@lists.linux.dev" <iommu@lists.linux.dev>,
	Alex Williamson <alex@shazbot.org>,
	Alexey Kardashevskiy <aik@amd.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Joerg Roedel <joro@8bytes.org>, Jonathan Cameron <jic23@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Krishna Reddy <vdumpa@nvidia.com>, Lukas Wunner <lukas@wunner.de>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Samuel Ortiz <sameo@rivosinc.com>,
	Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
	Steven Price <steven.price@arm.com>,
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Vasant Hegde <vasant.hegde@amd.com>, Will Deacon <will@kernel.org>,
	Xu Yilun <yilun.xu@linux.intel.com>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH v8 12/15] iommufd/viommu: Allow PCI TSM backends to
 provide vIOMMU operations
Message-ID: <20261109184901.GQ663069@ziepe.ca>
References: <20261104161632.3547423-1-aneesh.kumar@kernel.org>
 <20261104161632.3547423-13-aneesh.kumar@kernel.org>
 <20261104152351.00002565@linux.microsoft.com>
 <20261105004934.GE3889730@ziepe.ca>
 <20261105091622.00004a9c@linux.microsoft.com>
 <CO1PR11MB48352506BB91C461F25147098C762@CO1PR11MB4835.namprd11.prod.outlook.com>
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CO1PR11MB48352506BB91C461F25147098C762@CO1PR11MB4835.namprd11.prod.outlook.com>

On Fri, Nov 06, 2026 at 08:03:48AM +0000, Tian, Kevin wrote:
> > From: Jacob Pan <jacob.pan@linux.microsoft.com>
> > Sent: Friday, November 6, 2026 1:16 AM
> > 
> > Hi Jason,
> > 
> > On Wed, 4 Nov 2026 20:49:34 -0400
> > Jason Gunthorpe <jgg@ziepe.ca> wrote:
> > 
> > > On Wed, Nov 04, 2026 at 03:23:51PM -0800, Jacob Pan wrote:
> > >
> > > > I am thinking MSHV/pKVM can register an assignment-only tsm_dev to
> > > > leverage this? Could PCI/TSM support this role without
> > > > device-security?
> > >
> > > It is certainly not what TSM was originally imagined for, but with our
> > > new arrangement, yah maybe so?
> > I will rebase on this set and send out patches for a detailed review.
> > 
> > > TSM basically just becomes this weird overlay driver on the PCI device
> > > that does stuff. Some of the stuff it might do:
> > >  - Register an attestation subsystem device to do SPDM
> > >  - Register to allow iommufd to create a viommu
> > >  - Some status sysfs ?
> > >  - ??
> > >
> > So we may expand pci tsm to have more than one role? currently it has
> > one.
> > int pci_tsm_register(struct tsm_dev *tsm_dev) {
> > ...
> > 	roles = is_link_tsm(tsm_dev) + is_devsec_tsm(tsm_dev) +
> > 		is_assignment_tsm(tsm_dev);
> > 	if (roles != 1)
> > 		return -EINVAL;
> 
> Not sure what'd be a proper name for this, but it sounds to me that
> it tries to over-abstract something into tsm. The reused logic related
> to assignment or viommu is relatively small, so the other option below
> sounds better if it can work.
> 
> Or it may be the original provider framework that Aneesh proposed,
> so tsm/MSHV/pKVM can each register its own backend...

That is definately undesirable for TSM

I think the very best answer for this is to get the viommu from the
"kvm" fd, I just don't quite know how you implement it..

Maybe just register something like a notifier chain where the struct
file * and the viommu type value goes in and a viommu object comes
back out?

Jason
