Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77C982D5C68
	for <linux-tegra@vger.kernel.org>; Wed, 11 Mar 2026 00:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773188190; cv=none; b=DdTL9KbmngoR0j6+FU7BsdyFO8XMqYU5QvPqBtWwPzX0m7XKIwx9wxraPhfewpspmKhL4jvUmQ+ImjN+WwqJvUDDvkseIuCFFXoU4z8vCNRgaG2XcbPD+Tm1tAMfCULG5eJOFintaidnW3+aU/gWOspmGCyiI+o74GE2TAqEF1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773188190; c=relaxed/simple;
	bh=RkQr/oJ5AVva8ppnZ/QxljiNwt7nDUcsbBiCUPkROPA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UhwPHvFqe36OWS128ap4DGM3L1XlAo25zQ6bfzTdWVxYNV374I8fF4AQjwlQCq7THsR8A3XGsEgVP2D67eVDOsy94hWinoQa+p2xWk0DffV1ydbQ6KcTVg720LAdT4Xf6gx7h181WVvIs5a12Q7d37+G8mb2UswizvvpzEFe3xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=nGks4XoU; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="nGks4XoU"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-662c6aca253so2301874a12.3
        for <linux-tegra@vger.kernel.org>; Tue, 10 Mar 2026 17:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773188184; x=1773792984; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RkQr/oJ5AVva8ppnZ/QxljiNwt7nDUcsbBiCUPkROPA=;
        b=nGks4XoU7gn7qw1avmmDDi984sIHFEzbRLBnAPrq3tZ4St8OjAwVpg4hgzFuKTdu/U
         zC6R+FYQYQKb+Ai/CiP0yXf8mj/WASdNYVPfF9QNroYm0LHgRMCD8EgrsnygX2ba+UDl
         /ch+/Er379YQ26RVpaeo1j+4c27jLu3UOMJq0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773188184; x=1773792984;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RkQr/oJ5AVva8ppnZ/QxljiNwt7nDUcsbBiCUPkROPA=;
        b=SmQgMbZwJktVlvQBpQWJiL87rREjEcrJmWhvRSyKFDN1D0RsYXKEwEu7FKCr5vDivS
         kRCOu36UIDt1IfcieJnN1Q+g7khKWRUTn1oSw6qj6KLqQpaPbdbmB38pORElmE1B5gEG
         s0YVGzB4L+fFYxveL2+Lwk+79CBcxJzd2AX9Ye/yV2xEt7+d1STOJH0Jm8DD0Yjnipnl
         K1sEavo3rGJP5kzUhtQSt4Se0o0KLyT/Vgf4zOKBSXLHRVBPJQ79VTtBMuOkzKJBs9Ax
         6zIQkjSRXU3hS4KRkJ9EWNGSJo5eB+aGjN8lXjwPVrNGh+upz22rM06Pz4sK8ZODhL/W
         hw6Q==
X-Forwarded-Encrypted: i=1; AJvYcCXCeoDtyVIzu4nly9kDkd9AmjwjqJiqeQEFmBbLfwfUbGTBQxJaEXYhO6bM4j+Bvr9opl6jH7vs1B7wUA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwCR/of34MtVWw/FuiyiL+jAks9NwsqNeWkWAwXeBHvBWgodYgs
	0jDigNE40mqAwjuzFOv8yx0RChGxgQM4UycwcFdZFSnBEd2GQikFFX/FKVDZmOEnZvEWS+myBg1
	OH8n6vh7B
X-Gm-Gg: ATEYQzwiRM7lCUe+PCza+8B7pYi/WzCEmmoOLA8B6Fq75FJT8Gh4L74ex4eq8swFnZw
	X9cJd1yWiwKl2sVLSaf3hhSBcxVHhTQypHXQnJQyx5egvyJUz3di7D9o8TtsrFjwHAnxkode4YZ
	hteq1aXvNGLhsGYUhqohVxN9J3K3HRjpb5b2f18Mt9Qek/pkf4/o5z247yBWGvQxKuKKqYo04Cq
	mK1aEcBb1mAS6ACIu++US1xlbvvBvhsFODnDUX0KDTlXaWl3tv2F12Z5f0M3uhulGwyivMp9tsF
	3pCvkNRPNWqY0vm5S6u9BMxRo/k9JODKsIK4c5bEosGE5H3aLpTi8vtG1gMmS01ELynZP3qeC5x
	W6cpBeB7svPRD7uqWjE5bZz1+54jdbxCmpSdR0pAZ/kedkCIhNYiqbSoZt/btUrDtf8sMuMPi8D
	bcrM8wFMOlbccn+m/eEvYR+dMJfTi0s9/Lpj8voVbSgeMd8jmqCHFO3/FFnNF+cw==
X-Received: by 2002:a17:906:f5a8:b0:b93:81e7:8454 with SMTP id a640c23a62f3a-b972e26b69bmr22720466b.6.1773188184196;
        Tue, 10 Mar 2026 17:16:24 -0700 (PDT)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com. [209.85.221.46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b972de48cfbsm15263966b.22.2026.03.10.17.16.20
        for <linux-tegra@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 17:16:21 -0700 (PDT)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-439af00d33cso10631124f8f.1
        for <linux-tegra@vger.kernel.org>; Tue, 10 Mar 2026 17:16:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV8tjJaV8UbANiDYac/eUEk9Xhfsa4U8d2JZVigObdPxs/lb9FWB5LCg+3MbOq9cZNNlJxpyicnpzNRsg==@vger.kernel.org
X-Received: by 2002:a05:6000:2913:b0:439:b3d2:3768 with SMTP id
 ffacd0b85a97d-439f81c8cc0mr1467675f8f.21.1773188179252; Tue, 10 Mar 2026
 17:16:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260216181002.3475421-1-dianders@chromium.org>
In-Reply-To: <20260216181002.3475421-1-dianders@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 10 Mar 2026 17:16:08 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VUUNDgcOMjhA3Tiptwm3-s+LiUNeObAoV4tTQbkg0mPQ@mail.gmail.com>
X-Gm-Features: AaiRm50L1dSQfXqKqL2lF5VIOHGsndPMM8bpxj2iTcUPN8asbNOQBrAMfnlkmEo
Message-ID: <CAD=FV=VUUNDgcOMjhA3Tiptwm3-s+LiUNeObAoV4tTQbkg0mPQ@mail.gmail.com>
Subject: Re: [PATCH v3 00/15] mailbox: Stop sending NULL mailbox messages
To: jassisinghbrar@gmail.com
Cc: Frank.Li@nxp.com, Santosh Shilimkar <ssantosh@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, andersson@kernel.org, arm-scmi@vger.kernel.org, 
	cristian.marussi@arm.com, daniel.baluta@nxp.com, festevam@gmail.com, 
	imx@lists.linux.dev, jay.buddhabhatti@amd.com, jonathanh@nvidia.com, 
	kernel@pengutronix.de, konradybcio@kernel.org, krzk@kernel.org, 
	lenb@kernel.org, linux-acpi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	linux-tegra@vger.kernel.org, lucaswei@google.com, marco.crivellari@suse.com, 
	mathieu.poirier@linaro.org, michal.simek@amd.com, nm@ti.com, 
	rafael@kernel.org, robh@kernel.org, shawn.guo@linaro.org, 
	sudeep.holla@kernel.org, tglx@kernel.org, thierry.reding@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Feb 16, 2026 at 10:11=E2=80=AFAM Douglas Anderson <dianders@chromiu=
m.org> wrote:
>
> As talked about in the first patch in this series, passing NULL as the
> 'mssg' argument to mbox_send_message() ends up causing confusion and
> quirky behavior inside the mailbox core. Despite this, there are a
> number of drivers that pass NULL.
>
> It is plausible that some of the drivers passing NULL may have been
> taking advantage of the quirks of the mailbox core. Specifically, they
> may have been taking advantage that calling "tx_done" wasn't truly
> necessary for NULL messages (it was a noop) or that NULL messages were
> passed onto the mailbox controller right away without queuing.
>
> This series introduces a new API call: mbox_ring_doorbell(). The new
> API call tries to mimic the specific quirks that were helpful in the
> old behavior and it's expected to be a nearly drop-in replacement.
>
> There are some subtle differences between the new call and the old
> behavior, but it's expected that all of these differences are only for
> cases where the old behavior made little sense. The description of the
> first patch details these differences.
>
> The series attempts to convert all in-tree users to stop passing NULL
> for mssg. As per above, there are some slight differences in behavior.
> If any of the patches are causing problems, they can safely be
> reverted while debugging the problems. Eventually, all code should be
> converted over to stop passing NULL mssg.
>
> Changes in v3:
> - Suggest mbox_ring_doorbell in the warning message
> - Updated patch description based on Cristian's response.
>
> Changes in v2:
> - Instead of just documenting NULL, introduce a new function

In case any mailbox client API users want to comment, Jassi has
proposed an alternative to this series:

https://lore.kernel.org/r/20260310234616.334498-1-jassisinghbrar@gmail.com/

Feel free to join the conversation over there. :-)

-Doug
