Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 157D8215F5B
	for <linux-tegra@vger.kernel.org>; Fri, 20 Dec 2024 13:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734702718; cv=none; b=mR/9hLldzx+IeGJTRSumdm4bhSKebFouYGJdywS43J+uo12iPCGJchMQvRSWP1hfYjSpABXeoeXn/9oN3jlzu0XYlMA2ALeI15MK5fy3aP8CtwQE/HpSJOwIJM6+YzPuIxI6MxFgqQxN+FFuX3/ZOiKnMRSFyPNEhe+QT7+RBxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734702718; c=relaxed/simple;
	bh=Kiopql5mG39LfjQkUHlAwpBzUinzcBdKBINb5tWgKVA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AsNkQ6i8KVoOHVBd1ltBaKOEZB9qipZ7glzHlpsOstOpWTnZ3Hr6NDDXvK9/tI2jtKqoxUkPlhgsmCGiSRvTzWV/9KTCbFmFUowz/S33yuiFoxAa8n9x4LjJVl4Ffk6YXwx22V31GQsiqW8b+UJ1+KuLKVtJyTVyqwDuPCZ9L8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Q5lQq5Eb; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Q5lQq5Eb"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-53df19bf6a9so2569144e87.1
        for <linux-tegra@vger.kernel.org>; Fri, 20 Dec 2024 05:51:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734702715; x=1735307515; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TYBFSCiCyUvyU043AbGfSFvGaAjaV7SOdDx6T/p1d0k=;
        b=Q5lQq5Ebv+hFH3KbxNSfklREX7eAv+M6AAbASV5fasIWqZt3aGWeQBpMCitysgNjup
         E0SmwjYaw7CE9Zw4nA7gzMcg9X9ha/0ns8Z9/HwFmifD6B7Fwn2gBARmH/mzehTVbfkZ
         hjn1qYF4FwCYuZXSqPti9qtVHkoZfCu/CpBdRMoXeEm41iNZeYVKWJrcvFhrq+VveHup
         c7fCZw0Uki4iB+mwrPriItU1CH588ku8Qp34tT6nbUvE2Pe4WK3wm28olqU0UI7ekvDp
         AfroiVIFj0Oxa58AhyS8l9W1si16mLWyDHm7jVkwAFu2krbUh3XXi4FTyIBd5L2tPO5T
         xVcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734702715; x=1735307515;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TYBFSCiCyUvyU043AbGfSFvGaAjaV7SOdDx6T/p1d0k=;
        b=lISLftc0vtyy0FwO8liNadQoJQFOulj0Y2xYe1v0SJPhs52zi46BuRGYgO2xfjgBf9
         1+l4Fsfdzq98B53hDeAYN+YUprO6e7A7B5rXE3esfYuGj0vChycJ9JPEfj/D63gKiF/5
         D+77hiEivnWK+4gBeJyfHWUPoBaij/sx0p7xGzjc0T/TztcokFF8oCPWAVEo6UAxoORN
         Uj6bb52aeTDV5xuJWD5p+N/X6wCd1qk9YldPMuHDKAVWhAE3IsreACY4iJyifyBONFnP
         PIq2UYZ+lEkqviTU2cR48DUA+1aLIPj7RzkOjNzF2dWZBba2FWUAHNRuEXF4qA5URokR
         T4hA==
X-Forwarded-Encrypted: i=1; AJvYcCUxT7GRqk0CEYL7CsH76MRj5jLAS5fqGHV32RRzKSW9Hqae1PJ0A2zpWHPtB8CK7/H5+1/9Lp3ft3yt2Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwFqbRJYkkFgIVCk6bwO+0fW+NyGCz+JJ/p6d4Zv6qAiNc3jhVx
	qEgVOrvD5WTM9uQzx2Q5WetxsdECZh5T5AJwFHr2zZQqV9BesrfK+obJeTRDLw2MJ5JMHNqdnRl
	5S8PWaBo1CQ7U/cRz1Q5gkGKvoKQ7HHzKY9oq9g==
X-Gm-Gg: ASbGncsKVyi//JbAJM68tlr7f6asChrmxLB9kyehnK7LLk4MCPjwrDFGw9uXNUw7MUc
	yJZtNLepaPJjRtbVM4nxmI+6oghu1+p1OP4CwFw==
X-Google-Smtp-Source: AGHT+IHhIuSmiu4+8ioI5FddxI9wUmYb1zP202zwwnmqh+tea3FqXsZpqk55RmP/DtXsDzk/LJawcMCLKsSyVMIK/bk=
X-Received: by 2002:a05:6512:31d3:b0:540:1e5e:3876 with SMTP id
 2adb3069b0e04-5422957ace2mr1052406e87.52.1734702715210; Fri, 20 Dec 2024
 05:51:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241217153249.5712-1-pshete@nvidia.com>
In-Reply-To: <20241217153249.5712-1-pshete@nvidia.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 20 Dec 2024 14:51:43 +0100
Message-ID: <CACRpkdaYwhy+-q=gQjT6WR9Ye8tgK6G9Pr3xzP7srxEH2R74sg@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl-tegra: Add config property GPIO mode
To: Prathamesh Shete <pshete@nvidia.com>
Cc: thierry.reding@gmail.com, jonathanh@nvidia.com, peng.fan@nxp.com, 
	linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Prathamesh,

thanks for your patch!

a question here:

On Tue, Dec 17, 2024 at 4:33=E2=80=AFPM Prathamesh Shete <pshete@nvidia.com=
> wrote:

> The SFIO/GPIO select bit is a crucial part of Tegra's pin multiplexing
> system:
> - When set to 1, the pin operates in SFIO mode, controlled by the
>   pin's assigned special function.
> - When set to 0, the pin operates as a general-purpose GPIO.
>
> This SFIO/GPIO select bit that is set for a given pin is not displayed,
> adding the support to retrieve this information from the
> pinmux set for each pin.
>
> Signed-off-by: Prathamesh Shete <pshete@nvidia.com>

If the description is correct, why is this bit not unconditionally
set in
tegra_pinctrl_gpio_request_enable()
and unconditionally cleared in
tegra_pinctrl_gpio_disable_free()
?

Yours,
Linus Walleij
