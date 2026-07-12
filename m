Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 604521F30A9;
	Sun, 12 Jul 2026 15:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783870364; cv=none; b=t6x1cIrKH9TsPiynbw8g8YQxqQyGDe0lVMUjvpYlgKA6pER1xHyLGm721FsC2yBKfHQlIT+hcp20abCVVPlrdzHh+NzPWEOFwdU180VnWm9dbqDKG+kks3K2hOkpml2v0pMqhV9Tes92k3WJ8ng3nbYL2OjzFM4v39EQtr1yoIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783870364; c=relaxed/simple;
	bh=hkIaWYPb0L5kNNs9//CKefvpmEa/lEADjyWl8B5XMgU=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=RYM8+aeDEwpmMkLuBHSasUA7vLi3e2z6GKPLtNKartQFKUQtUvH1dOmZ2f4wu3rpBxorr/XNjOtJzyDo/CbY4jEIuqbd0lSnJpbHPtKjA+gqUAHKm1s7YOonv01gZKVqkjb0DFa2/9tEopJ5ehlpH1UTW2dnNg/0ZTc8dMNL/Dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=marvin24@gmx.de header.b=lRMmcUaW; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=marvin24@gmx.de header.b="lRMmcUaW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1783870359; x=1784475159; i=marvin24@gmx.de;
	bh=/rBfgA9R+GPT/Zs8E3Dm0uV/JuiD8bQU2GU/kKLfQ+4=;
	h=X-UI-Sender-Class:Date:From:To:cc:Subject:In-Reply-To:Message-ID:
	 References:MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=lRMmcUaWcHa2T/7y4V095dHfKzzwJC3UhvWq7qtV01nDHbhuvFFUKz8v7GED5Xoz
	 8bwKIHRrC12SBRky29wOWdYuKq/XpI5QnfX2YfP4PWS5NbPCuMo+KD9qNQ+b2gKl2
	 iqIPxEJn8BMVz4C+Fu+2wetbRWQr/7cy0pmRdb/krAtaedSE9V0UvwA79+xanuzJG
	 ZfYML/Mw/F1BhZETsAyaImhut+Pf/X7ZYqbI8yR/Zo5YK9kjPDaJE61wYvdFNkA88
	 I3+ECAPfoURdfdfTh/WP/C4XTE/dvow31c67G/NXuVLlgX+FGt4XgR5KdReRYUKuG
	 w40MyBXmawoIaw4l+w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mgeo8-1xGtPH1qii-00bg48; Sun, 12
 Jul 2026 17:32:39 +0200
Date: Sun, 12 Jul 2026 17:32:39 +0200 (CEST)
From: Marc Dietrich <marvin24@gmx.de>
To: Igor Putko <igorpetindev@gmail.com>
cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev, 
    linux-tegra@vger.kernel.org, ac100@lists.launchpad.net, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: nvec: kbd: replace global state with dynamic
 allocation
In-Reply-To: <20260710191221.2820-1-igorpetindev@gmail.com>
Message-ID: <6d97061b-a95f-4d3d-decb-cc2eefa8a0f2@gmx.de>
References: <20260710191221.2820-1-igorpetindev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Provags-ID: V03:K1:a5JwEq4Nn0SbzaOExAU0xnpsbT9leV1GLNd4dAhLet/BfsbUWlI
 SH+OyzdSz+6G2+v22QFKJdDPqIrAsl4xJAgL2LNhZrxQohhHIyBvalAcpIlO+ZzfdHoY5Fk
 ZyAHwa3U4w/7jdJVWqFMkrQZmIXS/tQyxSMKXLoADXkItLwMwjbMcKEgD6UW2n1gIxOPxgI
 RWe7dzofjH32bjM+ADUmw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:X+AgN2vv9fc=;czaDQY2hNQPR1eJKsLRFGPOFxKS
 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
Content-Transfer-Encoding: quoted-printable

Hallo Igor,

On Fri, 10 Jul 2026, Igor Putko wrote:
> Remove the global static 'keys_dev' struct to allow multiple device
> instances. Allocate 'nvec_keys' dynamically per-device using
> devm_kzalloc() during probe, and fetch the context using
> input_get_drvdata() and container_of().

what could be the reason for allowing multiple keyboards? The hardware is=
=20
not designed to provide this and it also makes little sense at a first=20
glance.

Best wishes,

Marc


> Signed-off-by: Igor Putko <igorpetindev@gmail.com>
> ---
> drivers/staging/nvec/nvec_kbd.c | 40 ++++++++++++++++++++-------------
> 1 file changed, 24 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/staging/nvec/nvec_kbd.c b/drivers/staging/nvec/nvec=
_kbd.c
> index d2b91318f..4b61aebca 100644
> --- a/drivers/staging/nvec/nvec_kbd.c
> +++ b/drivers/staging/nvec/nvec_kbd.c
> @@ -35,19 +35,17 @@ struct nvec_keys {
> 	bool caps_lock;
> };
>
> -static struct nvec_keys keys_dev;
> -
> -static void nvec_kbd_toggle_led(void)
> +static void nvec_kbd_toggle_led(struct nvec_keys *keys)
> {
> 	char buf[] =3D { NVEC_KBD, SET_LEDS, 0 };
>
> -	keys_dev.caps_lock =3D !keys_dev.caps_lock;
> +	keys->caps_lock =3D !keys->caps_lock;
>
> -	if (keys_dev.caps_lock)
> +	if (keys->caps_lock)
> 		/* should be BIT(0) only, firmware bug? */
> 		buf[2] =3D BIT(0) | BIT(1) | BIT(2);
>
> -	nvec_write_async(keys_dev.nvec, buf, sizeof(buf));
> +	nvec_write_async(keys->nvec, buf, sizeof(buf));
> }
>
> static int nvec_keys_notifier(struct notifier_block *nb,
> @@ -55,6 +53,7 @@ static int nvec_keys_notifier(struct notifier_block *n=
b,
> {
> 	int code, state;
> 	unsigned char *msg =3D data;
> +	struct nvec_keys *keys =3D container_of(nb, struct nvec_keys, notifier=
);
>
> 	if (event_type =3D=3D NVEC_KB_EVT) {
> 		int _size =3D (msg[0] & (3 << 5)) >> 5;
> @@ -70,11 +69,11 @@ static int nvec_keys_notifier(struct notifier_block =
*nb,
> 		state =3D msg[1] & 0x80;
>
> 		if (code_tabs[_size][code] =3D=3D KEY_CAPSLOCK && state)
> -			nvec_kbd_toggle_led();
> +			nvec_kbd_toggle_led(keys);
>
> -		input_report_key(keys_dev.input, code_tabs[_size][code],
> +		input_report_key(keys->input, code_tabs[_size][code],
> 				 !state);
> -		input_sync(keys_dev.input);
> +		input_sync(keys->input);
>
> 		return NOTIFY_STOP;
> 	}
> @@ -85,7 +84,7 @@ static int nvec_keys_notifier(struct notifier_block *n=
b,
> static int nvec_kbd_event(struct input_dev *dev, unsigned int type,
> 			  unsigned int code, int value)
> {
> -	struct nvec_chip *nvec =3D keys_dev.nvec;
> +	struct nvec_keys *keys =3D input_get_drvdata(dev);
> 	char buf[] =3D { NVEC_KBD, SET_LEDS, 0 };
>
> 	if (type =3D=3D EV_REP)
> @@ -98,7 +97,7 @@ static int nvec_kbd_event(struct input_dev *dev, unsig=
ned int type,
> 		return -1;
>
> 	buf[2] =3D !!value;
> -	nvec_write_async(nvec, buf, sizeof(buf));
> +	nvec_write_async(keys->nvec, buf, sizeof(buf));
>
> 	return 0;
> }
> @@ -107,6 +106,7 @@ static int nvec_kbd_probe(struct platform_device *pd=
ev)
> {
> 	struct nvec_chip *nvec =3D dev_get_drvdata(pdev->dev.parent);
> 	int i, j, err;
> +	struct nvec_keys *keys;
> 	struct input_dev *idev;
> 	char	clear_leds[] =3D { NVEC_KBD, SET_LEDS, 0 },
> 		enable_kbd[] =3D { NVEC_KBD, ENABLE_KBD },
> @@ -115,6 +115,9 @@ static int nvec_kbd_probe(struct platform_device *pd=
ev)
> 						true };
>
> 	j =3D 0;
> +	keys =3D devm_kzalloc(&pdev->dev, sizeof(struct nvec_keys), GFP_KERNEL=
);
> +	if (!keys)
> +		return -ENOMEM;
>
> 	for (i =3D 0; i < ARRAY_SIZE(code_tab_102us); ++i)
> 		keycodes[j++] =3D code_tab_102us[i];
> @@ -138,14 +141,18 @@ static int nvec_kbd_probe(struct platform_device *=
pdev)
> 		set_bit(keycodes[i], idev->keybit);
>
> 	clear_bit(0, idev->keybit);
> +
> +	input_set_drvdata(idev, keys);
> +	platform_set_drvdata(pdev, keys);
> +
> 	err =3D input_register_device(idev);
> 	if (err)
> 		return err;
>
> -	keys_dev.input =3D idev;
> -	keys_dev.notifier.notifier_call =3D nvec_keys_notifier;
> -	keys_dev.nvec =3D nvec;
> -	nvec_register_notifier(nvec, &keys_dev.notifier, 0);
> +	keys->input =3D idev;
> +	keys->notifier.notifier_call =3D nvec_keys_notifier;
> +	keys->nvec =3D nvec;
> +	nvec_register_notifier(nvec, &keys->notifier, 0);
>
> 	/* Enable keyboard */
> 	nvec_write_sync(nvec, enable_kbd, 2, NULL);
> @@ -165,12 +172,13 @@ static int nvec_kbd_probe(struct platform_device *=
pdev)
> static void nvec_kbd_remove(struct platform_device *pdev)
> {
> 	struct nvec_chip *nvec =3D dev_get_drvdata(pdev->dev.parent);
> +	struct nvec_keys *keys =3D platform_get_drvdata(pdev);
> 	char disable_kbd[] =3D { NVEC_KBD, DISABLE_KBD },
> 	     uncnfg_wake_key_reporting[] =3D { NVEC_KBD, CNFG_WAKE_KEY_REPORTIN=
G,
> 						false };
> 	nvec_write_async(nvec, uncnfg_wake_key_reporting, 3);
> 	nvec_write_async(nvec, disable_kbd, 2);
> -	nvec_unregister_notifier(nvec, &keys_dev.notifier);
> +	nvec_unregister_notifier(nvec, &keys->notifier);
> }
>
> static struct platform_driver nvec_kbd_driver =3D {
> --=20
> 2.47.3
>
>
