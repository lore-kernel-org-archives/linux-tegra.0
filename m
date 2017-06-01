From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 16/22] gpu: host1x: Forbid unrelated SETCLASS opcode in
 the firewall
Date: Thu, 1 Jun 2017 21:36:34 +0300
Message-ID: <ec7143a6-a4a5-61c6-d030-9f9b05f0bffa@gmail.com>
References: <cover.1495498184.git.digetx@gmail.com>
 <741d3bbfb74b5455e016164a3a30d9e3101bdc24.1495498184.git.digetx@gmail.com>
 <11a042e3-a220-556f-ecdb-a2d9f93910eb@kapsi.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <11a042e3-a220-556f-ecdb-a2d9f93910eb-/1wQRMveznE@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, DRI Development <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Erik Faye-Lund <kusmabite-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 01.06.2017 20:46, Mikko Perttunen wrote:
> With the simplification below and the is_addr_reg change mentioned,
> 
> Reviewed-by: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> On 05/23/2017 03:14 AM, Dmitry Osipenko wrote:
>> Several channels could be made to write the same unit concurrently via the
>> SETCLASS opcode, trusting userspace is a bad idea. It should be possible to
>> drop the per-client channel reservation and add a per-unit locking by
>> inserting MLOCK's to the command stream to re-allow the SETCLASS opcode, but
>> it will be much more work. Let's forbid the unit-unrelated class changes for
>> now.
>>
>> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> ---
>>   drivers/gpu/drm/tegra/drm.c  |  1 +
>>   drivers/gpu/drm/tegra/drm.h  |  1 +
>>   drivers/gpu/drm/tegra/gr2d.c | 12 ++++++++++++
>>   drivers/gpu/host1x/job.c     | 24 ++++++++++++++++++++----
>>   include/linux/host1x.h       |  5 ++++-
>>   5 files changed, 38 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
>> index cdb05d6efde4..17416e1c219a 100644
>> --- a/drivers/gpu/drm/tegra/drm.c
>> +++ b/drivers/gpu/drm/tegra/drm.c
>> @@ -531,6 +531,7 @@ int tegra_drm_submit(struct tegra_drm_context *context,
>>       }
>>         job->is_addr_reg = context->client->ops->is_addr_reg;
>> +    job->is_valid_class = context->client->ops->is_valid_class;
>>       job->syncpt_incrs = syncpt.incrs;
>>       job->syncpt_id = syncpt.id;
>>       job->timeout = 10000;
>> diff --git a/drivers/gpu/drm/tegra/drm.h b/drivers/gpu/drm/tegra/drm.h
>> index 85aa2e3d9d4e..6d6da01282f3 100644
>> --- a/drivers/gpu/drm/tegra/drm.h
>> +++ b/drivers/gpu/drm/tegra/drm.h
>> @@ -83,6 +83,7 @@ struct tegra_drm_client_ops {
>>                   struct tegra_drm_context *context);
>>       void (*close_channel)(struct tegra_drm_context *context);
>>       int (*is_addr_reg)(struct device *dev, u32 class, u32 offset);
>> +    int (*is_valid_class)(u32 class);
>>       int (*submit)(struct tegra_drm_context *context,
>>                 struct drm_tegra_submit *args, struct drm_device *drm,
>>                 struct drm_file *file);
>> diff --git a/drivers/gpu/drm/tegra/gr2d.c b/drivers/gpu/drm/tegra/gr2d.c
>> index 02cd3e37a6ec..782231c41a1a 100644
>> --- a/drivers/gpu/drm/tegra/gr2d.c
>> +++ b/drivers/gpu/drm/tegra/gr2d.c
>> @@ -109,10 +109,22 @@ static int gr2d_is_addr_reg(struct device *dev, u32
>> class, u32 offset)
>>       return 0;
>>   }
>>   +static int gr2d_is_valid_class(u32 class)
>> +{
>> +    switch (class) {
>> +    case HOST1X_CLASS_GR2D:
>> +    case HOST1X_CLASS_GR2D_SB:
>> +        return 1;
>> +    }
>> +
>> +    return 0;
>> +}
> 
> This could be just
> 
> return (class == HOST1X_CLASS_GR2D || class == HOST1X_CLASS_GR2D_SB);
> 

That's a matter of a taste as both variants result in a same assembly being
generated. I don't mind your variant ;)

>> +
>>   static const struct tegra_drm_client_ops gr2d_ops = {
>>       .open_channel = gr2d_open_channel,
>>       .close_channel = gr2d_close_channel,
>>       .is_addr_reg = gr2d_is_addr_reg,
>> +    .is_valid_class = gr2d_is_valid_class,
>>       .submit = tegra_drm_submit,
>>   };
>>   diff --git a/drivers/gpu/host1x/job.c b/drivers/gpu/host1x/job.c
>> index cf335c5979e2..65e12219405a 100644
>> --- a/drivers/gpu/host1x/job.c
>> +++ b/drivers/gpu/host1x/job.c
>> @@ -358,6 +358,9 @@ struct host1x_firewall {
>>     static int check_register(struct host1x_firewall *fw, unsigned long offset)
>>   {
>> +    if (!fw->job->is_addr_reg)
>> +        return 0;
>> +
>>       if (fw->job->is_addr_reg(fw->dev, fw->class, offset)) {
>>           if (!fw->num_relocs)
>>               return -EINVAL;
>> @@ -372,6 +375,19 @@ static int check_register(struct host1x_firewall *fw,
>> unsigned long offset)
>>       return 0;
>>   }
>>   +static int check_class(struct host1x_firewall *fw, u32 class)
>> +{
>> +    if (!fw->job->is_valid_class) {
>> +        if (fw->class != class)
>> +            return -EINVAL;
>> +    } else {
>> +        if (!fw->job->is_valid_class(fw->class))
>> +            return -EINVAL;
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>>   static int check_mask(struct host1x_firewall *fw)
>>   {
>>       u32 mask = fw->mask;
>> @@ -445,11 +461,9 @@ static int validate(struct host1x_firewall *fw, struct
>> host1x_job_gather *g)
>>   {
>>       u32 *cmdbuf_base = (u32 *)fw->job->gather_copy_mapped +
>>           (g->offset / sizeof(u32));
>> +    u32 job_class = fw->class;
>>       int err = 0;
>>   -    if (!fw->job->is_addr_reg)
>> -        return 0;
>> -
>>       fw->words = g->words;
>>       fw->cmdbuf = g->bo;
>>       fw->offset = 0;
>> @@ -469,7 +483,9 @@ static int validate(struct host1x_firewall *fw, struct
>> host1x_job_gather *g)
>>               fw->class = word >> 6 & 0x3ff;
>>               fw->mask = word & 0x3f;
>>               fw->reg = word >> 16 & 0xfff;
>> -            err = check_mask(fw);
>> +            err = check_class(fw, job_class);
>> +            if (!err)
>> +                err = check_mask(fw);
>>               if (err)
>>                   goto out;
>>               break;
>> diff --git a/include/linux/host1x.h b/include/linux/host1x.h
>> index aa323e43ae4e..561d6bb6580d 100644
>> --- a/include/linux/host1x.h
>> +++ b/include/linux/host1x.h
>> @@ -233,7 +233,10 @@ struct host1x_job {
>>       u8 *gather_copy_mapped;
>>         /* Check if register is marked as an address reg */
>> -    int (*is_addr_reg)(struct device *dev, u32 reg, u32 class);
>> +    int (*is_addr_reg)(struct device *dev, u32 class, u32 reg);
>> +
>> +    /* Check if class belongs to the unit */
>> +    int (*is_valid_class)(u32 class);
>>         /* Request a SETCLASS to this class */
>>       u32 class;
>>


-- 
Dmitry
