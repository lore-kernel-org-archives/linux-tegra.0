Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D3CA534445
	for <linux-tegra@vger.kernel.org>; Wed,  9 Sep 2026 11:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788951861; cv=none; b=UXt7zQZDEetoyfmZLmAB+A+uuFeaCRjJ4DYVG51BMbSB3meIWeWbe8a59OagxnlZ4OB1Sw84Uc4CRulfBLk/wmcEHyyu+PWDBZzhuysmUkQV9YH4Lo+/DvfYFO6eVER8bwTnd+7m6C5LF5oxHqePapQF2GPd/ti0pu5o/ex+cpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788951861; c=relaxed/simple;
	bh=Rzpqksp/qKE1bDH6y39VH8pIARppCQb7o4bmXV4eju8=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=ttmZUNlSPa4F+hRdKkkQJGtphMIDiFgeKeWEr9ZH6G2PKT5n6yAK8o6CS2YbySRvf7hj5iQegW4nwuG3r1/batX/uQHQTzSBULfhBDAeKl5ROK4M95EwMzqAlbjiM4tRSTsK/oF10yyl+zdG7w5W9dfXuV/+AST9ekTcOOp97w0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j89WfArA; arc=none smtp.client-ip=74.125.224.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j89WfArA"
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-66fb8a78ad2so6999511d50.2
        for <linux-tegra@vger.kernel.org>; Wed, 09 Sep 2026 04:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788951852; x=1789556652; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yu6XBq0/lXnZ7cWMkDYqnoMO3CTujhBWMHDaaEEIfu8=;
        b=j89WfArAb4HAae1r9gERB9vbyd4lujvT4QzylaHONNA6Q2Wf4knbMbObz5i525Ut4t
         XkSo5AaI0HUxT0uGfAvI+gBT3QVVAT4z7Z6X1rYzRyP6/km7YtvxqHnX65Mn7Ml5+NP3
         FLXjoFY5SSOpi+0C6jJBGg5LkrrudZX7/Zf17BUfr1UBkyIOoHrFH0XGMbs1s6uMTjkr
         3bRpufNCdRYjhLc0hcJzyc26NKMfFU/GknUIo1ib4IvIuFNBWZSUtSqWIt6BgZjcESeL
         Gh26103u4O1yeaieTZtSACBZgpuK5tNWMK16x0Bs1FCT2UIk2Tms0ScjaMQ+CmRCv2hG
         DtdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788951852; x=1789556652;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yu6XBq0/lXnZ7cWMkDYqnoMO3CTujhBWMHDaaEEIfu8=;
        b=TVsKVcSPBeT8vDw/w+sM1vE/uY3C/vTrDesBAuCsKSt4mZ0342VCzptPLoYpoAem9+
         yvq4nYpYqP+1fZnijUXHOuKCybLXNRRTVHGkPFbsRjg6D2JTxsLSIhu53Fb9L/nz+KxQ
         ieF7PMQWE+EaLaSsRN+C11Al7ePHOb9e2lOgENoKymh2bd1z+e/d3sIbWWOGWmYD9zui
         AqeST2vlEfTpL1Jiwp3Z553oI2JLUloFEYQODefltji54Om2BA5/VtbdpFGPTL124Hh1
         Lj6u4+WOFfElBeRJHl492WmNhQ6vl9CVonhw3bE5XZ1TEkYtgBZQGGyR4rl3MfsV9Rrd
         9jMg==
X-Forwarded-Encrypted: i=1; AKwUvBzF81aR9jMmnpUdoQi9Y62W1sy9SBWHn6a5PaMa4UvAvsu4ya6kGM1gN6NJ6Kusk29Jcb3aVUr7+2HR3A==@vger.kernel.org
X-Gm-Message-State: AFuF++noNG3r+nLLdpwP/ivddpylRST3mqPbKUoczbj5yGzxaIdMjcPa
	3C0Hw0JBeKT/hrtbliOPy8Bk80AYTDOifWTgzAlKqK4Th0cn0WXa2IfJ
X-Gm-Gg: AYBFou3HYldujjxb5oyamztPo78FU0hgLQF8ux95UNcLQPvep7oJJk7uU+JFq+n9C3o
	xx7uwHAC9l3L8SGH62+W94R03JrKRwHV2p51EIgk5DKi2Nq8ptxOMKhxG2gcdKnT1DLGQf/QXCl
	Nk/v+x8xt5H89DYDdAIJSpexZWoYBgwzJIMv4X18FR+usl7sUkAeYtbHLPw0Bh6sJ+Dh4Dtxvfb
	alEFARfXugSYY6cpQJbYjMVDt4A00Qzt3K1me/QlYB52QQyoQLJKeXKyT05FpE0rQJGNamECX6m
	0iaZyzxLptZc+3aiw8dDc/rBd9yBEZIPTTxVWnYJyUuhzmpCBQGa6UFiY3+yc/62wDs9IHnyvaV
	5wFMcl15QKbWuxhdEaD/9vkd116wjqiK4JJDz433ypE+ubZS9+NpXWHLV8w+mJ0+PaGaXtc3DOS
	v6KaZ6pgFf6ypxjBFxfJ9XNfn5q7iAUb6QGm8QeelmAMMPAx+xYIVoaQHUfipRPcafyWeXLzkmZ
	Nhyg7Mq3LB2FyLLN6EoL0YECfV+
X-Received: by 2002:a05:690e:34f:b0:66d:2469:2518 with SMTP id 956f58d0204a3-66fb593f3e0mr8590219d50.13.1788951852153;
        Wed, 09 Sep 2026 04:04:12 -0700 (PDT)
Received: from [10.254.153.217] (munvpn.amd.com. [165.204.72.6])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91040694c35sm140718096d6.36.2026.09.09.04.04.04
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 09 Sep 2026 04:04:11 -0700 (PDT)
Message-ID: <2fd989b4-06ea-42e6-b18a-bc3ef2e069f5@gmail.com>
Date: Wed, 9 Sep 2026 13:04:03 +0200
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 08/12] dma-buf: heaps: Add debugfs support
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
To: Thierry Reding <thierry.reding@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, Yury Norov <yury.norov@gmail.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Russell King <linux@armlinux.org.uk>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Robin Murphy <robin.murphy@arm.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 "T.J. Mercier" <tjmercier@google.com>, Steven Rostedt <rostedt@goodmis.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Chun Ng <chunn@nvidia.com>, Mark Rutland <mark.rutland@arm.com>,
 Saravana Kannan <saravanak@kernel.org>
Cc: Thierry Reding <thierry.reding@gmail.com>, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-mm@kvack.org, iommu@lists.linux.dev, linaro-mm-sig@lists.linaro.org,
 linux-trace-kernel@vger.kernel.org, Thierry Reding <treding@nvidia.com>
References: <20260904-tegra-vpr-v6-0-79042cfa8de5@nvidia.com>
 <20260904-tegra-vpr-v6-8-79042cfa8de5@nvidia.com>
 <a77730b2-b5d6-49f9-a8ab-72eac4e241b6@amd.com>
Content-Language: en-US
In-Reply-To: <a77730b2-b5d6-49f9-a8ab-72eac4e241b6@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Since AMDs mail servers blocked me from sending this out, here once more from my gmail account.

Regards,
Christian.

On 9/4/26 15:00, Christian König wrote:
> On 9/4/26 12:44, Thierry Reding wrote:
>> From: Thierry Reding <treding@nvidia.com>
>>
>> Add a callback to struct dma_heap_ops that heap providers can implement
>> to show information about the state of the heap in debugfs. A top-level
>> directory named "dma_heap" is created in debugfs and individual files
>> will be named after the heaps.
>>
>> Reviewed-by: Maxime Ripard <mripard@kernel.org>
>> Signed-off-by: Thierry Reding <treding@nvidia.com>
> 
> One minimal nit pick below, with that taken care of Reviewed-by: Christian König <christian.koenig@amd.com>.
> 
>> ---
>> Changes in v5:
>> - fix failure handling during debugfs root directory creation
>> - add more cleanup to the newly introduced dma_heap_exit()
>> ---
>>  drivers/dma-buf/dma-heap.c | 52 ++++++++++++++++++++++++++++++++++++++++++++++
>>  include/linux/dma-heap.h   |  2 ++
>>  2 files changed, 54 insertions(+)
>>
>> diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
>> index 8a6c2b6e0cc6..65c80dac6500 100644
>> --- a/drivers/dma-buf/dma-heap.c
>> +++ b/drivers/dma-buf/dma-heap.c
>> @@ -7,6 +7,7 @@
>>   */
>>  
>>  #include <linux/cdev.h>
>> +#include <linux/debugfs.h>
>>  #include <linux/device.h>
>>  #include <linux/dma-buf.h>
>>  #include <linux/dma-heap.h>
>> @@ -225,6 +226,40 @@ const char *dma_heap_get_name(struct dma_heap *heap)
>>  }
>>  EXPORT_SYMBOL_NS_GPL(dma_heap_get_name, "DMA_BUF_HEAP");
>>  
>> +#ifdef CONFIG_DEBUG_FS
>> +static int dma_heap_debug_show(struct seq_file *s, void *unused)
>> +{
>> +	struct dma_heap *heap = s->private;
>> +	int err = 0;
>> +
>> +	if (heap->ops && heap->ops->show)
>> +		err = heap->ops->show(s, heap);
>> +
>> +	return err;
>> +}
>> +DEFINE_SHOW_ATTRIBUTE(dma_heap_debug);
>> +
>> +static struct dentry *dma_heap_debugfs_dir;
>> +
>> +static void dma_heap_init_debugfs(void)
>> +{
>> +	dma_heap_debugfs_dir = debugfs_create_dir("dma_heap", NULL);
>> +}
>> +
>> +static void dma_heap_exit_debugfs(void)
>> +{
>> +	debugfs_remove_recursive(dma_heap_debugfs_dir);
>> +}
>> +#else
>> +static void dma_heap_init_debugfs(void)
>> +{
>> +}
>> +
>> +static void dma_heap_exit_debugfs(void)
>> +{
>> +}
>> +#endif
>> +
>>  /**
>>   * dma_heap_add - adds a heap to dmabuf heaps
>>   * @exp_info: information needed to register this heap
>> @@ -299,6 +334,13 @@ struct dma_heap *dma_heap_add(const struct dma_heap_export_info *exp_info)
>>  
>>  	/* Add heap to the list */
>>  	list_add(&heap->list, &heap_list);
>> +
>> +#ifdef CONFIG_DEBUG_FS
>> +	if (heap->ops && heap->ops->show)
>> +		debugfs_create_file(heap->name, 0444, dma_heap_debugfs_dir,
>> +				    heap, &dma_heap_debug_fops);
>> +#endif
>> +
>>  	mutex_unlock(&heap_list_lock);
>>  
>>  	return heap;
>> @@ -335,6 +377,16 @@ static int dma_heap_init(void)
>>  	}
>>  	dma_heap_class->devnode = dma_heap_devnode;
>>  
>> +	dma_heap_init_debugfs();
>> +
>>  	return 0;
>>  }
>>  subsys_initcall(dma_heap_init);
>> +
>> +static void __exit dma_heap_exit(void)
>> +{
>> +	dma_heap_exit_debugfs();
>> +	class_destroy(dma_heap_class);
>> +	unregister_chrdev_region(dma_heap_devt, NUM_HEAP_MINORS);
>> +}
>> +__exitcall(dma_heap_exit);
>> diff --git a/include/linux/dma-heap.h b/include/linux/dma-heap.h
>> index 648328a64b27..1c9bed1f4dde 100644
>> --- a/include/linux/dma-heap.h
>> +++ b/include/linux/dma-heap.h
>> @@ -12,6 +12,7 @@
>>  #include <linux/types.h>
>>  
>>  struct dma_heap;
>> +struct seq_file;
>>  
>>  /**
>>   * struct dma_heap_ops - ops to operate on a given heap
>> @@ -24,6 +25,7 @@ struct dma_heap_ops {
>>  				    unsigned long len,
>>  				    u32 fd_flags,
>>  				    u64 heap_flags);
>> +	int (*show)(struct seq_file *s, struct dma_heap *heap);
> 
> I found it good coding practice for objects ops pointer tables to have the object the function works with as first parameter.
> 
> Absolutely not a must have, but just looks a little bit more consistent.
> 
> Regards,
> Christian.
> 
>>  };
>>  
>>  /**
>>
> 

