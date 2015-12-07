From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [cbootimage PATCH 2/3] Fix image update with image smaller than
 10KiB
Date: Mon, 7 Dec 2015 10:20:56 -0700
Message-ID: <5665BFF8.5030205@wwwdotorg.org>
References: <1446739402-14238-1-git-send-email-alban.bedel@avionic-design.de>
 <1446739402-14238-3-git-send-email-alban.bedel@avionic-design.de>
 <56436E95.8000305@wwwdotorg.org> <20151207125123.7c57b5c8@avionic-0020>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20151207125123.7c57b5c8@avionic-0020>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alban Bedel <alban.bedel-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 12/07/2015 04:51 AM, Alban Bedel wrote:
> On Wed, 11 Nov 2015 09:36:37 -0700
> Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote:
>
>> On 11/05/2015 09:03 AM, Alban Bedel wrote:
>>> The BCT size check assume a quiet large image, however if the image
>>> doesn't contains a bootloader it won't be that large. Change the size
>>> check to check for the smallest possible BCT size which is currently
>>
>>> diff --git a/src/cbootimage.h b/src/cbootimage.h
>>
>>> +#define NVBOOT_CONFIG_TABLE_SIZE_MIN 4080
>>
>> I think a comment is warranted here. This value needs to be (a) small
>> enough that it isn't larger than the total BCT size on any chip, and (b)
>> large enough that it includes the bct->boot_data_version field for all
>> chips. (Hopefully those two constraints can continue to be met with a
>> single value in the future...)
>
> I'll add this in the next patch.
>
>>> diff --git a/src/data_layout.c b/src/data_layout.c
>>
>>> @@ -1052,7 +1052,7 @@ int get_bct_size_from_image(build_image_context *context)
>>>    	if (!fp)
>>>    		return -ENODATA;
>>>
>>> -	if (fread(buffer, 1, NVBOOT_CONFIG_TABLE_SIZE_MAX, fp) != NVBOOT_CONFIG_TABLE_SIZE_MAX) {
>>> +	if (fread(buffer, 1, NVBOOT_CONFIG_TABLE_SIZE_MAX, fp) < NVBOOT_CONFIG_TABLE_SIZE_MIN) {
>>
>> Can you please also update the size of buffer[]:
>
> No, we still need to read up to NVBOOT_CONFIG_TABLE_SIZE_MAX if needed.

Why? This data that's read is solely used to determine the size of the 
BCT, and then thrown away. I don't believe any of the data between 
SIZE_MIN and SIZE_MAX should ever be used; observe the following at the 
end of the function:

         context->bct = buffer;
         if (data_is_valid_bct(context) && g_soc_config->get_bct_size)
                 bct_size = g_soc_config->get_bct_size();

         fclose(fp);
         context->bct = 0; <<<<<<<<
