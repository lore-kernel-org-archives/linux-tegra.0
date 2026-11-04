Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793812088;
	b=Jqhzm6pc7afzgp6EMj09e7H84NIasioHhXCDLKA1APdMlqve6sNqcWe1Kulyvwoihe1H
	 PpPWHarhJQL+a/OTvAv/s82EYlxg0h0PQXnG0xKTYM/KYVq428oninTrLPxuToaKYjwO9
	 8Z11u3syIy8apc6Y8IK5Phnph4qymDW2JpR47YULuDuptZ8OOy4XMivKbj+uMWpzZlfyj
	 ENV35f+1tKWxuIh2WalmT8VcdMXsKsEm4fk1jbn6jaQ+owbFKjYJFB23m7l3ZL5E8UdYU
	 tZb5NwXg32Es/615eUXcWxfsqTL2G1Y6E5R2rKrZPoF40kkCN1/5Lk7qpuuqZvDh2RQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793812088;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 Organization;
	bh=HM1X62uqqSW8+dQdfDbaF9vMh4Xi6tzQU0GrJjMKdtg=;
	b=ZX6ZzipgzOELB0xD2M0yOE0uvxop26e9/LTxxLT2dk0hX1E5uUiGwV6l8BQD9ZSu1LkN
	 J6uT/aMZd7icSt7MBiFdRoqwLM68S8jg0vLRpNe9+KQj8U3eqwId8aqDN8qE45cvCXxjn
	 cwEzfDJkU5UXFp6Lp4/4/U0m1I5xDVrvzybdQOQVuDLeRoXC+2rAeQ5V5HoZb5dLO5Mw/
	 4vHSbySly/eqM/IgdYig9TgVDb7qz4ekQZBHUjPI3arfGibUSXuF9NMXvZhrSdXhjmeTT
	 TD/tuxEjEaeM2S8cMeMMNFCq/zzPlExs83mnasXbY6wBWn8gdH+kV18/eu/gOz1Kg9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YvTm5R0s;
	arc=none smtp.remote-ip=192.198.163.11
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90F89606A31B;
	Wed,  4 Nov 2026 17:08:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90F89606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YvTm5R0s
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793812088; x=1825348088;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=ft8VhpNUkwAoJ7C9+JE583msFXwVNKOM2x9mwVzGgq4=;
  b=YvTm5R0snyRyUa0/zKz4x+hZp2SuKFh8UigZycDNenL1viGBmk7/xcDp
   1Fy9MqEozFP3l35dAyyEs/b/dM/uRIIqYAxr818fwWqpoiR6wXxvNnYOj
   Q4abgHHjJ5BfeT7PY3SK7P9CKWrG3/DqB5O1NhqrinUOK/Y2Ro6yTLJLH
   DQm19zHT03jFc5vVCzKxtgeX/y9m5Oqnz/qVNpy+6AUZO24m8yA/nyM1i
   bEHJcUL5wZJ4ZRwKcoQ5eSSjSCty99/b7A9pMYH6rbIZE6l9zv46OuECM
   TYgoKGXhwGsdNUspYq8DbR82bgAIH/EwaahCvpO4O6vxaeLTP4Mi5z/Ek
   g==;
X-CSE-ConnectionGUID: MIwE9zsJRKejEmMSafZJuw==
X-CSE-MsgGUID: q/w64WIjT2KpcI4Fz1ACyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2483178"
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="2483178"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 09:08:07 -0800
X-CSE-ConnectionGUID: hp/hoIyeSCK3mj/fpTGilw==
X-CSE-MsgGUID: npWrMFopRXuq3g6GQJvZnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="6781883"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.24])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 09:08:03 -0800
Date: Wed, 4 Nov 2026 19:08:01 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Cc: Thierry Reding <thierry.reding@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>, arm <arm@kernel.org>, soc@kernel.org,
	Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, Len Brown <lenb@kernel.org>,
	linux-acpi@vger.kernel.org,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Hans de Goede <hansg@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Mika Westerberg <westeri@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: Re: [GIT PULL 4/7] firmware/tegra: Changes for v7.4-rc1
Message-ID: <autmcaraWcXIoRfZ@ashevche-desk.local>
References: <20261003095924.1370238-1-thierry.reding@kernel.org>
 <20261003095924.1370238-4-thierry.reding@kernel.org>
 <928b3eaf-32da-43a9-9ca5-d59ef8a3b330@app.fastmail.com>
 <auslF5pwDHtcNoCy@orome>
 <bcad1d7e-387d-4251-8974-7f0dcd2f9734@app.fastmail.com>
 <autADOKsSVVMn6r9@orome>
 <CAJZ5v0iyaHGj2b7H8g0nqrxvz8GpXiE6hkVp9RM7KF+KDckjrA@mail.gmail.com>
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
In-Reply-To: <CAJZ5v0iyaHGj2b7H8g0nqrxvz8GpXiE6hkVp9RM7KF+KDckjrA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Nov 04, 2026 at 05:28:18PM +0100, Rafael J. Wysocki (Intel) wrote:
> On Wed, Nov 4, 2026 at 3:41 PM Thierry Reding <thierry.reding@kernel.org> wrote:
> > On Wed, Nov 04, 2026 at 03:11:09PM +0100, Arnd Bergmann wrote:
> > > On Wed, Nov 4, 2026, at 13:42, Thierry Reding wrote:
> > > > On Tue, Oct 13, 2026 at 07:22:23PM +0200, Arnd Bergmann wrote:
> > > >> On Sat, Oct 3, 2026, at 11:59, Thierry Reding wrote:
> > > >>
> > > >> Where is the ACPI binding documentation for this driver, and who is
> > > >> responsible for reviewing it?
> > > >
> > > > Sorry for the late reply, this fell through the cracks.
> > > >
> > > > Admittedly there's not much of a formal process here at all. Anything
> > > > I've received up to now seemed to be fairly straightforward support
> > > > extensions like this where the ACPI tables basically provide the same
> > > > information as the DT via standard resources like register ranges.
> > > >
> > > > I suppose for anything beyond this, we'll want better documentation and
> > > > broader review.
> > > >
> > > > Is there anything in particular that you're looking for? Should I guide
> > > > people internally to always Cc linux-acpi for anything that concerns
> > > > ACPI?
> > >
> > > I don't know, I'm also still learning about how this is done, I
> > > was hoping that there was already an established way.
> >
> > Yeah, me too. Maybe Rafael and Len can provide some guidance here.
> 
> I cannot speak for Len, and he has not been actively involved in the
> maintenance of ACPI support in the kernel for several years.
> 
> As far as I'm concerned, the code maintained by me is mostly located
> in drivers/acpi/ (as per the relevant MAINTAINERS entries) and it is
> mostly generic code related to ACPI support.  I generally don't
> maintain device drivers using ACPI support except for the ones under
> drivers/acpi/ which mostly bind to devices representing interfaces
> defined in the ACPI specification (which is kind of a special case).
> 
> But there is more.  There is ACPI support code in other places (like
> for instance gpiolib-acpi maintained by Andy and Mika, or platform-x86
> drivers maintained by Ilpo) and there are experienced kernel
> developers in the ARM ecosystem with quite a bit of ACPI-related
> knowledge (Hans, Jonathan, Sudeep, Lorenzo - all CCed) who can be
> reached out to for guidance (and arguably they have more experience
> with ARM platforms than I do).
> 
> > I don't know how ACPI on more traditional platforms works, but I imagine
> > that it's a lot of the same anyway, except perhaps that people have more
> > experience with the spec and today might be doing a good job already.
> 
> If you have any specific questions, I think I should be able to answer
> at least some of them, but I'm afraid I cannot give you general
> guidance on how to do ACPI support in device drivers that would be
> universally useful.  Different drivers have different needs.
> 
> There are things in ACPI that are not present in DT and vice versa.
> It also depends on what bus types we're talking about (platform vs PCI
> vs USB etc).

And don't forget the big player(s) such as Microsoft that from time to time
creates an "extension" to the ACPI (in means of additional tables or how some
of the existing data should be interpreted if it's not clear from the ACPI
specification). For instance, above mentioned USB ACPI support for some cases
heavily relies on the MS "extensions". Or earlycon support for ACPI is based
on MS defined SPCR table. And so on...

> > > Having a review done by the ACPI maintainers would definitely
> 
> So as per the above, who exactly do you mean by "ACPI maintainers"?
> If you mean "the people maintaining the code in drivers/acpi/", that's
> just me and quite frankly, I'm not sure if my review, specifically,
> would be super-useful for driver development (the fact that my review
> bandwidth is almost completely saturated nowadays aside).
> 
> My recommendation would be to ask other people within the ARM
> ecosystem who have more experience with ACPI for help.
> 
> > > help from my point of view, but I'm not sure whether they are
> > > set up for that, in case there are a lot of new drivers.
> 
> I am not and had I been trying to do it, it wouldn't have scaled anyway.
> 
> > I think platform maintainers need to be a first line of defense here
> > since they sit at the intersection of a lot of this. At least that's the
> > case for me. Also, I'm eager to learn how to do this right, but I'm
> > often at a loss of where to start. The spec is a bit daunting, and then
> > there's various extensions, too. Maybe the AI genies can help me ramp
> > up.
> 
> My advice would be to reach out to people within your ecosystem in the
> first place.
> 
> > > I assume there is a knowledge gap in both subsystem maintainers
> > > regarding ACPI (certainly this is the case for me for drivers/bus,
> > > drivers/firmware, drivers/soc, etc) and ACPI maintainers regarding
> > > many of the subsystems that we support with DT.
> >
> > Agreed. I've seen some patches where the ACPI support was as simple as
> > just adding an ID table entry and the rest was all standard, but I think
> > once we move beyond standard resources things might get a bit more
> > complicated. I imagine that ACPI may not even have specs for certain
> > aspects that we currently handle in DT...
> 
> That certainly is true, but the ACPI specification is under active
> development and pieces that are missing can be added to it.  There is
> a process for that in place and ARM people take part in it.


On top of the above in Linux we also developed some "extensions", for instance
how I²C muxes are described, or how some multi-functional devices are being
enumerated. These specifics we usually document under
Documentation/firmware-guide/acpi/ (see i2c-muxes.rst for the mentioned case).

-- 
With Best Regards,
Andy Shevchenko


