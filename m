From: =?ISO-8859-1?Q?Terje_Bergstr=F6m?= <tbergstrom@nvidia.com>
Subject: Re: [PATCH] gpu: host1x: do not check previously handled gathers
Date: Thu, 30 Jan 2014 15:51:48 +0200
Message-ID: <52EA58F4.8070601@nvidia.com>
References: <1389124986-32501-1-git-send-email-kusmabite@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1389124986-32501-1-git-send-email-kusmabite@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Erik Faye-Lund <kusmabite@gmail.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Cc: "thierry.reding@gmail.com" <thierry.reding@gmail.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On 07.01.2014 22:03, Erik Faye-Lund wrote:
> When patching gathers, we don't need to check against
> gathers with lower indices than the current one, as
> they are guaranteed to already have been handled.
> 
> Signed-off-by: Erik Faye-Lund <kusmabite@gmail.com>
> ---
> 
> Here's a trivial optimization I have been running with for a while.
> 
>  drivers/gpu/host1x/job.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/host1x/job.c b/drivers/gpu/host1x/job.c
> index de5ec33..e965805 100644
> --- a/drivers/gpu/host1x/job.c
> +++ b/drivers/gpu/host1x/job.c
> @@ -534,7 +534,7 @@ int host1x_job_pin(struct host1x_job *job, struct device *dev)
>  
>  		g->base = job->gather_addr_phys[i];
>  
> -		for (j = 0; j < job->num_gathers; j++)
> +		for (j = i + 1; j < job->num_gathers; j++)
>  			if (job->gathers[j].bo == g->bo)
>  				job->gathers[j].handled = true;
>  

Hi,

Thanks. This looks good logically, and I ran some tests that agree.

Acked-By: Terje Bergstrom <tbergstrom@nvidia.com>

Terje
