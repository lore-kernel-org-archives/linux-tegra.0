Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E979A225403;
	Thu,  8 May 2025 12:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746707289; cv=none; b=gngUpsPJzyhdyE7weyoTatbQ4IR1dzgC530NK3YZmLbxuxCzn52UXEKAR24Q/qBgZm1a4P2/8/emZqVf2dsHj2q1guXqUI7IUJ+hn0azyyYrv3UT8vFhtK1gi5sXLNYWO82pySd38ril7T/ncxMDkNCt4f5Gpat2CaXtk1gy0K4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746707289; c=relaxed/simple;
	bh=3KsqTxB9tSG1Fili1I2FkJ28wEibLewLt0ndOHffSe8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lPGzLQhNP7z6B/h8SfhQ4xLUp9uXi434WhybuWMQy32AaHOrUMHQHPbImi0vJdARHRu7Zon5g+7n4Tj62S/GNTFOSCwfryDquNlMxTt/yQsryzMqGlyGXo0u4R1TTGQqp7P7yUlbRShK6sc/hvAeb7Gh0QPGa9jzbX3tC5CPYfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j0YO63BH; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j0YO63BH"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-549b159c84cso1109128e87.3;
        Thu, 08 May 2025 05:28:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746707286; x=1747312086; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p8z0r+15z1JYVIXTcK2Gr5T3wzDdzK7vBnKTwGf2a+E=;
        b=j0YO63BHBdr2QlDLSQ/CwezP5Fu66+7ayDp/JLO74F6kZnVwAgB901zYdidBoWRoO1
         jHGPZq3vI3TZXBuZzv1gKOQSEokO0sAYsMIkAtbXXAOMO2/ZpUPQBCKOrXDUPO/NwB+T
         WgC+9pRxuEiXmRiQnReJ7JBwIAJCGeHZuCQ/dhpS/EJTaUMZGUdIbyWRrOWA3URNMOk5
         A9yLNSF8bbA/h9SOHGxbGYDzXniNkf9PqOg6cyqjYFwmwyLKOuJGezsNr0FSNh3Ti6qf
         SoIJlJJjd8Tb+p7nPD2DHa51X42kSJWtYrCbTZYBh5TNEwyzSz7DRmqU9xidEOUIz+HJ
         8Wtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746707286; x=1747312086;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p8z0r+15z1JYVIXTcK2Gr5T3wzDdzK7vBnKTwGf2a+E=;
        b=ouTOM3tMsEoe80JL2z0dHn/xb33XW7HndCdp1tqXMwt0fZkw771J0or/lBKeLU82B3
         A1d4h42cMhDQMKBFCkH91jqp3AlKOxzwKRA88yYh4HE5+b3J7keHgv9mVDpckkmeNEnE
         Xhu1ZJgFEmrTEQkhmMj8DpQFhkygFVwCILD4cy9/mxADOpuaz3kMpGV6fmmx2P+d3uI4
         AvX7FMoBs5boLh8bp49YX4Jo2EBaMZUV2AAFkMmfhINPCnBeiN+vjKo3PtKxMMB2alC6
         5bryXQwg55rbNgM+w2jTA4YiUgL2b6xsfzn9McJcN6rbjPRF3t/ADVAM0taifxfhJX6w
         BAWw==
X-Forwarded-Encrypted: i=1; AJvYcCV5sCZHeJoNyT7CfiXVp8JYpHgLtC3XvWn+Rw46YhM+rjkPOCxXuHGGtqcjCuHVa8ZcjulkWVckBDU/+GRX@vger.kernel.org, AJvYcCVX8t/8O5w9L6kJD4ELFBZ5gfB+EW2qct5BlE3sQj59wFCByIzpUvBmAm3Y4Xs1CYlrqo2n5mnAgrih@vger.kernel.org, AJvYcCW85e0TZH/F59hi50Iq2VaqQuyugzze054bYKk+HaUMmpoeJplL/TnqR1MgVD0fdTgSd1aUkhkBoJeQEoU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVPt57WynyuXUv2RiL6zXHpRfqT6+XGwDn+WDA+6lXIlYMut1K
	VIbayyYnnSkToWCTJSdd+nXAQDWJxajhkbrJSz9KQVcNKgB6e2EMDu374mn23vx/isqQasiRc6K
	Z9ACHjZkG+MRRyPDTkV9Dycn8+VQ=
X-Gm-Gg: ASbGncua49WzYlaOxd/GsOAwUslIW/j1EeUB2mUwhrc75gwrCoJCzLAOyNNupYMAI4d
	9IFUMsgj2pk4qI+fG5tMQ9J0onXMWW2rFv8F1X2YqaPXt/1oA6nMP1fdcPdaXSI9AaMCv4fRKi4
	LmzAI4GluWw2qi33o0Sf4arNY=
X-Google-Smtp-Source: AGHT+IFx+c7QhYxDWjE4EmbzRUx3G3ONnk0IG0904JJGKwJoTt+Z7393cPHbLphhwJ+JrfZPDBxiOzO+or9IzRCNUDo=
X-Received: by 2002:a05:6512:2386:b0:545:aa5:d44f with SMTP id
 2adb3069b0e04-54fb9602480mr2498254e87.30.1746707285781; Thu, 08 May 2025
 05:28:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250508-tegra210-emc-dt-v2-0-d33dc20a1123@gmail.com>
 <qhhv27thjnbz7rtcfja767bpxjvwa6iivc2bphar7t2wobuzb7@aspkmrgp2ihy>
 <CALHNRZ-q7W9CfeD4ipmwFVqHm7oGfTgJpwNoVhfbSXFPDxF91Q@mail.gmail.com> <eba00bd5-fa1a-4cad-bb41-b395011235e1@kernel.org>
In-Reply-To: <eba00bd5-fa1a-4cad-bb41-b395011235e1@kernel.org>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Thu, 8 May 2025 07:27:52 -0500
X-Gm-Features: ATxdqUHRaY3O3xtWgGsmb_62eNklbNjNXPcEX8MqGjOaueoQDIt6kAZ04gvsNL0
Message-ID: <CALHNRZ_WPUM8wKSLcyyZm4jc9onBYiP3oLd=39k4=hoqLzHhrA@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] memory: tegra210-emc: Support Device Tree EMC Tables
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-tegra@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 8, 2025 at 6:47=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On 08/05/2025 13:37, Aaron Kling wrote:
> > On Thu, May 8, 2025 at 2:41=E2=80=AFAM Thierry Reding <thierry.reding@g=
mail.com> wrote:
> >>
> >> On Thu, May 08, 2025 at 01:07:37AM -0500, Aaron Kling via B4 Relay wro=
te:
> >>> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> >>> ---
> >>> Changes in v2:
> >>> - Add patch to describe the emc table bindings
> >>> - Add patch to allow a fallback compatible on the tegra210 emc device=
 to
> >>>   match firmware expectations
> >>> - Add a patch to include the baseline emc tables on p2180
> >>> - Link to v1: https://lore.kernel.org/r/20250430-tegra210-emc-dt-v1-1=
-99896fa69341@gmail.com
> >>>
> >>> ---
> >>> Aaron Kling (4):
> >>>       dt-bindings: memory-controllers: Describe Tegra210 EMC Tables
> >>>       dt-bindings: memory-controllers: tegra210: Allow fallback compa=
tible
> >>>       arm64: tegra: Add EMC timings to P2180
> >>>       memory: tegra210-emc: Support Device Tree EMC Tables
> >>>
> >>>  .../nvidia,tegra21-emc-table.yaml                  |  1692 +
> >>>  .../memory-controllers/nvidia,tegra210-emc.yaml    |    44 +-
> >>>  arch/arm64/boot/dts/nvidia/tegra210-p2180-emc.dtsi | 49749 +++++++++=
++++++++++
> >>>  arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi     |     1 +
> >>>  drivers/memory/tegra/tegra210-emc-core.c           |   246 +-
> >>>  5 files changed, 51721 insertions(+), 11 deletions(-)
> >>
> >> We've had discussions about this in the past, and I don't think this i=
s
> >> going to go anywhere. Device tree maintainers have repeatedly said tha=
t
> >> they won't accept this kind of binding, which is, admittedly, a bit no=
n-
> >> sensical. 50,000 lines of DT for EMC tables is just crazy.
> >>
> >> The existing binary table bindings were created to avoid the need for
> >> this. I don't know how easy this is to achieve for all bootloaders, bu=
t
> >> the expectation was that these tables should be passed in their native
> >> format.
> >
> > Mmm, this would definitely be an issue with my long term end goal of
> > supporting the SHIELD t210 devices on mainline. The bootloader on
> > those devices cannot be replaced due to secure boot and that variant
> > of the bootloader only supports this dt table for emc. And support
> > without emc reclocking would be rather unusable as a consumer media
> > device. Unless the devices could get a bootloader update switching to
> > the reserved memory tables before they go eol, but I don't see that as
> > likely.
> >
> > So I guess the question goes to Krzysztof. I didn't have the bindings
>
> What is the question exactly?

If there's any way to get these bindings and the dt change accepted.
Or getting the code change accepted without them. If there isn't, then
there's no reason for me to put any more effort into this series and I
need to start looking at alternatives. Like forking a downstream copy
of this driver for my Android efforts. I'm trying very hard to avoid
this as much as I can, though. The more downstream variation I have,
the more maintenance work I have to do over time.

>
> > or a copy of the tables in v1 of this series, mostly due to a
> > misunderstanding, and was fairly asked to add them. That's this
> > revision. Would you consider accepting this after any fixes? Or is
> > this concept entirely dead in the water?
>
>
> The binding here is far away from what is in general acceptable DTS
> style, so in general this won't be easy to upstream. If we allow any
> crap to be sent post factum, what is the benefit for companies to
> actually took to community BEFORE they ship products? None, because that
> crap will be always sent after release with explanation "we cannot
> change now". Old platforms with Android bootloaders are in general
> encouraged to move to something decent, like U-boot.

I'm not even sure I can work around this by chainloading u-boot. With
some hoop jumping, I could read in the dt tables in u-boot, but I'm
not sure how simple it would be to write out a reserved memory table
to match what mainline currently expects. And I can't just replace the
entire boot stack due to secure boot.

The devices I'm talking about are not yet end of life, so it is
physically possible for them to get a bootloader update to conform to
the existing mainline model. But I'm just one guy trying to do 3rd
party support for these devices, I can't affect what Nvidia does with
the signed bootloader on these devices. I'd love to be able to swap
out an open source bootloader on these, but the secure boot setup
prevents that.

> 50 kB DTS is another point - I don't even understand why do you need it
> if you claim this is coming from bootloader.

Like mentioned in the commit message for the 50k lines of dt
additions, the existing bootloader will only write the trained values
to dt nodes that already exist. If it doesn't find the nodes, it'll
still do the training, but nothing will be written to the in-ram copy
of the kernel dtb.

Sincerely,
Aaron
