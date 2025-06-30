Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38B871EBA0D;
	Mon, 30 Jun 2025 19:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751311580; cv=none; b=j1Ow89UvfMEHTSktW8u+jX/R9I6adJ2YYDkuPk/O0W0PkeTSl23oixB6dsp2catAFig6oRP5GnhB1bA3GXuYPcdBnYFyrC2G8UJOqViNjxfwp42gDPWNiy8JfsPzdasltpM4pRZwz6t6JaUkyzcXleP+pS4jWVtHfRZx6FnRklY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751311580; c=relaxed/simple;
	bh=wKRcjJ8IJ5I1/hcwkxE8abvJ8pZVh3LuCx0XVjbKl3k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ye093KeGEF8260XAWwwxUF2p+BFxOqkAOJ8yeSkYbpu0USjYRriHv35n8if8rSn7q2LWN6SwPAEK5dgXYoLeGOPgWdbnFjMLZiikcXklNZXOw9++yRCiUnMc1vPApZF0guIvEseNBM92j/Xr2Cwt2ERpKiHjPICXqACEXAlljhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mNSsVETm; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mNSsVETm"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-553dceb345eso2994280e87.1;
        Mon, 30 Jun 2025 12:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751311577; x=1751916377; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wKRcjJ8IJ5I1/hcwkxE8abvJ8pZVh3LuCx0XVjbKl3k=;
        b=mNSsVETmSLc1f7dJl2x1G+u+EzgZHz1kkOwrZ/LSp1HMPA/5FpGUD9D3tMQGINoh55
         50PFAk/+YYO2lu5NXuQqEcsDxyDJJPAyjt7n9R7XYlo3RE0Yhc1LYe3G83ITLFfD2HTN
         AFWaoqfuEd0w09/bRuzmMPfPq3Xfq3c6Qi+dyRX8qCYWYTkPPZczTlU2fzRh26VWPROL
         MaCd7JRMEas+jH3bathYtwCI1EtW87FieFnJ/Jg7BtVu0Re+USG2CLsOgUk5HOOtoit7
         XBJKZSi/COWdEbo0kDm5Gy6cpZ6lUpvBhq/060a3Jg86ZocpJiiMCBhHrfuOIT++1itY
         hcHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751311577; x=1751916377;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wKRcjJ8IJ5I1/hcwkxE8abvJ8pZVh3LuCx0XVjbKl3k=;
        b=o/vOGyfRbcrmryDg/qEwjlerFdtPWa7B6O6ybhCXyCPbXFkUAyRj7zux/684+b0zpV
         n2UkiAEhy4gcXo6TG9SYqYOdbV7bzMUOEdrN1E87iv7tOdupfRhT5tRclKk/Qh54NMLi
         PtNNoQcZrk5VturddPizVtrgmediKZj/9Rh2Fu5JjnYZEXU8zxuAyvW4/c/rfD4CC1ko
         ma7GMc6CSp/zDaHys1YwyQLBgl6Bn125F0fodbqykkPefE/ZVTOv8jB4NjzBm5bpkuA1
         cJa4mHNYgtfCJ/ZIyi5jpHDKqwTyKYiBUUa6iJCAHNe1qbkK620j2iRXz14KNyGMc5R1
         JvKg==
X-Forwarded-Encrypted: i=1; AJvYcCVkQawQOvSwU4/Fn/xLnZSyFn/isL74gtXk1zK/ErF0IVovYJXyLWC8hpkzOLnpPdc7psS+LUr0kRVm@vger.kernel.org, AJvYcCWzW5atgHnyMU3CqJ6Y0sDjsR8J+a9WNhODxfvURWHUhN72z9uUOYwrK5q5wRmYF88TvyK55JgmxOdS7xOd@vger.kernel.org, AJvYcCXDqnGsRlwrhdd3qdxPadhUu61hJMEbFSveIC2nL6BVBr7mFYGPJympdvB8MDTBGNVjrDWTj6/QU1LGoWQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx77ZCaq6F7hKdmjhszIr0w0YOe+DAy63i2jz0nkT2X7UdPTVWw
	zFnXhnj8IfV24uXFP+d+roPbxTzGfM+I7hWZfwS4lXaYbL050gWN9goZupbIKaBKW4U9KJMQIHE
	aJRKFanpbCS9qq/m22mG2WU/9pRjmCaM=
X-Gm-Gg: ASbGncv5gCyHDnJavg6NTsfaPbyISVnxvvvHCErQdcR1wnb4NPP9mUb/Bx2E4J/JpGD
	v43XNayRW0drZFXohvz/PZGnARJ9RJiyTE1pN0sLuCvLRGYe7fDY6q53MXzN3NBUoGjFm6pI6sc
	Ocq4H9SJKMuobcEfYoTl40rTchgmMbvFeBIAmjKt60gQk=
X-Google-Smtp-Source: AGHT+IHnQj7y+Dl9g5kiC3I+E0jB7g5wgs7HmhJsfXnM4AlrTPCijnp0mIeFvDPT88kU7jYenEX31bWfp2XcsKVTEOQ=
X-Received: by 2002:a05:6512:e96:b0:553:314e:81f7 with SMTP id
 2adb3069b0e04-5550b817b57mr5015974e87.17.1751311577095; Mon, 30 Jun 2025
 12:26:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250508-tegra210-emc-dt-v2-0-d33dc20a1123@gmail.com>
 <qhhv27thjnbz7rtcfja767bpxjvwa6iivc2bphar7t2wobuzb7@aspkmrgp2ihy>
 <CALHNRZ-q7W9CfeD4ipmwFVqHm7oGfTgJpwNoVhfbSXFPDxF91Q@mail.gmail.com>
 <eba00bd5-fa1a-4cad-bb41-b395011235e1@kernel.org> <CALHNRZ_WPUM8wKSLcyyZm4jc9onBYiP3oLd=39k4=hoqLzHhrA@mail.gmail.com>
 <ckimvttxjgx44xhfql3nov3qbf35y73nbu3p4m63nqbi22vh37@6p2ji7he5toy> <CALHNRZ-r_U+ByS0FWxamv9ozzjBWdkqAh2wJOt3s3cMsX6K_kQ@mail.gmail.com>
In-Reply-To: <CALHNRZ-r_U+ByS0FWxamv9ozzjBWdkqAh2wJOt3s3cMsX6K_kQ@mail.gmail.com>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Mon, 30 Jun 2025 14:26:06 -0500
X-Gm-Features: Ac12FXyaTeW4lrs8R7FQvoMe70nThJ0r6JGE-5KdWbLLXq1Ag3ZQhyfvTrrx5-A
Message-ID: <CALHNRZ8qyu6wsTTnmRWtNgYL4XWR8G7TFammqTFPfHH5d==LbA@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] memory: tegra210-emc: Support Device Tree EMC Tables
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-tegra@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 28, 2025 at 12:41=E2=80=AFPM Aaron Kling <webgeek1234@gmail.com=
> wrote:
>
> On Thu, May 8, 2025 at 7:48=E2=80=AFAM Thierry Reding <thierry.reding@gma=
il.com> wrote:
> >
> > On Thu, May 08, 2025 at 07:27:52AM -0500, Aaron Kling wrote:
> > [...]
> > > The devices I'm talking about are not yet end of life, so it is
> > > physically possible for them to get a bootloader update to conform to
> > > the existing mainline model. But I'm just one guy trying to do 3rd
> > > party support for these devices, I can't affect what Nvidia does with
> > > the signed bootloader on these devices. I'd love to be able to swap
> > > out an open source bootloader on these, but the secure boot setup
> > > prevents that.
> >
> > I've reached out to our Android team internally to see if there's
> > anything we can realistically do about this.
> >
> > Thierry
>
> Thierry, has there been any feedback about this?
>

Reminder about this question. Has there been any response from the
Nvidia Android team? Or do I/we need to continue pursuing independent
solutions?

Aaron
