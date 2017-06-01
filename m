From: Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org>
Subject: Re: [PATCH 15/22] gpu: host1x: Forbid RESTART opcode in the firewall
Date: Thu, 1 Jun 2017 20:41:09 +0300
Message-ID: <c71f665b-aac8-c298-7504-01ed5c08ab81@kapsi.fi>
References: <cover.1495498184.git.digetx@gmail.com>
 <b214fc1c2e3952511eb97a404795b786c08bdeed.1495498184.git.digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <b214fc1c2e3952511eb97a404795b786c08bdeed.1495498184.git.digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, DRI Development <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Erik Faye-Lund <kusmabite-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Reviewed-by: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

On 05/23/2017 03:14 AM, Dmitry Osipenko wrote:
> The RESTART opcode terminates the gather and restarts the CDMA fetching from
> a specified word << 2 relative to the CDMA start address. That shouldn't be
> allowed to be done by userspace.
> 
> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Reviewed-by: Erik Faye-Lund <kusmabite-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>   drivers/gpu/host1x/job.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/host1x/job.c b/drivers/gpu/host1x/job.c
> index 1a1568e64ba8..cf335c5979e2 100644
> --- a/drivers/gpu/host1x/job.c
> +++ b/drivers/gpu/host1x/job.c
> @@ -497,7 +497,6 @@ static int validate(struct host1x_firewall *fw, struct host1x_job_gather *g)
>   				goto out;
>   			break;
>   		case 4:
> -		case 5:
>   		case 14:
>   			break;
>   		default:
> 
