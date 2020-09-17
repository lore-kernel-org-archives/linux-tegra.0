Return-Path: <SRS0=Tnts=C2=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78E3EC43461
	for <linux-tegra@archiver.kernel.org>; Thu, 17 Sep 2020 12:21:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4EEAF2087D
	for <linux-tegra@archiver.kernel.org>; Thu, 17 Sep 2020 12:21:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726610AbgIQMVL (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 17 Sep 2020 08:21:11 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:39050 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726478AbgIQMVI (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 17 Sep 2020 08:21:08 -0400
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id F3CC630D8D0F54673ADE;
        Thu, 17 Sep 2020 20:21:05 +0800 (CST)
Received: from [10.174.179.91] (10.174.179.91) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.487.0; Thu, 17 Sep 2020 20:20:59 +0800
Subject: Re: [PATCH -next] bcache: Convert to DEFINE_SHOW_ATTRIBUTE
To:     Coly Li <colyli@suse.de>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kent Overstreet <kent.overstreet@gmail.com>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <liuyongqiang13@huawei.com>
References: <20200716090313.13216-1-miaoqinglang@huawei.com>
 <a0f9b92b-d8f2-7c03-8c48-9e71e506361b@suse.de>
 <639a9561-2824-b668-42b3-b69f016f54e1@suse.de>
From:   miaoqinglang <miaoqinglang@huawei.com>
Message-ID: <9a465086-fd4a-80ea-015d-cc812f2aa1c2@huawei.com>
Date:   Thu, 17 Sep 2020 20:20:58 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <639a9561-2824-b668-42b3-b69f016f54e1@suse.de>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.179.91]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org



在 2020/7/17 10:22, Coly Li 写道:
> On 2020/7/16 17:54, Coly Li wrote:
>> On 2020/7/16 17:03, Qinglang Miao wrote:
>>> From: Yongqiang Liu <liuyongqiang13@huawei.com>
>>>
>>
>> Hi Qianlang and Yongqiang,
>>
>>> Use DEFINE_SHOW_ATTRIBUTE macro to simplify the code.
>>>
>>> Signed-off-by: Yongqiang Liu <liuyongqiang13@huawei.com>
>>> ---
>>>   drivers/md/bcache/closure.c | 16 +++-------------
>>>   1 file changed, 3 insertions(+), 13 deletions(-)
>>>
>>> diff --git a/drivers/md/bcache/closure.c b/drivers/md/bcache/closure.c
>>> index 99222aa5d..37b9c5d49 100644
>>> --- a/drivers/md/bcache/closure.c
>>> +++ b/drivers/md/bcache/closure.c
>>> @@ -159,7 +159,7 @@ void closure_debug_destroy(struct closure *cl)
>>>   
>>>   static struct dentry *closure_debug;
>>>   
>>> -static int debug_seq_show(struct seq_file *f, void *data)
>>> +static int debug_show(struct seq_file *f, void *data)
>>>   {
>>>   	struct closure *cl;
>>>   
>>> @@ -188,17 +188,7 @@ static int debug_seq_show(struct seq_file *f, void *data)
>>>   	return 0;
>>>   }
>>>   
>>> -static int debug_seq_open(struct inode *inode, struct file *file)
>>> -{
>>> -	return single_open(file, debug_seq_show, NULL);
>>> -}
>>> -
>>
>> Here NULL is sent to single_open(), in DEFINE_SHOW_ATTRIBUTE()
>> inode->i_private is sent into single_open(). I don't see the commit log
>> mentions or estimates such change.
>>
> 
> Still this change modifies original code logic, I need to know the exact
> effect before taking this patch.
 >
It's equivalent to original code logic, because inode->iprivate equals 
to third parameter of debugfs_create_file() which is NULL.
> 
>>
>>> -static const struct file_operations debug_ops = {
>>> -	.owner		= THIS_MODULE,
>>> -	.open		= debug_seq_open,
>>> -	.read_iter		= seq_read_iter,
>>
>> I doubt this patch applies to Linux v5.8-rc, this is how debug_ops is
>> defined in Linux v5.8-rc5,
>>
> 
> I realize your patch is against linux-next, which is ahead of both
> linux-block and mainline tree. So this patch does not apply to
> linux-block tree, which is my upstream for bcache going to upstream.
> 
> I suggest to generate the patch against latest mainline kernel, or
> linux-block branch for next merge window (for 5.9 it is branch
> remotes/origin/for-5.9/drivers).
> 
I've sent a new patch against latest mainline kernel. Thanks.
> 
>> 196 static const struct file_operations debug_ops = {
>> 197         .owner          = THIS_MODULE,
>> 198         .open           = debug_seq_open,
>> 199         .read           = seq_read,
>> 200         .release        = single_release
>> 201 };
>>
>>> -	.release	= single_release
>>> -};
>>> +DEFINE_SHOW_ATTRIBUTE(debug);
>>>   
>>>   void  __init closure_debug_init(void)
>>>   {
>>> @@ -209,7 +199,7 @@ void  __init closure_debug_init(void)
>>>   		 * about this.
>>>   		 */
>>>   		closure_debug = debugfs_create_file(
>>> -			"closures", 0400, bcache_debug, NULL, &debug_ops);
>>> +				"closures", 0400, bcache_debug, NULL, &debug_fops);
>>>   }
>>>   #endif
>>
>> Do you test your change with upstream kernel ? Or at least you should
>> try to apply and compile the patch with latest upstream kernel.
> 
> I withdraw the above wrong word, the -next tag in patch subject was
> overlooked by me. Next time I will try to avoid such mistake.
> 
> Coly Li
> 
> 
> .
> 
