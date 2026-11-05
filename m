Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793874209;
	b=mDw7r5uAuoGEreZk3ZFJqHNbTqkMh1bZRqtxDYnemWl1Wm8OA2WlfLX/X24un3Ul61f7
	 6T6gocpN05/gMEt89PJ6OlVNrSgse3M0Wt5R1FY2Y8/mumg8RxMcXyVEPXERHawYmq6d2
	 nqtYsnW3iSsRKYhb9kaggNfTT8skrqGisIiJWabPVmiscKrKbltRRq8GLhuo0XnOkftLt
	 s2Ri5s5+ZmXmt9JZ4gNupwtce/TdOsy2quS+je9IAE81eNkFFZ1nZXMWD6sUOIK/pGhrr
	 EASuzsLThYIrtkNua0zKRcRsIpaTPokcG4jp9QBkdZUU/my+O1zrE96EbEE34vFh6XQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793874209;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=EdnV/i4B0S0fh3g81bf4RkgqVZQyJPUIZHVCvawFMIg=;
	b=0sd/CoBQYR9g9DfeZpPgUFZYzW/c1ZJji+LqZ/V/acJjfl5mmUpXWf7hVc7+SaovNUmH
	 9JfCREupTcHlHVfePR+/yNmkxHq/IEEx5aATv2iAg8xCDKUIuUCm8p3FXprhdZhlxfbyA
	 XYpLkKKN4+CR9HCDHsAL1oT5Vvj0tNs9MNUNvlK9A4Ev9e3JxkCMWc8kqZxn1T2l9jUY8
	 lutRphg8HzP0UNPX/wpnNvHOVpu1s62QEP5aEwytUq7cbfSZ7qPS7btwgn2UV1jB0oJL6
	 D5FY+IZyVQTnqIsIrl5KQXJZEoM7W7pzA2TqIsNr00wEBw+FVmRrdceivDCR5cVIRTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WrMJ9jdV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92A0D606A326;
	Thu,  5 Nov 2026 10:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WrMJ9jdV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 369CA1F00A1B;
	Thu,  5 Nov 2026 10:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793874209;
	bh=EdnV/i4B0S0fh3g81bf4RkgqVZQyJPUIZHVCvawFMIg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WrMJ9jdVqMB/+klFKPsxQ8m9Q2qKNJQ3adCE8vFYfbB8tr1I9sCMmjMeKiFsoDP+c
	 jkyGE/XGllGI0hhhPsCFf6PSiNCRk9M5As0SNQ2S7wBUSGFM00ff+nLkrkOamSzw2z
	 A0NB72DU/XhVarz+wvVRKfXEwmHB+jcb8ey0j22y7WuAkaqnl20plErLAq1WgDfbII
	 ph1KfxNXJkWN3ksj9oLixwTKgoMhvXgAoEWk3c6uqqwjm3oP6FHvGCp0/te1/DTr4b
	 YaiIzx73dGgXfcTyuZamxewcAmxUAubZMNUIgaLp6xenLUpyOVAR8ySV1IJyijRCFT
	 Y9SUG0gPpE4mQ==
Date: Thu, 5 Nov 2026 10:23:24 +0000
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>, arm <arm@kernel.org>,
	soc@kernel.org, Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Mika Westerberg <westeri@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	James Morse <james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>,
	Sizhe Liu <liusizhe5@huawei.com>
Subject: Re: [GIT PULL 4/7] firmware/tegra: Changes for v7.4-rc1
Message-ID: <20261105-quizzical-wine-oryx-e6f91a@sudeepholla>
References: <20261003095924.1370238-4-thierry.reding@kernel.org>
 <928b3eaf-32da-43a9-9ca5-d59ef8a3b330@app.fastmail.com>
 <auslF5pwDHtcNoCy@orome>
 <bcad1d7e-387d-4251-8974-7f0dcd2f9734@app.fastmail.com>
 <autADOKsSVVMn6r9@orome>
 <CAJZ5v0iyaHGj2b7H8g0nqrxvz8GpXiE6hkVp9RM7KF+KDckjrA@mail.gmail.com>
 <autmcaraWcXIoRfZ@ashevche-desk.local>
 <20261104161125.00000523@oss.qualcomm.com>
 <20261105-inventive-partridge-of-maturity-793a2e@sudeepholla>
 <8f45711b-d415-4694-a47a-12d4b7427e0f@app.fastmail.com>
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8f45711b-d415-4694-a47a-12d4b7427e0f@app.fastmail.com>

On Thu, Nov 05, 2026 at 10:54:42AM +0100, Arnd Bergmann wrote:
> On Thu, Nov 5, 2026, at 10:30, Sudeep Holla wrote:
> > On Wed, Nov 04, 2026 at 04:11:25PM -0800, Jonathan Cameron wrote:
> 
> >> 1) Basic stand alone driver stuff.  Mostly that's all pretty standard
> >>    and follow the specs where possible.  If there are gaps start asking
> >>    questions. Linux definitely  doesn't support all the stuff that has been
> >>    added to the spec in recent years.  So this covers things like register
> >>    addresses, interrupts etc.  All fine, hopefully a subsystem maintainer
> >>    can take a look and will have enough of any idea.  If not ping the folk
> >>    on this thread for help.  Things are a bit flexible for consumer type
> >>    devices where fixed and bodges are common, generally less so if it is
> >>    server grade hardware.
> >> 
> >> 2) Stuff that is an ACPI spec gap or place where we'd expect generalization.
> >>    There are several examples of this on list this week and a few more in
> >>    my inbox.  The particular series here might fall into this category.
> >>    I've not figured out enough of the details yet to say definitively.
> >> 
> >
> > Nicely summarised or categorised Jonathan. Nothing much to add.
> 
> +1
> 
> >> I'd also expect a driver using AML as the target interface to either
> >> point at a published spec doc, or to include some snippets
> >> of the AML - that can be a lot easier to read than the driver code
> >> (imagine reading DT by only looking at how drivers parse it).
> >> 
> >
> > Ideally, it should be just HID that any vendor needs to publish unless
> > they make use of any custom methods or something device specific like
> > DSD/DSM. I would expect most of the devices to use standard methods and
> > properties that are already well defined in the ACPI spec.
> 
> >> Given that has new ABI etc, I'd expect that to have gotten broader review
> >> as well.  Probably keeping it to linux-tegra and lkml alone wasn't
> >> going to result in anyone noticing!
> >> 
> >> https://lore.kernel.org/all/?q=20260929095915.2215685-1-anrao@nvidia.com
> >> 
> >
> > Agreed, it shouldn't hurt to cc linux-acpi for such driver ACPI enablement
> > patches.
> 
> Is the "BMRQ" in
> https://lore.kernel.org/all/20260929095915.2215685-3-anrao@nvidia.com/
> a custom method then? 
> 

I’ve quickly reviewed the patch; it does implements a custom method BMRQ
rather than a standard or out-of-the-box solution. More details on this is
used based on my understanding below.

> How does this relate to the EC and PCC interfaces in ACPI systems?
> 

I am still evaluating how the BPMP driver is intended to operate on ACPI
systems. In the meantime, I share the same questions noted above. The current
commit message lists several driver features that may not be required for
ACPI, which has introduced some clarity issues regarding the intended design.

> In current mainline, I see that the bpmp driver is used on DT systems
> by the tegra specific cpufreq, memory and pci drivers, but I would
> expect that on ACPI those all use shared drivers. Are there any other
> users that are not already covered on ACPI?
> 

For ACPI systems, CPUFreq operates through CPPC via PCC, MEMIO, or
supported backends.

My understanding is that the BMRQ method is called by tegra_bpmp_transfer(),
which supports Tegra-specific drivers for power domains, clocks, resets,
I2C, PCIe, and memory. On ACPI, these can be abstracted through PCC
OpRegions as part of standard methods like _ON/_OFF or other device state
methods. Although device/memory DVFS is trickier since the ACPI
specification lacks standard methods for it today, the commit message
implies these components are largely unused on ACPI systems.

I have raised a query on the thread to clarify this.

-- 
Regards,
Sudeep
