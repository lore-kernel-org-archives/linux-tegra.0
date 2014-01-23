From: Erik Faye-Lund <kusmabite@gmail.com>
Subject: Re: [PATCH] gpu: host1x: do not check previously handled gathers
Date: Thu, 23 Jan 2014 18:31:22 +0100
Message-ID: <CABPQNSarSsWTuYTP0pmBQUiMPcbLG-iPHR-3rS60qSGSVKO0qw@mail.gmail.com>
References: <1389124986-32501-1-git-send-email-kusmabite@gmail.com>
Reply-To: kusmabite@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1389124986-32501-1-git-send-email-kusmabite@gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
To: linux-tegra@vger.kernel.org
Cc: tbergstrom@nvidia.com, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
List-Id: linux-tegra@vger.kernel.org

Ping?

On Tue, Jan 7, 2014 at 9:03 PM, Erik Faye-Lund <kusmabite@gmail.com> wrote:
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
>                 g->base = job->gather_addr_phys[i];
>
> -               for (j = 0; j < job->num_gathers; j++)
> +               for (j = i + 1; j < job->num_gathers; j++)
>                         if (job->gathers[j].bo == g->bo)
>                                 job->gathers[j].handled = true;
>
> --
> 1.8.1.2
>
