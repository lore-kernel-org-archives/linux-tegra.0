Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793872230;
	b=oHU6hzwZgO8cvYUvZndnP4lTocQTy2GN8O4/7RKFfxz08Am+gyTXfNB+Mn8CG2Gh5V9n
	 TjxeM3H0AtTyoNv8Oo4iQM89nzn0GGwGr166AfDwvK747qGMZsAV/Ihs1TAuVWmosN8P6
	 mueJmOeF3ceCdgRX46qBRiHE/JKhcMcrEvVHn3b9Ou/TWGgVWkcnoGeTKIayrYbX2dVGs
	 rcE8SaXdMO/QapCkUqy5asWtoC+s79u1Lgi2AWnX9DQddYyByYJ5n1E7NTGZ20ZvMRlss
	 AChfcfvhBRCntUejW2FS7VBE8QbAkC1LhBM6/Elnk4EZl0IecOs2cXl3k0jTmPEQmwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793872230;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=DMWp1cTHHReM1uqcRk49zD57d3z57Nj2NCMx/HooVRY=;
	b=3pYPSawgmQtbNRcSRx5dIt+sOdR4x2ZVhX3osj1HX7LQwW1O1bribqv1WpKYxanp6Nvd
	 wQGX1m6PaWT2PJhO2c+POnGBLYex7iNPF6jDfqQZiH67uH7bSQUzAIFnc+WbZrCV5yaE4
	 fsee/pNvbgJkOvbd7gdeql65b33lzViX7i88jGrXJ7mkAlupT7ixawZ0x7ya2HAUL0kqe
	 wxQY7mboml9zPtHgBm61kag55t60rPE1ajDRFxqobhoBJ59Ky01vAOeWPz5GysFcQdisP
	 uH4cFK/MVq/JK1hxZ1NxB7RtyYAiymc16vjb1MAjjx31oi0lRRVdhLvAmez/Jo/wD7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iyvErnbs;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D81F606A332;
	Thu,  5 Nov 2026 09:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iyvErnbs
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A1E51F000C1;
	Thu,  5 Nov 2026 09:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793872229;
	bh=DMWp1cTHHReM1uqcRk49zD57d3z57Nj2NCMx/HooVRY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iyvErnbs+HQFcXOr5n2Z/mXlquEtjyZppEj+fFdt+xFYou6He1NNW1QbulYpWJU3u
	 r4zIrPcvYitjN2yDyoODwvrWC1F2yhaK6zCPSeGG5EYMUFrXOLOJkbsVFwyLOGQrG/
	 70Ft1L3yQzm0npHAa+sTZwSvD3ax1Y0O0KsV8JjO0fg6dxXHA3U6Fpqri+g2e/knpw
	 bNFtjK4eeE6gePdbRgFkhGVY9ZQ7GKzZDAnRf37YYrmrGDH4sOI6i0G2uNp24Whlx1
	 ylU50vAXBo8o8f01t1Cma5isvOYUvqI/xdI1RfANqetO91SICu32AtL6irSRIYIVNe
	 LacqZpY78qgxA==
Date: Thu, 5 Nov 2026 09:50:26 +0000
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Aniruddha Rao <anrao@nvidia.com>
Cc: thierry.reding@kernel.org, jonathanh@nvidia.com,
	Sudeep Holla <sudeep.holla@kernel.org>, linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/5] firmware: tegra: bpmp: Add ACPI support
Message-ID: <20261105-fiery-gentle-pudu-e985dd@sudeepholla>
References: <20260929095915.2215685-1-anrao@nvidia.com>
 <20260929095915.2215685-3-anrao@nvidia.com>
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
In-Reply-To: <20260929095915.2215685-3-anrao@nvidia.com>

On Tue, Sep 29, 2026 at 09:59:12AM +0000, Aniruddha Rao wrote:
> Add required changes in the Tegra BPMP driver to make it compatible with
> ACPI-based platforms.
> 
> On ACPI systems, IPC is handled through an AML method instead of the
> kernel mailbox and IVC frameworks.
> 
> Clock, reset and power-domain providers are not controlled by the Linux
> BPMP driver on ACPI-based systems, so do not initialize them there.
> 

The above 2 statements are very clear and says this driver is not much
useful on ACPI systems which is good and aligns with the general
expectations.

> Keep transport initialization in the SoC-specific init operation. Use an
> optional init_providers operation for DT child and provider registration
> after BPMP communication has been established and the firmware tag has
> been read. ACPI platforms leave this operation unset.
> 

"ACPI platforms leave this operation unset" - I don't fully understand
what this means ? If it means we need to do something on ACPI systems,
why can't it be done by some boot firmware instead ?

> DT transports register an MRQ_PING handler for requests initiated by
> BPMP firmware. This request direction was used only by a diagnostic
> command in older firmware and is not provided by firmware on ACPI-based
> systems. The ACPI transport therefore does not register an incoming
> handler; its init operation only sends the outgoing MRQ_PING request used
> to verify communication with firmware.
> 

OK, I am more confused as you state more things are not needed on ACPI
systems. Why do we need to add any support for ACPI systems then? Can you
make it clear as what is needed on ACPI systems and why it needs to be
done by OSPM and not any boot firmware if it is just one time initialisation.

-- 
Regards,
Sudeep
