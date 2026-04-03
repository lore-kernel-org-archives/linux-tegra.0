Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74B212517A5
	for <linux-tegra@vger.kernel.org>; Fri,  3 Apr 2026 16:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775233204; cv=pass; b=IuBiwclW0j3GcpIiPFiIIFTMh7yldnjgZlk+ARhcwiHviDA9EgkUxCUaE/8Ax47dW1I67/QAdh202G1aACelqV0+xcWNOBkLqEGN/oMNRFMLjrng2Wmtt7NAJutl2NI2yzw5d9fCbP2ESaqUPAUAx0i5GN7wvWga/4k9lXOI/ow=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775233204; c=relaxed/simple;
	bh=D1y1DSZ24fieEFS/2aK46LPRiEzKTQE6w5wGIEwhqyA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CcnPEF0QYcqTueh5HCCaOvXCSf1wgftihLoQD1+rwiLsPETP4EHkeKtNjWcEHdiX2LRuQcdWOrThkjOtXyVxIqOgjGZ2yK+avGSzjaDFFgl/FCXmWci8ObNQRG9U/qaTz6GdQk/qMeGXWTYS6IYZNZJGilw1jxCsYPFGa4xA+qY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LSqLh9dz; arc=pass smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LSqLh9dz"
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-7d7eb85fb81so2115283a34.0
        for <linux-tegra@vger.kernel.org>; Fri, 03 Apr 2026 09:20:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775233202; cv=none;
        d=google.com; s=arc-20240605;
        b=V6QjLSCF4zoSEKsVvlU7kIW4HYxZvsXyoHPnDk5kw0UDwZXABtTzQOBp1LSQbkmyow
         OIKog63sB+IDcravS3PFH1m0STyszKdk18p/enLOcuugl41IVUMnG/SDJt0alD3fxXId
         ECZkee5Clf56/sfWduQVYBE/SqZJknZ0iI9HUH17Ip/AgZ6yXBJkrOBOqHw0GKJ16/RE
         ao5z+zt6J3FbgHRlK5OalcOK2MX/eOvdKkElhISKZDitjWCG/1YHr8g9CuxHG3zdMmdQ
         7rhyr1mipfT/eCle2Cw5u7XGDVFthsc7WfcnQSlR2nHCTnN+Sszkxe55b71MpxPQEuOI
         lnhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+V1E+/KFBONHYKrDP8YAiJIHIjVU2b7P8j+yHhcYHMc=;
        fh=9JZq8trWPsHJfelEvWU5kHXhk3/02FK/TogASfOrW74=;
        b=jGHyL9LDBEiSER5JegJzasSHng+pXnnE8xhqKn+WzatG/nK6vVOD3kBeg8KR8OOh8S
         s+Ke+8gDcsK7Xs+kb0sZ5e2XfHYap55pqypC+fdn2wH9WgRbzwcaad94Xw2QaXx63sU2
         Rrr3xBO1kwlrl6pc40JtVjX5vG56OW8wFgycKIAuVh5ziGG7I67P6KHfGcS/nAMQxb2B
         sCmEziKL/dxEBdebpZwyiDEAGir1qjHSlrK8uwYpUN9iHYRfT2SY123AoSqSZz4abaXR
         ubs5bOdNlKoSFumRJ3CVBbjJ6hx9xmZK3Ww0bwmWZGq0yQrs637L5qwVu35zEg0woxLs
         V3XQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775233202; x=1775838002; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+V1E+/KFBONHYKrDP8YAiJIHIjVU2b7P8j+yHhcYHMc=;
        b=LSqLh9dzKcgeO58OJAjNLJC3lkpslDPlFFLi0iEoIZqyBUC088MzlxzECPWTAUiS/Q
         /ai81neGRzHMqoVFv9E/dqzsM5WBRYBDC82MKQ53uRrReJ6Eyp+vIOHTmMBw1clWx51X
         GkNWd/Y8Q/UfzO5ZUzosW2rjL+0EHW8bEtIGBU27hUxiCc0suA5HbmmVYEGnh9KWdNT5
         yDrqOhq1n72N9INnN6jJ2y2INxB5igtLJy+GVe7gldauZMdhN+blFzHFWnNGi3mCQHY9
         JA11P1zzhc/ujHBWispYtjoD+ug/uzJdKLloyrOpphG1RWGZxhtUNbQz/y5st88LB427
         9Dpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775233202; x=1775838002;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+V1E+/KFBONHYKrDP8YAiJIHIjVU2b7P8j+yHhcYHMc=;
        b=di+SFBsgn6B89DOHs193aV4AnA8dxzcrNyaaS3f9OCfSzclqeJ0a+P9TRIrfpABeHB
         p4jSfeW5FY+Pois/N5ShZZe8qo6mMgvYofTwbChMpnubTcY8sWVtE1H7A3/Qek16opVP
         l04gXa052XGUz4wPjRRq9AOYJp9tTKO3yAxCG/GZdt8SbiI5PnD/gsx0Ai0OiLPmKJgh
         cI1hWjrOFPBUgPrN5CFTnNhVExyEhcb2XCzufMFzxrEMj+Koz+nzU+yGSqFA/Y7Cs09n
         jq2I+Od0m/A5ovGsPWo3GTUqh3lvFNn19ho8e9r844MU5k1UqkxC1/GflLDC5GSzy/6b
         IciQ==
X-Forwarded-Encrypted: i=1; AJvYcCUBlk0G+qCLVnoK1GkY2lz4p9/eg0hEBJPPHEMjrgs35shdcpX+BLvbvA6aySXTz/+CKdxlW6SpCLxX1A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzYJ28tnazfRqcJfJGru1pX2MPMBrNqShZh28SAFJbEY4wt3SWT
	tznY5Q9+naMrHH+CrTUCcUEUKEfsdAVeWl9X/4fMm7UOoDWTlHQ2cB+piZQk030D4SDaPKObDyP
	3rkW2bfYf8+tYnuoPmrtpIvYMNhuxOTg=
X-Gm-Gg: ATEYQzz4dYNY8Iu5RIXLfX1DWal+qEt+1Sz1OR/OY39idYVM2fR0jmyc30uyWhwkrJU
	uS2vZzTuNHEMa5ZFwi2u5gqpSbVBrpyQv+6F+Ene4yPRaCeD+Ons/pjeJOKnca2xcWJYGJPqSRf
	epdrbtYR8uQO3VmPuS60R35tjdXg27fzUBXlr6EGXFEKfYC3qR3lpErwqFRZ54k4GpwzR+ULTB6
	sFC4Lupq9iDgdAS9eZU5WzkewHlygYCOdTBdW1sbp3tbXE1Al9d3qoCDH03OKfwvGdLaNXsTcY5
	j8RoyVF+
X-Received: by 2002:a05:6830:83ba:b0:7d9:ad90:5677 with SMTP id
 46e09a7af769-7dbb75d7260mr2353806a34.30.1775233202503; Fri, 03 Apr 2026
 09:20:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CABb+yY0ub51k-eFpPfgARXtwYjWzRSjbPDLtoMD77YQR8JH+=Q@mail.gmail.com>
 <20260403145119.2581034-1-joonwonkang@google.com>
In-Reply-To: <20260403145119.2581034-1-joonwonkang@google.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Fri, 3 Apr 2026 11:19:51 -0500
X-Gm-Features: AQROBzBimCWicSTdSy1XOK425eepJ2fZaf0LPQosLeZZ5fVq1iHQtw7KN5njBvw
Message-ID: <CABb+yY0uDQh-3cadPQONV=NJKjMtc4mJekgjmHYVaHnfHXvGZQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] mailbox: Use per-thread completion to fix wrong
 completion order
To: Joonwon Kang <joonwonkang@google.com>
Cc: angelogioacchino.delregno@collabora.com, jonathanh@nvidia.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org, 
	matthias.bgg@gmail.com, stable@vger.kernel.org, thierry.reding@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 3, 2026 at 9:51=E2=80=AFAM Joonwon Kang <joonwonkang@google.com=
> wrote:
>
> > On Thu, Apr 2, 2026 at 12:07=E2=80=AFPM Joonwon Kang <joonwonkang@googl=
e.com> wrote:
> > >
> > > Previously, a sender thread in mbox_send_message() could be woken up =
at
> > > a wrong time in blocking mode. It is because there was only a single
> > > completion for a channel whereas messages from multiple threads could=
 be
> > > sent in any order; since the shared completion could be signalled in =
any
> > > order, it could wake up a wrong sender thread.
> > >
> > > This commit resolves the false wake-up issue with the following chang=
es:
> > > - Completions are created just as many as the number of concurrent se=
nder
> > >   threads
> > > - A completion is created on a sender thread's stack
> > > - Each slot of the message queue, i.e. `msg_data`, contains a pointer=
 to
> > >   its target completion
> > > - tx_tick() signals the completion of the currently active slot of th=
e
> > >   message queue
> > >
> > I think I reviewed it already or is this happening on
> > one-channel-one-client usage? Because mailbox api does not support
> > channels shared among multiple clients.
>
> Yes, this patch is handling the one-channel-one-client usage but when tha=
t
> single channel is shared between multiple threads.

hmm.... how is this not single-channel-multiple-clients ?
A channel is returned as an opaque token to the clients, if that
client shares that with other threads - they will race.
It is the job of the original client to serialize its threads' access
to the channel.

> From my understanding, the
> discussion back then ended with how to circumvent the issue rather than w=
hether
> we will eventually solve this in the mailbox framework or not, and if yes=
, how
> we will, and if not, why.

It will be interesting to see how many current clients actually need
to share channels. If there are enough, it makes sense to implement
some helper api
on top of existing code, instead of changing its nature totally.

Thanks
Jassi
