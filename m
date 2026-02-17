Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E13E36BCC3
	for <linux-tegra@vger.kernel.org>; Tue, 17 Feb 2026 14:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771337178; cv=none; b=ZlUmaAf3XiMcNTFEl6EKsXZTgPxhYmO8ocnV5Yfnqhw8xiF5vgpMWmDDyzYItxP5kMSFWygBgjj9PRuZZ/oAm1aTWlVZ2x3tG3c9XBnpoP5Lno8fHnUuIPZi/PHqMFh8uhkYVNLBj+pEemFwcM/1YG1qsgVefHY+oNuRVgWm044=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771337178; c=relaxed/simple;
	bh=jBz7t3I1DgJfYQpYN6QbdYGDrdNBkEnRWUIkLkg8cbU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YFzC/uGQ+qm3W+eP+FZeYRUXnC7bf/+Ln58pwH7puHGW2fNde9k62qTdTEBZic1d+3jLMgd9CDXYEeCyaD9YOgbXpqjbrwLXkfxiWGEKDc0yMXAPKD1y5CCVq4gy0knZ0tUhxd+TZFZPe6qjbJ6DP+xTK+zH8PjhOxsa4YP5IBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FeBB/uJb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FeBB/uJb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7073EC19424
	for <linux-tegra@vger.kernel.org>; Tue, 17 Feb 2026 14:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771337178;
	bh=jBz7t3I1DgJfYQpYN6QbdYGDrdNBkEnRWUIkLkg8cbU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=FeBB/uJbUt5ZpgC49WWNxrdwZ6iCPD9RZCaW8j5RE51VT6IywlxM5QcArqbZqwRT6
	 Jb976S76WIrJdNrYI8D4C3p4UGxGYvZeWcbzA6q9ugd+EQ5p6eKE9bOKkYizzh0WHa
	 KTxkJRnFtexIcro0J4A0pJ1b4YDn7Nlb6BJtkIiFCILZm6BKedgbrB81kvlRnYD8hP
	 M5sxI5gBQF/oPtqSX2IJ86wmeR3/zfn97PzJBnNNwxMKfOIbnkMHgJI7HzyICr6xgm
	 KBvfEztjiSgf0cUQLI4ubVg27vxlGbiTQrgUJ6g/icdFjL7jp6/xKKPETtQh9/m1dz
	 s/96UpwU5ByWA==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-59e5f52b13eso4158455e87.2
        for <linux-tegra@vger.kernel.org>; Tue, 17 Feb 2026 06:06:18 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXh3Up+f1wlgzurCbKLPhCLT8t92vgmApLIfCFpM/5WeI2jdtH3n4aeDBaAEWiQKB7pHlfUT2z+wCHUBw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzJfwntpWeuzVZ/SI/N0wGxPxSQuKfOeIyW2YzYC0R1236WVzR5
	frnNyq7px/VFyILdYxGqMKzfoD+Na9Q508TN/Hhi76eeuTI6UvNw7R9tDobHfW7DQrM6NQh75tc
	tjuiZ3yTqdVJzL9BNGdgoLO4eQ7odzZjXGahfKh64Pw==
X-Received: by 2002:a05:6512:3b27:b0:59d:dd50:f2e6 with SMTP id
 2adb3069b0e04-59f6d3590b7mr3186497e87.21.1771337177032; Tue, 17 Feb 2026
 06:06:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260217081431.1208351-1-pshete@nvidia.com> <CAMRc=McfztA2kf2S_4R8KYVnVFvAL7x0n3_O9BHh709L8Op9Dg@mail.gmail.com>
 <0e0588c6-3c5e-4458-bca2-0e6ba935c7b5@nvidia.com>
In-Reply-To: <0e0588c6-3c5e-4458-bca2-0e6ba935c7b5@nvidia.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Tue, 17 Feb 2026 15:06:03 +0100
X-Gmail-Original-Message-ID: <CAMRc=Me=KFG1x-OkNVq3uZ5E8xzLnoXbmKV6byDej-Czf4LfhA@mail.gmail.com>
X-Gm-Features: AaiRm529yUgSQMMvSW_z6Pn69G1bQKJtNc4MUopu4BpIYFT0g6WRwy1ZlZ5KaEA
Message-ID: <CAMRc=Me=KFG1x-OkNVq3uZ5E8xzLnoXbmKV6byDej-Czf4LfhA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] gpio: tegra186: Simplify GPIO line name prefix handling
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Prathamesh Shete <pshete@nvidia.com>, linusw@kernel.org, thierry.reding@gmail.com, 
	linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 17, 2026 at 2:29=E2=80=AFPM Jon Hunter <jonathanh@nvidia.com> w=
rote:
>
> >
> > I'm perfectly fine with patch 2/2 but this one is giving me a hard time=
. What
> > are we really gaining other than some questionable obfuscation? Keeping=
 the
> > dash in the format string makes more sense to me and if we ever reuse t=
he
> > prefix, we'll need to remember about it trimming it. I would drop this =
patch
> > and keep just 2/2.
>
> What we are gaining is by adding the '-' to the prefix directly in the
> tegra_gpio_soc structure, is that we no longer need the if-else clause
> in the code to add the dash if the prefix is valid. And this allows us
> to use the ternary operator instead.
>
> If we drop this patch, then after patch 2/2, we will end up with nested
> if-else clauses to handle the prefix and multi-socket cases.
>

I see. Ok, will pick this up after v7.0-rc1.

Bart
