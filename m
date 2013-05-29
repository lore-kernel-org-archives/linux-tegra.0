From: Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCHv2 3/7] gpu: host1x: Don't reset firewall between gathers
Date: Wed, 29 May 2013 14:29:00 +0300
Message-ID: <51A5E67C.8020002@nvidia.com>
References: <1369823168-5396-1-git-send-email-amerilainen@nvidia.com> <1369823168-5396-4-git-send-email-amerilainen@nvidia.com> <20130529112127.GA8079@manwe>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130529112127.GA8079@manwe>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry-TKn1d31QZ+o@public.gmane.org>
Cc: "thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "airlied-cv59FeDIM0c@public.gmane.org" <airlied-cv59FeDIM0c@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Terje Bergstrom <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 05/29/2013 02:21 PM, Thierry Reding wrote:
> * PGP Signed by an unknown key
>
> * Arto Merilainen wrote:
> [...]
>> diff --git a/drivers/gpu/host1x/job.c b/drivers/gpu/host1x/job.c
> [...]
>> @@ -553,7 +549,6 @@ int host1x_job_pin(struct host1x_job *job, struct device *dev)
>>
>>   		if (!err)
>>   			err = do_waitchks(job, host, g->bo);
>> -
>>   		if (err)
>>   			break;
>>   	}
>
> This is another unnecessary whitespace change, but since it was the only
> issue I saw with the series I fixed it up myself while applying.
>

Thanks! I thought I got them all before posting but apparently not...

- Arto
