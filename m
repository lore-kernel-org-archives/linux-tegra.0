Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0583E278E5D;
	Tue,  6 May 2025 10:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746528309; cv=none; b=d+Ev55zQJ8LA0BnhDNbIyt5aVXRpXDi/8Z1X/6UDj+LUMW253kwWfeJCdZ5NZjZUaRbBiZ9eV1YgRX5meSyuQNorhMjeyCuWhZdtsZfL3jEsVPCfb3BL2d+J4NCQr0s/ZkQF1rV3YaRx/5INZMmVj4levDjqw1CDCewbRqhu5Js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746528309; c=relaxed/simple;
	bh=NhZjj1rkjbCtGqFTYpEpAiOJI09NTrv2LMv9LzYCFxM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DefD5YqqLsQDc8AoxzXIvXUddXK10creyizJkHojdN7H7T9MGDJNO5EFlU1YJxDwS9Kxfr+q64fqG/RBuJ8rhMEGLd7yWX+keJjIHeUkRyxKO6dRLtV/izEgd1wAKwYUouHfpa1GU0D5xvpT72FYDMSlUkRtcRbzsCQM2bifOO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hfGkfnk0; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hfGkfnk0"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-549963b5551so6098152e87.2;
        Tue, 06 May 2025 03:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746528306; x=1747133106; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0S0fj9pxRR8b5jSD6MLFbjyTm1j4w1pUjEF4KfpSSsM=;
        b=hfGkfnk018PLewHy82znyTxiSsgRqmgaeCbdgJsGGRhuY88jxfG7InzNnVHqDGWZR5
         XAqF0vCLhgvFvc0KJ2SYq7n4lv0VKHqMblSOip69oL/XqqqwenkjcxvmMIi72+adKUMt
         1jhbdM/T2LJcbeMVWNrJgP9/vP8A705erK5xKX9KGl78GAP7Jl7fpD0h/9kX9Hur0YHw
         194VYafj6YjXvdOivMCM1WILLj8E2kWdtER/RaxcW9lqL7pUtQBfGCULTKd/O006UqlO
         l1ApUzer0dU1TvS7Dy21aIz2S0LD97YvQMt7viW8AsLBf31HSXCxxc75oQvUggMgdckw
         CPHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746528306; x=1747133106;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0S0fj9pxRR8b5jSD6MLFbjyTm1j4w1pUjEF4KfpSSsM=;
        b=MMd3M8IK/oEkM+Et7xDkKXQ70Oe0r1/Apl1PSy6upH9bpFdmb9Fja0YCl+bCUIuGku
         w71MYi1YRQWnqQdEUeYe6ktephY0f5FaTxwT6dsYaSRc85UwidL9dG07VU9mQkiKvpgO
         7eGMSL/l3wSd+Nzp8JHK9NpGYQG/8NMkUahDL4kNA/XaTd1HldfZT/pt5mNlZAUzopOP
         h4aNZb/C/Fc233uovU8//vcDM2ih0WmBfKu/rrnRfXtyvANWa3o3AfQs8Yhpl+jvsA8U
         oQQ38mGghaA60LPDXo0oOwXo2yGxGFXmc+XMqe48Qou/Fkm+bBu/GPdEb1b6NNWGkzYd
         xFOw==
X-Forwarded-Encrypted: i=1; AJvYcCU1O4u+WX0evrnl2HULUY/fL6L3EwWjPqPb3cznFQa6fbzrhXtLHRkq1IlfLl/RsfOawCywyW0mkmM4OXs=@vger.kernel.org, AJvYcCW3A0UE/kJ28J1dFzqwAMcEFOG3h4MhVkVKDkmN9ZLXjeYVOpNJPJEui7KY39+Fqp/KbZmfJ+fpcF+CM9o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyd6sZI+tnP3VuwTsg9wO3m+LcZc+VJi9tE4Y1acc/t4hBqdyMt
	w/PoN64IplfyKJy2ESyGn0Rg6BiteQt3kHGrmUU+MBn+ZrHHMRsGX/zyWEh2teFU+7yMC5tngZ7
	HlPnZTX31c4GfbzjQx1D/08yoju8=
X-Gm-Gg: ASbGncsBtCIZ6xEdklArSk1C4L69h1HlY5TTzOA+Lpng9Qg7+gn7Y/sNp9ryUIFk7Ut
	yCs+ZlqfpKuUYHor+b/XndZ8EkALy/+rYNsBT6nJTzzmuXzJavBLbW2Tu8Tu/gePVznS4kSA6PL
	6+UzWKBVbltgxrZh67O5W8EA3l1b9+uxxG0A==
X-Google-Smtp-Source: AGHT+IH9PNd8hlxiWlK5qk2aXHbk+UNbCg3lFJraFSfHUkRwwn4of15fI+cwgYdFXfyeSGxNFfF+9OOqcNwyb29hug4=
X-Received: by 2002:a05:6512:3c99:b0:544:ffbe:cd22 with SMTP id
 2adb3069b0e04-54fb4a9804dmr786783e87.46.1746528305662; Tue, 06 May 2025
 03:45:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250404-xusb-peripheral-v1-1-99c184b9bf5f@gmail.com>
 <CALHNRZ_QUY7NPH87RYqFWEy4PkTgV5uZVZ6hh3sbe=U_8ga2jQ@mail.gmail.com>
 <CALHNRZ9s5EdL3vapyJS4TdT=v5v_QG-=n8ABNJDLU4B-7w+wRw@mail.gmail.com>
 <CALHNRZ96Cs8+gyyb=_jTpvCq--uF3P1s8_m7t25nN_vPx0ELXA@mail.gmail.com>
 <66776953-ef1d-40ac-9d4b-a35a6ebae20c@nvidia.com> <CALHNRZ8uXZQObwQBC-sLudUdtprM24qU5yYdb4D3FEP2AQVkmQ@mail.gmail.com>
 <b96ab3b0-3afb-4918-8db8-f6cab45576fd@nvidia.com>
In-Reply-To: <b96ab3b0-3afb-4918-8db8-f6cab45576fd@nvidia.com>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Tue, 6 May 2025 05:44:53 -0500
X-Gm-Features: ATxdqUFydWW4ew7f9iRG9xOkB-y1i5aCY8W2iNBRJzuaeuS8Q9cA-ObsrH6XuA4
Message-ID: <CALHNRZ9tgWTo8tUB1+Whf68CYu+qiMhO_S+KC2R0kFbDAjT9OQ@mail.gmail.com>
Subject: Re: [PATCH] phy: tegra: xusb: Default otg mode to peripheral
To: Jon Hunter <jonathanh@nvidia.com>
Cc: JC Kuo <jckuo@nvidia.com>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	linux-phy@lists.infradead.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 6, 2025 at 5:30=E2=80=AFAM Jon Hunter <jonathanh@nvidia.com> wr=
ote:
>
>
> On 06/05/2025 11:03, Aaron Kling wrote:
>
> ...
>
> >> Sorry for the delay. I have had a look at this patch and I am not sure
> >> about this. The function you are changing is called
> >> 'tegra_xusb_parse_usb_role_default_mode' and it is doing precisely wha=
t
> >> it was intended to do. In other words, parse device-tree and set the
> >> mode accordingly. So forcing the mode in this function does not feel
> >> correct.
> >>
> >> Also from the description it is not 100% clear to me the exact scenari=
o
> >> where this is really a problem.
> >
> > My specific use case is booting AOSP/Android on Tegra devices using
> > mainline support. Android debug bridge is configured to use xudc on
> > the otg ports. As mainline is currently set up, the default usb role
> > is 'none'. So if I boot a unit with a usb cable already plugged into
> > the debug port, I cannot access adb.
> >
> > I originally fixed this by setting role-switch-default-mode in the
> > device tree for every device I'm targeting. Then I looked at just
> > defaulting to peripheral mode in code. And as mentioned in the commit
> > message, other usb drivers already default to peripheral mode instead
> > of none. I'm open to other solutions, but requiring every device tree
> > to set a default role doesn't seem like a good solution either.
>
> Thanks for the background. I see that the
> Documentation/devicetree/bindings/usb/usb-drd.yaml states that ...
>
>    role-switch-default-mode:
>      description:
>        Indicates if usb-role-switch is enabled, the device default operat=
ion
>        mode of controller while usb role is USB_ROLE_NONE.
>      $ref: /schemas/types.yaml#/definitions/string
>      enum: [host, peripheral]
>      default: peripheral
>
> Rather than reference 'synopsys dwc3' which is not related to the Tegra,
> it would be better to update the binding doc for Tegra XUSB padctl device
> to list this property and define the default mode.

Let me make sure I understand you correctly. You're requesting to
update the binding as above, listing peripheral as default when unset;
fix my commit message; and leave my code change as-is? I'm unclear on
if the code is okay as-is or not.

Sincerely,
Aaron Kling
