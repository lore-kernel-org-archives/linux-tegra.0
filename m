Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 076051F5858
	for <linux-tegra@vger.kernel.org>; Sun, 10 May 2026 05:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778392244; cv=none; b=LJilnTMJeA8GtUfhBy/l19wHuECuxEgiWQDMc/L+nHD8qsOTZnZqVwkxhV631UjQVBgs7qCN/JxrOky9VmUO3ag9gemvw103dZZ4CHYU/+aCL4Ja8tmDbq74LyzpNb+SpqwcLCI+74V27tKYbdypJjXtLFxH2IuRdEwQ5qHOvzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778392244; c=relaxed/simple;
	bh=XL+vINExhFuMQTTP70V6I3aF4N0+NgyPBdsvLAORuQk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=nCjP66M/HvKLIbhVKHQ3v6N3Dz1xHdL/BOK/pnyC3VlGTo86rBdvCxnDnO4l641e7zOUFyjVrY3UqT56j7+Bi8wz5kYlpUTh29RleJ+8ukfslwEijnw6M0kKNr+roHy3HzqkWztlnDJ0aayDqT37WFmWEPy4l1iP2sdtYC9u2LI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--joonwonkang.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NfTe331j; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--joonwonkang.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NfTe331j"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2baf7378ad0so18218075ad.0
        for <linux-tegra@vger.kernel.org>; Sat, 09 May 2026 22:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778392241; x=1778997041; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=kzZRn2JWPQtIOhL+COPBbPzW8EvBz5JnXb+/L/c5we4=;
        b=NfTe331j3/0S8EF/GYhmVozvEoD65S7lkyOMaowt9XKA+1ZhQzJVINYpmFufZPMjyM
         I594OLTh3KEi04c/EzPKcoF+NAmU7CNWnGjpgH49AkRIQ3EIOVPZni6IWb06QG4fCm8u
         7lyxH0sQAUJro7CywGUEJ7HehUqBOBf+Fvx0QtA+dP3C3DVsR3hKZ/rSMlme+WyAK8mB
         v5XIZ27WyxgxWf8r4mXHGMqd86gt3xdz+u9HwHD2MQOTGKbzZ9TgrYvTLb9JMEhfiB1f
         sBHVOkgNLga+Traf3+XNXjUqMiBqUOS5hrNJpw+w/psncb6rXGvM+u8ueilFx0R+K7TV
         QoTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778392241; x=1778997041;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kzZRn2JWPQtIOhL+COPBbPzW8EvBz5JnXb+/L/c5we4=;
        b=i4xeXaBt5NnZ+qFYjL2a/QZwDINc7OI1qDLgh3PxJdoGx5+OCzI+J/ITpw8MO357/L
         q6YU3j7bWLF3UZ+72ysxLX/U7rNBBttIBX0F3KbLFBILehAM5iZA0BDTjd1/cO5z7CNV
         XOKf5/VED0ymY5ttcBJS+QzhYsqxAENPsH7QqxC/AgHZBVFOBujpVv9s410EQfw+GPzn
         QiqBNTCqWQLFUPJ472gbT1szWL63fw1ro2yk71W8e2DdCDQAjIUgFi4Dz3ryO74TN3gg
         XsSfJyPoubnoZ+vKwPyphm54SGEX6Y++DsZUOskvfEB64R6YdmeErf97q/LLVuLaNNaC
         JtJA==
X-Forwarded-Encrypted: i=1; AFNElJ8mRP+yekpMOHtAvnp+5Q3ZIYbGvwSPiTKWgQcqAZGp8BAGc3v5OSh6Tht8d4xkJIH1ZlmAw2JXiyRRrg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzQTzH0esmxKoNGKw+VbCCE9mDWjGs162/VpPe7ATq25QGN8qOD
	9W+PLv9QHI3rCkdn9G0zUhy1J4eKvEDsInOHJMm9Auic5vUhDkvKYgt/zuzy3z0mgaeY1TvNKjw
	+DOifPZA80Qk4AkKczREEeVdErQ==
X-Received: from pllj9.prod.google.com ([2002:a17:902:7589:b0:2b2:5092:b66e])
 (user=joonwonkang job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:13ce:b0:2bc:7d5d:e2b7 with SMTP id d9443c01a7336-2bc7d5de4ffmr45251655ad.36.1778392241199;
 Sat, 09 May 2026 22:50:41 -0700 (PDT)
Date: Sun, 10 May 2026 05:50:39 +0000
In-Reply-To: <20260509015927.agent5-0002@kernel.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260509015927.agent5-0002@kernel.org>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
Message-ID: <20260510055039.793085-1-joonwonkang@google.com>
Subject: Re: [PATCH 6.18.y] mailbox: Fix NULL message support in mbox_send_message()
From: Joonwon Kang <joonwonkang@google.com>
To: sashal@kernel.org
Cc: dianders@chromium.org, jassisinghbrar@gmail.com, jonathanh@nvidia.com, 
	joonwonkang@google.com, linux-acpi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, 
	stable@vger.kernel.org, sudeep.holla@arm.com, thierry.reding@gmail.com
Content-Type: text/plain; charset="UTF-8"

> On Thu, May 07, 2026 at 06:21:07AM +0000, Joonwon Kang wrote:
> > diff --git a/drivers/mailbox/pcc.c b/drivers/mailbox/pcc.c
> > index ff292b9e0be9..7a2baeca2ba4 100644
> > --- a/drivers/mailbox/pcc.c
> > +++ b/drivers/mailbox/pcc.c
> > @@ -361,7 +361,7 @@ static irqreturn_t pcc_mbox_irq(int irq, void *p)
> >  	if (pchan->chan.rx_alloc)
> >  		handle = write_response(pchan);
> >
> > -	if (chan->active_req) {
> > +	if (chan->active_req != MBOX_NO_MSG) {
> >  		pcc_header = chan->active_req;
> >  		if (pcc_header->flags & PCC_CMD_COMPLETION_NOTIFY)
> >  			mbox_chan_txdone(chan, 0);
> 
> This pcc.c hunk does not apply on 6.18.y: commit 5378bdf6a611 ("mailbox/pcc:
> support mailbox management of the shared buffer") was reverted upstream by
> f82c3e62b6b8, and that revert is already queued in 6.18 as 2cafad617431.
> write_response() and the active_req-driven txdone path no longer exist in
> pcc_mbox_irq() on 6.18, so this hunk is both syntactically inapplicable and
> semantically unnecessary.
> 

Indeed. Thanks for letting me know of this. My local environment was quite
a bit behind the latest.

> Could you send a v2 omitting the pcc.c hunk? The other three hunks
> (mailbox.c, tegra-hsp.c, mailbox_controller.h) apply cleanly and I'm
> happy to queue those for 6.18.y.

Sure, I will send a new version.

Thanks,
Joonwon Kang
