Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8500D34405B
	for <linux-tegra@vger.kernel.org>; Tue, 12 May 2026 23:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778629334; cv=none; b=EDP/mBwjEyDbT+OgqU7PNg2lpiQWWyfCuJa3IXGFS4odoakNH08xoJ/hLoauVi4wPk+i09DDOFwMb4jN7mqRrUFo6NODDhjyCRizuFrdgQR0gB0nXg+7bCl7WIdvpA0YpRwPctCFygD9vGMJydgAac0wy4idWrsWi0gPCpdx6Pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778629334; c=relaxed/simple;
	bh=K/FbVyEnSjXQNhl2/gYDd+uql3tMVW2iPkwNkLb10xk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jPTd6P4JXwK34vI2uJm6Mi8/OfwOdfpY4F0oi/WySyVZN8laWqtqJNo45oXlx/ZgAXy/+s6GPwAPVyxko1iBcwYSQbtS0ni59ZAJnDuk7KEnwKRbmsDa3Fx5V6uE9QucjdvFloUb8g/aRiTF2TR85z63JMmqp4OC7p4FPvtwXKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VfLo7qBE; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VfLo7qBE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778629332;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7o5mBg4H1s27CSkJ6QLJUQ+LW+M3lQ1OujNNhR5gy5M=;
	b=VfLo7qBE+B+AxRTLxYyrks7+bCfrrPHBK9OPPHjQmFvmp0Ot6q4xViv53Tgn+Jq0TidBV8
	vKl4WSFdJgYbKlAC5sZp8c7p4e8wVDf/Tv6zIpYS70ceCMRo04UCNSaVC8CmpmEDndDp55
	CpiLZksXmZBIXan5ckz2hal/zXCB/Vs=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-693-gnllGmdsN_SK1mDCeqaF5w-1; Tue,
 12 May 2026 19:42:09 -0400
X-MC-Unique: gnllGmdsN_SK1mDCeqaF5w-1
X-Mimecast-MFC-AGG-ID: gnllGmdsN_SK1mDCeqaF5w_1778629328
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9343C1956095;
	Tue, 12 May 2026 23:42:07 +0000 (UTC)
Received: from [10.2.16.241] (unknown [10.2.16.241])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 0E80B19560A2;
	Tue, 12 May 2026 23:42:04 +0000 (UTC)
Message-ID: <1a8ce61a-8f4f-443a-a454-0301b42af7de@redhat.com>
Date: Tue, 12 May 2026 19:42:03 -0400
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] firmware: tegra: bpmp: Make atomic_tx_lock a raw_spinlock
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Thierry Reding <thierry.reding@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, Clark Williams
 <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rt-devel@lists.linux.dev, jberring@redhat.com
References: <20260504163448.1063474-1-longman@redhat.com>
 <20260505062714.jayZOl2t@linutronix.de>
 <afdb5fc1-f478-4547-aa39-04d477854d64@redhat.com>
 <20260506064105.7R4Q7XJP@linutronix.de>
Content-Language: en-US
From: Waiman Long <longman@redhat.com>
In-Reply-To: <20260506064105.7R4Q7XJP@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

On 5/6/26 2:41 AM, Sebastian Andrzej Siewior wrote:
> On 2026-05-05 15:47:23 [-0400], Waiman Long wrote:
>>   __might_resched+0x254/0x330
>>   rt_spin_lock+0x70/0x140
>>   tegra_bpmp_transfer_atomic+0x118/0x3c0
>>   tegra_bpmp_probe+0x564/0x6f0
> So this is tegra_bpmp_ping().
>
>> I know that interrupt is disabled becasue of the following code.
>>
>> 346 int tegra_bpmp_transfer_atomic(struct tegra_bpmp *bpmp, 347 struct
>> tegra_bpmp_message *msg) 348 { 349 struct tegra_bpmp_channel *channel; 350
>> int err; 351 352 if (WARN_ON(!irqs_disabled())) 353 return -EPERM;
> Well, yes. It disables interrupts just probably to document the time it
> took for the transfer so it can write it then via dev_dbg().
> It is hard to tell what the worst-case delay here is but it is probably
> not important if this is just boot time/ driver probe. Maybe.
> What I am bit more concerned if the actual path of this
> tegra_bpmp_transfer_atomic() invocation via i2c driver is actually
> invoked with disabled interrupts on PREEMPT_RT. Because that might not
> be the case. I've been looking at the i2c call chain and it is not
> obvious what the actual call chain is. There is just
> i2c_in_atomic_xfer_mode() check. So it may or may not be used in the
> end.

tegra_bpmp_channel_write() calls tegra_bpmp_wait_request_channel_free() 
which waits until the channel is freed. So it is hard to tell how long 
does that take. In my case, the bug report happened at boot time.

Anyway, are there other comment about this patch?

Thanks,
Longman

