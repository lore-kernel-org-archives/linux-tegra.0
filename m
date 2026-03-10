Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 018C0186284
	for <linux-tegra@vger.kernel.org>; Tue, 10 Mar 2026 03:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773113049; cv=pass; b=UcJQaGXh17UwHUlVMjP+ehFBHCOliN99ASvMcgR3/RJIdgEUF6L93nCnDujEFxYLGCrpCqRobZcQSC3GJxTQ+QS+3iB3x39R+XR79XyWQ6yLFHSEkItngO9wBATp68Ay7eKP9iu+aezH7mxif+56yO8yD+5m2J5Fbsp8xaVXxKY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773113049; c=relaxed/simple;
	bh=Lcr5dVXyCC6NuA15tJ5l/HwAKYVsMmOxotK4MXcexts=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SPwXBvXLZymGrBFk2mZ+Y/7z9Cd2wJLgItBZYCU4Bh0nFV/FJzwXgSnxYUbTLKa+fkovWT6cq1K+x8FbwNIM+f45+unuReU7vw2IH6aLue/NKx6h3z7WJ6i1kUaw26XdhI3N1cTOGuSxWmSptzKPeMq01nc4aJlFg1+KJQ7Raa4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jBSWzME5; arc=pass smtp.client-ip=209.85.160.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jBSWzME5"
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-41706b23543so1793795fac.1
        for <linux-tegra@vger.kernel.org>; Mon, 09 Mar 2026 20:24:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773113046; cv=none;
        d=google.com; s=arc-20240605;
        b=g6imxcb3xeoIcdB14zrGMt3KSjq6TXQ7cNBrQjOvSxZ3MrIFnfSsjeKKYlbGOcB6xP
         ducyQDhphwhvhpoAEAJjFO50c5uji3zS4ao5g2IfJAfOFyQ2LzyldDcqHF/f3wEIldvA
         NQd0y9qxGjCXfswXQ9fUplb3Wl6Y4UCnCuA0Q13V1+TZcKARHn9PyXpzeGCGowK3gucT
         U7GxFbhEPOC1aQelovJhIQRJWxf38Xw3iP1cqE70vN9w49YL7btaZBno/hHQrh2+QmNn
         aCv95rY99lIONH7OWbThGZNNUfMfEu8QzX7Qi49jx67tKesseM6gruBqmPsWPYS9af0R
         c44g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=a9IUAxs7VdJbIzLXaHTJJ0fopPqXXR7atfJlc6YXf10=;
        fh=7D016r/FM8LUWfw39v7rIp4JCBvuFN2XAEuqJGAA6OY=;
        b=Dvq/7JBuOu4MSzER/jhD5QL2ne+alXxoSTT6niCSHGfToFABVqy9PQz8OuYuZ5xnHc
         +F90aEbyp1ZDZdmYTrMe+U6LoS6mcLn/MxvqDgPw6GqNiyGxvJ9fxdAQYl2+5cVyJ0q1
         zJrC4njl5DptDXJ5vWADVG5KeczgZZ0tNVCwhfpxil97TTiVwDEMHPLs4vRIz9kNrOOM
         i6MNyqpswVWXyytBG5ztMUr5OeLHedOtSaCzBOoiEuB06FUYpJIDSBJyobLryhvF1ajV
         cy0id27htMRVScVrdbCyH0519tdcU4GuZYvDGgKH84gtF/2JYQTjj8uQC2t21G7z5WaK
         WL0Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773113046; x=1773717846; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a9IUAxs7VdJbIzLXaHTJJ0fopPqXXR7atfJlc6YXf10=;
        b=jBSWzME5mmDt+P73t+DCqn3BR9/LRYmvJLwD3COsdTW7jJAeGeMD7vWegQm0kO1jnb
         eposRxG/wfW+/sbnaM4TG9QD1wZBVQPsBzT0GUBOmLWmj7BVZmKAu41tyRm0eZ8d9dvE
         c4mknSfMgR6NUzyqe/8wJnqLpWmRshN7I9+LX0AHpop3O3zEvE9hH6cZL7XoGSlgfgx6
         aOlisPIL1Gnilx7ZE+GObnfzLuLz4q7C+gcPuOhjjwpMyHnX+Ns995kFh30BvgeonYDy
         SXhEHm9/ml0cG6yEFdQpyAmV4NOSrM1kvI2NFWmJN90zz54ahqvjYjMMbBVrl6CyqGq5
         4m5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773113046; x=1773717846;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=a9IUAxs7VdJbIzLXaHTJJ0fopPqXXR7atfJlc6YXf10=;
        b=ECSBozk7CBbN3XKilAc+mLyrQYZwSyJLbDUAgPgMw4edeK+g2N21wMO8hwALjZwihi
         Dm8ZDD4nK9z+sARb1RqIPMTqwTU2Kr0jVR5hcHkL4//6Clo6FgNYJILoCV3q9vJRP+46
         kQJfH+zD+LiIiCthQFPCwoUC+P28GgagA3Ic+0T2s2qUcJVWjVugDtscdhlAZsPhCKov
         79lfCbe/ghxu2V+Cb4nN9u9EoSkKS/U7sbdnM7o9s2UUz0Yqp9iUSvq0ZfLl+ro3mkoR
         vsLfWZGethMMU7dPcydXjWtw4EU/Qg+idoVvf/USHEJ0B0AjURo9OsDXQHe6+kWlHw6a
         6Fag==
X-Forwarded-Encrypted: i=1; AJvYcCU/yL5F8spBWySk5JKmD88gth0dwC/ORpad/GHvxoyJswd7/e7eoiVgDg2qsurCHKeWplvun/x6hwSXBw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwXl+Y3diM/TFi3uspf6MSwsGvHFpY0/tR4hPlSKKOZyniNAdrI
	sQOPIu6y6CiCDoT5aZ1jlSocTaMPlRGJzOS4pOnhScn9w5VgSxFV8wJ5cg9lP8g+Yxtz/RBVcRM
	jEjB1oF2BIK7onvSy/8fOueqTr3Z7OY4=
X-Gm-Gg: ATEYQzwAiqXH44+AHKS1i9krjm2YKIHY09J6utveOSJkr28DOTJShKYuo+8TxkP/y03
	VK1TE5sdWaOc5lXTCjnitZx/I92av2WsxGoVtglQUISs8BTcv4yk1W99H8x+ySDIar7kcax0b+J
	xOGAVm5mCN7Kjl98e4PgoTbQ3by/xJp9+o6Q3U4FxsWF1V7FLz01vFt4pyME22PA3IiURKtuOEI
	8SmD4hLU2n0p0a5c0NmwQiykwOftOQG67eceTaykErgO/LQlrqXHn7V/Evu8IGXcOX8n+GxAmnD
	MQiXntGi
X-Received: by 2002:a05:6870:a0b1:b0:416:42f9:8d86 with SMTP id
 586e51a60fabf-417568d4325mr1271236fac.10.1773113045873; Mon, 09 Mar 2026
 20:24:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260216181002.3475421-1-dianders@chromium.org> <20260216100943.v3.1.I600d04c0553f5c5ba39c2f92201da313aedfe746@changeid>
In-Reply-To: <20260216100943.v3.1.I600d04c0553f5c5ba39c2f92201da313aedfe746@changeid>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Mon, 9 Mar 2026 22:23:54 -0500
X-Gm-Features: AaiRm53275_H0CT6bFAmFiNzU5-bzNSMm5pKGBVqlCEoP2LLCsiLm-21V_J1GP8
Message-ID: <CABb+yY2RKJgyNQ6789ua6s8C4tuOvhWqdcS16_4yU3AHjAiv_A@mail.gmail.com>
Subject: Re: [PATCH v3 01/15] mailbox: Deprecate NULL mbox messages; Introduce mbox_ring_doorbell()
To: Douglas Anderson <dianders@chromium.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Frank.Li@nxp.com, arm-scmi@vger.kernel.org, 
	cristian.marussi@arm.com, festevam@gmail.com, imx@lists.linux.dev, 
	jay.buddhabhatti@amd.com, jonathanh@nvidia.com, kernel@pengutronix.de, 
	konradybcio@kernel.org, krzk@kernel.org, lenb@kernel.org, 
	linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, linux-tegra@vger.kernel.org, 
	lucaswei@google.com, mathieu.poirier@linaro.org, michal.simek@amd.com, 
	nm@ti.com, rafael@kernel.org, robh@kernel.org, s.hauer@pengutronix.de, 
	shawn.guo@linaro.org, ssantosh@kernel.org, sudeep.holla@kernel.org, 
	tglx@kernel.org, thierry.reding@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Doug,

On Mon, Feb 16, 2026 at 12:11=E2=80=AFPM Douglas Anderson <dianders@chromiu=
m.org> wrote:
> @@ -249,6 +255,28 @@ int mbox_send_message(struct mbox_chan *chan, void *=
mssg)
>         if (!chan || !chan->cl)
>                 return -EINVAL;
>
> +       /*
> +        * The mailbox core gets confused when mbox_send_message() is cal=
led
> +        * with NULL messages since the code directly stores messages in
> +        * `active_req` and assumes that a NULL `active_req` means no req=
uest
> +        * is active. This causes the core to call the mailbox controller=
 a
> +        * second time even if the previous message hasn't finished and a=
lso
> +        * means the client's tx_done() callback will never be called. Ho=
wever,
> +        * clients historically passed NULL anyway. Deprecate passing NUL=
L
> +        * here by adding a warning.
> +        *
> +        * Clients who don't have a message should switch to using
> +        * mbox_ring_doorbell(), which explicitly documents the immediate
> +        * sending of doorbells, the lack of txdone, and what happens if =
you
> +        * mix doorbells and normal messages.
> +        *
> +        * TODO: when it's certain that all clients have transitioned, co=
nsider
> +        * changing this to return -EINVAL.
> +        */
> +       if (!mssg)
> +               dev_warn_once(chan->mbox->dev,
> +                             "NULL mbox messages are deprecated; use mbo=
x_ring_doorbell\n");
> +
Does this patchset leave some such clients out?  If not, should we
drop this block and return -EINVAL already?

Thanks,
Jassi
