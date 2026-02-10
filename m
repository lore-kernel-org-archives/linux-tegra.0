Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAD9E23EA87
	for <linux-tegra@vger.kernel.org>; Tue, 10 Feb 2026 00:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770683952; cv=pass; b=onCAIedtsFjLynWdnZ79/KJ4T/BIB4eBaqZA6Csbnw3qfRPRS+SJwBvXGuxf8Oo3bfFDQO1gfLGYebU+H9yw86jxYsiIxx76wyncjQeIYYPzi8KGmIq76qJn/NfUgSIqsXrJ7yFSqFDckXwW2NUgS2PxJFgqHa+vRPhSd1cejwM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770683952; c=relaxed/simple;
	bh=CRHDCY+aNL8cCuJ5x1LKl4BcDxts38ZAFNhckqdTfRA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fg8SOYv9Q1TjOTUynb/3FYBagk+IzG8IrcJh4PeZamNg2FMnhYKjJvB0sO2Ia/+ErDT3I0DcOYJ/VEXA7zNxjSVqqu8w8xwNwBPZKqKk1bvjxumLElsJJuHPpzNit+ABipRP6VGZkA9KXIcSZkMgbBiOAkMii1RVKMcbZJbsk9Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GCSuMGfE; arc=pass smtp.client-ip=209.85.161.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GCSuMGfE"
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-67263e2ed52so425443eaf.2
        for <linux-tegra@vger.kernel.org>; Mon, 09 Feb 2026 16:39:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770683949; cv=none;
        d=google.com; s=arc-20240605;
        b=a4+pzz+93eMBicf3P6WI9K5w2mRqXfaMKRMjWa5D19eC/csiPWGRDWJLppXwohfgWZ
         9KBIdUDngOVH2jyyNOlEKRilRsPxEWc+KoVLF6u63+sXnH87SWO2xP+AkE4nMtF1EBg4
         0d56zvU3o6SbEgAYBIIoqTwyMSNA8jhh7KWjd/Ok9ZyVJeyaBCtgSUSw5YcPHMMXkspg
         BnPCAleTvXDnUW/ukdK5TGq17QegJOlwKA/baUkfIV5sxhLzdG+Wx2lOE/mJ96Ydcqby
         uDXPc1NELcVHHxgEMNTHJpu5IJVuynXRovh9jUcaDzFblBX9SuNHsK58ljM1cOWtUDrz
         DsuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Bf5IdcegF6twrrNNR7clze4xkdFwkIRE6sG++xaVg4U=;
        fh=IBx1X3MtUxdZOPOzqjVJ+oN+QDD7UBaDkFFV4CzHexY=;
        b=koau9niDqqTFoXc5hO0cI5n3rx59kX2BKaQv2kcWxVAvG74HQ8RD4TGGfuEZyMxwPM
         ErC1TVWlC9ngdunxkBcb0chFId3/eMjlHwZJZ95OEG7TqXoXXAnWhwLPnbIDf1GxVADC
         tD3t6LOvXMw4NbC55l4WPlhc1WoSIqOQrnSkZM/xDUS1OZiwMzw5N5V74/sETwVu2LKz
         wl11sFneQnv7CX8WuDxsHJn9ZKNj5ddWBcsWSkqifUJdQSllfq3b4W56ZIAFBXx8J6h1
         vN6i5f/99vqjJ7vN1Uq64lRjnNO5TnlzPs8D5hdn5EHazQqwe33ck2kl3uoQgkT7KuEM
         u3qg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770683949; x=1771288749; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bf5IdcegF6twrrNNR7clze4xkdFwkIRE6sG++xaVg4U=;
        b=GCSuMGfEPfzMl3he42tzkuKrehHOEwSPbWg9z90dF81Afyi3sPX6nHguyl9DXmTk4e
         6I4gIyihsEb7ZViL/AxrsB3qEzoyeA18VCG/n5Dy7EsyjJHpAxbKkbv5kouxorw9CtSY
         ErTcKZAIcy3Ck62Eg3V5O21E360Cg5+rXaqKmHKe3Ecv1aNdGvtcCfyNZzVJEEddoNDv
         JRtyUaMb9DMW2gKJjKDCu2T3OnxM4xcAEhRlVGVsVu+/IUJ3+AUuriZmgpVGoIg8stGp
         PfG5iXK6qZQFyuDRY7Qx0LItXki1cH4fE3AjOoiegYwEYQywG2RTCdmaOzOAFkzmXgzb
         Zlew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770683949; x=1771288749;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Bf5IdcegF6twrrNNR7clze4xkdFwkIRE6sG++xaVg4U=;
        b=sCzGazpR5yGcRb5NZ4kUkhmBFDD3sAniYfEtQc0CNCSB29enS3B3sah397Yfc5zKup
         7zFv+/CjM4r+kD1OVMd2It4TF3lzeolDd2nsFFEred2Zh9zbO27mSUB5L/2navcSp95/
         0rlGLEJItOgpNPvLU/n8N5KL/ZLVIeVBKljnUaxdYQQCNrcUHuPIBZxCi+OuHzws3Scj
         HMmKEn5cJXtG+yBloAyK/0hBYgxbwMpuNTk0cDISOb7X/c/DFkEKWCmqdfigYt+ZYbM1
         6mG0xKc9cmrG0G+wX+qx1eICL+WwxAeS0E5pr5G7QhPPwXSob1lTtBTEfN/v9cY++QT1
         CxGQ==
X-Forwarded-Encrypted: i=1; AJvYcCVXK7VrQeTPA+oqsbDObQP/DciMVFkYvXTEZJgomLZ9/1i2A9NMkhL+DV+M4dRGKrWg6FMO9uwEsWmAnA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwNjbHvTrPE3XRzvaRAIiuC3doifcqcHmTyoPXb4mLJlKyP40bY
	CExFKbFd3yw0RCsMyUNzTisP9uOmov/g5y7o9MZc0rfAX+JGX53f1fR97T8x3AAH6+MI4j20fsJ
	roAl2ytAratIh9wE+Ou8cMH2wW/TNLJ8=
X-Gm-Gg: AZuq6aL2DgaIo/BpT3s5HnxQf94C0yKXgFyVdZ5ooD2wwXfkas8BQaq8/xq94xsDwla
	Ja1inb+H3VRJXTQA+VOSqX36Pm/ygA6BnUd9xx2Ta9yiHmwXLM5a3tEghyE1kvuKYLflu1M4sDF
	S7Fh9nZTdCQtyYJwSsl1CscFzJq6aigu0vRTXRImW4tO8db8Okk3SQkW46NARjIRSZW/d78xZHh
	CGuS0UtHauQJxqYG1CRRpaszjP8yVRgUwdRN9nCK63rd3olRCZt9usudJ7WlE7bVhOgFNO3LGgU
	9Qmd8Cir
X-Received: by 2002:a4a:e908:0:b0:65b:257b:a898 with SMTP id
 006d021491bc7-66d32fdac10mr3465078eaf.29.1770683949518; Mon, 09 Feb 2026
 16:39:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260208040240.1971442-1-dianders@chromium.org> <20260207200128.v2.1.I600d04c0553f5c5ba39c2f92201da313aedfe746@changeid>
In-Reply-To: <20260207200128.v2.1.I600d04c0553f5c5ba39c2f92201da313aedfe746@changeid>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Mon, 9 Feb 2026 18:38:58 -0600
X-Gm-Features: AZwV_QhZe5s2jbJJnfFS4JALRsv_5-7Jio6ijB129QGrcufx887IYcSq_3ToyAU
Message-ID: <CABb+yY2GbPcuPiVsE_-HCS8MbpBqvjgjDkoVLNSBDZq1bnfpEw@mail.gmail.com>
Subject: Re: [PATCH v2 01/15] mailbox: Deprecate NULL mbox messages; Introduce mbox_ring_doorbell()
To: Douglas Anderson <dianders@chromium.org>
Cc: Frank.Li@nxp.com, andersson@kernel.org, arm-scmi@vger.kernel.org, 
	cristian.marussi@arm.com, festevam@gmail.com, imx@lists.linux.dev, 
	jay.buddhabhatti@amd.com, jonathanh@nvidia.com, kernel@pengutronix.de, 
	konradybcio@kernel.org, krzk@kernel.org, lenb@kernel.org, 
	linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, linux-tegra@vger.kernel.org, 
	mathieu.poirier@linaro.org, michal.simek@amd.com, nm@ti.com, 
	rafael@kernel.org, robh@kernel.org, s.hauer@pengutronix.de, 
	shawn.guo@linaro.org, ssantosh@kernel.org, sudeep.holla@kernel.org, 
	tglx@kernel.org, thierry.reding@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Douglas,

On Sat, Feb 7, 2026 at 10:04=E2=80=AFPM Douglas Anderson <dianders@chromium=
.org> wrote:
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
> +                             "NULL mailbox messages are deprecated\n");
>
Nit: maybe  "NULL mailbox messages are deprecated, use
mbox_ring_doorbell instead" ?

Thanks,
Jassi
