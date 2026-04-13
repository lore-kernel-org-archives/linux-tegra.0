Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C478D3B7774
	for <linux-tegra@vger.kernel.org>; Mon, 13 Apr 2026 10:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776074575; cv=none; b=HCgnD2Q1l+DcLIQVxTdGTuSXLu0AIMm8zix/BECY4GXufGqE2ATx3svySB3Oq3Xl9s2J6TWxRrpJAZVWN1D3eQJbkN1MqpKuHsaYysIAsE0oMZLPp3oXNzUyoo6m7b+yu94bDclBLCK9GDOcxZYMAok8RRSigegZa376S61gK8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776074575; c=relaxed/simple;
	bh=jCS1ocvAKv8JD6gmGKMlriFZJ5S9rhifA0MxGTZuyqU=;
	h=Message-ID:Date:Content-Type:MIME-Version:From:To:Cc:Subject:
	 In-Reply-To:References; b=en7kYTe3wJMmRlegLwvhnh19RHQtXhWNpITyCtOooHMy06CMy5F8OLonLyrwPGJIeE3LDulUjqqfx9yDL5iXSg3quQmXrRwoU/8kOeIccpxUd6jzG2ejVdQRdSz/AIXNbX5Bx+hwZGxjDx4D7jF52xMDms3k+qzoxTcYG+jHKK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jQcsB2Am; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jQcsB2Am"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-671ab90fc1fso351977a12.0
        for <linux-tegra@vger.kernel.org>; Mon, 13 Apr 2026 03:02:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776074572; x=1776679372; darn=vger.kernel.org;
        h=references:in-reply-to:subject:cc:to:from:content-transfer-encoding
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jCS1ocvAKv8JD6gmGKMlriFZJ5S9rhifA0MxGTZuyqU=;
        b=jQcsB2AmJ1gF6ptynG4aAp4nT2UuZUSUBocZmeMqbiaZY9WijE4C0HI1HqQ8LGlhdx
         CU+0M8QXUCt1QXRbC/YRFNdOXGziW/ZmUXQw/r1QQmaVIJahF3vbDqRkQHOjZyALOy7l
         P/xfScz6pj7kzmUhBJ4G243lVZifmnyUfpkZ2hVkXKizdUTiK531kjNhqGhvFu9IZBmS
         5ljVnU6qtDrFbUBpNuSKezmvsiUKpC/rvG/A+xrqqzjnsknwpPAHYgIEsTLZJoszi2rU
         s5nsFyGBYm+gFxed3jcZW/onfqNL+yfoypityKuCSv4oVnHrVZedegAynusFEaoiRlgv
         MCjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776074572; x=1776679372;
        h=references:in-reply-to:subject:cc:to:from:content-transfer-encoding
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jCS1ocvAKv8JD6gmGKMlriFZJ5S9rhifA0MxGTZuyqU=;
        b=kHibsmYjk3sJLtRsqBYWFyjw/lTAkROcLUx3Pvv5AW2WSTKgxfq8phr/VZQrmWon0P
         4Ill54iKzPq+oqDqfzVA+1/r8PCk42OejjeZPvZMfEulKYN5neIiZUSMUEEI4EuTsVhk
         zVQV9OuUpHWbkrsLPWsP6wC9U7jlfSNvHWhkYtpYviuMrZzWDZrfUBhLb7wwrs7Qr6sr
         nzgSVH4D9GY7Uh53GaM3VLgaSq4JyYBAUJiMIXkF3dQoaRW9P/2S1iRiqlc1R9hdyo3p
         27cQtth3tWEuVADRan+is9nPuBgaMmR1glYNvea4JxYcpOFpbSbjJyGfZ5IAMd7Ndwzi
         GjuA==
X-Gm-Message-State: AOJu0YwJ5H6M3YihaCxrIe0VbQEpKhHxa3g+1TcMHTXqfscsl1beJUKK
	Pmr6xVKpPq0+APJIeyx45RNdVwumt+FBWxkyfXoxm8dmgJgUdBjoorvH
X-Gm-Gg: AeBDievOh2F4AhDUNuGVlFGUiQXKY0cobX/D32kL/yB0D4nrNjp4y+7uyEjmlxpDFxH
	qro+UmgAhR05k/KDbDqSTUwhSnRopzJcheoKi4B3670iHD6Hd9WCKwgNwCvWe61pqsJKb7r3pBk
	4mJ3USoOUT9syVNwXr4hWfkNaUfxWLBbw0+xXFhD8kUnDW9oZSVGt1d5JjJpCnj464jxo70eRb9
	EuZ57BH1uIrDsqV6GM7ViJuUT1RHXLA/P+8F6tMDj55h/KP8eNjbqZ0Ic3mGMOXUSgu/2DBugpo
	bDGirdtdNvjl7VIQYoLAfyf3rFkMlGlUu8ME6aXaSlBBhnggYd4TlDs3rF+5K5MnpEEL5BddEll
	JRERu7GsgnMdJf/zyYHDhkvXSA4jmVNu4p4Jgk7IKHxxu+DpYFabit4pmEQi+dSMRK1bFq6hi2t
	S20nExmajvb3Sx1MKSfKgu/HVs2LJwOHwfgK8HfRpYPsHZL5z6bHXSa3YzmFihtfl7HrPHZx9HO
	I9cxkIO7T7hvoKpdu2TqF5UIVYDMM0dwKN6FxYbc+XkQ+gX0aJyoUxSL+k5D0+oasPOGdzJ
X-Received: by 2002:a05:6402:50c9:b0:670:8b7b:5004 with SMTP id 4fb4d7f45d1cf-6708b7b512amr5945847a12.25.1776074571883;
        Mon, 13 Apr 2026 03:02:51 -0700 (PDT)
Received: from ahossu.localdomain ([88.202.160.248])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-670702f071dsm2193723a12.4.2026.04.13.03.02.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 03:02:50 -0700 (PDT)
Message-ID: <69dcbf4a.050a0220.1d6d81.c4df@mx.google.com>
Date: Mon, 13 Apr 2026 03:02:50 -0700 (PDT)
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Alexandru Hossu <hossu.alexandru@gmail.com>
To: Dan Carpenter <error27@gmail.com>
Cc: linux-tegra@vger.kernel.org, marvin24@gmx.de, gregkh@linuxfoundation.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/5] staging: nvec: fix pm_power_off teardown in tegra_nvec_remove()
In-Reply-To: <20260412205057.386856-4-hossu.alexandru@gmail.com>
References: <20260412205057.386856-4-hossu.alexandru@gmail.com>

On Mon, Apr 13, 2026, Dan Carpenter wrote:
> At this point, we're unloading the driver so nvec_power_handle is
> about to be freed. Is there any benefit to setting it to NULL?

nvec_power_off() dereferences nvec_power_handle to send the power-off
command to the EC. If pm_power_off somehow gets reassigned to
nvec_power_off after our driver unloads (e.g. by a re-probe), the stale
nvec_power_handle would point to freed memory.

Setting it to NULL makes the potential failure mode explicit rather than
a silent use-after-free. Since we are already inside the if() guard,
the cost is a single pointer store.

Alexandru
