Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46DF42F12A4
	for <linux-tegra@vger.kernel.org>; Wed, 12 Nov 2025 15:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762961588; cv=none; b=fZHjNDm68VEOxcNHN01c0Ots4dqRtiSmD6hhe7t7jXkq+HMSgvzIo7xti/bNwMuoEkkmAxsTNOEh3dmftvaMF8thNYEdgzyFKpxJEnN3AxqFFEXz2pkGBBDN1inNLLXlBFNVqfocjWfgz+KUWLoUCzEBR12cjMaRGDlN1jvQs+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762961588; c=relaxed/simple;
	bh=XLFrGmxqxG7Q1IgxDAhp5qnSB7x74ajHoEXlFxqzXQ4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=au1XKzXUle9pmd0UQXwTdqinHrOG02aS+sYfnX+LZaZporTR8p6PNdFOgFG5n8YhmA4TWdH8SKq6u88nHwiyTBwJ02e9M30/iok/EunI3MJyn9Qq6ujV/CTEaYwjdKeVgQhD8Gbp2A3nS4GKJ/oR+rN9gv+tNIDRcdu92hHgMC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wYNKJFCD; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wYNKJFCD"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-4ed82e82f0fso9486991cf.1
        for <linux-tegra@vger.kernel.org>; Wed, 12 Nov 2025 07:33:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762961584; x=1763566384; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bMcNb7SoixnA6u88veKhshVmeP80eCCwA8rrb4Ns/yw=;
        b=wYNKJFCDW5bYwAJDjUPRdbZYbvbOhnfsOxvvd1XEk3MyVtjBj4uBYSbfp3NRkrL91P
         iUBaDSWzxSdXqirub4uUVxjvX6ydr/ptUBuXVN4LTxkssMG2mPE92ZYunsO7C23M7Zgi
         Lrqrk1Gnqjwwv2+Or6+LVp2vQaA7TLyaVbyMvwQdwiCdxLtDA/cpoYagOD3qbvgAEMG9
         KWxX5BXlkE3zGudpTHye4tjcB/CgzOMBSo0NYy76wFD2ghd3Rqd3GpY81XQXh9Xv8Nze
         ENWXKFRMzcDGya6K2TaERayE0gbpn7Klb33gTCwrlsHLIUcG4Qpr72ufPydbUYpWWVjZ
         smjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762961584; x=1763566384;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bMcNb7SoixnA6u88veKhshVmeP80eCCwA8rrb4Ns/yw=;
        b=j8KkqtBqvoPMJPi+fHlm1seCreFgB1HjNRmpPkwKLALKh8cy0PEr7haqn2GSjEfLXv
         gYe9uLIcV+D5BSlt/6AzwxQgli+ALJodF+NnFP9tTnxOMr9Ks5Ochs97q2SOC5sBdru0
         7QhbV2vlskqw4witbEHYCRvFaSNL2WSDY9f+cPnudc/eUU7zWcAWQrZg5vEbo9XAJ7j/
         /oKYQUNPaHqUCroktai2YegLaMqaJD1kbfQRmp48JO8A8EFQUKSW/phwgG8n+rxiT8Jn
         vnoCUZYSZq4c6b2C4C5k+fHpC/k65hetkm5Ca85tAS69kZ0ds6hiKo+c4w71qsV3GcJw
         3/yg==
X-Forwarded-Encrypted: i=1; AJvYcCWg+e718/JNn2kLIse9/Rdc9E9/htTMt6lHI0hGP/h4e4W/6i33jxBN0YkQZXYjo284YklyP294rcNo7w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwAfn1qHbvzCZYZdWA6ur1O4DftzSEqfdsdn/DyR8vquBRbiJRF
	ArM0/u+JApz6UO271OKhb2dmBxwKV0KPCqBYwkVVWxVNCRZjBXkx7Dt/eRHuMI1TroL5Qf5zp3f
	UfuEjwToWC6hcQuaYzQkZMwue1jk54N3k0qA35kL6
X-Gm-Gg: ASbGnctp20lpNJjd88zjAaeDWGKczhDWvTD++yQP84tHMJYmvRDq7QoC3Gycc4U2jFu
	j6vehdzU5AmVnAjTmEWidYSpCWwK1lHC1xxditBzjOQtoZtp75S27io8A0OCo+46pJIElITTj1W
	+kiUuOz5k9dPhAACAiytvjl7PnCTqPDX/XVpvFJ3PinfaMzHq+4O660BpZiTZSsxTjikMtYHyxc
	7L6NUypbM2vw6ng9AL6Ch32WnUt1wn4hSrI2gcIb/UOw7wGuCiTcuQD7qtHbZUJ117EVsa88yQn
	OVfpx3w=
X-Google-Smtp-Source: AGHT+IG75iEi4ZlaH6jidIhVRT5UESC4urF6TMXlG0j6ya93/D8lIlzrWcXfH3kmZrDnKUxt1/E/vFx/aJIzSF4FKFI=
X-Received: by 2002:ac8:58cf:0:b0:4ec:ee04:8831 with SMTP id
 d75a77b69052e-4eddbdd664dmr36340061cf.57.1762961583579; Wed, 12 Nov 2025
 07:33:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251106202935.1776179-1-edumazet@google.com> <20251106202935.1776179-3-edumazet@google.com>
 <7460a188-3a74-4336-ae03-c88e21ffc1ca@nvidia.com> <CANn89iJBgaoVuQL7jgKwRJd8drpXYTLdGrJUpP9KVrzsPGK_Zw@mail.gmail.com>
 <ad338b41-fcf3-4861-8106-93e6d013451c@nvidia.com>
In-Reply-To: <ad338b41-fcf3-4861-8106-93e6d013451c@nvidia.com>
From: Eric Dumazet <edumazet@google.com>
Date: Wed, 12 Nov 2025 07:32:52 -0800
X-Gm-Features: AWmQ_bnfA467Pi33Y6hDB9sDXMwfEre9Z8O5bWRzygUFEKBv-1YluZ8wqSWyTY8
Message-ID: <CANn89i+UDX16RYo5jAKHhZ5cNstNjS9qzoogM+imUgzYMQigtQ@mail.gmail.com>
Subject: Re: [PATCH net-next 2/3] net: fix napi_consume_skb() with alien skbs
To: Jon Hunter <jonathanh@nvidia.com>
Cc: "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Kuniyuki Iwashima <kuniyu@google.com>, Willem de Bruijn <willemb@google.com>, netdev@vger.kernel.org, 
	eric.dumazet@gmail.com, 
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 12, 2025 at 7:27=E2=80=AFAM Jon Hunter <jonathanh@nvidia.com> w=
rote:
>
>
> On 12/11/2025 14:08, Eric Dumazet wrote:
>
> ...
>
> >> I have noticed a suspend regression on one of our Tegra boards. Bisect
> >> is pointing to this commit and reverting this on top of -next fixes th=
e
> >> issue.
> >>
> >> Out of all the Tegra boards we test only one is failing and that is th=
e
> >> tegra124-jetson-tk1. This board uses the realtek r8169 driver ...
> >>
> >>    r8169 0000:01:00.0: enabling device (0140 -> 0143)
> >>    r8169 0000:01:00.0 eth0: RTL8168g/8111g, 00:04:4b:25:b2:0e, XID 4c0=
, IRQ 132
> >>    r8169 0000:01:00.0 eth0: jumbo features [frames: 9194 bytes, tx che=
cksumming: ko]
> >>
> >> I don't see any particular crash or error, and even after resuming fro=
m
> >> suspend the link does come up ...
> >>
> >>    r8169 0000:01:00.0 enp1s0: Link is Down
> >>    tegra-xusb 70090000.usb: Firmware timestamp: 2014-09-16 02:10:07 UT=
C
> >>    OOM killer enabled.
> >>    Restarting tasks: Starting
> >>    Restarting tasks: Done
> >>    random: crng reseeded on system resumption
> >>    PM: suspend exit
> >>    ata1: SATA link down (SStatus 0 SControl 300)
> >>    r8169 0000:01:00.0 enp1s0: Link is Up - 1Gbps/Full - flow control r=
x/tx
> >>
> >> However, the board does not seem to resume fully. One thing I should
> >> point out is that for testing we always use an NFS rootfs. So this
> >> would indicate that the link comes up but networking is still having
> >> issues.
> >>
> >> Any thoughts?
> >>
> >> Jon
> >
> > Perhaps try : https://patchwork.kernel.org/project/netdevbpf/patch/2025=
1111151235.1903659-1-edumazet@google.com/
>
>
> That does indeed fix it. Feel free to add my ...
>
> Tested-by: Jon Hunter <jonathanh@nvidia.com>

Thanks for testing. Note the patch was merged already in net-next, so
we can not add your tag.

Author: Eric Dumazet <edumazet@google.com>
Date:   Tue Nov 11 15:12:35 2025 +0000

    net: clear skb->sk in skb_release_head_state()

    skb_release_head_state() inlines skb_orphan().

    We need to clear skb->sk otherwise we can freeze TCP flows
    on a mostly idle host, because skb_fclone_busy() would
    return true as long as the packet is not yet processed by
    skb_defer_free_flush().

    Fixes: 1fcf572211da ("net: allow skb_release_head_state() to be
called multiple times")
    Fixes: e20dfbad8aab ("net: fix napi_consume_skb() with alien skbs")
    Signed-off-by: Eric Dumazet <edumazet@google.com>
    Tested-by: Aditya Garg <gargaditya@linux.microsoft.com>
    Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
    Link: https://patch.msgid.link/20251111151235.1903659-1-edumazet@google=
.com
    Signed-off-by: Jakub Kicinski <kuba@kernel.org>
