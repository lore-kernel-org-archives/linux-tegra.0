From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCHv3 4/4] gpu: host1x: Add runtime pm support for host1x
Date: Tue, 01 Oct 2013 12:17:14 -0600
Message-ID: <524B11AA.30400@wwwdotorg.org>
References: <1380024325-18280-1-git-send-email-amerilainen@nvidia.com> <1380024325-18280-5-git-send-email-amerilainen@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1380024325-18280-5-git-send-email-amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mkulkarni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 09/24/2013 06:05 AM, Arto Merilainen wrote:
> From: Mayuresh Kulkarni <mkulkarni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> This patch adds runtime pm support for host1x hardware unit. This
> allows host1x clock to be turned off when it is idle. If pm runtime
> is not configured, we enable host1x clock in device probe and disable
> it in remove.

> diff --git a/drivers/gpu/host1x/dev.c b/drivers/gpu/host1x/dev.c

> +static int host1x_runtime_suspend(struct device *dev);
> +static int host1x_runtime_resume(struct device *dev);

You could avoid having these prototypes by simply putting the function
bodies earlier on in the file, somewhere before they're used. I don't
care much either way, but I've certainly seen some people care about
this and ask for them to be moved.
