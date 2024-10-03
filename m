Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8BF419F422;
	Thu,  3 Oct 2024 14:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727967596; cv=none; b=NB3OxV6vODACGJmo+WG6CTxyJvKW420vmBnRVCsa/N71EjggFDuEhddC9wLdviEud80G7PsmLr/NLzohPHreFrJDS/VuFcAPGoEiJser8GvCuXsgyeHJPu0DxYR6r6CyvxhKJuTLuFoLi2A0cjzZ1jfq2fn8pxq9hhfwmFPalNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727967596; c=relaxed/simple;
	bh=y2nFRunD6qsR16xB1FZJfdkqaYElUKTx6AgCNCfteMI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PzdogVImJkUCtr1XdFn70YKfRQ6l/9+VNo7p9pkZ+42V75SGkJlw8hbZFWfC3p/0cj1eXMMbhqmyiLRed57PuuBASeyQdh0mE7/ixoLi0ugYhY97Jl+NQPc47WSqol8bxPIpT1P2OKTedb5BnOjbKkO5m/Qn8hVwMllp4zJvQeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=SXiElDFL; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="SXiElDFL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1727967592;
	bh=y2nFRunD6qsR16xB1FZJfdkqaYElUKTx6AgCNCfteMI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SXiElDFLeGfzf0fXLwOJ02F9XGCl80aXHtxV8714un98Frke9pV5GYNk7y3TSWkml
	 gfUHRx1O6tAZeMwXLjct6issQI4/KRAt032fwugtiW2xS7ha1o0t9vGRlNnSmmKbQW
	 0n9FZUMiucYnezdnH0EL1faLcJ8RaCR1cZdZ7BtDKoe15BT0qhPJ6o+jLcDuFjci20
	 lEI4QpcIzHlvgU/x2ZU19YmbGdnFoD+gz2a3E7QA6kToTG/3CIE9qDxQ4XFMRwoxOn
	 dzCHFSzMJ9qfADx8NAKuJF8zcEDs9u/x2sAin+n/fUMXEhM0btNG+pq8HswZC+xqNT
	 yBOQ99kqtZpHA==
Received: from notapiano (pool-100-2-116-133.nycmny.fios.verizon.net [100.2.116.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2C6FA17E3601;
	Thu,  3 Oct 2024 16:59:52 +0200 (CEST)
Date: Thu, 3 Oct 2024 10:59:50 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Saravana Kannan <saravanak@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH] driver core: Don't try to create links if they are not
 needed
Message-ID: <d9aadede-dfac-410a-b65b-e295c9a64951@notapiano>
References: <20240910130019.35081-1-jonathanh@nvidia.com>
 <2024091152-impound-salt-c748@gregkh>
 <d89c89f8-0036-44a4-8ffa-ea89ed576a9f@nvidia.com>
 <2024091627-online-favored-7a9f@gregkh>
 <b1b67db0-3b9c-4d96-a119-fe3fcf51b6e3@nvidia.com>
 <CAGETcx8E9FddpwMO4+oqeEc0RVMLbUOs2m+=B900xzrLvEkSXw@mail.gmail.com>
 <2c42677c-5e8e-4805-b6a5-0a5baa3e55b5@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2c42677c-5e8e-4805-b6a5-0a5baa3e55b5@nvidia.com>

On Thu, Oct 03, 2024 at 11:25:22AM +0100, Jon Hunter wrote:
> 
> On 02/10/2024 21:38, Saravana Kannan wrote:
> > On Wed, Oct 2, 2024 at 11:30 AM Jon Hunter <jonathanh@nvidia.com> wrote:
> > > 
> > > Hi Greg,
> > > 
> > > On 16/09/2024 18:49, Greg Kroah-Hartman wrote:
> > > > On Mon, Sep 16, 2024 at 03:50:34PM +0100, Jon Hunter wrote:
> > > > > 
> > > > > On 11/09/2024 15:32, Greg Kroah-Hartman wrote:
> > > > > > On Tue, Sep 10, 2024 at 02:00:19PM +0100, Jon Hunter wrote:
> > > > > > > The following error messages are observed on boot with the Tegra234
> > > > > > > Jetson AGX Orin board ...
> > > > > > > 
> > > > > > >     tegra-xusb-padctl 3520000.padctl: Failed to create device link (0x180)
> > > > > > >       with 1-0008
> > > > > > >     tegra-xusb-padctl 3520000.padctl: Failed to create device link (0x180)
> > > > > > >       with 1-0008
> > > > > > >     tegra-xusb-padctl 3520000.padctl: Failed to create device link (0x180)
> > > > > > >       with 1-0008
> > > > > > > 
> > > > > > > In the above case, device_link_add() intentionally returns NULL because
> > > > > > > these are SYNC_STATE_ONLY links and the device is already probed.
> > > > > > > Therefore, the above messages are not actually errors. Fix this by
> > > > > > > replicating the test from device_link_add() in the function
> > > > > > > fw_devlink_create_devlink() and don't call device_link_add() if there
> > > > > > > are no links to create.
> > > > > > > 
> > > > > > > Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> > > > > > 
> > > > > > What commit id does this fix?
> > > > > 
> > > > > 
> > > > > Hard to say exactly. The above error message was first added with commit
> > > > > 3fb16866b51d ("driver core: fw_devlink: Make cycle detection more robust")
> > > > > but at this time we did not have the support in place for Tegra234 USB. I am
> > > > > guessing we first started seeing this when I enabled support for the type-c
> > > > > controller in commit 16744314ee57 ("arm64: tegra: Populate USB Type-C
> > > > > Controller for Jetson AGX Orin"). I can confirm if that is helpful?
> > > > > 
> > > > 
> > > > That helps, I'll look at this after -rc1 is out, thanks!
> > > 
> > > 
> > > Let me know if there is anything else I can answer on this one.
> > 
> > Hi Jon,
> > 
> > See this.
> > https://lore.kernel.org/all/c622df86-0372-450e-b3dd-ab93cd051d6f@notapiano/
> > 
> > Ignore my point 1. My point 2 still stands. I got busy and forgot to
> > reply to Nícolas.
> > 
> > I'm fine with either one of your patches as long as we define a
> > "useless link" function and use it in all the places.
> 
> 
> Thanks! Yes I am also fine with Nicolas' fix too. I quite like the dev_dbg()
> in Nicolas' version. I was wondering if we should define a function for this
> check too.
> 
> Nicolas do you want to update your patch with a 'useless link' function? I
> will be happy to test on my side. Looks like you identified the exact patch
> that introduced this and have the appropriate fixes tag too.

Hi Jon,

I just sent a reply to that thread yesterday going a bit further down the rabbit
hole to try and answer if there's an underlying issue there that the log
messages are just exposing, but I still don't understand all the devlink details
involved so was hoping for some feedback from Saravana.

But if there's no feedback I can surely update the patch with the commonized
function to fix the immediate problem. I'll wait a couple days to give Saravana
(and others) some time to respond.

Thanks,
Nícolas
