Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F1B22FF14F
	for <linux-tegra@vger.kernel.org>; Thu,  8 Jan 2026 07:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767856142; cv=none; b=EPdjDlPZOGYyQuEaCWB6ycLbhJsvJsKniHgDt0HZbBoz86mS01yuHzU8X1mw1Wl1ea4/m2ceedkmLYR0wskBNxnWbKyVrAeJsgaOWzzC6yHEpWxnyHi/utWQedlxrgxH9a0FPxQe4tpdDTc/N5mpaM9LKRJr9ra5VW+RY5pAMvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767856142; c=relaxed/simple;
	bh=QtBmZt6mefLBB29zYtfTxmMzVNAjncXXGV3XaqKxAUE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CZTiD8Uy1fYNHXQ3ejd1BLMZ2IjI4S2kOb3XrFD4+x9Ca1bA06RM2syhpCM7w71aHWEDOoiwwf8EJMgLO/Lh3gMjStJcP7MCWw5AnYlBZK7qfR58k2qKlRcYS4VCmOgTzPCfPcVN5MASqwLiUV+EcoWETdDUzvUWIZCt/flBPCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SkW91Q6o; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SkW91Q6o"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6505d141d02so4483658a12.3
        for <linux-tegra@vger.kernel.org>; Wed, 07 Jan 2026 23:09:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767856139; x=1768460939; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=thTQB76dgPyskB7sNYUZqWzvYQMMFkWo0xe6mJSSPOo=;
        b=SkW91Q6op2P918bHOJRTdKYVa0FOfH2R7vJ0b7KDD3W3BItPUpAhG/Wd6m2mh6R9ca
         6uApMZ7PGnT3aRs4NcisoEzqO1NPzWEcWph/H/9Ef9WDllxFcOReCApqPMJBLpi+icS0
         iX02NT9OFMj6OKlXrnlAm3cXplFwq8DlpKKFR8P0W0r4Jbb8nbIJWdieigB0pNL/tBFP
         Y7NDU4jV6T8EQfW74qe8iT9oa2MtRye0h+/D6EhHnIAhu/YJYil+9E2sJ4CAPmS8jcWt
         FeFBrwOcJrzn3jJM4XjSEcFJqP8nbWMCG0DOOmYlXwSvDdf2yVM5HTq8XYclwS0mQ5Jc
         ozww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767856139; x=1768460939;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=thTQB76dgPyskB7sNYUZqWzvYQMMFkWo0xe6mJSSPOo=;
        b=HTQKA2gFBpFkpDfIj1ARtmK1B7bhxpLROBZrxWfGVsabWJh6Lkv94cbQLwyA27badB
         bEXbrcohzl4Km7cfpg1n2RaKSPzSuo/i+eY7qRSHvCspuEziZ8ZZQIBFG4Urytjz7lR+
         dgfPGKrMNdHmKWb8mBV/OEho9TAaNh9ELDsuHPjD54EVqt8DZKwvMo2aiK0f9zEp5/T+
         4izYMni2B2hNjFXJpDF9gco58Mn63KV4/UBPo024eGBrdJ71v3qNR0T22rKWjmc+Zeha
         WflV5ej2sk1Xwjkm2lsq3Rg7ucyuJi6BjOgt1oipiTqyWHH3+ibfVtlAM91+7MlIgWIL
         67/g==
X-Forwarded-Encrypted: i=1; AJvYcCWyS2spQIKE3Czq3zL+MkctwAHcPF+809r7CIZWD1jsf/Zy9/nq7HhzybUH8/KxMaJT6/qneJrxEh19WQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0G+6JWWqDrFzRZUEcfOrjpXrQ0AHfe/urEFZFtFjym7UhclQr
	0jlAu2s8jXU3e5cQVDqg0ROQxwJ2Hx8eilPmB4cDAmJeLlLR9iOJdN/+BtIhS4Wi4k2jmu3imHP
	8CKFb7+nU2VnOS2YCt2FodRMhtoila8U=
X-Gm-Gg: AY/fxX4u1NC/8dXypneoOYTuS46JGx/YkAHf8GOGKBGnr7bHsPYBDwj+CIMf+zNx+6k
	hGPwWRLIaokO/ryp88GyzoukEzqUiOTtjJGdBzHqPC+J4YO0y73FTZSeyC5ugKYGmoC1hZFmeFg
	LeJbDZ1FTp4CF9fseXbwQrS2tO3tnqtJqfRnsea4YqJ+ikPvrBMHbOoJEmqwQ9/HIxhxQTOCURU
	FRKjfL4txowcc4WCVsxTgU/LK03TDbAP4jeTDV30qUbVoJhyMjyvdKJFwxQyOQDm5g=
X-Google-Smtp-Source: AGHT+IFmXcT/RJ6HZubhWjedng+hHTPSueTKrHqpeVlNJ+ZGzEvFI4lHW+npR1I0poqnrowNdGccMsb7LKtXr6O/0Es=
X-Received: by 2002:a05:6402:1e90:b0:64b:bb79:96bb with SMTP id
 4fb4d7f45d1cf-65097e6c1c6mr4178545a12.24.1767856138583; Wed, 07 Jan 2026
 23:08:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251215141603.6749-1-linux.amoon@gmail.com> <20251215141603.6749-2-linux.amoon@gmail.com>
 <3cd7943c-4d35-4ec9-8826-c20a5d213626@kernel.org> <CANAwSgR7UPrPSHB9RL5newKgWksyn4MoP03ykRQcP2eRSK2SXg@mail.gmail.com>
 <f0344520-3234-4285-b971-f8cd9955ba90@nvidia.com>
In-Reply-To: <f0344520-3234-4285-b971-f8cd9955ba90@nvidia.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Thu, 8 Jan 2026 12:38:40 +0530
X-Gm-Features: AQt7F2oHeG785F7Uu0lJ2eS0VjzE4iO4B-6pef7igv9JbvhMFoJQu85PknHRyfo
Message-ID: <CANAwSgQbvN4g6Z4RRTzXbfy-nf+Wiq1Hv5NAoJiR1BqBAT--Lw@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: PCI: Convert nvidia,tegra-pcie to DT schema
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, 
	"open list:PCI SUBSYSTEM" <linux-pci@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	Mikko Perttunen <mperttunen@nvidia.com>
Content-Type: text/plain; charset="UTF-8"

Hi Jon,

Thanks for your review comments.

On Fri, 2 Jan 2026 at 23:55, Jon Hunter <jonathanh@nvidia.com> wrote:
>
>
> On 24/12/2025 12:41, Anand Moon wrote:
> > Hi Krzysztof,
> >
> > Thanks for your review comments.
> > On Tue, 16 Dec 2025 at 11:08, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >>
> >> On 15/12/2025 15:15, Anand Moon wrote:
> >>> Convert the existing text-based DT bindings documentation for the
> >>> NVIDIA Tegra PCIe host controller to a DT schema format.
> >>
> >> You dropped several properties from the original schema without
> >> explanation. That's a no-go. I don't see any reason of doing that, but
> >> if you find such reason you must clearly document any change done to the
> >> binding with reasoning.
> >>
> > Well, I have tried to address the review comments from Rob
> > [1] https://lkml.org/lkml/2025/9/26/704
> >
> > Actually  /schemas/pci/pci-pci-bridge.yaml# covers most of the PCIe binding
> > So I had not included them, as it would duplicate
>
> FWICT you are missing all the Tegra specific power supplies and so those
> will not be found in the above file. I have not checked if you are
> missing others too.
>
I will include this update in the next version.
Please review the pending driver changes..
> Jon
>
Thanks
-Anand
