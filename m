Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 982C52550D5
	for <linux-tegra@vger.kernel.org>; Tue, 28 Apr 2026 09:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777367741; cv=none; b=XPcpUgXceZOyV4i10rHuwvIpSnuvl0+88yVAYmRFh+rhBbfrUB4PrKI8p6pEyHpcmwRnJPNJkntvhnagYWzfKUzS2cVcfjMXscKMqxQmiQ6ZwRGnDMl3xzj+29hDXeVDWojhbOIBuOwaa6R1JzJTouLU2yEd4cXStYOhSbNW8L8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777367741; c=relaxed/simple;
	bh=awpELMqLUdC0kYnkjNOuts6q9isGcctAxwhBeu23+34=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MIX1/iM7B5wdNiF/KnYkpe7zMoowp8t/VhKPlqFH8PjWsBMKBHDGlaf8w6Jhb2WekIcG5sun8Byg25MwTKYb6XjZ+ozOhxF21Z2zoN4sDeL0mmDXANJhTq7PJj9I6NAft5Pk3iGqUzeXBDNuBemuM8qV656E0DRuvM57YIGXZWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p1bFoL3O; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p1bFoL3O"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59CD5C2BCB8
	for <linux-tegra@vger.kernel.org>; Tue, 28 Apr 2026 09:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777367741;
	bh=awpELMqLUdC0kYnkjNOuts6q9isGcctAxwhBeu23+34=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=p1bFoL3ONb2N9LyVXGx6WTlxyeup27+PT+AG56WKrCC13lT0zePBhzWossmwclYJN
	 WAj7ssur5Hfek/KJ8bFn8DkUvMun1O4+g21SFNzydG3z2PUMdnfqy6D1ETWKnVGuIt
	 P3twbD2h0F1q/T8hEYkJvhyh+zMBWUIxwbphzP8qnd+PGYPHRwjsDCe7Z0MmFrZnVN
	 W70VMbITlSt0nFSVo+i56iumi3+D9DCizEJVIPyiV8J+2gvNpDcKgZJG5kq9b3jOmm
	 Sjr6Etwcy9W17VNnHvNsmf8auoiZWIlyy1/tynkmUAHKkZj0o39ZzOG+xGQqLoiwJQ
	 mbAF4fY/M4nwQ==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5a337552604so10248486e87.2
        for <linux-tegra@vger.kernel.org>; Tue, 28 Apr 2026 02:15:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+sPd0F0TQFL8Z9Oz0WNfMES+V6Dbkjl5IB+ydHFGjyb1gEeMnJmObqlbaGq/3s3w511U3DSb8DuHUKxw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxhuH8aJ2ll5bLIslTTI4kd96h8FRyax8FIjf9CoIEny/cuIbwP
	2zalweToJliWPohqlDc5JXaH0hzqDZJDQ3+b3Xc8hZSHR6HD8jb/uDWkuHGecE9Mw1/tOoJ//4l
	9QU1FflPJRaUieDT2ln9eeWTEBkxbVTY=
X-Received: by 2002:a05:6512:3984:b0:5a4:ab6:81ac with SMTP id
 2adb3069b0e04-5a7466229b2mr713237e87.34.1777367739994; Tue, 28 Apr 2026
 02:15:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260410111047.309798-3-krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260410111047.309798-3-krzysztof.kozlowski@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 28 Apr 2026 11:15:28 +0200
X-Gmail-Original-Message-ID: <CAD++jLk6e0mATHVKdCifmNWxercHeAs8EZWmC_BNLuNWagk2gQ@mail.gmail.com>
X-Gm-Features: AVHnY4JjDqOCD7g_W9kH7halVekL6hGvEDu2BPCJ-xFboqoZ_gLn0TH30VkPJLk
Message-ID: <CAD++jLk6e0mATHVKdCifmNWxercHeAs8EZWmC_BNLuNWagk2gQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: nvidia,tegra234: Add missing
 required block
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Prathamesh Shete <pshete@nvidia.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 10, 2026 at 1:10=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:

> Binding should require 'reg' property, because address space cannot be
> missing in the hardware and is already needed by the Linux drivers.
> Require also 'compatible' by convention, although it is not strictly
> necessary.
>
> Fixes: 857982138b79 ("dt-bindings: pinctrl: Document Tegra234 pin control=
lers")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Patch applied to the pinctrl tree.

Yours,
Linus Walleij
