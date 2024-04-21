Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1A6818637
	for <linux-tegra@vger.kernel.org>; Sun, 21 Apr 2024 18:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713725068; cv=none; b=GgI62A95CaBXkzQ0YLH43iTXdqhyBK22GJvl415b0rkSSuqsxhXSi2SVtdBaBA/z3Dxmymp2pQkTK3C4WjmYlnepkldYMZyFrtVWBxdfLvWyAdOHy8vytNFeAnOw/k/l14JWJQkRNVH3Od/dwz87iUQJAvQyZWJ2oz9mn4RWNCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713725068; c=relaxed/simple;
	bh=oNhP/xj4oPiwJOXjOOXAUqqAKb20EGQzG5PGlewfRtA=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=O8Rou/thTtN5SCZCwxHWF5+SuwCCHe79taqJTJAMpMa8luJCpieAMyFJJxo+avhzIEIUEZtSGIiT79Y0gDnsDSfWYz7i6eQnGlKFmKOKcHuQdHdQfZ1+buBVY2z7d7PsQlHThPsY4sVZ1mTT7DjxT9Rh+UO8bZKMJX2VOKrTBAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de; spf=pass smtp.mailfrom=posteo.de; dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b=BiM3wxa5; arc=none smtp.client-ip=185.67.36.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b="BiM3wxa5"
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 104BC240029
	for <linux-tegra@vger.kernel.org>; Sun, 21 Apr 2024 20:44:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.de; s=2017;
	t=1713725059; bh=oNhP/xj4oPiwJOXjOOXAUqqAKb20EGQzG5PGlewfRtA=;
	h=Date:From:To:cc:Subject:Message-ID:MIME-Version:Content-Type:
	 From;
	b=BiM3wxa54MKBBgVzTONc0ijllO84sCdI0tuqzkeD9ipcYMDd7xoFxKJvjBXgl8GD2
	 DE165v4TK+x5aOZn+bqPE/DC+pkXYgGYWRfVYMkFnosZtAdpcMWs733hN9kkVyIuvv
	 /PikqCaWrASNQlh1FG3aHyPYQBbXYfpXyjxPojPh0CYVHW69dJi87YPxx7AfhqzMwW
	 vqFsxkKUkKsTPhDBooKDWkvb2mq9b8G00hDdFHpk1xvpOYY0+uUMcZsbwAFLFHg+3R
	 fQ5JyxuTX/YhpfvXa3fPAwMcI/KcEzCt/r6Tc14JE6iaYqWlx3ZTPCikruYvXQhbmP
	 IGkWCyNM1lzbg==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4VMy36123dz6tx7;
	Sun, 21 Apr 2024 20:44:18 +0200 (CEST)
Date: Sun, 21 Apr 2024 18:44:18 +0000 (UTC)
From: Marc Dietrich <marvin24@posteo.de>
To: Greg KH <gregkh@linuxfoundation.org>
cc: Marc Dietrich <marvin24@gmx.de>, linux-staging@lists.linux.dev, 
    linux-tegra@vger.kernel.org
Subject: Re: [PATCH] staging: nvec: make i2c controller register writes
 robust
In-Reply-To: <2024042118-errant-causing-8bc5@gregkh>
Message-ID: <0292c723-0cf4-3a4f-733a-4b1e8e6b3efb@posteo.de>
References: <20240421104642.25417-1-marvin24@gmx.de> <2024042118-errant-causing-8bc5@gregkh>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed

Hi Greg,

On Sun, 21 Apr 2024, Greg KH wrote:

> On Sun, Apr 21, 2024 at 12:46:42PM +0200, Marc Dietrich wrote:
>> The i2c controller needs to read back the data written to its registers.
>> This way we can avoid the long delay in the interrupt handler.
>>
>> Signed-off-by: Marc Dietrich <marvin24@gmx.de>
>> ---
>> ...
>> + * A write to an I2C controller register needs to be read back to make sure
>> + * that the value has arrived.
>> + */
>> +static void i2c_writel(u32 val, void *reg)
>> +{
>> +	writel_relaxed(val, reg);
>> +
>> +	/* read back register to make sure that register writes completed */
>> +	readl_relaxed(reg);
>
> Do you need to compare the value to make sure it happened properly?
>
> And how is this an i2c write?  Normally that implies this is using the
> i2c core functions, this name is going to get confusing very quickly...

I just used the same name as in i2c-tegra, which may be helpful when the 
drivers will be merged in the future.
The reason why a readback is needed is descibed in commit ec7aaca2f6. As 
far as I understand (it is not mentioned in the TRM AFAIK), writes are 
somehow buffered and a readback guaranties that the write really reached 
the controller. The alternative was just to wait some time...
From the commit message it seems that this only applies to the interrupt 
status register, but it does not harm the do this also for the data 
registers just like the host driver does.

Best regards,

Marc
