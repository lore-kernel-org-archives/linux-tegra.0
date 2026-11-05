Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793871052;
	b=ozLGHGG+aJRi8xstMQ9OwR/v87pnsKZh3chEpbGeSYJKWIAFJI08QUJovgyCTdp4unXX
	 oU2/B4Z26a4fpab5SqxPd5BDAnQ/79Ksv9fEgkvbeeKUZXDnWchZPHYbhjR1B/2fD9LaN
	 oi97J42WPvTufHCWaLpxrKeQbkCRJE6V5ZoJx5GdAwJU0rgVsg4rLhXmNvGfeObArFeTQ
	 Wg0kNBklBhZs22mJefgh7nJo18/hcAVW8MGVklFrmCJFeWzUweZ5ADukS81Za24VCZKaL
	 MF2c+nkZXZ11l7T/pPnHRq7sPooR+7xZ+7DyVThE2fL0BqHCWfQ4ZH+MECFF+TmPVYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793871052;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=I9JLPS56ZZVL6fhls448ofuLD4hZA1GtuHSD/NXbcJE=;
	b=iQH+tn69+l+CZheo46FVOKVVq9PbMVSE7fAEyfiFv3gvN0AJybicREOgNmd+uxI2CuqZ
	 xzW0QsilhPfJaQKfAFlOUDR2vf30P3eJp8NsBsrFCxSgBIjIgJrL7Pe6BsT3BHWhKkSFf
	 gsEDknkSVN3+fWRIZMHdrBPt04pkeDslf1G8tjEZbrKoq25/jJXD+nN7HJ1Z2h5+4Eq7y
	 p9lDnvhJB7Q9JjBbeHZ1duUrrXAsVUg0AhJrLLFNXbam6rE0O93QnId3PdzgAejIVp2Sa
	 PnvF9DrGPOXTHUk7mAqBMUBi9crUZiu3lOKTRBdaq/IHWqoj1ve5t3FysZdAaUWjZyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WncmyviE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A1F3606A329;
	Thu,  5 Nov 2026 09:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WncmyviE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C09091F00919;
	Thu,  5 Nov 2026 09:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793871052;
	bh=I9JLPS56ZZVL6fhls448ofuLD4hZA1GtuHSD/NXbcJE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WncmyviEWHkSPITkRDk3Drb4VW0DO0UyjP87ZDT+EOdSmmUG5x+bs9CEbmPZaGCCn
	 yXRw2HUtqtJGj7u90yEwwvuri3b0sQkQT1Rw2Mz7ueuBBEiu18EZIKCZODIqFbEdEn
	 tcYVCt/tFM0O9QXZyxiUaP6nDjhDCV72EJvRoFVXlfe9SvsIn0G+9UsDaP1OUwqLdB
	 eBxNN53qEqoAFr10ExNTwMGUG2vWruo7rhgJs/sIn8+rnuhZXR//6lt/iXPbaYlEqE
	 SBGgrI32IPtzkb/rtITzdey4eaG693LKzMZAWoRYmq0AU4+x5+ZBEtrnfsYRQQ66cz
	 ez5d8UdT6sdxQ==
Date: Thu, 5 Nov 2026 09:30:46 +0000
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	"Rafael J. Wysocki (Intel)" <rafael@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>, arm <arm@kernel.org>, soc@kernel.org,
	Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, Len Brown <lenb@kernel.org>,
	linux-acpi@vger.kernel.org,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Mika Westerberg <westeri@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	James Morse <james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>,
	Sizhe Liu <liusizhe5@huawei.com>
Subject: Re: [GIT PULL 4/7] firmware/tegra: Changes for v7.4-rc1
Message-ID: <20261105-inventive-partridge-of-maturity-793a2e@sudeepholla>
References: <20261003095924.1370238-1-thierry.reding@kernel.org>
 <20261003095924.1370238-4-thierry.reding@kernel.org>
 <928b3eaf-32da-43a9-9ca5-d59ef8a3b330@app.fastmail.com>
 <auslF5pwDHtcNoCy@orome>
 <bcad1d7e-387d-4251-8974-7f0dcd2f9734@app.fastmail.com>
 <autADOKsSVVMn6r9@orome>
 <CAJZ5v0iyaHGj2b7H8g0nqrxvz8GpXiE6hkVp9RM7KF+KDckjrA@mail.gmail.com>
 <autmcaraWcXIoRfZ@ashevche-desk.local>
 <20261104161125.00000523@oss.qualcomm.com>
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
In-Reply-To: <20261104161125.00000523@oss.qualcomm.com>

Hi all,

On Wed, Nov 04, 2026 at 04:11:25PM -0800, Jonathan Cameron wrote:
> 
> It is a bit of a guessing game to figure out who are the right people today
> when it comes to ACPI and both ARM and x86 platforms. 
> 
> They fall into a few categories and it depends on what you are trying to
> do.  Starting point is push back hard on your firmware folk wrt to shipping
> something random without an upstream discussion first.  You wouldn't expect
> that to work for dt, it shouldn't work for ACPI either. Features
> will get rejected if people try to just do something that works for them
> (same as a weird custom DT binding gets rejected).
> 
> 1) Basic stand alone driver stuff.  Mostly that's all pretty standard
>    and follow the specs where possible.  If there are gaps start asking
>    questions. Linux definitely  doesn't support all the stuff that has been
>    added to the spec in recent years.  So this covers things like register
>    addresses, interrupts etc.  All fine, hopefully a subsystem maintainer
>    can take a look and will have enough of any idea.  If not ping the folk
>    on this thread for help.  Things are a bit flexible for consumer type
>    devices where fixed and bodges are common, generally less so if it is
>    server grade hardware.
> 
> 2) Stuff that is an ACPI spec gap or place where we'd expect generalization.
>    There are several examples of this on list this week and a few more in
>    my inbox.  The particular series here might fall into this category.
>    I've not figured out enough of the details yet to say definitively.
> 

Nicely summarised or categorised Jonathan. Nothing much to add.

For most of the IP/devices/firmware associated with Arm, we are involved
in any specification work if there are any. However that doesn't include
3rd party IPs/devices used on Arm based platforms though.

> I'd also expect a driver using AML as the target interface to either
> point at a published spec doc, or to include some snippets
> of the AML - that can be a lot easier to read than the driver code
> (imagine reading DT by only looking at how drivers parse it).
> 

Ideally, it should be just HID that any vendor needs to publish unless
they make use of any custom methods or something device specific like
DSD/DSM. I would expect most of the devices to use standard methods and
properties that are already well defined in the ACPI spec.

> FWIW The driver feature in question looks like it is doing something a bit similar
> to the PCI trace and tune driver Hisilicon has (though IIRC that has
> a presence as a PCI driver) https://docs.kernel.org/trace/hisi-ptt.html
> or if you squint at it differently resctrl / mpam fb.
> 
> Given that has new ABI etc, I'd expect that to have gotten broader review
> as well.  Probably keeping it to linux-tegra and lkml alone wasn't
> going to result in anyone noticing!
> 
> https://lore.kernel.org/all/?q=20260929095915.2215685-1-anrao@nvidia.com
> 

Agreed, it shouldn't hurt to cc linux-acpi for such driver ACPI enablement
patches.

-- 
Regards,
Sudeep
