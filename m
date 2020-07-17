From: miaoqinglang <miaoqinglang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH -next] bcache: Convert to DEFINE_SHOW_ATTRIBUTE
Date: Fri, 17 Jul 2020 10:42:33 +0800
Message-ID: <a5d11115-9b58-5ad0-b8d2-6d40bb7258d4@huawei.com>
References: <20200716090313.13216-1-miaoqinglang@huawei.com>
 <a0f9b92b-d8f2-7c03-8c48-9e71e506361b@suse.de>
 <639a9561-2824-b668-42b3-b69f016f54e1@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <639a9561-2824-b668-42b3-b69f016f54e1-l3A5Bk7waGM@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Coly Li <colyli-l3A5Bk7waGM@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Kent Overstreet <kent.overstreet-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, liuyongqiang13-hv44wF8Li93QT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org



在 2020/7/17 10:22, Coly Li 写道:
> On 2020/7/16 17:54, Coly Li wrote:
>> On 2020/7/16 17:03, Qinglang Miao wrote:
>>> From: Yongqiang Liu <liuyongqiang13-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
>>>
>>
>> Hi Qianlang and Yongqiang,
>>
>>> Use DEFINE_SHOW_ATTRIBUTE macro to simplify the code.
>>>
>>> Signed-off-by: Yongqiang Liu <liuyongqiang13-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
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
> effect before taking this patch.I've noticed this diffrence and I'm testing bcache on a new qemu 
environment with this patch applied.
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
Yes you're right, this patch is based on linux-next with commit 
<4d4901c6d7>. Sorry I didn't mention it in commit log.
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
I will send a new patch based on 5.9 mainline after more detailed 
analysis and test.

Thanks.

Qinglang

.
