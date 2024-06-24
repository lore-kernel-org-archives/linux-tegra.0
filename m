Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6BD322EE3
	for <linux-tegra@vger.kernel.org>; Mon, 24 Jun 2024 14:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719239628; cv=none; b=LIX27wglJ0OUL1hWJcBhSlnCk70LlY+yHTZta2ocSH7dK/mdZ/JeYjeUrwktiYOknKuYDsvKU/+Jz9j7SFDCJGLJ6zWQFPrDpxo+3uVF4k34wJBbjWrdqPUgYrk4bxV00uK5xv2p90bVAXrqVBtTxw261Yu+PNC2HwbdDeCn3f8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719239628; c=relaxed/simple;
	bh=2VI0NwS4PTAe6qZD3g/nCiYEkNvTB0wEuZHFxMmw1HY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HhY5qQg6sP514w1Qj41OtlDyfm8xZ6DmghB+BtrKlzNM0OVeqy1wJU6y5QKkaXCs2oassSGaK2Fy3+rIEmm4lPrQfso1G0oMO83AnG3RWcukl39DPHUG0zpiI2nkSI+8uC2dGsPbTCl4Qr65XS+572BaQGygqubfDhu3sG+gUhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=b7VjEjOQ; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="b7VjEjOQ"
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-dfe41f7852cso4417770276.1
        for <linux-tegra@vger.kernel.org>; Mon, 24 Jun 2024 07:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719239626; x=1719844426; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=D/u3BMlJPeiARoM1tpxwj+BZ0FLuxy3mU9kUIPrDDyM=;
        b=b7VjEjOQQDjdOUdiTWnFZls4mlR7qUD4tNIGC37Ai6bTaBCxWgoIEUMu+Qx6Ej2egQ
         KtCwL2BhE5XT0NfwCMkliPpeuxcXUMWudTT4rCIcdCX7IiJExWw0TCOloS2csFKA/Ih/
         5oCAfoR0YBmTypixlYuqrlzwFM4MKphpgUFpYAZx91JDsvruibxk0evGWNjQ/oGsqbGf
         hybIgHE3hgRM80Kt55J+DWiQGlxcTTMEHTJo6sZAV9DwXWEsF58Aqne6BT6ZEk/gA5NP
         XwhJZqAkxXspt9VqLpQGz6Q+OoZgZe9L4Xk/MNnp7f19uFEFLl2mRQZU4Sr8ju9YfTtG
         CXxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719239626; x=1719844426;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D/u3BMlJPeiARoM1tpxwj+BZ0FLuxy3mU9kUIPrDDyM=;
        b=r2WN8zpE5twvrT5iDuW5CZY9REY/95vEwrf+b7DrKvQWVrmccfDsSn0V7XtcAhn1tl
         bnrN+HPCioc3trRHAx2RMg/YLGoaItYFl9dqMLXMVbubuNmCCXeKw+9UZ3W8aE+iis9f
         TO9AMhZS0v1rmrrmIsr6YppBah6aKn/F91Q9tJ2XlxL/m8IuGTwIJcMkLD38jteebMPd
         SI/VArRLQWmejNwt76dcGXfMJ0GImlQTLJqC4UvqKmIBJrOaQZq0OU9CT7iRqQqb3OZ7
         sBTa8GGiRMsMh3nHo31iuxCrryVuzsoCfL7vVU8qtOzR1KkOPe4yODFf4qBzY4SiUNQx
         BEGA==
X-Forwarded-Encrypted: i=1; AJvYcCWcM3VtTd+qoANznR+QMUss3yeQfoXZxZtEUJUscLUuoFx98sapWF5nKzRv3egylkBvruvIZZoIgNH6VF3EcjDWLlrBPi2+SLSPLy8=
X-Gm-Message-State: AOJu0Yz6ou5LZXzGXQkaSSTS5U/qrmxCY9uVg8N30YWRfKguGWTzrxDp
	zVrIgcgpqEqb3xcuGz8IePRV/jz5+U8ps83DstFzckl16ItF/uDAJvr1AKKw2O2pJd8rwMtE0wM
	PDo5SQpKFZJl6aXqmsLKzRV9IB917OvmXKp4iyQ==
X-Google-Smtp-Source: AGHT+IGyZF+YZa8ZILjWOQ9iFXAixiauuVV4PiOE9O257hOxlNlZ0bzCm3iS0nEiuBdkDzD+I1SsyVW/2AuH9kI2Sxo=
X-Received: by 2002:a05:6902:345:b0:e02:b434:372e with SMTP id
 3f1490d57ef6-e0303f52530mr4775874276.22.1719239625559; Mon, 24 Jun 2024
 07:33:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240510201244.2968152-1-jthies@google.com> <20240510201244.2968152-5-jthies@google.com>
 <21d4a05a-3f64-447a-b8e3-772b60ef8423@nvidia.com> <7b46779f-3f44-45f4-8884-2f9f625485ae@nvidia.com>
In-Reply-To: <7b46779f-3f44-45f4-8884-2f9f625485ae@nvidia.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 24 Jun 2024 17:33:32 +0300
Message-ID: <CAA8EJprxHq65mAU6a9iGD6Yus-VB2x3WP5Z8JWN1oUwn+zQDfg@mail.gmail.com>
Subject: Re: [PATCH v5 4/4] usb: typec: ucsi: Always set number of alternate modes
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Jameson Thies <jthies@google.com>, heikki.krogerus@linux.intel.com, 
	linux-usb@vger.kernel.org, pmalani@chromium.org, bleung@google.com, 
	abhishekpandit@chromium.org, andersson@kernel.org, 
	fabrice.gasnier@foss.st.com, gregkh@linuxfoundation.org, hdegoede@redhat.com, 
	neil.armstrong@linaro.org, rajaram.regupathy@intel.com, 
	saranya.gopal@intel.com, linux-kernel@vger.kernel.org, 
	Benson Leung <bleung@chromium.org>, 
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 24 Jun 2024 at 16:42, Jon Hunter <jonathanh@nvidia.com> wrote:
>
>
> On 24/06/2024 13:51, Jon Hunter wrote:
> > Hi Jameson,
> >
> > On 10/05/2024 21:12, Jameson Thies wrote:
> >> Providing the number of known alternate modes allows user space to
> >> determine when device registration has completed. Always register a
> >> number of known alternate modes for the partner and cable plug, even
> >> when the number of supported alternate modes is 0.
> >>
> >> Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> >> Reviewed-by: Benson Leung <bleung@chromium.org>
> >> Signed-off-by: Jameson Thies <jthies@google.com>
> >> ---
> >> Changes in V5:
> >> - None.
> >>
> >> Changes in V4:
> >> - None.
> >>
> >> Changes in V3:
> >> - None.
> >>
> >> Changes in V2:
> >> - None.
> >>
> >>   drivers/usb/typec/ucsi/ucsi.c | 14 +++++++++++---
> >>   1 file changed, 11 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/drivers/usb/typec/ucsi/ucsi.c
> >> b/drivers/usb/typec/ucsi/ucsi.c
> >> index bb6e57064513d..52a14bfe4107e 100644
> >> --- a/drivers/usb/typec/ucsi/ucsi.c
> >> +++ b/drivers/usb/typec/ucsi/ucsi.c
> >> @@ -812,10 +812,11 @@ static int ucsi_check_altmodes(struct
> >> ucsi_connector *con)
> >>       /* Ignoring the errors in this case. */
> >>       if (con->partner_altmode[0]) {
> >>           num_partner_am = ucsi_get_num_altmode(con->partner_altmode);
> >> -        if (num_partner_am > 0)
> >> -            typec_partner_set_num_altmodes(con->partner,
> >> num_partner_am);
> >> +        typec_partner_set_num_altmodes(con->partner, num_partner_am);
> >>           ucsi_altmode_update_active(con);
> >>           return 0;
> >> +    } else {
> >> +        typec_partner_set_num_altmodes(con->partner, 0);
> >>       }
> >>       return ret;
> >> @@ -1138,7 +1139,7 @@ static int ucsi_check_connection(struct
> >> ucsi_connector *con)
> >>   static int ucsi_check_cable(struct ucsi_connector *con)
> >>   {
> >>       u64 command;
> >> -    int ret;
> >> +    int ret, num_plug_am;
> >>       if (con->cable)
> >>           return 0;
> >> @@ -1172,6 +1173,13 @@ static int ucsi_check_cable(struct
> >> ucsi_connector *con)
> >>               return ret;
> >>       }
> >> +    if (con->plug_altmode[0]) {
> >> +        num_plug_am = ucsi_get_num_altmode(con->plug_altmode);
> >> +        typec_plug_set_num_altmodes(con->plug, num_plug_am);
> >> +    } else {
> >> +        typec_plug_set_num_altmodes(con->plug, 0);
> >> +    }
> >> +
> >>       return 0;
> >>   }
> >
> > I am seeing the following panic on linux-next and bisect is pointing to
> > this commit.
> >
> > [   16.411135] Unable to handle kernel NULL pointer dereference at
> > virtual address 0000000000000310
> > [   16.411716] Mem abort info:
> > [   16.411806]   ESR = 0x0000000096000044
> > [   16.412147]   EC = 0x25: DABT (current EL), IL = 32 bits
> > [   16.412465]   SET = 0, FnV = 0
> > [   16.412530]   EA = 0, S1PTW = 0
> > [   16.412778]   FSC = 0x04: level 0 translation fault
> > [   16.413084] Data abort info:
> > [   16.413149]   ISV = 0, ISS = 0x00000044, ISS2 = 0x00000000
> > [   16.413534]   CM = 0, WnR = 1, TnD = 0, TagAccess = 0
> > [   16.414163]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
> > [   16.414649] user pgtable: 4k pages, 48-bit VAs, pgdp=0000000101b2b000
> > [   16.414784] [0000000000000310] pgd=0000000000000000,
> > p4d=0000000000000000
> > [   16.414940] Internal error: Oops: 0000000096000044 [#1] PREEMPT SMP
> > [   16.414946] Modules linked in: tegra210_adma(+)
> > snd_soc_tegra210_ahub(+) drm backlight snd_soc_tegra_audio_graph_card
> > snd_soc_audio_graph_card ucsi_ccg typec_ucsi crct10dif_ce
> > snd_soc_simple_card_utils typec pwm_fan snd_soc_rt5659(+) snd_soc_rl6231
> > ina3221 pwm_tegra tegra_aconnect phy_tegra194_p2u snd_hda_codec_hdmi
> > at24 snd_hda_tegra snd_hda_codec snd_hda_core lm90 tegra_xudc host1x
> > pcie_tegra194 tegra_bpmp_thermal ip_tables x_tables ipv6
> > [   16.415056] CPU: 0 PID: 290 Comm: kworker/0:4 Not tainted
> > 6.10.0-rc4-next-20240617-g76db4c64526c #1
> > [   16.415063] Hardware name: NVIDIA Jetson AGX Xavier Developer Kit (DT)
> > [   16.415067] Workqueue: events_long ucsi_init_work [typec_ucsi]
> > [   16.415082] pstate: 80400009 (Nzcv daif +PAN -UAO -TCO -DIT -SSBS
> > BTYPE=--)
> > [   16.415091] pc : typec_plug_set_num_altmodes+0x18/0x6c [typec]
> > [   16.415112] lr : ucsi_check_cable.part.0+0x228/0x280 [typec_ucsi]
> > [   16.415120] sp : ffff8000848bbca0
> > [   16.415123] x29: ffff8000848bbca0 x28: ffff000080e66000 x27:
> > ffff80007adc96e8
> > [   16.415140] x26: ffff80007adc96f8 x25: ffff0000834510c0 x24:
> > ffff000080e66010
> > [   16.415150] x23: ffff000080e6638c x22: ffff000080e664c0 x21:
> > ffff000089c95800
> > [   16.415160] x20: 0000000000000000 x19: 0000000000000000 x18:
> > ffffffffffffffff
> > [   16.415170] x17: 1e00000001000000 x16: c203000000000000 x15:
> > 00656c6261632d30
> > [   16.415180] x14: ffff800082c922d8 x13: 0000000000000040 x12:
> > 0000000000000228
> > [   16.415191] x11: 0000000000000000 x10: 0000000000000000 x9 :
> > 0000000000000000
> > [   16.415201] x8 : 3d45505954564544 x7 : 0063657079743d4d x6 :
> > 0000000000000000
> > [   16.415212] x5 : ffff0000835ee780 x4 : ffff000080e66288 x3 :
> > 0000000000000000
> > [   16.415223] x2 : 0000000000000000 x1 : 0000000000000000 x0 :
> > 0000000000000000
> > [   16.415233] Call trace:
> > [   16.415236]  typec_plug_set_num_altmodes+0x18/0x6c [typec]
> > [   16.415255]  ucsi_check_cable.part.0+0x228/0x280 [typec_ucsi]
> > [   16.415264]  ucsi_init_work+0x8b4/0x9b8 [typec_ucsi]
> > [   16.415271]  process_one_work+0x150/0x294
> > [   16.415282]  worker_thread+0x2f4/0x3fc
> > [   16.415289]  kthread+0x118/0x11c
> > [   16.415296]  ret_from_fork+0x10/0x20
> > [   16.415310] Code: a9be7bfd 910003fd f9000bf3 aa0003f3 (b9031001)
> > [   16.521018] ata1: SATA link down (SStatus 0 SControl 300)
> > [   16.524401] ---[ end trace 0000000000000000 ]---
> >
> >
> > I have not looked any further yet, but wanted to report this. If you have
> > any thoughts let me know.
>
>
> It is crashing because 'con->plug' is not initialised when
> typec_plug_set_num_altmodes() is called. Do we need to add a check to
> see if 'con->plug' is valid in ucsi_check_cable()?

Yes. Either of  con->calbe and con->plug can be NULL.


-- 
With best wishes
Dmitry
