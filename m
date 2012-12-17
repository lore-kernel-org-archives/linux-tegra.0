From: =?ISO-8859-1?Q?Terje_Bergstr=F6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCHv3 4/7] gpu: host1x: Add debug support
Date: Mon, 17 Dec 2012 16:01:09 +0200
Message-ID: <50CF25A5.2050803@nvidia.com>
References: <1355407484-28904-1-git-send-email-tbergstrom@nvidia.com>  <1355407484-28904-5-git-send-email-tbergstrom@nvidia.com> <1355412191.12036.2.camel@joe-AO722>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1355412191.12036.2.camel@joe-AO722>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>
Cc: "thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org" <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, "dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org" <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 13.12.2012 17:23, Joe Perches wrote:
> On Thu, 2012-12-13 at 16:04 +0200, Terje Bergstrom wrote:
>> Add support for host1x debugging. Adds debugfs entries, and dumps
>> channel state to UART in case of stuck job.
> 
> trivial note:
> 
> []
> 
>> diff --git a/drivers/gpu/host1x/debug.h b/drivers/gpu/host1x/debug.h
> []
>> +void host1x_debug_output(struct output *o, const char *fmt, ...);
> 
> This should be marked __printf(2, 3)
> so the compiler verifies format and argument types.

Thanks, I didn't know of this "trick". I'll apply it in the next version.

Considering the amount of feedback I've received from the patches, they
must be top notch quality!

Terje
