Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAC1E370D6F
	for <linux-tegra@vger.kernel.org>; Thu,  2 Apr 2026 08:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775117417; cv=none; b=QKjRRc1jWGXhc0pKcRqZqWkf7o1yVYsjj+AUqKlSmwLkAGVkm5M4zReqhEc6z0g5qcPkgndRoPDwhzqOeQSMeQh7GAWZpoRJbfVOaJvPicLKgCQX0Vwzj8QZQtKme1c58pZ0DttU2zh7tAbX6UjJGn+jkJqCuGftKqzchvYV7s0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775117417; c=relaxed/simple;
	bh=1ErZZ9iqXxXbtj21h3uqwzu5ceU/lJZe1jJR5txvioo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aV5GEdZws5/ZxTN1PbTqq3ElGM2Nv1rHE6AflrWDGlyxa3VlpVCq+tPtXWvQWfZXBY/L5VlYxboyLQZSBAQNHYBaU92S1w/GVMAqsNlf5JOJ0PKJkO1E5ciRLBAHJzpgZB/FiWxLYHHe/bxVSsFU6+WlKVOt9uCsY7jzu1XIzPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JfwJC4BB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JfwJC4BB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F7EAC19423
	for <linux-tegra@vger.kernel.org>; Thu,  2 Apr 2026 08:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775117416;
	bh=1ErZZ9iqXxXbtj21h3uqwzu5ceU/lJZe1jJR5txvioo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=JfwJC4BBd0/61GAPdIRvIrjnk12ZmB2/RmCTHoDRn3zeaOmL7Y7vTU/f72xrxptx6
	 3UVV0OMRyjO8bHoEXs9/Dtcwy6rU4m75hab9wIjJF6SmnKeE2vDRF9axq8c1yA2cmj
	 57zgYDgnjX++hcU1+GWO7Of4fDL+XelBwe5Ljkz3I6ri6jNHIgX9OVZIGygFhDqghj
	 dFjCE7X2FAQT6jcPl6uPraBKlLX2lQzNVASFOfyFj1kOQkygOOijqfv2BVgJWPeXxF
	 3oPd7HV53mfMJztGW/uBmJoF2Ba9jUFiMbKb5T0+cd/6R86DJABtoMXctG8UxpV3rc
	 fXOPlBISv8uOQ==
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-38bcda08c76so5732211fa.0
        for <linux-tegra@vger.kernel.org>; Thu, 02 Apr 2026 01:10:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVLIaW5vLFdWKc24J9G64cJhjDy5oucftAl925bJYstVxTpYVn9iV4ON71T9DSh/3aMzu5aTGPkZ6KTLA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwI3CS2M5gkzjlg3uxuyTHCi5SoEnHVCaIdC4DrgJfmCfA22JQ1
	d4QAYoYgFfHj9Rzuyv01fciRZauTkAbR+krKHxsl4gphVEGN10bxgToTqm9mEORfwur8BJnn/o3
	AKoyTj3qekET8nVoOyQn1y4UkVShMgdGELXsIeA1T/A==
X-Received: by 2002:a05:6512:3042:b0:5a2:b3d8:443b with SMTP id
 2adb3069b0e04-5a2c1f2ef47mr2489312e87.43.1775117415273; Thu, 02 Apr 2026
 01:10:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260401133441.47641-1-jonathanh@nvidia.com>
In-Reply-To: <20260401133441.47641-1-jonathanh@nvidia.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Thu, 2 Apr 2026 10:10:03 +0200
X-Gmail-Original-Message-ID: <CAMRc=Me4-KS0=GL8SdwnhzP-YYWoYZpyzciS1L1iF=ip=1FQ9g@mail.gmail.com>
X-Gm-Features: AQROBzDh98KNbk0WwwrvUlSXp1jThukUEEB-lhC1VmD3kvI-VbYGncAo9q_Necg
Message-ID: <CAMRc=Me4-KS0=GL8SdwnhzP-YYWoYZpyzciS1L1iF=ip=1FQ9g@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: Make deferral warnings debug messages
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 1, 2026 at 3:35=E2=80=AFPM Jon Hunter <jonathanh@nvidia.com> wr=
ote:
>
> With the recent addition of the shared GPIO support, warning messages
> such as the following are being observed ...
>
>  reg-fixed-voltage regulator-vdd-3v3-pcie: cannot find GPIO chip
>   gpiolib_shared.proxy.6, deferring
>
> These are seen even with GPIO_SHARED_PROXY=3Dy.
>
> Given that the GPIOs are successfully found a bit later during boot and
> the code is intentionally returning -EPROBE_DEFER when they are not
> found, downgrade these messages to debug prints to avoid unnecessary
> warnings being observed.
>
> Note that although the 'cannot find GPIO line' warning has not been
> observed in this case, it seems reasonable to make this print a debug
> print for consistency too.
>
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---

Yes, this makes sense. FYI I also have a grand plan of introducing
support for fw_devlink for software nodes and assigning them to shared
proxies with the aim of them respecting the probe order that way.

Bart
