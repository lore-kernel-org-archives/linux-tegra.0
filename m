From: =?ISO-8859-1?Q?Terje_Bergstr=F6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCHv5,RESEND 4/8] gpu: host1x: Add debug support
Date: Mon, 4 Feb 2013 20:41:25 -0800
Message-ID: <51108D75.9030302@nvidia.com>
References: <1358250244-9678-1-git-send-email-tbergstrom@nvidia.com> <1358250244-9678-5-git-send-email-tbergstrom@nvidia.com> <20130204110339.GA28134@avionic-0098.mockup.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130204110339.GA28134-RM9K5IK7kjIQXX3q8xo1gnVAuStQJXxyR5q1nwbD4aMs9pC9oP6+/A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "airlied-cv59FeDIM0c@public.gmane.org" <airlied-cv59FeDIM0c@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 04.02.2013 03:03, Thierry Reding wrote:
> * PGP Signed by an unknown key
> 
> On Tue, Jan 15, 2013 at 01:44:00PM +0200, Terje Bergstrom wrote:
>> diff --git a/drivers/gpu/host1x/debug.c b/drivers/gpu/host1x/debug.c
> [...]
>> +static pid_t host1x_debug_null_kickoff_pid;
>> +unsigned int host1x_debug_trace_cmdbuf;
>> +
>> +static pid_t host1x_debug_force_timeout_pid;
>> +static u32 host1x_debug_force_timeout_val;
>> +static u32 host1x_debug_force_timeout_channel;
> 
> Please group static and non-static variables.

Will do.

> 
>> diff --git a/drivers/gpu/host1x/debug.h b/drivers/gpu/host1x/debug.h
> [...]
>> +struct output {
>> +	void (*fn)(void *ctx, const char *str, size_t len);
>> +	void *ctx;
>> +	char buf[256];
>> +};
> 
> Do we really need this kind of abstraction? There really should be only
> one location where debug information is obtained, so I don't see a need
> for this.

This is used by debugfs code to direct to debugfs, and
nvhost_debug_dump() to send via printk.

> 
>> diff --git a/drivers/gpu/host1x/dev.h b/drivers/gpu/host1x/dev.h
> [...]
>>  struct host1x_syncpt_ops {
>>  	void (*reset)(struct host1x_syncpt *);
>>  	void (*reset_wait_base)(struct host1x_syncpt *);
>> @@ -117,6 +133,7 @@ struct host1x {
>>  	struct host1x_channel_ops channel_op;
>>  	struct host1x_cdma_ops cdma_op;
>>  	struct host1x_pushbuffer_ops cdma_pb_op;
>> +	struct host1x_debug_ops debug_op;
>>  	struct host1x_syncpt_ops syncpt_op;
>>  	struct host1x_intr_ops intr_op;
> 
> Again, better to pass in a const pointer to the ops structure.

Ok.

> 
>> diff --git a/drivers/gpu/host1x/hw/debug_hw.c b/drivers/gpu/host1x/hw/debug_hw.c
> 
>> +static int show_channel_command(struct output *o, u32 addr, u32 val, int *count)
>> +{
>> +	unsigned mask;
>> +	unsigned subop;
>> +
>> +	switch (val >> 28) {
>> +	case 0x0:
> 
> These can easily be derived by looking at the debug output, but it may
> still make sense to assign symbolic names to them.

I have another suggestion. In downstream I removed the decoding part and
I just print out a string of hex. That removes quite a bit bunch of code
from kernel. It makes the debug output also more compact.

It's much easier to write a user space program to decode than maintain
it in kernel.

> 
>> +static void show_channel_word(struct output *o, int *state, int *count,
>> +		u32 addr, u32 val, struct host1x_cdma *cdma)
>> +{
>> +	static int start_count, dont_print;
> 
> What if two processes read debug information at the same time?

show_channels() acquires cdma.lock, so that shouldn't happen.

> 
>> +static void do_show_channel_gather(struct output *o,
>> +		phys_addr_t phys_addr,
>> +		u32 words, struct host1x_cdma *cdma,
>> +		phys_addr_t pin_addr, u32 *map_addr)
>> +{
>> +	/* Map dmaget cursor to corresponding mem handle */
>> +	u32 offset;
>> +	int state, count, i;
>> +
>> +	offset = phys_addr - pin_addr;
>> +	/*
>> +	 * Sometimes we're given different hardware address to the same
>> +	 * page - in these cases the offset will get an invalid number and
>> +	 * we just have to bail out.
>> +	 */
> 
> Why's that?

Because of a race - memory might've been unpinned and unmapped from
IOMMU and when we re-map (pin), we are given a new address.

But, I think this comment is a bit stale - we used to dump also old
gathers. The latest code only dumps jobs in sync queue, so the race
shouldn't happen.

> 
>> +	map_addr = host1x_memmgr_mmap(mem);
>> +	if (!map_addr) {
>> +		host1x_debug_output(o, "[could not mmap]\n");
>> +		return;
>> +	}
>> +
>> +	/* Get base address from mem */
>> +	sgt = host1x_memmgr_pin(mem);
>> +	if (IS_ERR(sgt)) {
>> +		host1x_debug_output(o, "[couldn't pin]\n");
>> +		host1x_memmgr_munmap(mem, map_addr);
>> +		return;
>> +	}
> 
> Maybe you should stick with one of "could not" or "couldn't". Makes it
> easier to search for.

I prefer "could not", so I'll use that.

> 
>> +static void show_channel_gathers(struct output *o, struct host1x_cdma *cdma)
>> +{
>> +	struct host1x_job *job;
>> +
>> +	list_for_each_entry(job, &cdma->sync_queue, list) {
>> +		int i;
>> +		host1x_debug_output(o,
>> +				"\n%p: JOB, syncpt_id=%d, syncpt_val=%d,"
>> +				" first_get=%08x, timeout=%d"
>> +				" num_slots=%d, num_handles=%d\n",
>> +				job,
>> +				job->syncpt_id,
>> +				job->syncpt_end,
>> +				job->first_get,
>> +				job->timeout,
>> +				job->num_slots,
>> +				job->num_unpins);
> 
> This could go on fewer lines.

Yes, will merge.

> 
>> +static void host1x_debug_show_channel_cdma(struct host1x *m,
>> +	struct host1x_channel *ch, struct output *o, int chid)
>> +{
> [...]
>> +	switch (cbstat) {
>> +	case 0x00010008:
> 
> Again, symbolic names would be nice.

I propose I remove the decoding from kernel, and save 200 lines.

Terje
