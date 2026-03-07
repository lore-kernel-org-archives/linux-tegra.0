Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C82C313E21
	for <linux-tegra@vger.kernel.org>; Sat,  7 Mar 2026 21:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772918003; cv=none; b=VaIVKeGj2sK0FlurGfPh/lZ+n54M+VmcEBQpntSFkgdE4H4Dnjv8gRF/vZdsjTm6+DNvGxeBVZRmzvqXiyEkCeRW8/uWhRkVVsfbv0QV7V5vjb/g0++yHf0Q+Jx0+2R4Zztl4jZccmSYKLroU7L/srnRy575gsjVfA/dD9Zk104=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772918003; c=relaxed/simple;
	bh=w8t269qI4kdA1DU9l5jve4mAHmOdAC9k1jnaSrHc+Rc=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=iCuoAIWRbE873WerC4683rEzmW1x9gVpVm2mG3aMXZzeu2lSSchjJtk7kJrMvxXMBJ5E5HGEX2BiG0k5wHPKHnUjptlq+ygG2dUO3vU9H475BgOPO6O2llUT5kWVgMCssi+qn+vdNEHWOOTuDMilaX8ehlKwYKr9pGshvA2louk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de; spf=pass smtp.mailfrom=posteo.de; dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b=EZzFyUEA; arc=none smtp.client-ip=185.67.36.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b="EZzFyUEA"
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id B7A82240028
	for <linux-tegra@vger.kernel.org>; Sat,  7 Mar 2026 22:13:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.de; s=2017;
	t=1772917993; bh=w8t269qI4kdA1DU9l5jve4mAHmOdAC9k1jnaSrHc+Rc=;
	h=Date:From:To:cc:Subject:Message-ID:MIME-Version:Content-Type:
	 From;
	b=EZzFyUEAq2uqG/6OGRQs8oqeu2csiqUvX/OLFUdfWkLyOgjmVq8I+mScUV1NRAZ/f
	 C5T6/eMv/ym7ZcOT25lmknOsFDgkZxHKQ5yRVEHOLsayQUitGlI2JZ7RFtMCXOoLvf
	 1Gv2oAvt8tZ/gWyOmvJM0/cLOLlwhFvDlOkWxqzO5fw8+QWXH9wa+r0ix/NwcJ2EL2
	 MF8HGUdeHL8G2zABFK/9betnYVIHK96q9LHOrQLltXuig4o6CMrESJhhezm8RP+SpA
	 89N5dcxbAQ0IYydFluJqjXnz+PPcX0xsglF/slA1U6Ap5IFIvoN69hs0u268bRU2P5
	 eJJy4FO3+PjHA==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4fSwwl4JjWz6tw2;
	Sat,  7 Mar 2026 22:13:11 +0100 (CET)
Date: Sat, 07 Mar 2026 21:13:12 +0000
From: Marc Dietrich <marvin24@posteo.de>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
cc: Thierry Reding <thierry.reding@gmail.com>, Arnd Bergmann <arnd@kernel.org>, 
    Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
    Conor Dooley <conor+dt@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
    devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
    linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] ARM: tegra: paz00: configure WiFi rfkill switch through
 device tree
In-Reply-To: <aaSsgDqmTLEQQqK0@google.com>
Message-ID: <78b4684a-0e97-ebac-c955-6c77c3edc47f@posteo.de>
References: <aY_BpRQmLdqOOW2K@google.com> <82f24afb-1fd2-bfc9-2215-4526aff372ba@gmx.de> <07c024a6-d2f9-5805-4ae7-cbc89cda53bf@gmx.de> <aZvdDIYlCjg8sVGT@google.com> <99ddd816-f19f-cda8-15a9-6273e26e9e8b@gmx.de> <4a1bcdfd-e308-e357-2409-8bc82f115928@gmx.de>
 <aaSsgDqmTLEQQqK0@google.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed



On Sun, 1 Mar 2026, Dmitry Torokhov wrote:

> Hi Marc,
>
> On Sun, Mar 01, 2026 at 09:55:45PM +0100, Marc Dietrich wrote:
>>
>> thinking about all this a bit more, I guess your approach to just convert
>> the driver to device-tree and not change any functionally beside it, is the
>> best solution for now (and good pratice in general).
>> Maybe I can get access to a machine with bluetooth (or some other user steps
>> up), so we can try to find a better solution, if required at all.
>
> Thank you. I believe your tested-by is applicable to the current version
> of the patch as well, so maybe Thierry can simply pick it up.

yes sure, thanks!

Marc

