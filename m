From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [cbootimage PATCH 2/3] Fix image update with image smaller than
 10KiB
Date: Wed, 11 Nov 2015 09:36:37 -0700
Message-ID: <56436E95.8000305@wwwdotorg.org>
References: <1446739402-14238-1-git-send-email-alban.bedel@avionic-design.de>
 <1446739402-14238-3-git-send-email-alban.bedel@avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1446739402-14238-3-git-send-email-alban.bedel-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alban Bedel <alban.bedel-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 11/05/2015 09:03 AM, Alban Bedel wrote:
> The BCT size check assume a quiet large image, however if the image
> doesn't contains a bootloader it won't be that large. Change the size
> check to check for the smallest possible BCT size which is currently

> diff --git a/src/cbootimage.h b/src/cbootimage.h

> +#define NVBOOT_CONFIG_TABLE_SIZE_MIN 4080

I think a comment is warranted here. This value needs to be (a) small 
enough that it isn't larger than the total BCT size on any chip, and (b) 
large enough that it includes the bct->boot_data_version field for all 
chips. (Hopefully those two constraints can continue to be met with a 
single value in the future...)

> diff --git a/src/data_layout.c b/src/data_layout.c

> @@ -1052,7 +1052,7 @@ int get_bct_size_from_image(build_image_context *context)
>   	if (!fp)
>   		return -ENODATA;
>
> -	if (fread(buffer, 1, NVBOOT_CONFIG_TABLE_SIZE_MAX, fp) != NVBOOT_CONFIG_TABLE_SIZE_MAX) {
> +	if (fread(buffer, 1, NVBOOT_CONFIG_TABLE_SIZE_MAX, fp) < NVBOOT_CONFIG_TABLE_SIZE_MIN) {

Can you please also update the size of buffer[]:

int get_bct_size_from_image(build_image_context *context)
{
         u_int8_t buffer[NVBOOT_CONFIG_TABLE_SIZE_MAX];

I wonder if it's worth updating all SoCs' versions of 
if_bct_is_tNNN_get_soc_config() so that they validate that the end 
offset of bct->boot_data_version is < NVBOOT_CONFIG_TABLE_SIZE_MIN, or 
perhaps that the offset is < context->bct_size, in which case 
get_bct_size_from_image() would need to be enhanced to set/clear that 
value when setting/clearing context->bct?
