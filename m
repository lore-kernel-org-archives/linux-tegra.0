Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53E5F10A18;
	Mon, 16 Sep 2024 18:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726512656; cv=none; b=n2g1NY1EX1l9r664WTbOECe+kKuX5+V97uMn+Q/41elEC1wYJfd8lwujpQgiDZ6awjvgmmSjUjbXEIsk5eWUXBWneAULMWMwYYMQVEW2VTsDLMTtrg4/WuCzPFaPL29B5AWCwLKMGMJtSt179clz+MUb4s73IPvkIIGX2Y6HGMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726512656; c=relaxed/simple;
	bh=O+mfiB1pmzz6ripwzHmYnZ8Q24RFf3pX8vmnQWQSX6M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L30Zbn1RFbU0HJ4svxckuC/pzA7SJmxYuCvvn5033OTHhmSZSvVMrPmEQFemtdSUVFY9ZdJ6ohICCr0KdSlTWRi//YVktG/r0W6z7TrydIJwPp4ma8lvb3uV23V991GiuFjaVRdjyX4PkSEKeGSFYusEkm4ssVa5rvU7spRF4k4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Lifo9BR2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Lifo9BR2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89B83C4CEC4;
	Mon, 16 Sep 2024 18:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1726512655;
	bh=O+mfiB1pmzz6ripwzHmYnZ8Q24RFf3pX8vmnQWQSX6M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Lifo9BR2epRRlEgGQOxvaycrYC9UX+GETfdD7D5x4WWdYGIf40TF5IqIeKd8bKlQs
	 UVEZ8v4cZxJ4R3CDEsgCuus0Id5qqaYyZMShLyMKOeTkvqr8B+Uv6aHTaAhaAD0iRs
	 zknIY81Y6tVbhNZSo2ktgWeJAu0y18e58kMUuZn4=
Date: Mon, 16 Sep 2024 19:49:44 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH] driver core: Don't try to create links if they are not
 needed
Message-ID: <2024091627-online-favored-7a9f@gregkh>
References: <20240910130019.35081-1-jonathanh@nvidia.com>
 <2024091152-impound-salt-c748@gregkh>
 <d89c89f8-0036-44a4-8ffa-ea89ed576a9f@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d89c89f8-0036-44a4-8ffa-ea89ed576a9f@nvidia.com>

On Mon, Sep 16, 2024 at 03:50:34PM +0100, Jon Hunter wrote:
> 
> On 11/09/2024 15:32, Greg Kroah-Hartman wrote:
> > On Tue, Sep 10, 2024 at 02:00:19PM +0100, Jon Hunter wrote:
> > > The following error messages are observed on boot with the Tegra234
> > > Jetson AGX Orin board ...
> > > 
> > >   tegra-xusb-padctl 3520000.padctl: Failed to create device link (0x180)
> > >     with 1-0008
> > >   tegra-xusb-padctl 3520000.padctl: Failed to create device link (0x180)
> > >     with 1-0008
> > >   tegra-xusb-padctl 3520000.padctl: Failed to create device link (0x180)
> > >     with 1-0008
> > > 
> > > In the above case, device_link_add() intentionally returns NULL because
> > > these are SYNC_STATE_ONLY links and the device is already probed.
> > > Therefore, the above messages are not actually errors. Fix this by
> > > replicating the test from device_link_add() in the function
> > > fw_devlink_create_devlink() and don't call device_link_add() if there
> > > are no links to create.
> > > 
> > > Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> > 
> > What commit id does this fix?
> 
> 
> Hard to say exactly. The above error message was first added with commit
> 3fb16866b51d ("driver core: fw_devlink: Make cycle detection more robust")
> but at this time we did not have the support in place for Tegra234 USB. I am
> guessing we first started seeing this when I enabled support for the type-c
> controller in commit 16744314ee57 ("arm64: tegra: Populate USB Type-C
> Controller for Jetson AGX Orin"). I can confirm if that is helpful?
> 

That helps, I'll look at this after -rc1 is out, thanks!

greg k-h
