Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C29DB2D1901
	for <linux-tegra@vger.kernel.org>; Mon, 20 Oct 2025 19:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760987967; cv=none; b=PJKinP9BZ8vPG/sXkAZhtuhYBapD+gbRyXLySPySGef+DNd9wMAPWEEHPsSctj5lFIMwm8GLe8yuAOgNQlO1kLfV0RHMOAYkeV0AXrQf8Bp86RHP4XkuW7faH8J1jLuR2cehaw7B6aRcurLx4RGLgC8BOd3IwIPN/x36odsMEVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760987967; c=relaxed/simple;
	bh=YXpkBBmrwSLjuLYxkx+3i4ZtUHvDplauNtUTFwWBGco=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q1/j3vREqvNfHBc4DTeMiSzYZyGISzzZxY6+LXD4b8gbq4JD0iU9oBWjrCAb3UWNQTIbhZ7yFFPivJd/9raYig2gsJ19MCbouI2+vpvtB45kj62u5D8H8DVBwzJ5wxLB32H1FgOUitxt5C3PEZY8vGAQnstYR1YSWIC4/G7ykos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kdd3YdFc; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kdd3YdFc"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-57edfeaa05aso5408603e87.0
        for <linux-tegra@vger.kernel.org>; Mon, 20 Oct 2025 12:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760987964; x=1761592764; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YXpkBBmrwSLjuLYxkx+3i4ZtUHvDplauNtUTFwWBGco=;
        b=Kdd3YdFcMyrvPRoxy4FtZJGCj9hQyARmmshnlMe3lA41voG47/kTWHTosvtnin9DBr
         GNrJwwhgFAR8swu8NsZO20DcnHn4uQ3PjqjFfRpQ0Lyi1e09IANp1xbX6Wb0O/a7MSII
         +/0uqxHMKFZeidtvasWZMjCyujXJNhpGS+uAYDRQdbDThvUCvXoLUe5Vy9bM9O2RIqhW
         szrXgSd8z33mdRgKgr893RnZvk3XbeoeYhDsE0fdtIcCwQETZX2utHC95pycz0p4whPZ
         +5ZRj6GSltJ71vBN3jfU0ktsX6mAxtEC51vnC1U6qXj/mJb5W7JKwl/qF115jdggm0+1
         D2wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760987964; x=1761592764;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YXpkBBmrwSLjuLYxkx+3i4ZtUHvDplauNtUTFwWBGco=;
        b=eCzBHx1jCCPeepXnINRxLGR8yTjYl7BRyP+SOrCWnUoyqW8Z21rgL6x4842ulB2xRQ
         YbB/rHLSOSlww/cnNwem41q6YjKhM9zdw22jhaRqdCLZNTf7Fd8eeMwgRsOu7gWWl1ie
         If5sK4zj23pgKeRTHB6S8v/IApZvqKHHzjFyT6oGUnbqnmGl+CqbLfV5DHvVEUpo9BUC
         vOz0WM/Scax3PKiFgKfyH3e9o25dgwjMNqAL8x+SxtPyJ58Xrrdh1WWl9OPSzugn/Cde
         5rPJRCa0Q4GmwTFZGw/4MR6nmKfzkcP/V4cKKRNio+U0pVr1+qNb16Pm5VRSZHQgWmDR
         Mu0g==
X-Forwarded-Encrypted: i=1; AJvYcCU7w8/esDju/z1yswIeCb/cV5HNRuTY+AtXCjc4DPUgwKt5/4PHXm8hJIbovzHqDs2Xcute2Ix8LvZZdQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzHCGvcLuAd89IcxaDciRNHBrQy0GhxCHwRCZ7YMBcywmk9FCCr
	qij5wh5FJH2jC4GYy8ko4qbtBnVh88DhWSNidp4hbgIZXFhex/gaWUT5w1PviR6BvvmeCiyUjh9
	P5jgYXMAVc22kcawQCty8h86p6PZ2eoI=
X-Gm-Gg: ASbGncs1VKjYPfVn4OlOMf9rr8eLmyG4Wy/ssfM06X3HrzTanRAlUv2MwaYHvSvPYTQ
	bEBmptTCzu6MVi8zTMfqn1FbLfNd8bRiTyRjBYpzfYgyKR01V61eNte0nDa9tLAeq9rdmlwgzzN
	7OXdob42Sb2x+34WkOsFh5EkxkhZN72QulsANA8q+o0mW+GOLKncV9ucsGuAgebe1QaT6FxTpDG
	/wQqh7SY9Ap/+d+7YIT4sQwIEPP7T9GKySOvuUolsbL6sNxpCkXclDiP39M8iMKpvtY+HI4QohT
	Mtb/aZczQAxZ2qBRjJy7ub2rfRTh
X-Google-Smtp-Source: AGHT+IEvSQqoPC0w5PqHnyoNSr3taVqbpjv29jeiklwEL1fN7434TEmXmWt3EGss8QKd/DksBI8+cWWNCno4+2/Z7ZY=
X-Received: by 2002:a05:6512:1545:10b0:591:eb00:9795 with SMTP id
 2adb3069b0e04-591eb00988amr18089e87.13.1760987963720; Mon, 20 Oct 2025
 12:19:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250513-tx2nx-role-switch-v1-1-d92ea1870ea5@gmail.com> <a3833c6b-5574-4aaf-86cc-66c10801ff3a@nvidia.com>
In-Reply-To: <a3833c6b-5574-4aaf-86cc-66c10801ff3a@nvidia.com>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Mon, 20 Oct 2025 14:19:12 -0500
X-Gm-Features: AS18NWDPp-wH8uYhmDLfsUgIzuO_wAf4YraXF5LgQ1r-UO3sGLpOYdxnVLvjeiQ
Message-ID: <CALHNRZ-wcEf-3ekk0wGxdGw0O5HiTnFUwFRxyKAikQkkWDjteA@mail.gmail.com>
Subject: Re: [PATCH] arm64: tegra: Remove otg id gpio from Jetson TX2 NX
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 17, 2025 at 8:36=E2=80=AFAM Jon Hunter <jonathanh@nvidia.com> w=
rote:
>
>
>
> On 13/05/2025 22:10, Aaron Kling via B4 Relay wrote:
> > From: Aaron Kling <webgeek1234@gmail.com>
> >
> > The p3509 carrier board does not connect the id gpio. Prior to this, th=
e
> > gpio role switch driver could not detect the mode of the otg port.
> >
>
> We should add a fixes tag here.

 Do I need to send another revision for this, or should it be added
when picked up? If the latter, this is another reminder about picking
this up.

Aaron
