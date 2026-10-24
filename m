Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.161.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1792864335;
	b=HTbchF7+SIgCBMNu8xEehYsa+AvA/trzD0mnTDXjQSHQKWjpuoXsP+xnIEVETScxKFWF
	 IEvOmmOKnCijgDb0ETJtoqBZEcCf4YVAphjJSUQsuSyLen7IEtC6KO7wq3Iic/SSB04vG
	 ETKCtIfME0HqSZNc7jqEbKR875MlWGjBENYMqXRcXgyVloEWzYNsYanLpyDTJmv/4c0Kw
	 zV3HIX/tn1a3YhOaUc+gt4fmoexE2G1h6mJvfJe+MYXE5SVEUkXxj7bFmzpni5KNTJCup
	 5b0873KEjDXX4oEwSF+FXpbkKH0+Ytg87wM3KzTtOz0yhb0Vgcf4JhynblXjNdnNR1w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792864335;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=bpEwuRreNChB+u1Z6agfQGrbJBQaLJYv0EH9wyrxoFE=;
	b=EnW5mZq6wM+WiTUst2GwYu4Cu5hFHWT9vgW46MM3b0K9gNJJrei+2PQYhakZ7dgK8caz
	 BkM8J3AzLLdSXiiKBB/I0VItV4G1mWiwe+ibQNR+ZPOrclD1mtQH+/d4BagSS7ovcP2de
	 eUcCzvLCtosVGRwX/aomRXTLLOnlP5aYaA2Ui3XyPhSQntVNxwBYzCrnq1wP4y3CRuAQv
	 yaao02+jnJH2QfFTuYrx9EozdgUlcyR/INg6N6+bQhpMXVPFb7l8PZO9nBc/JTgxAQpLB
	 Up730ND3ZMdtvxLK2Ce2oXfIj5QFAakB2B8ZSV8OxzvlKFxKdApoQVbIbJPawROIQFw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=BMsFzLFx;
	arc=fail smtp.remote-ip=209.85.161.41
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35BF8606A31B
	for <linux-tegra@vger.kernel.org>; Sat, 24 Oct 2026 17:52:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35BF8606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=BMsFzLFx
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-6f74f6b46abso957007eaf.0
        for <linux-tegra@vger.kernel.org>; Sat, 24 Oct 2026 10:52:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792864334; cv=none;
        d=google.com; s=arc-20260327;
        b=pdl/hIm57MpcDt30DFqwX1Yn9dV5VIPkgTqyQtLX34jdZgF9KbA6VfSZX5fCWHmd0/
         w0rQ0oloRSzEnLY5yNJ2yWSYzc3C8pGXJvCMX/106wJ4GIvmRNF5ykyfnkkAhEeY9yol
         zJ2jjN4sbSDcTRxyO3X9mL/KRi6OSPa+3z6yFWNfeKhH2EW+8jGg0JmRmMoiC5HCoKwG
         StVWdxh0POwXobzUzp+qRkFq+yZlE+TqQQ+F1w2jZKRQFAkeWzkl7powilE4Sz0OSLsi
         a2eOWlKci5YRhbf0/aYLmiKEf7pFbKoBAQp7QAyJKuGxoK/qEHvDtrJfnNwFQbnfjLxu
         XwWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bpEwuRreNChB+u1Z6agfQGrbJBQaLJYv0EH9wyrxoFE=;
        fh=RLMs3nYEq22MnI5TU/uOOddMyd9FfySZ1prY+I+4LPs=;
        b=fueUWlEfnqI1NjmBgp1LV40iZkfnTnyOVVxu2PA1EJHeLFEML1ph1aVl/fKJvrFfwW
         3xXDoiD6sbf27KCFcKFZv17Lyac4RxXv3JzHI/LzWTKF7kbrK6dVir89w/bDaPKTCsv1
         4PXGgXESGLb1cq09h7Lp5L97Miw6wDR2O6eVf7LvYGOcJB++odfedswqRUMblRPu99gp
         Xmnh7IgEOQuaMIO492dIHJPAglYfkCcBh393dpsulST/ZaZD6XnzeNihe6l8jTSPV+hm
         F0VEho20iv2yhlRliyQCgtLHJFFm7eXtqWhOwp89TzfUJQobKS6shpWb5fxznPCZyB/7
         CPJg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792864334; x=1793469134; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bpEwuRreNChB+u1Z6agfQGrbJBQaLJYv0EH9wyrxoFE=;
        b=BMsFzLFx3LtutkGefGNi/ZDmwTWkJozZ+zkbE47xwz4ri+SpNNb28gTxC19glia4OJ
         NC8YdiMng31PeB1TQUmUjtnNQHcrMg1I3cDF0Mm+IPmzaU/qXWkK6kNLcYCecHFD06q7
         xTISCk/Yh2Hiov8JBavC7yZCG0Hn1xfVTCCXD4Gg6YYcVVYmq4YoT+L8ZiOUkEmQ1Jjo
         FQs4mIvcW5kQ8dlZRYoPnpR0JX4Ubgua8025OcwsRSoFQXmuWU78LOUdiGw/ofcjY0pI
         4u2UKKzQppWBdJyxPEN/NQA3WUWErZ+MQ/jBleBREFCg42KEo6KRgaYSfsCYlk50iHdy
         rBOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792864334; x=1793469134;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bpEwuRreNChB+u1Z6agfQGrbJBQaLJYv0EH9wyrxoFE=;
        b=Pymvw223ZtXnOGiIZJwgcX6VydyBkLk8OVqlA4POFPCE9JAoHinlsnHipMQZVzteUB
         nH0AmD9SZRiSpguL0yhIW/ncFw7SGwV7+VGyATkdFCeookXl7pZu6YGuPxrl74TXuHms
         F6vFCeCYSYEFNhC93FFaQuMye6eWfTFb8NtTTc2xunp34gmr9VQxMyJfIVWX9hEqW2OF
         8qBcSO1H87EgaXANNxu9lj4P4dr50zcRzh5Q151bnTZOVOXYnrnzgOsCJEMuM/E2Th2A
         rZ5FYSH1MgDbduLq46z0Kg2wwdbD137Nd1eJDsi7UQHt43iBBvpKT8kOdm2NPP/sYxsf
         v14A==
X-Forwarded-Encrypted: i=1; AKwUvBycHxyZEz7ZL+EZLoFAKdrYpbDgKDHgHd/+HYXyrnA3VAUDnDmL24lRkZffZZcWFe4SeRABF49c7HOeEA==@vger.kernel.org
X-Gm-Message-State: AFq9FYIz9rxtCRPPm8lIM8WfBpYtDXvZo2CQlmOBUjkQ9xZHxnmE4DOr
	8UbN5PIH3srPsm5UddfNNEBGkdo50z9yFbNkjGdIJhdTLaKe5UAghXy5ct8ARzo6aNagiHtVwUC
	VIxU5E/prc12jxGHfFgpY8rNo1tnb0P0=
X-Gm-Gg: AYBFou2h8JjcxmgiitOY5QxjNfLE9d9feofmxfky7XKJ5fvr44ARk72L++9PfJtso8a
	qapNCVYYwgaf9f1b0+GNiYYFICYmObbnepvxKNLWk5n2p9HZ2UvpCepLkkLXxttaCoqfJwliRW7
	7sC0Qui0KTNGAnVNIS1Pn1XIDKF//gzrDlcAHLSZwgVGMGYA/PNDTp+5+ggbPjWlhsUj36Taols
	uHQS7ladpSoXm0Y7+DAwaInYuPbKUVbt2pC1SaMWwiovOz3AG9snHHSF9qzaS3DsEjvQBoTa6WQ
	uCM80nMUViuP24hhVhz1ILIKFngnHZ5VqOfNszZKX6LAVToU3iGrCOgXazpX+lY2N9EbGtWJseq
	bvWsYkDWw7uAXyO5s5Hrk/fJaJ+YjWDGR+A==
X-Received: by 2002:a05:6820:3285:b0:6d0:1fe7:1744 with SMTP id
 006d021491bc7-70ba0ff44acmr987867eaf.83.1792864333972; Sat, 24 Oct 2026
 10:52:13 -0700 (PDT)
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261024172426.85842-1-kmehltretter@gmail.com>
In-Reply-To: <20261024172426.85842-1-kmehltretter@gmail.com>
From: Nicolas Chauvet <kwizart@gmail.com>
Date: Sat, 24 Oct 2026 19:52:02 +0200
X-Gm-Features: AclHuK-D5m-VTC9W4g1jyUecKnd6iuPcMx40ZM19rHe_pOaJrrAaaS8tE7DJczw
Message-ID: <CABr+WTnD8RXfth=MT562uPT5qn6VefvcF0CbEn+Ye++nFRji3A@mail.gmail.com>
Subject: Re: [PATCH] PCI: quirks: Skip nv_msi_ht_cap_quirk when host bridge
 00:00.0 is absent
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, linux-pci@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le sam. 24 oct. 2026 =C3=A0 19:25, Karl Mehltretter
<kmehltretter@gmail.com> a =C3=A9crit :
>
> __nv_msi_ht_cap_quirk() runs on all PCI_VENDOR_ID_NVIDIA devices to
> enable or disable HyperTransport MSI mapping relative to a host bridge
> at bus 0, slot 0, function 0.
>
> On NVIDIA Tegra SoCs (such as Tegra210 on Jetson Nano), the PCIe
> controller exposes root ports at 00:01.0 and 00:02.0 with no device at
> 00:00.0, and the root port's HT MSI mapping capability is already
> disabled (found =3D=3D 1). Looking up 00:00.0 returns NULL and logs a
> false-positive warning on every boot:
>
>   pci 0000:00:02.0: nv_msi_ht_cap_quirk didn't locate host bridge
>
> Return silently when no 00:00.0 device exists on the domain, matching
> nv_ht_enable_msi_mapping().
>
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
> ---
> Observed on a Jetson Nano 4GB (Tegra210, p3450-0000) booting v7.3
> (c03c1a14507d), where the Tegra PCIe controller (1003000.pcie)
> enumerates the active root port at 0000:00:02.0 ([10de:0faf]) with no
> 0000:00:00.0 device on bus 00:
>
>   pci 0000:00:02.0: [10de:0faf] type 01 class 0x060400 PCIe Root Port
>   pci 0000:00:02.0: nv_msi_ht_cap_quirk didn't locate host bridge

There is this patch that was well tested on the tegra side (but likely
less on the older x86 nv cases)
https://codeberg.org/libre-tegra/linux/commit/63f7810994f4d2866a27b753ec8d5=
bc36e84373c
