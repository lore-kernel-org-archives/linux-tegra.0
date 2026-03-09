Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB1173E3D88
	for <linux-tegra@vger.kernel.org>; Mon,  9 Mar 2026 15:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773069960; cv=none; b=VJFu/CWaG7dpWNabzmPSnxbM8mQt6ydDCpp6bZ3L73lc1eY0FjPD9CTrQK6yq850RD37zlAfU0aq96wFXqu3zX9J8ezSfP4cmmXW+DH1j1YE3rNh24TpUrTsNXGxFBIodyIswiw4sUaLZZd1dF1oEVPBDFLI2RTVSsF4d6st3ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773069960; c=relaxed/simple;
	bh=fLdlgK54rTn34EKZI8AHzVRLbm2SJ8RTjlamikvXF3o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KhmNCqabZqHVc1h7yXLoFVZh8FUd67leZNEvc9SMgjM5ppKrPVvUYgXTNFcnGGbaFevhuCbL+Az60ea+2bL/tPPz9PneB5IWa7muhLMEFKmwI5s62C6YFNnOOuiFjNszsar8afafPWndSCHrlqh4kVqFJHAODzrVoR9p4m3AX1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=GIQOWBm3; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="GIQOWBm3"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-59e5aa4ca41so4845596e87.2
        for <linux-tegra@vger.kernel.org>; Mon, 09 Mar 2026 08:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773069956; x=1773674756; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xKq8ulzy5MHQKDxfFMVcrLftpi/uwWVl0kgu6a2rhEE=;
        b=GIQOWBm3eljnGtCYeKTOAxKBPlrpYotSuvz+pQIrQa+G794iBWroJS8GZMnkx2/ymy
         oJ9RgxIyJKJJeSFCetIawm9b3V4x8Gu0d2fduS7JNrqHM7o6bXnNMweBTmrVyVpaR6i+
         JqPJU90s1HOwBXDI60yw3/Vft7r39qMbCNNhw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773069956; x=1773674756;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xKq8ulzy5MHQKDxfFMVcrLftpi/uwWVl0kgu6a2rhEE=;
        b=cTgKyNpBIF8MGptn+Kjpp1szWsgVy+UEncNPfSu9QsUNGLNnKVIAION3lHRYZe2zuk
         pN0HKA+LGyG6IvGgNVMvlzLfiKKt8k/vNK1n6dWPccwfTD6nj4rVuq/j1fx/dkt/Oqkl
         O5VfglzbgEuEFdtEO7lYtqKf8IOMEkNom1ryekGinB8beujM5fH6tIFPSYqcWDb5N4NL
         rmOvKekPyQPomPLGcVddPmRYuKuvKsHpdVVK/104kPvLeTeY5DDc/L1zjMFKzRLR17Q8
         ASLROrOA1CHdkx7RyJ3RPG9yllF/SMIiOxWb9M23U7AQltg+V6GnyEhXUzs/U0LWF5py
         3ynA==
X-Forwarded-Encrypted: i=1; AJvYcCXJKGxeHbc+EC+43C572sZuPD4oEVusLEV9fbxhV+uk9BukhrTnOU9W8irZYSoXpAHwKeEuw8CGs5sZiw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/S8aH2+lr1v/gjJvXeEBTDdkC47Zc3nmi9sTS4z9e46/7qzpM
	mj+iNBWS6451iAwGIzaJuxR5drJjyDaZSg0ohDSDeltHWahnR4PW6+0Bx6cvg9t9MzQTrvRqSXG
	1o3UzuKug
X-Gm-Gg: ATEYQzywP+Vz/kk/kWnX6LOTq2F618MypJWQoj2yI6In1zEZORiibcn1+qgzEtFpx1Z
	f4o0W+CrNEA4UV/6Z6X4w54V/HLMuNlmuWzgxz1DsKW2TU93mibo1O1hcb0KAZu4/Nj/YLf2s+S
	Yu6n/CPnyb7nEI/qj2uZrEYzRcxaGLHFnCIzWqc5kGgHT+o2Y5rwAH7k44fElAIs4W8Ao1o7juL
	rnU5a0apnfOTx9MWMuvmYI/u1O8XQ4XK5+SmCIjWFKathCUy6wUmlRC9GIMe+q5OReeDniMNrx/
	xxdqynzU/Ic7sj8JqHch4mnlU4dxv+Htm8gV91Qy1ydAOq484j5CzvGD5632Fi53VCmwMPxfT/y
	rKFDhv7qFdZCtHvFPcUkuLr3Zld+l7s3RvpNQ6tKnWCS8RFvHYBaKFmXKfP5gRrjteS21302UYF
	a3teQF3vLK3aUxfVf7XYVIN4JFpTTt5jsQIPCtFrF961HMO/kJanGL2ZBeoqUzY1mWZFEQLbQL4
	Bs7
X-Received: by 2002:a05:6512:22c2:b0:5a1:30b3:9a06 with SMTP id 2adb3069b0e04-5a13ccb7c16mr2584374e87.21.1773069956433;
        Mon, 09 Mar 2026 08:25:56 -0700 (PDT)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com. [209.85.208.174])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a13eaebd0asm1998385e87.51.2026.03.09.08.25.56
        for <linux-tegra@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Mar 2026 08:25:56 -0700 (PDT)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-38a2544b52bso67573871fa.3
        for <linux-tegra@vger.kernel.org>; Mon, 09 Mar 2026 08:25:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW+glUCG5sLrM6PR2nyRDEBONGtXo2nYMhPdI+jynolOLVxzQkPEMzeM2VHbZ0c9+Xh8qlzXb/9nsMomg==@vger.kernel.org
X-Received: by 2002:a17:907:1c2a:b0:b96:dcc0:2e19 with SMTP id
 a640c23a62f3a-b96dcc03e2bmr431706766b.56.1773069586848; Mon, 09 Mar 2026
 08:19:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260216181002.3475421-1-dianders@chromium.org>
In-Reply-To: <20260216181002.3475421-1-dianders@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 9 Mar 2026 08:19:33 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XosP+rpT7w1Dcr=Xu7K8MCnA-=hndCgvsdwRAeVXuUdA@mail.gmail.com>
X-Gm-Features: AaiRm52PitiYzwSf40xttz_JauQBZgQS8kA13tji_SRNQ2F75XcOox36FcsJy20
Message-ID: <CAD=FV=XosP+rpT7w1Dcr=Xu7K8MCnA-=hndCgvsdwRAeVXuUdA@mail.gmail.com>
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

Hi Jassi,

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
>
> Douglas Anderson (15):
>   mailbox: Deprecate NULL mbox messages; Introduce mbox_ring_doorbell()
>   ACPI: PCC: Use mbox_ring_doorbell() instead of NULL message
>   firmware: arm_scmi: Use mbox_ring_doorbell() instead of NULL message
>   firmware: imx-dsp: Use mbox_ring_doorbell() instead of NULL message
>   firmware: tegra: bpmp: Use mbox_ring_doorbell() instead of NULL
>     message
>   irqchip/qcom-mpm: Use mbox_ring_doorbell() instead of NULL message
>   remoteproc: xlnx: Use mbox_ring_doorbell() instead of NULL message
>   rpmsg: qcom_glink_rpm: Use mbox_ring_doorbell() instead of NULL
>     message
>   rpmsg: glink: smem: Use mbox_ring_doorbell() instead of NULL message
>   rpmsg: qcom_smd: Use mbox_ring_doorbell() instead of NULL message
>   soc: qcom: aoss: Use mbox_ring_doorbell() instead of NULL message
>   soc: qcom: smp2p: Use mbox_ring_doorbell() instead of NULL message
>   soc: qcom: smsm: Use mbox_ring_doorbell() instead of NULL message
>   soc: ti: wkup_m3_ipc: Use mbox_ring_doorbell() instead of NULL message
>   drivers: firmware: xilinx: Use mbox_ring_doorbell() instead of NULL
>     message

Just checking to see if there is any addional changes you need from me
on this series. It looks like it's -rc3 which is maybe an ideal time
for this series to get some linux-next bake time? A good number of the
patches in this series have Acks from maintainers so they could all go
in your tree, I think. For those that don't, I guess worst case they
just don't land right now and I can re-post them later. ...or if you
think they would be OK to pickup that would be cool too.

Thanks!

-Doug
