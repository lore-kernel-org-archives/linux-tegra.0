From: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCHv8 05/21] iommu/core: add ops->{bound,unbind}_driver()
Date: Mon, 16 Jun 2014 14:02:28 +0300
Message-ID: <878uox15iz.fsf@nvidia.com>
References: <1401448834-32659-1-git-send-email-hdoyu@nvidia.com> <1401448834-32659-6-git-send-email-hdoyu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1401448834-32659-6-git-send-email-hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> writes:

> ops->{bound,unbind}_driver() functions are called at
> BUS_NOTIFY_{BOUND,UNBIND}_DRIVER respectively.
>
> This is necessary to control the device population order. IOMMU master
> devices depend on an IOMMU device instanciation. IOMMU master devices
> can be registered to an IOMMU only after it's successfully
> populated. This IOMMU registration is done via
> ops->bound_driver(). Currently this population can be deferred if
> depending IOMMU device hasn't yet been populated in driver core. This
> cannot be done via ops->add_device() since after add_device() device's
> population/instanciation can be still deferred via probe().
>
> Signed-off-by: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/iommu/iommu.c | 13 +++++++++++--
>  include/linux/iommu.h |  4 ++++
>  2 files changed, 15 insertions(+), 2 deletions(-)

I have just noticed that we could make use of IOMMU group for this
purpose so that we could avoid this iommu core part modification but
just tegra-smmu part modification which would be easier to merge.

> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
> index e5555fcfe703..5469d361e7bc 100644
> --- a/drivers/iommu/iommu.c
> +++ b/drivers/iommu/iommu.c
> @@ -540,14 +540,23 @@ static int iommu_bus_notifier(struct notifier_block *nb,
>  	 * ADD/DEL call into iommu driver ops if provided, which may
>  	 * result in ADD/DEL notifiers to group->notifier
>  	 */
> -	if (action == BUS_NOTIFY_ADD_DEVICE) {
> +	switch (action) {
> +	case BUS_NOTIFY_ADD_DEVICE:
>  		if (ops->add_device)
>  			return ops->add_device(dev);
> -	} else if (action == BUS_NOTIFY_DEL_DEVICE) {
> +	case BUS_NOTIFY_DEL_DEVICE:
>  		if (ops->remove_device && dev->iommu_group) {
>  			ops->remove_device(dev);
>  			return 0;
>  		}
> +	case BUS_NOTIFY_BOUND_DRIVER:
> +		if (ops->bound_driver)
> +			ops->bound_driver(dev);
> +		break;
> +	case BUS_NOTIFY_UNBIND_DRIVER:
> +		if (ops->unbind_driver)
> +			ops->unbind_driver(dev);
> +		break;
>  	}
>  
>  	/*
> diff --git a/include/linux/iommu.h b/include/linux/iommu.h
> index b96a5b2136e4..141eea25bdea 100644
> --- a/include/linux/iommu.h
> +++ b/include/linux/iommu.h
> @@ -97,6 +97,8 @@ enum iommu_attr {
>   * @domain_has_cap: domain capabilities query
>   * @add_device: add device to iommu grouping
>   * @remove_device: remove device from iommu grouping
> + * @bound_driver: called at BUS_NOTIFY_BOUND_DRIVER
> + * @unbind_driver: called at BUS_NOTIFY_UNBIND_DRIVER
>   * @domain_get_attr: Query domain attributes
>   * @domain_set_attr: Change domain attributes
>   * @pgsize_bitmap: bitmap of supported page sizes
> @@ -115,6 +117,8 @@ struct iommu_ops {
>  			      unsigned long cap);
>  	int (*add_device)(struct device *dev);
>  	void (*remove_device)(struct device *dev);
> +	int (*bound_driver)(struct device *dev);
> +	void (*unbind_driver)(struct device *dev);
>  	int (*device_group)(struct device *dev, unsigned int *groupid);
>  	int (*domain_get_attr)(struct iommu_domain *domain,
>  			       enum iommu_attr attr, void *data);
> -- 
> 2.0.0.rc1.15.g7e76a2f
