From: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v6 1/2] remoteproc: qcom: Add per subsystem SSR
 notification
Date: Mon, 13 Jul 2020 12:09:11 -0700
Message-ID: <20200713190911.GC388985@builder.lan>
References: <1592965408-16908-1-git-send-email-rishabhb@codeaurora.org>
 <1592965408-16908-2-git-send-email-rishabhb@codeaurora.org>
 <98e3a18e-1491-6f20-6507-d6e6817b76fe@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <98e3a18e-1491-6f20-6507-d6e6817b76fe-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Rishabh Bhatnagar <rishabhb-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-remoteproc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, tsoni-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, psodagud-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, sidgup-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, elder-EkmVulN54Sk@public.gmane.org, linux-tegra <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Mon 13 Jul 09:26 PDT 2020, Jon Hunter wrote:

> 
> On 24/06/2020 03:23, Rishabh Bhatnagar wrote:
> > Currently there is a single notification chain which is called whenever any
> > remoteproc shuts down. This leads to all the listeners being notified, and
> > is not an optimal design as kernel drivers might only be interested in
> > listening to notifications from a particular remoteproc. Create a global
> > list of remoteproc notification info data structures. This will hold the
> > name and notifier_list information for a particular remoteproc. The API
> > to register for notifications will use name argument to retrieve the
> > notification info data structure and the notifier block will be added to
> > that data structure's notification chain. Also move from blocking notifier
> > to srcu notifer based implementation to support dynamic notifier head
> > creation.
> > 
> > Signed-off-by: Siddharth Gupta <sidgup-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> > Signed-off-by: Rishabh Bhatnagar <rishabhb-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> > ---
> >  drivers/remoteproc/qcom_common.c      | 90 ++++++++++++++++++++++++++++++-----
> >  drivers/remoteproc/qcom_common.h      |  5 +-
> >  include/linux/remoteproc/qcom_rproc.h | 20 ++++++--
> >  3 files changed, 95 insertions(+), 20 deletions(-)
> > 
> > diff --git a/drivers/remoteproc/qcom_common.c b/drivers/remoteproc/qcom_common.c
> > index 9028cea..7a7384c 100644
> > --- a/drivers/remoteproc/qcom_common.c
> > +++ b/drivers/remoteproc/qcom_common.c
> > @@ -12,6 +12,7 @@
> >  #include <linux/module.h>
> >  #include <linux/notifier.h>
> >  #include <linux/remoteproc.h>
> > +#include <linux/remoteproc/qcom_rproc.h>
> >  #include <linux/rpmsg/qcom_glink.h>
> >  #include <linux/rpmsg/qcom_smd.h>
> >  #include <linux/soc/qcom/mdt_loader.h>
> > @@ -23,7 +24,14 @@
> >  #define to_smd_subdev(d) container_of(d, struct qcom_rproc_subdev, subdev)
> >  #define to_ssr_subdev(d) container_of(d, struct qcom_rproc_ssr, subdev)
> >  
> > -static BLOCKING_NOTIFIER_HEAD(ssr_notifiers);
> > +struct qcom_ssr_subsystem {
> > +	const char *name;
> > +	struct srcu_notifier_head notifier_list;
> > +	struct list_head list;
> > +};
> > +
> > +static LIST_HEAD(qcom_ssr_subsystem_list);
> > +static DEFINE_MUTEX(qcom_ssr_subsys_lock);
> >  
> >  static int glink_subdev_start(struct rproc_subdev *subdev)
> >  {
> > @@ -189,37 +197,83 @@ void qcom_remove_smd_subdev(struct rproc *rproc, struct qcom_rproc_subdev *smd)
> >  }
> >  EXPORT_SYMBOL_GPL(qcom_remove_smd_subdev);
> >  
> > +static struct qcom_ssr_subsystem *qcom_ssr_get_subsys(const char *name)
> > +{
> > +	struct qcom_ssr_subsystem *info;
> > +
> > +	mutex_lock(&qcom_ssr_subsys_lock);
> > +	/* Match in the global qcom_ssr_subsystem_list with name */
> > +	list_for_each_entry(info, &qcom_ssr_subsystem_list, list)
> > +		if (!strcmp(info->name, name))
> > +			goto out;
> > +
> > +	info = kzalloc(sizeof(*info), GFP_KERNEL);
> > +	if (!info) {
> > +		info = ERR_PTR(-ENOMEM);
> > +		goto out;
> > +	}
> 
> 
> The above appears to be breaking the ARM64 build on the latest -next
> when building the modules  ...
>  
>   CC [M]  drivers/remoteproc/qcom_common.o
> drivers/remoteproc/qcom_common.c: In function 'qcom_ssr_get_subsys':
> remoteproc/qcom_common.c:210:9: error: implicit declaration of function 'kzalloc' [-Werror=implicit-function-declaration]
>   info = kzalloc(sizeof(*info), GFP_KERNEL);
>          ^~~~~~~
> drivers/remoteproc/qcom_common.c:210:7: warning: assignment makes pointer from integer without a cast [-Wint-conversion]
>   info = kzalloc(sizeof(*info), GFP_KERNEL);
> 

You're right, not sure why the test build completes successfully for
me...

I've applied a fix from Kefeng Wang for this, sorry for the disruption.

Regards,
Bjorn
