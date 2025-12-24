Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0406D355049
	for <linux-tegra@vger.kernel.org>; Wed, 24 Dec 2025 14:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766586756; cv=none; b=tnYIheXu+I0r0cSaDdirrqW339Cd7RpJJQ4KoSmNzlqdDZWaWe8/Bl5D7AOIcmQWTL1UKu7cAXVs5JFvFWEgpyGxF0mghtfq8Q8z2BsdonawiJ9MrKl1NluEDUXGPzzO3DPFU30rxHL/15BqDaZBHodCdOaJoDaWTxWAIjxx68A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766586756; c=relaxed/simple;
	bh=Ep6T2A1IcsHXvBna5nLZzlaT9fz+LpfP5KHb0lK+HHM=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=iFVeGsOqKI6PzSDY+y1bX7TzGS97w5W4fu6wFouvAdsn2Ryzn6EuUFOjGMLMmaCplHEcIxxuJkcBe07apWRZZ8Fw/Qw5iMbzvC9DGVrx1N6N9uIkSQ/LTlJ3998UWTnmFVFQ2CMINUbXKMf0pRRUIJStlUyuPfKu8XW6g5/jW0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de; spf=pass smtp.mailfrom=posteo.de; dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b=lzFTrCu1; arc=none smtp.client-ip=185.67.36.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b="lzFTrCu1"
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id BFB71240028
	for <linux-tegra@vger.kernel.org>; Wed, 24 Dec 2025 15:32:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.de; s=2017;
	t=1766586742; bh=02SzH1r7rFbe6gp7uCgKGi3IEEll/QfXuR0nbkBAYaY=;
	h=Date:From:To:cc:Subject:Message-ID:MIME-Version:Content-Type:
	 From;
	b=lzFTrCu1OG7eFk9vJoLRL/RCLOTNUwjjznwuXpP7D1QNvjGVnU0gh4dFcjJwQTipe
	 krSwlS/K5bBDghdZG8XioLQZSOCYFEmyy8SD/NMqRYUqlTcFuUTbBRZUyZBQmyfcvc
	 G7nB1DYkuxosYPVJNnz6fxLUI6+Ga43d4mI1cE+mMFIl6/UOm6TbPSFbSsXwrDJaUC
	 R/8bNzGOy+oXqjjKLt0ybHuMFPLg8aWk4plXsX/SDQi/5Hdr5Tb4utqVTC25EpU20l
	 IpBvr/CM/10QKdZrr4fveJm/Qk/wH5FcmolOBw32Www6Db3f75M/WEqxePbX29RG3g
	 s6Dv9UMoPTJkA==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4dbvTx6Lcjz9rxL;
	Wed, 24 Dec 2025 15:32:21 +0100 (CET)
Date: Wed, 24 Dec 2025 14:32:22 +0000
From: Marc Dietrich <marvin24@posteo.de>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
cc: ShadowMonkee <sshadowmonkeyy@gmail.com>, Marc Dietrich <marvin24@gmx.de>, 
    ac100@lists.launchpad.net, linux-tegra@vger.kernel.org, 
    linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: nvec: replace udelay with usleep_range
In-Reply-To: <2025122414-sedation-hazard-598b@gregkh>
Message-ID: <ab692e6f-4b9f-b089-4fa8-c6cb7c460be2@posteo.de>
References: <20251224111651.217679-1-sshadowmonkeyy@gmail.com> <2025122414-sedation-hazard-598b@gregkh>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed

Hi all,

I don't remember anymore where this delay came from, but I think we can
get rid of it alltogether after the fix for i2c writes landed. Somehow I
had overlooked it at the time.
I will try without my machine and see if it works (and also send a patch
afterwards).

Best wishes,
Marc


On Wed, 24 Dec 2025, Greg Kroah-Hartman wrote:

> On Wed, Dec 24, 2025 at 12:16:51PM +0100, ShadowMonkee wrote:
>> udelay() was used for a short delay in the NVEC I2C receive path.
>> Replace it with usleep_range(), which is preferred as it avoids
>> busy-waiting and allows the scheduler to run other tasks.
>>
>> Signed-off-by: ShadowMonkee <sshadowmonkeyy@gmail.com>
>> ---
>>  drivers/staging/nvec/nvec.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
>> index 263774e6a78c..dd92f186e0db 100644
>> --- a/drivers/staging/nvec/nvec.c
>> +++ b/drivers/staging/nvec/nvec.c
>> @@ -648,7 +648,7 @@ static irqreturn_t nvec_interrupt(int irq, void *dev)
>>  		break;
>>  	case 2:		/* first byte after command */
>>  		if (status == (I2C_SL_IRQ | RNW | RCVD)) {
>> -			udelay(33);
>> +			usleep_range(33, 34);
>>  			if (nvec->rx->data[0] != 0x01) {
>>  				dev_err(nvec->dev,
>>  					"Read without prior read command\n");
>> --
>> 2.52.0
>>
>
> Hi,
>
> This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
> a patch that has triggered this response.  He used to manually respond
> to these common problems, but in order to save his sanity (he kept
> writing the same thing over and over, yet to different people), I was
> created.  Hopefully you will not take offence and will fix the problem
> in your patch and resubmit it so that it can be accepted into the Linux
> kernel tree.
>
> You are receiving this message because of the following common error(s)
> as indicated below:
>
> - It looks like you did not use your "real" name for the patch on either
>  the Signed-off-by: line, or the From: line (both of which have to
>  match).  Please read the kernel file,
>  Documentation/process/submitting-patches.rst for how to do this
>  correctly.
>
> - You sent a patch that has been sent multiple times in the past and is
>  identical to ones that has been recently rejected.  Please always look
>  at the mailing list traffic to determine if you are duplicating other
>  people's work.
>
> If you wish to discuss this problem further, or you have questions about
> how to resolve this issue, please feel free to respond to this email and
> Greg will reply once he has dug out from the pending patches received
> from other developers.
>
> thanks,
>
> greg k-h's patch email bot
>
>
