Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24D4A3DA5CE
	for <linux-tegra@vger.kernel.org>; Thu,  2 Apr 2026 17:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775152786; cv=pass; b=j7z2ms/9lK2OfHu2Y1TnAoeWCrG58UEkvQjUi17LnswZ7WNFNTuGe+qxF8B/v7I1Y0F9kscQsz0zUXrV/PQZXs6/rF1TOt+zhey3tgMQXe2D3wWA2O48NNJwwvcXnfR/TCeBOuBsAZh1UZiPErt9LdjfLpKWj2XjmqrjaJEMN58=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775152786; c=relaxed/simple;
	bh=h8gHEy/QL3Y3VZcM7IRovIie1NiKMInttxTfM5XohLM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=To3LTBCtef80dtfeRg8wsGGntq7UwjV9ciK35A6ZhWmsIqeL8N3Zi1DAHZwKo6jXJFg7JrYbzIowtycn8pG3j0I0exCmJYQLwMrymAEmlCr9A0lQmzg1/SUsSZfMDAG/rXZe1h7eiDlL6SbyiOMRApDHoPIhonVjZ4irZ4Ed5hg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oRDRVYNO; arc=pass smtp.client-ip=209.85.167.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oRDRVYNO"
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-4671cbce32bso261633b6e.3
        for <linux-tegra@vger.kernel.org>; Thu, 02 Apr 2026 10:59:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775152784; cv=none;
        d=google.com; s=arc-20240605;
        b=eLEZPZQdmvCdhSE1PiDSJn/q0m5M43ynBaw+6CVo4JCNPNa9E/efNBBcfQqg7K9rDS
         Ng7FQTJsl0QHiIWtk5l6V7JuIy0A+5TJiKMBRQZMFPg5klajHDjfLhBLmYRjl0wNdQU9
         BXsvsolvQUFwkvgl1M72lkrcCFYtjTGTJ4MmrXw7I7GLc98KYdPxAqv+fmy0ceLCmQGt
         r9ZQFuI4f4yAFgZbhprp5BjdJQ5LNDubTaAphAlg3oODArNTCjbSPDbhVBgOl5zgoqmk
         l1rSmlFhM+5Xz0x9DI46rgM2Xi3HRpxiymyotgoZORR3qmyZB2kCpl4F1hxpJs9PlAfk
         GWmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6oBfne9CbSq7TsD62MWlNbHi0ATWBOcJIGvZTuwhO+c=;
        fh=/ZBHHMb1tlO5RQ7wY4/LTraVfDQor2E8taF5atXsbuA=;
        b=QgwYgZaEKE6bCNrjAqokJNErQ03M9/6x715t9VbD1MWtEu92oOb/TILY66MMRwkgQC
         a373Q3mGqrcX5Ih3ZDQykey7ULKd5TqnYquFaGzW0yHphNdzVSL8XWC9PUWaRu145gVW
         j26lxb5ADor5xiRq+88Ji+JSQsedFUzqRlw7x4Fkp1ZWV/k/I0q7QsYNoBGVyIoZrUJA
         ojnKxsqLtGr9Qc1YhzAAF5rV1rO3V6TzJRpU2XyHMbmQpP0TT42dqxlO/Dx7X5q8iOXx
         J7GwnyQzRsIzVGNgWaVlxFTkKLT7d+l1FliG2KVhg+jN7pj2yyca/VJV74o2zE+sOT7d
         +8+g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775152784; x=1775757584; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6oBfne9CbSq7TsD62MWlNbHi0ATWBOcJIGvZTuwhO+c=;
        b=oRDRVYNOSBnKTAVxkKyJokHK2Vhg+kFwt7+Xj9sByK9O45EV2zmpAj26sVwijltkRb
         TmZ3LRBGwWKalGdDgffYzclhmxhQXGr8Td2zvBNZDER+HUhkgnMHlk27gQc84p6xnTb+
         6HU1buSBR9filMZRXdm6P2u2bMbrgskRFadqHQYMDcJjw0nvl5z1K6pPCOfAtcIXCjTH
         pTx8UMrgZ0oXMU06DIRwEYcwhRuxPicjnbEya2AvMmUnuIjdaIjcXryjzv9+NwKaoM7T
         CFSd9G3v3QG6sBX8V7fEGz5hg9oVHDobnUFr+EkNAKFvxBCuhTpXwD9UEpEoGl/6QGeI
         Bdow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775152784; x=1775757584;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6oBfne9CbSq7TsD62MWlNbHi0ATWBOcJIGvZTuwhO+c=;
        b=Mhf1RFyx34cEFkq+JGjk6BaP6wCXX0RoV9eIpjJTCaKquuY6omnRFZ2enhrs2wyeWn
         5ufVvt1sCL68lWbukh0CqEMLod8fhsgfiu5z2gqXOu/u0YaTWN3H63FyYu+aXU9D1UYx
         Maav94v00+UeIOS5PjhanP54zcHQUvIzeoD4+wgPT+NxgKZ59m6e0Y9+hJU3TU+6HDvG
         23SBw5oqCabNuShrszpbujAwLwCo1mMnJ3yv0vq0ZoTOgQgIVKl/momcu4PMhA1cfGHd
         qiAOdlreqSK9ZPOtQsa7BGPSlp2OAwS25UtoPiO5rifHXCRBlLLV9sTv7xFMY4SbN6Nb
         HszA==
X-Forwarded-Encrypted: i=1; AJvYcCUrd+1Z74Zl3F+nzN7TazuwFef+PSd6mXeMhbkXe2Mgqlg5qNZ/LeL7OcQvw4dvyc1I5gOHUBg2llsatw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6t1MMe301Gf4GjnMe3RpnFtt6Gx1azxC0zFXZ+8idE6Zpee67
	dY6iC4mxlJuWCbnbG41OMrupAus4GjWOxFc49D1mWZRbswO+zD3WDIjVllqbvPZvJlVMV/lNVYE
	QOv+gwHwTdPjUkutR8GW6Tb2VVpKbNmM=
X-Gm-Gg: ATEYQzx5AyiRqVrorvQjqXVgdst0XK6iTAG9Z9CB3CpSQLLXqwgYvbS0M7HWU+3BFWI
	6+C+de4Dy6jfWET78FYUHj1BZxZTRUcPKs+5bU1qCHy+BfJMwX7vsGbHlqH2CLUrwr3cE6py6Ky
	Y4szgbjzwFoiyUjuoZMzOPQgcHsUTMu72w1TbotLzsYd0daksKQ58IsAAyQomlq+WPNjwD4WWnK
	LgEAHwF+1MVV53IyTkVUPfTtGVOk6ymS9NLrgDT9ZlcxA4irblTJ/9ht312+/ai9XPbQDy4YZj/
	3QJDKvLN
X-Received: by 2002:a05:6808:d47:b0:450:bbed:7a75 with SMTP id
 5614622812f47-46ef7309386mr165326b6e.28.1775152783969; Thu, 02 Apr 2026
 10:59:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260402170641.2082547-1-joonwonkang@google.com> <20260402170641.2082547-2-joonwonkang@google.com>
In-Reply-To: <20260402170641.2082547-2-joonwonkang@google.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Thu, 2 Apr 2026 12:59:32 -0500
X-Gm-Features: AQROBzAmx7Mp6DrgKOrwAcb8k8UUyDzlYzRN_6Wdz-72pTbSanHYGSjh0AuoTJQ
Message-ID: <CABb+yY0ub51k-eFpPfgARXtwYjWzRSjbPDLtoMD77YQR8JH+=Q@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] mailbox: Use per-thread completion to fix wrong
 completion order
To: Joonwon Kang <joonwonkang@google.com>
Cc: matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
	thierry.reding@gmail.com, jonathanh@nvidia.com, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-tegra@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 2, 2026 at 12:07=E2=80=AFPM Joonwon Kang <joonwonkang@google.co=
m> wrote:
>
> Previously, a sender thread in mbox_send_message() could be woken up at
> a wrong time in blocking mode. It is because there was only a single
> completion for a channel whereas messages from multiple threads could be
> sent in any order; since the shared completion could be signalled in any
> order, it could wake up a wrong sender thread.
>
> This commit resolves the false wake-up issue with the following changes:
> - Completions are created just as many as the number of concurrent sender
>   threads
> - A completion is created on a sender thread's stack
> - Each slot of the message queue, i.e. `msg_data`, contains a pointer to
>   its target completion
> - tx_tick() signals the completion of the currently active slot of the
>   message queue
>
I think I reviewed it already or is this happening on
one-channel-one-client usage? Because mailbox api does not support
channels shared among multiple clients.

Thanks
Jassi
