Received: from mail-ed2-f35.google.com (mail-ed2-f35.google.com [74.125.228.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C895B3750BD
	for <linux-tegra@vger.kernel.org>; Mon, 21 Sep 2026 22:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790029025; cv=pass; b=hWNbpmqa1KDPmeK9yjHQfrVmwNYqTP8c+jtOwHMZK9NoZqOC9PZvG1oi+0xtoxucbVemw/UOhZp3S6OAcjcfJfAqbojI99zoZa94BlWS4htYcuvCc1GjcK6W5eSDhyJIImUfhpOgIpPEOjH2fA41aJGlouTAAFAW2pAQZ2R1HP4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790029025; c=relaxed/simple;
	bh=ygxQGrVULTuQLXHw/7/JdMV/ZQLiV+IGlcOGZt/F2D0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DhCNWY/9jddqqoC2TBUKQNeLIqMUwPUJSMnc1FjrX+u+K2kJB1VohCtyjr0Ie90l91r5+S1eLZsYJ6gLaxto88YIWBtLtPAMO6FPKrirxg9ZrqgNac6F+svtBn2QpkXrT44EjSGIHdUhwVeL/8AMerG7e0A80QYhGmBlBBRQzh0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o16dsyQu; arc=pass smtp.client-ip=74.125.228.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o16dsyQu"
Received: by mail-ed2-f35.google.com with SMTP id 4fb4d7f45d1cf-6aa22408406so5351032a12.3
        for <linux-tegra@vger.kernel.org>; Mon, 21 Sep 2026 15:17:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790029022; cv=none;
        d=google.com; s=arc-20260327;
        b=J77d82kfAugzD9TtkjsL4vubvx5lXC7zK+kIxDhcn8TldlGyS5LzpDjsdItBx7gsnN
         5s0VBPLv903EXXfdIlO8tvGWrrbkP7MvmhoHxmJ4UUgUzi2/rv1IAu6dGPGg4oeh1aNX
         dkggOuS7ANU1UjjHz+guUQj7aLw7c7jr0ddqeoPj0CjNXPkHE7RK4IbE97s6CzhzQVdb
         Yzl82jWm9BGbjB652shVEndlZSN3TJCEtQGWUYs+GFtBMPedq9K6MVZfyILXUBuJwIFg
         SG3K4xsza8zlpDdUwmNbDHhDmbkWNmdhxEin1nHIiJ4aV5atuld/yY/apvws76d4OtOm
         weDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ck2dQ4iiA8x8tPtfYLzBLk9ACmAdSjWMpZnAG67iB4E=;
        fh=IjgBS6Ockd43OPIIQHAOC1FXl6+bBWCAUGHckzOhQ7k=;
        b=Hh3gI1Gc6YgGuegxRR+P34qoKlKYFoEZy83+8/8ddGyGIX5xSSO2R+1k0mb24pzZnP
         RlLW7ksM8NbRoJEobb0PI+hoxVkH9lD82h+PeMk489zF2GNHMUClN+LSFh6PM3VbYWQV
         6LRBbtZThi18qW1H3HQle0xwkvdRUaKpaRf5dWWi2ByOTD069YifK7vNjlOUIQZzuhZm
         t5MaSy6fW6i2oyMCulEkd+iyat4MH7I76C7j7U+XDCsOItIgV1tXOME6EXqHxqxbPd5K
         ko0l86Ux1bk2o3ELheEm40UkPhmz5rz7JxGLmaOc0C423XE6pbBhoPLXO70n371UmC4u
         6afg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790029022; x=1790633822; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ck2dQ4iiA8x8tPtfYLzBLk9ACmAdSjWMpZnAG67iB4E=;
        b=o16dsyQumVzJ6ZQD9CBPZDz7YOyTg+pWyJM4BZxRIEkzasViSj7ryKk/YSR5KboqyD
         N83aI3rJno/AkfjPuoFBp8G0qX7X6KV8DXy75N9/Ih4AQ+dOPnVxxOVz/SFmwSdi8rXo
         PAckqX5bPQv6k1wOv0NO8MWWG4mlhF3YLJaPpnWql8Bro/IbTaTziifDN9OIeCQwtXn5
         eZKC//FrR3NTUiMsi+gtr6DnbmWadYllc02tNhue6HVursRuuwxEscIkUO0jujJxEQ5C
         Ge6Y5UMpXO0bjYGlDGZtvETsUXLC2BzMDi9cU38TvWYHuFAPaM4NgEoNeFH3zVB+ed0w
         vKwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790029022; x=1790633822;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ck2dQ4iiA8x8tPtfYLzBLk9ACmAdSjWMpZnAG67iB4E=;
        b=IR4MiHK+cUb/z3fDtn3gHmvrRmBSD5ThyvZMLPc1rA1fqsx1AhoSFFFUAcT2hznYRD
         bN6g5Qe+JJN8pG8fOuMnori+7RvILztbMpC8O9pQIEvIpXmrxD8uABCFYKGAxMHx7HwD
         ukLWPrtCp9vcKpKakuTR3ee9uPYqNKnnNizUhJthPll6nOwbwTV5tMmXVWBnlBjOYjH7
         93fV9lXC534gzVM1QZe6lAiF5guowCtkVnbBul/aRn8+uJ6rUZby7+5eBrVME2kIaabm
         USZxwfyQ2oMzvJ9+MiqFsTnZN1xUUD+6ioLOt2P7ri6BXGXNtp8qsAVigRJu1kO73Xqo
         bXFw==
X-Forwarded-Encrypted: i=1; AKwUvByiG2qgh9jTl3ChX+BU4dBkg32iGJKxofyRfDF2AFFGoNjvc9P9E85Pj8qapl1zQtgD99vV+mdGwoRdOw==@vger.kernel.org
X-Gm-Message-State: AFuF++lFV4fn3D6XjG5rzQOA1drhxWzY7+ZdCBfiCQGFoYouOHWlpalv
	I9394rFYzQZJi70nlE2Z8SGptFj2ArTCb/qUwZKPvQPTvnlSZwehxilU8d7vtjQq64gBeQqs2rT
	ATtOqBzx5/qpkZHOWTfxQJ0UDtAEk46FyzteKJrdP
X-Gm-Gg: AYBFou3c7/8Fqa9l03q7aGj5tFMUBfdFeQlscqc5fuz5LS4NeVDp94HWCbR7Sh/anRC
	eiZUfM70l7Q7m/xpSYqNTj4F3KlCtjFtYTbyauqzNCsQSWfyVxpk5DEmEgyqnttj+TjB3a9UcDa
	sqY/xZTRxXZMm+PZB6kHu8XXG9mggE7d0eHYkgDykCybV7aLTQT73SRCS9YsloMIxN1+TMrmidt
	Nik5NbEwuYxh368JsqmTgfk2p0rLC5NDDVBCjzxMHX/UuixXNrEzQQHTPg5QaJZCZA+yqU+khm1
	WVont/vx1Cf24pjM+K7EGm6gKifge3VIPYtsQQNQusCxbDYJlQneeX8O06FvMnFIm+SqZFZcoCt
	jEJzZSg/KtmlH5clONX1dbjDP4IdxfZje2uai4lMN0H8/+dlNN8gnAvs9MQAYyWYVkvtY
X-Received: by 2002:a05:6402:2790:b0:6a7:ee56:8158 with SMTP id
 4fb4d7f45d1cf-6aa579b0382mr9106641a12.38.1790029021870; Mon, 21 Sep 2026
 15:17:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAGEsz8F2eKsmV_tymO+9UD5xkS_tWhZo-b9Xom1_SiKuc-BCqg@mail.gmail.com>
 <arETYSjwaHytxyBu@orome>
In-Reply-To: <arETYSjwaHytxyBu@orome>
From: Myeonghun Pak <mhun512@gmail.com>
Date: Mon, 21 Sep 2026 18:16:49 -0400
X-Gm-Features: AcwNN1ULiGgKpQwlzJhSBbDWZG7BlTQmkG_ouL-IXAT-QUCIcQoVWsAgftcR8FU
Message-ID: <CAGEsz8EpXPPD=S8uM4fex1_c5eV6byzOcYgVyqmJMKBLUAm67Q@mail.gmail.com>
Subject: Re: [PATCH] usb: gadget: tegra-xudc: Disable port reset work on removal
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Ijae Kim <ae878000@gmail.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the review. v2 keeps the Fixes tag on one line and switches
plc_reset_work to disable_delayed_work_sync() as well, since the
port-status IRQ can queue it after cancel_delayed_work_sync() returns.
usb_role_sw_work stays on cancel_work_sync(). Its producer is the USB
PHY notifier, which v2 unregisters first. The two bugs are split so
the notifier fix can be backported below v6.10.

2026=EB=85=84 9=EC=9B=94 21=EC=9D=BC (=EC=9B=94) =EC=98=A4=EC=A0=84 7:28, T=
hierry Reding <thierry.reding@kernel.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=
=B1:
>
> On Thu, Sep 17, 2026 at 07:20:58PM +0000, Myeonghun Pak wrote:
> > The port status interrupt can schedule port_reset_war_work to handle th=
e
> > Tegra210 port reset workaround. The remove path does not cancel this
> > work, so it can run after the PHYs and controller resources have been
> > released and access freed memory.
> >
> > Disable and drain port_reset_war_work before tearing down the controlle=
r.
> > Use disable_delayed_work_sync() so that the interrupt handler cannot
> > queue the work again while the managed IRQ is still registered.
> >
> > This issue was identified during our ongoing static-analysis research
> > while reviewing kernel code.
> >
> > Fixes: 49db427232fe ("usb: gadget: Add UDC driver for tegra XUSB
> > device mode controller")
>
> Please don't wrap lines like this.
>
> > Cc: stable@vger.kernel.org # 6.10+
> > Assisted-by: LLM
> > Co-developed-by: Ijae Kim <ae878000@gmail.com>
> > Signed-off-by: Ijae Kim <ae878000@gmail.com>
> > Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
> > ---
> >  drivers/usb/gadget/udc/tegra-xudc.c |    1 +
> >  1 file changed, 1 insertion(+)
> >
> > --- a/drivers/usb/gadget/udc/tegra-xudc.c
> > +++ b/drivers/usb/gadget/udc/tegra-xudc.c
> > @@ -3926,6 +3926,7 @@
> >
> >       pm_runtime_get_sync(xudc->dev);
> >
> > +     disable_delayed_work_sync(&xudc->port_reset_war_work);
> >       cancel_delayed_work_sync(&xudc->plc_reset_work);
> >       cancel_work_sync(&xudc->usb_role_sw_work);
>
> This is a preexisting problem, but given that we only delete the gadget
> below this cleanup, shouldn't the other two cancel_*() calls be
> disable_*() as well? Otherwise there's potentially a race condition
> between this and the interrupt handler (which is only unregistered after
> .remove() completes).
>
> Either that or the existing cancel_*() calls are enough in which case
> your patch probably should be using that variant as well.
>
> Thierry
