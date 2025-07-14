Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06A1D37160;
	Mon, 14 Jul 2025 06:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752472894; cv=none; b=bT0+kzaOTH5P2e8+dIjONlJKde3wMWHPNLxm9oA+tQWKQ/oTVNlQtgWbZJRJ7a85YQMmrp+JOBWPmB7SmTAxbPAbsMNmInE2wlGUv4hFsRzXriexhjqmPkRi15INFXFRDvlfkUgeLqWHu1GgGML/c2EpoHy5KtPl+mZRV50PXRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752472894; c=relaxed/simple;
	bh=KSutYYpzj12A8Clp1V3EpFhK6twa9mZjwopcGDUMZ88=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XnOsFMrMIxoj4cT1UjDd2aSQuv7CCib8lZhKs95d6UN/DIpV1MGvuZcgtqV5auQmWahNyKTKuFOdbB7zZ8NgCTuTX9SUt5HhXXj76QDoqp1QWC3gHUAfl9Ne8Sojrk9+tOEr0iH3ZSwC64MnS4zKh4L+zWvviGCs4oIkh3ft6P4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jpYLgY21; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jpYLgY21"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-558f7472d64so3957663e87.0;
        Sun, 13 Jul 2025 23:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752472891; x=1753077691; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KSutYYpzj12A8Clp1V3EpFhK6twa9mZjwopcGDUMZ88=;
        b=jpYLgY21+XDh96iUmqxsqEalfky21jMjlACP2W1b6GOCwOLKrmEqcFPXmW4GWj9XeS
         WyE1pfnaAv/G7EopgYNLXD+ct3h34qCIHCOpanx+920fVnewgzW+Nn+AnEhJLsKJUkcy
         8mWcIWKunAs1Q25zHFoFstBH7X/WgURFP65t3ROz6K96xhuPzbbXGwmJFKJYNC4rzPSo
         LSNeh9wSjRBjJgZXuE8uS5IyeqE7aqv6ZCBTJKrl6msyXFn2CWQTsABUyWiXz13nAbs3
         zMLghYc5cf++zyQUZC+pykBeyW/1l+IrG684RhXd7mSM6VoplQnSo4CrER3UWSyM+os0
         leLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752472891; x=1753077691;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KSutYYpzj12A8Clp1V3EpFhK6twa9mZjwopcGDUMZ88=;
        b=IMGymLnWDhb2WqMAcyITTdXl/QLz91R3Rz32dy2BatSzXqN0SNSu8+4YN/mevaDRzr
         e5cO1v0XAGqYsHeCV9XMc0TIc458vcqXzzwqmKnxrNi3gg6RFhHgbGsOPQ6ytBbt+au1
         W5SXAEGaXI/lM6Q9rIO+olCmxtOTgjFgPClLHVe+TU6z9Thgdm3AH5S7sj8kNsFocEBq
         4bbX5aUT4zP7xJe/x0xfwZ6cgdLdVfxr81n76lql0snMzqox7tX5/wPIJkZDb/4PMEX8
         P8nzYU5KYIGU4qoygzu+Bptfd10q87AjIDoWiqwJPpkXT5xWsU7gDJBaHjamnuP8LoSE
         OrJw==
X-Forwarded-Encrypted: i=1; AJvYcCUHefiywZiuZNqi2154/asLnzccW1EOo/ls3KxJsb1etie+92Ae4RplwIvxujdL4pe1+Xb/Yq0I1UO4eZ8=@vger.kernel.org, AJvYcCUQjnFEY6xP8LxcK+xV8CxpmkXDw5LedgLJjeSlENr/4ubOfeYq/afqAwAaxG/00ha6gxXMvZTVNRFh@vger.kernel.org, AJvYcCX3OfH9SyouPMKtfsc+hDxeqw6f0JxjUSy7sVKEg86Ye9hDRC/Ux/eZH/bcd47plkRVbrJJ48DFYr/3wViJ/XVR@vger.kernel.org, AJvYcCXrKLBSaBeh3acklGW72f7RI8aYWTdpmOSXdM4O2WKhGGlD3cRl2LbHJJ7xIbnOuBFhOE4NOm9gF67hdoHC@vger.kernel.org
X-Gm-Message-State: AOJu0YxQG+KmVmNBQD7c+FVKeoRM0OtXQKg/+nPBYvPi4zqAFsIC94M+
	FJcDol+C+Tpj0DcQ0I+VaYfOF1gG6qg/OK99oayMq0pHLP6GTImpSpFBWXJbWRcMZRTUE6ZrVgi
	vqYgxNRQvT9iTtwpywu0LBTcPt44/4Uc=
X-Gm-Gg: ASbGncsREDcdcUOYfz0Y2vnU1pFa21kC403SzUCoMr658Y6sOyZQr2bmS+qA9PZ2Owy
	EYupMkrH2ysxVMfNKrlGLqFA1/i7rwuI5iThBKhI/awbPdPmryz86KzpshIhFUoNb+KjJpOmRAP
	63x0l60gSoS3JK86ESzRQZvNjKerfA9vUjkBJNmkJdWAQ9ZnDOwWu80S7NOjvPMQefYxp5Lh0S6
	QDhtJY=
X-Google-Smtp-Source: AGHT+IFaK4CVePoPSDAN6z50vAdyVoIA95uNU2vm1WeFoylnBGb0O9yoyyrFrkD1jzp77/kg4hC3YqzelAGQlJZiMY4=
X-Received: by 2002:a05:6512:4004:b0:553:2bdf:8b87 with SMTP id
 2adb3069b0e04-559006bad5bmr4367708e87.10.1752472890874; Sun, 13 Jul 2025
 23:01:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <83d17d6e-41c2-4729-94e6-5ccf480c766d@kernel.org>
 <CALHNRZ8+vnXrx7xw=qjpB34MX32hW_m7k+=CdePJpErBPPzv-g@mail.gmail.com>
 <53c943dc-5ea6-456b-a289-08212fc01d5d@kernel.org> <CALHNRZ8+X61YzQ_gYRkuAZrz2XFiZK36GDgk=801+384y2KnOQ@mail.gmail.com>
 <CALHNRZ-YZg3cKzRBMGaxRpejFMLSpOOz-FPQEaQVXFpFao40WA@mail.gmail.com>
 <CALHNRZ-jxC5PXqiG4tNShybaU9gZjTz4YT+VXgfQFNQ-Ox7crg@mail.gmail.com>
 <yczvbwanjadyfife3hnp2khxkgs77pokypqkxotlldjskshskt@xckrkfucg6xx>
 <CALHNRZ--ZUxqrXHEnizXC8ddHC5LFA10oH+CgQmOcTt+cJ1CWw@mail.gmail.com>
 <6abdc70c-0def-4cf1-b1f4-ea9bdde4fcb5@kernel.org> <CALHNRZ8=ikQe4L6h9VHpTGm+OFU0iZA_OV6LUP6jDUySBv4+Lg@mail.gmail.com>
 <lvj5atllziwnfreau25fejckllzhgur3rgh5udpx6boz55lgu5@h6fpsnz4xmkg>
In-Reply-To: <lvj5atllziwnfreau25fejckllzhgur3rgh5udpx6boz55lgu5@h6fpsnz4xmkg>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Mon, 14 Jul 2025 01:01:19 -0500
X-Gm-Features: Ac12FXzSmllv1_2-S7ZArROlDnlEZ-mxn1jEusIi4cfhaFgSU98vKE9b_xmI7P8
Message-ID: <CALHNRZ9VEUzU07j_fUWhNnF24y64wkO5_Vun-mf6d_m=Xyx4dA@mail.gmail.com>
Subject: Re: [PATCH] arm64: tegra: Enable ramoops on Tegra210 and newer
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 3, 2025 at 2:24=E2=80=AFAM Thierry Reding <thierry.reding@gmail=
.com> wrote:
>
> On Mon, Jun 30, 2025 at 01:48:28PM -0500, Aaron Kling wrote:
> > On Thu, May 29, 2025 at 3:53=E2=80=AFAM Krzysztof Kozlowski <krzk@kerne=
l.org> wrote:
> > >
> > > On 28/05/2025 19:35, Aaron Kling wrote:
> > > >>>>
> > > >>>> Friendly reminder to the Tegra maintainers about this question.
> > > >>>>
> > > >>> In lieu of a response from the Tegra subsystem maintainers, I can=
 only
> > > >>> hazard an assumption, Krzysztof. I presume the pstore carveout is
> > > >>> bootloader controlled because various stages of the boot stack ca=
n
> > > >>> dynamically allocate memory, and this became bootloader controlle=
d to
> > > >>> prevent any of those from overwriting pstore. I worry about hardc=
oding
> > > >>> an address in the kernel dt, then finding out later that there's =
an
> > > >>> in-use configuration that overwrites or corrupts that section of =
ram
> > > >>> during boot. What are your thoughts on this? And is there any way=
 for
> > > >>> this patch to proceed?
> > > >>
> > > >> I haven't been able to find anything out about this yet. Generally=
 it's
> > > >> difficult to get the bootloaders updated for these devices. Tegra1=
94 and
> > > >> Tegra234 may be new enough to make an update eventually go into a
> > > >> release, but for Tegra186 and older, I honestly wouldn't hold my
> > > >> breath.
> > > >>
> > > >> Thierry
> > > >
> > > > Krzysztof, based on this response, is there any way or form that th=
e
> > > > Tegra186 part of this could be submitted? I can drop the newer
> > > > platforms from this patch if Thierry can get a response to his othe=
r
> > > > reply about how the bootloader could conform.
> > > >
> > > I don't NAK it. Eventually it is up to platform maintainer if they
> > > accept known DTC warnings.
> > >
> > > Best regards,
> > > Krzysztof
> >
> > If the decision is up the the tegra maintainers, then Thierry, what's
> > your thoughts now? What is in this patch should be compatible with
> > existing l4t and android bootloaders. But it does add a few new dtb
> > check lines.
>
> I don't adding new DTC warnings, especially ones that we know up front
> we can never get rid of. The memory one is a notable exception because
> the system becomes unusable without it.
>
> ramoops is not in that same category. While it's certainly nice to have,
> I don't think it's critical enough to warrant that permanent exception.
> Where possible I think we need to work to address issues souch as this
> at the root and fix bootloaders to do the right thing.
>
> For any cases where we can't fix the bootloaders, I think that's
> something we have to live with. Having the support for this live in a
> fork is a fair compromise, I think.
>
> I know this is frustrating, and it's very painful for me personally
> because I initially set out to redress a lot of these things and failed
> to do so.
>
> However I can't justify accepting endless amounts of quirks upstream,
> all of which would set a bad precedent, just for the sake of things
> being upstream.
>
> Thierry

Alright, so to make sure everything is on the same page, let me walk
through the archs.

T210: This fits within dt check requirements afaik. If I send a v2
with only t210, would that patch be acceptable? Though, I would like
to double check that my assumption about the arch is correct. The
downstream 4.9 kernel does allocations for ramoop I can't quite track
in the vendor code. I'm assuming that by matching what the downstream
kernel picks, that it's within a large carveout that the bootloader
will never touch. I've not seen any corruption in my use of it so far.
Is this a safe assumption?

T186: Software support for this arch is eol, so what the bootloader
does cannot be changed. Presumably no other choice but to relegate to
a commit in a fork or out of tree patches.

T194: Some software support still exists for this arch in L4T r35. Is
there any positive feedback on making bootloader changes to meet dt
check requirements, or is it too late in the cycle?

T234: Still has active software support in L4T r36. But essentially
the same question as t194.

T264: I assume whatever happens for t234 will be mirrored here.

Aaron
