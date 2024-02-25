Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C7C71B946;
	Sun, 25 Feb 2024 19:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708890794; cv=none; b=jiQwN0jYlRhcca+GvvQvGKkCrwtBn/Oho9e1uOCZfMRlmG7e1moowf2S/JuEJCrkri0GgyfFrV/ZRBOKyw0lHIEdSHVClrwH9BOfIXdS63ihmlsklBO7B9Nar/eAXIT4iWL1yDD79fxxRlRPjU4xcbG1hN0RFPtTwhCgA4IQrCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708890794; c=relaxed/simple;
	bh=jD97tToUqKAgstVC7PqdchtOp4i3N+IGMoy1uLtAi5I=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=AwHD7h2K7t4FTCuwQS8IMIPU5Y3qVQIiyW2HD6RGgxWQbvdlpoIa28pZSrheW4fQad6rTuptSXuojioTjgkTKZx9iv9GGtzQvKRN112xQvLfIAceL5DC8xreOdaK5/PnQfvIjzlDnAKje4V5PoZxO93HXcOa5qRlGvAmOsV2BNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=marvin24@gmx.de header.b=G8CEbXei; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=marvin24@gmx.de header.b="G8CEbXei"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
	t=1708890788; x=1709495588; i=marvin24@gmx.de;
	bh=jD97tToUqKAgstVC7PqdchtOp4i3N+IGMoy1uLtAi5I=;
	h=X-UI-Sender-Class:Date:From:To:cc:Subject:In-Reply-To:
	 References;
	b=G8CEbXeiv89F1s1ABQ+PDxniBW9ra8PjUoZ34MAnxfSeTCsukTqoK2oq1R7xPfIc
	 qcWjhuW8It6ojI1nym3CFSkO9FbcludHt02EP19PLiE77Z12iJiquP6Mcp8ooad0D
	 DR72nEkB8t0aq1ixZip6oSdRnh0UWLpCG36VjMpXyTJoL/jzEs0HM4daQkf3qsmTT
	 6AFvomTwnVFN1DWZEsAkDT+LCncHWg45JNj2bmv+7TSwA23AJ2RKhCpoyJxsCzxm7
	 SNVYzMWVHTuGPkxuwLwbogt1gwJVeTjREZgIxJSXUnSxBy1p1bVbHr5TZZwVoowGI
	 zpXQeDSzZ7wM2XocZg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from n5219w05.fritz.box ([109.250.32.230]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mnpru-1r6eQo2uSY-00pK9u; Sun, 25
 Feb 2024 20:53:08 +0100
Date: Sun, 25 Feb 2024 20:53:07 +0100 (CET)
From: Marc Dietrich <marvin24@gmx.de>
To: Thierry Reding <thierry.reding@gmail.com>
cc: Marc Dietrich <marvin24@gmx.de>, linux-staging@lists.linux.dev, 
    linux-tegra@vger.kernel.org
Subject: Re: [PATCH 1/2] staging/nvec: update comment regarding udelay in
 the isr
In-Reply-To: <CZ971XOHA968.3OVG90NP5YYJP@gmail.com>
Message-ID: <a397f4e9-03e1-2f26-97cc-e1141d143b5c@gmx.de>
References: <20240218212557.22836-1-marvin24@gmx.de> <CZ971XOHA968.3OVG90NP5YYJP@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Provags-ID: V03:K1:325/EaBcvmQLY0s6hOGyRZVfCSb8t4h/XGuQtv1i7JCmQz73hqc
 M3skKtFGIpuz9oRBgYpwO9B1wv6aRJCux+1Cj5i1eu1R8NSRXFCuDdy7INDt3alNKTBQMYS
 42UAW3SXVTguj+tmZ2QQHI4soAV4dBs+uMCnJtZrlqbIsS1wDP1xkzoNW8GrRPTFvyOrPk0
 aIoHwc1ny5zzL7qfpHYDQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:eavW0JuL9Zs=;v5JI+wb1HKqGki/MNTxJaTdwsV9
 Efh2uatVd9esVtJDJit0QtsYApFqX9psoKatxjaloSv5CACKpNQyyuk58YItqjJrfaxtQiCNK
 x4Vi/+pNQba7wWLTC5L41qfuw3rUOTG4sCJvzrEEiO5pPuSaaitxo2WJJm065WW0QvWP/oRWq
 BdNbpDRhBNgHYow1l6kKqbA4trjmnVXpXSnGDAldXajnXqctaSgR3A48xgbWeoJ89StB4/3TV
 LV9WP+SmOq6hzrm1BXnpYYuk6QORk5J7PVBNdDwpz0giMvnN3JXzYLtty6/CIQExT0E/VJ4/a
 NB7FkdTc1h5nueZ4zGV4iDiuA3jvpW/SH3oWrgzbs1WHSQ7Z/ERBGLL4XzouHIrIveeYdnB5E
 mNzU/3jhAEVeb0V+T8DrSil9eiWwExhIh/LIzSbpgN6+8qWvqsO8ExR2IwERReRsesa1FDdhk
 VRWQd39OZUJNBaO2d+Doo62y9X5gVWIwzEAWu/UiaKLje3r46x8K16IFgGjsfxRhFbDzfbHfC
 bBAS8NaosmJqFbLDLGBv9tHDraUUY7K9Lbo/msmIXycsopZU7vrXoIzp5ZQtuqJlKtc9u82Pu
 6NbQ2FYVSR5M2VUO8HnjeMgY9krNbC/3+59dX6KDQSB+SMIh7Ogi1XhDfFVM5tYa/pCf9/ScH
 W5epNw78kc1taQLtB/R30aD7kRP9h30djUfZqTVNq3kItMJ6/SidUPLQOJ+WwZlQkuFhG+feS
 wonKpX2/amCrXmpHI80ybQliwkGhTEtbCsDhkMFxc88YLY+CKNUI/4z2x2uAvbLL8DcA89gR4
 4k/L+093JW4cZVQsy6OQKoqSmwU8tVT2svnQc8R2hVJW0=
Content-Transfer-Encoding: quoted-printable

Hi Thierry,

sorry to reply late, but I somehow missed your mail.

On Mon, 19 Feb 2024, Thierry Reding wrote:

> On Sun Feb 18, 2024 at 10:25 PM CET, Marc Dietrich wrote:
>> Update the comment before the udelay on how to replace it.
>>
>> Signed-off-by: Marc Dietrich <marvin24@gmx.de>
>> ---
>>  drivers/staging/nvec/nvec.c | 7 ++++---
>>  1 file changed, 4 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
>> index b3f114cb00dc..ec081d81a308 100644
>> --- a/drivers/staging/nvec/nvec.c
>> +++ b/drivers/staging/nvec/nvec.c
>> @@ -709,10 +709,11 @@ static irqreturn_t nvec_interrupt(int irq, void *=
dev)
>>  		status & RNW ? " RNW" : "");
>>
>>  	/*
>> -	 * TODO: A correct fix needs to be found for this.
>> +	 * TODO: replace the udelay with a read back after each writel above
>> +	 * in order to work around a hardware issue, see i2c-tegra.c
>
> i2c-tegra.c is almost 2000 lines, so it'd be good to be a little more
> specific. Are you referring to the work-around in i2c_writel()? If so,
> perhaps mention that function so that people can find it.

yes, I thought this should have been clear as there is (nearly) no write
without a readback in that driver.

>>  	 *
>> -	 * We experience less incomplete messages with this delay than withou=
t
>> -	 * it, but we don't know why. Help is appreciated.
>> +	 * Unfortunately, this change causes an intialisation issue with the
>> +	 * touchpad, which needs to be fixed first.
>
> Perhaps something like: "... this change would cause an initialisation
> issue... " to make it a little more clear what you are referencing. Is
> there any information about the touchpad issue? Any idea what's going
> wrong during the initialization?
>
> Seems like this issue has been around a very long time already, and the
> further we kick this can down the road the less likely it will be that
> we'll ever fix it.

I must confess that I wasn't motivated to fix it, because it works most
of the time. The driver needs more love than just fixing this issue, e.g.
implementing a reliable sync write which may be one of the underlying
problems.

On the other hand, there is a downstream i2c client implementation [1],
which uses the kernel i2c infrastructure and may lay a better foundation
for the current driver.

I'm also not happy with the current situation, but the only alternative
is to remove the driver completly. I'll try to find some time to improve
the keyboard / touchpad initialisation in the next weeks.

Marc

[1]
https://nv-tegra.nvidia.com/r/plugins/gitiles/linux-4.9/+/refs/heads/l4t/l=
4t-r31.0.1/drivers/i2c/busses/i2c-tegra-slave.c
