Received: from box.windestam.se (box.windestam.se [85.90.246.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBC5C1FF1B3;
	Wed,  5 Feb 2025 19:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.90.246.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738784313; cv=none; b=PmPEYhz7kf4Q4iCVddGgfwrvq28KBfWHya5CR1mZ9/7rNyCWkbTeVfwTTV02sZapH+bpTWMpNSpynrSudAab3/uYEdoyLQ0cysnuqyQXl4EwLozLHXAho8Y3cu1ZLKvwla/x+dxhSfMx3cjcsQ/Tx78kNfSg/cYWqB0ET31l2/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738784313; c=relaxed/simple;
	bh=/ZHEOo3BjG0CaiMT3jtL30v8DzgZGFxF2E6krJc6J4E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sMTxM50pwg1YtOf88Tw/uErLj3NBs3aREk9Bxe1TYkLodQ8zwn3Xkd4vNaLhclz9iBvEmf1sxwbjq5vc+qtmdGLnRovbCUNTauNJurm8ctAMgYqiORYLUId0jKsB6/pVcymVs2U+Ih3XD8cFPoUtX0yLcxIskczqRnedlTbKz8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=windestam.se; spf=pass smtp.mailfrom=windestam.se; dkim=pass (2048-bit key) header.d=windestam.se header.i=@windestam.se header.b=Ydz9/kL2; arc=none smtp.client-ip=85.90.246.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=windestam.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windestam.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=windestam.se header.i=@windestam.se header.b="Ydz9/kL2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=windestam.se; s=mail;
	t=1738783768; bh=/ZHEOo3BjG0CaiMT3jtL30v8DzgZGFxF2E6krJc6J4E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Ydz9/kL2vZsRdiq7CgeWA5Wj4dAMp0W4Qu91AnlPn58WDY3guGVn0goBXbyMdn8vh
	 XWVLWPPs5aHZMxWxy259Vd2oEBkNLTIlBr3FAhguhfLZzOaMUPyTOsbCC7fKoisCvT
	 mwc3QuYAhSuHOqQD39sStVn5Sw/S7bpAVBMSzxfV4yXM//rnJ8utR/aY4sjAemnxyf
	 TpIE9CLTL8xpPG9PSe/Zwu1heJpKKYU2a3M344i854nwQZjcSGmjHONxQkjlYKJj9v
	 mZz9ac+mL+OKLwjuSEg1AfeolOgNZFXTsbM9kBqvp3Sa1RCyGtUwY0PdJBMB96hhQ9
	 WLWRgHMTcxJOA==
Received: from authenticated-user (box.windestam.se [85.90.246.140])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by box.windestam.se (Postfix) with ESMTPSA id 682E6407C8;
	Wed,  5 Feb 2025 20:29:27 +0100 (CET)
Message-ID: <f264888e-6100-4812-9661-ffad174f45af@windestam.se>
Date: Wed, 5 Feb 2025 20:29:26 +0100
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: =?UTF-8?B?UmU6IOetlOWkjTogW1BBVENIIHYzXSB1c2I6IGdhZGdldDogdV9zZXJp?=
 =?UTF-8?Q?al=3A_Disable_ep_before_setting_port_to_null_to_fix_the_crash_cau?=
 =?UTF-8?Q?sed_by_port_being_null?=
To: =?UTF-8?B?6IOh6L+e5Yuk?= <hulianqin@vivo.com>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 Dan Carpenter <dan.carpenter@linaro.org>, Jon Hunter <jonathanh@nvidia.com>
Cc: Prashanth K <quic_prashk@quicinc.com>,
 "mwalle@kernel.org" <mwalle@kernel.org>,
 "quic_jjohnson@quicinc.com" <quic_jjohnson@quicinc.com>,
 David Brownell <dbrownell@users.sourceforge.net>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "opensource.kernel" <opensource.kernel@vivo.com>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 Brad Griffis <bgriffis@nvidia.com>,
 Harshit Mogalapalli <harshit.m.mogalapalli@gmail.com>
References: <TYUPR06MB621733B5AC690DBDF80A0DCCD2042@TYUPR06MB6217.apcprd06.prod.outlook.com>
 <1037c1ad-9230-4181-b9c3-167dbaa47644@nvidia.com>
 <2025011633-cavity-earthworm-2b5e@gregkh>
 <3d9db530-a0b7-4f18-9ad4-233356dfe68c@nvidia.com>
 <e3a457d6-092b-4b7a-9032-50daddab6f1f@nvidia.com>
 <0fa6c6db-fd75-4a09-b4fa-d6a98bb8afac@stanley.mountain>
 <TYUPR06MB621712E6A082791B397088BFD2F72@TYUPR06MB6217.apcprd06.prod.outlook.com>
Content-Language: en-US
From: Pelle Windestam <pelle@windestam.se>
In-Reply-To: <TYUPR06MB621712E6A082791B397088BFD2F72@TYUPR06MB6217.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

>>>>> Odd, you have a usb-serial gadget device in this system that is
>>>>> disconnecting somehow?  That oops doesn't point to anything in the
>>>>> usb gadget codebase, "all" we have done is move the call to
>>>>> shutdown the endpoints to earlier in the disconnect function.
>>>>
>>>> Yes the board starts usb-serial and usb-ethernet gadget and on
>>>> reboot when tearing it down I am seeing the above. As soon as it
>>>> disables the tegra-xudc endpoints (as seen above) the board appears to
>> stall.
>>>>
>>>>> I'm glad to revert this, but it feels really odd that this is
>>>>> causing you an rcu stall issue.
>>>>
>>>> Thanks. I can't say I understand it either, but I am certain it is
>>>> caused by this change.
>>>>

I do not have much to add in terms of solutions but want to chime in 
that the same issue happened to me the other day when I upgraded my 
kernel. It manifests itself with the rcu stall whenever I try to reboot 
my device with the USB-cable connected (it is a usb-serial gadget 
device). Moving the usb_ep_disable() calls to outside the lock (where 
they were before the patch) solves it.
