From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1 1/5] drm/tegra: dc: Balance IOMMU group refcounting
Date: Fri, 4 May 2018 14:28:52 +0300
Message-ID: <940fd992-b40c-a6f7-d527-7e0e356eeb44@gmail.com>
References: <20180503234723.4368-1-digetx@gmail.com>
 <20180503234723.4368-2-digetx@gmail.com> <20180504104515.GM13459@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180504104515.GM13459@ulmo>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 04.05.2018 13:45, Thierry Reding wrote:
> On Fri, May 04, 2018 at 02:47:19AM +0300, Dmitry Osipenko wrote:
>> Remove unneeded iommu_group_get() and add missing iommu_group_put(),
>> correcting IOMMU group refcount. This is a minor correction / cleanup that
>> doesn't really fix anything because Tegra's IOMMU driver are built-in and
>> hence groups refcounting can't hold IOMMU driver from unloading.
>>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> ---
>>  drivers/gpu/drm/tegra/dc.c  | 35 +++++++++++++++++------------------
>>  drivers/gpu/drm/tegra/dc.h  |  2 +-
>>  drivers/gpu/drm/tegra/drm.h |  2 +-
>>  3 files changed, 19 insertions(+), 20 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
>> index d7a0f62c6e2e..9fc34c6a7218 100644
>> --- a/drivers/gpu/drm/tegra/dc.c
>> +++ b/drivers/gpu/drm/tegra/dc.c
>> @@ -1927,7 +1927,6 @@ static irqreturn_t tegra_dc_irq(int irq, void *data)
>>  static int tegra_dc_init(struct host1x_client *client)
>>  {
>>  	struct drm_device *drm = dev_get_drvdata(client->parent);
>> -	struct iommu_group *group = iommu_group_get(client->dev);
>>  	unsigned long flags = HOST1X_SYNCPT_CLIENT_MANAGED;
>>  	struct tegra_dc *dc = host1x_client_to_dc(client);
>>  	struct tegra_drm *tegra = drm->dev_private;
>> @@ -1939,20 +1938,21 @@ static int tegra_dc_init(struct host1x_client *client)
>>  	if (!dc->syncpt)
>>  		dev_warn(dc->dev, "failed to allocate syncpoint\n");
>>  
>> -	if (group && tegra->domain) {
>> -		if (group != tegra->group) {
>> -			err = iommu_attach_group(tegra->domain, group);
>> +	if (tegra->domain) {
>> +		dc->group = iommu_group_get(client->dev);
>> +
>> +		if (dc->group && dc->group != tegra->dc_group) {
>> +			err = iommu_attach_group(tegra->domain, dc->group);
>>  			if (err < 0) {
>>  				dev_err(dc->dev,
>>  					"failed to attach to domain: %d\n",
>>  					err);
>> +				iommu_group_put(dc->group);
>>  				return err;
>>  			}
>>  
>> -			tegra->group = group;
>> +			tegra->dc_group = dc->group;
>>  		}
>> -
>> -		dc->domain = tegra->domain;
>>  	}
>>  
>>  	if (dc->soc->wgrps)
>> @@ -2017,13 +2017,13 @@ static int tegra_dc_init(struct host1x_client *client)
>>  	if (!IS_ERR(primary))
>>  		drm_plane_cleanup(primary);
>>  
>> -	if (group && dc->domain) {
>> -		if (group == tegra->group) {
>> -			iommu_detach_group(dc->domain, group);
>> -			tegra->group = NULL;
>> +	if (dc->group) {
>> +		if (dc->group && dc->group == tegra->dc_group) {
> 
> You can drop the dc->group check from the second conditional.

Indeed.

>> +			iommu_detach_group(tegra->domain, dc->group);
>> +			tegra->dc_group = NULL;
>>  		}
>>  
>> -		dc->domain = NULL;
>> +		iommu_group_put(dc->group);
>>  	}
>>  
>>  	return err;
>> @@ -2032,7 +2032,6 @@ static int tegra_dc_init(struct host1x_client *client)
>>  static int tegra_dc_exit(struct host1x_client *client)
>>  {
>>  	struct drm_device *drm = dev_get_drvdata(client->parent);
>> -	struct iommu_group *group = iommu_group_get(client->dev);
>>  	struct tegra_dc *dc = host1x_client_to_dc(client);
>>  	struct tegra_drm *tegra = drm->dev_private;
>>  	int err;
>> @@ -2045,13 +2044,13 @@ static int tegra_dc_exit(struct host1x_client *client)
>>  		return err;
>>  	}
>>  
>> -	if (group && dc->domain) {
>> -		if (group == tegra->group) {
>> -			iommu_detach_group(dc->domain, group);
>> -			tegra->group = NULL;
>> +	if (dc->group) {
>> +		if (dc->group && dc->group == tegra->dc_group) {
>> +			iommu_detach_group(tegra->domain, dc->group);
>> +			tegra->dc_group = NULL;
>>  		}
>>  
>> -		dc->domain = NULL;
>> +		iommu_group_put(dc->group);
>>  	}
>>  
>>  	host1x_syncpt_free(dc->syncpt);
>> diff --git a/drivers/gpu/drm/tegra/dc.h b/drivers/gpu/drm/tegra/dc.h
>> index ca5cac6bf8ea..5ca4e07333bb 100644
>> --- a/drivers/gpu/drm/tegra/dc.h
>> +++ b/drivers/gpu/drm/tegra/dc.h
>> @@ -94,7 +94,7 @@ struct tegra_dc {
>>  
>>  	const struct tegra_dc_soc_info *soc;
>>  
>> -	struct iommu_domain *domain;
>> +	struct iommu_group *group;
>>  };
>>  
>>  static inline struct tegra_dc *
>> diff --git a/drivers/gpu/drm/tegra/drm.h b/drivers/gpu/drm/tegra/drm.h
>> index 4f41aaec8530..7777640a6911 100644
>> --- a/drivers/gpu/drm/tegra/drm.h
>> +++ b/drivers/gpu/drm/tegra/drm.h
>> @@ -46,7 +46,7 @@ struct tegra_drm {
>>  	struct drm_device *drm;
>>  
>>  	struct iommu_domain *domain;
>> -	struct iommu_group *group;
>> +	struct iommu_group *dc_group;
> 
> It's not obvious to me why this needs to be renamed.

tegra->group is only used by the dc.c and seems its sole purpose is to avoid
re-attaching DC group if DC0 and DC1 share the same group, like DC's on newer
Tegra's do. I think it's better to rename 'group' to 'dc_group' for the clarity.
