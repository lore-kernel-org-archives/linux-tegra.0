From: Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 08/12] drm: dsi: Add "enter idle" & "exit idle" dcs
 functions
Date: Wed, 1 Jul 2015 17:17:45 +0800
Message-ID: <5593B039.2090205@nvidia.com>
References: <1435738915-31973-1-git-send-email-markz@nvidia.com> <1435738915-31973-9-git-send-email-markz@nvidia.com> <5593AE18.2070306@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5593AE18.2070306-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Varka Bhadram <varkabhadram-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, daniel-/w4YWyX8dFk@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Oh, yes, if so we need to change most of the functions in drm_mipi_dsi.c.

Mark
On 07/01/2015 05:08 PM, Varka Bhadram wrote:
> On 07/01/2015 01:51 PM, Mark Zhang wrote:
>> Signed-off-by: Mark Zhang<markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> ---
>>   drivers/gpu/drm/drm_mipi_dsi.c |   36 ++++++++++++++++++++++++++++++++++++
>>   include/drm/drm_mipi_dsi.h     |    2 ++
>>   2 files changed, 38 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/drm_mipi_dsi.c b/drivers/gpu/drm/drm_mipi_dsi.c
>> index 2d5ca8eec13a..9bc6ff75eb8f 100644
>> --- a/drivers/gpu/drm/drm_mipi_dsi.c
>> +++ b/drivers/gpu/drm/drm_mipi_dsi.c
>> @@ -862,6 +862,42 @@ int mipi_dsi_dcs_set_pixel_format(struct mipi_dsi_device *dsi, u8 format)
>>   }
>>   EXPORT_SYMBOL(mipi_dsi_dcs_set_pixel_format);
>>   
>> +/**
>> + * mipi_dsi_dcs_enter_idle_mode()
>> + * @dsi: DSI peripheral device
>> + *
>> + * Return: 0 on success or a negative error code on failure.
>> + */
>> +int mipi_dsi_dcs_enter_idle_mode(struct mipi_dsi_device *dsi)
>> +{
>> +	ssize_t err;
>> +
>> +	err = mipi_dsi_dcs_write(dsi, MIPI_DCS_ENTER_IDLE_MODE, NULL, 0);
>> +	if (err < 0)
>> +		return err;
>> +
>> +	return 0;
>> +}
> 
> This we can do simply as:
> 	return mipi_dsi_dcs_write(dsi, MIPI_DCS_ENTER_IDLE_MODE, NULL, 0);
> 
>> +EXPORT_SYMBOL(mipi_dsi_dcs_enter_idle_mode);
>> +
>> +/**
>> + * mipi_dsi_dcs_exit_idle_mode()
>> + * @dsi: DSI peripheral device
>> + *
>> + * Return: 0 on success or a negative error code on failure.
>> + */
>> +int mipi_dsi_dcs_exit_idle_mode(struct mipi_dsi_device *dsi)
>> +{
>> +	ssize_t err;
>> +
>> +	err = mipi_dsi_dcs_write(dsi, MIPI_DCS_EXIT_IDLE_MODE, NULL, 0);
>> +	if (err < 0)
>> +		return err;
>> +
>> +	return 0;
> 
> For this one also: return mipi_dsi_dcs_write(dsi, MIPI_DCS_EXIT_IDLE_MODE, NULL, 0);
> 
> 
