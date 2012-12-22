From: Steven Rostedt <rostedt-nx8X9YLhiw1AfugRpC6u6w@public.gmane.org>
Subject: Re: [PATCHv4 3/8] gpu: host1x: Add channel support
Date: Fri, 21 Dec 2012 23:17:28 -0500
Message-ID: <1356149848.5896.124.camel@gandalf.local.home>
References: <1356089964-5265-1-git-send-email-tbergstrom@nvidia.com>
	 <1356089964-5265-4-git-send-email-tbergstrom@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1356089964-5265-4-git-send-email-tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Terje Bergstrom <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Fri, 2012-12-21 at 13:39 +0200, Terje Bergstrom wrote:

> diff --git a/include/trace/events/host1x.h b/include/trace/events/host1x.h
> index d98d74c..e087910 100644
> --- a/include/trace/events/host1x.h
> +++ b/include/trace/events/host1x.h
> @@ -37,6 +37,214 @@ DECLARE_EVENT_CLASS(host1x,
>  	TP_printk("name=%s", __entry->name)
>  );
>  
> +DEFINE_EVENT(host1x, host1x_channel_open,
> +	TP_PROTO(const char *name),
> +	TP_ARGS(name)
> +);
> +
> +DEFINE_EVENT(host1x, host1x_channel_release,
> +	TP_PROTO(const char *name),
> +	TP_ARGS(name)
> +);
> +
> +TRACE_EVENT(host1x_cdma_begin,
> +	TP_PROTO(const char *name),
> +
> +	TP_ARGS(name),
> +
> +	TP_STRUCT__entry(
> +		__field(const char *, name)
> +	),
> +
> +	TP_fast_assign(
> +		__entry->name = name;
> +	),
> +
> +	TP_printk("name=%s",
> +		__entry->name)
> +);
> +
> +TRACE_EVENT(host1x_cdma_end,
> +	TP_PROTO(const char *name),
> +
> +	TP_ARGS(name),
> +
> +	TP_STRUCT__entry(
> +		__field(const char *, name)
> +	),
> +
> +	TP_fast_assign(
> +		__entry->name = name;
> +	),
> +
> +	TP_printk("name=%s",
> +		__entry->name)
> +);

The above two should be combined into a DECLARE_EVENT_CLASS() and
DEFINE_EVENT()s. Saves text and data space that way.

> +
> +TRACE_EVENT(host1x_cdma_flush,
> +	TP_PROTO(const char *name, int timeout),
> +
> +	TP_ARGS(name, timeout),
> +
> +	TP_STRUCT__entry(
> +		__field(const char *, name)
> +		__field(int, timeout)
> +	),
> +
> +	TP_fast_assign(
> +		__entry->name = name;
> +		__entry->timeout = timeout;
> +	),
> +
> +	TP_printk("name=%s, timeout=%d",
> +		__entry->name, __entry->timeout)
> +);
> +
> +TRACE_EVENT(host1x_cdma_push,
> +	TP_PROTO(const char *name, u32 op1, u32 op2),
> +
> +	TP_ARGS(name, op1, op2),
> +
> +	TP_STRUCT__entry(
> +		__field(const char *, name)
> +		__field(u32, op1)
> +		__field(u32, op2)
> +	),
> +
> +	TP_fast_assign(
> +		__entry->name = name;
> +		__entry->op1 = op1;
> +		__entry->op2 = op2;
> +	),
> +
> +	TP_printk("name=%s, op1=%08x, op2=%08x",
> +		__entry->name, __entry->op1, __entry->op2)
> +);
> +
> +TRACE_EVENT(host1x_cdma_push_gather,
> +	TP_PROTO(const char *name, u32 mem_id,
> +			u32 words, u32 offset, void *cmdbuf),
> +
> +	TP_ARGS(name, mem_id, words, offset, cmdbuf),
> +
> +	TP_STRUCT__entry(
> +		__field(const char *, name)
> +		__field(u32, mem_id)
> +		__field(u32, words)
> +		__field(u32, offset)
> +		__field(bool, cmdbuf)
> +		__dynamic_array(u32, cmdbuf, words)
> +	),
> +
> +	TP_fast_assign(
> +		if (cmdbuf) {
> +			memcpy(__get_dynamic_array(cmdbuf), cmdbuf+offset,
> +					words * sizeof(u32));
> +		}
> +		__entry->cmdbuf = cmdbuf;
> +		__entry->name = name;
> +		__entry->mem_id = mem_id;
> +		__entry->words = words;
> +		__entry->offset = offset;
> +	),
> +
> +	TP_printk("name=%s, mem_id=%08x, words=%u, offset=%d, contents=[%s]",
> +	  __entry->name, __entry->mem_id,
> +	  __entry->words, __entry->offset,
> +	  __print_hex(__get_dynamic_array(cmdbuf),
> +		  __entry->cmdbuf ? __entry->words * 4 : 0))
> +);
> +
> +TRACE_EVENT(host1x_channel_submit,
> +	TP_PROTO(const char *name, u32 cmdbufs, u32 relocs, u32 waitchks,
> +			u32 syncpt_id, u32 syncpt_incrs),
> +
> +	TP_ARGS(name, cmdbufs, relocs, waitchks, syncpt_id, syncpt_incrs),
> +
> +	TP_STRUCT__entry(
> +		__field(const char *, name)
> +		__field(u32, cmdbufs)
> +		__field(u32, relocs)
> +		__field(u32, waitchks)
> +		__field(u32, syncpt_id)
> +		__field(u32, syncpt_incrs)
> +	),
> +
> +	TP_fast_assign(
> +		__entry->name = name;
> +		__entry->cmdbufs = cmdbufs;
> +		__entry->relocs = relocs;
> +		__entry->waitchks = waitchks;
> +		__entry->syncpt_id = syncpt_id;
> +		__entry->syncpt_incrs = syncpt_incrs;
> +	),
> +
> +	TP_printk("name=%s, cmdbufs=%u, relocs=%u, waitchks=%d,"
> +		"syncpt_id=%u, syncpt_incrs=%u",
> +	  __entry->name, __entry->cmdbufs, __entry->relocs, __entry->waitchks,
> +	  __entry->syncpt_id, __entry->syncpt_incrs)
> +);
> +
> +TRACE_EVENT(host1x_channel_submitted,
> +	TP_PROTO(const char *name, u32 syncpt_base, u32 syncpt_max),
> +
> +	TP_ARGS(name, syncpt_base, syncpt_max),
> +
> +	TP_STRUCT__entry(
> +		__field(const char *, name)
> +		__field(u32, syncpt_base)
> +		__field(u32, syncpt_max)
> +	),
> +
> +	TP_fast_assign(
> +		__entry->name = name;
> +		__entry->syncpt_base = syncpt_base;
> +		__entry->syncpt_max = syncpt_max;
> +	),
> +
> +	TP_printk("name=%s, syncpt_base=%d, syncpt_max=%d",
> +		__entry->name, __entry->syncpt_base, __entry->syncpt_max)
> +);
> +
> +TRACE_EVENT(host1x_channel_submit_complete,
> +	TP_PROTO(const char *name, int count, u32 thresh),
> +
> +	TP_ARGS(name, count, thresh),
> +
> +	TP_STRUCT__entry(
> +		__field(const char *, name)
> +		__field(int, count)
> +		__field(u32, thresh)
> +	),
> +
> +	TP_fast_assign(
> +		__entry->name = name;
> +		__entry->count = count;
> +		__entry->thresh = thresh;
> +	),
> +
> +	TP_printk("name=%s, count=%d, thresh=%d",
> +		__entry->name, __entry->count, __entry->thresh)
> +);
> +
> +TRACE_EVENT(host1x_wait_cdma,
> +	TP_PROTO(const char *name, u32 eventid),
> +
> +	TP_ARGS(name, eventid),
> +
> +	TP_STRUCT__entry(
> +		__field(const char *, name)
> +		__field(u32, eventid)
> +	),
> +
> +	TP_fast_assign(
> +		__entry->name = name;
> +		__entry->eventid = eventid;
> +	),
> +
> +	TP_printk("name=%s, event=%d", __entry->name, __entry->eventid)
> +);
> +
>  TRACE_EVENT(host1x_syncpt_load_min,
>  	TP_PROTO(u32 id, u32 val),
>  
> @@ -55,6 +263,33 @@ TRACE_EVENT(host1x_syncpt_load_min,
>  	TP_printk("id=%d, val=%d", __entry->id, __entry->val)
>  );
>  
> +TRACE_EVENT(host1x_syncpt_wait_check,
> +	TP_PROTO(u32 mem_id, u32 offset, u32 syncpt_id, u32 thresh, u32 min),
> +
> +	TP_ARGS(mem_id, offset, syncpt_id, thresh, min),
> +
> +	TP_STRUCT__entry(
> +		__field(u32, mem_id)
> +		__field(u32, offset)
> +		__field(u32, syncpt_id)
> +		__field(u32, thresh)
> +		__field(u32, min)
> +	),
> +
> +	TP_fast_assign(
> +		__entry->mem_id = mem_id;
> +		__entry->offset = offset;
> +		__entry->syncpt_id = syncpt_id;
> +		__entry->thresh = thresh;
> +		__entry->min = min;
> +	),
> +
> +	TP_printk("mem_id=%08x, offset=%05x, id=%d, thresh=%d, current=%d",
> +		__entry->mem_id, __entry->offset,
> +		__entry->syncpt_id, __entry->thresh,
> +		__entry->min)
> +);

If you can combine any of these others into DECLARE_EVENT_CLASS() and
DEFINE_EVENT()s, please do.

Thanks,

-- Steve

> +
>  #endif /*  _TRACE_HOST1X_H */
>  
>  /* This part must be outside protection */
