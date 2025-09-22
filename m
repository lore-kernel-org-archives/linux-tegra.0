Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A987912C544
	for <linux-tegra@vger.kernel.org>; Mon, 22 Sep 2025 09:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758533214; cv=none; b=BmucId1Q1wd4v/Z2RwK5LYrPUN3+ixJcD9NnuPLGgPSiRtWZN6qnzReIv2Hyw0AjJD1FUq25Sj9v8R1rUNnqgY2kUrZ606z9mCA1AppmcpTmg2u3dLWUZMBL9ZmK3fJrvU7kK2QoBgatkIl3wyDCseIvT8MDWRw4UlcPf0nyeaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758533214; c=relaxed/simple;
	bh=9JrWEg4nRUPQ0c4UssG+3KfveXvJyaWiL/913pVnU8o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VPf75EpDlcqiJ3/F/MNcVpPGz3HY6hZ/H/hDZDIXef4qRxxDj0WvXvyqvl7IpqB9q3Tp9LiuHn1xGBLJVkjPEXvyrXNCxc7jA12j8NgXyJfcFA/CZ/Zixy6WjijwwlK+5GKkMgJ+OdEPSUZKawG9Rxe/q9VyWXVLQZjmJFuFl1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-7851b646dcfso670832a34.1
        for <linux-tegra@vger.kernel.org>; Mon, 22 Sep 2025 02:26:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758533211; x=1759138011;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rVYuCYK9Kvj3QHdD1tvpgcDHhvVlI3yo7fnDbEKQFYo=;
        b=c/rx2dbnHpcGhPc3coyWphu14ScPJ3yS61lZMO6qQsvfBHsvK6oSE3Q8LLO9GYeN6X
         SlBjwxwZrbFdoWIjzqPdUlxrFVJ66qdd2pKL7KKQi12jzKdaXfnbwtZIueSe+5+U6SbA
         Xfqok0iEiGPhjBzv80Q2biqee0t2N8S3pbjwjgrANeH8wYujFMF+ituUkUPRdmQhWdBH
         eJ+81ta2vmtJJ3ZyC6NQApMB7Hgm4ghi8cFTwIEBrxxUlLqfeZC9jEr6lV1k+jiCsENc
         hGNVAIoSAMsse8Keap/mwGwePo+5k1Ho3N88wK6pF5XKVmRJtRkdRhY6abJGN7HVmFSt
         rCBg==
X-Forwarded-Encrypted: i=1; AJvYcCUxgYuflDNqf4kH+xDGAOpyEy9+g+MwRhQUC9jG5XiFzRBBxaQ9VFjpmtKKQCVL5W7Q4VKqScXMBPTPPw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyCpv8wrNYUC4yQgDU9c+VK8Wtf1CpX+Sl1XInRDJFd57zsWTXw
	KlMfEJF4y96R7afSHP78kiN00PbEZ8NB0JC2i0T9wQzMydjn1N99F3USo5SZYMjZ
X-Gm-Gg: ASbGncuVSZQSaUKli36S7iSr59dm7s5zmjGRNqrLLdYW12puKfyol73soJ4hd5pPCKe
	fEIy79LW5sIH8jfgtgIojhqRT9/CLXhkL3PZUb5PstOcZpd3uncl6lvPaQgXuDCg24vvCwfli9q
	zBcYVrKbtVNEljr598/O+98lGzTRNDcaYhwD4TDzcRF0+aRujfwvVdx6k79kFerjuU1rv5ddEaW
	QhTMg2Az5OkZdkG9cT9hP3CQS+kS1vFm5H96kd8hsihzOgEGbUHpExizokcEDhxmOYq6t2vEqsP
	98HJCrsJ4mG6uCLEoZmxw2BWpS1gzNEABhEXhMN35FbdCyW2OnZusWylm0RvHI/DYq3P9BnKzKp
	uHwf5TbpcW8qfbdVtwhP9NhHtO7HuYxP+gz0Oz6MEQoOSALG76rbDuwsUYHRV
X-Google-Smtp-Source: AGHT+IGfAYhHUr49muKnaMfC1WvJFamyucmup92qza4k6FAzqaXAjZebgEEuiq7k9Zw+UGPQzT5Y8A==
X-Received: by 2002:a05:6830:6283:b0:745:5123:c53c with SMTP id 46e09a7af769-76f7c633922mr6124410a34.32.1758533211221;
        Mon, 22 Sep 2025 02:26:51 -0700 (PDT)
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com. [209.85.161.48])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-625d881f069sm3770886eaf.4.2025.09.22.02.26.50
        for <linux-tegra@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Sep 2025 02:26:50 -0700 (PDT)
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-621cecfcc04so2089536eaf.2
        for <linux-tegra@vger.kernel.org>; Mon, 22 Sep 2025 02:26:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUrNNMQpSAoupHBWiwP2JQQWcN21KroY+cOSOHzTR9aprJLTh3s+Ax35soFbBtBGswJoRtQ2R5QnRw6UQ==@vger.kernel.org
X-Received: by 2002:a05:6102:15ac:b0:529:96b9:1fce with SMTP id
 ada2fe7eead31-588f3728e13mr4100170137.27.1758532888150; Mon, 22 Sep 2025
 02:21:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250909162707.13927-1-marek.vasut+renesas@mailbox.org> <20250909162707.13927-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20250909162707.13927-2-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 22 Sep 2025 11:21:17 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU_xVfhay9r5pmj=E6k6EFts3YS8xmQFCUgTdm=eh8OZA@mail.gmail.com>
X-Gm-Features: AS18NWB7sUqLUtredbr9YhKbzrCa7HLSwrRuHzfalv-EHnhLzadagftJ0EPTHk0
Message-ID: <CAMuHMdU_xVfhay9r5pmj=E6k6EFts3YS8xmQFCUgTdm=eh8OZA@mail.gmail.com>
Subject: Re: [PATCH 2/2] PCI: rcar-host: Convert struct rcar_msi mask_lock
 into raw spinlock
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-pci@vger.kernel.org, Duy Nguyen <duy.nguyen.rh@renesas.com>, 
	Thuan Nguyen <thuan.nguyen-hong@banvien.com.vn>, stable@vger.kernel.org, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Rob Herring <robh@kernel.org>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
	linux-renesas-soc@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

CC tegra

On Tue, 9 Sept 2025 at 18:27, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> The rcar_msi_irq_unmask() function may be called from a PCI driver
> request_threaded_irq() function. This triggers kernel/irq/manage.c
> __setup_irq() which locks raw spinlock &desc->lock descriptor lock
> and with that descriptor lock held, calls rcar_msi_irq_unmask().
>
> Since the &desc->lock descriptor lock is a raw spinlock , and the
> rcar_msi .mask_lock is not a raw spinlock, this setup triggers
> 'BUG: Invalid wait context' with CONFIG_PROVE_RAW_LOCK_NESTING=y .
>
> Use scoped_guard() to simplify the locking.
>
> Fixes: 83ed8d4fa656 ("PCI: rcar: Convert to MSI domains")
> Reported-by: Duy Nguyen <duy.nguyen.rh@renesas.com>
> Reported-by: Thuan Nguyen <thuan.nguyen-hong@banvien.com.vn>
> Cc: stable@vger.kernel.org
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

drivers/pci/controller/pci-tegra.c seems to have the same issue.

> ---
> =============================
> [ BUG: Invalid wait context ]
> 6.17.0-rc4-next-20250905-00049-g13b74d3367a3-dirty #1117 Not tainted
> -----------------------------
> swapper/0/1 is trying to lock:
> ffffff84c1974e58 (&msi->mask_lock){....}-{3:3}, at: rcar_msi_irq_unmask+0x28/0x70
> other info that might help us debug this:
> context-{5:5}
> 6 locks held by swapper/0/1:
>  #0: ffffff84c0e0d0f8 (&dev->mutex){....}-{4:4}, at: device_lock+0x14/0x1c
>  #1: ffffffc0817675b0 (pci_rescan_remove_lock){+.+.}-{4:4}, at: pci_lock_rescan_remove+0x18/0x20
>  #2: ffffff84c2a691b0 (&dev->mutex){....}-{4:4}, at: device_lock+0x14/0x1c
>  #3: ffffff84c1976108 (&dev->mutex){....}-{4:4}, at: device_lock+0x14/0x1c
>  #4: ffffff84c2a71640 (&desc->request_mutex){+.+.}-{4:4}, at: __setup_irq+0xa4/0x5bc
>  #5: ffffff84c2a714c8 (&irq_desc_lock_class){....}-{2:2}, at: __setup_irq+0x230/0x5bc
> stack backtrace:
> CPU: 1 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.17.0-rc4-next-20250905-00049-g13b74d3367a3-dirty #1117 PREEMPT
> Hardware name: Renesas Salvator-X 2nd version board based on r8a77951 (DT)
> Call trace:
>  dump_backtrace+0x6c/0x7c (C)
>  show_stack+0x14/0x1c
>  dump_stack_lvl+0x68/0x8c
>  dump_stack+0x14/0x1c
>  __lock_acquire+0x3e8/0x1064
>  lock_acquire+0x17c/0x2ac
>  _raw_spin_lock_irqsave+0x54/0x70
>  rcar_msi_irq_unmask+0x28/0x70
>  irq_chip_unmask_parent+0x18/0x20
>  cond_startup_parent+0x40/0x44
>  pci_irq_startup_msi+0x20/0x58
>  __irq_startup+0x34/0x84
>  irq_startup+0x64/0x114
>  __setup_irq+0x3f8/0x5bc
>  request_threaded_irq+0x11c/0x148
>  pcie_pme_probe+0xec/0x190
>  pcie_port_probe_service+0x34/0x5c
>  really_probe+0x190/0x350
>  __driver_probe_device+0x120/0x138
>  driver_probe_device+0x38/0xec
>  __device_attach_driver+0x100/0x114
>  bus_for_each_drv+0xa8/0xd0
>  __device_attach+0xdc/0x15c
>  device_initial_probe+0x10/0x18
>  bus_probe_device+0x38/0xa0
>  device_add+0x554/0x68c
>  device_register+0x1c/0x28
>  pcie_portdrv_probe+0x480/0x518
>  pci_device_probe+0xcc/0x13c
>  really_probe+0x190/0x350
>  __driver_probe_device+0x120/0x138
>  driver_probe_device+0x38/0xec
>  __device_attach_driver+0x100/0x114
>  bus_for_each_drv+0xa8/0xd0
>  __device_attach+0xdc/0x15c
>  device_initial_probe+0x10/0x18
>  pci_bus_add_device+0xb8/0x130
>  pci_bus_add_devices+0x50/0x74
>  pci_host_probe+0x90/0xc4
>  rcar_pcie_probe+0x5e8/0x650

> --- a/drivers/pci/controller/pcie-rcar-host.c
> +++ b/drivers/pci/controller/pcie-rcar-host.c
> @@ -12,6 +12,7 @@
>   */
>
>  #include <linux/bitops.h>
> +#include <linux/cleanup.h>
>  #include <linux/clk.h>
>  #include <linux/clk-provider.h>
>  #include <linux/delay.h>
> @@ -38,7 +39,7 @@ struct rcar_msi {
>         DECLARE_BITMAP(used, INT_PCI_MSI_NR);
>         struct irq_domain *domain;
>         struct mutex map_lock;
> -       spinlock_t mask_lock;
> +       raw_spinlock_t mask_lock;
>         int irq1;
>         int irq2;
>  };
> @@ -602,28 +603,26 @@ static void rcar_msi_irq_mask(struct irq_data *d)
>  {
>         struct rcar_msi *msi = irq_data_get_irq_chip_data(d);
>         struct rcar_pcie *pcie = &msi_to_host(msi)->pcie;
> -       unsigned long flags;
>         u32 value;
>
> -       spin_lock_irqsave(&msi->mask_lock, flags);
> -       value = rcar_pci_read_reg(pcie, PCIEMSIIER);
> -       value &= ~BIT(d->hwirq);
> -       rcar_pci_write_reg(pcie, value, PCIEMSIIER);
> -       spin_unlock_irqrestore(&msi->mask_lock, flags);
> +       scoped_guard(raw_spinlock_irqsave, &msi->mask_lock) {
> +               value = rcar_pci_read_reg(pcie, PCIEMSIIER);
> +               value &= ~BIT(d->hwirq);
> +               rcar_pci_write_reg(pcie, value, PCIEMSIIER);
> +       }
>  }
>
>  static void rcar_msi_irq_unmask(struct irq_data *d)
>  {
>         struct rcar_msi *msi = irq_data_get_irq_chip_data(d);
>         struct rcar_pcie *pcie = &msi_to_host(msi)->pcie;
> -       unsigned long flags;
>         u32 value;
>
> -       spin_lock_irqsave(&msi->mask_lock, flags);
> -       value = rcar_pci_read_reg(pcie, PCIEMSIIER);
> -       value |= BIT(d->hwirq);
> -       rcar_pci_write_reg(pcie, value, PCIEMSIIER);
> -       spin_unlock_irqrestore(&msi->mask_lock, flags);
> +       scoped_guard(raw_spinlock_irqsave, &msi->mask_lock) {
> +               value = rcar_pci_read_reg(pcie, PCIEMSIIER);
> +               value |= BIT(d->hwirq);
> +               rcar_pci_write_reg(pcie, value, PCIEMSIIER);
> +       }
>  }
>
>  static void rcar_compose_msi_msg(struct irq_data *data, struct msi_msg *msg)
> @@ -736,7 +735,7 @@ static int rcar_pcie_enable_msi(struct rcar_pcie_host *host)
>         int err;
>
>         mutex_init(&msi->map_lock);
> -       spin_lock_init(&msi->mask_lock);
> +       raw_spin_lock_init(&msi->mask_lock);
>
>         err = of_address_to_resource(dev->of_node, 0, &res);
>         if (err)

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
