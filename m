From: =?ISO-8859-15?Q?Terje_Bergstr=F6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCHv4 3/8] gpu: host1x: Add channel support
Date: Wed, 2 Jan 2013 11:31:00 +0200
Message-ID: <50E3FE54.6040304@nvidia.com>
References: <1356089964-5265-1-git-send-email-tbergstrom@nvidia.com>  <1356089964-5265-4-git-send-email-tbergstrom@nvidia.com> <1356149848.5896.124.camel@gandalf.local.home>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1356149848.5896.124.camel-f9ZlEuEWxVcJvu8Pb33WZ0EMvNT87kid@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Steven Rostedt <rostedt-nx8X9YLhiw1AfugRpC6u6w@public.gmane.org>
Cc: "thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org" <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, "airlied-cv59FeDIM0c@public.gmane.org" <airlied-cv59FeDIM0c@public.gmane.org>, "dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org" <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 22.12.2012 06:17, Steven Rostedt wrote:
> On Fri, 2012-12-21 at 13:39 +0200, Terje Bergstrom wrote:
>> +TRACE_EVENT(host1x_cdma_begin,
>> +	TP_PROTO(const char *name),
>> +
>> +	TP_ARGS(name),
>> +
>> +	TP_STRUCT__entry(
>> +		__field(const char *, name)
>> +	),
>> +
>> +	TP_fast_assign(
>> +		__entry->name = name;
>> +	),
>> +
>> +	TP_printk("name=%s",
>> +		__entry->name)
>> +);
>> +
>> +TRACE_EVENT(host1x_cdma_end,
>> +	TP_PROTO(const char *name),
>> +
>> +	TP_ARGS(name),
>> +
>> +	TP_STRUCT__entry(
>> +		__field(const char *, name)
>> +	),
>> +
>> +	TP_fast_assign(
>> +		__entry->name = name;
>> +	),
>> +
>> +	TP_printk("name=%s",
>> +		__entry->name)
>> +);
> 
> The above two should be combined into a DECLARE_EVENT_CLASS() and
> DEFINE_EVENT()s. Saves text and data space that way.

Will do.

(...)
> If you can combine any of these others into DECLARE_EVENT_CLASS() and
> DEFINE_EVENT()s, please do.

I didn't find others with same parameters.

Thanks!

Terje
