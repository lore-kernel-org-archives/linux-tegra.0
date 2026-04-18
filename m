Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0F6E285C89
	for <linux-tegra@vger.kernel.org>; Sat, 18 Apr 2026 02:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776480614; cv=pass; b=js4fbXYLxTtEfx6ES0KKy6NkyQDiLFQVDFiHkevsFOuYloRB94KBNZ7ouDHintjqi7JsFfN3Tu8o3bHEqYU+tCXfHxab1cLAI2L7BX4ueurX++O3LMqVcQ4yOcTsqDq4Tg9Clhb/8MKNCgzzB512T1K57mEZpm7tsiZxu7GGOM0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776480614; c=relaxed/simple;
	bh=sTpB3zFGMA4+49UPAPJnoMPYvm1cGwiY/ChissLecvk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Hg1zc71CRX5CoP/nr/vB0i51w+Amue7UwcDHYAw85I0NZhMq0ufdEXtIO+dadZkqCLN7+dSmaTxQCppYNoafQ9Bjf1pFv1uvKeHLRsLQReK0h19Kv0Q0mZeJi3F3sm+MDZs9xtKXOnsEpF9qx0uHfKw3Ev8ZsvzU+SzpCwIrqCo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L5NJc7Zz; arc=pass smtp.client-ip=209.85.161.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L5NJc7Zz"
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-6946d60f21fso166890eaf.2
        for <linux-tegra@vger.kernel.org>; Fri, 17 Apr 2026 19:50:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776480612; cv=none;
        d=google.com; s=arc-20240605;
        b=N8Od5IABgjHmc4gOQzwpCpHZAmvvg3SIDmBEiQQTGPvzUnVNNkoTQ2zSEXugWNuEVJ
         q8xIN0QYdyRCzsQHDO7wOP4qIZdBUqw52eUNSy9abSWe/KTO3pIX2+HkhPeo7AdCrz7b
         pGAJpKXs+rZrKI0ETXqrGN8fkTcm5rDATW+Dg1d60lCsS6Ew8EIyEm0SHzolWRo0+UwM
         yVi7C+ggsgKVYeuZplwySHgVTxEL3s5sPS8GSALwKOOPsxv+gAndLmAoV45pjkogDNBr
         0GxHXhGfnh/nkLNGcn2Il2idfJfpXQaP8arw+AGQmM9sjjo5gMKOl1KB892vBBQ3bnbG
         pzjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sTpB3zFGMA4+49UPAPJnoMPYvm1cGwiY/ChissLecvk=;
        fh=OnzMlhcAir6UDOQ06LQvgXGLEXQGm94J0Z1r0NKVcvo=;
        b=hByNYGR/jipk33VUoTQ7BnvZiXxdJY5M3egAFS1mkjFdtfAdnkQT1Ux4yctFjjSaWI
         XyDRnsOe4VKwJlZgK82qPMJhfdeQo5QFILfxuwLybS7yhdfPKufJlY7AWmLeKZG1wNnc
         2UBj1ZH6DHwFb1SYv78bif1gOF47l8nt3IE2VdX7zgMYxZHHuRDQ9cRm8wov0Q/fH8lG
         klSCz2AgWCaomZg1p4ANl7NXrM0+m1Rxsmi3Hz9CADS8dt8RBi7CaATrH8EjAWJoWN7D
         rvKYYRr0npw7nQRvfJdR+MrA/nRIEjHqLlToTxcZbnamJUUvrpAUugkiXkB+9PWBQV6a
         vVsw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776480612; x=1777085412; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sTpB3zFGMA4+49UPAPJnoMPYvm1cGwiY/ChissLecvk=;
        b=L5NJc7ZzD0XXlkyFqphmwJmka1ifEx9lll7Ih42v1Pxw6TPc6HSqH1N2zLl5Udogbd
         UeWodJKrbTNtEoaFGu2iYhcw9/yihXYsxUhcOIzAzQPSUzbl809K3yX3r+YGyaBfAGUh
         TIyP0/iVY+aySRe8Y+mSD3V+wHus9MuP0Bj1xMWHM88XDNTq9q/rs+zFhsne6K7QtfQB
         FIKhmeu1RJFRDH+5asPJYrsoreqXu9Kgzqtypuld0LWlUg6Lyi04fcBAlgUFFrsbEDhg
         ZREqERpnbnpRhWMMgcuV6UJhLdIUlkGHN0DkUQMWrsTSJjY3u6UshQVnVev8mfsQS/6D
         oyRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776480612; x=1777085412;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sTpB3zFGMA4+49UPAPJnoMPYvm1cGwiY/ChissLecvk=;
        b=jlVy/8JoQ9JesfwOMOOYJ/B8sANQsjHXu0QNzBIgoTvq4b86s+u8c1KsUDLiN85T0+
         CM2rkUrlFpOCT0mOuhuvx3auI+HdAH9Q8tgqOemEAIHM8pYXcro3oN3o0Z9GYQusv/qs
         vsKLPhLrVVmqiM5Szf121KAMezKNsdpsKkFMDtUulOInfbp+x5E3JBfYyyjgG3kG0WIO
         eWsu8ggKNf/YdwohhGSy7mflcCKGhUdjNWIMmx2ZeYXa5vmp53hNegktxRv5ELB3cUG7
         /NqLihcbVsJYRuRfpcnMwGUiOeS8bColUqBa7sd1OhK3WYkCS+OAlAfcvGr0PB/ohjiW
         RlAg==
X-Forwarded-Encrypted: i=1; AFNElJ+OHy3TLcXgEouzLtpkuTGPyExownpuIaKEGaMp82G9kcRL4bXy1zMKVEAQ/SSze2Ouefyb/SJi7y6VCA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyRKO+VI25a+zyzOXlJMZKRI0aMj5Xn6jK8xd1WYO9bSqk6leqy
	nreLPQc22wF5sjXEb97wN5TQbVmwNis6WOBjtQA1zyy2Rt7WjhdjNbmg4IGpw263ZLCAW8/z5n2
	XmVKkuz3Y5OMw52ltQr3FAyKIl8nkYBs=
X-Gm-Gg: AeBDiev4VGjXrQg7G6YqucwkOUJ2pFwU685LEe0XrmBiflBp4y9xkb5t2P4TfZXN8Nl
	2XncXbq3D+woJzGtTF8XDpfMLJP1vKIV8HnflpD1JFZKQzZ+kNNqeI5iJhkwYKZz97Wk5gXaqar
	Z2/tnPzQQG1slAS5RfHV/6UfNI3zthZbCV+apPZOmUPhoqJ2xaZI3qeLs/Dvk35M47NxWMb0IJF
	yKdNNobeLdy5Rx/oXgpFNGVmAaGxk9DctqlwWuJL0NjRguXv/s0/QPvEKcQbZYNg270H58puibK
	gQbw5ALIKdoGZZ0ejmc=
X-Received: by 2002:a05:6820:604:b0:689:7cd7:259e with SMTP id
 006d021491bc7-69462f44c08mr3366697eaf.57.1776480611628; Fri, 17 Apr 2026
 19:50:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CABb+yY23aTXeXu6G-8sHjw32DCqmhsJLu2Mt-txenOgTBiyv+A@mail.gmail.com>
 <20260417084335.2092188-1-joonwonkang@google.com>
In-Reply-To: <20260417084335.2092188-1-joonwonkang@google.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Fri, 17 Apr 2026 21:50:00 -0500
X-Gm-Features: AQROBzBa_VS1wWtSKDMjmtBp02-qplt4Nx2TejF_JEV5fvEqT0eLpBXx6xGnZnk
Message-ID: <CABb+yY2yBZ+hgr-=Uh_sRk-TJZRfsk2AYtoS5rPtUN8kVsUScA@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] mailbox: Make mbox_send_message() return error
 code when tx fails
To: Joonwon Kang <joonwonkang@google.com>
Cc: akpm@linux-foundation.org, angelogioacchino.delregno@collabora.com, 
	jonathanh@nvidia.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-tegra@vger.kernel.org, matthias.bgg@gmail.com, stable@vger.kernel.org, 
	thierry.reding@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 17, 2026 at 3:43=E2=80=AFAM Joonwon Kang <joonwonkang@google.co=
m> wrote:
>
> > On Fri, Apr 3, 2026 at 10:19=E2=80=AFAM Joonwon Kang <joonwonkang@googl=
e.com> wrote:
> > >
> > > > On Thu, Apr 2, 2026 at 12:07=E2=80=AFPM Joonwon Kang <joonwonkang@g=
oogle.com> wrote:
> > > > >
> > > > > When the mailbox controller failed transmitting message, the erro=
r code
> > > > > was only passed to the client's tx done handler and not to
> > > > > mbox_send_message(). For this reason, the function could return a=
 false
> > > > > success. This commit resolves the issue by introducing the tx sta=
tus and
> > > > > checking it before mbox_send_message() returns.
> > > > >
> > > > Can you please share the scenario when this becomes necessary? This
> > > > can potentially change the ground underneath some clients, so we ha=
ve
> > > > to be sure this is really useful.
> > >
> > > I would say the problem here is generic enough to apply to all the ca=
ses where
> > > the send result needs to be checked. Since the return value of the se=
nd API is
> > > not the real send result, any users who believe that this blocking se=
nd API
> > > will return the real send result could fall for that. For example, us=
ers may
> > > think the send was successful even though it was not actually. I beli=
eve it is
> > > uncommon that users have to register a callback solely to get the sen=
d result
> > > even though they are using the blocking send API already. Also, I gue=
ss there
> > > is no special reason why only the mailbox send API should work this w=
ay among
> > > other typical blocking send APIs. For these reasons, this patch makes=
 the send
> > > API return the real send result. This way, users will not need to reg=
ister the
> > > redundant callback and I think the return value will align with their=
 common
> > > expectation.
> > >
> > Clients submit a message into the Mailbox subsystem to be sent out to
> > the remote side which can happen immediately or later.
> > If submission fails, clients get immediately notified. If transmission
> > fails (which is now internal to the subsystem) it is reported to the
> > client by a callback.
> > If the API was called mbox_submit_message (which it actually is)
> > instead of mbox_send_message, there would be no confusion.
> > We can argue how good/bad the current implementation is, but the fact
> > is that it is here. And I am reluctant to cause churn without good
> > reason.
> > Again, as I said, any, _legal_, setup scenario will help me come over
> > my reluctance.
> >
> > Thanks
> > Jassi
>
> Hi Jassi, can we continue discussing this issue from where we left off la=
st
> time?
>
Long passionate essays are difficult to read, so I haven't yet. A
simple description of some setup that you think is not supported, will
keep the discussion focused.
If your platform is supported but you think the api is not clear,
updates to the documentation are welcome

Thanks,
Jassi
