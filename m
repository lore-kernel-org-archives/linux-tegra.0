Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C92238F256
	for <linux-tegra@vger.kernel.org>; Mon,  9 Mar 2026 10:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773052971; cv=pass; b=VFPGEslFde6zqnIWUfUU9nKKZmq97L/VuTl8i0IYZwkJhnWJlrXvxi8mfDq1vkY/eJ4YdcujPC4gQup0lg9Fxhrjo3oDvnWXjYDBwKolpbiCM1uvVHoLZjffWYoSDuTPAuhtNTNVfsUnGtGEpJMNKTZhVaPPt1q6JS8pKmNXEKE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773052971; c=relaxed/simple;
	bh=TWYX796qf27EFfnT0fwv1H53f8anzfrtf86Zv/nI9IE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aXgK6xvC2hmJZtp79hYqtePZGkbvTLQRZ56LXB+dZBnvtO6k8y21tJXIbWvneV8lJA79oBBmqxwItIQcUg+89GNB0TcHgl4SwElAP54ilGxLZcRYMglf+ID18Ah/TrQ7vfRjr1COmZn+kuu2jwnHr90MfyVz2rxnbwm2IfHBy38=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Iy+5kasM; arc=pass smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Iy+5kasM"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-661ce258878so12229a12.0
        for <linux-tegra@vger.kernel.org>; Mon, 09 Mar 2026 03:42:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773052969; cv=none;
        d=google.com; s=arc-20240605;
        b=X9KEBPyYlz7deeOJZpROr0rf/Ncewlg69uHdgQFNT6IZqMtNB3ILlEijNOxjJwtB4u
         70hIkB4x6NULCh9WVlo/DYxNaU8cKcMOmO0yqxxhVQ2hJvYNAPFGxcGieM8+pc9r5cPU
         S4tbwFJ4mCa3jMtxxqfy3PaEJbw7Rowsf5KNyz39QdFKIQesAnPvkUd+Og9bacW4xvk0
         aiMcv2710o6jHWd2nlsq6qWbiCUYyueqisMsVcwPpC/NySZRP7IJjx9Oyu7x3YGhQP+Q
         4wYJPlPrI6hXxIF4JNxLvS+cak3pKdAoS2R6tRLgtn+ojJ24cBLa9uVbhtqqwWR2iJkZ
         1VTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=e5cK9Urk/4A4PH+rsif+5eOqOyGE3NvOcm5rrxoIzRQ=;
        fh=wsFGOhBzdQIKyB+fV63kAS6meQ/j3osJEakylLbrCac=;
        b=h1yP5o6zSexweVwsKiQ9+WwK0WIj/A3/JzUI8fUcviEOfcd9W0IjBdjEFJiCnyveXB
         6NPojkxqPow43buDKZVHH1ViAo/efqM0RS5vfJoPeTlC/p9A3xz8CgjNe29NJ5qAqOxM
         2iEyISD8P2CDABwe/5GWB8L5/oIwCulJfMHzwMqXDiNMGyarwaiyeWd6RF9REpahOh7v
         eMXlak57sB6NYGQSmh2Lk4ypevd81uhCxljKa3j7t/ydLEV/F9UysJYj/TKA0uGdKbL8
         PH/uc8YJ1BfD4UXsmG5WfMJi7lxsEKv3n/ZAJOu6to1zyEJ4G9deSKnRBhYU3S4z2zSq
         S+Vg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773052969; x=1773657769; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e5cK9Urk/4A4PH+rsif+5eOqOyGE3NvOcm5rrxoIzRQ=;
        b=Iy+5kasMrScR9VDlh/OyrRQwSPliIPj22ysvwFDvdlR5a/XBK5JEFqKVu6Zwa3fVVk
         h0IAp/TGJykZcehYJaDEciWSSPzdQeannId/ZxYFXtQW6G3Re9SbK/1fvtEZuNb1OGj5
         4IWCySBfM890c6q5P003x/7YVRy69I0apx2zeLa0eMpqTBRraoa1CIlRemnD2AYBZsfU
         AxCDP1uD/UqHbwMbfpGczge3kIYsLoHWsUNN8VVwT/D+gRTTEI0xIrhPecSku3LbTq39
         n9LYJuEbj1gGDp7zQRt9DZSDpvIXaNVK2L6FlxRtrYWW3SCIYufL7pqvFoJfGSMD8X/h
         nTlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773052969; x=1773657769;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=e5cK9Urk/4A4PH+rsif+5eOqOyGE3NvOcm5rrxoIzRQ=;
        b=B2SC+xKudlu66lWvjRCdGH1AqCWX372Z3UhflZFtdCXjAQR7Lq95drgXwu0/R7MTdH
         4OjiksttcePsJOFxDjghhY/vUBBhITXgMLnJZPmJ/O5rtPGmFkzTIiqsChUIaMIM59M4
         U5ojVeoLbYtZeT/Q7Xz3doplxuQQ2nehbv3s/qrsLyztwPyjwsU6d5+G6LcX44oIQeEv
         B0p5s8szXEEKW5l8G8vGsZpg7Y0P3knFEOdLRpUCnBQHeuLOg8EVa+NB1xYAzZoWoFU0
         poIwnaMuEXL0hV15pxzWQFjWz8RrCEx9lbct44tTOmgRQuK7XilNE5ln8fu3x9Jfe1YX
         Vxsg==
X-Forwarded-Encrypted: i=1; AJvYcCXy5vukBLfa9ysYMk4IjuQUZbXzdL5woiae/chPkE3wdjtxtLkgIoujln02d27E5m0daOnlzHIPIylL4g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxqwUwERzoyfO2CDONHeQZZpnTk0MjfBV62456tU0JdM7tceSzD
	DUYp7mhhI4PvgRDd/OKOKIooNhUy1IFYThchEIjUxlUE0qd5fOu+XU8VY1O7lWDl8Mbtg7lWOAN
	sjcT26XWQxPWYQdz1w+ezDeLMZfSmU4mtosyswmngWwYietjlp/VZidN7
X-Gm-Gg: ATEYQzx2V2JETgETItetcf6TaSlEAzw9XhzY0agAoGWM9xvpHoJHHMzjuuhE1OcbGQr
	q5OYT0v/hXEF43UVc6tB6Z58rJ2QF2fz5M752vANE36G33II4rQRhGRAxTplEk/66ap6bn6pgRE
	xoSkrX6oJ7O0DNRWleX5sOl6OdtBL1zC+xCaudoMkCqtCCTpXuV2GYtC4b2qfcNZIEI4wI2dq3D
	Fo2Rhmp1oZqXljxZmUVBVAfv3JEj/SkE1ObbVtKq5mMkRS0jsKX7ERNolYrIMCGDQ3oEmv+kNSi
	6yiVmFA0N82FXDlAr9/87byalOierVBjItE=
X-Received: by 2002:a05:6512:743:b0:5a1:1853:524a with SMTP id
 2adb3069b0e04-5a140b52f26mr139217e87.16.1773052647105; Mon, 09 Mar 2026
 03:37:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251230-ncm-refactor-v1-0-793e347bc7a7@google.com>
 <20251230-ncm-refactor-v1-3-793e347bc7a7@google.com> <89e20554-8a99-40e0-8b4d-2160b364cbc7@nvidia.com>
In-Reply-To: <89e20554-8a99-40e0-8b4d-2160b364cbc7@nvidia.com>
From: Kuen-Han Tsai <khtsai@google.com>
Date: Mon, 9 Mar 2026 18:37:00 +0800
X-Gm-Features: AaiRm519KwpNgmZqJbRDelkwMmTnvRbtfpqRlcHZj0AYXyLni9zb9nIbhwixKM0
Message-ID: <CAKzKK0qCdgk3vVJMK-zk8roxDtYkqdPTyAahpJOzF2knMYc9yQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] usb: gadget: f_ncm: align net_device lifecycle with bind/unbind
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Felipe Balbi <balbi@ti.com>, 
	Prashanth K <prashanth.k@oss.qualcomm.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	Andrzej Pietrasiewicz <andrzej.p@samsung.com>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@kernel.org, 
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jon,

On Mon, Mar 9, 2026 at 6:20=E2=80=AFPM Jon Hunter <jonathanh@nvidia.com> wr=
ote:
>
>
>
> On 30/12/2025 10:13, Kuen-Han Tsai wrote:
> > Currently, the net_device is allocated in ncm_alloc_inst() and freed in
> > ncm_free_inst(). This ties the network interface's lifetime to the
> > configuration instance rather than the USB connection (bind/unbind).
> >
> > This decoupling causes issues when the USB gadget is disconnected where
> > the underlying gadget device is removed. The net_device can outlive its
> > parent, leading to dangling sysfs links and NULL pointer dereferences
> > when accessing the freed gadget device.
> >
> > Problem 1: NULL pointer dereference on disconnect
> >   Unable to handle kernel NULL pointer dereference at virtual address
> >   0000000000000000
> >   Call trace:
> >     __pi_strlen+0x14/0x150
> >     rtnl_fill_ifinfo+0x6b4/0x708
> >     rtmsg_ifinfo_build_skb+0xd8/0x13c
> >     rtmsg_ifinfo+0x50/0xa0
> >     __dev_notify_flags+0x4c/0x1f0
> >     dev_change_flags+0x54/0x70
> >     do_setlink+0x390/0xebc
> >     rtnl_newlink+0x7d0/0xac8
> >     rtnetlink_rcv_msg+0x27c/0x410
> >     netlink_rcv_skb+0x134/0x150
> >     rtnetlink_rcv+0x18/0x28
> >     netlink_unicast+0x254/0x3f0
> >     netlink_sendmsg+0x2e0/0x3d4
> >
> > Problem 2: Dangling sysfs symlinks
> >   console:/ # ls -l /sys/class/net/ncm0
> >   lrwxrwxrwx ... /sys/class/net/ncm0 ->
> >   /sys/devices/platform/.../gadget.0/net/ncm0
> >   console:/ # ls -l /sys/devices/platform/.../gadget.0/net/ncm0
> >   ls: .../gadget.0/net/ncm0: No such file or directory
> >
> > Move the net_device allocation to ncm_bind() and deallocation to
> > ncm_unbind(). This ensures the network interface exists only when the
> > gadget function is actually bound to a configuration.
> >
> > To support pre-bind configuration (e.g., setting interface name or MAC
> > address via configfs), cache user-provided options in f_ncm_opts
> > using the gether_opts structure. Apply these cached settings to the
> > net_device upon creation in ncm_bind().
> >
> > Preserve the use-after-free fix from commit 6334b8e4553c ("usb: gadget:
> > f_ncm: Fix UAF ncm object at re-bind after usb ep transport error").
> > Check opts->net in ncm_set_alt() and ncm_disable() to ensure
> > gether_disconnect() runs only if a connection was established.
> >
> > Fixes: 40d133d7f542 ("usb: gadget: f_ncm: convert to new function inter=
face with backward compatibility")
> > Cc: stable@kernel.org
> > Signed-off-by: Kuen-Han Tsai <khtsai@google.com>
>
>
> I see you have sent a revert for this series now, but I wanted to let
> you know that this change was also triggering the following warning ...

Thanks for catching this. I sent a fix [1] for this specific warning,
but since the overall solution caused a regression on pmOS, I reverted
the entire series including that fix.

Fortunately, the regression David reported gave me a much clearer
picture of how the network device interacts with f_ncm. I've
implemented a new solution and will send it out shortly.

Thanks again for testing and helping catch this!

Regards,
Kuen-Han

[1] https://lore.kernel.org/linux-usb/20260221-legacy-ncm-v2-2-dfb891d76507=
@google.com/

>
>   BUG: sleeping function called from invalid context at kernel/locking/mu=
tex.c:287
>   tegra-xudc 3550000.usb: EP 11 (type: bulk, dir: in) enabled
>   in_atomic(): 1, irqs_disabled(): 1, non_block: 0, pid: 0, name: swapper=
/0
>   preempt_count: 10003, expected: 0
>   tegra-xudc 3550000.usb: EP 6 (type: bulk, dir: out) enabled
>   RCU nest depth: 0, expected: 0
>   CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Tainted: G           OE       7.0.=
0-rc2-debug-tegra #1 PREEMPT
>   Tainted: [O]=3DOOT_MODULE, [E]=3DUNSIGNED_MODULE
>   Hardware name: NVIDIA NVIDIA Jetson AGX Orin Developer Kit/Jetson, BIOS=
 buildbrain-gcid-44366467 03/05/2026
>   Call trace:
>    show_stack+0x20/0x40 (C)
>    dump_stack_lvl+0x7c/0xa0
>    dump_stack+0x18/0x30
>    __might_resched+0x128/0x198
>    __might_sleep+0x64/0xd0
>    mutex_lock+0x2c/0xe8
>    0xffff80007eaedf84
>    composite_setup+0xb30/0x2010 [libcomposite]
>    usb_function_register+0x20e0/0x2c28 [libcomposite]
>    0xffff80007cf7ba20
>    0xffff80007cf7cb84
>    __handle_irq_event_percpu+0x64/0x3d8
>    handle_irq_event+0x54/0x110
>    handle_fasteoi_irq+0x114/0x1c0
>    handle_irq_desc+0x50/0x90
>    generic_handle_domain_irq+0x20/0x40
>    gic_handle_irq+0x54/0x180
>    call_on_irq_stack+0x30/0x48
>    do_interrupt_handler+0x90/0xb0
>    el1_interrupt+0x3c/0x68
>    el1h_64_irq_handler+0x18/0x30
>    el1h_64_irq+0x70/0x78
>    cpuidle_enter_state+0xcc/0x950 (P)
>    cpuidle_enter+0x40/0x68
>    do_idle+0x1fc/0x298
>    cpu_startup_entry+0x3c/0x50
>    rest_init+0x100/0x120
>    start_kernel+0x760/0x908
>    __primary_switched+0x88/0x98
>
> Jon
>
> --
> nvpublic
>
