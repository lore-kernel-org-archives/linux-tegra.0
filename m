Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1F101C687
	for <linux-tegra@vger.kernel.org>; Wed, 23 Oct 2024 01:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729645283; cv=none; b=fDONgDF8votYUtxeX2PNhSRyArCXqVnzzeHomwZd7e59UG8B01RzaWBcCvFcjKOhlPjzNUNLEtLmJ82YaCYYs7ONulrG7tPx9t6b843O1eIug7OtN5MBVCiislAl8Bo07kFVKPWaQbxLC2W5O0qToX1VwgSHU50hlDZnxR9wfPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729645283; c=relaxed/simple;
	bh=HFdUON0V2GphcU9k9fNd96djFn4cjLgGiTx0TKpGRsA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YIifX9MfmaGljIPkWjwGJ+5MS0RZAZEGU/zyItaBP/PZI9Vd/6wT32dRaaLzzRUnZzTO0jFzlf6O/LHfwAtNInnmTYO2srNas7IQOECBxkOqbRH/TeABULa5A9QG7p3uP0QuXkAcR1GJu3WQEJ6LCKXRY3lLQla2wiyqyN88xMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UY/T0/fS; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UY/T0/fS"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2e2e23f2931so4964611a91.0
        for <linux-tegra@vger.kernel.org>; Tue, 22 Oct 2024 18:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729645281; x=1730250081; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7w3BU2HjAXl1RWxHwiHpmCiEMdPfDx7ASOCiiQowi7g=;
        b=UY/T0/fS+nCIevwkXIU2jK5lV2npbUjntSrOruHsApW1E7ISK83P9f6EAwbpkrslM8
         s5SAO+rgYakUaWKF+BEedH5c88/hWqiyshZO4IJF0IgBC3+ANnM+luFHHTi1pzwszohb
         5ZGl1htR2ATgSPoqW+Z3kUOjtcXzNgU44iBvgviUAenk0YAk7K4nU+ZiYaDS5W4v+ew7
         9NF6KnabRbrrzHEiK9BM9RtojfP4XMyT/NcVEDZriFKDDvd+mFYhsCdconOn4msVG1kd
         nfjkR5HtTM7M3tl9+RbRzNoSbD3pzbkBletbbmqdSIPUkLtUi4fBZdoa311beaLM7GFZ
         0wKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729645281; x=1730250081;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7w3BU2HjAXl1RWxHwiHpmCiEMdPfDx7ASOCiiQowi7g=;
        b=SlsE9rK0YxwLCP9QOzvZRbwA4wLUHa7f6/HnbSVtsfPyUdy7SCLEf+2TXi+55aamJ4
         LT/NmiLMD32GLJDSnKpRMInVp0Usj8hbXFXOwV4HhHe/xom8dtCaYrE8/CHDRZiVV/OU
         SdBGADUU4fEmhAw7daPlSAiM0p/hqMVsNdWgmKJlg/SMgYQg7poeB6+nloCpRNFIxg8z
         BYX+bH5CXSygL49pnru2KzLoKKfWhlItc4+8tGUcy97xrCeURniU98QKnW8vLjotZNSD
         JL18FWpq/2LrOpv8IAyK+N79lf0OsLFpD2KleCqXo6uG3pe2L5DoLxZA9u8kb35KUZP9
         txhQ==
X-Forwarded-Encrypted: i=1; AJvYcCV40Rz0kudwNhnedOD02TJ6wPQ1pNWBuNGTFlEOxGxGnkVdmTjiF/fPAc9uDVcq50NVeLKT5pHu7IOLhw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyNr8zMXHzy9UhjgGWw7rxDnUmuutuWjOcFMemdLNgiQTlU3wGx
	eSRl4IB06Z7i/zRXJbfxsXNfAeTDNS4F3wpeWnltWaLYn3omm/EoMWPDr+0ezMQgY+aQYdRZeQR
	1kdeMJ2tzsSAyw+UyoviNsCYRFapNRamaVHMx
X-Google-Smtp-Source: AGHT+IFeEoPGIw3p3ijQLJLpEmpS31c9Z2j74F0oEOYPG4hKYfTCoF6Xbw1z+XYwmGwY03CFsDkNifA2pnMGypOacEc=
X-Received: by 2002:a17:90b:1c8d:b0:2e2:af6c:79b2 with SMTP id
 98e67ed59e1d1-2e76b6cda3amr966161a91.29.1729645280874; Tue, 22 Oct 2024
 18:01:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240910130019.35081-1-jonathanh@nvidia.com> <2024091152-impound-salt-c748@gregkh>
 <d89c89f8-0036-44a4-8ffa-ea89ed576a9f@nvidia.com> <2024091627-online-favored-7a9f@gregkh>
 <b1b67db0-3b9c-4d96-a119-fe3fcf51b6e3@nvidia.com> <CAGETcx8E9FddpwMO4+oqeEc0RVMLbUOs2m+=B900xzrLvEkSXw@mail.gmail.com>
 <2c42677c-5e8e-4805-b6a5-0a5baa3e55b5@nvidia.com> <d9aadede-dfac-410a-b65b-e295c9a64951@notapiano>
In-Reply-To: <d9aadede-dfac-410a-b65b-e295c9a64951@notapiano>
From: Saravana Kannan <saravanak@google.com>
Date: Tue, 22 Oct 2024 18:00:42 -0700
Message-ID: <CAGETcx-_z4hxyNSwT-D1MKNzAjOGSX+o7x5G8J0KkiUyy+RkDQ@mail.gmail.com>
Subject: Re: [PATCH] driver core: Don't try to create links if they are not needed
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Cc: Jon Hunter <jonathanh@nvidia.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 3, 2024 at 7:59=E2=80=AFAM N=C3=ADcolas F. R. A. Prado
<nfraprado@collabora.com> wrote:
>
> On Thu, Oct 03, 2024 at 11:25:22AM +0100, Jon Hunter wrote:
> >
> > On 02/10/2024 21:38, Saravana Kannan wrote:
> > > On Wed, Oct 2, 2024 at 11:30=E2=80=AFAM Jon Hunter <jonathanh@nvidia.=
com> wrote:
> > > >
> > > > Hi Greg,
> > > >
> > > > On 16/09/2024 18:49, Greg Kroah-Hartman wrote:
> > > > > On Mon, Sep 16, 2024 at 03:50:34PM +0100, Jon Hunter wrote:
> > > > > >
> > > > > > On 11/09/2024 15:32, Greg Kroah-Hartman wrote:
> > > > > > > On Tue, Sep 10, 2024 at 02:00:19PM +0100, Jon Hunter wrote:
> > > > > > > > The following error messages are observed on boot with the =
Tegra234
> > > > > > > > Jetson AGX Orin board ...
> > > > > > > >
> > > > > > > >     tegra-xusb-padctl 3520000.padctl: Failed to create devi=
ce link (0x180)
> > > > > > > >       with 1-0008
> > > > > > > >     tegra-xusb-padctl 3520000.padctl: Failed to create devi=
ce link (0x180)
> > > > > > > >       with 1-0008
> > > > > > > >     tegra-xusb-padctl 3520000.padctl: Failed to create devi=
ce link (0x180)
> > > > > > > >       with 1-0008
> > > > > > > >
> > > > > > > > In the above case, device_link_add() intentionally returns =
NULL because
> > > > > > > > these are SYNC_STATE_ONLY links and the device is already p=
robed.
> > > > > > > > Therefore, the above messages are not actually errors. Fix =
this by
> > > > > > > > replicating the test from device_link_add() in the function
> > > > > > > > fw_devlink_create_devlink() and don't call device_link_add(=
) if there
> > > > > > > > are no links to create.
> > > > > > > >
> > > > > > > > Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> > > > > > >
> > > > > > > What commit id does this fix?
> > > > > >
> > > > > >
> > > > > > Hard to say exactly. The above error message was first added wi=
th commit
> > > > > > 3fb16866b51d ("driver core: fw_devlink: Make cycle detection mo=
re robust")
> > > > > > but at this time we did not have the support in place for Tegra=
234 USB. I am
> > > > > > guessing we first started seeing this when I enabled support fo=
r the type-c
> > > > > > controller in commit 16744314ee57 ("arm64: tegra: Populate USB =
Type-C
> > > > > > Controller for Jetson AGX Orin"). I can confirm if that is help=
ful?
> > > > > >
> > > > >
> > > > > That helps, I'll look at this after -rc1 is out, thanks!
> > > >
> > > >
> > > > Let me know if there is anything else I can answer on this one.
> > >
> > > Hi Jon,
> > >
> > > See this.
> > > https://lore.kernel.org/all/c622df86-0372-450e-b3dd-ab93cd051d6f@nota=
piano/
> > >
> > > Ignore my point 1. My point 2 still stands. I got busy and forgot to
> > > reply to N=C3=ADcolas.
> > >
> > > I'm fine with either one of your patches as long as we define a
> > > "useless link" function and use it in all the places.
> >
> >
> > Thanks! Yes I am also fine with Nicolas' fix too. I quite like the dev_=
dbg()
> > in Nicolas' version. I was wondering if we should define a function for=
 this
> > check too.
> >
> > Nicolas do you want to update your patch with a 'useless link' function=
? I
> > will be happy to test on my side. Looks like you identified the exact p=
atch
> > that introduced this and have the appropriate fixes tag too.
>
> Hi Jon,
>
> I just sent a reply to that thread yesterday going a bit further down the=
 rabbit
> hole to try and answer if there's an underlying issue there that the log
> messages are just exposing, but I still don't understand all the devlink =
details
> involved so was hoping for some feedback from Saravana.
>
> But if there's no feedback I can surely update the patch with the commoni=
zed
> function to fix the immediate problem. I'll wait a couple days to give Sa=
ravana
> (and others) some time to respond.

Finally managed to squeeze in some time for Nicolas's issue. It was a
real issue. Replied to the original thread from Nicolas.

Jon, can you do an analysis similar to Nicolas? What consumer node did
fw_devlink try to create a link for and what consumer device did it
end up creating a device link with instead?

-Saravana
