Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.15.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794780036;
	b=nRFQVfPrQFk9qBdXnr213n/IVxF0EN7oih2114Sbeie+rQ9qBz3dZhjWkkvTcEjNVKPD
	 d+XEI+wv4MM0FCcNNEKjgABLJ3R3mYZcj77QO1PrRfvuxQW5vYuXG2hk10XA/YVSjJxnm
	 uC1bIs0H13l4YEtZ3kaszXd1aGGSZUaLwyjQpf7o3zAfC6bF8FJZs1WBc3yXVEGLo4U1L
	 uQB36VdPQM/DyE/TE1Xr7cr+4zvH2OAg/enWRLoJkZG2VKcsqDOq5Dpcoul3iLsde7lH4
	 aC2mn14C5zgM2SUrigGXRoE645hklpVypVcbCM7qWVRCOS9+kdO7Sfx3Ms4zNSmCWYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794780036;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:Date:From:To:cc:Subject:In-Reply-To:
	 Message-ID:References:MIME-Version:Content-Type:X-Provags-ID:
	 X-Spam-Flag:UI-OutboundReport:Content-Transfer-Encoding;
	bh=bJXu6DHMKJKlUruwZPhJ+VXorsXWdh+soHo9WiQbq/c=;
	b=qDsTF35waX8NWW41/wEziYT2vANVndWlKcPO6dnOe1jxlP43D2EXWLRIhiP7ccw/KyuV
	 TURlJVhOBc6WTmgug86onNPRXWg+6bqpkDORlfIO4zswy62SZfCkx2Y14Bzt2T/2KU4lL
	 0Et6flTiWsl2hWJjGK9GG2l8baQNubjNHBinV48+8zwopGQeyr7PRkCuUj97/5dLDVdRM
	 8A54avj5IvQJsKuCJ1mE+7UYtBiOZ0b+iqX6xh10Tt4iU5rSSnCgASG1fvLvOpAPN0JlN
	 cCkAnu4TQD/GK1qrYEado4xwcmg7gButHMRDa0g98zTk2Pi3B7WjkTTjd5nSFaaXmPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.de;
	spf=pass smtp.mailfrom=gmx.de;
	dkim=pass header.d=gmx.de header.i=marvin24@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=mX4oh3rt;
	arc=none smtp.remote-ip=212.227.15.19
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B1C8606A889
	for <linux-tegra@vger.kernel.org>; Sun, 15 Nov 2026 22:00:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B1C8606A889
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=marvin24@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=mX4oh3rt
DKIM2-Signature:  i=1; m=1; t=1794780033;
 mf=PG1hcnZpbjI0QGdteC5kZT4=;
 rt=PGxpbnV4LXRlZ3JhQHZnZXIua2VybmVsLm9yZz4=;
 d=gmx.de;
 s=s31663417:rsa-sha256:LCy4xztHZc3qJEOqTs6GUJTHvOU6
   Z2nz4v+0sHJQFDzPyLavldzvQ5IYOvjjzgmOawHIZ6DpgbNCfMWqc6fHqzPVvnGuA0yqoiEKESD
   cYkgmx71ve+YfiW8EnujM/TLEMQ9w9XWFwQCwmA6ZJYrDNcopRQwRRDFFtvYIoSQlFgMZq+/LEC
   qNj/q+5wVykSvKNXMU0rOtawYGPndHmtsT/YKeEE090lHwSQ2Dr8LwP0dUKhC6a4QELETpgxb3q
   agDc4sxgavBuQWSjmqwy+0c9eVVP1u4NaWj+I2+xdr7Qnyx++JXgv+PF3g7jCExj90EQRpRpti8
   pr5Rvf++axr1PQ==;
Message-Instance:  m=1;
 h=sha256:
   kJAqko4BmKL4zj7yWutKqv/a12eS/PWI3Wc6AjN3mok=:
   NzeVX57PoIUuevgPNboTIDakLoEgAN6FbDvAw0Cb+yM=,
  sha512:
   3KlJx1sKjAwhQknl1NWg+vb+MtSTkKb9/P0ZPUFFdKP1KDG5YgAo/+F7xy/fL7ETZaZyNYke6ncK5nQrrz8eew==:
   yDvLU0p1ymO6M+JwAQd6DH0saTV8sgezdDLUgCHm4jVeuR+beunRlbLfiXTir3lCaaGKQ1074yNoFwb0v2Vz3Q==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1794780028; x=1795384828; i=marvin24@gmx.de;
	bh=bJXu6DHMKJKlUruwZPhJ+VXorsXWdh+soHo9WiQbq/c=;
	h=X-UI-Sender-Class:Date:From:To:cc:Subject:In-Reply-To:Message-ID:
	 References:MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=mX4oh3rtuxktrBQ/ojmyyaQYEX0pmMMzOMlqi5asccOKZF8nF9OpPpuu+gGi8pfk
	 hj/YzQOiFCQ3NxV9FaHvGKEI3Ne+s/c9tLQ8m95Vg503EmXnjoKdvK60pb8iWrj3G
	 t1QlWCmWyR3bN/5IbUQpfPNCx+aRC4Y0xDiFkZfIpk2L9d65JCx3ujVTefmHGjgP9
	 4te9MBz26PSUMqwLTtddRDumtUIY12FlzZXc8HWs9rSIdoltDzk9eB+tI/AwTTTQM
	 Sb7TF6N+c21/tfvy/O0ovPL+DFiLrExmV/bu+KOoIUk0+UCBafC7rxyzfayKZBTGB
	 ql4IlifSdGKzHUdNNg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mxm3Q-1wW5Gk29WA-00rbYP; Sun, 15
 Nov 2026 23:00:28 +0100
Date: Sun, 15 Nov 2026 23:00:27 +0100 (CET)
From: Marc Dietrich <marvin24@gmx.de>
To: Mohamed Anis Ben Azza <benazzaanis783@gmail.com>
cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
    linux-staging@lists.linux.dev, linux-tegra@vger.kernel.org, 
    ac100@lists.launchpad.net, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: nvec: kbd: bound keycode table lookups
In-Reply-To: <20261111230134.200561-1-benazzaanis783@gmail.com>
Message-ID: <46a75394-3c8b-8e9a-489a-9c7b6bfc7dde@gmx.de>
References: <20261111230134.200561-1-benazzaanis783@gmail.com>
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Provags-ID: V03:K1:VkxR2yr5xg/aWdtLAeZ/2Ch0oCS/Am5Vq0PBNJjsoKocWlKD4v/
 Qeqhfle4cbPJmIPcUNtF6CIAGLPjzusyaWz7FhLCESlItOE+NtBd1r2T0skBZVJVsYcPS3K
 4F792iV0jQTwEbzccLl4WOySqkc4LFpQ8WA2Ist9xMdMWGYsKvwMEUq/aFNKHXsU+idDHGb
 khmzIX3goKwZxkmwa1f4Q==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Z2OQOfe9/do=;/9yRpVTbwpA2xo7xcR3t/l2HQgO
 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
Content-Transfer-Encoding: quoted-printable

Hallo Mohamed,

On Thu, 12 Nov 2026, Mohamed Anis Ben Azza wrote:

> nvec_keys_notifier() indexes code_tabs[_size][code] using values taken
> directly from the embedded controller's event message without checking
> them against the tables:
>
> - _size is a 2-bit field (0..3) from the message header, but code_tabs[]
>   only has entries for NVEC_2BYTES and NVEC_3BYTES. NVEC_VAR_SIZE is
>   rejected, but the reserved encoding 3 is not, so code_tabs[3] reads a
>   pointer past the end of the array and then dereferences it.

this is only a theroretical case. The size by protocol can either be
0, 1, or 2. As you already said, 2 is skipped in the code, so only 0 and
1 are values which we could expect.

> - code is msg[1] & 0x7f (0..127), but code_tab_102us[] has only 126
>   entries and extcode_tab_us102[] only 110, so scancodes at or above
>   those sizes read past the end of the tables.

well, the keyboard has only a limited number of keys and values > 126 (for=
=20
basic) and >110 for extended codes cannot be produced (while theoretical=
=20
possible by protocol).

> Reject any size encoding without a table and any scancode beyond the
> end of the selected table, dropping the event as is already done for
> the power button.
>
> This only matters for an EC that sends malformed or out-of-spec
> events, so it is a robustness fix rather than a security issue.
>
> The issue was found and the fix drafted with the help of an AI coding
> assistant (Claude). It was compile-tested with
> ARCH=3Darm LLVM=3D1 tegra_defconfig + MFD_NVEC/KEYBOARD_NVEC at W=3D1 wi=
th no
> new warnings, and the lookup logic was exercised in a userspace harness
> under AddressSanitizer for all 4 size encodings x 256 scancodes: the old
> code reports a global-buffer-overflow, the new code none. It has not
> been tested on real Tegra/AC100 hardware.
>
> Fixes: 32890b983086 ("Staging: initial version of the nvec driver")
> Signed-off-by: Mohamed Anis Ben Azza <benazzaanis783@gmail.com>
> ---
> drivers/staging/nvec/nvec_kbd.c | 15 +++++++++++++--
> 1 file changed, 13 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/staging/nvec/nvec_kbd.c b/drivers/staging/nvec/nvec=
_kbd.c
> index d2b91318f..9b976f0f5 100644
> --- a/drivers/staging/nvec/nvec_kbd.c
> +++ b/drivers/staging/nvec/nvec_kbd.c
> @@ -28,6 +28,11 @@ enum kbd_subcmds {
> static unsigned char keycodes[ARRAY_SIZE(code_tab_102us)
> 			      + ARRAY_SIZE(extcode_tab_us102)];
>
> +static const unsigned int code_tab_sizes[] =3D {
> +	ARRAY_SIZE(code_tab_102us),
> +	ARRAY_SIZE(extcode_tab_us102),
> +};
> +
> struct nvec_keys {
> 	struct input_dev *input;
> 	struct notifier_block notifier;
> @@ -59,8 +64,11 @@ static int nvec_keys_notifier(struct notifier_block *=
nb,
> 	if (event_type =3D=3D NVEC_KB_EVT) {
> 		int _size =3D (msg[0] & (3 << 5)) >> 5;
>
> -/* power on/off button */
> -		if (_size =3D=3D NVEC_VAR_SIZE)
> +		/*
> +		 * NVEC_VAR_SIZE is the power on/off button; the fourth
> +		 * encoding is reserved. Neither has a keycode table.
> +		 */
> +		if (_size >=3D ARRAY_SIZE(code_tabs))
> 			return NOTIFY_STOP;

are you doing the right thing here? The original code exists the function=
=20
when _size is 2 (NVEC_VAR_SIZE), but you just let it fall through.

> 		if (_size =3D=3D NVEC_3BYTES)
> @@ -69,6 +77,9 @@ static int nvec_keys_notifier(struct notifier_block *n=
b,
> 		code =3D msg[1] & 0x7f;
> 		state =3D msg[1] & 0x80;
>
> +		if (code >=3D code_tab_sizes[_size])
> +			return NOTIFY_STOP;
> +
> 		if (code_tabs[_size][code] =3D=3D KEY_CAPSLOCK && state)
> 			nvec_kbd_toggle_led();

As I said, this is only a theroretical scenario which could happen if the=
=20
protocol is violated or someone manages to connect an internal keybaord=20
with more keys. While it is not impossible that machines exist out there
which have such keyboards, the is very unlikely.

Best wishes,
Marc
